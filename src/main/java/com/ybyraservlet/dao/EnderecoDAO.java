package com.ybyraservlet.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ybyraservlet.model.*;
import com.ybyraservlet.conexao.ConexaoBD;

public class EnderecoDAO {


    // INSERE UM NOVO ENDERÇO ASSOCIADO A UMA INDÚSTRIA NO BANCO DE DADOS
    public boolean inserirDados(Endereco endereco){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = ("INSERT INTO endereco (id_industria, estado, cidade, cep, bairro, rua) VALUES (?, ?, ?, ?, ?, ?)");
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, endereco.getIdIndustria());
            pstmt.setString(2, endereco.getEstado());
            pstmt.setString(3, endereco.getCidade());
            pstmt.setString(4, endereco.getCep());
            pstmt.setString(5,endereco.getBairro());
            pstmt.setString(6, endereco.getRua());

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }
    }

    //BUSCA TODOS OS ENDEREÇOS CADASTRADOS NO BANCO DE DADOS
    public List<Endereco> buscar() {
        List<Endereco> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "SELECT * FROM endereco ORDER BY id_endereco ASC";
            conn = conexao.conectar();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id_endereco");
                int idIndustria = rs.getInt("id_industria");
                String estado = rs.getString("estado");
                String cidade = rs.getString("cidade");
                String cep = rs.getString("cep");
                String bairro = rs.getString("bairro");
                String rua = rs.getString("rua");


                Endereco end = new Endereco(
                        id, idIndustria, estado, cidade, cep, bairro, rua
                );
                lista.add(end);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            conexao.desconectar(conn);
        }
        return lista;
    }


    //UPDATE
    public boolean atualizar(Endereco endereco){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();

            String sql = "UPDATE endereco SET id_endereco = ?, id_industria = ?, estado = ?, cidade = ?," +
                    "cep = ?, bairro = ?, rua = ? WHERE id_endereco = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, endereco.getIdEndereco());
            pstmt.setInt(2, endereco.getIdIndustria());
            pstmt.setString(3, endereco.getEstado());
            pstmt.setString(4, endereco.getCidade());
            pstmt.setString(5, endereco.getCep());
            pstmt.setString(6, endereco.getBairro());
            pstmt.setString(7, endereco.getRua());
            pstmt.setInt(8, endereco.getIdEndereco());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return false;
        } finally {
            conexao.desconectar(conn);
        }
    }

    //DELETE
    public int deletar(int idEndereco){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;

        try {
            conn = conexao.conectar();
            String sql = "DELETE FROM endereco WHERE id_endereco = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idEndereco);

            if(pstmt.executeUpdate()>0){
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
