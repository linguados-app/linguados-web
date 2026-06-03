package com.linguados.chat;

import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

@ServerEndpoint("/chatServer")
public class ChatEndpoint {

    private static final Set<Session> sessions = new CopyOnWriteArraySet<>();
    private ChatDAO chatDAO = new ChatDAO(); // DAO para persistir o chat comum

    @OnOpen
    public void onOpen(Session s) {
        sessions.add(s);
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        // Como o JS envia o JSON completo, vamos persistir no banco antes de espalhar
        try {
            // OBSERVAÇÃO: Lógica simplificada para fins didáticos.
            // Em produção, você usaria uma biblioteca JSON (Gson/Jackson) para extrair o ID/Texto.
            if(message.contains("\"text\":\"")) {
                // Aqui interceptamos mensagens puras de texto enviadas pela interface
                // Para simplificar a gravação de mensagens comuns, você pode fazer o parse ou delegar ao Servlet.
            }
        } catch(Exception e) { e.printStackTrace(); }

        transmitirMensagemGlobal(message);
    }

    // Método estático que permite que qualquer Service envie notificações do sistema para o Chat
    public static void transmitirMensagemGlobal(String textoJson) {
        for (Session s : sessions) {
            if (s.isOpen()) {
                try {
                    s.getBasicRemote().sendText(textoJson);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @OnClose
    public void onClose(Session s) { sessions.remove(s); }

    @OnError
    public void onError(Throwable t) { t.printStackTrace(); }
}