package org.libertas;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

public class PessoaDao {

    public void salvar(Pessoa p) {
        if (p.getIdpessoa() > 0) {
            alterar(p);
        } else {
            inserir(p);
        }
    }

    public boolean inserir(Pessoa p) {
        Conexao con = new Conexao();
        try {
            String sql = "INSERT INTO pessoa (nome, telefone, email, cidade, endereco, cep) VALUES (?,?,?,?,?,?)";
            PreparedStatement prep = con.getConnection().prepareStatement(sql);
            prep.setString(1, p.getNome());
            prep.setString(2, p.getTelefone());
            prep.setString(3, p.getEmail());
            prep.setString(4, p.getCidade());
            prep.setString(5, p.getEndereco());
            prep.setString(6, p.getCep());
            prep.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            con.desconecta();
        }
    }

    public boolean alterar(Pessoa p) {
        Conexao con = new Conexao();
        try {
            String sql = "UPDATE pessoa SET nome = ?, telefone = ?, email = ?, cidade = ?, endereco = ?, cep = ? WHERE idpessoa = ?";
            PreparedStatement prep = con.getConnection().prepareStatement(sql);
            prep.setString(1, p.getNome());
            prep.setString(2, p.getTelefone());
            prep.setString(3, p.getEmail());
            prep.setString(4, p.getCidade());
            prep.setString(5, p.getEndereco());
            prep.setString(6, p.getCep());
            prep.setInt(7, p.getIdpessoa());
            prep.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            con.desconecta();
        }
    }

    public boolean excluir(Pessoa p) {
        Conexao con = new Conexao();
        try {
            String sql = "DELETE FROM pessoa WHERE idpessoa = ?";
            PreparedStatement prep = con.getConnection().prepareStatement(sql);
            prep.setInt(1, p.getIdpessoa());
            prep.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            con.desconecta();
        }
    }

    public LinkedList<Pessoa> listar() {
        LinkedList<Pessoa> lista = new LinkedList<Pessoa>();
        Conexao con = new Conexao();
        try {
            String sql = "SELECT * FROM pessoa";
            Statement sta = con.getConnection().createStatement();
            ResultSet res = sta.executeQuery(sql);
            while (res.next()) {
                Pessoa p = new Pessoa();
                p.setIdpessoa(res.getInt("idpessoa"));
                p.setNome(res.getString("nome"));
                p.setTelefone(res.getString("telefone"));
                p.setEmail(res.getString("email"));
                p.setCidade(res.getString("cidade"));
                p.setEndereco(res.getString("endereco"));
                p.setCep(res.getString("cep"));
                lista.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.desconecta();
        }
        return lista;
    }

    public Pessoa consultar(int id) {
        Pessoa p = new Pessoa();
        Conexao con = new Conexao();
        try {
            String sql = "SELECT * FROM pessoa WHERE idpessoa = ?";
            PreparedStatement prep = con.getConnection().prepareStatement(sql);
            prep.setInt(1, id);
            ResultSet res = prep.executeQuery();
            if (res.next()) {
                p.setIdpessoa(res.getInt("idpessoa"));
                p.setNome(res.getString("nome"));
                p.setTelefone(res.getString("telefone"));
                p.setEmail(res.getString("email"));
                p.setCidade(res.getString("cidade"));
                p.setEndereco(res.getString("endereco"));
                p.setCep(res.getString("cep"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.desconecta();
        }
        return p;
    }
}
