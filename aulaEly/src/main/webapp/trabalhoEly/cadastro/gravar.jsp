<%@page import="org.libertas.Jogo"%>
<%@page import="org.libertas.JogoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Jogo Salvo</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<%
		 Jogo j = new Jogo();
	     JogoDao jdao = new JogoDao();
	     
         j.setId(Integer.parseInt(request.getParameter("id")));
         j.setNome(request.getParameter("nome"));
         j.setPlataforma(request.getParameter("plataforma"));
         j.setGenero(request.getParameter("genero"));
         j.setAnoLancamento(Integer.parseInt(request.getParameter("ano_lancamento")));
         
         jdao.salvar(j);
	     
 	%>
    <div class="container">
        <h1>Jogo salvo com sucesso</h1>
        <a href="index.jsp" class="btn btn-primary">Início</a>
    </div>
</body>
</html>
