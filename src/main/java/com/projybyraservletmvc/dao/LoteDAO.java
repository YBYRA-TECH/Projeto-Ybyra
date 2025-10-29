package com.projybyraservletmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.projybyraservletmvc.conexao.ConexaoBD;
import com.projybyraservletmvc.dao.interfaces.GenericDAO;
import com.projybyraservletmvc.dao.interfaces.ILoteDAO;
import com.projybyraservletmvc.model.Lote;

public class LoteDAO implements GenericDAO<Lote>, ILoteDAO<Lote> {

    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;

    public boolean inserir(Lote lote) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "INSERT INTO lote (descricao, responsavel, producao, planejado, problemas, observacao, id_industria, id_relatorio, eficiencia) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, lote.getDescricao());
            ps.setString(2, lote.getResponsavel());
            ps.setInt(3, lote.getProducao());
            ps.setInt(4, lote.getPlanejado());
            ps.setInt(5, lote.getProblemas());
            ps.setString(6, lote.getObservacao());
            ps.setInt(7, lote.getId_industria());
            ps.setInt(8, lote.getId_relatorio());
            ps.setDouble(9, lote.getEficiencia());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            conexao.desconectar(conn);
        }
    }

    public List<Lote> buscar() {
        List<Lote> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM lote ORDER BY id_lote ASC";

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id_lote");
                String descricao = rs.getString("descricao");
                String responsavel = rs.getString("responsavel");
                int producao = rs.getInt("producao");
                int planejado = rs.getInt("planejado");
                int problemas = rs.getInt("problemas");
                String observacao = rs.getString("observacao");
                int idIndustria = rs.getInt("id_industria");
                int idRelatorio = rs.getInt("id_relatorio");
                double eficiencia = rs.getDouble("eficiencia");

                Lote lote = new Lote(descricao, responsavel, producao, planejado, problemas,
                        observacao, idIndustria, idRelatorio, eficiencia);
                lote.setId_lote(id);
                lista.add(lote);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexao.desconectar(conn);
        }
        return lista;
    }

    public Lote buscarPorId(int id) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        Lote lote = null;
        try {
            conn = conexao.conectar();
            String sql = "SELECT * FROM lote WHERE id_lote = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                lote = new Lote(
                        rs.getString("descricao"),
                        rs.getString("responsavel"),
                        rs.getInt("producao"),
                        rs.getInt("planejado"),
                        rs.getInt("problemas"),
                        rs.getString("observacao"),
                        rs.getInt("id_industria"),
                        rs.getInt("id_relatorio"),
                        rs.getDouble("eficiencia")
                );
                lote.setId_lote(rs.getInt("id_lote"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexao.desconectar(conn);
        }
        return lote;
    }

    public boolean atualizar(Lote lote) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "UPDATE lote SET descricao = ?, responsavel = ?, producao = ?, planejado = ?, " +
                    "problemas = ?, observacao = ?, id_industria = ?, id_relatorio = ?, eficiencia = ? " +
                    "WHERE id_lote = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, lote.getDescricao());
            pstmt.setString(2, lote.getResponsavel());
            pstmt.setInt(3, lote.getProducao());
            pstmt.setInt(4, lote.getPlanejado());
            pstmt.setInt(5, lote.getProblemas());
            pstmt.setString(6, lote.getObservacao());
            pstmt.setInt(7, lote.getId_industria());
            pstmt.setInt(8, lote.getId_relatorio());
            pstmt.setDouble(9, lote.getEficiencia());
            pstmt.setInt(10, lote.getId_lote());

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            conexao.desconectar(conn);
        }
    }

    public int deletar(int id) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "DELETE FROM lote WHERE id_lote = ?";

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

    public List<Lote> buscarPorIndustria(int idIndustria) {
        List<Lote> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "SELECT * FROM lote WHERE id_industria = ? ORDER BY id_lote ASC";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idIndustria);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Lote lote = new Lote(
                        rs.getString("descricao"),
                        rs.getString("responsavel"),
                        rs.getInt("producao"),
                        rs.getInt("planejado"),
                        rs.getInt("problemas"),
                        rs.getString("observacao"),
                        rs.getInt("id_industria"),
                        rs.getInt("id_relatorio"),
                        rs.getDouble("eficiencia")
                );
                lote.setId_lote(rs.getInt("id_lote"));
                lista.add(lote);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexao.desconectar(conn);
        }
        return lista;
    }

    public List<Lote> buscarPorRelatorio(int idRelatorio) {
        List<Lote> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "SELECT * FROM lote WHERE id_relatorio = ? ORDER BY id_lote ASC";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idRelatorio);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Lote lote = new Lote(
                        rs.getString("descricao"),
                        rs.getString("responsavel"),
                        rs.getInt("producao"),
                        rs.getInt("planejado"),
                        rs.getInt("problemas"),
                        rs.getString("observacao"),
                        rs.getInt("id_industria"),
                        rs.getInt("id_relatorio"),
                        rs.getDouble("eficiencia")
                );
                lote.setId_lote(rs.getInt("id_lote"));
                lista.add(lote);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexao.desconectar(conn);
        }
        return lista;
    }
//    public List<Lote> buscarComParametro(String texto) {
//        List<Lote> lista = new ArrayList<>();
//        ConexaoBD conexao = new ConexaoBD();
//        Connection conn = null;
//        try {
//            conn = conexao.conectar();
//            String sql = "SELECT * FROM lote WHERE where descricao LIKE ? OR responsavel LIKE ? OR id_lote LIKE ?";
//            PreparedStatement pstmt = conn.prepareStatement(sql);
//            pstmt.setInt(1, idRelatorio);
//            ResultSet rs = pstmt.executeQuery();
//
//            while (rs.next()) {
//                Lote lote = new Lote(
//                        rs.getString("descricao"),
//                        rs.getString("responsavel"),
//                        rs.getInt("producao"),
//                        rs.getInt("planejado"),
//                        rs.getInt("problemas"),
//                        rs.getString("observacao"),
//                        rs.getInt("id_industria"),
//                        rs.getInt("id_relatorio"),
//                        rs.getDouble("eficiencia")
//                );
//                lote.setId_lote(rs.getInt("id_lote"));
//                lista.add(lote);
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            conexao.desconectar(conn);
//        }
//        return lista;
//    }
}