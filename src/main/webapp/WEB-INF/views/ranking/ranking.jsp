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

    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo"><span class="text-purple">L</span><span class="logo-text"> Linguados</span></div>
        </div>
        <nav style="display:flex; flex-direction:column; gap:10px; flex-grow:1; padding: 20px 0;">
            <%-- Esta linha identifica automaticamente em que página o utilizador está --%>
            <c:set var="currentPage" value="${requestScope['jakarta.servlet.forward.servlet_path'] != null ? requestScope['jakarta.servlet.forward.servlet_path'] : pageContext.request.servletPath}" />

            <a href="${pageContext.request.contextPath}/dashboard" class="nav-link ${currentPage.contains('dashboard') ? 'active' : ''}">
                📊 <span class="nav-text">Dashboard</span>
            </a>
            <a href="${pageContext.request.contextPath}/lessons" class="nav-link ${currentPage.contains('lessons') ? 'active' : ''}">
                📖 <span class="nav-text">Lessons</span>
            </a>
            <a href="${pageContext.request.contextPath}/ranking" class="nav-link ${currentPage.contains('ranking') ? 'active' : ''}">
                🏆 <span class="nav-text">Ranking</span>
            </a>
            <a href="${pageContext.request.contextPath}/chat" class="nav-link ${currentPage.contains('chat') ? 'active' : ''}">
                💬 <span class="nav-text">Chat</span>
            </a>
            <a href="${pageContext.request.contextPath}/perfil" class="nav-link ${currentPage.contains('perfil') ? 'active' : ''}">
                👤 <span class="nav-text">Perfil</span>
            </a>
            <a href="${pageContext.request.contextPath}/sobre" class="nav-link ${currentPage.contains('sobre') ? 'active' : ''}">
                🦆 <span class="nav-text">Sobre Nós</span>
            </a>
        </nav>
    </aside>

    <main class="main-content">
            <section class="ranking-section">

                <div class="card ranking-card">

                    <div class="ranking-card-header">
                        <img src="${pageContext.request.contextPath}/assets/img/linguado.png" alt="Mascote Pato" class="ranking-pato-img" onerror="this.src='https://fonts.gstatic.com/s/e/notoemoji/latest/1f986/512.webp';">
                        <div>
                            <small class="dashboard-label">LEADERBOARD</small>
                            <h2>Liga Linguado</h2>
                        </div>
                    </div>

                    <div class="ranking-list">
                        <c:forEach var="u" items="${listaRanking}" varStatus="loop">

                            <c:set var="isCurrentUser" value="${u.nome eq usuarioLogado.nome}" />

                            <div class="ranking-item
                                ${loop.index == 0 ? 'rank-first' : ''}
                                ${loop.index == 1 ? 'rank-second' : ''}
                                ${loop.index == 2 ? 'rank-third' : ''}
                                ${isCurrentUser ? 'rank-active-user' : ''}">

                                <div class="rank-pos">
                                    ${loop.index + 1}
                                </div>

                                <div class="rank-name">
                                    <strong>${u.nome} <c:if test="${isCurrentUser}"><span class="you-badge">(Você)</span></c:if></strong>
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