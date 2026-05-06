<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Múltipla Escolha | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/desafio.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/multipla_escolha.css">
</head>
<body>
    <div class="resolver-container">
        <h2>${desafio.titulo}</h2>
        <p class="enunciado">${desafio.enunciado}</p>

        <form action="${pageContext.request.contextPath}/desafios" method="POST">
            <input type="hidden" name="desafioId" value="${desafio.id}">

            <div class="options-grid">
                <c:forEach var="opcao" items="${desafio.listaOpcoes}">
                    <label class="option-card">
                        <input type="radio" name="resposta" value="${opcao}" required>
                        <span class="option-text">${opcao}</span>
                    </label>
                </c:forEach>
            </div>

            <button type="submit" class="btn-check">VERIFICAR</button>
        </form>
    </div>
</body>
</html>