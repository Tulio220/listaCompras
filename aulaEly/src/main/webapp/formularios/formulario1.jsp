<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulário</title>
</head>
<style>
.divFormulario1 {
	position : relative;
	text-align : center;
}
</style>

<body>
<div class="divFormulario1">
	<h1>Formulário</h1>
	
	<form action="resposta1.jsp" method="post">
		 <h3>Nome:</h3>
		<input type="text" name="nome"></input>	
		<br/>
		<h3>Ano de Nascimento:</h3>
		<input type="text" name="ano"/>
		<br/></br>
		<input type="submit" value="Confirmar"/>
	</form>
</div>

</body>
</html>