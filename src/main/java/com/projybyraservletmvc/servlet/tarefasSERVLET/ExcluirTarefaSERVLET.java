package com.projybyraservletmvc.servlet.tarefasSERVLET;

import com.projybyraservletmvc.dao.TarefasDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/ExcluirTarefa")
public class ExcluirTarefaSERVLET extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String id = request.getParameter("id");
        String acao = request.getParameter("acao");

        if("excluir".equals(acao) && id != null) {
            int idTarefa = Integer.parseInt(id);
            System.out.println("O id da tarefa que sera deleta é: " + idTarefa);
            TarefasDAO dao = new TarefasDAO();
            dao.deletar(idTarefa);
        }

        response.sendRedirect(request.getContextPath() + "/pagina?nome=tarefas");
    }
}