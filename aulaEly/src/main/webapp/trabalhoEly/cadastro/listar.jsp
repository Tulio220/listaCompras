<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.libertas.JogoDao, org.libertas.Jogo, java.util.List" %>

<html>
<head>
    <title>Lista de Jogos</title>
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
            <%
                JogoDao jDao = new JogoDao();
                List<Jogo> lista = jDao.listarJogos();
                
                for (Jogo jogo : lista) {
            %>
                <tr>
                    <td class="text-center"><%= jogo.getId() %></td>
                    <td class="text-center"><%= jogo.getNome() %></td>
                    <td class="text-center"><%= jogo.getPlataforma() %></td>
                    <td class="text-center"><%= jogo.getGenero() %></td>
                    <td class="text-center"><%= jogo.getAnoLancamento() %></td>
                    <td class="text-center">
                        <a href="edit_jogo.jsp?id=<%= jogo.getId() %>" class="btn btn-warning btn-sm">Alterar</a>
                        <a href="excluir.jsp?id=<%= jogo.getId() %>" class="btn btn-danger btn-sm">Excluir</a>
                    </td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
