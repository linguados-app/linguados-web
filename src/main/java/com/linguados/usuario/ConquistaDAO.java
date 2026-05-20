package com.linguados.usuario;

import com.linguados.config.DatabaseConfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ConquistaDAO {

    // Busca todas as conquistas que um usuário específico já ganhou
    public List<Conquista> buscarConquistasPorUsuario(int usuarioId) {
        List<Conquista> conquistas = new ArrayList<>();
        String sql = "SELECT c.*, uc.data_desbloqueio FROM conquista c " +
                "INNER JOIN usuario_conquista uc ON c.id = uc.conquista_id " +
                "WHERE uc.usuario_id = ? ORDER BY uc.data_desbloqueio DESC";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuarioId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Conquista c = new Conquista();
                    c.setId(rs.getInt("id"));
                    c.setCodigo(rs.getString("codigo"));
                    c.setTitulo(rs.getString("titulo"));
                    c.setDescricao(rs.getString("descricao"));
                    c.setBadgeIcone(rs.getString("badge_icone"));
                    c.setXpBonus(rs.getInt("xp_bonus"));
                    c.setDataDesbloqueio(rs.getTimestamp("data_desbloqueio"));
                    conquistas.add(c);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conquistas;
    }

    // Registra o desbloqueio se o usuário ainda não possuir a conquista
    public boolean concederConquista(int usuarioId, String codigoConquista) {
        String sqlVerificar = "SELECT 1 FROM usuario_conquista uc " +
                "INNER JOIN conquista c ON uc.conquista_id = c.id " +
                "WHERE uc.usuario_id = ? AND c.codigo = ?";

        String sqlInserir = "INSERT IGNORE INTO usuario_conquista (usuario_id, conquista_id) " +
                "SELECT ?, id FROM conquista WHERE codigo = ?";

        try (Connection conn = DatabaseConfig.getConnection()) {
            // Verifica se já tem
            try (PreparedStatement stmtVerificar = conn.prepareStatement(sqlVerificar)) {
                stmtVerificar.setInt(1, usuarioId);
                stmtVerificar.setString(2, codigoConquista);
                try (ResultSet rs = stmtVerificar.executeQuery()) {
                    if (rs.next()) return false; // Já possui a conquista, não faz nada
                }
            }

            // Se não tem, insere
            try (PreparedStatement stmtInserir = conn.prepareStatement(sqlInserir)) {
                stmtInserir.setInt(1, usuarioId);
                stmtInserir.setString(2, codigoConquista);
                int linhasAfetadas = stmtInserir.executeUpdate();
                return linhasAfetadas > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}