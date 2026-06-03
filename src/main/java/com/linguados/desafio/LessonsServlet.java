package com.linguados.desafio;

import com.linguados.config.LocalAIService; // Importação para consumo do serviço de IA local
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

        // 1. Proteção de Início de Sessão (Login): Garante que apenas utilizadores autenticados acedem
        if (usuarioLogado == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String idParam = request.getParameter("id");
        String moduloParam = request.getParameter("modulo");
        String actionParam = request.getParameter("action");

        // 2. GATILHO: Sair da maratona voluntariamente
        if ("sair".equalsIgnoreCase(actionParam)) {
            session.removeAttribute("maratonaAtual");
            session.removeAttribute("vidasMaratona");
            session.removeAttribute("dicaTutorIA");
            response.sendRedirect(request.getContextPath() + "/lessons");
            return;
        }

        // 3. CENÁRIO A: Rota limpa "/lessons" -> Renderiza a listagem de módulos
        if (idParam == null && moduloParam == null) {
            FilaDesafios maratona = (FilaDesafios) session.getAttribute("maratonaAtual");

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
                    session.setAttribute("vidasMaratona", 3);

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

            // Repassa a dica gerada pelo serviço local para o request
            request.setAttribute("dicaIA", session.getAttribute("dicaTutorIA"));
            session.removeAttribute("dicaTutorIA");

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

            // 1. Validação primária local: Rápida e sem acionar a IA
            boolean estaCorreto = desafio.verificarResposta(respostaUser);

            // 2. Validação Semântica via IA: Apenas executa se o estudante errar o texto exato E NÃO for escolha múltipla
            if (!estaCorreto && !(desafio instanceof DesafioMultiplaEscolha)) {
                LocalAIService localAI = new LocalAIService();
                estaCorreto = localAI.validarRespostaSemantica(desafio.getEnunciado(), desafio.getRespostaCorreta(), respostaUser);
            }

            if (estaCorreto) {
                if (!progressoDAO.jaConcluiu(usuario.getId(), desafio.getId())) {
                    boolean sucesso = progressoDAO.salvarProgresso(usuario.getId(), desafio.getId(), desafio.getXpRecompensa());
                    if (sucesso) {
                        usuarioService.processarGanhoXp(usuario, desafio.getXpRecompensa());
                        session.setAttribute("usuarioLogado", usuario);
                    }
                }

                maratona.removerAtual(); // Avança o ponteiro da fila de lições

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
                // PENALIZAÇÃO DE VIDAS
                int novasVidas = (vidas != null) ? vidas - 1 : 2;
                session.setAttribute("vidasMaratona", novasVidas);

                if (novasVidas <= 0) {
                    session.removeAttribute("maratonaAtual");
                    session.removeAttribute("vidasMaratona");
                    session.removeAttribute("dicaTutorIA");
                    String mensagem = "💔 As tuas vidas acabaram! Estuda mais um pouco e tenta a maratona novamente.";
                    String msgCodificada = java.net.URLEncoder.encode(mensagem, java.nio.charset.StandardCharsets.UTF_8);
                    response.sendRedirect(request.getContextPath() + "/dashboard?mensagemError=" + msgCodificada);
                } else {
                    // Pede dica à IA apenas se não for escolha múltipla (onde a dica seria redundante)
                    if (!(desafio instanceof DesafioMultiplaEscolha)) {
                        LocalAIService localAI = new LocalAIService();
                        String dicaIA = localAI.pedirDica(desafio.getEnunciado(), respostaUser);
                        session.setAttribute("dicaTutorIA", dicaIA);
                    }

                    response.sendRedirect(request.getContextPath() + "/lessons?id=" + desafioId + "&feedback=errou");
                }
            }
        }
    }
}