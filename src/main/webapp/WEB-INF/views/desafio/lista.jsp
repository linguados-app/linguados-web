<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Desafios | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lista.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800&display=swap" rel="stylesheet">
</head>
<body style="background-color: #f7f7f7;">

    <h1 style="text-align: center; font-family: 'Nunito'; margin-top: 50px;">Escolha seu próximo desafio!</h1>

    <div class="grid-desafios">
        <%-- O c:forEach é o "for" do Java dentro do HTML --%>
        <c:forEach var="desafio" items="${listaDesafios}">
            <div class="card-desafio">
                <span class="xp-badge">${desafio.xp} XP</span>
                <h3 style="font-family: 'Nunito';">${desafio.titulo}</h3>
                <p style="color: #777;">Nível: ${desafio.nivel}</p>

                <a href="resolver?id=${desafio.id}" class="btn-main"
                   style="display: block; font-size: 14px; padding: 10px;">
                   Começar
                </a>
            </div>
        </c:forEach>
    </div>

</body>
</html>