<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Linguados</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css?v=2">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css?v=2">

    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800&family=SF+Pro+Display:wght@400;600&display=swap" rel="stylesheet">
</head>
<body class="dashboard-body">

    <aside class="sidebar">
        <div class="sidebar-logo">
            <span class="logo-icon">L</span>
            <span class="logo-text">Linguados</span>
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
                <p>You're on a 3-day streak. Keep coding and learning technical English!</p>
            </div>
            <div class="streak-mini-card">
                <div class="duck-illustration">🦆</div>
                <p>Quack! 3 days strong! Let's crush today's goal. 🔥</p>
            </div>
        </header>

        <section class="stats-grid">
            <div class="stat-card">
                <span class="stat-icon purple">⭐</span>
                <div class="stat-data">
                    <span class="stat-label">TOTAL XP</span>
                    <span class="stat-value">${usuarioLogado.xp}</span>
                </div>
            </div>
            <div class="stat-card">
                <span class="stat-icon blue">📊</span>
                <div class="stat-data">
                    <span class="stat-label">LEVEL</span>
                    <span class="stat-value">${usuarioLogado.nivel}</span>
                </div>
            </div>
            <div class="stat-card">
                <span class="stat-icon orange">🔥</span>
                <div class="stat-data">
                    <span class="stat-label">STREAK</span>
                    <span class="stat-value">3 Days</span>
                </div>
            </div>
            <div class="stat-card daily-goal-card">
                <div class="goal-header">
                    <span class="stat-label">DAILY GOAL</span>
                    <span class="progress-text">60%</span>
                </div>
                <div class="progress-bar-container">
                    <div class="progress-fill purple" style="width: 60%;"></div>
                </div>
            </div>
        </section>

        <div class="dashboard-split">

            <div class="left-col">
                <div class="daily-challenge-card">
                    <div class="challenge-info">
                        <span class="badge-mini">⚡ DAILY CHALLENGE</span>
                        <h2>API Documentation Mastery</h2>
                        <p>Learn the essential verbs and structures for reading and writing robust API docs.</p>
                    </div>
                    <a href="desafios" class="btn-start">Start Challenge ▶</a>
                </div>

                <h3 class="section-title">Your Learning Paths <a href="#" class="view-all">View All</a></h3>

                <div class="learning-grid">
                    <div class="path-card">
                        <div class="path-header">
                            <span class="path-icon code-icon"></span>
                            <span class="level-tag beginner">Beginner</span>
                        </div>
                        <h4>Frontend Basics</h4>
                        <p>HTML, CSS, and basic JS terminology.</p>
                        <div class="progress-info">
                            <span>Progress</span>
                            <span>80%</span>
                        </div>
                        <div class="progress-bar-container">
                            <div class="progress-fill green" style="width: 80%;"></div>
                        </div>
                        <button class="btn-resume">Continue Path</button>
                    </div>

                    <div class="path-card">
                        <div class="path-header">
                            <span class="path-icon server-icon"></span>
                            <span class="level-tag intermediate">Intermediate</span>
                        </div>
                        <h4>Backend Architecture</h4>
                        <p>Databases, APIs, and server logic.</p>
                        <div class="progress-info">
                            <span>Progress</span>
                            <span>35%</span>
                        </div>
                        <div class="progress-bar-container">
                            <div class="progress-fill purple" style="width: 35%;"></div>
                        </div>
                        <button class="btn-resume outline">Resume</button>
                    </div>
                </div>
            </div>

            <aside class="right-col">
                <div class="activity-card">
                    <h3>Weekly Activity</h3>
                    <ul class="activity-list">
                        <li class="done">
                            <span class="check-icon">✓</span>
                            <div class="activity-info">
                                <strong>Monday</strong>
                                <small>Goal Reached (+50 XP)</small>
                            </div>
                        </li>
                        <li class="done">
                            <span class="check-icon">✓</span>
                            <div class="activity-info">
                                <strong>Tuesday</strong>
                                <small>Goal Reached (+50 XP)</small>
                            </div>
                        </li>
                        <li class="current">
                            <span class="current-icon"></span>
                            <div class="activity-info">
                                <strong>Wednesday (Today)</strong>
                                <small>In Progress (60%)</small>
                            </div>
                        </li>
                        <li class="upcoming">
                            <span class="dot-icon"></span>
                            <div class="activity-info">
                                <strong>Thursday</strong>
                                <small>Upcoming</small>
                            </div>
                        </li>
                    </ul>
                    <div class="activity-footer">
                        <span class="info-icon">i</span>
                        <p>Complete 4 more days to unlock the <strong>Weekly Warrior</strong> badge!</p>
                    </div>
                </div>
            </aside>

        </div>
    </main>

</body>
</html>