<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cálculo de Produtos</title>
</head>

<style>
.divInformacoes {
	position : relative;
	text-align : center;
}
</style>
<body>

<!-- Produtos  -->
	
	<%
		double preco = Double.parseDouble(request.getParameter("preco"));
		String descricao = request.getParameter("descricao");
		int quant = Integer.parseInt(request.getParameter("quant"));
		
		
		double resultado = preco * 5.47;
		
		double valorTotal = resultado * quant;
	%>
	
	<div class="divInformacoes">
		<h2>Produtos</h2>
		<h3>Descrição do Produto: </h3>
		<input placeholder="<%= descricao %>">
		<hr>
		<h3>Quantidade: </h3>
		<input placeholder="<%= quant %>">
		<hr>
		<h3>Preço Unitário: </h3>
		<input placeholder="<%= preco  %>">
		<hr>
		<h3>Valor Total (Em Reais): </h3>
		<input placeholder="<%= valorTotal  %>">
		<hr>
		
	</div>

</body>
</html>