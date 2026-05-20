package com.linguados.usuario;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * Implementamos Serializable para que o Tomcat consiga
 * salvar o objeto na sessão de forma estável.
 */
public class Usuario implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private String nome;
    private String email;
    private String senha;
    private int xp;
    private int nivel;
    private int streak;
    private LocalDate ultimoAcesso;
    private String perfil; // NOVO: Controla a role do usuário ('ESTUDANTE' ou 'ADMIN')

    // Construtor padrão (obrigatório para Javabeans)
    public Usuario() {}

    // Construtor para facilitar a criação via DAO
    public Usuario(int id, String nome, String email, int xp, int nivel, int streak, LocalDate ultimoAcesso, String perfil) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.xp = xp;
        this.nivel = nivel;
        this.streak = streak;
        this.ultimoAcesso = ultimoAcesso;
        this.perfil = perfil;
    }

    // NOVO: Método de checagem utilizado no roteamento contínuo de desafios
    public boolean isAdmin() {
        return "ADMIN".equalsIgnoreCase(this.perfil);
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

    public int getStreak() { return streak; }
    public void setStreak(int streak) { this.streak = streak; }

    public LocalDate getUltimoAcesso() { return ultimoAcesso; }
    public void setUltimoAcesso(LocalDate ultimoAcesso) { this.ultimoAcesso = ultimoAcesso; }

    public String getPerfil() { return perfil; }
    public void setPerfil(String perfil) { this.perfil = perfil; }

    // Metodo utilitário para facilitar a exibição no JSP
    public String getPrimeiroNome() {
        if (this.nome == null || this.nome.isEmpty()) return "Dev";
        return this.nome.split(" ")[0];
    }
}