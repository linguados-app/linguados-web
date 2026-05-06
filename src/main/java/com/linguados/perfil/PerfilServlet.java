package com.linguados.perfil;

import com.linguados.usuario.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/perfil")
public class PerfilServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

        // Segurança: Se não estiver logado, tchau!
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Encaminha para o JSP
        request.getRequestDispatcher("/WEB-INF/views/perfil/perfil.jsp").forward(request, response);
    }
}