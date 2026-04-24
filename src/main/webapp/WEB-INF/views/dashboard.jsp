<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Dashboard | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800&family=SF+Pro+Display:wght@400;600&display=swap" rel="stylesheet">

</head>
<body class="dashboard-body">

    <aside class="sidebar">
        <div class="sidebar-logo">
            <span class="logo-icon">L</span> Linguados
        </div>

        <nav class="sidebar-nav">
            <a href="dashboard" class="active">📊 Dashboard</a>
            <a href="licoes">📖 Lessons</a>
            <a href="desafios">⚡ Challenges</a>
            <a href="ranking">🏆 Ranking</a>
        </nav>

        <div class="sidebar-user">
            <div class="user-avatar">
                <img src="https://api.dicebear.com/7.x/avataaars/svg?seed=${usuarioLogado.nome}" alt="Avatar">
            </div>
            <div class="user-info">
                <span class="user-name">${usuarioLogado.nome}</span>
                <span class="user-level">Level ${usuarioLogado.nivel} Coder</span>
            </div>
        </div>
    </aside>

    <main class="main-content">

        <header class="welcome-banner">
            <div class="welcome-text">
                <h1>Welcome back, ${usuarioLogado.getPrimeiroNome()}! 👋</h1>
                <p>Você está em uma sequência de 3 dias. Continue codando para bater sua meta!</p>
            </div>
            <div class="streak-mini-card">
                <span class="duck-emoji">🦆</span>
                <p>Quack! 3 dias seguidos! Vamos esmagar a meta de hoje. 🔥</p>
            </div>
        </header>

        <section class="stats-grid">
            <div class="stat-card">
                <span class="stat-icon">⭐</span>
                <div class="stat-data">
                    <span class="stat-label">TOTAL XP</span>
                    <span class="stat-value">${usuarioLogado.xp}</span>
                </div>
            </div>
            <div class="stat-card">
                <span class="stat-icon">📊</span>
                <div class="stat-data">
                    <span class="stat-label">LEVEL</span>
                    <span class="stat-value">${usuarioLogado.nivel}</span>
                </div>
            </div>
            <div class="stat-card">
                <span class="stat-icon">🔥</span>
                <div class="stat-data">
                    <span class="stat-label">STREAK</span>
                    <span class="stat-value">3 Days</span>
                </div>
            </div>
            <div class="stat-card">
                <span class="stat-label">DAILY GOAL</span>
                <div class="progress-bar-container">
                    <div class="progress-fill" style="width: 60%;"></div>
                </div>
                <span class="progress-text">60%</span>
            </div>
        </section>

        <div class="dashboard-split">
            <div class="left-col">
                <div class="daily-challenge-card">
                    <div class="challenge-info">
                        <span class="badge-mini">⚡ DAILY CHALLENGE</span>
                        <h2>API Documentation Mastery</h2>
                        <p>Aprenda os verbos essenciais para ler e escrever docs de APIs robustas.</p>
                    </div>
                    <a href="desafios" class="btn-start">Start Challenge ▶</a>
                </div>

                <h3 class="section-title">Your Learning Paths <a href="#">View All</a></h3>
                <div class="learning-grid">
                    <div class="path-card">
                        <span class="path-icon"></span>
                        <span class="level-tag beginner">Beginner</span>
                        <h4>Frontend Basics</h4>
                        <p>HTML, CSS e terminologia básica.</p>
                        <div class="progress-bar-container">
                            <div class="progress-fill green" style="width: 80%;"></div>
                        </div>
                        <button class="btn-resume">Continue Path</button>
                    </div>
                    <div class="path-card">
                        <span class="path-icon"></span>
                        <span class="level-tag intermediate">Intermediate</span>
                        <h4>Backend Architecture</h4>
                        <p>Databases, APIs e lógica de servidor.</p>
                        <div class="progress-bar-container">
                            <div class="progress-fill purple" style="width: 35%;"></div>
                        </div>
                        <button class="btn-resume">Resume</button>
                    </div>
                </div>
            </div>

            <aside class="right-col">
                <div class="activity-card">
                    <h3>Weekly Activity</h3>
                    <ul class="activity-list">
                        <li class="done"><span>Monday</span> <small>Goal Reached (+50 XP)</small></li>
                        <li class="done"><span>Tuesday</span> <small>Goal Reached (+50 XP)</small></li>
                        <li class="current"><span>Wednesday (Today)</span> <small>In Progress (60%)</small></li>
                        <li class="upcoming"><span>Thursday</span> <small>Upcoming</small></li>
                    </ul>
                    <div class="activity-footer">
                        <p>Complete mais 4 dias para desbloquear o emblema <strong>Weekly Warrior</strong>!</p>
                    </div>
                </div>
            </aside>
        </div>
    </main>

</body>
</html>