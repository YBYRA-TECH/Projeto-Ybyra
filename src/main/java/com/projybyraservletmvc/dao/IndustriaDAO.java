package com.projybyraservletmvc.dao;

//import io.github.cdimascio.dotenv.Dotenv;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.projybyraservletmvc.conexao.*;
import com.projybyraservletmvc.model.*;

public class IndustriaDAO{
    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;


    //INSERT
    public boolean inserirDados(Industria industria){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try{
            conn = conexao.conectar();
            if (conn == null) {
                System.out.println("Conexão ainda não estabelecida, use o método 'conectar' primeiro.");
                return false;
            }
        String sql = ("INSERT INTO industria(nome, endereco, cnpj, numero_usuarios) VALUES (?, ?, ?, ?)");
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, industria.getNome());
        pstmt.setString(2, industria.getEndereco());
        pstmt.setString(3, industria.getCnpj());
        pstmt.setInt(4, industria.getNumeroUsuarios());

            if(pstmt.executeUpdate()>0){
                return true;
            }return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }
    }

    //UPDATE
    public static boolean atualizarIndustria(Industria industria) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "UPDATE industria SET nome = ?, endereco = ?, cnpj = ?, numero_usuarios = ? WHERE id_industria = ?";
            conn = conexao.conectar();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, industria.getNome());
            stmt.setString(2, industria.getEndereco());
            stmt.setString(3, industria.getCnpj());
            stmt.setInt(4, industria.getNumeroUsuarios());
            stmt.setInt(5, industria.getIdIndustria());

            if (stmt.executeUpdate() > 0) return true;
            return false;
        } catch (SQLException sqle){
            sqle.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }
    }

    //READ
    public List<Industria> buscar(){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        List<Industria> lista = new ArrayList<>();
        try {
            String sql = ("SELECT * FROM industria ORDER BY id_industria ASC");
            conn = conexao.conectar();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            System.out.println("Conteúdo da tabela indústria:");

            while (rs.next()) {
                int id = rs.getInt("id_industria");
                String nome = rs.getString("nome");
                String endereco = rs.getString("endereco");
                String cnpj = rs.getString("cnpj");
                int nUsuarios = rs.getInt("numero_usuarios");

                Industria industria = new Industria(
                        id,
                        nome,
                        endereco,
                        cnpj,
                        nUsuarios
                );
                lista.add(industria);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            conexao.desconectar(conn);
        }
        return lista;
    }

    // DELETE
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
            }else{return 0;}
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }finally {
            conexao.desconectar(conn);
        }
    }

}
