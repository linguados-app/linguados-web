<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Conta | Linguados</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css?v=2">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cadastro.css?v=2">

    <link href="https://fonts.googleapis.com/css2?family=SF+Pro+Display:wght@400;600&family=Nunito:wght@700;800&display=swap" rel="stylesheet">
</head>
<body>

    <div class="cadastro-container">
        <div class="cadastro-card">
            <div style="font-size: 50px; margin-bottom: 15px;">🚀</div>

            <h2>Junte-se ao time</h2>
            <p class="subtitle">Crie sua conta para começar sua jornada no inglês técnico!</p>

            <c:if test="${param.erro == 1}">
                <div class="error-msg">
                    Ops! Este e-mail já está sendo usado ou os dados são inválidos. 🦆
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/cadastro" method="post">
                <div class="input-group">
                    <input type="text" name="nome" placeholder="Seu nome completo" required autofocus>
                </div>

                <div class="input-group">
                    <input type="email" name="email" placeholder="Seu melhor e-mail" required>
                </div>

                <div class="input-group">
                    <input type="password" name="senha" placeholder="Crie uma senha forte" required>
                </div>

                <button type="submit" class="btn-main btn-cadastro">
                    CRIAR MINHA CONTA
                </button>
            </form>

            <div class="footer-links">
                Já faz parte do Linguados? <a href="login">Fazer login</a>
            </div>
        </div>
    </div>

</body>
</html>