<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Dashboard | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800&display=swap" rel="stylesheet">
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

        <nav style="display:flex; flex-direction:column; gap:10px; flex-grow:1; padding: 20px 0;">
            <a href="${pageContext.request.contextPath}/dashboard" class="nav-link active">
                📊 <span class="nav-text">Dashboard</span>
            </a>
            <a href="${pageContext.request.contextPath}/desafios" class="nav-link">
                📖 <span class="nav-text">Lessons</span>
            </a>
            <a href="${pageContext.request.contextPath}/ranking" class="nav-link">
                🏆 <span class="nav-text">Ranking</span>
            </a>
            <a href="${pageContext.request.contextPath}/chat" class="nav-link">
                💬 <span class="nav-text">Chat</span>
            </a>
            <a href="${pageContext.request.contextPath}/perfil" class="nav-link">
                👤 <span class="nav-text">Perfil</span>
            </a>
        </nav>

        <div class="user-info-footer">
            <img src="${pageContext.request.contextPath}/assets/img/avatar.png" alt="Foto do usuário" class="user-avatar"/>
            <div class="user-meta">
                <strong>${usuarioLogado.nome}</strong>
                <small class="text-gray">Level ${usuarioLogado.nivel}</small>
            </div>
        </div>
    </aside>

    <main class="main-content">
        <c:if test="${not empty param.mensagemConcluido}">
            <div class="alert-success">
                <span style="font-size: 20px;">🏆</span>
                <div>${param.mensagemConcluido}</div>
            </div>
        </c:if>

        <section class="hero-grid">
            <div class="dashboard-card welcome-card">
                <div class="welcome-content">
                    <small class="dashboard-label">WELCOME BACK</small>
                    <h1>Welcome back, ${usuarioLogado.nome}! 👋</h1>
                    <p class="dashboard-subtitle">Continue de onde parou e avance mais um passo na sua jornada de aprendizado.</p>
                </div>
            </div>

            <div class="dashboard-card duck-card">
                <div class="duck-emoji">🦆</div>
                <div>
                    <small class="dashboard-label">LINGUADOS TIP</small>
                    <h3>One lesson at a time.</h3>
                    <p class="dashboard-subtitle">Pequenos passos diários geram progresso real.</p>
                </div>
            </div>
        </section>

        <section class="stats-grid">
            <div class="dashboard-card dashboard-stat-card">
                <span class="stat-icon">⭐</span>
                <div>
                    <small class="dashboard-label">Total XP</small>
                    <strong>${usuarioLogado.xp}</strong>
                </div>
            </div>
            <div class="dashboard-card dashboard-stat-card">
                <span class="stat-icon">🏆</span>
                <div>
                    <small class="dashboard-label">Level</small>
                    <strong>${usuarioLogado.nivel}</strong>
                </div>
            </div>
            <div class="dashboard-card dashboard-stat-card">
                <span class="stat-icon">🔥</span>
                <div>
                    <small class="dashboard-label">Streak</small>
                    <strong>${usuarioLogado.streak} days</strong>
                </div>
            </div>
            <div class="dashboard-card dashboard-stat-card">
                <span class="stat-icon">🎯</span>
                <div>
                    <small class="dashboard-label">Daily Goal</small>
                    <strong>${licoesHoje} / 5 lessons</strong>
                </div>
            </div>
        </section>

        <div class="lower-grid">
            <!-- WEEKLY ACTIVITY - CORRIGIDO -->
            <section class="dashboard-card weekly-card">
                <div class="section-header">
                    <div>
                        <small class="dashboard-label">WEEKLY ACTIVITY</small>
                        <h2>Your progress this week</h2>
                    </div>
                </div>

                <div class="weekly-chart-wrapper">
                    <div class="weekly-bars">
                        <c:set var="maxAtividade" value="0"/>
                        <c:forEach items="${atividadeSemana}" var="atividade">
                            <c:if test="${atividade > maxAtividade}">
                                <c:set var="maxAtividade" value="${atividade}"/>
                            </c:if>
                        </c:forEach>

                        <c:set var="maxHeight" value="${maxAtividade > 0 ? maxAtividade : 5}"/>

                        <!-- Segunda -->
                        <div class="bar-item">
                            <div class="bar-container">
                                <div class="bar" style="height: ${(atividadeSemana[0] / maxHeight) * 180}px;">
                                    <span class="bar-value">${atividadeSemana[0]}</span>
                                </div>
                            </div>
                            <span class="bar-day">Mon</span>
                        </div>

                        <!-- Terça -->
                        <div class="bar-item">
                            <div class="bar-container">
                                <div class="bar" style="height: ${(atividadeSemana[1] / maxHeight) * 180}px;">
                                    <span class="bar-value">${atividadeSemana[1]}</span>
                                </div>
                            </div>
                            <span class="bar-day">Tue</span>
                        </div>

                        <!-- Quarta -->
                        <div class="bar-item">
                            <div class="bar-container">
                                <div class="bar" style="height: ${(atividadeSemana[2] / maxHeight) * 180}px;">
                                    <span class="bar-value">${atividadeSemana[2]}</span>
                                </div>
                            </div>
                            <span class="bar-day">Wed</span>
                        </div>

                        <!-- Quinta -->
                        <div class="bar-item">
                            <div class="bar-container">
                                <div class="bar" style="height: ${(atividadeSemana[3] / maxHeight) * 180}px;">
                                    <span class="bar-value">${atividadeSemana[3]}</span>
                                </div>
                            </div>
                            <span class="bar-day">Thu</span>
                        </div>

                        <!-- Sexta -->
                        <div class="bar-item">
                            <div class="bar-container">
                                <div class="bar" style="height: ${(atividadeSemana[4] / maxHeight) * 180}px;">
                                    <span class="bar-value">${atividadeSemana[4]}</span>
                                </div>
                            </div>
                            <span class="bar-day">Fri</span>
                        </div>

                        <!-- Sábado -->
                        <div class="bar-item">
                            <div class="bar-container">
                                <div class="bar" style="height: ${(atividadeSemana[5] / maxHeight) * 180}px;">
                                    <span class="bar-value">${atividadeSemana[5]}</span>
                                </div>
                            </div>
                            <span class="bar-day">Sat</span>
                        </div>

                        <!-- Domingo -->
                        <div class="bar-item">
                            <div class="bar-container">
                                <div class="bar" style="height: ${(atividadeSemana[6] / maxHeight) * 180}px;">
                                    <span class="bar-value">${atividadeSemana[6]}</span>
                                </div>
                            </div>
                            <span class="bar-day">Sun</span>
                        </div>
                    </div>
                </div>
            </section>

            <!-- IN PROGRESS -->
            <section class="dashboard-card trails-card">
                <div class="section-header">
                    <div>
                        <small class="dashboard-label">IN PROGRESS</small>
                        <h2>Knowledge paths</h2>
                    </div>
                </div>

                <div class="trails-grid">
                    <c:choose>
                        <c:when test="${not empty modulosProgresso}">
                            <c:forEach items="${modulosProgresso}" var="modulo">
                                <div class="trail-item">
                                    <div class="trail-top">
                                        <div>
                                            <h3>${modulo.titulo}</h3>
                                            <p>${modulo.concluidos} of ${modulo.totalDesafios} lessons</p>
                                        </div>
                                        <span class="trail-percentage">${modulo.porcentagem}%</span>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-fill" style="width: ${modulo.porcentagem}%"></div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="trail-item">
                                <div class="trail-top">
                                    <div>
                                        <h3>Nenhum módulo iniciado</h3>
                                        <p>Comece uma lição para ver seu progresso!</p>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </section>
        </div>

        <footer class="dashboard-footer">
            <a href="${pageContext.request.contextPath}/admin/modulos" class="admin-link">
                ⚙️ Gerenciar módulos e conteúdos
            </a>
        </footer>
    </main>

    <script src="${pageContext.request.contextPath}/assets/js/dashboard.js"></script>
</body>
</html>