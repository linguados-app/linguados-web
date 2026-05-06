package com.linguados.modulo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/modulos")
public class ModuloListaServlet extends HttpServlet {

    private final ModuloDAO moduloDAO = new ModuloDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            req.setAttribute("modulos", moduloDAO.listar());

            req.getRequestDispatcher("/WEB-INF/views/admin/modulo-lista.jsp")
                    .forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}