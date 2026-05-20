package com.linguados.desafio;

import com.linguados.usuario.Usuario;
import com.linguados.usuario.UsuarioService;
import com.linguados.progresso.ProgressoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/desafios")
public class DesafioServlet extends HttpServlet {

    private DesafioDAO desafioDAO = new DesafioDAO();
    private ProgressoDAO progressoDAO = new ProgressoDAO();
    private UsuarioService usuarioService = new UsuarioService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        if (usuarioLogado == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String idParam = request.getParameter("id");

        if (idParam == null) {
            String moduloParam = request.getParameter("modulo");

            if (moduloParam == null) {
                response.sendRedirect(request.getContextPath() + "/admin/modulos");
                return;
            }

            try {
                int idModulo = Integer.parseInt(moduloParam);
                List<Desafio> lista = desafioDAO.listarPorModulo(idModulo);

                request.setAttribute("listaDesafios", lista);
                request.getRequestDispatcher("/WEB-INF/views/desafio/lista.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/dashboard");
            }
        } else {
            try {
                int id = Integer.parseInt(idParam);
                Desafio desafio = desafioDAO.buscarPorId(id);

                if (desafio != null) {
                    request.setAttribute("desafio", desafio);
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
                    response.sendRedirect(request.getContextPath() + "/dashboard");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/dashboard");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int desafioId = Integer.parseInt(request.getParameter("desafioId"));
        String respostaUser = request.getParameter("resposta");

        Desafio desafio = desafioDAO.buscarPorId(desafioId);

        if (desafio != null && desafio.verificarResposta(respostaUser)) {

            if (!progressoDAO.jaConcluiu(usuario.getId(), desafioId)) {

                boolean sucesso = progressoDAO.salvarProgresso(usuario.getId(), desafioId, desafio.getXpRecompensa());

                if (sucesso) {
                    // processarGanhoXp gerencia o XP base, o Level Up e o gatilho da Badge
                    usuarioService.processarGanhoXp(usuario, desafio.getXpRecompensa());
                    session.setAttribute("usuarioLogado", usuario);
                }
            }

            String mensagem = "🎉 Incrível! Você concluiu o desafio '" + desafio.getTitulo() + "' e faturou +" + desafio.getXpRecompensa() + " XP!";
            String mensagemCodificada = java.net.URLEncoder.encode(mensagem, java.nio.charset.StandardCharsets.UTF_8);

            response.sendRedirect(request.getContextPath() + "/dashboard?mensagemConcluido=" + mensagemCodificada);
        } else {
            response.sendRedirect(request.getContextPath() + "/desafios?id=" + desafioId + "&feedback=errou");
        }
    }
}