package com.linguados.dashboard;

import com.linguados.usuario.Usuario;
import com.linguados.usuario.UsuarioService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import com.linguados.progresso.ProgressoDAO;
import com.linguados.modulo.ModuloDAO;
import com.linguados.modulo.Modulo;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

        // 1. Segurança: Verifica se está logado antes de qualquer coisa
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 2. Atualiza dados de streak/XP
        UsuarioService service = new UsuarioService();
        usuario = service.atualizarStreak(usuario);
        session.setAttribute("usuarioLogado", usuario);

        ProgressoDAO progressoDAO = new ProgressoDAO();
        ModuloDAO moduloDAO = new ModuloDAO();

        // Dados do dashboard
        int licoesHoje = progressoDAO.getLicoesConcluidasHoje(usuario.getId());
        int[] atividadeSemana = progressoDAO.getAtividadeSemana(usuario.getId());

        // Buscar módulos com progresso do usuário
        List<Map<String, Object>> modulosProgresso = progressoDAO.getModulosComProgresso(usuario.getId());

        request.setAttribute("licoesHoje", licoesHoje);
        request.setAttribute("atividadeSemana", atividadeSemana);
        request.setAttribute("modulosProgresso", modulosProgresso);

        // 3. Renderiza a Dashboard
        request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp").forward(request, response);
    }
}