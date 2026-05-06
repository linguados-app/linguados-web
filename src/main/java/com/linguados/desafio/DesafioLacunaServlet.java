package com.linguados.desafio;

import com.linguados.desafio.DesafioLacunaDAO;
import com.linguados.desafio.DesafioLacuna;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/desafio/lacuna")
public class DesafioLacunaServlet extends HttpServlet {
    private DesafioLacunaDAO dao = new DesafioLacunaDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        DesafioLacuna desafio = dao.buscarPorId(id);

        if (desafio != null) {
            req.setAttribute("desafio", desafio);
            req.getRequestDispatcher("/WEB-INF/views/desafios/lacuna.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/dashboard?erro=notfound");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String respostaUser = req.getParameter("resposta");

        DesafioLacuna desafio = dao.buscarPorId(id);

        if (desafio.verificarResposta(respostaUser)) {
            // Lógica de Sucesso (Ex: Adicionar XP ao usuário na sessão)
            resp.sendRedirect(req.getContextPath() + "/dashboard?sucesso=true&xp=" + desafio.getXpRecompensa());
        } else {
            resp.sendRedirect(req.getContextPath() + "/desafio/lacuna?id=" + id + "&erro=true");
        }
    }
}