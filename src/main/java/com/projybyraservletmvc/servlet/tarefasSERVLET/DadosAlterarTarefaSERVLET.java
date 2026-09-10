package com.projybyraservletmvc.servlet.tarefasSERVLET;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/DadosAlterarTarefa")
public class DadosAlterarTarefaSERVLET extends HttpServlet {

    //CLASSE SERVLET PARA GUARDAR OS DADOS DA TAREFA

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Dados Alterar Tarefa");

        String id_tarefaStr = request.getParameter("id_tarefa");
        String id_usuarioStr = request.getParameter("id_usuario");
        String prioridade = request.getParameter("prioridade");
        String responsavel = request.getParameter("responsavel");
        String nome = request.getParameter("nome");
        String prazo_String = request.getParameter("prazo");
        String descricao = request.getParameter("descricao");

        System.out.println("Dados pegos:");
        System.out.println("Id_tarefa: " + id_tarefaStr);
        System.out.println("Id_usuario: " + id_usuarioStr);
        System.out.println("Prioridade: " + prioridade);
        System.out.println("Responsavel: " + responsavel);
        System.out.println("Nome: " + nome);
        System.out.println("Prazo: " + prazo_String);
        System.out.println("Descrição: " + descricao);

        LocalDate prazo = LocalDate.parse(prazo_String);
        int id_usuario = Integer.parseInt(id_usuarioStr);
        int id_tarefa = Integer.parseInt(id_tarefaStr);

        HttpSession session = request.getSession();
        session.setAttribute("id_tarefa", id_tarefa);
        session.setAttribute("id_usuario", id_usuario);
        session.setAttribute("prioridade", prioridade);
        session.setAttribute("responsavel", responsavel);
        session.setAttribute("nome", nome);
        session.setAttribute("prazo", prazo);
        session.setAttribute("descricao", descricao);

        System.out.println("Dados guardados com sucesso.");

        response.sendRedirect(request.getContextPath() + "/pagina?nome=telaAlterar");
    }
}