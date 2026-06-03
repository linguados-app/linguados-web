package com.linguados.desafio;

import com.linguados.usuario.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/desafios")
public class DesafioServlet extends HttpServlet {

    private DesafioDAO desafioDAO = new DesafioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        // Filtro de Segurança estrito para Admin
        if (usuarioLogado == null || !usuarioLogado.isAdmin()) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }

        String moduloParam = request.getParameter("modulo");
        if (moduloParam != null) {
            try {
                int idModulo = Integer.parseInt(moduloParam);
                List<Desafio> lista = desafioDAO.listarPorModulo(idModulo);
                request.setAttribute("listaDesafios", lista);
                request.getRequestDispatcher("/WEB-INF/views/desafio/lista.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/admin/modulos");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/modulos");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Mantém aqui apenas o método do Admin para salvar a criação de novos desafios
    }
}