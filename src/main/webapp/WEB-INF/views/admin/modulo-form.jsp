<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Novo módulo</title>
</head>
<body>

<h1>Criar módulo</h1>

<form method="post">
    <div>
        <label>Título</label><br>
        <input type="text" name="titulo" required>
    </div>

    <br>

    <div>
        <label>Descrição</label><br>
        <textarea name="descricao"></textarea>
    </div>

    <br>

    <div>
        <label>Ordem</label><br>
        <input type="number" name="ordem" value="1">
    </div>

    <br>

    <button type="submit">Salvar</button>
</form>

</body>
</html>