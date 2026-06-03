package com.linguados.desafio;

import com.linguados.config.DatabaseConfig;
import com.linguados.modulo.Modulo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DesafioDAO {

    public Desafio buscarPorId(int id) {
        String sql = "SELECT d.*, l.texto_antes, l.texto_depois, l.palavra_omitida, m.opcoes " +
                "FROM desafio d " +
                "LEFT JOIN desafio_lacuna l ON d.id = l.id_desafio " +
                "LEFT JOIN desafio_multipla_escolha m ON d.id = m.id_desafio " +
                "WHERE d.id = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String tipo = rs.getString("tipo");
                    Desafio d;

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

                    d.setId(rs.getInt("id"));
                    d.setTitulo(rs.getString("titulo"));
                    d.setEnunciado(rs.getString("enunciado"));
                    d.setXpRecompensa(rs.getInt("xp_recompensa"));
                    d.setRespostaCorreta(rs.getString("resposta_correta"));
                    d.setTipo(tipo);
                    d.setIdModulo(rs.getInt("id_modulo"));
                    return d;
                }
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

        String sql = "SELECT d.*, l.texto_antes, l.texto_depois, l.palavra_omitida, m.opcoes " +
                "FROM desafio d " +
                "LEFT JOIN desafio_lacuna l ON d.id = l.id_desafio " +
                "LEFT JOIN desafio_multipla_escolha m ON d.id = m.id_desafio " +
                "WHERE d.id_modulo = ? " +
                "ORDER BY d.id ASC";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idModulo);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String tipo = rs.getString("tipo");
                    Desafio d;

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

                    // Preenche as propriedades comuns (CORRIGIDO: adicionado setEnunciado)
                    d.setId(rs.getInt("id"));
                    d.setTitulo(rs.getString("titulo"));
                    d.setEnunciado(rs.getString("enunciado")); // <--- A LINHA QUE SALVA O PATO!
                    d.setXpRecompensa(rs.getInt("xp_recompensa"));
                    d.setRespostaCorreta(rs.getString("resposta_correta"));
                    d.setTipo(tipo);
                    d.setIdModulo(rs.getInt("id_modulo"));

                    lista.add(d);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public void salvar(Desafio desafio) {
        String sql = "INSERT INTO desafio (titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, desafio.getTitulo());
            ps.setString(2, desafio.getEnunciado());
            ps.setInt(3, desafio.getXpRecompensa());
            ps.setString(4, desafio.getDificuldade());
            ps.setString(5, desafio.getTipo());
            ps.setString(6, desafio.getRespostaCorreta());
            ps.setInt(7, desafio.getIdModulo());

            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    int idDesafio = rs.getInt(1);
                    if (desafio instanceof DesafioLacuna dl) {
                        salvarLacuna(dl, idDesafio, conn);
                    }
                    if (desafio instanceof DesafioMultiplaEscolha dm) {
                        salvarMultiplaEscolha(dm, idDesafio, conn);
                    }
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
    }

    private void salvarLacuna(DesafioLacuna d, int idDesafio, Connection conn) throws SQLException {
        String sql = "INSERT INTO desafio_lacuna (id_desafio, texto_antes, texto_depois, palavra_omitida) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idDesafio);
            ps.setString(2, d.getTextoAntes());
            ps.setString(3, d.getTextoDepois());
            ps.setString(4, d.getPalavraOmitida());
            ps.executeUpdate();
        }
    }

    private void salvarMultiplaEscolha(DesafioMultiplaEscolha d, int idDesafio, Connection conn) throws SQLException {
        String sql = "INSERT INTO desafio_multipla_escolha (id_desafio, opcoes) VALUES (?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idDesafio);
            ps.setString(2, d.getOpcoesSemicolon());
            ps.executeUpdate();
        }
    }

    public List<Modulo> listarModulos() {
        List<Modulo> modulos = new ArrayList<>();
        // Mapeado com o nome real da tabela: 'modulos' e o setter 'setTitulo'
        String sql = "SELECT id, titulo, descricao, ordem, ativo FROM modulos WHERE ativo = true ORDER BY ordem ASC";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Modulo m = new Modulo();
                m.setId(rs.getInt("id"));
                m.setTitulo(rs.getString("titulo"));
                m.setDescricao(rs.getString("descricao"));
                m.setOrdem(rs.getInt("ordem"));
                m.setAtivo(rs.getBoolean("ativo"));
                modulos.add(m);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return modulos;
    }
}