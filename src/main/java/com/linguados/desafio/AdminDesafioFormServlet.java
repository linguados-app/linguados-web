package com.linguados.desafio;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/desafio/form")
public class AdminDesafioFormServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp
    ) throws ServletException, IOException {

        String idModulo =
                req.getParameter("idModulo");

        req.setAttribute(
                "idModulo",
                idModulo
        );

        req.getRequestDispatcher(
                "/WEB-INF/views/admin/desafio-form.jsp"
        ).forward(req, resp);
    }
}