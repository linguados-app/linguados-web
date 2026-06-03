package com.linguados.usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

    @WebServlet("/logout")
    public class LogoutServlet extends HttpServlet {

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            // 1. Pega a sessão atual (o 'false' garante que não criará uma nova se não existir)
            HttpSession session = request.getSession(false);

            if (session != null) {
                // 2. Destrói a sessão por completo, apagando o "usuarioLogado" da memória do servidor
                session.invalidate();
            }

            // 3. Redireciona o usuário limpo de volta para a página de login
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
