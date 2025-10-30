package com.projybyraservletmvc.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.projybyraservletmvc.conexao.ConexaoBD;
import com.projybyraservletmvc.dao.interfaces.GenericDAO;
import com.projybyraservletmvc.model.Tarefas;


//METODOS CRUD PARA A TABELA TAREFAS
public class TarefasDAO implements GenericDAO<Tarefas> {

    @Override
    public boolean inserir(Tarefas tarefas) {
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

    @Override
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

    @Override
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

    public int deletar(String prioridade, int id_usuario) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;

        try {
            conn = conexao.conectar();
            String sql = "DELETE FROM tarefas " +
                    "WHERE prioridade = ? " +
                    "AND id_usuario IN (" +
                    "    SELECT id_usuario FROM usuario " +
                    "    WHERE id_industria = (" +
                    "        SELECT id_industria FROM usuario WHERE id_usuario = ?" +
                    "    )" +
                    ")";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, prioridade);
            pstmt.setInt(2, id_usuario);

            int linhasAfetadas = pstmt.executeUpdate();

            if (linhasAfetadas > 0) {
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
    public List<Tarefas> buscarPorIndustria(int id_industria) {
        List<Tarefas> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "SELECT t.*, u.nome as responsavel " +
                    "FROM tarefas t " +
                    "INNER JOIN usuario u ON t.id_usuario = u.id_usuario " +
                    "WHERE u.id_industria = ? " +
                    "ORDER BY t.id_tarefa ASC";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id_industria);

            ResultSet rs = pstmt.executeQuery();

            System.out.println("Buscando tarefas da indústria: " + id_industria);

            while (rs.next()) {
                int id = rs.getInt("id_tarefa");
                int idUsuario = rs.getInt("id_usuario");
                String prioridade = rs.getString("prioridade");
                String responsavel = rs.getString("responsavel");
                String nome = rs.getString("nome");
                LocalDate prazo = rs.getDate("prazo").toLocalDate();
                String descricao = rs.getString("descricao");

                Tarefas tarefa = new Tarefas(id,prioridade, responsavel, nome, prazo, descricao ,idUsuario);
                lista.add(tarefa);
            }

            System.out.println("Total de tarefas encontradas: " + lista.size());

        } catch (SQLException e) {
            System.err.println("Erro ao buscar tarefas por indústria: " + e.getMessage());
            e.printStackTrace();
        } finally {
            conexao.desconectar(conn);
        }
        return lista;
    }
}