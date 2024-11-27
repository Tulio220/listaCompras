<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="jDao" class="org.libertas.JogoDao" scope="request" />
<jsp:setProperty name="jDao" property="*" />

<html>
<head>
    <title>Lista de Jogos com Bean</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="text-center">Lista de Jogos</h2>
    <a href="add_jogo.jsp" class="btn btn-primary">Adicionar Novo Jogo</a>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Plataforma</th>
                <th>Gênero</th>
                <th>Ano de Lançamento</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="jogo" items="${jDao.listarJogos()}">
                <tr>
                    <td class="text-center">${jogo.id}</td>
                    <td class="text-center">${jogo.nome}</td>
                    <td class="text-center">${jogo.plataforma}</td>
                    <td class="text-center">${jogo.genero}</td>
                    <td class="text-center">${jogo.anoLancamento}</td>
                    <td class="text-center">
                        <a href="edit_jogo.jsp?id=${jogo.id}" class="btn btn-warning btn-sm">Alterar</a>
                        <a href="excluir.jsp?id=${jogo.id}" class="btn btn-danger btn-sm">Excluir</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
