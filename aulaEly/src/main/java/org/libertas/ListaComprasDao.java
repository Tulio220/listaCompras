package org.libertas;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

public class ListaComprasDao {
	
	public void salvar(ListaCompras lc) {
		if (lc.getIdLista() > 0) {
			alterar(lc);
		} else {
			inserir(lc);
		}
	}
	
	public void inserir(ListaCompras lc) {
		Conexao con = new Conexao();
		try {
			// Código para criar a tabela
			String createTableSql = "CREATE TABLE IF NOT EXISTS"
					+ " lista_compras ("
			                    + "idLista INT AUTO_INCREMENT PRIMARY KEY, "
			                    + "nome VARCHAR(255) NOT NULL, "
			                    + "quantidade INT NOT NULL, "
			                    + "categoria VARCHAR(100) NOT NULL, "
			                    + "prioridade INT NOT NULL, "
			                    + "mercado VARCHAR(255) NOT NULL"
			                    + ");";

			Statement sta = con.getConnection().createStatement();
			sta.execute(createTableSql);
			// Código para inserir registros
			String insertSql = "INSERT INTO lista_compras (nome, quantidade, categoria, prioridade, mercado) "
			                    + "VALUES (?,?,?,?,?)";
			PreparedStatement prep = con.getConnection().prepareStatement(insertSql);
			prep.setString(1, lc.getNome());
			prep.setInt(2, lc.getQuantidade());
			prep.setString(3, lc.getCategoria());
			prep.setInt(4, lc.getPrioridade());
			prep.setString(5, lc.getMercado());
			prep.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.desconecta();
		}
	}
	
	public void alterar(ListaCompras lc) {
		Conexao con = new Conexao();
		try {
			String sql = "UPDATE lista_compras SET "
					+ "nome = ?, quantidade = ?,"
					+ "categoria = ?, prioridade = ?,"
					+ "mercado = ? "
					+ "WHERE idLista = ? ";
			PreparedStatement prep = con.getConnection().prepareStatement(sql);
			prep.setString(1, lc.getNome());
			prep.setInt(2, lc.getQuantidade());
			prep.setString(3, lc.getCategoria());
			prep.setInt(4, lc.getPrioridade());
			prep.setString(5, lc.getMercado());
			prep.setInt(6, lc.getIdLista());
			prep.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.desconecta();
		}
	}
	
	public void excluir(ListaCompras lc) {
		Conexao con = new Conexao();
		try {
			String sql = "DELETE FROM lista_compras "
					+ "WHERE idLista = ? ";
			PreparedStatement prep = con.getConnection().prepareStatement(sql);
			prep.setInt(1, lc.getIdLista());
			prep.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.desconecta();
		}
	}
	
	public LinkedList<ListaCompras> listar() {
		LinkedList<ListaCompras> lista = new LinkedList<ListaCompras>();
		Conexao con = new Conexao();
		try {
			String sql = "SELECT * FROM lista_compras";
			Statement sta = con.getConnection().createStatement();
			ResultSet res = sta.executeQuery(sql);
			while (res.next()) {
				ListaCompras lc = new ListaCompras();
				lc.setIdLista(res.getInt("idLista"));
				lc.setNome(res.getString("nome"));
				lc.setQuantidade(res.getInt("quantidade"));
				lc.setCategoria(res.getString("categoria"));
				lc.setPrioridade(res.getInt("prioridade"));
				lc.setMercado(res.getString("mercado"));
				lista.add(lc);  
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.desconecta();
		}
		return lista;
	}
	
	public ListaCompras consultar(int id) {
		ListaCompras lc = null;
		Conexao con = new Conexao();
		try {
			String sql = "SELECT * FROM lista_compras WHERE idLista = ?";
			PreparedStatement prep = con.getConnection().prepareStatement(sql);
			prep.setInt(1, id);
			ResultSet res = prep.executeQuery();
			if (res.next()) {
				lc = new ListaCompras();
				lc.setIdLista(res.getInt("idLista"));
				lc.setNome(res.getString("nome"));
				lc.setQuantidade(res.getInt("quantidade"));
				lc.setCategoria(res.getString("categoria"));
				lc.setPrioridade(res.getInt("prioridade"));
				lc.setMercado(res.getString("mercado"));
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.desconecta();
		}
		return lc;
	}
}
