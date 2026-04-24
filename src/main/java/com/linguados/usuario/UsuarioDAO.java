package com.linguados.usuario;

import com.linguados.config.DatabaseConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UsuarioDAO {

    /**
     * Salva um novo usuário no banco de dados.
     * XP inicial: 0 | Nível inicial: 1
     */
    public boolean cadastrar(Usuario usuario) {
        String sql = "INSERT INTO usuario (nome, email, senha, xp, nivel) VALUES (?, ?, ?, 0, 1)";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getSenha()); // Dica: No futuro, use BCrypt aqui!

            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0;

        } catch (SQLException e) {
            // Se der erro de "Duplicate entry" no e-mail, ele cai aqui
            System.err.println("Erro ao cadastrar usuário: " + e.getMessage());
            return false;
        }
    }
}