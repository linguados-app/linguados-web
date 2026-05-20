package com.linguados.usuario;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class UsuarioService {
    private UsuarioDAO usuarioDAO = new UsuarioDAO();
    private ConquistaDAO conquistaDAO = new ConquistaDAO(); // Injetando o novo DAO

    /**
     * Calcula o nível baseado no XP, atualiza o objeto, o banco de dados
     * e dispara gatilhos de conquistas (Achievements).
     */
    public void processarGanhoXp(Usuario usuario, int xpGanhado) {
        int novoXpTotal = usuario.getXp() + xpGanhado;
        usuario.setXp(novoXpTotal);

        // Lógica de Level Up: 1 nível a cada 100 XP
        int novoNivel = (novoXpTotal / 100) + 1;

        if (novoNivel > usuario.getNivel()) {
            usuario.setNivel(novoNivel);
            // Sincroniza o novo nível e XP no banco
            usuarioDAO.atualizarProgresso(usuario.getId(), novoXpTotal, novoNivel);
        } else {
            // Se não subiu de nível, ainda precisamos atualizar o XP no banco!
            usuarioDAO.atualizarProgresso(usuario.getId(), novoXpTotal, usuario.getNivel());
        }

        // ==========================================
        // GATILHO DE CONQUISTAS (TRIGGERS)
        // ==========================================

        // Tenta conceder a conquista da primeira missão.
        // O método concederConquista já checa internamente se o usuário já tem ela.
        boolean ganhouConquista = conquistaDAO.concederConquista(usuario.getId(), "PRIMEIRA_MISSAO");

        if (ganhouConquista) {
            // Se ganhou a badge agora, recebe +50 XP de bônus!
            int xpBonusConquista = 50;
            int xpComBonus = usuario.getXp() + xpBonusConquista;
            usuario.setXp(xpComBonus);

            // Recalcula o nível caso o bônus da conquista faça ele upar
            int nivelComBonus = (xpComBonus / 100) + 1;
            usuario.setNivel(nivelComBonus);

            // Salva a bonificação final no banco de dados
            usuarioDAO.atualizarProgresso(usuario.getId(), xpComBonus, nivelComBonus);
            System.out.println("[TRIGGER] Usuario " + usuario.getNome() + " desbloqueou a conquista: PRIMEIRA_MISSAO (+50 XP)");
        }
    }

    /**
     * Atualiza o contador de dias seguidos (Streak) do usuário.
     */
    public Usuario atualizarStreak(Usuario usuario) {
        LocalDate hoje = LocalDate.now();
        LocalDate ultimoAcesso = usuario.getUltimoAcesso();

        if (ultimoAcesso == null) {
            usuario.setStreak(1);
        } else {
            long dias = ChronoUnit.DAYS.between(ultimoAcesso, hoje);
            if (dias == 1) {
                usuario.setStreak(usuario.getStreak() + 1);
            } else if (dias > 1) { // Perdeu o streak se passou mais de 1 dia
                usuario.setStreak(1);
            }
        }

        usuario.setUltimoAcesso(hoje);
        usuarioDAO.atualizarStreak(usuario);
        return usuario;
    }
}