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
            List<Desafio> lista = desafioDAO.listarTodos();
            request.setAttribute("listaDesafios", lista);
            request.getRequestDispatcher("/WEB-INF/views/desafio/lista.jsp").forward(request, response);
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
                    response.sendRedirect(request.getContextPath() + "/desafios");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/desafios");
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

            // Lógica de Ganho de XP e Registro
            // Só salva e dá XP se o usuário ainda NÃO concluiu este desafio
            if (!progressoDAO.jaConcluiu(usuario.getId(), desafioId)) {

                boolean sucesso = progressoDAO.salvarProgresso(usuario.getId(), desafioId, desafio.getXpRecompensa());

                if (sucesso) {
                    // Atualiza o objeto da sessão com o novo XP e verifica Level Up
                    usuarioService.processarGanhoXp(usuario, desafio.getXpRecompensa());
                    session.setAttribute("usuarioLogado", usuario);
                }
            }

            response.sendRedirect(request.getContextPath() + "/desafios?feedback=acertou");
        } else {
            // Feedback de erro: volta para o mesmo desafio
            response.sendRedirect(request.getContextPath() + "/desafios?id=" + desafioId + "&feedback=errou");
        }
    }
}