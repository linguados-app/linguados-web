package com.linguados.usuario;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class UsuarioService {
    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    public Usuario atualizarStreak(Usuario usuario) {
        LocalDate hoje = LocalDate.now();
        LocalDate ultimoAcesso = usuario.getUltimoAcesso();

        if (ultimoAcesso == null) {
            usuario.setStreak(1);
        } else {
            long dias = ChronoUnit.DAYS.between(ultimoAcesso, hoje);

            if (dias == 1) {
                usuario.setStreak(usuario.getStreak() + 1);
            } else if (dias > 2) {
                usuario.setStreak(1);
            }
        }

        usuario.setUltimoAcesso(hoje);
        usuarioDAO.atualizarStreak(usuario);
        return usuario;
    }
}
