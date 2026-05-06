<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Perfil | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/perfil.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800&display=swap" rel="stylesheet">
</head>
<body class="dashboard-body">

    <!-- Sidebar Lateral -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo"><span class="text-purple">L</span><span class="logo-text"> Linguados</span></div>
        </div>
        <nav style="display:flex; flex-direction:column; gap:10px; flex-grow:1; padding: 20px 0;">
            <a href="${pageContext.request.contextPath}/dashboard" class="nav-link">📊 <span class="nav-text">Dashboard</span></a>
            <a href="${pageContext.request.contextPath}/desafios" class="nav-link">📖 <span class="nav-text">Lessons</span></a>
            <a href="${pageContext.request.contextPath}/ranking" class="nav-link">🏆 <span class="nav-text">Ranking</span></a>
            <a href="${pageContext.request.contextPath}/chat" class="nav-link">💬 <span class="nav-text">Chat</span></a>
            <a href="${pageContext.request.contextPath}/perfil" class="nav-link active">👤 <span class="nav-text">Perfil</span></a>
        </nav>
    </aside>

    <main class="main-content">
        <section class="profile-header-card card">
            <div class="profile-avatar">
                ${usuarioLogado.nome.substring(0,1).toUpperCase()}
            </div>
            <div class="profile-main-info">
                <h1>${usuarioLogado.nome}</h1>
                <p>${usuarioLogado.email}</p>
                <span class="badge-level">LEVEL ${usuarioLogado.nivel}</span>
            </div>
        </section>

        <section class="profile-stats-grid">
            <div class="card stat-box">
                <span class="stat-emoji">🔥</span>
                <div class="stat-data">
                    <strong>${usuarioLogado.streak}</strong>
                    <small>Day Streak</small>
                </div>
            </div>
            <div class="card stat-box">
                <span class="stat-emoji">✨</span>
                <div class="stat-data">
                    <strong>${usuarioLogado.xp}</strong>
                    <small>Total XP</small>
                </div>
            </div>
            <div class="card stat-box">
                <span class="stat-emoji">📅</span>
                <div class="stat-data">
                    <strong>${usuarioLogado.ultimoAcesso}</strong>
                    <small>Last Activity</small>
                </div>
            </div>
        </section>

        <div style="margin-top: 30px;">
             <a href="${pageContext.request.contextPath}/logout" class="btn-logout">Sair da Conta</a>
        </div>
    </main>
</body>
</html>