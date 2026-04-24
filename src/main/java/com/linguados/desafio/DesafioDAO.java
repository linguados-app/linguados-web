package com.linguados.desafio;

import com.linguados.config.DatabaseConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DesafioDAO {

    // Busca todos os desafios cadastrados no banco de dados
    // @return Uma lista de objetos Desafio
    public List<Desafio> listarTodos() {
        List<Desafio> desafios = new ArrayList<>();
        String sql = "SELECT * FROM desafio";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Desafio desafio = new Desafio();
                desafio.setId(rs.getInt("id"));
                desafio.setTitulo(rs.getString("titulo"));
                desafio.setDescricao(rs.getString("descricao"));
                desafio.setXp(rs.getInt("pontos_xp"));
                desafio.setDificuldade(rs.getString("dificuldade"));

                desafios.add(desafio);
            }
        } catch (SQLException e) {
            System.err.println("Erro ao listar desafios: " + e.getMessage());
        }
        return desafios;
    }

    // Busca um desafio específico pelo ID
    public Desafio buscarPorId(int id) {
        String sql = "SELECT * FROM desafio WHERE id = ?";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Desafio d = new Desafio();
                d.setId(rs.getInt("id"));
                d.setTitulo(rs.getString("titulo"));
                d.setDescricao(rs.getString("descricao"));
                d.setRespostaCorreta(rs.getString("resposta_correta")); // Nome da coluna no MySQL
                d.setXp(rs.getInt("xp"));
                d.setNivel(rs.getString("nivel"));
                return d;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}