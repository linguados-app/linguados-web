package com.linguados.usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/cadastro")
public class CadastroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Encaminha para o JSP de cadastro
        req.getRequestDispatcher("/WEB-INF/views/usuario/cadastro.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String nome = req.getParameter("nome");
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");

        // 1. Criamos o objeto Usuario (Model)
        Usuario novoUsuario = new Usuario();
        novoUsuario.setNome(nome);
        novoUsuario.setEmail(email);
        novoUsuario.setSenha(senha);

        // 2. Pedimos ao DAO para salvar
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        boolean sucesso = usuarioDAO.cadastrar(novoUsuario);

        if (sucesso) {
            // Redireciona para o login com mensagem de sucesso
            resp.sendRedirect("login?sucesso=1");
        } else {
            // Se falhar (ex: e-mail já existe), volta para o cadastro com erro
            resp.sendRedirect("cadastro?erro=1");
        }
    }
}