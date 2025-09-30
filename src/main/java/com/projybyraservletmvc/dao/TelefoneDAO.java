package com.projybyraservletmvc.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.projybyraservletmvc.model.*;
import com.projybyraservletmvc.conexao.*;

public class TelefoneDAO {

    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;


    //INSERT
    public boolean inserirTelefone(Telefone telefone){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "INSERT INTO telefone (numero, tipo, id_usuario) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, telefone.getNumero());
            pstmt.setString(2, telefone.getTipo());
            pstmt.setInt(3, telefone.getIdUsuario());

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
    public List<Telefone> lerDados() {
        List<Telefone> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "SELECT * FROM telefone ORDER BY id_telefone ASC";
            conn = conexao.conectar();

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            System.out.println("Conteúdo da tabela telefone:");

            while (rs.next()) {
                int id = rs.getInt("id_telefone");
                String numero = rs.getString("numero");
                String tipo = rs.getString("tipo");
                int idUsuario = rs.getInt("id_usuario");

                Telefone tel = new Telefone(
                        id,
                        numero,
                        tipo,
                        idUsuario
                );
                lista.add(tel);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }finally {
            conexao.desconectar(conn);
        }
    return lista;
}

    // UPDATE
    public boolean atualizarNumero(Telefone telefone) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try{
            String sql = "UPDATE telefone SET numero = ?, tipo = ?, id_usuario = ?";
            conn = conexao.conectar();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, telefone.getNumero());
            stmt.setString(2, telefone.getTipo());
            stmt.setInt(3, telefone.getIdUsuario());

            if (stmt.executeUpdate() > 0) return true;
            return false;
        } catch (SQLException sqle){
            sqle.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }
    }


    // DELETE
    public void deletar(int idTelefone) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "DELETE FROM telefone WHERE id_telefone = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idTelefone);

            int linhasAfetadas = pstmt.executeUpdate();
            System.out.println("Linhas deletadas: " + linhasAfetadas);
        }catch (SQLException e) {
            e.printStackTrace();
        }finally {
            conexao.desconectar(conn);
        }
    }
}