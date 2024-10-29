<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Futebol Resposta</title>
</head>
<body>

<!-- Futebol  -->
	
	<%
		String time1 = request.getParameter("time1");
		String time2 = request.getParameter("time2");
		
		
		int qtdGolTIme1 = Integer.parseInt(request.getParameter("qtdGolTIme1"));
		int qtdGolTIme2 = Integer.parseInt(request.getParameter("qtdGolTIme2"));
		
		String resultado = "";
		String vencedor = "";
		
		//calculo jogo
		if (qtdGolTIme1 > qtdGolTIme2){
			resultado = "Time 1 realizou mais gols!";
			vencedor = time1;
		} else if(qtdGolTIme1 == qtdGolTIme2){
			resultado = "Empate!";
			vencedor = "Empate!";
		} else {
			resultado = "Time 2 realizou mais gols!";
			vencedor = time2;
		}
		
	%>
	
	<div class="divInformacoes">
		<h2>Informações do Jogo</h2>
		<h3>Time 1: </h3>
		<input placeholder="<%= qtdGolTIme1 %>">
		<hr>
		<h3>Time 2: </h3>
		<input placeholder="<%= qtdGolTIme2 %>">
		<hr>
		<h3>Resultado: </h3>
		<input placeholder="<%= resultado  %>">
		<hr>
		<h3>Time Vencedor: </h3>
		<input placeholder="<%= vencedor  %>">
		
	</div>

</body>
</html>