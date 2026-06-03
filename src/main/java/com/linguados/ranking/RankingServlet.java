package com.linguados.ranking;

import com.linguados.usuario.Usuario;
import com.linguados.usuario.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ranking")
public class RankingServlet extends HttpServlet {
    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("usuarioLogado") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<Usuario> listaRanking = usuarioDAO.buscarRanking();
        request.setAttribute("listaRanking", listaRanking);

        request.getRequestDispatcher("/WEB-INF/views/ranking/ranking.jsp").forward(request, response);
    }
}