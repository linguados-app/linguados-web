<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Preencha a Lacuna | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/desafio.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lacuna.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800&display=swap" rel="stylesheet">
</head>
<body class="bg-desafio">
    <div class="resolver-container">
        <header class="header-desafio">
            <a href="${pageContext.request.contextPath}/lessons?action=sair" class="btn-close" title="Encerrar maratona">✕</a>
            <div class="progress-container">
                <div class="progress-bar" style="width: ${progresso}%"></div>
            </div>
            <div class="maratona-status-badges">
                <span class="hearts-badge">
                    <c:forEach begin="1" end="${vidas}">❤️</c:forEach>
                    <c:forEach begin="1" end="${3 - vidas}">🖤</c:forEach>
                </span>
                <span class="xp-badge-top">✨ ${desafio.xpRecompensa} XP</span>
            </div>
        </header>

        <main class="challenge-box">
            <h2>${desafio.titulo}</h2>
            <p class="instruction">${desafio.enunciado}</p>

            <form action="${pageContext.request.contextPath}/lessons" method="POST">
                <input type="hidden" name="desafioId" value="${desafio.id}">

                <div class="sentence-box ${param.feedback == 'errou' ? 'shake' : ''}">
                    <span class="phrase-text">${desafio.textoAntes}</span>
                    <input type="text" name="resposta" class="input-lacuna" autocomplete="off" autofocus required>
                    <span class="phrase-text">${desafio.textoDepois}</span>
                </div>

                <c:if test="${param.feedback == 'errou'}">
                    <div class="feedback-error-msg" style="color: #e03131; font-weight: bold; margin-top: 15px; text-align: center;">
                        ❌ Resposta incorreta! Perdeste 1 vida.
                    </div>
                </c:if>

                <div class="footer-controls">
                    <button type="submit" class="btn-verificar">VERIFICAR</button>
                </div>
            </form>
        </main>
    </div>
</body>
</html>