package org.libertas;

import java.io.IOException;
import java.util.stream.Collectors;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PessoaAPI/*")
public class PessoaAPI extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PessoaDao pdao = new PessoaDao();
        Gson gson = new Gson();
        
        Integer id = null;
        try {
            id = Integer.parseInt(request.getPathInfo().substring(1));
        } catch (Exception e) {
            // ID não informado
        }

        response.setHeader("content-type", "application/json");
        if (id == null) {
            response.getWriter().print(gson.toJson(pdao.listar()));
        } else {
            response.getWriter().print(gson.toJson(pdao.consultar(id)));
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String body = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        Gson gson = new Gson();
        Pessoa p = gson.fromJson(body, Pessoa.class);
        PessoaDao pdao = new PessoaDao();

        boolean sucesso = pdao.inserir(p);
        Retorno retorno = new Retorno(sucesso, sucesso ? "Inserido com sucesso!" : "Falha ao inserir.");
        response.getWriter().print(gson.toJson(retorno));
    }

    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String body = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        Gson gson = new Gson();
        Pessoa p = gson.fromJson(body, Pessoa.class);
        PessoaDao pdao = new PessoaDao();

        boolean sucesso = pdao.alterar(p);
        Retorno retorno = new Retorno(sucesso, sucesso ? "Alterado com sucesso!" : "Falha ao alterar.");
        response.getWriter().print(gson.toJson(retorno));
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PessoaDao pdao = new PessoaDao();
        Gson gson = new Gson();

        Integer id = null;
        try {
            id = Integer.parseInt(request.getPathInfo().substring(1));
        } catch (Exception e) {
            Retorno retorno = new Retorno(false, "ID obrigatório!");
            response.getWriter().print(gson.toJson(retorno));
            return;
        }

        Pessoa p = new Pessoa();
        p.setIdpessoa(id);

        boolean sucesso = pdao.excluir(p);
        Retorno retorno = new Retorno(sucesso, sucesso ? "Excluído com sucesso!" : "Falha ao excluir.");
        response.getWriter().print(gson.toJson(retorno));
    }
}
