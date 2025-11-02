package com.projybyraservletmvc.servlet.loteSERVLET;

import com.projybyraservletmvc.dao.LoteDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/ExcluirLote")
public class ExcluirLoteSERVLET extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String id_industria = request.getParameter("id_industria");
        String id_lote = request.getParameter("id_lote");
        String acao = request.getParameter("acao");



        System.out.println("------------------- EXCLUIR TAREFA --------------------------------");
        System.out.println("Ação: "+ acao);
        System.out.println("Id_lote: " + id_lote);

        if("excluir".equals(acao) && id_lote != null) {
            int id_loteINT = Integer.parseInt(id_lote);
            System.out.println("O id do lote que sera deleto é: " + id_lote);
            LoteDAO dao = new LoteDAO();
            dao.deletar(id_loteINT);
        }
        if("excluirTodos".equals(acao)) {
            int id_industriaINT = Integer.parseInt(id_industria);
            System.out.println("Os lotes que estão na industria " + id_industriaINT + " serão deletados.");
            LoteDAO dao = new LoteDAO();
            dao.deletarPorIndustria(id_industriaINT);
        }

        response.sendRedirect(request.getContextPath() + "/pagina?nome=relatorios");
    }
}