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
<body class="resolver-body">

    <div class="resolver-layout">
        <!-- Header de Progresso -->
        <header class="desafio-header">
            <a href="${pageContext.request.contextPath}/desafios" class="btn-close">✕</a>
            <div class="progress-bar">
                <div class="progress-fill" style="width: 60%"></div>
            </div>
            <span class="xp-badge">✨ ${desafio.xpRecompensa} XP</span>
        </header>

        <main class="pergunta-container">
            <div class="pergunta-box card">
                <h2 class="titulo-sessao">Traduza esta frase</h2>

                <div class="duck-speech-container">
                    <span class="duck-icon">🦆</span>
                    <div class="speech-bubble">
                        <p class="pergunta-texto">${desafio.enunciado}</p>
                    </div>
                </div>

                <c:if test="${param.feedback == 'errou'}">
                    <div class="feedback-banner feedback-errou">
                        Putz! Tente outra vez... 🦆
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/desafios" method="POST" class="form-resposta">
                    <input type="hidden" name="desafioId" value="${desafio.id}">

                    <c:choose>
                        <c:when test="${desafio.tipo == 'TRADUCAO'}">
                            <textarea name="resposta" class="input-resposta"
                                      placeholder="Digite em Inglês..."
                                      required autofocus></textarea>
                        </c:when>

                        <c:when test="${desafio.tipo == 'MULTIPLA_ESCOLHA'}">
                            <div class="opcoes-grid">
                                <c:forEach var="opcao" items="${desafio.opcoes}" varStatus="loop">
                                    <label class="opcao-item">
                                        <input type="radio" name="resposta" value="${opcao}" required>
                                        <span class="opcao-box">${opcao}</span>
                                    </label>
                                </c:forEach>
                            </div>
                        </c:when>
                    </c:choose>

                    <button type="submit" class="btn-main btn-verificar">
                        VERIFICAR
                    </button>
                </form>
            </div>
        </main>

        <footer class="resolver-footer">
            <a href="desafios" class="link-voltar">← VOLTAR PARA A LISTA</a>
        </footer>
    </div>

</body>
</html>