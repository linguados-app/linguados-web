package com.linguados.modulo;

import com.linguados.desafio.Desafio;
import com.linguados.desafio.DesafioDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/modulo")
public class ModuloDesafiosServlet extends HttpServlet {

    private final DesafioDAO desafioDAO = new DesafioDAO();

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp
    ) throws ServletException, IOException {

        int idModulo =
                Integer.parseInt(
                        req.getParameter("id")
                );

        List<Desafio> desafios =
                desafioDAO.listarPorModulo(idModulo);

        req.setAttribute(
                "desafios",
                desafios
        );

        // ADICIONE ISTO
        req.setAttribute(
                "idModulo",
                idModulo
        );

        req.getRequestDispatcher(
                "/WEB-INF/views/desafio/lista.jsp"
        ).forward(req, resp);
    }
}