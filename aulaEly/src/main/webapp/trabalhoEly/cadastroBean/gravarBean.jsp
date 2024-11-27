<%@ page import="org.libertas.Jogo" %>
<%@ page import="org.libertas.JogoDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<jsp:useBean id="jogoDao" class="org.libertas.JogoDao" scope="request" />
<jsp:useBean id="jogo" class="org.libertas.Jogo" scope="request" />

<%
    // Coleta os parâmetros do formulário e atribui ao bean
    jogo.setId(Integer.parseInt(request.getParameter("id")));
    jogo.setNome(request.getParameter("nome"));
    jogo.setPlataforma(request.getParameter("plataforma"));
    jogo.setGenero(request.getParameter("genero"));
    jogo.setAnoLancamento(Integer.parseInt(request.getParameter("ano_lancamento")));

    // Salva o jogo: atualiza se já existe, adiciona se não
    if (jogo.getId() > 0) {
        jogoDao.atualizarJogo(jogo);
    } else {
        jogoDao.adicionarJogo(jogo);
    }

    // Redireciona para a página de sucesso
    response.sendRedirect("gravar.jsp");
%>
