package com.linguados.usuario;

import java.io.Serializable;

/**
 * Implementamos Serializable para que o Tomcat consiga
 * salvar o objeto na sessão de forma estável.
 */
public class Usuario implements Serializable {
    private int id;
    private String nome;
    private String email;
    private String senha;
    private int xp;
    private int nivel;

    // Construtor padrão (obrigatório para Javabeans)
    public Usuario() {}

    // Construtor para facilitar a criação via DAO
    public Usuario(int id, String nome, String email, int xp, int nivel) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.xp = xp;
        this.nivel = nivel;
    }

    // Getters e Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getSenha() { return senha; }
    public void setSenha(String senha) { this.senha = senha; }

    public int getXp() { return xp; }
    public void setXp(int xp) { this.xp = xp; }

    public int getNivel() { return nivel; }
    public void setNivel(int nivel) { this.nivel = nivel; }

    // Método utilitário para facilitar a exibição no JSP
    public String getPrimeiroNome() {
        if (nome == null || nome.isEmpty()) return "";
        return nome.split(" ")[0];
    }
}