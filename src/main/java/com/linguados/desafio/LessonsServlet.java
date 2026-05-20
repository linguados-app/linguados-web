package com.linguados.desafio;

import com.linguados.usuario.Usuario;
import com.linguados.usuario.UsuarioService;
import com.linguados.progresso.ProgressoDAO;
import com.linguados.modulo.Modulo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/lessons")
public class LessonsServlet extends HttpServlet {

    private DesafioDAO desafioDAO = new DesafioDAO();
    private ProgressoDAO progressoDAO = new ProgressoDAO();
    private UsuarioService usuarioService = new UsuarioService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        // 1. Proteção de Login: Qualquer usuário logado (Admin ou Estudante) pode passar por aqui
        if (usuarioLogado == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String idParam = request.getParameter("id");
        String moduloParam = request.getParameter("modulo");
        String actionParam = request.getParameter("action");

        // 2. GATILHO: Voltar/Sair da maratona voluntariamente
        if ("sair".equalsIgnoreCase(actionParam)) {
            session.removeAttribute("maratonaAtual");
            session.removeAttribute("vidasMaratona");
            response.sendRedirect(request.getContextPath() + "/lessons");
            return;
        }

        // 3. CENÁRIO A: Rota limpa "/lessons" -> Renderiza a listagem de módulos para ambos os perfis
        if (idParam == null && moduloParam == null) {
            FilaDesafios maratona = (FilaDesafios) session.getAttribute("maratonaAtual");

            // Se já tem uma maratona ativa, encaminha direto para a lição onde parou
            if (maratona != null && maratona.temProximo()) {
                response.sendRedirect(request.getContextPath() + "/lessons?id=" + maratona.espiarAtual().getId());
                return;
            }

            List<Modulo> listaModulos = desafioDAO.listarModulos();
            request.setAttribute("listaModulos", listaModulos);
            request.getRequestDispatcher("/WEB-INF/views/modulo/lista.jsp").forward(request, response);
            return;
        }

        // 4. CENÁRIO B: Inicialização da maratona (?modulo=ID)
        if (moduloParam != null) {
            try {
                int idModulo = Integer.parseInt(moduloParam);
                List<Desafio> listaDesafios = desafioDAO.listarPorModulo(idModulo);

                if (listaDesafios != null && !listaDesafios.isEmpty()) {
                    FilaDesafios maratona = new FilaDesafios(idModulo, listaDesafios);
                    session.setAttribute("maratonaAtual", maratona);
                    session.setAttribute("vidasMaratona", 3); // Define as 3 vidas iniciais

                    response.sendRedirect(request.getContextPath() + "/lessons?id=" + maratona.espiarAtual().getId());
                } else {
                    response.sendRedirect(request.getContextPath() + "/lessons?error=Modulo+vazio");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/lessons");
            }
            return;
        }

        // 5. CENÁRIO C: Execução e exibição de um desafio específico (?id=ID)
        FilaDesafios maratona = (FilaDesafios) session.getAttribute("maratonaAtual");
        Integer vidas = (Integer) session.getAttribute("vidasMaratona");
        Desafio desafio = null;

        if (maratona != null && maratona.temProximo()) {
            desafio = maratona.espiarAtual();
        } else {
            try {
                int id = Integer.parseInt(idParam);
                desafio = desafioDAO.buscarPorId(id);
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/lessons");
                return;
            }
        }

        if (desafio != null) {
            request.setAttribute("desafio", desafio);

            // Injeta variáveis de progresso e gamificação se estiver dentro de uma maratona
            if (maratona != null) {
                int respondidos = maratona.getTotalInicial() - maratona.getRestantes();
                int progressoPorcentagem = (int) (((double) respondidos / maratona.getTotalInicial()) * 100);

                request.setAttribute("progresso", progressoPorcentagem);
                request.setAttribute("restantes", maratona.getRestantes());
                request.setAttribute("total", maratona.getTotalInicial());
                request.setAttribute("vidas", vidas != null ? vidas : 3);
            } else {
                request.setAttribute("progresso", 0);
                request.setAttribute("vidas", 3);
            }

            String view;
            if (desafio instanceof DesafioLacuna) {
                view = "/WEB-INF/views/desafio/lacuna.jsp";
            } else if (desafio instanceof DesafioMultiplaEscolha) {
                view = "/WEB-INF/views/desafio/multipla_escolha.jsp";
            } else {
                view = "/WEB-INF/views/desafio/traducao.jsp";
            }
            request.getRequestDispatcher(view).forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/lessons");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        FilaDesafios maratona = (FilaDesafios) session.getAttribute("maratonaAtual");
        Integer vidas = (Integer) session.getAttribute("vidasMaratona");

        if (usuario == null || maratona == null || !maratona.temProximo()) {
            response.sendRedirect(request.getContextPath() + "/lessons");
            return;
        }

        int desafioId = Integer.parseInt(request.getParameter("desafioId"));
        String respostaUser = request.getParameter("resposta");

        Desafio desafio = maratona.espiarAtual();

        if (desafio != null && desafio.getId() == desafioId) {
            if (desafio.verificarResposta(respostaUser)) {
                // ACERTOU A QUESTÃO
                if (!progressoDAO.jaConcluiu(usuario.getId(), desafio.getId())) {
                    boolean sucesso = progressoDAO.salvarProgresso(usuario.getId(), desafio.getId(), desafio.getXpRecompensa());
                    if (sucesso) {
                        usuarioService.processarGanhoXp(usuario, desafio.getXpRecompensa());
                        session.setAttribute("usuarioLogado", usuario);
                    }
                }

                maratona.removerAtual(); // Avança o ponteiro da fila

                if (maratona.temProximo()) {
                    response.sendRedirect(request.getContextPath() + "/lessons?id=" + maratona.espiarAtual().getId());
                } else {
                    session.removeAttribute("maratonaAtual");
                    session.removeAttribute("vidasMaratona");
                    String mensagem = "🎉 Espetacular! Completaste todas as lições deste módulo!";
                    String msgCodificada = java.net.URLEncoder.encode(mensagem, java.nio.charset.StandardCharsets.UTF_8);
                    response.sendRedirect(request.getContextPath() + "/dashboard?mensagemConcluido=" + msgCodificada);
                }
            } else {
                // ERROU A QUESTÃO -> Penalização de Vidas
                int novasVidas = (vidas != null) ? vidas - 1 : 2;
                session.setAttribute("vidasMaratona", novasVidas);

                if (novasVidas <= 0) {
                    // GAME OVER total
                    session.removeAttribute("maratonaAtual");
                    session.removeAttribute("vidasMaratona");
                    String mensagem = "💔 As tuas vidas acabaram! Estuda mais um pouco e tenta a maratona novamente.";
                    String msgCodificada = java.net.URLEncoder.encode(mensagem, java.nio.charset.StandardCharsets.UTF_8);
                    response.sendRedirect(request.getContextPath() + "/dashboard?mensagemError=" + msgCodificada);
                } else {
                    response.sendRedirect(request.getContextPath() + "/lessons?id=" + desafioId + "&feedback=errou");
                }
            }
        }
    }
}