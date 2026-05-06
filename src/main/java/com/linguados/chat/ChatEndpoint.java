package com.linguados.chat;

import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

@ServerEndpoint("/chatServer")
public class ChatEndpoint {

    private static final Set<Session> sessions = new CopyOnWriteArraySet<>();

    @OnOpen
    public void onOpen(Session s) { sessions.add(s); }

    @OnMessage
    public void onMessage(String msg, Session session) throws IOException {
        for (Session s : sessions) {
            if (s.isOpen()) s.getBasicRemote().sendText(msg);
        }
    }

    @OnClose
    public void onClose(Session s) { sessions.remove(s); }

    @OnError
    public void onError(Throwable t) { t.printStackTrace(); }
}