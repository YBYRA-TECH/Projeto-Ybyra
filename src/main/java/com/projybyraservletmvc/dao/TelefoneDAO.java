package com.projybyraservletmvc.dao;
import com.projybyraservletmvc.conexao.ConexaoBD;
import com.projybyraservletmvc.dao.interfaces.GenericDAO;
import com.projybyraservletmvc.dao.interfaces.ITelefoneDAO;
import com.projybyraservletmvc.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

//CLASSE COM METODOS CRUD PARA TELEFONE
public class TelefoneDAO implements GenericDAO<Telefone>, ITelefoneDAO<Telefone> {

    @Override
    public boolean inserir(Telefone telefone){
        ConexaoBD conexao = new ConexaoBD(); 
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "INSERT INTO telefone (numero, tipo, id_usuario) VALUES (?, ?, ?)";

            PreparedStatement pstmt = conn.prepareStatement(sql);

            //Efetuando a insercao no banco
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

    @Override
    public List<Telefone> buscar() {
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

    @Override
    public boolean atualizar(Telefone telefone) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try{
            conn = conexao.conectar();
            String sql = "UPDATE telefone SET numero = ?, tipo = ?, id_usuario = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);

            //Atualizando os dados no banco
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

    @Override
    public int deletar(String numero) {
        ConexaoBD conexao = new ConexaoBD(); 
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "DELETE FROM telefone WHERE numero = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, numero);

            if(pstmt.executeUpdate()>0){ 
                return 1;
            }else{return 0;}
        }catch (SQLException e){
            e.printStackTrace();
            return -1;
        }finally {
            conexao.desconectar(conn);
        }
    }
}