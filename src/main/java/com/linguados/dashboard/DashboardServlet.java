package com.linguados.dashboard;

import com.linguados.usuario.Usuario;
import com.linguados.usuario.UsuarioService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Recupera a sessão e o usuario
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

        UsuarioService service = new UsuarioService();
        usuario = service.atualizarStreak(usuario);

        // 2. Se não estiver logado, volta para o login
        if (usuario == null) {
            response.sendRedirect("login");
            return;
        }

        // 4. EXIBIÇÃO: Encaminha para o JSP que criamos
        request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp").forward(request, response);
    }
}