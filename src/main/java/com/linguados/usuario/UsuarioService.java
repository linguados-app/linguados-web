package com.linguados.usuario;

import com.linguados.chat.ChatDAO;
import com.linguados.chat.ChatEndpoint;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class UsuarioService {
    private UsuarioDAO usuarioDAO = new UsuarioDAO();
    private ConquistaDAO conquistaDAO = new ConquistaDAO();
    private ChatDAO chatDAO = new ChatDAO(); // Novo DAO injetado

    public void processarGanhoXp(Usuario usuario, int xpGanhado) {
        int novoXpTotal = usuario.getXp() + xpGanhado;
        usuario.setXp(novoXpTotal);

        int novoNivel = (novoXpTotal / 100) + 1;

        if (novoNivel > usuario.getNivel()) {
            usuario.setNivel(novoNivel);
            usuarioDAO.atualizarProgresso(usuario.getId(), novoXpTotal, novoNivel);
        } else {
            usuarioDAO.atualizarProgresso(usuario.getId(), novoXpTotal, usuario.getNivel());
        }

        // GATILHO DE CONQUISTA COM DISPARO NO CHAT
        boolean ganhouConquista = conquistaDAO.concederConquista(usuario.getId(), "PRIMEIRA_MISSAO");

        if (ganhouConquista) {
            int xpBonusConquista = 50;
            int xpComBonus = usuario.getXp() + xpBonusConquista;
            usuario.setXp(xpComBonus);

            int nivelComBonus = (xpComBonus / 100) + 1;
            usuario.setNivel(nivelComBonus);
            usuarioDAO.atualizarProgresso(usuario.getId(), xpComBonus, nivelComBonus);

            // 1. TEXTO DO ANÚNCIO GLOBAL
            String mensagemConquista = "🚀 Desbloqueou a conquista 'Primeiro Passo' e ganhou +50 XP bônus!";

            // 2. PERSISTÊNCIA: Salva o anúncio no banco de dados do chat
            chatDAO.salvarMensagem(usuario.getId(), mensagemConquista);

            // 3. REAL-TIME: Dispara via WebSocket para todos os usuários conectados
            String jsonWebsocket = "{\"user\":\"" + usuario.getNome() + "\", \"text\":\"" + mensagemConquista + "\"}";
            ChatEndpoint.transmitirMensagemGlobal(jsonWebsocket);
        }
    }

    public Usuario atualizarStreak(Usuario usuario) {
        LocalDate hoje = LocalDate.now();
        LocalDate ultimoAcesso = usuario.getUltimoAcesso();

        if (ultimoAcesso == null) {
            usuario.setStreak(1);
        } else {
            long dias = ChronoUnit.DAYS.between(ultimoAcesso, hoje);
            if (dias == 1) {
                usuario.setStreak(usuario.getStreak() + 1);
            } else if (dias > 1) {
                usuario.setStreak(1);
            }
        }
        usuario.setUltimoAcesso(hoje);
        usuarioDAO.atualizarStreak(usuario);
        return usuario;
    }
}