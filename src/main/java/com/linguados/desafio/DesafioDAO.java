package com.linguados.desafio;

import com.linguados.config.DatabaseConfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DesafioDAO {

    public Desafio buscarPorId(int id) {
        // Query que busca em todas as tabelas relacionadas
        String sql = "SELECT d.*, l.texto_antes, l.texto_depois, l.palavra_omitida, m.opcoes " +
                "FROM desafio d " +
                "LEFT JOIN desafio_lacuna l ON d.id = l.id_desafio " +
                "LEFT JOIN desafio_multipla_escolha m ON d.id = m.id_desafio " +
                "WHERE d.id = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String tipo = rs.getString("tipo");
                Desafio d;

                // Instanciação baseada no tipo (Polimorfismo)
                if ("LACUNA".equalsIgnoreCase(tipo)) {
                    DesafioLacuna dl = new DesafioLacuna();
                    dl.setTextoAntes(rs.getString("texto_antes"));
                    dl.setTextoDepois(rs.getString("texto_depois"));
                    dl.setPalavraOmitida(rs.getString("palavra_omitida"));
                    d = dl;
                } else if ("MULTIPLA_ESCOLHA".equalsIgnoreCase(tipo)) {
                    DesafioMultiplaEscolha dm = new DesafioMultiplaEscolha();
                    dm.setOpcoesSemicolon(rs.getString("opcoes"));
                    d = dm;
                } else {
                    d = new DesafioTraducao();
                }

                // Preenchimento dos dados comuns da classe pai
                d.setId(rs.getInt("id"));
                d.setTitulo(rs.getString("titulo"));
                d.setEnunciado(rs.getString("enunciado"));
                d.setXpRecompensa(rs.getInt("xp_recompensa"));
                d.setRespostaCorreta(rs.getString("resposta_correta"));
                d.setTipo(tipo);
                d.setIdModulo(rs.getInt("id_modulo"));
                return d;
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public List<Desafio> listarTodos() {
        List<Desafio> lista = new ArrayList<>();
        String sql = "SELECT * FROM desafio";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                // Para a lista, usamos um objeto genérico básico
                Desafio d = new DesafioTraducao();
                d.setId(rs.getInt("id"));
                d.setTitulo(rs.getString("titulo"));
                d.setTipo(rs.getString("tipo"));
                d.setXpRecompensa(rs.getInt("xp_recompensa"));
                d.setIdModulo(rs.getInt("id_modulo"));
                lista.add(d);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return lista;
    }
    public List<Desafio> listarPorModulo(int idModulo) {

        List<Desafio> lista = new ArrayList<>();

        String sql = """
        SELECT *
        FROM desafio
        WHERE id_modulo = ?
        ORDER BY id
    """;

        try (
                Connection conn = DatabaseConfig.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setInt(1, idModulo);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Desafio d = new DesafioTraducao();

                d.setId(rs.getInt("id"));
                d.setTitulo(rs.getString("titulo"));
                d.setTipo(rs.getString("tipo"));
                d.setXpRecompensa(rs.getInt("xp_recompensa"));
                d.setIdModulo(rs.getInt("id_modulo"));

                lista.add(d);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    public void salvar(Desafio desafio) {

        String sql = """
        INSERT INTO desafio
        (
            titulo,
            enunciado,
            xp_recompensa,
            dificuldade,
            tipo,
            resposta_correta,
            id_modulo
        )
        VALUES (?, ?, ?, ?, ?, ?, ?)
    """;

        try (
                Connection conn = DatabaseConfig.getConnection();
                PreparedStatement ps =
                        conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)
        ) {

            ps.setString(1, desafio.getTitulo());
            ps.setString(2, desafio.getEnunciado());
            ps.setInt(3, desafio.getXpRecompensa());
            ps.setString(4, desafio.getDificuldade());
            ps.setString(5, desafio.getTipo());
            ps.setString(6, desafio.getRespostaCorreta());
            ps.setInt(7, desafio.getIdModulo());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();

            if (rs.next()) {

                int idDesafio = rs.getInt(1);

                // LACUNA
                if (desafio instanceof DesafioLacuna dl) {

                    salvarLacuna(dl, idDesafio, conn);

                }

                // MULTIPLA ESCOLHA
                if (desafio instanceof DesafioMultiplaEscolha dm) {

                    salvarMultiplaEscolha(dm, idDesafio, conn);

                }
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }
    }

    private void salvarLacuna(
            DesafioLacuna d,
            int idDesafio,
            Connection conn
    ) throws SQLException {

        String sql = """
        INSERT INTO desafio_lacuna
        (
            id_desafio,
            texto_antes,
            texto_depois,
            palavra_omitida
        )
        VALUES (?, ?, ?, ?)
    """;

        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setInt(1, idDesafio);
        ps.setString(2, d.getTextoAntes());
        ps.setString(3, d.getTextoDepois());
        ps.setString(4, d.getPalavraOmitida());

        ps.executeUpdate();
    }

    private void salvarMultiplaEscolha(
            DesafioMultiplaEscolha d,
            int idDesafio,
            Connection conn
    ) throws SQLException {

        String sql = """
        INSERT INTO desafio_multipla_escolha
        (
            id_desafio,
            opcoes
        )
        VALUES (?, ?)
    """;

        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setInt(1, idDesafio);
        ps.setString(2, d.getOpcoesSemicolon());

        ps.executeUpdate();
    }
}