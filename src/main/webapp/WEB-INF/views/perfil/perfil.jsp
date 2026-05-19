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
        <c:if test="${not empty param.mensagem}">
            <div style="background-color: #e6fcf5; border: 1px solid #c3fae8; color: #0ca678; padding: 14px 20px; border-radius: 16px; margin-bottom: 24px; font-weight: bold; font-family: 'Nunito', sans-serif;">
                ✨ ${param.mensagem}
            </div>
        </c:if>

        <section class="profile-header-card card" style="position: relative;">
            <div class="profile-avatar">
                ${usuarioLogado.nome.substring(0,1).toUpperCase()}
            </div>
            <div class="profile-main-info">
                <h1>${usuarioLogado.nome}</h1>
                <p>${usuarioLogado.email}</p>
                <span class="badge-level">LEVEL ${usuarioLogado.nivel}</span>
            </div>

            <a href="#modalEditarNome" class="admin-link" style="position: absolute; top: 24px; right: 24px; font-size: 14px; text-decoration: none;">✏️ Editar Nome</a>
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

    <div id="modalEditarNome" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.4); z-index: 2000; align-items: center; justify-content: center;">
        <div class="card" style="width: 350px; background: white; padding: 24px; position: relative; border-radius: 20px; font-family: 'Nunito', sans-serif; border: 1px solid #eceff7;">
            <a href="#" onclick="document.getElementById('modalEditarNome').style.display='none'" style="position: absolute; top: 16px; right: 20px; text-decoration: none; color: #8b8ea1; font-weight: bold; font-size: 18px;">✕</a>

            <h2 style="margin-top: 0; font-size: 18px; margin-bottom: 16px;">Alterar Nome</h2>

            <form action="${pageContext.request.contextPath}/perfil" method="POST" style="display: flex; flex-direction: column; gap: 14px;">
                <div>
                    <label style="color: #8b8ea1; font-size: 11px; font-weight: 800; text-transform: uppercase; display: block; margin-bottom: 6px;">Seu Nome</label>
                    <input type="text" name="nome" value="${usuarioLogado.nome}" required style="width: 100%; padding: 10px; border-radius: 10px; border: 1px solid #eceff7; font-family: inherit; box-sizing: border-box;" />
                </div>

                <button type="submit" style="background: #6c4cff; color: white; border: none; padding: 10px; border-radius: 12px; font-weight: 800; cursor: pointer; font-size: 14px; margin-top: 6px;">
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