package com.linguados.progresso;

import com.linguados.config.DatabaseConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProgressoDAO {

    /**
     * Registra que um usuário completou um desafio.
     * Além de inserir na tabela de progresso, vamos atualizar o XP do usuário!
     */
    public boolean salvarProgresso(int usuarioId, int desafioId, int xpGanhado) {
        String sqlProgresso = "INSERT INTO progresso (usuario_id, desafio_id) VALUES (?, ?)";
        String sqlUpdateXP = "UPDATE usuario SET xp = xp + ? WHERE id = ?";

        Connection conn = null;
        try {
            conn = DatabaseConfig.getConnection();
            // Inicia uma transação para garantir que as duas operações ocorram juntas
            conn.setAutoCommit(false);

            // 1. Insere o registro de conclusão
            try (PreparedStatement stmtProg = conn.prepareStatement(sqlProgresso)) {
                stmtProg.setInt(1, usuarioId);
                stmtProg.setInt(2, desafioId);
                stmtProg.executeUpdate();
            }

            // 2. Atualiza o XP do usuário na tabela de usuários
            try (PreparedStatement stmtXP = conn.prepareStatement(sqlUpdateXP)) {
                stmtXP.setInt(1, xpGanhado);
                stmtXP.setInt(2, usuarioId);
                stmtXP.executeUpdate();
            }

            conn.commit(); // Salva tudo no banco
            return true;

        } catch (SQLException e) {
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            System.err.println("Erro ao salvar progresso: " + e.getMessage());
            return false;
        }
    }

    /**
     * Verifica se o usuário já completou esse desafio antes
     * (útil para não dar XP infinito pelo mesmo desafio).
     */
    public boolean jaConcluiu(int usuarioId, int desafioId) {
        String sql = "SELECT id FROM progresso WHERE usuario_id = ? AND desafio_id = ?";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuarioId);
            stmt.setInt(2, desafioId);
            ResultSet rs = stmt.executeQuery();

            return rs.next(); // Se houver resultado, ele já concluiu
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}