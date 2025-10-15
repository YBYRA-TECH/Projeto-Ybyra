package com.ybyraservlet.dao;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ybyraservlet.model.*;
import com.ybyraservlet.conexao.ConexaoBD;

public class UsuarioDAO{

    // VARIAVEIS
    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;


    //INSERE UM NOVO USUÁRIO NO BANCO DE DADOS
    public boolean inserirDados(Usuario usuario) {
        ConexaoBD conexao = new ConexaoBD(); //Instanciando objeto da classe conexao
        Connection conn = null; //Inicializando atributo conn
        try {
            conn = conexao.conectar(); //Atribuindo o metodo conectar ao atributo 'conn'
            String sql = "INSERT INTO usuario (email, cpf, nome, data_cadastro, data_nascimento, data_validade, id_industria, tempo_trabalho) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)"; //STRING SQL

            PreparedStatement ps = conn.prepareStatement(sql); //transformando a String sql em um preparedStatement

            //efetuando a insercao no banco
            ps.setString(1, usuario.getEmail());
            ps.setString(2, usuario.getCpf());
            ps.setString(3, usuario.getNome());
            ps.setDate(4, usuario.getDataCadastro());
            ps.setDate(5, usuario.getDataNascimento());
            ps.setDate(6, usuario.getDataValidade());
            ps.setInt(7, usuario.getIdIndustria());
            ps.setInt(8, usuario.getTempoTrabalho());

            return ps.executeUpdate() > 0; //retornando o preparedStatement

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            conexao.desconectar(conn);
        }
    }


    //ATUALIZA UM USUÁRIO QUE EXISTE NO BANCO DE DADOS
    public static boolean atualizar(Usuario usuario) { //O metodo recebe um objeto da classe Usuario
        ConexaoBD conexao = new ConexaoBD(); //Inicializando um objeto da classe conexao
        Connection conn = null; //inicializando uma variavel da classe Connection
        try {
            conn = conexao.conectar(); //Atribuindo metodo conectar a variavel conn
            String sql = "UPDATE usuario " +
                    "SET email = ?, cpf = ?, nome = ?, data_cadastro = ?, data_nascimento = ?, data_validade = ?, id_industria = ?, tempo_trabalho = ? " +
                    "WHERE id_usuario = ?"; //String sql

            PreparedStatement pstmt = conn.prepareStatement(sql); //Transformando a string sql em comando com PreparedStatement


            //Atualizando os dados no banco
            pstmt.setString(1, usuario.getEmail());
            pstmt.setString(2, usuario.getCpf());
            pstmt.setString(3, usuario.getNome());
            pstmt.setDate(4, usuario.getDataCadastro());
            pstmt.setDate(5, usuario.getDataNascimento());
            pstmt.setDate(6, usuario.getDataValidade());
            pstmt.setInt(7, usuario.getIdIndustria());
            pstmt.setInt(8, usuario.getTempoTrabalho());
            pstmt.setInt(9, usuario.getIdUsuario());
            //Retornado os valores conforme o pstmt
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e){
            e.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }

    }


    //BUSCA TODOS OS USUÁRIOS CADASTRADOS NO BANCO DE DADOS
    public List<Usuario> buscar() { //O metodo retorna uma lista de objetos com todos os valores da tabela
        List<Usuario> lista = new ArrayList<>(); //Inicializando a lista
        ConexaoBD conexao = new ConexaoBD(); //Inicializando um objeto da classe ConexaoBD
        Connection conn = null; //Inicializando uma variavel da classe Connection
        try {
            conn = conexao.conectar(); //Atribuindo metodo conectar a variavel conn
            Statement stmt = conn.createStatement(); //Inicializando um Statement
            String sql = "SELECT * FROM usuario ORDER BY id_usuario ASC"; //String sql

            ResultSet rs = stmt.executeQuery(sql); //Transformando a String sql em ResultSet
            System.out.println("Conteúdo da tabela usuário:");

            //Exibindo os dados da tabela
            while (rs.next()) {
                int id = rs.getInt("id_usuario");
                String email = rs.getString("email");
                String cpf = rs.getString("cpf");
                String nome = rs.getString("nome");
                Date dtCadastro = rs.getDate("data_cadastro");
                Date dtNascimento = rs.getDate("data_nascimento");
                Date dtValidade = rs.getDate("data_validade");
                int idIndustria = rs.getInt("id_industria");
                int tempTrabalho = rs.getInt("tempo_trabalho");
                //Cria um objeto da classe model Usuario e adiciona na lista conforme os valores na tabela
                Usuario user = new Usuario(
                        id, email, cpf, nome,
                        dtCadastro, dtNascimento, dtValidade,
                        idIndustria, tempTrabalho
                );
                lista.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            conexao.desconectar(conn);
        }
        return lista;
    }



    // DELETA UM USUÁRIO DO BANCO DE DADOS COM BASE NO ID
    public int deletar(int id){ //Deleta de acordo com o nome passado no parametro
        ConexaoBD conexao = new ConexaoBD(); //Inicializando um objeto da classe ConexaoBD
        Connection conn = null; //Inicializando uma variavel da classe Connection
        try {
            conn = conexao.conectar(); //Atribuindo metodo conectar a variavel conn
            String sql = "DELETE FROM Usuario WHERE id_usuario = ?"; //String sql

            PreparedStatement pstmt = conn.prepareStatement(sql); //Preparando a String sql com PreparedStatement

            //Deletando no banco
            pstmt.setInt(1, id);
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