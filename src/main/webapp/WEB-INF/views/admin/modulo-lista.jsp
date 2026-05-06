<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Módulos</title>
</head>
<body>

<h1>Módulos</h1>

<p>
    <a href="${pageContext.request.contextPath}/admin/modulos/novo">
        Novo módulo
    </a>
</p>

<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>Título</th>
        <th>Descrição</th>
        <th>Ordem</th>
    </tr>

    <c:forEach var="m" items="${modulos}">
        <tr>
            <td>${m.id}</td>
            <td>${m.titulo}</td>
            <td>${m.descricao}</td>
            <td>${m.ordem}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>