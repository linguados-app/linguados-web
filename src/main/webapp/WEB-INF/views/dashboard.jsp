<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Dashboard | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@800&display=swap" rel="stylesheet">
</head>
<body class="dashboard-body">

    <aside class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo">
                <span class="text-purple" style="font-weight:800">L</span>
                <span class="logo-text"> Linguados</span>
            </div>
            <button id="toggle-btn" class="toggle-btn">❮</button>
        </div>

        <nav style="display:flex; flex-direction:column; gap:10px; flex-grow:1;">
            <a href="#" style="text-decoration:none; color:var(--primary-purple); font-weight:bold;">📊 <span class="nav-text">Dashboard</span></a>
            <a href="desafios" style="text-decoration:none; color:var(--text-gray);">📖 <span class="nav-text">Lessons</span></a>
        </nav>

        <div class="user-info" style="border-top: 1px solid #eee; padding-top: 20px;">
            <strong>${usuarioLogado.nome}</strong><br>
            <small>Level ${usuarioLogado.nivel}</small>
        </div>
    </aside>

    <main class="main-content">
        <h1>Welcome back, ${usuarioLogado.getPrimeiroNome()}! 👋</h1>

        <section class="stats-grid">
            <div class="stat-card">⭐ <div><small>XP</small><br><strong>${usuarioLogado.xp}</strong></div></div>
            <div class="stat-card">🔥 <div><small>STREAK</small><br><strong>3 Days</strong></div></div>
        </section>

        <div class="daily-card">
            <div>
                <small>DAILY CHALLENGE</small>
                <h2>API Documentation Mastery</h2>
            </div>
            <a href="#" class="btn-main" style="background:white; color:var(--primary-purple); box-shadow:none;">Start</a>
        </div>
    </main>

    <script>
        const btn = document.getElementById('toggle-btn');
        const sidebar = document.getElementById('sidebar');

        btn.addEventListener('click', () => {
            sidebar.classList.toggle('collapsed');
        });
    </script>
</body>
</html>