package com.linguados.dashboard;

import com.linguados.usuario.Usuario;
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

        // 1. SEGURANÇA: Recupera a sessão e o usuário
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

        // 2. REDIRECIONAMENTO: Se não estiver logado, volta para o login
        if (usuario == null) {
            response.sendRedirect("login");
            return;
        }

        // 3. LOGICA DE NEGÓCIO (Opcional):
        // Se você quiser buscar dados em tempo real (como o ranking atual),
        // você chamaria um DAO aqui e colocaria no request.
        // Exemplo: request.setAttribute("topUsuarios", rankingDAO.listarTop5());

        // 4. EXIBIÇÃO: Encaminha para o JSP que criamos
        request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp").forward(request, response);
    }
}