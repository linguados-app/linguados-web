package com.linguados.desafio;

import java.util.Arrays;
import java.util.List;

public class DesafioMultiplaEscolha extends Desafio {
    private String opcoesSemicolon; // Opções separadas por ';' no banco

    public DesafioMultiplaEscolha() {
        super();
    }

    // Converte a String do banco em uma lista para o JSP
    public List<String> getListaOpcoes() {
        if (opcoesSemicolon == null) return null;
        return Arrays.asList(opcoesSemicolon.split(";"));
    }

    @Override
    public boolean verificarResposta(String resposta) {
        if (resposta == null || getRespostaCorreta() == null) return false;
        return getRespostaCorreta().equals(resposta);
    }

    public String getOpcoesSemicolon() { return opcoesSemicolon; }
    public void setOpcoesSemicolon(String opcoesSemicolon) { this.opcoesSemicolon = opcoesSemicolon; }
}