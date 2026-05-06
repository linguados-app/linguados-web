<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Dashboard | Linguados</title>
    <!-- CSS Unificado -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800&display=swap" rel="stylesheet">
</head>
<body class="dashboard-body">

    <!-- Sidebar Lateral -->
    <aside class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo">
                <span class="text-purple" style="font-weight:800">L</span>
                <span class="logo-text"> Linguados</span>
            </div>
            <button id="toggle-btn" class="toggle-btn">❮</button>
        </div>

        <nav style="display:flex; flex-direction:column; gap:10px; flex-grow:1; padding: 20px 0;">
            <a href="${pageContext.request.contextPath}/dashboard" class="nav-link active">
                📊 <span class="nav-text">Dashboard</span>
            </a>
            <!-- LINK CORRIGIDO PARA DESAFIOS -->
            <a href="${pageContext.request.contextPath}/desafios" class="nav-link">
                📖 <span class="nav-text">Lessons</span>
            </a>
        </nav>

        <div class="user-info-footer" style="border-top: 1px solid #eee; padding: 20px;">
            <strong>${usuarioLogado.nome}</strong><br>
            <small class="text-gray">Level ${usuarioLogado.nivel}</small>
        </div>
    </aside>

    <!-- Conteúdo Principal -->
    <main class="main-content">

        <!-- Linha 1: Boas-vindas e Dica -->
        <section class="hero-grid">
            <div class="card welcome-card">
                <div class="welcome-content">
                    <small class="card-label">WELCOME BACK</small>
                    <h1>Welcome back, ${usuarioLogado.nome}! 👋</h1>
                    <p class="card-subtitle">
                        Continue de onde parou e avance mais um passo na sua jornada de aprendizado.
                    </p>
                    <!-- BOTÃO DE ACESSO RÁPIDO -->
                    <a href="${pageContext.request.contextPath}/desafios" class="btn-main-dashboard">
                        CONTINUE LESSONS
                    </a>
                </div>
            </div>

            <div class="card duck-card">
                <div class="duck-emoji">🦆</div>
                <div>
                    <small class="card-label">LINGUADOS TIP</small>
                    <h3>One lesson at a time.</h3>
                    <p class="card-subtitle">
                        Pequenos passos diários geram progresso real.
                    </p>
                </div>
            </div>
        </section>

        <!-- Linha 2: Estatísticas -->
        <section class="stats-grid">
            <div class="card stat-card">
                <span class="stat-icon">⭐</span>
                <div>
                    <small>Total XP</small>
                    <strong>${usuarioLogado.xp}</strong>
                </div>
            </div>

            <div class="card stat-card">
                <span class="stat-icon">🏆</span>
                <div>
                    <small>Level</small>
                    <strong>${usuarioLogado.nivel}</strong>
                </div>
            </div>

            <div class="card stat-card">
                <span class="stat-icon">🔥</span>
                <div>
                    <small>Streak</small>
                    <strong>${usuarioLogado.streak} days</strong>
                </div>
            </div>

            <div class="card stat-card">
                <span class="stat-icon">🎯</span>
                <div>
                    <small>Daily Goal</small>
                    <strong>2 / 5 lessons</strong>
                </div>
            </div>
        </section>

        <!-- Linha 3: Atividade Semanal e Trilhas -->
        <div class="lower-grid">
            <section class="card weekly-card">
                <div class="section-header">
                    <div>
                        <small class="card-label">WEEKLY ACTIVITY</small>
                        <h2>Your progress this week</h2>
                    </div>
                </div>

                <div class="weekly-bars">
                    <div class="bar-item"><div class="bar" style="height:55%"></div><span>Mon</span></div>
                    <div class="bar-item"><div class="bar" style="height:80%"></div><span>Tue</span></div>
                    <div class="bar-item"><div class="bar" style="height:45%"></div><span>Wed</span></div>
                    <div class="bar-item"><div class="bar" style="height:95%"></div><span>Thu</span></div>
                    <div class="bar-item"><div class="bar" style="height:70%"></div><span>Fri</span></div>
                    <div class="bar-item"><div class="bar" style="height:30%"></div><span>Sat</span></div>
                    <div class="bar-item"><div class="bar" style="height:60%"></div><span>Sun</span></div>
                </div>
            </section>

            <section class="card trails-card">
                <div class="section-header">
                    <div>
                        <small class="card-label">IN PROGRESS</small>
                        <h2>Knowledge paths</h2>
                    </div>
                </div>

                <div class="trails-grid">
                    <div class="trail-item">
                        <div class="trail-top">
                            <div><h3>API Documentation</h3><p>4 of 8 lessons</p></div>
                            <span>50%</span>
                        </div>
                        <div class="progress-bg"><div class="progress-fill" style="width:50%"></div></div>
                    </div>

                    <div class="trail-item">
                        <div class="trail-top">
                            <div><h3>Technical Reading</h3><p>6 of 10 lessons</p></div>
                            <span>60%</span>
                        </div>
                        <div class="progress-bg"><div class="progress-fill" style="width:60%"></div></div>
                    </div>
                </div>
            </section>
        </div>

        <!-- Rodapé de Admin -->
        <footer class="dashboard-footer">
            <a href="${pageContext.request.contextPath}/admin/modulos" class="admin-link">
                ⚙️ Gerenciar módulos e conteúdos
            </a>
        </footer>
    </main>

    <script src="${pageContext.request.contextPath}/assets/js/dashboard.js"></script>
</body>
</html>