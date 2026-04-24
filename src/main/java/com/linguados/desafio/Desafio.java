package com.linguados.desafio;

import java.io.Serializable;

public class Desafio implements Serializable {
    private int id;
    private String titulo;
    private String descricao;
    private String respostaCorreta; // O Servlet precisa disso!
    private int xp;
    private String nivel;
    private String dificuldade;

    // Construtor padrão
    public Desafio() {}

    // Construtor completo para uso no DAO
    public Desafio(int id, String titulo, String descricao, String respostaCorreta, int xp, String nivel, String dificuldade) {
        this.id = id;
        this.titulo = titulo;
        this.descricao = descricao;
        this.respostaCorreta = respostaCorreta;
        this.xp = xp;
        this.nivel = nivel;
        this.dificuldade = dificuldade;
    }

    // Construtor, Getters e Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }

    public String getRespostaCorreta() { return respostaCorreta; }
    public void setRespostaCorreta(String respostaCorreta) { this.respostaCorreta = respostaCorreta; }

    public int getXp() { return xp; }
    public void setXp(int xp) { this.xp = xp; }

    public String getNivel() { return nivel; }
    public void setNivel(String nivel) { this.nivel = nivel; }

    public String getDificuldade() { return dificuldade; }
    public void setDificuldade(String dificuldade) { this.dificuldade = dificuldade; }
}