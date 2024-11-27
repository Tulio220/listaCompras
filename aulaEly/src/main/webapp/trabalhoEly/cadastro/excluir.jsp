<%@page import="org.libertas.JogoDao"%>
<%@page import="org.libertas.Jogo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exclusão de Jogo</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="text-center">Exclusão de Jogo</h2>
        
        <%
            Jogo j = new Jogo();
            j.setId(Integer.parseInt(request.getParameter("id")));

            JogoDao jdao = new JogoDao();
            jdao.excluirJogo(j);
        %>

        <div class="alert alert-success text-center" role="alert">
            Jogo excluído com sucesso!
        </div>

        <div class="text-center">
            <a href="index.jsp" class="btn btn-primary">Início</a>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>
