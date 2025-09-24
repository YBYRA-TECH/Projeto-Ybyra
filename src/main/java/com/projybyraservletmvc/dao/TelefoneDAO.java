package com.projybyraservletmvc.dao;

import java.sql.*;
import com.projybyraservletmvc.model.*;
import com.projybyraservletmvc.conexao.*;

public class TelefoneDAO {

    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;


    //INSERT
    public boolean inserirTelefone(String numero, String tipo, int idUsuario){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "INSERT INTO telefone (numero, tipo, id_usuario) VALUES (?, ?, ?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, numero);
            pstmt.setString(2, tipo);
            pstmt.setInt(3, idUsuario);

            if(pstmt.executeUpdate()>0){
                return true;
            }return false;

        }catch (SQLException e){
            e.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }
    }

    // READ
    public void lerDados() {
        try {
            ConexaoBD conexao = new ConexaoBD();
            Connection conn = conexao.conectar();
            String sql = "SELECT * FROM telefone ORDER BY id_telefone ASC";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            ResultSetMetaData metaData = rs.getMetaData();
            int colunas = metaData.getColumnCount();

            System.out.println("Conteúdo da tabela telefone:");
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

    // UPDATE
    public boolean atualizarNumero(Telefone telefone) {
        String sql = "UPDATE telefone SET numero = ?, tipo = ?, id_usuario = ?";
        ConexaoBD conexao = new ConexaoBD();
        try (Connection conn = conexao.conectar();

             PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setString(1, telefone.getNumero());
            stmt.setString(2, telefone.getTipo());
            stmt.setInt(3, telefone.getIdUsuario());

            if (stmt.executeUpdate() > 0) return true;
            return false;
        } catch (SQLException sqle){
            sqle.printStackTrace();
            return false;
        }
    }


    // DELETE
    public void deletar(int idTelefone) {
        try {
            ConexaoBD conexao = new ConexaoBD();
            Connection conn = conexao.conectar();
            String sql = "DELETE FROM telefone WHERE id_telefone = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idTelefone);

            int linhasAfetadas = pstmt.executeUpdate();
            System.out.println("Linhas deletadas: " + linhasAfetadas);
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}