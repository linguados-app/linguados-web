<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">

    <title>Módulos | Linguados</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/modulos.css">

    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800&display=swap"
          rel="stylesheet">
</head>

<body class="bg">

<div class="container">

    <header class="header">

        <div>
            <small class="label">
                LINGUADOS ADMIN
            </small>

            <h1>
                Gerenciar módulos
            </h1>
        </div>

        <a class="btn-new"
           href="${pageContext.request.contextPath}/admin/modulos/novo">

            + Novo módulo
        </a>

    </header>

    <div class="grid-modulos">

        <c:forEach var="m" items="${modulos}">

            <div class="card-modulo">

                <div class="top-card">

                    <span class="badge">
                        MÓDULO ${m.ordem}
                    </span>

                    <span class="status">
                        Ativo
                    </span>

                </div>

                <div class="content">

                    <h2>${m.titulo}</h2>

                    <p>${m.descricao}</p>

                </div>

                <div class="footer-card">

                    <a class="btn-open"
                       href="${pageContext.request.contextPath}/desafios?modulo=${m.id}">

                        Abrir módulo
                    </a>

                </div>

            </div>

        </c:forEach>

    </div>

</div>

</body>
</html>