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
import com.example.ybyraservlet.model.Industria;
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
            String sql = ("INSERT INTO relatorios (nome, area,id_usuario, pdf_documento, descricao) VALUES (?, ?, ?, ?,?)");
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, relatorios.getNome());
            pstmt.setString(2, relatorios.getArea());
            pstmt.setInt(3, relatorios.getIdUsuario());
            pstmt.setString(4, relatorios.getPdfDocumento());
            pstmt.setString(5, relatorios.getDescricao());

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
            String sql = "SELECT * FROM relatorios ORDER BY id_relatorio ASC";
            conn = conexao.conectar();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int idRelatorios = rs.getInt("id_relatorios");
                Date dataCriacao = rs.getDate("data_criacao");
                String pdf = rs.getString("pdf_documento");
                int idUser = rs.getInt("id_usuario");

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
    public Relatorios buscarRelatorio(int idRelatorios) {

        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "SELECT * FROM relatorios WHERE id_relatorio = ?";
            conn = conexao.conectar();
            pstmt.setInt(1, idRelatorios);
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery(sql);

                if (rs.next()) {
                    Relatorios relatorio = new Relatorios();
                    relatorio.setIdRelatorios(rs.getInt("id_relatorios"));
                    relatorio.setDataCriacao(rs.getDate("data_criacao"));
                    relatorio.setPdfDocumento(rs.getString("pdf_documento"));
                    relatorio.setArea(rs.getString("area"));
                    return relatorios;
                }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            conexao.desconectar(conn);
        }
        return null;

    }
}
