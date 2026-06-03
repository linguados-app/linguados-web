<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Módulos | Linguados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800&display=swap" rel="stylesheet">
</head>
<body class="dashboard-body">

    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo"><span class="text-purple">L</span><span class="logo-text"> Linguados</span></div>
        </div>
        <nav style="display:flex; flex-direction:column; gap:10px; flex-grow:1; padding: 20px 0;">
            <a href="${pageContext.request.contextPath}/dashboard" class="nav-link">📊 <span class="nav-text">Dashboard</span></a>
            <a href="${pageContext.request.contextPath}/lessons" class="nav-link active">📖 <span class="nav-text">Lessons</span></a>
            <a href="${pageContext.request.contextPath}/ranking" class="nav-link">🏆 <span class="nav-text">Ranking</span></a>
            <a href="${pageContext.request.contextPath}/chat" class="nav-link">💬 <span class="nav-text">Chat</span></a>
            <a href="${pageContext.request.contextPath}/perfil" class="nav-link">👤 <span class="nav-text">Perfil</span></a>
        </nav>
    </aside>

    <main class="main-content">
        <div style="margin-bottom: 30px;">
            <h1 style="color: var(--text-main); font-size: 28px; margin-bottom: 8px;">Módulos de Aprendizado 📖</h1>
            <p style="color: #8b8ea1; margin: 0;">Escolha uma trilha abaixo para iniciar sua maratona de lições.</p>
        </div>

        <c:if test="${param.error == 'Modulo+vazio'}">
            <div style="background-color: #fff5f5; border: 1px solid #ffe3e3; color: #e03131; padding: 14px 20px; border-radius: 16px; margin-bottom: 24px; font-weight: bold; font-family: 'Nunito', sans-serif;">
                ⚠️ Este módulo ainda não possui desafios cadastrados. Tente outro!
            </div>
        </c:if>

        <div class="modules-grid" style="display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 24px;">
            <c:forEach var="modulo" items="${listaModulos}">
                <div class="card" style="padding: 24px; display: flex; flex-direction: column; justify-content: space-between; border: 2px solid #E5E5E5; border-bottom: 5px solid #E5E5E5; border-radius: 20px; background: white;">
                    <div>
                        <span style="font-size: 32px; display: block; margin-bottom: 12px;">📝</span>
                        <h3 style="margin: 0 0 6px 0; font-size: 20px; color: var(--text-main); font-weight: 800;">${modulo.titulo}</h3>
                        <p style="color: #8b8ea1; margin: 0; font-size: 14px; font-family: 'Nunito', sans-serif; font-weight: 700;">${modulo.descricao}</p>
                    </div>

                    <div style="margin-top: 20px;">
                        <a href="${pageContext.request.contextPath}/lessons?modulo=${modulo.id}"
                           style="display: block; text-align: center; background: #6c4cff; color: white; text-decoration: none; padding: 12px; border-radius: 14px; font-weight: 800; font-size: 14px; transition: background 0.2s; border-bottom: 4px solid #5436db;">
                             Resolver Módulo
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </main>

</body>
</html>