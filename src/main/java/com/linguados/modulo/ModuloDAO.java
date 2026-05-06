package com.linguados.modulo;

import com.linguados.config.DatabaseConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ModuloDAO {

    public void salvar(Modulo modulo) throws Exception {
        String sql = "INSERT INTO modulos (titulo, descricao, ordem, ativo) VALUES (?, ?, ?, ?)";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, modulo.getTitulo());
            stmt.setString(2, modulo.getDescricao());
            stmt.setInt(3, modulo.getOrdem());
            stmt.setBoolean(4, modulo.isAtivo());

            stmt.executeUpdate();
        }
    }

    public List<Modulo> listar() throws Exception {
        String sql = "SELECT * FROM modulos ORDER BY ordem, id";

        List<Modulo> modulos = new ArrayList<>();

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Modulo modulo = new Modulo();
                modulo.setId(rs.getInt("id"));
                modulo.setTitulo(rs.getString("titulo"));
                modulo.setDescricao(rs.getString("descricao"));
                modulo.setOrdem(rs.getInt("ordem"));
                modulo.setAtivo(rs.getBoolean("ativo"));

                modulos.add(modulo);
            }
        }

        return modulos;
    }
}