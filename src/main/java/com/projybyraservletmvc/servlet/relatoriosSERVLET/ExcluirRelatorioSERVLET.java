package com.projybyraservletmvc.servlet.relatoriosSERVLET;



import com.projybyraservletmvc.dao.RelatoriosDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/ExcluirRelatorio")
public class ExcluirRelatorioSERVLET extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String id_relatorio = request.getParameter("id_relatorio");



        System.out.println("------------------- EXCLUIR RELATORIO --------------------------------");
        System.out.println("id_relatorio: " + id_relatorio);

        int id_relatorioINT = Integer.parseInt(id_relatorio);
        System.out.println("O id do relatorio que sera deletado é: " + id_relatorio);
        RelatoriosDAO dao = new RelatoriosDAO();
        dao.deletar(id_relatorioINT);



        response.sendRedirect(request.getContextPath() + "/pagina?nome=insercaoDados");
    }
}