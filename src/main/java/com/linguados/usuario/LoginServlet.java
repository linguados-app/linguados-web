package com.linguados.usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private LoginDAO loginDAO = new LoginDAO();

    /**
     * doGet: Apenas exibe a página de login
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/usuario/login.jsp").forward(request, response);
    }

    /**
     * doPost: Recebe os dados do formulário e processa o login
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String senha = request.getParameter("password");

        Usuario usuario = loginDAO.autenticar(email, senha);

        if (usuario != null) {
            // LOGIN SUCESSO: Cria a sessão
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogado", usuario);

            // Redireciona para a lista de desafios
            response.sendRedirect("desafios");
        } else {
            // LOGIN FALHOU: Volta para a página de login com erro na URL
            response.sendRedirect("login?erro=1");
        }
    }
}