package com.projybyraservletmvc.dao;
import com.projybyraservletmvc.conexao.ConexaoBD;
import com.projybyraservletmvc.dao.interfaces.GenericDAO;
import com.projybyraservletmvc.dao.interfaces.IIndustriaDAO;
import com.projybyraservletmvc.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class IndustriaDAO implements GenericDAO<Industria>, IIndustriaDAO<Industria>{
    
    // VARIAVEIS
    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;


    //INSERE UMA NOVA INDÚSTRIA NO BANCO DE DADOS
    @Override
    public boolean inserir(Industria industria){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try{
            conn = conexao.conectar();

            String sql = "INSERT INTO industria(nome, email, cnpj, senha) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, industria.getNome());
            pstmt.setString(2, industria.getEmail());
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
    @Override
    public boolean atualizar(Industria industria) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "UPDATE industria SET nome = ?, email = ?, cnpj = ?, senha = ? WHERE id_industria = ?";
            conn = conexao.conectar();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, industria.getNome());
            stmt.setString(2, industria.getEmail());
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
    @Override
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
    @Override
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

    @Override
    public Industria login(String email, String senha) {
        ConexaoBD conexaoBD = new ConexaoBD();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            System.out.println("=== Conectando ao banco para autenticação ===");
            conn = conexaoBD.conectar();

            String sql = "SELECT * FROM industria WHERE email = ? AND senha = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, senha);
            rs = stmt.executeQuery();

            if (rs.next()) {
                System.out.println("Usuário encontrado!");

                Industria industria = new Industria(
                        rs.getString("nome"),
                        rs.getString("cnpj"),
                        rs.getString("email"),
                        rs.getString("senha")
                );

                return industria;
            } else {
                System.out.println("Usuário não encontrado ou senha incorreta");
                return null;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexaoBD.desconectar(conn);

            }
        return null;
    }

    public int buscarID(String nomeIndustria) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "SELECT id_industria FROM industria WHERE nome = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nomeIndustria);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("id_industria");
            }
            return 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            conexao.desconectar(conn);
        }
    }


}