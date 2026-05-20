package com.linguados.desafio;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class FilaDesafios implements Serializable {
    private int moduloId;
    private Queue<Desafio> fila = new LinkedList<>();
    private int totalInicial;

    public FilaDesafios(int moduloId, List<Desafio> desafios) {
        this.moduloId = moduloId;
        this.fila.addAll(desafios);
        this.totalInicial = desafios.size();
    }

    public boolean temProximo() { return !fila.isEmpty(); }
    public Desafio espiarAtual() { return fila.peek(); }
    public Desafio removerAtual() { return fila.poll(); }
    public int getModuloId() { return moduloId; }
    public int getRestantes() { return fila.size(); }
    public int getTotalInicial() { return totalInicial; }
}