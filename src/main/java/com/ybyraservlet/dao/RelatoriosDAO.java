package com.example.ybyraservlet.dao;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.example.ybyraservlet.conexao.ConexaoBD;
import com.example.ybyraservlet.model.Relatorios;

public class RelatoriosDAO{

    // VARIAVEIS
    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;
    Relatorios relatorios = new Relatorios();

    //INSERE NOVO RELATÓRIO NO BANCO DE DADOS
    public boolean inserirDados(Relatorios relatorios){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = ("INSERT INTO relatorios (data_criacao, pdf_documento, id_usuario) VALUES (?, ?, ?)");
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setDate(1, relatorios.getDataCriacao());
            pstmt.setString(2, relatorios.getPdfDocumento());
            pstmt.setInt(3, relatorios.getIdUsuario());

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }
    }

    //ATUALIZA UM RELATÓRIO EXISTENTE NO BANCO DE DADOS
    public boolean atualizar(Relatorios relatorios) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "UPDATE relatorios SET data_criacao = ?, pdf_documento = ?, id_usuario = ? WHERE id_relatorio = ?";
            conn = conexao.conectar();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setDate(1, relatorios.getDataCriacao());
            pstmt.setString(2, relatorios.getPdfDocumento());
            pstmt.setInt(3, relatorios.getIdUsuario());
            pstmt.setInt(4, relatorios.getIdRelatorios());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return false;
        } finally {
            conexao.desconectar(conn);
        }

    }

    //BUSCA TODOS OS RELATÓRIOS CADASTRADOS NO BANCO DE DADOS
    public List<Relatorios> buscar() {
        List<Relatorios> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "SELECT * FROM relatorios ORDER BY id_usuario ASC";
            conn = conexao.conectar();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int idRelatorios = rs.getInt("id_relatorios");
                Date dataCriacao = rs.getDate("data_criacao");
                String pdf = rs.getString("pdf_documento");
                int idUser = rs.getInt("id_usuario");

                Relatorios rel = new Relatorios(
                        idRelatorios, dataCriacao, pdf, idUser
                );
                lista.add(rel);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            conexao.desconectar(conn);
        }
        return lista;
    }


    // DELETA UM RELATÓRIO DO BANCO DE DADOS COM BASE NO ID
    public int deletar(int idRelatorios) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;

        try {
            conn = conexao.conectar();
            String sql = "DELETE FROM relatorios WHERE id_relatorios = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idRelatorios);

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
