<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Ranking | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ranking.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800&display=swap" rel="stylesheet">
</head>
<body class="dashboard-body">

    <!-- Sidebar (A mesma do seu Dashboard) -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo"><span class="text-purple">L</span><span class="logo-text"> Linguados</span></div>
        </div>
        <nav style="display:flex; flex-direction:column; gap:10px; flex-grow:1; padding: 20px 0;">
            <a href="${pageContext.request.contextPath}/dashboard" class="nav-link">📊 <span class="nav-text">Dashboard</span></a>
            <a href="${pageContext.request.contextPath}/desafios" class="nav-link">📖 <span class="nav-text">Lessons</span></a>
            <a href="${pageContext.request.contextPath}/ranking" class="nav-link active">🏆 <span class="nav-text">Ranking</span></a>
            <a href="${pageContext.request.contextPath}/chat" class="nav-link">💬 <span class="nav-text">Chat</span></a>
            <a href="${pageContext.request.contextPath}/perfil" class="nav-link">👤 <span class="nav-text">Perfil</span></a>
        </nav>
    </aside>

    <main class="main-content">
        <section class="ranking-section">
            <div class="card ranking-card">
                <div class="section-header">
                    <small class="card-label">LEADERBOARD</small>
                    <h2>Top Linguados</h2>
                </div>

                <div class="ranking-list">
                    <c:forEach var="u" items="${listaRanking}" varStatus="loop">
                        <div class="ranking-item ${loop.index < 3 ? 'top-three' : ''}">
                            <div class="rank-pos">
                                <c:choose>
                                    <c:when test="${loop.index == 0}">🥇</c:when>
                                    <c:when test="${loop.index == 1}">🥈</c:when>
                                    <c:when test="${loop.index == 2}">🥉</c:when>
                                    <c:otherwise>${loop.index + 1}</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="rank-name">
                                <strong>${u.nome}</strong>
                                <small>Level ${u.nivel}</small>
                            </div>
                            <div class="rank-xp">
                                <span>${u.xp} XP</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    </main>
</body>
</html>