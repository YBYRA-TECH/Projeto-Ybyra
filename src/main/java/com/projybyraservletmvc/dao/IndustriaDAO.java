package com.projybyraservletmvc.dao;

//import io.github.cdimascio.dotenv.Dotenv;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.projybyraservletmvc.conexao.ConexaoBD;
import com.projybyraservletmvc.model.Industria;

public class IndustriaDAO{
    
    // VARIAVEIS
    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;


    //INSERE UMA NOVA INDÚSTRIA NO BANCO DE DADOS
    public boolean inserirDados(Industria industria){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try{
            conn = conexao.conectar();

            String sql = "INSERT INTO industria(nome, endereco, cnpj, senha) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, industria.getNome());
            pstmt.setString(2, industria.getEndereco());
            pstmt.setString(3, industria.getCnpj());
            pstmt.setString(4, industria.getSenha());


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

    //ATUALIZA UMA INDÚSTRIA NO BANCO DE DADOS
    public static boolean atualizarIndustria(Industria industria) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "UPDATE industria SET nome = ?, endereco = ?, cnpj = ?, senha = ? WHERE id_industria = ?";
            conn = conexao.conectar();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, industria.getNome());
            stmt.setString(2, industria.getEndereco());
            stmt.setString(3, industria.getCnpj());
            stmt.setInt(4, industria.getIdIndustria());
            stmt.setString(5, industria.getSenha());

            if (stmt.executeUpdate() > 0) return true;
            return false;
        } catch (SQLException sqle){
            sqle.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }
    }

    //BUSCA TODAS AS INDÚSTRIAS CADASTRADAS NO BANCO DE DADOS
    public List<Industria> buscar(){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        List<Industria> lista = new ArrayList<>();
        try {
            String sql = ("SELECT * FROM industria ORDER BY id_industria ASC");
            conn = conexao.conectar();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            System.out.println("Conteúdo da tabela indústria:");

            while (rs.next()) {
                int id = rs.getInt("id_industria");
                String nome = rs.getString("nome");
                String endereco = rs.getString("endereco");
                String cnpj = rs.getString("cnpj");
                String senha = rs.getString("senha");

                Industria industria = new Industria(
                        id,
                        nome,
                        endereco,
                        cnpj,
                        senha
                );
                lista.add(industria);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            conexao.desconectar(conn);
        }
        return lista;
    }

    // DELETA UMA INDÚSTRIA DO BANCO DE DADOS COM BASE NO ID
    public int deletar(int idIndustria){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "DELETE FROM industria WHERE id_industria = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idIndustria);

            if(pstmt.executeUpdate() > 0){
                return 1;
            }else{return 0;}
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }finally {
            conexao.desconectar(conn);
        }
    }

}
