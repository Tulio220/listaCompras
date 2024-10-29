<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Futebol</title>
</head>
<style>
.divFormulario1 {
	position : relative;
	text-align : center;
}
</style>
<body>

<div class="divFormulario1">
	<h1>Futebol</h1>
	
	<form action="futebolResposta.jsp" method="post">
		 <h3>Time 1 :</h3>
		<input type="text" name="time1"></input>	
		<br/>
		<h3>Quantida de Gols :</h3>
		<input type="text" name="qtdGolTIme1"></input>	
		<br/>
		
		 <h3>Time 2 :</h3>
		<input type="text" name="time2"></input>
		<h3>Quantida de Gols :</h3>
		<input type="text" name="qtdGolTIme2"></input>	
		<br/></br>
		
		<input type="submit" value="Confirmar"/>
	</form>
</div>

</body>
</html>