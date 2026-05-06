package com.linguados.modulo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/modulos/novo")
public class ModuloServlet extends HttpServlet {

    private final ModuloDAO moduloDAO = new ModuloDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/WEB-INF/views/admin/modulo-form.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Modulo modulo = new Modulo();
        modulo.setTitulo(req.getParameter("titulo"));
        modulo.setDescricao(req.getParameter("descricao"));
        modulo.setOrdem(Integer.parseInt(req.getParameter("ordem")));
        modulo.setAtivo(true);

        try {
            moduloDAO.salvar(modulo);
            resp.sendRedirect(req.getContextPath() + "/admin/modulos/novo?ok=1");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}