<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.divInformacoes {
		position : relative;
		text-align : center;
	}
</style>
<body>

	<%
		String n = request.getParameter("nome");
		int a = Integer.parseInt(request.getParameter("ano"));
		
		//calcular idade
		int idade = 2024 - a;
		
		//out.print(n + " nasceu no ano de " + a + " e tem " + idade + " anos de idade ");
	%>
	
	<div class="divInformacoes">
		<h2>Informações do Participante</h2>
		<h3>Nome: </h3>
		<input placeholder="<%= n %>">
		
		<h3>Ano de Nascimento: </h3>
		<input placeholder="<%= a %>">
		
		<h3>Idade: </h3>
		<input placeholder="<%= idade  %>">
		
		<h3> <%= n %> nasceu no ano de <%= a %> e tem <%= idade  %> anos de idade </h3>
	</div>
	

</body>
</html>