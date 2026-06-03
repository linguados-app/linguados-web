<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Sobre Nós | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sobre.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800&display=swap" rel="stylesheet">
</head>
<body class="dashboard-body">

    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo"><span class="text-purple" style="font-weight:800">L</span><span class="logo-text"> Linguados</span></div>
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
        <section class="sobre-section">
            <div class="card sobre-card">

                <div class="sobre-header-card">
                    <img src="${pageContext.request.contextPath}/assets/img/linguado.png" alt="Mascote" class="sobre-pato-img" onerror="this.src='https://fonts.gstatic.com/s/e/notoemoji/latest/1f986/512.webp';">
                    <div>
                        <small class="dashboard-label">CORPO DOCENTE</small>
                        <h2>Orientadores</h2>
                        <p class="sobre-subtitle">Conheça os docentes responsáveis por este projeto!</p>
                    </div>
                </div>

                <div class="team-grid orientadores-grid">
                    <div class="member-card advisor-card">
                        <div class="member-photo-wrapper">
                            <img src="${pageContext.request.contextPath}/assets/images/membro1.png" alt="Moniky" class="member-photo" onerror="this.src='https://api.dicebear.com/7.x/bottts/svg?seed=Moniky';">
                        </div>
                        <h3>Moniky Ribeiro</h3>
                        <span class="member-role">Análise e Projetos de Sistemas</span>
                    </div>

                    <div class="member-card advisor-card">
                        <div class="member-photo-wrapper">
                            <img src="${pageContext.request.contextPath}/assets/img/profw.gif" alt="Woquiton" class="member-photo" onerror="this.src='https://api.dicebear.com/7.x/bottts/svg?seed=Woquiton';">
                        </div>
                        <h3>Woquiton Fernandes</h3>
                        <span class="member-role">Programação Orientada a Objetos</span>
                    </div>
                </div>

                <div class="sobre-header-card section-divider">
                    <img src="${pageContext.request.contextPath}/assets/img/linguado.png" alt="Mascote" class="sobre-pato-img" onerror="this.src='https://fonts.gstatic.com/s/e/notoemoji/latest/1f986/512.webp';">
                    <div>
                        <small class="dashboard-label">EQUIPE DE DESENVOLVIMENTO</small>
                        <h2>Os Criadores do Linguados</h2>
                        <p class="sobre-subtitle">A equipe por trás da plataforma que transforma o aprendizado em um grande desafio!</p>
                    </div>
                </div>

                <div class="team-grid">
                    <div class="member-card">
                        <div class="member-photo-wrapper">
                            <img src="${pageContext.request.contextPath}/assets/img/Andreas.png" alt="Andreas" class="member-photo" onerror="this.src='https://api.dicebear.com/7.x/bottts/svg?seed=Andreas';">
                        </div>
                        <h3>Andreas Gunther Matos Leal</h3>
                        <span class="member-role">Fullstack Developer</span>
                    </div>

                    <div class="member-card">
                        <div class="member-photo-wrapper">
                            <img src="${pageContext.request.contextPath}/assets/img/Rubens.png" alt="Rubens" class="member-photo" onerror="this.src='https://api.dicebear.com/7.x/bottts/svg?seed=Rubens';">
                        </div>
                        <h3>Rubens Ian Silveira dos Santos</h3>
                        <span class="member-role">Fullstack Developer</span>
                    </div>

                    <div class="member-card">
                        <div class="member-photo-wrapper">
                            <img src="${pageContext.request.contextPath}/assets/img/Camila.png" alt="Camila" class="member-photo" onerror="this.src='https://api.dicebear.com/7.x/bottts/svg?seed=Camila';">
                        </div>
                        <h3>Camila Batista Cotrim</h3>
                        <span class="member-role">Developer Advocate & QA</span>
                    </div>

                    <div class="member-card">
                        <div class="member-photo-wrapper">
                            <img src="${pageContext.request.contextPath}/assets/img/Issac.png" alt="Isaac" class="member-photo" onerror="this.src='https://api.dicebear.com/7.x/bottts/svg?seed=Isaac';">
                        </div>
                        <h3>Isaac Ferreira dos Santos</h3>
                        <span class="member-role">Developer Advocate & QA</span>
                    </div>

                    <div class="member-card">
                        <div class="member-photo-wrapper">
                            <img src="${pageContext.request.contextPath}/assets/img/carregando.webp" alt="Vitor" class="member-photo" onerror="this.src='https://api.dicebear.com/7.x/bottts/svg?seed=Vitor';">
                        </div>
                        <h3>Vitor Pizolato da Silva</h3>
                        <span class="member-role">Fullstack Developer</span>
                    </div>
                </div>

            </div>
        </section>
    </main>
</body>
</html>