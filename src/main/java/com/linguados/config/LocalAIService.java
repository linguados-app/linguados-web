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

            String prompt = String.format(
                    "Sua única tarefa é atuar como um classificador semântico binário estrito.\n" +
                    "Você deve avaliar se a resposta enviada por um estudante de programação tem sentido " +
                    "equivalente, aproximado ou relacionável ao gabarito esperado.\n\n" +

                    "[REGRA DE TOLERÂNCIA CALIBRADA]\n" +
                    "- Seja flexível com sinônimos reais, gírias técnicas ou explicações conceituais (ex: 'vazio', 'nada', 'sem retorno' para o gabarito 'void').\n" +
                    "- CRÍTICO: Se a resposta do aluno significar o OPOTO, o ANTÔNIMO ou uma contradição direta do gabarito (ex: gabarito é 'vazio'/'void' e o aluno responde 'cheio'), você deve classificar como INCORRETO.\n" +
                    "- Respostas incorretas por contradição nunca devem ser aceitas.\n\n" +

                    "[EXEMPLOS DE VALIDAÇÃO]\n" +
                    "- Gabarito: 'void' | Aluno: 'vazio' -> Resposta: CORRETO\n" +
                    "- Gabarito: 'void' | Aluno: 'não retorna nada' -> Resposta: CORRETO\n" +
                    "- Gabarito: 'void' | Aluno: 'cheio' -> Resposta: INCORRETO\n" +
                    "- Gabarito: 'database' | Aluno: 'banco de dados' -> Resposta: CORRETO\n" +
                    "- Gabarito: 'loop' | Aluno: 'estrutura de repetição' -> Resposta: CORRETO\n\n" +

                    "[DADOS PARA AVALIAÇÃO]\n" +
                    "<gabarito>%s</gabarito>\n" +
                    "<resposta_aluno>%s</resposta_aluno>\n\n" +

                    "[RESTRIÇÃO CRÍTICA ABSOLUTA]\n" +
                    "Sua resposta deve conter EXATAMENTE E APENAS uma das duas palavras: CORRETO ou INCORRETO.\n" +
                    "Não inclua mais nenhuma letra, pontuação ou justificativa. Responda apenas com a palavra seca.",
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
                    "Sua única tarefa é atuar como um Tutor de Inglês Técnico focado em micro-feedbacks.\n" +
                    "Um estudante errou um desafio e você deve fornecer uma dica pedagógica curtíssima.\n\n" +

                    "[REGRAS DE CONSTRUÇÃO DA DICA]\n" +
                    "- NUNCA dê a resposta correta ou a tradução direta.\n" +
                    "- NÃO justifique o erro e NÃO use frases de efeito (ex: 'Quase lá!', 'Você errou porque...').\n" +
                    "- Foque na palavra-chave técnica que gerou a confusão.\n" +
                    "- A dica deve conter apenas uma frase direta com menos de 10 palavras.\n\n" +

                    "[EXEMPLOS DE DICAS CURTAS]\n" +
                    "- Enunciado: 'loops' | Resposta do Aluno: 'linhas' -> Dica: Pense em estruturas que repetem o código.\n" +
                    "- Enunciado: 'database' | Resposta do Aluno: 'dados' -> Dica: Refere-se ao local onde armazenamos as tabelas.\n" +
                    "- Enunciado: 'Framework' | Resposta do Aluno: 'trabalho' -> Dica: É uma estrutura ou conjunto de ferramentas prontas.\n\n" +

                    "[DADOS DO ERRO ATUAL]\n" +
                    "<enunciado_desafio>%s</enunciado_desafio>\n" +
                    "<resposta_incorreta_aluno>%s</resposta_incorreta_aluno>\n\n" +

                    "[GATILHO DE SAÍDA]\n" +
                    "Escreva apenas a micro-dica seca, sem saudações, sem aspas e sem texto adicional.\n" +
                    "Dica:",
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