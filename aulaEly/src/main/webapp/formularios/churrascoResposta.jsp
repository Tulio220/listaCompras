<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Churrasco Resposta</title>
</head>
<style>
.divInformacoes1 {
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
	position : relative;
	text-align : center;
	right: 500px
}
.divInformacoes2 {
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
	position : relative;
	bottom : 290px;
	text-align : center;
}
.divInformacoes3 {
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
	position : relative;
	bottom : 570px;
	left : 500px;
	text-align : center;
}
h2 {
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
	position : relative;
	text-align : center;
}

.divInformacoes4 {
	text-align : center;
	justify-content : space-between;
	display: flex;
	position : relative;
	bottom : 500px;
	right : 0px
}

.total {
	position : relative;
	align-itens : baseline;
}
.textTotal {
	position : relative;
	text-align : center;
	bottom : 480px;
}

.linha {
	position : relative;
	bottom : 430px
}
</style>
<body>

<!-- Churrasco  -->
	
	<%
		int qtdHomem = Integer.parseInt(request.getParameter("qtdHomens"));
		int qtdMulheres = Integer.parseInt(request.getParameter("qtdMulheres"));
		int qtdCriancas = Integer.parseInt(request.getParameter("qtdCriancas"));
	
		int carneHomem = 300;
		int cervejaHomem = 2;
		double refriHomem = 0.3;
		
		int qtdCarneHomem = qtdHomem * carneHomem;
		int qtdCervejaHomem = qtdHomem * cervejaHomem;
		double qtdRefriHomem = qtdHomem * refriHomem;
		
		int carneMulher = 270;
		double cervejaMulher = 1.5;
		double refriMulher = 0.6;
		
		int qtdCarneMulher = qtdMulheres * carneMulher;
		double qtdCervejaMulher = qtdMulheres * cervejaMulher;
		double qtdRefriMulher = qtdMulheres * refriMulher;
		
		int carneCrianca = 250;
		int refriCrianca = 1;
		
		int qtdCarneCrianca = qtdCriancas * carneCrianca;
		double qtdRefriCrianca = qtdCriancas * refriCrianca;
		
		double totalCarne = qtdCarneHomem + qtdCarneMulher + qtdCarneCrianca;
		double totalCerveja = qtdCervejaHomem + qtdCervejaMulher;
		double totalRefrigerante = qtdRefriHomem + qtdRefriMulher + qtdRefriCrianca;
	%>
	
		<h2>Lista Itens Churrasco:</h2>
		<hr>
	<div class="divInformacoes1">
		<h3>Homens:</h3>
		<h3>Carne:</h3>
		<input placeholder="<%= qtdCarneHomem %> g">
		<h3>Cerveja: </h3>
		<input placeholder="<%= qtdCervejaHomem %> L">
		<h3>Refrigerante: </h3>
		<input placeholder="<%= qtdRefriHomem  %> L">
	</div>
	<div class="divInformacoes2">
		<h3>Mulheres:</h3>
		<h3>Carne:</h3>
		<input placeholder="<%= qtdCarneMulher %> g">
		<h3>Cerveja: </h3>
		<input placeholder="<%= qtdCervejaMulher %> L">
		<h3>Refrigerante: </h3>
		<input placeholder="<%= qtdRefriMulher  %> L">
	</div>
	<div class="divInformacoes3">
		<h3>Crianças:</h3>
		<h3>Carne:</h3>
		<input placeholder="<%= qtdCarneCrianca %> g">
		<h3>Refrigerante: </h3>
		<input placeholder="<%= qtdRefriCrianca  %> L">
	</div>
	<hr class="linha">
	<h3 class="textTotal">Total:</h3>
	<div class="divInformacoes4">
		<div class="total">
			<h3>Carne Total:</h3>
			<input placeholder="<%= totalCarne %> g">
		</div>
		<div class="total">
			<h3>Cerveja Total: </h3>
			<input placeholder="<%= totalCerveja %> L">
		</div>
		<div class="total">
			<h3>Refrigerante Total: </h3>
			<input placeholder="<%= totalRefrigerante  %> L">
		</div>
		
	</div>

</body>
</html>