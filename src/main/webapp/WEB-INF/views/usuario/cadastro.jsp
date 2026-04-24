<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Criar Conta | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cadastro.css">
    <link href="https://fonts.googleapis.com/css2?family=SF+Pro+Display:wght@400;600&family=Nunito:wght@700;800&display=swap" rel="stylesheet">
</head>
<body>

    <div class="cadastro-container">
        <div class="cadastro-card">
            <div style="font-size: 50px; margin-bottom: 10px;">🎨</div>
            <h2>Junte-se ao time</h2>
            <p class="subtitle">Crie sua conta para começar a ganhar XP!</p>

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