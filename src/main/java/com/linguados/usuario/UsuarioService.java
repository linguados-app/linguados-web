package com.linguados.usuario;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class UsuarioService {
    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    /**
     * Calcula o nível baseado no XP e atualiza o objeto e o banco.
     */
    public void processarGanhoXp(Usuario usuario, int xpGanhado) {

        int novoXpTotal = usuario.getXp() + xpGanhado;

        int novoNivel = (novoXpTotal / 100) + 1;

        usuario.setXp(novoXpTotal);
        usuario.setNivel(novoNivel);

        usuarioDAO.atualizarProgresso(
                usuario.getId(),
                novoXpTotal,
                novoNivel
        );
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
            } else if (dias > 1) { // Perdeu o streak se passou mais de 1 dia
                usuario.setStreak(1);
            }
        }

        usuario.setUltimoAcesso(hoje);
        usuarioDAO.atualizarStreak(usuario);
        return usuario;
    }
}