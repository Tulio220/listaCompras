package org.libertas;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
	private Connection connection;

	public Conexao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// abre conexão com o banco de dados
			connection = DriverManager.getConnection("jdbc:mysql://54.91.193.137:3306/" 
			+ "libertas5per?verifyServerCertificate=false&useSSL=false", "libertas", "123456");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void desconecta() {
		try {
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		return connection;
	}
	
	public void setConnection(Connection connection) {
		this.connection = connection;
	}

}


/*package org.libertas;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
private Connection connection;
	
	public Conexao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			//abre a conexao com o banco de dados
			connection = DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1:3306/"
					+"jogosdb?verifyServerCertificate=false&useSSL=false",
					"root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void desconecta(){
		try {
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		return connection;
	}

	public void setConnection(Connection connection) {
		this.connection = connection;
	}

}*/