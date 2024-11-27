<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="jogo" class="org.libertas.Jogo" scope="request" />
<jsp:useBean id="jogoDao" class="org.libertas.JogoDao" scope="application" />
<jsp:setProperty name="jogo" property="*" />

<html>
<head>
    <title>Editar Jogo com Bean</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="text-center">Editar Jogo</h2>

    <form action="edit_jogo.jsp?id=<%= jogo.getId() %>" method="post">
        <div class="form-group">
            <label for="nome">Nome:</label>
            <input type="text" class="form-control" name="nome" value="<jsp:getProperty name='jogo' property='nome' />" required>
        </div>
        <div class="form-group">
            <label for="plataforma">Plataforma:</label>
            <input type="text" class="form-control" name="plataforma" value="<jsp:getProperty name='jogo' property='plataforma' />" required>
        </div>
        <div class="form-group">
            <label for="genero">Gênero:</label>
            <input type="text" class="form-control" name="genero" value="<jsp:getProperty name='jogo' property='genero' />" required>
        </div>
        <div class="form-group">
            <label for="ano_lancamento">Ano de Lançamento:</label>
            <input type="number" class="form-control" name="ano_lancamento" value="<jsp:getProperty name='jogo' property='anoLancamento' />" required>
        </div>
        <button type="submit" class="btn btn-warning">Atualizar</button>
    </form>

    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String nome = request.getParameter("nome");
            String plataforma = request.getParameter("plataforma");
            String genero = request.getParameter("genero");
            int anoLancamento = Integer.parseInt(request.getParameter("ano_lancamento"));

            // Atualizando os dados do Bean
            jogo.setNome(nome);
            jogo.setPlataforma(plataforma);
            jogo.setGenero(genero);
            jogo.setAnoLancamento(anoLancamento);

            // Salvando no banco de dados
            jogoDao.atualizarJogo(jogo);

            response.sendRedirect("index.jsp");
        }
    %>
</div>
</body>
</html>
