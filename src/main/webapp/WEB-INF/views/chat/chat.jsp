<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Global Chat | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/chat.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800&display=swap" rel="stylesheet">
</head>
<body class="dashboard-body">

    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo"><span class="text-purple">L</span><span class="logo-text"> Linguados</span></div>
        </div>
        <nav style="display:flex; flex-direction:column; gap:10px; flex-grow:1; padding: 20px 0;">
            <a href="${pageContext.request.contextPath}/dashboard" class="nav-link">📊 <span class="nav-text">Dashboard</span></a>
            <a href="${pageContext.request.contextPath}/desafios" class="nav-link">📖 <span class="nav-text">Lessons</span></a>
            <a href="${pageContext.request.contextPath}/ranking" class="nav-link">🏆 <span class="nav-text">Ranking</span></a>
            <a href="${pageContext.request.contextPath}/chat" class="nav-link active">💬 <span class="nav-text">Chat</span></a>
            <a href="${pageContext.request.contextPath}/perfil" class="nav-link">👤 <span class="nav-text">Perfil</span></a>
        </nav>
    </aside>

    <main class="main-content">
        <section class="chat-container card">
            <div class="chat-header">
                <h2>Global Chat 🌍</h2>
                <small>Compartilhe suas conquistas com outros Linguados</small>
            </div>

            <div id="chat-window" class="chat-window">
                <c:forEach var="msg" items="${historicoChat}">
                    <div class="message ${msg[0] == usuarioLogado.nome ? 'sent' : 'received'}">
                        <div class="msg-content">
                            <small>${msg[0]}</small>
                            <p>${msg[1]}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="chat-input-area">
                <input type="text" id="message-input" placeholder="Digite sua mensagem..." autocomplete="off">
                <button id="send-btn">ENVIAR</button>
            </div>
        </section>
    </main>

    <script>
        const wsProtocol = window.location.protocol === "https:" ? "wss://" : "ws://";
        const wsUri = wsProtocol + window.location.host + "${pageContext.request.contextPath}/chatServer";
        const websocket = new WebSocket(wsUri);

        const chatWindow = document.getElementById('chat-window');
        const messageInput = document.getElementById('message-input');
        const sendBtn = document.getElementById('send-btn');
        const userName = "${usuarioLogado.nome}";

        // Faz o scroll rolar automático para o final do histórico ao carregar
        chatWindow.scrollTop = chatWindow.scrollHeight;

        websocket.onmessage = function(evt) {
            const data = JSON.parse(evt.data);
            appendMessage(data);
        };

        function appendMessage(data) {
            const msgDiv = document.createElement('div');
            msgDiv.className = data.user === userName ? 'message sent' : 'message received';
            msgDiv.innerHTML = `
                <div class="msg-content">
                    <small>\${data.user}</small>
                    <p>\${data.text}</p>
                </div>
            `;
            chatWindow.appendChild(msgDiv);
            chatWindow.scrollTop = chatWindow.scrollHeight;
        }

        function sendMessage() {
            const text = messageInput.value.trim();
            if (text !== "") {
                const msg = JSON.stringify({ user: userName, text: text });
                websocket.send(msg);

                // Salva mensagens enviadas por texto via requisição assíncrona POST
                fetch("${pageContext.request.contextPath}/chat", {
                    method: "POST",
                    headers: { "Content-Type": "application/x-www-form-urlencoded" },
                    body: "texto=" + encodeURIComponent(text)
                });

                messageInput.value = "";
            }
        }

        sendBtn.onclick = sendMessage;
        messageInput.onkeypress = (e) => { if(e.key === 'Enter') sendMessage(); };
    </script>
</body>
</html>