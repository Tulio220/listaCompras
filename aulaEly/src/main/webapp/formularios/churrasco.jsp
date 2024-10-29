<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Churrasco</title>
</head>
<style>
.divFormulario1 {
	position : relative;
	text-align : center;
}
</style>
<body>

<div class="divFormulario1">
	<h1>Cálculo Churrasco</h1>
	
	<form action="churrascoResposta.jsp" method="post">
		 <h3>Quantidade de Homens:</h3>
		<input type="text" name="qtdHomens" placeholder="Digite a quantidade de homens..."></input>	
		<br/>
		<h3>Quantidade de Mulheres:</h3>
		<input type="text" name="qtdMulheres" placeholder="Digite a quantidade de mulheres"></input>	
		<br/>
		<h3>Quantidade de Crianças:</h3>
		<input type="text" name="qtdCriancas" placeholder="Digite a quantidade de crianças"></input>	
		<br/></br>
		
		<input type="submit" value="Confirmar"/>
	</form>
</div>

</body>
</html>