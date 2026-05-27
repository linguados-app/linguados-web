package com.linguados.config;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import org.json.JSONObject;

public class LocalAIService {

    // Aponta internamente para o contentor de IA na rede do Docker
    private static final String OLLAMA_URL = "http://linguados-ai:11434/api/generate";

    // Modelo leve definido no ficheiro .env
    private static final String MODEL_NAME = System.getenv("AI_MODEL") != null ?
            System.getenv("AI_MODEL") : "qwen2.5:1.5b";

    public LocalAIService() {
        System.out.println("[LOCAL-AI] Serviço carregado utilizando o modelo: " + MODEL_NAME);
    }

    /**
     * Valida semanticamente a equivalência da resposta do estudante.
     */
    public boolean validarRespostaSemantica(String enunciado, String respostaCorretaBanco, String respostaUsuario) {
        try {
            HttpClient client = HttpClient.newBuilder()
                    .connectTimeout(Duration.ofSeconds(10))
                    .build();

            // Prompt simplificado e direto, otimizado para o desempenho de modelos leves de 1.5B
            String prompt = String.format(
                    "Você é um avaliador traduções de inglês.\n" +
                            "Compare a resposta do estudante com a resposta correta esperada.\n\n" +
                            "Resposta Esperada: \"%s\"\n" +
                            "Resposta do Estudante: \"%s\"\n\n" +
                            "Se estiver muito errada e sem sentido algum, responda exatamente: INCORRETO.\n\n" +
                            "Nos outros casos responda exatamente: CORRETO.\n" +
                            "Apenas responda com uma palavra (CORRETO ou INCORRETO). Não adicione mais nada.",
                    respostaCorretaBanco, respostaUsuario
            );

            JSONObject jsonBody = new JSONObject();
            jsonBody.put("model", MODEL_NAME);
            jsonBody.put("prompt", prompt);
            jsonBody.put("stream", false);

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(OLLAMA_URL))
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(jsonBody.toString()))
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() == 200) {
                JSONObject jsonResponse = new JSONObject(response.body());
                String vereditoRaw = jsonResponse.getString("response").trim().toUpperCase();

                // Remove pontuação ou espaços residuais gerados pelo modelo (Ex: "CORRETO." passa a "CORRETO")
                String vereditoLimpo = vereditoRaw.replaceAll("[^A-Z]", "");

                System.out.println("[LOCAL-AI] Resposta crua da IA: '" + vereditoRaw + "' | Veredicto limpo: '" + vereditoLimpo + "'");

                // RESOLUÇÃO DO BUG: Comparação estrita de igualdade para evitar o falso positivo com "INCORRETO"
                return "CORRETO".equals(vereditoLimpo);
            } else {
                System.err.println("[LOCAL-AI] Erro ao validar resposta. Status: " + response.statusCode());
            }
        } catch (Exception e) {
            System.err.println("[LOCAL-AI] Falha na validação semântica local:");
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Fornece dicas estruturadas sem entregar a resposta final.
     */
    public String pedirDica(String enunciado, String respostaIncorreta) {
        try {
            HttpClient client = HttpClient.newBuilder()
                    .connectTimeout(Duration.ofSeconds(10))
                    .build();

            String prompt = String.format(
                    "Você é um tutor de inglês. " +
                            "O aluno recebeu o seguinte enunciado: '%s'. " +
                            "Ele respondeu incorretamente: '%s'. " +
                            "Dê uma dica para a tradução correta, máximo 10 palavras, extremamente curta, máximo de uma linha, nenhuma a mais! Com alguma xarada. Não diga a resposta.",
                    enunciado, respostaIncorreta
            );

            JSONObject jsonBody = new JSONObject();
            jsonBody.put("model", MODEL_NAME);
            jsonBody.put("prompt", prompt);
            jsonBody.put("stream", false);

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(OLLAMA_URL))
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(jsonBody.toString()))
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() == 200) {
                JSONObject jsonResponse = new JSONObject(response.body());
                return jsonResponse.getString("response").trim();
            } else {
                System.err.println("[LOCAL-AI] Erro ao obter dica. Status: " + response.statusCode());
            }
        } catch (Exception e) {
            System.err.println("[LOCAL-AI] Falha ao obter dica local:");
            e.printStackTrace();
        }
        return "Não foi possível obter uma dica com o tutor de IA no momento.";
    }
}