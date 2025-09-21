package com.projybyraservletmvc.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import io.github.cdimascio.dotenv.Dotenv;

public class ConexaoBD {
    private Connection conn;
    private static final Dotenv dotenv = Dotenv.load();

    // CONECTAR
    public Connection conectar() {
        try {
            Class.forName("org.postgresql.Driver");
            this.conn = DriverManager.getConnection(
                    dotenv.get("DB_URL"),
                    dotenv.get("DB_USER"),
                    dotenv.get("DB_PASSWORD")
            );
            System.out.println("Conexão com o banco foi bem-sucedida");
        } catch (Exception e) {
            System.err.println("Erro ao conectar com o banco de dados:");
            e.printStackTrace();
        }
        return this.conn;
    }

    // DESCONECTAR
    public void desconectar() {
        try {
            if (this.conn != null && !this.conn.isClosed()) {
                this.conn.close();
                System.out.println("Conexão com o banco foi encerrada.");
            }

        } catch (SQLException e) {
            System.err.println("Erro ao desconectar do banco de dados:");
            e.printStackTrace();
        }
    }
}
