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


public class UsuarioDAO implements GenericDAO<Usuario>, IUsuarioDAO<Usuario> {


    @Override
    public boolean inserir(Usuario usuario) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "INSERT INTO usuario (email, cpf, nome, data_cadastro, data_nascimento, data_validade, id_industria, tempo_trabalho) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement pstmt = conn.prepareStatement(sql);

            //efetuando a insercao no banco
            pstmt.setString(1, usuario.getEmail());
            pstmt.setString(2, usuario.getCpf());
            pstmt.setString(3, usuario.getNome());
            pstmt.setDate(4, Date.valueOf(usuario.getDataCadastro()));
            pstmt.setDate(5, Date.valueOf(usuario.getDataNascimento()));
            pstmt.setDate(6, usuario.getDataValidade());
            pstmt.setInt(7, usuario.getIdIndustria());
            pstmt.setInt(8, usuario.getTempoTrabalho());

            return pstmt.executeUpdate() > 0;

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
            pstmt.setDate(4, Date.valueOf(usuario.getDataCadastro()));
            pstmt.setDate(5, Date.valueOf(usuario.getDataNascimento()));
            pstmt.setDate(6, usuario.getDataValidade());
            pstmt.setInt(7, usuario.getIdIndustria());
            pstmt.setInt(8, usuario.getTempoTrabalho());
            pstmt.setInt(9, usuario.getIdUsuario());
            if (pstmt.executeUpdate() > 0) {
                return true;
            } else return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
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
                        dtCadastro.toLocalDate(), dtNascimento.toLocalDate(), dtValidade,
                        idIndustria, tempTrabalho
                );
                lista.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexao.desconectar(conn);
        }
        return lista;
    }


    @Override
    public int deletar(int id) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "DELETE FROM Usuario WHERE id_usuario = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);


            pstmt.setInt(1, id);
            if (pstmt.executeUpdate() > 0) {
                return 1;
            } else {
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        } finally {
            conexao.desconectar(conn);
        }
    }

    public int buscarID(String nome) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "SELECT id_usuario FROM usuario WHERE nome = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nome);
            ResultSet rs = pstmt.executeQuery();

            System.out.println("Buscando ID do usuário: " + nome);

            if (rs.next()) {
                int id = rs.getInt("id_usuario");
                System.out.println("ID encontrado: " + id);
                return id;
            }

            System.out.println("Usuário não encontrado");
            return 0;
        } catch (SQLException e) {
            System.err.println("Erro ao buscar ID do usuário: " + e.getMessage());
            e.printStackTrace();
            return 0;
        } finally {
            conexao.desconectar(conn);
        }

    }

    public Usuario login(String email, String senha) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            System.out.println("=== Conectando ao banco para autenticação de usuário ===");
            conn = conexao.conectar();

            String sql = "SELECT * FROM usuario WHERE email = ? AND senha = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, senha);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                System.out.println("Usuário encontrado!");

                Usuario usuario = new Usuario(
                        rs.getInt("id_usuario"),
                        rs.getString("email"),
                        rs.getString("cpf"),
                        rs.getString("nome"),
                        rs.getDate("data_cadastro").toLocalDate(),
                        rs.getDate("data_nascimento").toLocalDate(),
                        rs.getDate("data_validade"),
                        rs.getInt("id_industria"),
                        rs.getInt("tempo_trabalho")
                );
                return usuario;
            } else {
                System.out.println("Usuário não encontrado ou senha incorreta");
                return null;
            }
        } catch (SQLException e) {
            System.err.println("Erro ao fazer login: " + e.getMessage());
            e.printStackTrace();
            return null;
        } finally {
            conexao.desconectar(conn);
        }
    }
    public List<Usuario> buscarUsuarios(int id_industria) {
        List<Usuario> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "SELECT * FROM usuario WHERE id_industria = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id_industria);

            ResultSet rs = pstmt.executeQuery();



            System.out.println("Conteúdo da tabela usuário:");

            while (rs.next()) {
                int id = rs.getInt("id_usuario");
                String nome = rs.getString("nome");

                Usuario user = new Usuario(id, nome);
                lista.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexao.desconectar(conn);
        }
        return lista;
    }
}