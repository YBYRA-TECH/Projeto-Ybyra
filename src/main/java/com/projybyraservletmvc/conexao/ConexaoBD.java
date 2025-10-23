package com.projybyraservletmvc.conexao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConexaoBD {



    static {
            String DB_URL = System.getenv("DB_URL");
            String DB_USER = System.getenv("DB_USER");
            String DB_PASSWORD = System.getenv("DB_PASSWORD");

        try {
            System.out.println("Carregando configurações do banco...");



            if (DB_URL == null || DB_USER == null || DB_PASSWORD == null) {
                System.out.println("ERRO: .env não encontrado!");
            } else {
                System.out.println("Configurações carregadas com sucesso!");
                System.out.println("URL: " + System.getenv("DB_URL"));
                System.out.println("User: " + System.getenv("DB_USER"));
            }
        } catch (Exception e) {
            System.out.println("ERRO ao carregar configurações: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public Connection conectar() {
        Connection conn = null;
        try {
            System.out.println("\n=== TENTANDO CONECTAR AO BANCO ===");

            String DB_URL = System.getenv("DB_URL");
            String DB_USER = System.getenv("DB_USER");
            String DB_PASSWORD = System.getenv("DB_PASSWORD");


            // Validar se as propriedades foram carregadas
            if ( DB_URL == null || DB_USER == null || DB_PASSWORD == null) {
                System.out.println("ERRO: Propriedades do banco não foram carregadas!");
                System.out.println("   DB_URL: " + DB_URL);
                System.out.println("   DB_USER: " + DB_USER);
                System.out.println("   DB_PASSWORD: " + (DB_PASSWORD != null ? "SENHA CARREGADA!" : "null"));
                return null;
            }

            System.out.println("Carregando driver PostgreSQL...");
            Class.forName("org.postgresql.Driver");
            System.out.println("Driver carregado!");

            System.out.println("Conectando em: " + DB_URL);
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            System.out.println("CONEXÃO ESTABELECIDA COM SUCESSO!");

            return conn;

        } catch (ClassNotFoundException e) {
            System.out.println("ERRO: Driver PostgreSQL não encontrado!");
            System.out.println("   Verifique se o postgresql está no pom.xml");
            e.printStackTrace();
            return null;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;

        } catch (Exception e) {
            System.out.println("ERRO DESCONHECIDO:");
            e.printStackTrace();
            return null;
        }
    }

    public void desconectar(Connection conn) {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                System.out.println("Conexão fechada com sucesso");
            }
        } catch (SQLException e) {
            System.out.println("Erro ao fechar conexão: " + e.getMessage());
            e.printStackTrace();
        }
    }
}