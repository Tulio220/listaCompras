<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Editar Jogo</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
            color: #333;
            transition: background-color 0.3s;
        }
        .container {
            max-width: 800px; 
            margin-top: 50px; 
            padding: 30px; 
            border-radius: 10px; 
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-control {
            transition: border-color 0.3s;
        }
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        button.btn {
            width: 100%;
            font-size: 16px;
            padding: 10px;
            transition: background-color 0.3s;
        }
        button.btn:hover {
            background-color: #0056b3;
            color: #fff;
        }
        /* Adiciona animações */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .form-group {
            animation: fadeIn 0.8s ease forwards;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Editar Jogo</h2>

    <%
        int id = Integer.parseInt(request.getParameter("id"));
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jogosdb", "root", "root");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM jogos WHERE id=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        rs.next();
    %>

    <form action="edit_jogo.jsp?id=<%= id %>" method="post">
        <div class="form-group">
            <label for="nome">Nome:</label>
            <input type="text" class="form-control" name="nome" value="<%= rs.getString("nome") %>" required>
        </div>
        <div class="form-group">
            <label for="plataforma">Plataforma:</label>
            <input type="text" class="form-control" name="plataforma" value="<%= rs.getString("plataforma") %>" required>
        </div>
        <div class="form-group">
            <label for="genero">Gênero:</label>
            <input type="text" class="form-control" name="genero" value="<%= rs.getString("genero") %>" required>
        </div>
        <div class="form-group">
            <label for="ano_lancamento">Ano de Lançamento:</label>
            <input type="number" class="form-control" name="ano_lancamento" value="<%= rs.getInt("ano_lancamento") %>" required>
        </div>
        <button type="submit" class="btn btn-warning">Atualizar</button>
    </form>

    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String nome = request.getParameter("nome");
            String plataforma = request.getParameter("plataforma");
            String genero = request.getParameter("genero");
            int anoLancamento = Integer.parseInt(request.getParameter("ano_lancamento"));

            PreparedStatement psUpdate = con.prepareStatement("UPDATE jogos SET nome=?, plataforma=?, genero=?, ano_lancamento=? WHERE id=?");
            psUpdate.setString(1, nome);
            psUpdate.setString(2, plataforma);
            psUpdate.setString(3, genero);
            psUpdate.setInt(4, anoLancamento);
            psUpdate.setInt(5, id);
            psUpdate.executeUpdate();

            con.close();
            response.sendRedirect("index.jsp");
        }
    %>
</div>
</body>
</html>
