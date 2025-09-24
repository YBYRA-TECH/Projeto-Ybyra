package com.projybyraservletmvc.dao;

import java.sql.*;
import java.time.LocalDate;

import com.projybyraservletmvc.model.*;
import com.projybyraservletmvc.conexao.ConexaoBD;

public class UsuarioDAO{
    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;


    //INSERT
    public boolean inserirDados(String email, String cpf, String nome, Date data_cadastro, Date data_nascimento, Date data_validade, int id_industria, int tempo_trabalho){
        ConexaoBD conexao = new ConexaoBD();
        Connection conn = conexao.conectar();
        try{
            if (conn == null){
            System.out.println("Conexão ainda não estabelecida, use o método 'conectar' primeiro.");
            return false;
        }
        String sql = ("INSERT INTO usuario(email, cpf, nome, data_cadastro, data_nascimento, data_validade, id_industria, tempo_trabalho) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, cpf);
            ps.setString(3, nome);
            ps.setDate(4, data_cadastro);
            ps.setDate(5, data_nascimento);
            ps.setDate(6, data_validade);
            ps.setInt(7, id_industria);
            ps.setInt(8, tempo_trabalho);
            ResultSet resultSet = ps.getResultSet();

            if (ps.executeUpdate()>0){
                return true;
            }return false;

        }catch (SQLException e){
            e.printStackTrace();
            return false;
        }finally {
            conexao.desconectar(conn);
        }
    }

    //UPDATE
    public static boolean atualizar(Usuario usuario) {
        String sql = "UPDATE usuario SET email = ?, cpf = ?, nome = ?, data_cadastro = ?, data_nascimento = ?, data_validade = ?, id_industria = ?, tempo_trabalho = ? WHERE id_usuario = ?";
        ConexaoBD conexao = new ConexaoBD();

        try (Connection conn = conexao.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setString(1, usuario.getEmail());
            stmt.setString(2, usuario.getCpf());
            stmt.setString(3, usuario.getNome());
            stmt.setDate(4, usuario.getDataCadastro());
            stmt.setDate(5, usuario.getDataNascimento());
            stmt.setDate(6, usuario.getDataValidade());
            stmt.setInt(7, usuario.getIdIndustria());
            stmt.setInt(8, usuario.getTempoTrabalho());
            stmt.setInt(9, usuario.getIdUsuario());
            if (stmt.executeUpdate() > 0) return true;
            return false;
        } catch (SQLException sqle){
            sqle.printStackTrace();
            return false;
        }

    }

    //READ
    public void lerDados() {
        try {
            ConexaoBD conexao = new ConexaoBD();
            try (Connection conn = conexao.conectar();
                 Statement st = conn.createStatement();
                 ResultSet rs = st.executeQuery("SELECT * FROM usuario ORDER BY id_usuario ASC")) {

                ResultSetMetaData metaData = rs.getMetaData();
                int colunas = metaData.getColumnCount();

                System.out.println("Conteúdo:");
                while (rs.next()) {
                    for (int i = 1; i <= colunas; i++) {
                        String nomeColuna = metaData.getColumnName(i);
                        String valor = rs.getString(i);
                        System.out.print(nomeColuna + ": " + valor + " | ");
                    }
                    System.out.println();
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // DELETE
    public void deletar(int idUsuario) throws SQLException {
        try {
            ConexaoBD conexao = new ConexaoBD();
            Connection conn = conexao.conectar();
            String sql = "DELETE FROM Usuario WHERE id_usuario= ?";

        PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idUsuario);

            int linhasAfetadas = pstmt.executeUpdate();
            System.out.println("Linhas deletadas: " + linhasAfetadas);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

}
