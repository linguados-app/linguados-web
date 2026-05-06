package com.linguados.desafio;

public class DesafioLacuna extends Desafio {
    private String textoAntes;
    private String textoDepois;
    private String palavraOmitida;

    public DesafioLacuna() {
        super();
    }

    @Override
    public boolean verificarResposta(String resposta) {
        if (resposta == null || this.palavraOmitida == null) return false;
        return this.palavraOmitida.trim().equalsIgnoreCase(resposta.trim());
    }

    public String getTextoAntes() { return textoAntes; }
    public void setTextoAntes(String textoAntes) { this.textoAntes = textoAntes; }
    public String getTextoDepois() { return textoDepois; }
    public void setTextoDepois(String textoDepois) { this.textoDepois = textoDepois; }
    public String getPalavraOmitida() { return palavraOmitida; }
    public void setPalavraOmitida(String palavraOmitida) { this.palavraOmitida = palavraOmitida; }
}