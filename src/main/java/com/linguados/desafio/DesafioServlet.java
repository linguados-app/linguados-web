package com.linguados.desafio;

import com.linguados.usuario.Usuario;
import com.linguados.progresso.ProgressoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/desafios")
public class DesafioServlet extends HttpServlet {

    private DesafioDAO desafioDAO = new DesafioDAO();
    private ProgressoDAO progressoDAO = new ProgressoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. VERIFICAÇÃO DE SESSÃO: Se não estiver logado, manda pro Login
        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        if (usuarioLogado == null) {
            response.sendRedirect("login");
            return;
        }

        String idParam = request.getParameter("id");
        if (idParam == null) {
            List<Desafio> lista = desafioDAO.listarTodos();
            request.setAttribute("listaDesafios", lista);
            request.getRequestDispatcher("/WEB-INF/views/desafio/lista.jsp").forward(request, response);
        } else {
            int id = Integer.parseInt(idParam);
            Desafio desafio = desafioDAO.buscarPorId(id);
            if (desafio != null) {
                request.setAttribute("desafio", desafio);
                request.getRequestDispatcher("/WEB-INF/views/desafio/resolver.jsp").forward(request, response);
            } else {
                response.sendRedirect("desafios");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. RECUPERA USUÁRIO DA SESSÃO
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

        if (usuario == null) {
            response.sendRedirect("login");
            return;
        }

        int desafioId = Integer.parseInt(request.getParameter("desafioId"));
        String respostaUser = request.getParameter("resposta");

        Desafio desafio = desafioDAO.buscarPorId(desafioId);

        if (desafio != null && desafio.getRespostaCorreta().equalsIgnoreCase(respostaUser.trim())) {

            // 2. VERIFICA SE JÁ COMPLETOU (Evita duplicar XP)
            if (!progressoDAO.jaConcluiu(usuario.getId(), desafio.getId())) {

                boolean salvou = progressoDAO.salvarProgresso(usuario.getId(), desafio.getId(), desafio.getXp());

                if (salvou) {
                    // 3. ATUALIZA XP NO CABEÇALHO (Objeto na Sessão)
                    // Como o JSP lê o objeto 'usuarioLogado', ao mudar o XP aqui,
                    // a mudança aparece em todas as páginas que usam o cabeçalho.
                    int novoXp = usuario.getXp() + desafio.getXp();
                    usuario.setXp(novoXp);
                    session.setAttribute("usuarioLogado", usuario);
                }
            }
            response.sendRedirect("desafios?feedback=acertou");
        } else {
            response.sendRedirect("desafios?id=" + desafioId + "&feedback=errou");
        }
    }
}