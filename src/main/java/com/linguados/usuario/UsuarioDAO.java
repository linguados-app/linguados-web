package com.linguados.usuario;

import com.linguados.config.DatabaseConfig;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UsuarioDAO {

    /**
     * Salva um novo usuário no banco de dados.
     * XP inicial: 0 | Nível inicial: 1
     */
    public boolean cadastrar(Usuario usuario) {
        String sql = "INSERT INTO usuario (nome, email, senha, xp, nivel, streak) VALUES (?, ?, ?, 0, 1, 0)";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getSenha()); // Dica: No futuro, use BCrypt aqui

            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0;

        } catch (SQLException e) {
            // Se der erro de "Duplicate entry" no e-mail, ele cai aqui
            System.err.println("Erro ao cadastrar usuário: " + e.getMessage());
            return false;
        }
    }

    public void atualizarStreak(Usuario usuario) {
        String sql = "UPDATE usuario SET streak = ?, ultimo_acesso = ?, xp = ? WHERE id = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuario.getStreak());
            stmt.setDate(2, Date.valueOf(usuario.getUltimoAcesso()));
            stmt.setInt(3, usuario.getXp());
            stmt.setInt(4, usuario.getId());

            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}