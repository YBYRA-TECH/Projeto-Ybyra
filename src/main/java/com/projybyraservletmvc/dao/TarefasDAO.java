package com.projybyraservletmvc.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.projybyraservletmvc.conexao.ConexaoBD;
import com.projybyraservletmvc.model.Tarefas;

public class TarefasDAO {

    // INSERE NOVA TAREFA NO BANCO DE DADOS
    public boolean inserirDados(Tarefas tarefas) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "INSERT INTO tarefas (descricao, nome, prazo, prioridade, responsavel, id_usuario) VALUES (?, ?, ?, ?, ?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, tarefas.getDescricao());
            pstmt.setString(2, tarefas.getNome());
            pstmt.setDate(3, Date.valueOf(tarefas.getPrazo()));
            pstmt.setString(4, tarefas.getPrioridade());
            pstmt.setString(5, tarefas.getResponsavel());
            pstmt.setInt(6, tarefas.getId_usuario());

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            conexao.desconectar(conn);
        }
    }

    // ATUALIZA UMA TAREFA EXISTENTE NO BANCO DE DADOS
    public boolean atualizar(Tarefas tarefas) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "UPDATE tarefas SET descricao = ?, nome = ?, prazo = ?, prioridade = ?, responsavel = ? WHERE id_tarefa = ?";
            conn = conexao.conectar();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, tarefas.getDescricao());
            pstmt.setString(2, tarefas.getNome());
            pstmt.setDate(3, Date.valueOf(tarefas.getPrazo()));
            pstmt.setString(4, tarefas.getPrioridade());
            pstmt.setString(5, tarefas.getResponsavel());
            pstmt.setInt(6, tarefas.getId_tarefa());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            conexao.desconectar(conn);
        }
    }

    // BUSCA TODAS AS TAREFAS CADASTRADAS NO BANCO DE DADOS
    public List<Tarefas> buscar() {
        List<Tarefas> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "SELECT * FROM tarefas ORDER BY id_tarefa ASC";
            conn = conexao.conectar();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Tarefas tarefa = new Tarefas();
                tarefa.setId_tarefa(rs.getInt("id_tarefa"));
                tarefa.setDescricao(rs.getString("descricao"));
                tarefa.setNome(rs.getString("nome"));
                tarefa.setPrazo(rs.getDate("prazo").toLocalDate());
                tarefa.setPrioridade(rs.getString("prioridade"));
                tarefa.setResponsavel(rs.getString("responsavel"));
                tarefa.setId_usuario(rs.getInt("id_usuario"));

                lista.add(tarefa);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexao.desconectar(conn);
        }
        return lista;
    }

    public List<Tarefas> buscarPorUsuario(int id_usuario) {
        List<Tarefas> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "SELECT * FROM tarefas WHERE id_usuario = ?";
            conn = conexao.conectar();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id_usuario);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Tarefas tarefa = new Tarefas();
                tarefa.setId_tarefa(rs.getInt("id_tarefa"));
                tarefa.setDescricao(rs.getString("descricao"));
                tarefa.setNome(rs.getString("nome"));
                tarefa.setPrazo(rs.getDate("prazo").toLocalDate());
                tarefa.setPrioridade(rs.getString("prioridade"));
                tarefa.setResponsavel(rs.getString("responsavel"));
                tarefa.setId_usuario(rs.getInt("id_usuario"));

                lista.add(tarefa);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexao.desconectar(conn);
        }
        return lista;
    }

    // DELETA UMA TAREFA DO BANCO DE DADOS COM BASE NO ID
    public int deletar(int idTarefa) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;

        try {
            conn = conexao.conectar();
            String sql = "DELETE FROM tarefas WHERE id_tarefa = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idTarefa);

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

    // BUSCA UMA TAREFA ESPECÍFICA POR ID
    public Tarefas buscarTarefa(int idTarefa) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "SELECT * FROM tarefas WHERE id_tarefa = ?";
            conn = conexao.conectar();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idTarefa);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                Tarefas tarefa = new Tarefas();
                tarefa.setId_tarefa(rs.getInt("id_tarefa"));
                tarefa.setDescricao(rs.getString("descricao"));
                tarefa.setNome(rs.getString("nome"));
                tarefa.setPrazo(rs.getDate("prazo").toLocalDate());
                tarefa.setPrioridade(rs.getString("prioridade"));
                tarefa.setResponsavel(rs.getString("responsavel"));
                tarefa.setId_usuario(rs.getInt("id_usuario"));
                return tarefa;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexao.desconectar(conn);
        }
        return null;
    }


// BUSCA O QUE O USUARIO DIGITAR NA PESQUISA
    public List<Tarefas> buscarComParametro(String texto) {
        List<Tarefas> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "SELECT * FROM tarefas where descricao LIKE ? OR nome LIKE ? OR responsavel LIKE ? OR  TO_CHAR(prazo, 'DD/MM/YYYY') LIKE ?";
            conn = conexao.conectar();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            String busca = "%" + texto + "%" ;
            pstmt.setString(1, busca);
            pstmt.setString(2, busca);
            pstmt.setString(3, busca);
            pstmt.setString(4, busca);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Tarefas tarefa = new Tarefas();
                tarefa.setId_tarefa(rs.getInt("id_tarefa"));
                tarefa.setDescricao(rs.getString("descricao"));
                tarefa.setNome(rs.getString("nome"));
                tarefa.setPrazo(rs.getDate("prazo").toLocalDate());
                tarefa.setPrioridade(rs.getString("prioridade"));
                tarefa.setResponsavel(rs.getString("responsavel"));
                tarefa.setId_usuario(rs.getInt("id_usuario"));

                lista.add(tarefa);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexao.desconectar(conn);
        }
        return lista;
    }

    public int deletarPorPrioridade(String prioridade) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;

        try {
            conn = conexao.conectar();
            String sql = "DELETE FROM tarefas WHERE prioridade = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, prioridade);

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
}