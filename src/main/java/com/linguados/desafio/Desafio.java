package com.linguados.desafio;

import java.io.Serializable;

public abstract class Desafio implements Serializable {
    private int id;
    private String titulo;
    private String enunciado;
    private String respostaCorreta;
    private int xpRecompensa;
    private String nivel;
    private String dificuldade;
    private String tipo;
    private int idModulo;

    public Desafio() {}

    // Contrato polimórfico: cada tipo de desafio valida a resposta do seu jeito
    public abstract boolean verificarResposta(String respostaDoUsuario);

    // Getters e Setters
    public int getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(int idModulo) {
        this.idModulo = idModulo;
    }
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }
    public String getEnunciado() { return enunciado; }
    public void setEnunciado(String enunciado) { this.enunciado = enunciado; }
    public int getXpRecompensa() { return xpRecompensa; }
    public void setXpRecompensa(int xpRecompensa) { this.xpRecompensa = xpRecompensa; }
    public String getRespostaCorreta() { return respostaCorreta; }
    public void setRespostaCorreta(String respostaCorreta) { this.respostaCorreta = respostaCorreta; }
    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }
    public String getNivel() { return nivel; }
    public void setNivel(String nivel) { this.nivel = nivel; }
    public String getDificuldade() { return dificuldade; }
    public void setDificuldade(String dificuldade) { this.dificuldade = dificuldade; }
}