package com.projybyraservletmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.projybyraservletmvc.conexao.ConexaoBD;
import com.projybyraservletmvc.model.Telefone;

public class TelefoneDAO {

    // VARIAVEIS
    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;


    //INSERE NOVO TELEFONE NO BANCO DE DADOS
    public boolean inserirTelefone(Telefone telefone){
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

    // BUSCA TODOS OS TELEFONES CADASTRADOS NO BANCO DE DADOS
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

            //Exibindo os dados da tabela
            while (rs.next()) {
                int id = rs.getInt("id_telefone");
                String numero = rs.getString("numero");
                String tipo = rs.getString("tipo");
                int idUsuario = rs.getInt("id_usuario");
                //Cria um objeto da classe TelefoneDao no pacote model e adiciona na lista conforme os valores na tabela
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

    // ATUALIZA UM NÚMERO DE TELEFONE CADASTRADO NO BANCO DE DADOS COM BASE NO ID DO USUÁRIO
    public boolean atualizarNumero(Telefone telefone) { 
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


    // DELETA UM TELEFONE DO BANCO DE DADOS COM BASE NO NÚMERO 
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