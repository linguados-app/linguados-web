<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Resolvendo: ${desafio.titulo} | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/resolver.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800&display=swap" rel="stylesheet">
</head>
<body style="background-color: #fff;">

    <div class="resolver-container">
        <div style="margin-bottom: 20px;">
            <span class="xp-badge">✨ VALE ${desafio.xp} XP</span>
        </div>

        <div class="pergunta-box">
            <h2 style="font-family: 'Nunito'; color: #3c3c3c;">${desafio.titulo}</h2>

            <p class="pergunta-texto">
                ${desafio.descricao}
            </p>

            <c:if test="${param.feedback == 'errou'}">
                <div class="feedback-banner feedback-errou">
                    Putz! Tente outra vez... 🦆
                </div>
            </c:if>

            <form action="desafios" method="POST">
                <input type="hidden" name="desafioId" value="${desafio.id}">

                <input type="text" name="resposta" class="input-resposta"
                       placeholder="Digite sua resposta aqui..." autocomplete="off" required autofocus>

                <button type="submit" class="btn-main" style="width: 100%; padding: 15px;">
                    VERIFICAR
                </button>
            </form>
        </div>

        <a href="desafios" style="color: #afafaf; text-decoration: none; font-weight: bold; font-size: 14px;">
            ← VOLTAR PARA A LISTA
        </a>
    </div>

</body>
</html>