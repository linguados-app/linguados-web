<!DOCTYPE html>
<html>
<body>

<h2>Login</h2>

<form action="${pageContext.request.contextPath}/login" method="post">
    <input type="text" name="email" placeholder="Email"><br>
    <input type="password" name="senha" placeholder="Senha"><br>
    <button type="submit">Entrar</button>
</form>
    <a href="cadastro.jsp">Criar conta</a>
</body>
</html>