<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Tradução | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/desafio.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/traducao.css">
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
            <small class="instruction">Traduza esta frase para o português</small>

            <div class="phrase-to-translate">
                <div class="duck-icon">🦆</div>

                <%-- FALLBACK SEGURO: Se o getter do enunciado falhar por polimorfismo, tentamos usar o título ou um fallback --%>
                <div class="bubble">
                    <c:choose>
                        <c:when test="${not empty desafio.enunciado}">
                            ${desafio.enunciado}
                        </c:when>
                        <c:otherwise>
                            <span style="color:#8b8ea1; font-style:italic;">[Sem texto cadastrado no enunciado]</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <form action="${pageContext.request.contextPath}/lessons" method="POST">
                <input type="hidden" name="desafioId" value="${desafio.id}">

                <textarea
                    name="resposta"
                    class="input-traducao ${param.feedback == 'errou' ? 'shake' : ''}"
                    placeholder="Digite a tradução aqui..."
                    autofocus
                    required></textarea>

                <c:if test="${param.feedback == 'errou'}">
                    <div class="feedback-error-msg" style="color: #e03131; font-weight: bold; margin-top: 15px; text-align: center; font-family: 'Nunito', sans-serif;">
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