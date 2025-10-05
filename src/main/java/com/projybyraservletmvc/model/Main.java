package com.projybyraservletmvc.model;

import com.projybyraservletmvc.conexao.*;
import com.projybyraservletmvc.dao.*;
import java.sql.Date;

public class Main {
    public static void main(String[] args) {
        //TESTANDO OS METODOS
        ConexaoBD conn = new ConexaoBD();
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
//            idta.buscar();
//            //idta.deletar(7);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }


        //USUARIO
        //try{
        UsuarioDAO user = new UsuarioDAO();

//       Date dataCadastro = Date.valueOf("2025-09-20");
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
           // System.out.println(user.buscar());
            //user.deletar(10);

       // } catch (Exception e) {
         //   e.printStackTrace();
        //}

        //RELATORIOS
        RelatoriosDAO rel = new RelatoriosDAO();
//        try {
//
//
//        Date dataCriacao = Date.valueOf("2025-09-26");
//        Date novaData = Date.valueOf("2025-09-28");
//        Relatorios relatorio = new Relatorios(1, novaData, "pdf123", 1);
////        if(rel.inserirDados(dataCriacao, "pdf1230mifow903", 1)){
////            System.out.println("Relatório inserido com sucesso");
////        }else System.out.println("Falha na inserção do relatório");
//        //rel.deletar(1);
////        rel.atualizar(relatorio);
//        System.out.println(rel.buscar());
//    }catch (Exception e){
//        e.printStackTrace();
//    }

        Date dataCriacao = Date.valueOf("2025-09-26");
        Date novaData = Date.valueOf("2025-09-28");

//    rel.inserirDados(1, dataCriacao, "pdf12904ndiqwdo/com.pdf", 1);


        //ENDERECO
        EnderecoDAO end = new EnderecoDAO();

        System.out.println(end.buscar());



        //Até agora tudo funcionando
    }
}
