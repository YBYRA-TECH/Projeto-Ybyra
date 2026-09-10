package com.projybyraservletmvc.servlet.tarefasSERVLET;

import com.projybyraservletmvc.dao.TarefasDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

//Classe servlet para excluir uma tarefa
@WebServlet("/ExcluirTarefa")
public class ExcluirTarefaSERVLET extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String id = request.getParameter("id");
        String id_usuario = request.getParameter("id_usuario");
        String acao = request.getParameter("acao");
        String prioridade = request.getParameter("prioridade");


        System.out.println("------------------- EXCLUIR TAREFA --------------------------------");
        System.out.println("Ação: "+ acao);
        System.out.println("Prioridade: " + prioridade);

        if("excluir".equals(acao) && id != null) {
            int idTarefa = Integer.parseInt(id);
            System.out.println("O id da tarefa que sera deleta é: " + idTarefa);
            TarefasDAO dao = new TarefasDAO();
            dao.deletar(idTarefa);
        }
        if("excluirPrioridade".equals(acao) && prioridade != null) {
            int id_usuarioINT = Integer.parseInt(id_usuario);
            System.out.println("As tarefas que estão " + prioridade);
            TarefasDAO dao = new TarefasDAO();
            dao.deletar(prioridade, id_usuarioINT);
        }

        response.sendRedirect(request.getContextPath() + "/pagina?nome=tarefas");
    }
}