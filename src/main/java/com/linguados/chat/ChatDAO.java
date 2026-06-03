package com.linguados.chat;

import com.linguados.config.DatabaseConfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ChatDAO {

    // Salva uma mensagem (comum ou de conquista) no banco de dados
    public void salvarMensagem(int usuarioId, String conteudo) {
        String sql = "INSERT INTO chat_mensagens (usuario_id, conteudo) VALUES (?, ?)";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, usuarioId);
            stmt.setString(2, conteudo);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Busca as últimas 30 mensagens para o chat não iniciar vazio
    public List<String[]> buscarHistorico() {
        List<String[]> historico = new ArrayList<>();
        String sql = "SELECT u.nome, c.conteudo FROM chat_mensagens c " +
                "INNER JOIN usuario u ON c.usuario_id = u.id " +
                "ORDER BY c.data_envio ASC LIMIT 30";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                historico.add(new String[]{ rs.getString("nome"), rs.getString("conteudo") });
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return historico;
    }
}