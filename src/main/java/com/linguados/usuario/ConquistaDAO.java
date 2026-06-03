package com.linguados.usuario;

import com.linguados.config.DatabaseConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ConquistaDAO {

    /**
     * Regista a conquista no perfil do utilizador pelo ID numérico da conquista.
     * Utiliza INSERT IGNORE para não duplicar se ele refizer o módulo.
     */
    public boolean desbloquearConquista(int idUsuario, int idConquista) {
        String sql = "INSERT IGNORE INTO usuario_conquista (id_usuario, id_conquista) VALUES (?, ?)";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idUsuario);
            stmt.setInt(2, idConquista);

            int linhasAfetadas = stmt.executeUpdate();
            return java.lang.Integer.valueOf(linhasAfetadas) > 0;

        } catch (SQLException e) {
            System.err.println("Erro ao desbloquear conquista: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Concede uma conquista associando-a pelo código textual (ex: CONQ_MOD_1).
     * Faz um SELECT dinâmico no INSERT para evitar múltiplas requisições ao banco.
     */
    public boolean concederConquista(int idUsuario, String codigoConquista) {
        String sql = "INSERT IGNORE INTO usuario_conquista (id_usuario, id_conquista) " +
                "SELECT ?, id FROM conquista WHERE codigo = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idUsuario);
            stmt.setString(2, codigoConquista);

            int linhasAfetadas = stmt.executeUpdate();
            return java.lang.Integer.valueOf(linhasAfetadas) > 0;

        } catch (SQLException e) {
            System.err.println("Erro ao conceder conquista pelo código: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Busca todas as conquistas obtidas por um determinado usuário para exibição no Perfil.
     */
    public List<Conquista> buscarConquistasPorUsuario(int idUsuario) {
        List<Conquista> conquistas = new ArrayList<>();
        String sql = "SELECT c.* FROM conquista c " +
                "INNER JOIN usuario_conquista uc ON c.id = uc.id_conquista " +
                "WHERE uc.id_usuario = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idUsuario);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Conquista c = new Conquista();
                    c.setId(rs.getInt("id"));
                    c.setCodigo(rs.getString("codigo"));
                    c.setTitulo(rs.getString("titulo"));
                    c.setDescricao(rs.getString("descricao"));
                    c.setBadgeIcone(rs.getString("badge_icone"));
                    c.setXpBonus(rs.getInt("xp_bonus"));
                    conquistas.add(c);
                }
            }

        } catch (SQLException e) {
            System.err.println("Erro ao buscar conquistas do usuário: " + e.getMessage());
            e.printStackTrace();
        }

        return conquistas;
    }
}