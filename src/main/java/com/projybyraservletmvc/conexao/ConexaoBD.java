package com.ybyraservletmvc.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import io.github.cdimascio.dotenv.Dotenv;

public class ConexaoBD {
    private Connection conn;
    private static Dotenv dotenv;
    public Connection conectar() {
        try {
            System.out.println("=== Tentando conectar ao banco ===");

            String dbUrl = dotenv.get("DB_URL");
            String dbUser = dotenv.get("DB_USER");
            String dbPassword = dotenv.get("DB_PASSWORD");

            System.out.println("DB_URL: " + dbUrl);
            System.out.println("DB_USER: " + dbUser);

            if (dbUrl == null || dbUser == null || dbPassword == null) {
                return null;
            }

            Class.forName("org.postgresql.Driver");
            System.out.println("Driver PostgreSQL carregado");

            this.conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            System.out.println("CONEXÃO COM O BANCO ESTABELECIDA!");

            return this.conn;

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void desconectar(Connection conn) {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                System.out.println("Conexão encerrada");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}