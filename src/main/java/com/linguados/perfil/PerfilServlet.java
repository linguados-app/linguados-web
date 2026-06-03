package com.linguados.perfil;

import com.linguados.usuario.Usuario;
import com.linguados.usuario.UsuarioDAO;
import com.linguados.usuario.Conquista;
import com.linguados.usuario.ConquistaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/perfil")
public class PerfilServlet extends HttpServlet {

    private ConquistaDAO conquistaDAO = new ConquistaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Recupera a lista real de conquistas salvas no MySQL para este ID
        List<Conquista> listaConquistas = conquistaDAO.buscarConquistasPorUsuario(usuario.getId());
        request.setAttribute("conquistas", listaConquistas);

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

        String novoNome = request.getParameter("nome");

        if (novoNome != null && !novoNome.trim().isEmpty()) {
            String nomeFormatado = novoNome.trim();

            UsuarioDAO dao = new UsuarioDAO();
            boolean atualizouNoBanco = dao.atualizarNome(usuario.getId(), nomeFormatado);

            if (atualizouNoBanco) {
                usuario.setNome(nomeFormatado);
                session.setAttribute("usuarioLogado", usuario);

                response.sendRedirect(request.getContextPath() + "/perfil?mensagem=Nome+atualizado+com+sucesso!");
            } else {
                response.sendRedirect(request.getContextPath() + "/perfil?mensagem=Erro+ao+salvar+no+banco+de+dados!");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/perfil");
        }
    }
}