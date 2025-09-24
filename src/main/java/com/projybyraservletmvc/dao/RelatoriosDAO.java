package com.projybyraservletmvc.dao;

import java.sql.*;

import com.projybyraservletmvc.conexao.ConexaoBD;
import com.projybyraservletmvc.model.*;

public class RelatoriosDAO{

    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;



    //INSERT
    public boolean inserirDados(Date data_criacao, String pdf_documento, int id_Usuario){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            if (conn == null){
                System.out.println("Conexão ainda não estabelecida, use o método 'conectar' primeiro.");
               return false;
            }
            String sql = ("INSERT INTO relatorios (data_criacao, pdf_documento, id_usuario) VALUES (?, ?, ?)");

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setDate(1, data_criacao);
            pstmt.setString(2, pdf_documento);
            pstmt.setInt(3, id_Usuario);

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
    public boolean atualizar(Relatorios relatorios){
        String sql = "UPDATE relatorios SET data_criacao = ?, pdf_documento = ?, id_usuario = ?";
        ConexaoBD conexao = new ConexaoBD();
        try (Connection conn = conexao.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setDate(1, relatorios.getDataCriacao());
            stmt.setString(2, relatorios.getPdfDocumento());
            stmt.setInt(3, relatorios.getIdUsuario());

            if (stmt.executeUpdate() > 0) return true;
            return false;
        } catch (SQLException sqle){
            sqle.printStackTrace();
            return false;
        }
    }

    //READ
    public void lerDados() {
        try {
            ConexaoBD conexao = new ConexaoBD();
            Connection conn = conexao.conectar();

            if (conn == null) {
                System.out.println("Conexão não iniciada, use o método 'conectar' primeiro.");
                return;
            }
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM relatorios ORDER BY id_relatorios ASC");
            ResultSetMetaData metaData = rs.getMetaData();
            int colunas = metaData.getColumnCount();

            System.out.println("Conteúdo:");
            while (rs.next()) {
                for (int i = 1; i <= colunas; i++) {
                    String nomeColuna = metaData.getColumnName(i);
                    String valor = rs.getString(i);
                    System.out.print(nomeColuna + ": " + valor + " | ");
                }
                System.out.println();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // DELETE
    public void deletar(int idRelatorio) {
        try {
            String sql = "DELETE FROM id_relatorio WHERE id_relatorio = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idRelatorio);

            int linhasAfetadas = pstmt.executeUpdate();
            System.out.println("Linhas deletadas: " + linhasAfetadas);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
