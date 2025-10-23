package com.projybyraservletmvc.dao;
import com.projybyraservletmvc.conexao.ConexaoBD;
import com.projybyraservletmvc.dao.interfaces.GenericDAO;
import com.projybyraservletmvc.dao.interfaces.IUsuarioDAO;
import com.projybyraservletmvc.model.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class UsuarioDAO implements GenericDAO<Usuario>, IUsuarioDAO<Usuario>{


    @Override
    public boolean inserir(Usuario usuario) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "INSERT INTO usuario (email, cpf, nome, data_cadastro, data_nascimento, data_validade, id_industria, tempo_trabalho) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            //efetuando a insercao no banco
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


    @Override
    public boolean atualizar(Usuario usuario) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "UPDATE usuario " +
                    "SET email = ?, cpf = ?, nome = ?, data_cadastro = ?, data_nascimento = ?, data_validade = ?, id_industria = ?, tempo_trabalho = ? " +
                    "WHERE id_usuario = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);


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
            if (pstmt.executeUpdate() > 0) {return true;}
            else return false;
        } catch (SQLException e){
            e.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }

    }


    @Override
    public List<Usuario> buscar() {
        List<Usuario> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM usuario ORDER BY id_usuario ASC";

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


    @Override
    public int deletar(int id){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "DELETE FROM Usuario WHERE id_usuario = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);


            pstmt.setInt(1, id);
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
