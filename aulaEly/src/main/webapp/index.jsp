<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<style>
.divFormulario1 {
	position : relative;
	text-align : center;
}
</style>
<body>

<div class="divFormulario1">
	<h1>Login</h1>
	
	<form action="validaLogin.jsp" method="post">
		 <h3>Usuario:</h3>
		<input type="text" name="usuario" placeholder="Digite o usuario..."></input>	
		<br/>
		<h3>Senha:</h3>
		<input type="text" name="senha" placeholder="Digite a senha..."></input>	
		<br/>
		<br/></br>
		
		<input type="submit" value="Confirmar"/>
	</form>
</div>

</body>
</html>