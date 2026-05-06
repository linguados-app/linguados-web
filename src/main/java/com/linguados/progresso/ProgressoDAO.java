package com.linguados.progresso;

import com.linguados.config.DatabaseConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProgressoDAO {

    public boolean salvarProgresso(int usuarioId, int desafioId, int xpGanhado) {
        String sqlProgresso = "INSERT INTO progresso (usuario_id, desafio_id) VALUES (?, ?)";
        String sqlUpdateXP = "UPDATE usuario SET xp = xp + ? WHERE id = ?";

        Connection conn = null;
        try {
            conn = DatabaseConfig.getConnection();
            conn.setAutoCommit(false); // Inicia transação

            // 1. Registra a conclusão
            try (PreparedStatement stmtProg = conn.prepareStatement(sqlProgresso)) {
                stmtProg.setInt(1, usuarioId);
                stmtProg.setInt(2, desafioId);
                stmtProg.executeUpdate();
            }

            // 2. Incrementa o XP no Banco
            try (PreparedStatement stmtXP = conn.prepareStatement(sqlUpdateXP)) {
                stmtXP.setInt(1, xpGanhado);
                stmtXP.setInt(2, usuarioId);
                stmtXP.executeUpdate();
            }

            conn.commit();
            return true;
        } catch (SQLException e) {
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            return false;
        }
    }

    public boolean jaConcluiu(int usuarioId, int desafioId) {
        String sql = "SELECT id FROM progresso WHERE usuario_id = ? AND desafio_id = ?";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, usuarioId);
            stmt.setInt(2, desafioId);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            return false;
        }
    }
}