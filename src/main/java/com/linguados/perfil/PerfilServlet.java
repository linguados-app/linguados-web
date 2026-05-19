package com.linguados.perfil;

import com.linguados.usuario.Usuario;
import com.linguados.usuario.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/perfil")
public class PerfilServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/views/perfil/perfil.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 1. Pega o novo nome enviado pelo formulário HTML
        String novoNome = request.getParameter("nome");

        if (novoNome != null && !novoNome.trim().isEmpty()) {
            String nomeFormatado = novoNome.trim();

            // 2. Instancia a classe DAO e executa a persistência no banco de dados
            UsuarioDAO dao = new UsuarioDAO();
            boolean atualizouNoBanco = dao.atualizarNome(usuario.getId(), nomeFormatado);

            if (atualizouNoBanco) {
                // 3. Só altera o objeto em memória (Sessão) se salvou permanentemente no banco
                usuario.setNome(nomeFormatado);
                session.setAttribute("usuarioLogado", usuario);

                // Redireciona com parâmetro de sucesso
                response.sendRedirect(request.getContextPath() + "/perfil?mensagem=Nome+atualizado+com+sucesso!");
            } else {
                // Se falhar a query, avisa na barra de mensagens
                response.sendRedirect(request.getContextPath() + "/perfil?mensagem=Erro+ao+salvar+no+banco+de+dados!");
            }
        } else {
            // Se enviar um campo vazio, apenas recarrega o perfil
            response.sendRedirect(request.getContextPath() + "/perfil");
        }
    }
}