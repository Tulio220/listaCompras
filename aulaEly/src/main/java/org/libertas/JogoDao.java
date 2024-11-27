package org.libertas;

import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

public class JogoDao {
	
	 public void salvar(Jogo j) {
		  if (j.getId()>0) {
		   atualizarJogo(j);
		 } else {
		  adicionarJogo(j);
		 }
	}
	
	public void adicionarJogo(Jogo j){
	       Conexao con = new Conexao();
	       try {
	    	   String sql = "INSERT INTO jogos (nome, plataforma, genero, ano_lancamento)" + " VALUES (?,?,?,?)";
	    	   PreparedStatement prep = con.getConnection().prepareStatement(sql);
	    	   prep.setString(1, j.getNome());
	    	   prep.setString(2, j.getPlataforma());
	    	   prep.setString(3, j.getGenero());
	    	   prep.setInt(4, j.getAnoLancamento());
	    	   prep.execute();
	       }
	       catch(Exception e){
	    	   e.printStackTrace();
	    }
	      con.desconecta();
	}
	 
	public LinkedList<Jogo> listarJogos() {
		//return lista;
		LinkedList<Jogo> lista = new LinkedList<Jogo>();
		Conexao con = new Conexao();
		try {
			String sql = "SELECT * FROM jogos ORDER BY nome";
			Statement sta = con.getConnection().createStatement();
			ResultSet res = sta.executeQuery(sql);
			while (res.next()) {
				Jogo j = new Jogo();
				j.setId(res.getInt("id"));
				j.setNome(res.getString("nome"));
				j.setPlataforma(res.getString("plataforma"));
				j.setGenero(res.getString("genero"));
				j.setAnoLancamento(res.getInt("ano_lancamento"));
				lista.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
		return lista;
	}
	
	public void atualizarJogo(Jogo j) {
		Conexao con = new Conexao();
		try {
			String sql = "UPDATE jogos SET"
					+" nome = ?, plataforma = ?," 
					+ "genero = ? , ano_lancamento = ?,"
					+ "WHERE id = ?";
			PreparedStatement prep = con.getConnection().prepareStatement(sql);
			prep.setString(1, j.getNome());
			prep.setString(2, j.getPlataforma());
			prep.setString(3, j.getGenero());
			prep.setInt(4, j.getAnoLancamento());
			prep.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
	}
	
	public void excluirJogo(Jogo j) {
		Conexao con = new Conexao();
		try {
			String sql = "DELETE FROM jogos"
					+ " WHERE id = ?";
			PreparedStatement prep = con.getConnection().prepareStatement(sql);
			prep.setInt(1, j.getId());
			prep.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
	}
	
	public Jogo obterJogoPorId(int id) {
		Jogo j = new Jogo();
		Conexao con = new Conexao();
		try {
			String sql = "SELECT * FROM jogos WHERE id = "+ id;
			Statement sta = con.getConnection().createStatement();
			ResultSet res = sta.executeQuery(sql);
			if (res.next()) {
				j.setId(res.getInt("id"));
				j.setNome(res.getString("nome"));
				j.setPlataforma(res.getString("plataforma"));
				j.setGenero(res.getString("genero"));
				j.setAnoLancamento(res.getInt("ano_lancamento"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
		return j;
	}
	
	public Jogo consultar(int id) {
		Jogo j = new Jogo();
		Conexao con = new Conexao();
		try {
			String sql = "SELECT * FROM jogos WHERE id = "+ id;
			Statement sta = con.getConnection().createStatement();
			ResultSet res = sta.executeQuery(sql);
			if (res.next()) {
				j.setId(res.getInt("id"));
				j.setNome(res.getString("nome"));
				j.setPlataforma(res.getString("plataforma"));
				j.setGenero(res.getString("genero"));
				j.setAnoLancamento(res.getInt("ano_lancamento"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
		return j;
	}
}


