<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Preencha a Lacuna | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/desafio.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lacuna.css">
</head>
<body>
    <div class="container">
        <h2>${desafio.titulo}</h2>
        <p>${desafio.enunciado}</p>

        <form action="${pageContext.request.contextPath}/desafios" method="POST">
            <input type="hidden" name="desafioId" value="${desafio.id}">

            <div class="sentence-box">
                <span>${desafio.textoAntes}</span>
                <input type="text" name="resposta" class="input-lacuna" autofocus required>
                <span>${desafio.textoDepois}</span>
            </div>

            <button type="submit" class="btn-main">VERIFICAR</button>
        </form>
    </div>
</body>
</html>