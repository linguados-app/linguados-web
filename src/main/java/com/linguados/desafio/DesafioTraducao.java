package com.linguados.desafio;

public class DesafioTraducao extends Desafio {

    public DesafioTraducao() {
        super();
    }

    @Override
    public boolean verificarResposta(String resposta) {
        if (resposta == null || getRespostaCorreta() == null) return false;
        return getRespostaCorreta().trim().equalsIgnoreCase(resposta.trim());
    }
}