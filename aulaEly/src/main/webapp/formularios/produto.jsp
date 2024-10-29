<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Produto</title>
</head>
<style>
.divFormulario1 {
	position : relative;
	text-align : center;
}
</style>

<body>

<div class="divFormulario1">
	<h1>Calcula Preços</h1>
	
	<form action="produtoResposta.jsp" method="post">
		 <h3>Preço:</h3>
		<input type="text" name="preco" placeholder="Em dólar..."></input>	
		<br/>
		<h3>Descrição:</h3>
		<input type="text" name="descricao" placeholder="Digite a descrição..."></input>	
		<br/>
		
		 <h3>Quantidade:</h3>
		<input type="text" name="quant" placeholder="Insira a qunatidade..."></input>
		<br/></br>
		
		<input type="submit" value="Confirmar"/>
	</form>
</div>

</body>
</html>