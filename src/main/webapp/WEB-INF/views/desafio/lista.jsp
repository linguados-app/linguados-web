<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lições Disponíveis | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/desafio.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lista.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800&display=swap" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container py-5">
        <header class="header-lista">
            <a href="${pageContext.request.contextPath}/dashboard" class="btn-back">← Voltar</a>
            <h1 class="text-purple">Suas Lições</h1>
        </header>

        <c:if test="${param.feedback == 'acertou'}">
            <div class="alert alert-success">✨ Mandou bem! Você ganhou XP!</div>
        </c:if>

    <a class="btn-add"
       <a href="${pageContext.request.contextPath}/admin/desafio/form?idModulo=${modulo.id}">
        + Novo Desafio
    </a>
    
        <div class="grid-desafios">
            <c:choose>
                <c:when test="${not empty listaDesafios}">
                    <c:forEach var="desafio" items="${listaDesafios}">
                        <div class="card-desafio">
                            <div class="card-info">
                                <span class="badge-tipo">${desafio.tipo}</span>
                                <h3>${desafio.titulo}</h3>
                                <p class="xp-val">✨ ${desafio.xpRecompensa} XP</p>
                            </div>
                            <a href="${pageContext.request.contextPath}/desafios?id=${desafio.id}" class="btn-play">
                                COMEÇAR
                            </a>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <p>Nenhum desafio encontrado no banco de dados. 🦆</p>
                        <small>Verifique se o seu setup.sql rodou corretamente.</small>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</body>
</html>