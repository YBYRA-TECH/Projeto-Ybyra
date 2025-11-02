package com.projybyraservletmvc.dao;
import com.projybyraservletmvc.conexao.ConexaoBD;
import com.projybyraservletmvc.dao.interfaces.GenericDAO;
import com.projybyraservletmvc.dao.interfaces.IRelatoriosDAO;
import com.projybyraservletmvc.model.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

//METODOS CRUD PARA A TABELA RELATORIOS
public class RelatoriosDAO implements GenericDAO<Relatorios>, IRelatoriosDAO<Relatorios> {


    Relatorios relatorios = new Relatorios();

    @Override
    public boolean inserir(Relatorios relatorios){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = ("INSERT INTO relatorios (nome, area, id_usuario, pdf_documento,descricao,turno,responsavel,id_industria) VALUES (?, ?, ?,?,?,?,?,?)");
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, relatorios.getNome());
            pstmt.setString(2, relatorios.getArea());
            pstmt.setInt(3, relatorios.getIdUsuario());
            pstmt.setString(4, relatorios.getPdfDocumento());
            pstmt.setString(5, relatorios.getDescricao());
            pstmt.setString(6, relatorios.getTurno());
            pstmt.setString(7, relatorios.getResponsavel());
            pstmt.setInt(8, relatorios.getId_industria());






            if(pstmt.executeUpdate()>0) {
                return true;
            }
            return false;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }
    }

    @Override
    public boolean atualizar(Relatorios relatorios) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "UPDATE relatorios SET data_criacao = ?, pdf_documento = ?, id_usuario = ? WHERE id_relatorio = ?";
            conn = conexao.conectar();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setDate(1, relatorios.getDataCriacao());
            pstmt.setString(2, relatorios.getPdfDocumento());
            pstmt.setInt(3, relatorios.getIdUsuario());
            pstmt.setInt(4, relatorios.getIdRelatorios());

            if (pstmt.executeUpdate() > 0){
                return true;
            }else return false;
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return false;
        } finally {
            conexao.desconectar(conn);
        }

    }

    @Override
    public List<Relatorios> buscar() {
        List<Relatorios> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "SELECT * FROM relatorios ORDER BY id_usuario ASC";
            conn = conexao.conectar();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int idRelatorios = rs.getInt("id_relatorios");
                Date dataCriacao = rs.getDate("data_criacao");
                String pdf = rs.getString("pdf_documento");
                int idUser = rs.getInt("id_usuario");

                Relatorios rel = new Relatorios(
                        idRelatorios, dataCriacao, pdf, idUser
                );
                lista.add(rel);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            conexao.desconectar(conn);
        }
        return lista;
    }
    public List<Relatorios> buscar(int id_industria) {
        List<Relatorios> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "SELECT * FROM relatorios WHERE id_industria = ?";
            conn = conexao.conectar();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,id_industria);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Relatorios rel = new Relatorios();
                rel.setIdRelatorios(rs.getInt("id_relatorio"));
                rel.setNome(rs.getString("nome"));
                rel.setArea(rs.getString("area"));
                rel.setIdUsuario(rs.getInt("id_usuario"));
                rel.setPdfDocumento(rs.getString("pdf_documento"));
                rel.setDescricao(rs.getString("descricao"));
                rel.setTurno(rs.getString("turno"));
                rel.setResponsavel(rs.getString("responsavel"));
                rel.setDataCriacao(rs.getDate("data_criacao"));

                lista.add(rel);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            conexao.desconectar(conn);
        }
        return lista;
    }


    @Override
    public int deletar(int id_relatorio) {
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        PreparedStatement stmtLote = null;
        PreparedStatement stmtRelatorio = null;

        try {
            conn = conexao.conectar();

            // Deleta da tabela Lote
            String sqlTabelaLote = "DELETE FROM lote WHERE id_relatorio = ?";
            stmtLote = conn.prepareStatement(sqlTabelaLote);
            stmtLote.setInt(1, id_relatorio);
            stmtLote.executeUpdate();

            // Deleta da tabela relatorio
            String sqlRelatorio = "DELETE FROM relatorios WHERE id_relatorio = ?";
            stmtRelatorio = conn.prepareStatement(sqlRelatorio);
            stmtRelatorio.setInt(1, id_relatorio);
            int linhasAfetadas = stmtRelatorio.executeUpdate();

            System.out.println("Relatório " + id_relatorio + " deletado com sucesso!");

            if (linhasAfetadas > 0) {
                return 1;
            } else {
                return 0;
            }

        } catch (SQLException e) {
            System.err.println("Erro ao deletar relatório: " + e.getMessage());
            e.printStackTrace();
            return -1;
        } finally {
            conexao.desconectar(conn);
        }
    }
}
