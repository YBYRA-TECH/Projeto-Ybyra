package com.example.ybyraservlet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.example.ybyraservlet.conexao.ConexaoBD;
import com.example.ybyraservlet.model.Industria;

public class IndustriaDAO {

    //INSERE UMA NOVA INDÚSTRIA NO BANCO DE DADOS
    public boolean inserirDados(Industria industria){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try{
            conn = conexao.conectar();

            String sql = "INSERT INTO industria(nome, email, cnpj, senha) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, industria.getNome());
            pstmt.setString(2, industria.getEmail());
            pstmt.setString(3, industria.getCnpj());
            pstmt.setString(4, industria.getSenha());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }
    }

    //ATUALIZA UMA INDÚSTRIA NO BANCO DE DADOS
    public static boolean atualizarIndustria(Industria industria) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "UPDATE industria SET nome = ?, email = ?, cnpj = ?, senha = ? WHERE id_industria = ?";
            conn = conexao.conectar();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, industria.getNome());
            stmt.setString(2, industria.getEmail());
            stmt.setString(3, industria.getCnpj());
            stmt.setString(4, industria.getSenha());
            stmt.setInt(5, industria.getIdIndustria());

            return stmt.executeUpdate() > 0;
        } catch (SQLException sqle){
            sqle.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }
    }

    //BUSCA TODAS AS INDÚSTRIAS CADASTRADAS NO BANCO DE DADOS
    public List<Industria> buscar(){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        List<Industria> lista = new ArrayList<>();
        try {
            String sql = "SELECT * FROM industria ORDER BY id_industria ASC";
            conn = conexao.conectar();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            System.out.println("Conteúdo da tabela indústria:");

            while (rs.next()) {
                int id = rs.getInt("id_industria");
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                String cnpj = rs.getString("cnpj");
                String senha = rs.getString("senha");

                Industria industria = new Industria(id, nome, email, cnpj, senha);
                lista.add(industria);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            conexao.desconectar(conn);
        }
        return lista;
    }

    // DELETA UMA INDÚSTRIA DO BANCO DE DADOS COM BASE NO ID
    public int deletar(int idIndustria){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "DELETE FROM industria WHERE id_industria = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idIndustria);

            if(pstmt.executeUpdate() > 0){
                return 1;
            }else{
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }finally {
            conexao.desconectar(conn);
        }
    }
    public Industria login(String email, String senha) {
        ConexaoBD conexaoBD = new ConexaoBD();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            System.out.println("=== Conectando ao banco para autenticação ===");
            conn = conexaoBD.conectar();

            String sql = "SELECT * FROM industria WHERE email = ? AND senha = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, senha);
            rs = stmt.executeQuery();

            if (rs.next()) {
                System.out.println("Usuário encontrado!");

                Industria industria = new Industria(
                        rs.getString("nome"),
                        rs.getString("cnpj"),
                        rs.getString("email"),
                        rs.getString("senha")
                );

                return industria;
            } else {
                System.out.println("Usuário não encontrado ou senha incorreta");
                return null;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexaoBD.desconectar(conn);

            }
        return null;
    }

    }