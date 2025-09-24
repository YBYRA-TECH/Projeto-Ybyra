package com.projybyraservletmvc.dao;

//import io.github.cdimascio.dotenv.Dotenv;
import java.sql.*;
import com.projybyraservletmvc.conexao.ConexaoBD;
import com.projybyraservletmvc.model.*;

public class IndustriaDAO{
    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;


    //INSERT
    public boolean inserirDados(String nome, String endereco, String cnpj, int numeroUsuarios){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = conexao.conectar();
        try{
            if (conn == null) {
                System.out.println("Conexão ainda não estabelecida, use o método 'conectar' primeiro.");
                return false;
            }
        //Statement stmt = conn.createStatement();
        String sql = ("INSERT INTO industria(nome, endereco, cnpj, numero_usuarios) VALUES (?, ?, ?, ?)");
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, nome);
        pstmt.setString(2, endereco);
        pstmt.setString(3, cnpj);
        pstmt.setInt(4, numeroUsuarios);

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
        String sql = "UPDATE industria SET nome = ?, endereco = ?, cnpj = ?, numero_usuarios = ? WHERE id_industria = ?";
        ConexaoBD conexaoDAO = new ConexaoBD();
        try (Connection conn = conexaoDAO.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)){
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
        }
    }

    //READ
    public void lerDados(){
        try {
            ConexaoBD conexao = new ConexaoBD();
            Connection conn = conexao.conectar();
            if (conn == null) {
                System.out.println("Conexão não iniciada, use o método 'conectar' primeiro.");
                return;
            }
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM industria ORDER BY id_industria ASC");
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
    public void deletar(int idIndustria){
        try {
            ConexaoBD conexao = new ConexaoBD();
            Connection conn = conexao.conectar();
            String sql = "DELETE FROM industria WHERE id_industria = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idIndustria);

            int linhasAfetadas = pstmt.executeUpdate();
            System.out.println("Linhas deletadas: " + linhasAfetadas);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
