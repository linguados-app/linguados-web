package com.linguados.desafio;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/desafio/criar")
public class AdminDesafioServlet extends HttpServlet {

    private final DesafioDAO dao = new DesafioDAO();

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp
    ) throws ServletException, IOException {

        String tipo = req.getParameter("tipo");

        Desafio desafio;

        // =========================
        // LACUNA
        // =========================

        if ("LACUNA".equals(tipo)) {

            DesafioLacuna d = new DesafioLacuna();

            d.setTextoAntes(
                    req.getParameter("textoAntes")
            );

            d.setTextoDepois(
                    req.getParameter("textoDepois")
            );

            d.setPalavraOmitida(
                    req.getParameter("palavraOmitida")
            );

            desafio = d;

        }

        // =========================
        // MULTIPLA ESCOLHA
        // =========================

        else if ("MULTIPLA_ESCOLHA".equals(tipo)) {

            DesafioMultiplaEscolha d =
                    new DesafioMultiplaEscolha();

            String opcoes =
                    req.getParameter("altA") + ";" +
                            req.getParameter("altB") + ";" +
                            req.getParameter("altC") + ";" +
                            req.getParameter("altD");

            d.setOpcoesSemicolon(opcoes);

            desafio = d;

        }

        // =========================
        // TRADUÇÃO
        // =========================

        else {

            desafio = new DesafioTraducao();
        }

        // =========================
        // CAMPOS COMUNS
        // =========================

        desafio.setTitulo(
                req.getParameter("titulo")
        );

        desafio.setEnunciado(
                req.getParameter("enunciado")
        );

        desafio.setXpRecompensa(
                Integer.parseInt(
                        req.getParameter("xp")
                )
        );

        desafio.setDificuldade(
                req.getParameter("dificuldade")
        );

        desafio.setTipo(tipo);

        desafio.setRespostaCorreta(
                req.getParameter("resposta")
        );
        System.out.println(
                "ID MODULO -> " +
                        req.getParameter("idModulo")
        );
        desafio.setIdModulo(
                Integer.parseInt(
                        req.getParameter("idModulo")
                )
        );

        dao.salvar(desafio);

        resp.sendRedirect(
                req.getContextPath()
                        + "/modulo?id="
                        + desafio.getIdModulo()
        );
    }
}