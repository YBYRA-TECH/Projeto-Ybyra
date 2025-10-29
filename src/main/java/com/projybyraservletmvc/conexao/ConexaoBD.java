package com.projybyraservletmvc.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import io.github.cdimascio.dotenv.Dotenv;

//CLASSE DE CONEXAO E DESCONEXAO COM O BANCO
public class ConexaoBD {
    private Connection conn;
    static {
        try {
            Class.forName("org.postgresql.Driver");
            System.out.println("Driver PostgreSQL carregado com sucesso!");
        } catch (ClassNotFoundException e) {
            System.err.println("ERRO: Driver PostgreSQL NÃO encontrado!");
            e.printStackTrace();
        }
    }



    public static Connection conectar() throws SQLException {
        String url = System.getenv("DB_URL");
        String user = System.getenv("DB_USER");
        String password = System.getenv("DB_PASSWORD");

        if (url == null || user == null || password == null) {
            throw new SQLException("Variáveis de ambiente não configuradas!");
        }

        return DriverManager.getConnection(url, user, password);
    }


    public void desconectar(Connection conn) {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                System.out.println("Conexão com o banco foi encerrada.");
            }

        } catch (SQLException e) {
            System.err.println("Erro ao desconectar do banco de dados:");
            e.printStackTrace();
        }
    }
}
