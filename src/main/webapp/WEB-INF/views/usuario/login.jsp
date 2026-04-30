<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Entrar | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">
    <link href="https://fonts.googleapis.com/css2?family=SF+Pro+Display:wght@400;600&family=Nunito:wght@700;800&display=swap" rel="stylesheet">
</head>
<body>

    <div class="login-container">
        <div class="login-card">
            <div style="font-size: 50px; margin-bottom: 10px;">🦆</div>
            <h2>Entrar no Linguados</h2>

            <%-- Verifica se houve erro de login via parâmetro na URL --%>
            <% if (request.getParameter("erro") != null) { %>
                <div class="error-msg">Email ou senha incorretos. Tente novamente!</div>
            <% } %>

            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="input-group">
                    <input type="email" name="email" placeholder="E-mail ou nome de usuário" required>
                </div>
                <div class="input-group">
                    <input type="password" name="password" placeholder="Senha" required>
                </div>

                <button type="submit" class="btn-main btn-login">Entrar</button>
            </form>

            <p style="margin-top: 25px; color: #86868b;">
                Não tem uma conta? <a href="cadastro" style="color: var(--primary-purple); text-decoration: none; font-weight: bold;">Cadastre-se</a>
            </p>
        </div>
    </div>

</body>
</html>