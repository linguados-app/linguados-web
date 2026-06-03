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

            <%-- RESTRIÇÃO DE SEGURANÇA: Exibe o botão de gerenciamento apenas se for Admin --%>
            <c:if test="${usuarioLogado.admin}">
                <hr style="border: 0; border-top: 1px solid #E5E5E5; margin: 10px 20px;">
                <a href="${pageContext.request.contextPath}/desafios" class="nav-link" style="color: #e03131;">
                    ⚙️ <span class="nav-text">Gerenciar Desafios</span>
                </a>
            </c:if>
        </nav>
    </aside>

    <main class="main-content">
        <c:if test="${not empty param.mensagem}">
            <div style="background-color: #e6fcf5; border: 1px solid #c3fae8; color: #0ca678; padding: 14px 20px; border-radius: 16px; margin-bottom: 24px; font-weight: bold; font-family: 'Nunito', sans-serif;">
                ✨ ${param.mensagem}
            </div>
        </c:if>

        <section class="profile-header-card">
            <div class="profile-avatar">
                ${usuarioLogado.nome.substring(0,1).toUpperCase()}
            </div>
            <div class="profile-main-info">
                <h1>${usuarioLogado.nome}</h1>
                <p>${usuarioLogado.email}</p>
                <span class="badge-level">LEVEL ${usuarioLogado.nivel}</span>
            </div>
            <a href="#modalEditarNome" class="btn-edit-name">
                ✏️ Editar Nome
            </a>
        </section>

        <section class="profile-stats-grid">
            <div class="stat-box">
                <span class="stat-emoji">🔥</span>
                <div class="stat-data">
                    <strong>${usuarioLogado.streak}</strong>
                    <small>Day Streak</small>
                </div>
            </div>
            <div class="stat-box">
                <span class="stat-emoji">✨</span>
                <div class="stat-data">
                    <strong>${usuarioLogado.xp}</strong>
                    <small>Total XP</small>
                </div>
            </div>
            <div class="stat-box">
                <span class="stat-emoji">📅</span>
                <div class="stat-data">
                    <strong>${usuarioLogado.ultimoAcesso}</strong>
                    <small>Last Activity</small>
                </div>
            </div>
        </section>

        <section class="badges-section">
            <div style="margin-bottom: 24px;">
                <small class="dashboard-label">CONQUISTAS</small>
                <h2 style="margin: 0; font-size: 24px; color: var(--text-dark); font-weight: 800;">Minhas Insígnias 🏆</h2>
            </div>

            <div class="badges-grid">
                <c:choose>
                    <c:when test="${not empty conquistas}">
                        <c:forEach var="conquista" items="${conquistas}">
                            <div class="badge-item" title="${conquista.descricao}">
                                <div class="badge-icon">${conquista.badgeIcone}</div>
                                <span class="badge-title">${conquista.titulo}</span>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p style="color: var(--text-muted); font-weight: 700; margin: 0; font-size: 15px; grid-column: 1 / -1;">
                            Nenhuma conquista desbloqueada ainda. Complete desafios para ganhar medalhas!
                        </p>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>

        <div style="margin-top: 30px;">
             <a href="${pageContext.request.contextPath}/logout" class="btn-logout">Sair da Conta</a>
        </div>
    </main>

    <div id="modalEditarNome" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.4); z-index: 2000; align-items: center; justify-content: center;">
        <div class="card" style="width: 350px; background: white; padding: 24px; position: relative; border-radius: 20px; font-family: 'Nunito', sans-serif; border: 2px solid var(--border-gray); border-bottom: 5px solid var(--border-gray);">
            <a href="#" onclick="document.getElementById('modalEditarNome').style.display='none'" style="position: absolute; top: 16px; right: 20px; text-decoration: none; color: #8b8ea1; font-weight: bold; font-size: 18px;">✕</a>

            <h2 style="margin-top: 0; font-size: 18px; margin-bottom: 16px; font-weight: 800;">Alterar Nome</h2>

            <form action="${pageContext.request.contextPath}/perfil" method="POST" style="display: flex; flex-direction: column; gap: 14px;">
                <div>
                    <label style="color: #8b8ea1; font-size: 11px; font-weight: 800; text-transform: uppercase; display: block; margin-bottom: 6px;">Seu Nome</label>
                    <input type="text" name="nome" value="${usuarioLogado.nome}" required style="width: 100%; padding: 12px; border-radius: 12px; border: 2px solid var(--border-gray); font-family: inherit; box-sizing: border-box; font-weight: 700;" />
                </div>

                <button type="submit" style="background: var(--purple-main); color: white; border: none; padding: 12px; border-radius: 14px; font-weight: 800; cursor: pointer; font-size: 14px; margin-top: 6px; border-bottom: 4px solid var(--purple-dark);">
                    Confirmar
                </button>
            </form>
        </div>
    </div>

    <script>
        function gerenciarModal() {
            if (window.location.hash === '#modalEditarNome') {
                document.getElementById('modalEditarNome').style.display = 'flex';
            } else {
                document.getElementById('modalEditarNome').style.display = 'none';
            }
        }
        window.addEventListener('hashchange', gerenciarModal);
        gerenciarModal();
    </script>
</body>
</html>