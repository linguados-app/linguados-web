package com.linguados.usuario;

import com.linguados.config.DatabaseConfig;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

public class UsuarioDAO {

    /**
     * Salva um novo usuário no banco de dados.
     * XP inicial: 0 | Nível inicial: 1 | Streak inicial: 0
     */
    public boolean cadastrar(Usuario usuario) {
        String sql = "INSERT INTO usuario (nome, email, senha, xp, nivel, streak) VALUES (?, ?, ?, 0, 1, 0)";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getSenha());

            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0;

        } catch (SQLException e) {
            System.err.println("Erro ao cadastrar usuário: " + e.getMessage());
            return false;
        }
    }

    public boolean atualizarNome(int usuarioId, String novoNome) {
        String sql = "UPDATE usuario SET nome = ? WHERE id = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, novoNome);
            stmt.setInt(2, usuarioId);

            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0; // Retorna true se a alteração foi persistida com sucesso

        } catch (SQLException e) {
            System.err.println("Erro ao atualizar nome no banco de dados: " + e.getMessage());
            return false;
        }
    }

    /**
     * Busca um usuário pelo e-mail (usado no Login).
     */
    public Usuario buscarPorEmail(String email) {
        String sql = "SELECT * FROM usuario WHERE email = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setEmail(rs.getString("email"));
                u.setSenha(rs.getString("senha"));
                u.setXp(rs.getInt("xp"));
                u.setNivel(rs.getInt("nivel"));
                u.setStreak(rs.getInt("streak"));
                if (rs.getDate("ultimo_acesso") != null) {
                    u.setUltimoAcesso(rs.getDate("ultimo_acesso").toLocalDate());
                }
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Atualiza especificamente XP e Nível após um desafio concluído.
     */
    public void atualizarProgresso(int usuarioId, int novoXp, int novoNivel) {
        String sql = "UPDATE usuario SET xp = ?, nivel = ? WHERE id = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, novoXp);
            stmt.setInt(2, novoNivel);
            stmt.setInt(3, usuarioId);

            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Erro ao atualizar progresso (XP/Nivel): " + e.getMessage());
        }
    }

    /**
     * Atualiza o Streak e a data de último acesso (chamado na Dashboard/Login).
     */
    public void atualizarStreak(Usuario usuario) {
        String sql = "UPDATE usuario SET streak = ?, ultimo_acesso = ? WHERE id = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuario.getStreak());
            // Converte LocalDate do Java para Date do SQL
            stmt.setDate(2, Date.valueOf(usuario.getUltimoAcesso()));
            stmt.setInt(3, usuario.getId());

            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Erro ao atualizar streak: " + e.getMessage());
        }
    }

    public List<Usuario> buscarRanking() {
        List<Usuario> ranking = new ArrayList<>();
        // Busca os top 10 ordenados por XP de forma decrescente
        String sql = "SELECT nome, xp, nivel FROM usuario ORDER BY xp DESC LIMIT 10";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setNome(rs.getString("nome"));
                u.setXp(rs.getInt("xp"));
                u.setNivel(rs.getInt("nivel"));
                ranking.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ranking;
    }

    public int contarConcluidosHoje(int usuarioId) {

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
}