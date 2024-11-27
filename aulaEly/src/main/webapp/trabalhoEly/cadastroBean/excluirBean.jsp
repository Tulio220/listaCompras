<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="j" class="org.libertas.Jogo" scope="page"/>
	<jsp:useBean id="jDao" class="org.libertas.JogoDao" scope="page"/>
	<jsp:setProperty property="*" name="j"/>
	${jDao.excluirJogo(j)}
	Jogo excluido com sucesso!
	<br/>
	<a href="index.jsp">Ok</a>

</body>
</html>