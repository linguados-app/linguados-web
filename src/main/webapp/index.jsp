<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Linguados | Learn English</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@800&display=swap" rel="stylesheet">
</head>
<body>
    <nav class="top-nav">
        <div class="logo">🦆 Linguados</div>
        <div>
            <a href="login">Entrar</a>
            <a href="cadastro" class="btn-main" style="padding: 10px 20px;">Começar</a>
        </div>
    </nav>

    <main class="hero">
        <span class="duck-logo">🦆</span>
        <h1>Domine o Inglês Técnico <br><span class="text-purple">codando.</span></h1>
        <p style="font-size: 20px; color: var(--text-gray); margin-bottom: 30px;">A plataforma inspirada no Duolingo para quem fala a língua do código.</p>
        <a href="cadastro" class="btn-main">Criar conta gratuita</a>
    </main>

    <section class="features">
        <div class="feat-card">
            <h3>Gamificação</h3>
            <p>XP, níveis e streaks para manter você focado.</p>
        </div>
        <div class="feat-card">
            <h3>Documentação Real</h3>
            <p>Aprenda com textos da MDN, React e JavaDocs.</p>
        </div>
    </section>
</body>
</html>