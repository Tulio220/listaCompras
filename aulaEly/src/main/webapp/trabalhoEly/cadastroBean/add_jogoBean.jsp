<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="jogo" class="org.libertas.Jogo" scope="request" />
<jsp:setProperty name="jogo" property="*" />

<html>
<head>
    <title>Adicionar Jogo com Bean</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
    <form action="gravarBean.jsp" method="post" class="form-horizontal">
        <input type="hidden" name="id" value="<jsp:getProperty name="jogo" property="id" />" />
        
        <div class="form-group">
            <label for="nome" class="col-sm-2 control-label">Nome:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="nome" name="nome" value="<jsp:getProperty name="jogo" property="nome" />" required>
            </div>
        </div>
        
        <div class="form-group">
            <label for="plataforma" class="col-sm-2 control-label">Plataforma:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="plataforma" name="plataforma" value="<jsp:getProperty name="jogo" property="plataforma" />" required>
            </div>
        </div>
        
        <div class="form-group">
            <label for="genero" class="col-sm-2 control-label">Gênero:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="genero" name="genero" value="<jsp:getProperty name="jogo" property="genero" />" required>
            </div>
        </div>
        
        <div class="form-group">
            <label for="ano_lancamento" class="col-sm-2 control-label">Ano de Lançamento:</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" id="ano_lancamento" name="ano_lancamento" value="<jsp:getProperty name="jogo" property="anoLancamento" />" required>
            </div>
        </div>
        
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Salvar</button>
            </div>
        </div>
    </form>
</body>
</html>
