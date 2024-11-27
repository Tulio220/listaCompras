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
    private static final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ListaComprasDao listaComprasDao = new ListaComprasDao();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            String pathInfo = request.getPathInfo();
            if (pathInfo != null && pathInfo.length() > 1) {
                String idStr = pathInfo.substring(1);
                try {
                    Integer id = Integer.parseInt(idStr);
                    ListaCompras item = listaComprasDao.consultar(id);

                    if (item != null) {
                        response.setStatus(HttpServletResponse.SC_OK);
                        response.getWriter().print(gson.toJson(item));
                    } else {
                        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                        response.getWriter().print("{\"error\": \"Item não encontrado\"}");
                    }
                } catch (NumberFormatException e) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    response.getWriter().print("{\"error\": \"ID inválido\"}");
                }
            } else {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().print(gson.toJson(listaComprasDao.listar()));
            }
        } catch (Exception e) {
            e.printStackTrace();  
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().print("{\"error\": \"Erro interno do servidor\"}");
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            String body = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
            ListaCompras lc = gson.fromJson(body, ListaCompras.class);
            ListaComprasDao listaComprasDao = new ListaComprasDao();
            listaComprasDao.inserir(lc);

            response.setStatus(HttpServletResponse.SC_CREATED);
            response.getWriter().print("{\"message\": \"Inserido com sucesso!\"}");
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().print("{\"error\": \"Erro ao inserir o item\"}");
        }
    }

    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            String body = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
            ListaCompras lc = gson.fromJson(body, ListaCompras.class);
            ListaComprasDao listaComprasDao = new ListaComprasDao();

            listaComprasDao.alterar(lc);
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().print("{\"message\": \"Alterado com sucesso!\"}");
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().print("{\"error\": \"Erro ao alterar o item\"}");
        }
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            String pathInfo = request.getPathInfo();
            if (pathInfo != null && pathInfo.length() > 1) {
                Integer id = Integer.parseInt(pathInfo.substring(1));
                ListaComprasDao listaComprasDao = new ListaComprasDao();
                ListaCompras lc = new ListaCompras();
                lc.setIdLista(id);

                listaComprasDao.excluir(lc);
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().print("{\"message\": \"Excluído com sucesso!\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().print("{\"error\": \"ID obrigatório\"}");
            }
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().print("{\"error\": \"ID inválido\"}");
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().print("{\"error\": \"Erro ao excluir o item\"}");
        }
    }
}
