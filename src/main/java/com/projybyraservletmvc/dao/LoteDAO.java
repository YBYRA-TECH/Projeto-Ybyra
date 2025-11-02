package com.projybyraservletmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import com.projybyraservletmvc.conexao.ConexaoBD;
import com.projybyraservletmvc.dao.interfaces.GenericDAO;
import com.projybyraservletmvc.dao.interfaces.ILoteDAO;
import com.projybyraservletmvc.model.Lote;

public class LoteDAO implements GenericDAO<Lote>, ILoteDAO<Lote> {

    public boolean inserir(Lote lote) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "INSERT INTO lote (descricao, responsavel, producao, planejado, " +
                    "problemas,id_industria, id_relatorio) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, lote.getDescricao());
            ps.setString(2, lote.getResponsavel());
            ps.setInt(3, lote.getProducao());
            ps.setInt(4, lote.getPlanejado());
            ps.setInt(5, lote.getProblemas());
            ps.setInt(6, lote.getId_industria());
            ps.setInt(7, lote.getId_relatorio());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            conexao.desconectar(conn);
        }
    }

    //BUSCA OS LOTES COM BASE NO ID INDUSTRIA

    public List<Lote> buscarPorIndustria(int id_industria) {
        List<Lote> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "SELECT l.id_lote, l.descricao, r.turno, r.area, l.responsavel, " +
                    "l.eficiencia, l.producao, l.planejado, l.problemas, l.observacao, " +
                    "l.id_industria, l.id_relatorio " +
                    "FROM lote l " +
                    "INNER JOIN relatorios r ON l.id_relatorio = r.id_relatorio " +
                    "WHERE l.id_industria = ? " +
                    "ORDER BY l.id_lote";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id_industria);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id_lote");
                String indice = rs.getString("descricao");
                String turno = rs.getString("turno");
                String area = rs.getString("area");
                String responsavel = rs.getString("responsavel");
                Double desempenho = rs.getDouble("eficiencia");

                Lote lote = new Lote(id, indice, turno, area, responsavel, desempenho);

                lote.setProducao(rs.getInt("producao"));
                lote.setPlanejado(rs.getInt("planejado"));
                lote.setProblemas(rs.getInt("problemas"));
                lote.setId_industria(rs.getInt("id_industria"));
                lote.setId_relatorio(rs.getInt("id_relatorio"));

                lista.add(lote);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexao.desconectar(conn);
        }
        return lista;
    }
    public List<Lote> buscar() {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        Lote lote = null;
        List<Lote> lista = new ArrayList<>();

        try {
            conn = conexao.conectar();
            String sql = "SELECT l.*, r.turno, r.area " +
                    "FROM lote l " +
                    "INNER JOIN relatorios r ON l.id_relatorio = r.id_relatorio " ;
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                lote = new Lote(
                        rs.getInt("id_lote"),
                        rs.getString("descricao"),
                        rs.getString("turno"),
                        rs.getString("area"),
                        rs.getString("responsavel"),
                        rs.getDouble("eficiencia")
                );

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
            String sql = "SELECT l.*, r.turno, r.area " +
                    "FROM lote l " +
                    "INNER JOIN relatorios r ON l.id_relatorio = r.id_relatorio " +
                    "WHERE l.id_lote = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                lote = new Lote(
                        rs.getInt("id_lote"),
                        rs.getString("descricao"),
                        rs.getString("turno"),
                        rs.getString("area"),
                        rs.getString("responsavel"),
                        rs.getDouble("eficiencia")
                );
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
            String sql = "UPDATE lote SET descricao = ?, responsavel = ?, producao = ?, " +
                    "planejado = ?, problemas = ?, id_relatorio = ? " +
                    "WHERE id_lote = ? AND id_industria = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, lote.getDescricao());
            pstmt.setString(2, lote.getResponsavel());
            pstmt.setInt(3, lote.getProducao());
            pstmt.setInt(4, lote.getPlanejado());
            pstmt.setInt(5, lote.getProblemas());
            pstmt.setInt(6, lote.getId_relatorio());
            pstmt.setInt(7, lote.getId_lote());
            pstmt.setInt(8, lote.getId_industria());

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            conexao.desconectar(conn);
        }
    }

    // DELETA OS LOTES COM BASE NO ID INDUSTRIA

    public int deletarPorIndustria(int id_industria) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "DELETE FROM lote WHERE id_industria = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id_industria);

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

    public List<Lote> buscarPorRelatorio(int idRelatorio) {
        List<Lote> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = "SELECT l.*, r.turno, r.area " +
                    "FROM lote l " +
                    "INNER JOIN relatorios r ON l.id_relatorio = r.id_relatorio " +
                    "WHERE l.id_relatorio = ? " +
                    "ORDER BY l.id_lote ASC";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idRelatorio);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Lote lote = new Lote(
                        rs.getInt("id_lote"),
                        rs.getString("descricao"),
                        rs.getString("turno"),
                        rs.getString("area"),
                        rs.getString("responsavel"),
                        rs.getDouble("eficiencia")
                );

                lote.setProducao(rs.getInt("producao"));
                lote.setPlanejado(rs.getInt("planejado"));
                lote.setProblemas(rs.getInt("problemas"));
                lote.setId_industria(rs.getInt("id_industria"));
                lote.setId_relatorio(rs.getInt("id_relatorio"));

                lista.add(lote);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexao.desconectar(conn);
        }
        return lista;
    }

    //BUSCA OS LOTES COM BASE NOS PARAMETROS QUE O USUARIO PESQUISAR

    public List<Lote> buscarComFiltros(int id_industria, String area, String turno, String eficiencia, String busca) {
        List<Lote> lotes = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = conexao.conectar();

            String sql = "SELECT l.*, r.turno, r.area, r.id_industria " +
                    "FROM lote l " +
                    "INNER JOIN relatorios r ON l.id_relatorio = r.id_relatorio " +
                    "WHERE r.id_industria = ? ";

            boolean temArea = (area != null && !area.isEmpty());
            if (temArea) {
                sql += "AND r.area = ? ";
            }

            boolean temTurno = (turno != null && !turno.isEmpty());
            if (temTurno) {
                sql += "AND r.turno = ? ";
            }

            if (eficiencia != null && !eficiencia.isEmpty()) {
                if (eficiencia.equals("Alta")) {
                    sql += "AND l.eficiencia >= 76 ";
                } else if (eficiencia.equals("Média")) {
                    sql += "AND l.eficiencia >= 37 AND l.eficiencia < 76 ";
                } else if (eficiencia.equals("Baixa")) {
                    sql += "AND l.eficiencia < 37 ";
                }
            }

            boolean temBusca = (busca != null && !busca.trim().isEmpty());
            if (temBusca) {
                sql += "AND (CAST(l.id_lote AS TEXT) LIKE ? OR l.descricao LIKE ? OR l.responsavel LIKE ?) ";
            }

            sql += "ORDER BY l.id_lote DESC";

            stmt = conn.prepareStatement(sql);

            int i = 1;
            stmt.setInt(i++, id_industria);

            if (temArea) {
                stmt.setString(i++, area);
            }

            if (temTurno) {
                stmt.setString(i++, turno);
            }

            if (temBusca) {
                String b = "%" + busca.trim() + "%";
                stmt.setString(i++, b);
                stmt.setString(i++, b);
                stmt.setString(i++, b);
            }

            rs = stmt.executeQuery();

            while (rs.next()) {
                Lote lote = new Lote();
                lote.setId_lote(rs.getInt("id_lote"));
                lote.setDescricao(rs.getString("descricao"));
                lote.setTurno(rs.getString("turno"));
                lote.setArea(rs.getString("area"));
                lote.setResponsavel(rs.getString("responsavel"));
                lote.setEficiencia(rs.getDouble("eficiencia"));
                lote.setId_industria(rs.getInt("id_industria"));
                lotes.add(lote);
            }

        } catch (SQLException e) {
            System.err.println("Erro ao buscar lotes: " + e.getMessage());
            e.printStackTrace();
        } finally {
           conexao.desconectar(conn);
        }

        return lotes;
    }
}