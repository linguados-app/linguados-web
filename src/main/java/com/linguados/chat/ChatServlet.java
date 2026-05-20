package com.linguados.chat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/chat")
public class ChatServlet extends HttpServlet {
    private ChatDAO chatDAO = new ChatDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Carrega o histórico persistido do MySQL
        List<String[]> historico = chatDAO.buscarHistorico();
        request.setAttribute("historicoChat", historico);

        request.getRequestDispatcher("/WEB-INF/views/chat/chat.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Rota auxiliar caso queira salvar mensagens comuns via requisição POST HTTP tradicional
        HttpSession session = request.getSession();
        com.linguados.usuario.Usuario u = (com.linguados.usuario.Usuario) session.getAttribute("usuarioLogado");

        String texto = request.getParameter("texto");
        if (u != null && texto != null && !texto.trim().isEmpty()) {
            chatDAO.salvarMensagem(u.getId(), texto.trim());
        }
    }
}