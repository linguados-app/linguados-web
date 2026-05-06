package com.linguados.usuario;

import com.linguados.config.DatabaseConfig;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

public class LoginDAO {

    public Usuario autenticar(String email, String senha) {
        String sql = "SELECT id, nome, email, xp, nivel, streak, ultimo_acesso FROM usuario WHERE email = ? AND senha = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, senha); // Nota: Em prod, use BCrypt para comparar hashes!

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    // Se encontrou, cria o objeto Usuario com os dados do banco
                    Date ultimoAcessoSql = rs.getDate("ultimo_acesso");
                    LocalDate ultimoAcesso = (ultimoAcessoSql != null) ? ultimoAcessoSql.toLocalDate() : null;

                    return new Usuario(
                            rs.getInt("id"),
                            rs.getString("nome"),
                            rs.getString("email"),
                            rs.getInt("xp"),
                            rs.getInt("nivel"),
                            rs.getInt("streak"),
                            ultimoAcesso
                    );
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro na autenticação: " + e.getMessage());
        }
        return null; // Retorna null se não achar ou der erro
    }
}
