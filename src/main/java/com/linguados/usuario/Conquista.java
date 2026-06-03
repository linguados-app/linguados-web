package com.linguados.usuario;

import java.sql.Timestamp;

public class Conquista {
    private int id;
    private String codigo;
    private String titulo;
    private String descricao;
    private String badgeIcone;
    private int xpBonus;
    private Timestamp dataDesbloqueio; // Opcional, usado para listar quando ganhou

    // Construtores
    public Conquista() {}

    // Getters e Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getCodigo() { return codigo; }
    public void setCodigo(String codigo) { this.codigo = codigo; }
    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }
    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }
    public String getBadgeIcone() { return badgeIcone; }
    public void setBadgeIcone(String badgeIcone) { this.badgeIcone = badgeIcone; }
    public int getXpBonus() { return xpBonus; }
    public void setXpBonus(int xpBonus) { this.xpBonus = xpBonus; }
    public Timestamp getDataDesbloqueio() { return dataDesbloqueio; }
    public void setDataDesbloqueio(Timestamp dataDesbloqueio) { this.dataDesbloqueio = dataDesbloqueio; }
}