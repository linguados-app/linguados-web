package controller;

import util.Conexao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/cadastro")
public class CadastroServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("cadastro.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String email = req.getParameter("email");
        String senha = req.getParameter("senha");

        resp.sendRedirect(req.getContextPath() + "/login");
    }
}
