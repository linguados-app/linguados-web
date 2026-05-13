<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>

    <title>Novo módulo</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/modulo-form.css">

</head>

<body>

<div class="container">

    <div class="card">

        <span class="badge">
            Administração
        </span>

        <h1 class="title">
            Criar módulo
        </h1>

        <p class="subtitle">
            Organize os desafios da plataforma criando novos módulos.
        </p>

        <form method="post">

            <!-- TÍTULO -->

            <div class="form-group">

                <label>
                    Título do módulo
                </label>

                <input type="text"
                       name="titulo"
                       placeholder="Ex: Introdução ao Java"
                       required>

            </div>

            <!-- DESCRIÇÃO -->

            <div class="form-group">

                <label>
                    Descrição
                </label>

                <textarea name="descricao"
                          placeholder="Descreva o conteúdo do módulo..."></textarea>

            </div>

            <!-- ORDEM -->

            <div class="row">

                <div class="form-group">

                    <label>
                        Ordem
                    </label>

                    <input type="number"
                           name="ordem"
                           value="1"
                           min="1">

                </div>

                <div class="form-group">

                    <label>
                        Status
                    </label>

                    <select name="ativo">

                        <option value="true">
                            Ativo
                        </option>

                        <option value="false">
                            Inativo
                        </option>

                    </select>

                </div>

            </div>

            <!-- BOTÕES -->

            <div class="actions">

                <a href="${pageContext.request.contextPath}/admin/modulos"
                   class="btn btn-secondary">

                    Cancelar

                </a>

                <button type="submit"
                        class="btn btn-primary">

                    Salvar módulo

                </button>

            </div>

        </form>

    </div>

</div>

</body>

</html>