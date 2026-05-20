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
        // ADICIONADO: 'perfil' inserido na projeção da consulta SQL
        String sql = "SELECT id, nome, email, xp, nivel, streak, ultimo_acesso, perfil FROM usuario WHERE email = ? AND senha = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, senha); // Nota: Em prod, use BCrypt para comparar hashes!

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    // Instancia usando setters para desacoplar do tamanho do construtor
                    Usuario u = new Usuario();

                    u.setId(rs.getInt("id"));
                    u.setNome(rs.getString("nome"));
                    u.setEmail(rs.getString("email"));
                    u.setXp(rs.getInt("xp"));
                    u.setNivel(rs.getInt("nivel"));
                    u.setStreak(rs.getInt("streak"));
                    u.setPerfil(rs.getString("perfil")); // Sincroniza o papel do usuário ('ADMIN' ou 'ESTUDANTE')

                    Date ultimoAcessoSql = rs.getDate("ultimo_acesso");
                    if (ultimoAcessoSql != null) {
                        u.setUltimoAcesso(ultimoAcessoSql.toLocalDate());
                    }

                    return u;
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro na autenticação: " + e.getMessage());
        }
        return null; // Retorna null se não achar ou der erro
    }
}