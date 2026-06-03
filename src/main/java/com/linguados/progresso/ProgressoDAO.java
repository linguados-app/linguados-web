package com.linguados.progresso;

import com.linguados.config.DatabaseConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public int getLicoesConcluidasHoje(int usuarioId) {
        String sql = """
        SELECT COUNT(*)
        FROM progresso
        WHERE usuario_id = ?
        AND DATE(data_conclusao) = CURDATE()
    """;

        try (
                Connection conn = DatabaseConfig.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, usuarioId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    public int[] getAtividadeSemana(int usuarioId) {

        int[] dias = new int[7];

        String sql = """
        SELECT
            DAYOFWEEK(data_conclusao) dia,
            COUNT(*) total
        FROM progresso
        WHERE usuario_id = ?
          AND data_conclusao >= DATE_SUB(CURDATE(), INTERVAL 6 DAY)
        GROUP BY DAYOFWEEK(data_conclusao)
    """;

        try (
                Connection conn = DatabaseConfig.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)
        ) {

            stmt.setInt(1, usuarioId);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                int diaMysql = rs.getInt("dia");

                int total = rs.getInt("total");

                int indice;

                switch (diaMysql) {
                    case 2 -> indice = 0; // Mon
                    case 3 -> indice = 1; // Tue
                    case 4 -> indice = 2; // Wed
                    case 5 -> indice = 3; // Thu
                    case 6 -> indice = 4; // Fri
                    case 7 -> indice = 5; // Sat
                    default -> indice = 6; // Sun
                }

                dias[indice] = total;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dias;
    }

    // NOVO MÉTODO: Buscar módulos com progresso do usuário
    public List<Map<String, Object>> getModulosComProgresso(int usuarioId) {
        List<Map<String, Object>> modulosProgresso = new ArrayList<>();

        String sql = """
            SELECT 
                m.id,
                m.titulo,
                COUNT(d.id) as total_desafios,
                COUNT(p.id) as desafios_concluidos
            FROM modulos m
            LEFT JOIN desafio d ON d.id_modulo = m.id
            LEFT JOIN progresso p ON p.desafio_id = d.id AND p.usuario_id = ?
            WHERE m.ativo = true
            GROUP BY m.id, m.titulo
            HAVING total_desafios > 0
            ORDER BY m.ordem
        """;

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuarioId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Map<String, Object> modulo = new HashMap<>();
                modulo.put("id", rs.getInt("id"));
                modulo.put("titulo", rs.getString("titulo"));
                modulo.put("totalDesafios", rs.getInt("total_desafios"));
                modulo.put("concluidos", rs.getInt("desafios_concluidos"));

                // Calcular porcentagem
                int total = rs.getInt("total_desafios");
                int concluidos = rs.getInt("desafios_concluidos");
                int porcentagem = total > 0 ? (concluidos * 100) / total : 0;
                modulo.put("porcentagem", porcentagem);

                modulosProgresso.add(modulo);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return modulosProgresso;
    }
}