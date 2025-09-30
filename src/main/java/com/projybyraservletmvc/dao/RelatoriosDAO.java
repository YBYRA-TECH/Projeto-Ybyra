package com.projybyraservletmvc.dao;

import com.projybyraservletmvc.conexao.ConexaoBD;
import com.projybyraservletmvc.model.Relatorios;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RelatoriosDAO{

    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;
    Relatorios relatorios = new Relatorios();

    //INSERT
    public boolean inserirDados(Relatorios relatorios){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = conexao.conectar();
        try {
            if (conn == null){
                System.out.println("Conexão ainda não estabelecida, use o método 'conectar' primeiro.");
               return false;
            }
            String sql = ("INSERT INTO relatorios (data_criacao, pdf_documento, id_usuario) VALUES (?, ?, ?)");

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setDate(1, relatorios.getDataCriacao());
            pstmt.setString(2, relatorios.getPdfDocumento());
            pstmt.setInt(3, relatorios.getIdUsuario());

            if(pstmt.executeUpdate()>0) {
                return true;
            }
            return false;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }
    }

    //UPDATE
    public boolean atualizar(Relatorios relatorios) {
        String sql = "UPDATE relatorios SET data_criacao = ?, pdf_documento = ?, id_usuario = ?";
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setDate(1, relatorios.getDataCriacao());
            pstmt.setString(2, relatorios.getPdfDocumento());
            pstmt.setInt(3, relatorios.getIdUsuario());

            if (pstmt.executeUpdate() > 0){
                return true;
            }else return false;
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return false;
        } finally {
            conexao.desconectar(conn);
        }

    }

    //READ
    public List<Relatorios> lerDados() {
        List<Relatorios> lista = new ArrayList<>();
        String sql = "SELECT * FROM relatorios ORDER BY id_usuario ASC";
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = conexao.conectar();
        try {
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


    // DELETE
    public void deletar(int idRelatorios) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = conexao.conectar();
        try {
            String sql = "DELETE FROM relatorios WHERE id_relatorios = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idRelatorios);

            int linhasAfetadas = pstmt.executeUpdate();
            System.out.println("Linhas deletadas: " + linhasAfetadas);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            conexao.desconectar(conn);
        }
    }
}