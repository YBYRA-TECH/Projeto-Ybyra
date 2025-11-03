package com.projybyraservletmvc.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import io.github.cdimascio.dotenv.Dotenv;

//CLASSE DE CONEXAO E DESCONEXAO COM O BANCO
public class ConexaoBD {
    private Connection conn;


    private static final Dotenv dotenv = Dotenv.configure()
            .directory("./")
            .ignoreIfMissing()
            .load();

    public Connection conectar() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");

            String url = dotenv.get("DB_URL");
            String user = dotenv.get("DB_USER");
            String password = dotenv.get("DB_PASSWORD");

            if (url == null || user == null || password == null) {
                throw new SQLException("Variáveis de ambiente não configuradas!");
            }

            return DriverManager.getConnection(url, user, password);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("Erro ao conectar ao banco de dados", e);
        }
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
