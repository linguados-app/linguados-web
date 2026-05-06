package com.linguados.desafio;

import com.linguados.config.DatabaseConfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DesafioDAO {

    public Desafio buscarPorId(int id) {
        // Query que busca em todas as tabelas relacionadas
        String sql = "SELECT d.*, l.texto_antes, l.texto_depois, l.palavra_omitida, m.opcoes " +
                "FROM desafio d " +
                "LEFT JOIN desafio_lacuna l ON d.id = l.id_desafio " +
                "LEFT JOIN desafio_multipla_escolha m ON d.id = m.id_desafio " +
                "WHERE d.id = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String tipo = rs.getString("tipo");
                Desafio d;

                // Instanciação baseada no tipo (Polimorfismo)
                if ("LACUNA".equalsIgnoreCase(tipo)) {
                    DesafioLacuna dl = new DesafioLacuna();
                    dl.setTextoAntes(rs.getString("texto_antes"));
                    dl.setTextoDepois(rs.getString("texto_depois"));
                    dl.setPalavraOmitida(rs.getString("palavra_omitida"));
                    d = dl;
                } else if ("MULTIPLA_ESCOLHA".equalsIgnoreCase(tipo)) {
                    DesafioMultiplaEscolha dm = new DesafioMultiplaEscolha();
                    dm.setOpcoesSemicolon(rs.getString("opcoes"));
                    d = dm;
                } else {
                    d = new DesafioTraducao();
                }

                // Preenchimento dos dados comuns da classe pai
                d.setId(rs.getInt("id"));
                d.setTitulo(rs.getString("titulo"));
                d.setEnunciado(rs.getString("enunciado"));
                d.setXpRecompensa(rs.getInt("xp_recompensa"));
                d.setRespostaCorreta(rs.getString("resposta_correta"));
                d.setTipo(tipo);
                return d;
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public List<Desafio> listarTodos() {
        List<Desafio> lista = new ArrayList<>();
        String sql = "SELECT id, titulo, tipo, xp_recompensa FROM desafio";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                // Para a lista, usamos um objeto genérico básico
                Desafio d = new DesafioTraducao();
                d.setId(rs.getInt("id"));
                d.setTitulo(rs.getString("titulo"));
                d.setTipo(rs.getString("tipo"));
                d.setXpRecompensa(rs.getInt("xp_recompensa"));
                lista.add(d);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return lista;
    }
}