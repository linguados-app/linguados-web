package com.linguados.sobreNos;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/sobre")
public class SobreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Altere o caminho abaixo para onde o seu sobre.jsp realmente está guardado
        request.getRequestDispatcher("/WEB-INF/views/sobreNos/sobreNos.jsp").forward(request, response);
    }
}