package com.linguados.desafio;

import com.linguados.desafio.DesafioLacuna;
import com.linguados.config.DatabaseConfig;
import java.sql.*;

public class DesafioLacunaDAO {

    public DesafioLacuna buscarPorId(int id) {
        String sql = "SELECT d.*, l.texto_antes, l.texto_depois, l.palavra_omitida " +
                "FROM desafio d " +
                "JOIN desafio_lacuna l ON d.id = l.id_desafio " +
                "WHERE d.id = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                DesafioLacuna dl = new DesafioLacuna();
                dl.setId(rs.getInt("id"));
                dl.setTitulo(rs.getString("titulo"));
                dl.setEnunciado(rs.getString("enunciado"));
                dl.setXpRecompensa(rs.getInt("xp_recompensa"));
                dl.setTextoAntes(rs.getString("texto_antes"));
                dl.setTextoDepois(rs.getString("texto_depois"));
                dl.setPalavraOmitida(rs.getString("palavra_omitida"));
                return dl;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}