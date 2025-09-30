package com.projybyraservletmvc.dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.projybyraservletmvc.model.*;
import com.projybyraservletmvc.conexao.ConexaoBD;

public class UsuarioDAO{
    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;


    //INSERT
    public boolean inserirDados(Usuario usuario) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = conexao.conectar();
        try {
            if (conn == null) {
                System.out.println("Conexão ainda não estabelecida, use o método 'conectar' primeiro.");
                return false;
            }

            String sql = "INSERT INTO usuario (email, cpf, nome, data_cadastro, data_nascimento, data_validade, id_industria, tempo_trabalho) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, usuario.getEmail());
            ps.setString(2, usuario.getCpf());
            ps.setString(3, usuario.getNome());
            ps.setDate(4, usuario.getDataCadastro());
            ps.setDate(5, usuario.getDataNascimento());
            ps.setDate(6, usuario.getDataValidade());
            ps.setInt(7, usuario.getIdIndustria());
            ps.setInt(8, usuario.getTempoTrabalho());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            conexao.desconectar(conn);
        }
    }


    //UPDATE
    public static boolean atualizar(Usuario usuario) {
        String sql = "UPDATE usuario SET email = ?, cpf = ?, nome = ?, data_cadastro = ?, data_nascimento = ?, data_validade = ?, id_industria = ?, tempo_trabalho = ? WHERE id_usuario = ?";
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = conexao.conectar();
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario.getEmail());
            stmt.setString(2, usuario.getCpf());
            stmt.setString(3, usuario.getNome());
            stmt.setDate(4, usuario.getDataCadastro());
            stmt.setDate(5, usuario.getDataNascimento());
            stmt.setDate(6, usuario.getDataValidade());
            stmt.setInt(7, usuario.getIdIndustria());
            stmt.setInt(8, usuario.getTempoTrabalho());
            stmt.setInt(9, usuario.getIdUsuario());
            if (stmt.executeUpdate() > 0) {return true;}
            else return false;
        } catch (SQLException e){
            e.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }

    }


    //READ
    public List<Usuario> lerDados() {
        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT * FROM usuario ORDER BY id_usuario ASC";
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = conexao.conectar();
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            System.out.println("Conteúdo da tabela usuário:");
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



    // DELETE
    public void deletar(int idUsuario){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = conexao.conectar();
        try {
            String sql = "DELETE FROM Usuario WHERE id_usuario= ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idUsuario);

            int linhasAfetadas = pstmt.executeUpdate();
            System.out.println("Linhas deletadas: " + linhasAfetadas);
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            conexao.desconectar(conn);
        }
    }

}
