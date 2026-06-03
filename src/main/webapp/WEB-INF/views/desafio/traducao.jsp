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

                    <%-- Componente Visual: Balão de Feedback Inteligente gerado pelo Ollama --%>
                    <c:if test="${not empty dicaIA}">
                        <div class="tutor-ia-bubble" style="background: #f1edff; border: 2px solid #6c4cff; border-bottom: 5px solid #5436db; padding: 16px; border-radius: 20px; margin-top: 20px; color: #3c3c3c; font-size: 14px; font-family: 'Nunito', sans-serif; font-weight: 700; line-height: 1.4; box-shadow: 0 4px 12px rgba(108, 76, 255, 0.08);">
                            🤖 <strong style="color: #6c4cff;">Dica do Tutor IA:</strong> ${dicaIA}
                        </div>
                    </c:if>
                </c:if>

                <div class="footer-controls">
                    <button type="submit" class="btn-verificar">VERIFICAR</button>
                </div>
            </form>
        </main>
    </div>

</body>
</html>