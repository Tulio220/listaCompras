package org.libertas;

import java.io.IOException;
import java.util.stream.Collectors;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ListaComprasAPI
 */
@WebServlet("/ListaComprasAPI/*")
public class ListaComprasAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ListaComprasDao listaComprasDao = new ListaComprasDao();
		Gson gson = new Gson();
		
		Integer id = null;
		try {
			id = Integer.parseInt(request.getPathInfo().substring(1));
		} catch (Exception e) {
			// ID inválido, continuamos para listar todos
		}
		
		response.setHeader("content-type", "application/json");
		if (id == null) {
			response.getWriter().print(gson.toJson(listaComprasDao.listar()));
		} else {
			response.getWriter().print(gson.toJson(listaComprasDao.consultar(id)));
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String body = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
		
		Gson gson = new Gson();
		ListaCompras lc = gson.fromJson(body, ListaCompras.class);
		ListaComprasDao listaComprasDao = new ListaComprasDao();
		listaComprasDao.inserir(lc);
		
		String resp = "Inserido com sucesso!";
		response.getWriter().print(resp);
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String body = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
		
		Gson gson = new Gson();
		ListaCompras lc = gson.fromJson(body, ListaCompras.class);
		ListaComprasDao listaComprasDao = new ListaComprasDao();
		
		listaComprasDao.alterar(lc);
		
		String resp = "Alterado com sucesso!";
		response.getWriter().print(resp);
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ListaComprasDao listaComprasDao = new ListaComprasDao();
		
		Integer id = null;
		try {
			id = Integer.parseInt(request.getPathInfo().substring(1));
		} catch (Exception e) {
			String resp = "ID obrigatório!";
			response.getWriter().print(resp);
			return;
		}
		
		response.setHeader("content-type", "application/json");
		ListaCompras lc = new ListaCompras();
		lc.setIdLista(id);  // Usando o idLista para a exclusão
		
		listaComprasDao.excluir(lc);
		
		String resp = "Excluído com sucesso!";
		response.getWriter().print(resp);
	}
}
