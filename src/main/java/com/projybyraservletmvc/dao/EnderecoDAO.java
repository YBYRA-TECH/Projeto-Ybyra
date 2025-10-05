package com.projybyraservletmvc.dao;

import com.projybyraservletmvc.conexao.ConexaoBD;
import com.projybyraservletmvc.model.Endereco;
import com.projybyraservletmvc.model.Relatorios;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class EnderecoDAO {



    //INSERT
    public boolean inserirDados(Endereco endereco){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            conn = conexao.conectar();
            String sql = ("INSERT INTO endereco (id_industria, estado, cidade, cep, bairro, rua) VALUES (?, ?, ?, ?, ?, ?)");
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, endereco.getIdIndustria());
            pstmt.setString(2, endereco.getEstado());
            pstmt.setString(3, endereco.getCidade());
            pstmt.setString(4, endereco.getCep());
            pstmt.setString(5,endereco.getBairro());
            pstmt.setString(6, endereco.getRua());

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

    //READ
    public List<Endereco> buscar() {
        List<Endereco> lista = new ArrayList<>();
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = null;
        try {
            String sql = "SELECT * FROM endereco ORDER BY id_endereco ASC";
            conn = conexao.conectar();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id_endereco");
                int idIndustria = rs.getInt("id_industria");
                String estado = rs.getString("estado");
                String cidade = rs.getString("cidade");
                String cep = rs.getString("cep");
                String bairro = rs.getString("bairro");
                String rua = rs.getString("rua");


                Endereco end = new Endereco(
                    id, idIndustria, estado, cidade, cep, bairro, rua
                );
                lista.add(end);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            conexao.desconectar(conn);
        }
        return lista;
    }


}
