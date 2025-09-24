package com.projybyraservletmvc.model;

import com.projybyraservletmvc.conexao.ConexaoBD;
import com.projybyraservletmvc.dao.*;

import java.util.Date;

public class Main {
    public static void main(String[] args) {
        //TESTANDO OS METODOS
        ConexaoBD conn = new ConexaoBD();
        RelatoriosDAO rel = new RelatoriosDAO();
        TelefoneDAO tel = new TelefoneDAO();


        //INDUSTRIA
//        IndustriaDAO idta = new IndustriaDAO();
//        Industria industria = new Industria(2, "Italakinho IDTA", "Av. Celso Garcia 2034 - Tatuapé - SP", "11814883000154", 45);
//        try {
//            if (idta.inserirDados("Metalúrgica Silva", "Av. Paulista 1302", "12345678901234", 120)){
//                System.out.println("Inserção feita com sucesso no banco de dados");
//            }else {
//                System.out.println("Erro na inserção! Consulte o terminal");
//            }
//            if (idta.atualizarIndustria(industria)){
//                System.out.println("Atualização feita com sucesso no terminal");
//            }else {
//                System.out.println("Erro na atualização! Consulte o terminal");
//            }
//            idta.lerDados();
//            //idta.deletar(7);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }


        //USUARIO
        try{
        UsuarioDAO user = new UsuarioDAO();
//        Date date = new Date();
//        Date dataCadastro = Date.valueOf("2025-09-20");
//        Date dataNascimento = Date.valueOf("2010-04-11");
//        Date dataValidade = Date.valueOf("2028-09-21");
//
//        Usuario usuario = new Usuario(14, "davi.oliveira@friboi.org.br", "44152058801", "Lacerda", dataCadastro, dataNascimento,
//                dataValidade, 14, 205);
//
//            if ( user.inserirDados("davi.oliveira@gmail.com", "44157058801", "Davi", dataCadastro, dataNascimento,
//                    dataValidade, 14, 10)){
//
//                System.out.println("Inserção feita com sucesso no banco de dados");
//            }else {
//                System.out.println("Erro na inserção! Consulte o terminal");
//            }
//            if(user.atualizar(usuario)){
//                System.out.println("Atualização feita com sucesso no banco de dados!");
//            }else {
//                System.out.println("Erro na atualização! Consulte o terminal");
//            }
            user.lerDados();
            //user.deletar(10);

        } catch (Exception e) {
            e.printStackTrace();
        }


        //Até agora tudo funcionando
    }
}
