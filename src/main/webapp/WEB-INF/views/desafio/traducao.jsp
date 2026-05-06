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
            <a href="${pageContext.request.contextPath}/desafios" class="btn-close">✕</a>
            <div class="progress-container">
                <div class="progress-bar" style="width: 30%"></div>
            </div>
            <span class="xp-badge-top">✨ ${desafio.xpRecompensa} XP</span>
        </header>

        <main class="challenge-box">
            <small class="instruction">Traduza esta frase</small>

            <div class="phrase-to-translate">
                <div class="duck-icon">🦆</div>
                <div class="bubble">${desafio.enunciado}</div>
            </div>

            <form action="${pageContext.request.contextPath}/desafios" method="POST">
                <input type="hidden" name="desafioId" value="${desafio.id}">

                <textarea
                    name="resposta"
                    class="input-traducao ${param.feedback == 'errou' ? 'shake' : ''}"
                    placeholder="Digite a tradução aqui..."
                    autofocus
                    required></textarea>

                <div class="footer-controls">
                    <button type="submit" class="btn-verificar">VERIFICAR</button>
                </div>
            </form>
        </main>
    </div>

</body>
</html>