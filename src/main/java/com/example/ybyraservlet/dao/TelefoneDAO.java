package com.example.ybyraservlet.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.example.ybyraservlet.conexao.ConexaoBD;
import com.example.ybyraservlet.model.Telefone;

public class TelefoneDAO {

    // VARIAVEIS
    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;


    //INSERE NOVO TELEFONE NO BANCO DE DADOS
    public boolean inserirTelefone(Telefone telefone){ //
        ConexaoBD conexao = new ConexaoBD(); //Instanciando objeto da classe conexao
        Connection conn = null; //Inicializando atributo conn
        try {
            conn = conexao.conectar();//Atribuindo o metodo conectar ao atributo 'conn'
            String sql = "INSERT INTO telefone (numero, tipo, id_usuario) VALUES (?, ?, ?)"; //String sql

            PreparedStatement pstmt = conn.prepareStatement(sql); //Transformando a String sql em um preparedStatement

            //Efetuando a insercao no banco
            pstmt.setString(1, telefone.getNumero());
            pstmt.setString(2, telefone.getTipo());
            pstmt.setInt(3, telefone.getIdUsuario());

            //Retornando o preparedStatement
            return pstmt.executeUpdate() > 0;

        }catch (SQLException e){
            e.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }
    }

    // BUSCA TODOS OS TELEFONES CADASTRADOS NO BANCO DE DADOS
    public List<Telefone> buscar() { //O metodo retorna uma lista de objetos com todos os valores da tabela
        List<Telefone> lista = new ArrayList<>(); //Inicializando a lista
        ConexaoBD conexao = new ConexaoBD(); //Inicializando um objeto da classe ConexaoBD
        Connection conn = null;//Inicializando uma variavel da classe Connection
        try {
            String sql = "SELECT * FROM telefone ORDER BY id_telefone ASC"; //String sql
            conn = conexao.conectar(); //Inicializando um Statement

            Statement stmt = conn.createStatement(); //Inicializando um Statement
            ResultSet rs = stmt.executeQuery(sql);//Transformando a String sql em ResultSet
            System.out.println("Conteúdo da tabela telefone:");

            //Exibindo os dados da tabela
            while (rs.next()) {
                int id = rs.getInt("id_telefone");
                String numero = rs.getString("numero");
                String tipo = rs.getString("tipo");
                int idUsuario = rs.getInt("id_usuario");
                //Cria um objeto da classe model Usuario e adiciona na lista conforme os valores na tabela
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
    public boolean atualizarNumero(Telefone telefone) { //O metodo recebe um objeto da classe Telefone
        ConexaoBD conexao = new ConexaoBD(); //Inicializando um objeto da classe conexao
        Connection conn = null; //inicializando uma variavel da classe Connection
        try{
            conn = conexao.conectar(); //Atribuindo metodo conectar a variavel conn
            String sql = "UPDATE telefone SET numero = ?, tipo = ?, id_usuario = ?"; //String sql
            PreparedStatement stmt = conn.prepareStatement(sql); //Transformando a string sql em comando com PreparedStatement

            //Atualizando os dados no banco
            stmt.setString(1, telefone.getNumero());
            stmt.setString(2, telefone.getTipo());
            stmt.setInt(3, telefone.getIdUsuario());

            return stmt.executeUpdate() > 0; //Retornado os valores conforme o pstmt
        } catch (SQLException sqle){
            sqle.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }
    }


    // DELETA UM TELEFONE DO BANCO DE DADOS COM BASE NO NÚMERO
    public int deletar(String numero) { //Deleta de acordo com o nome passado no parametro
        ConexaoBD conexao = new ConexaoBD(); //Inicializando um objeto da classe ConexaoBD
        Connection conn = null; //Inicializando uma variavel da classe Connection
        try {
            conn = conexao.conectar(); //Atribuindo metodo conectar a variavel conn
            String sql = "DELETE FROM telefone WHERE numero = ?"; //String sql

            PreparedStatement pstmt = conn.prepareStatement(sql); //Preparando a String sql com PreparedStatement
            //Deletando no banco
            pstmt.setString(1, numero); //Retornando valores conforme o pstmt.executeUpdate()

            if(pstmt.executeUpdate()>0){ //Retornando valores conforme o pstmt.executeUpdate()
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