package com.projybyraservletmvc.servlet.tarefasSERVLET;

import com.projybyraservletmvc.dao.TarefasDAO;
import com.projybyraservletmvc.dao.UsuarioDAO;
import com.projybyraservletmvc.model.Tarefas;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/AlterarTarefas")
public class AlterarTarefasSERVLET extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Processando alteração de tarefa");

        // Pegar o id_tarefa da sessão
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id_tarefa") == null) {
            System.out.println("Erro: Sessão inválida ou id_tarefa não encontrado!");
            response.getWriter().println("<h3>Erro: Dados da tarefa não encontrados!</h3>");
            return;
        }

        Integer id_tarefa = (Integer) session.getAttribute("id_tarefa");

        String prioridade = request.getParameter("prioridade");
        String responsavel = request.getParameter("responsavel");
        String nome = request.getParameter("nome");
        String prazo_String = request.getParameter("prazo");
        String descricao = request.getParameter("descricao");

        // Validação de campos vazios
        if (descricao == null || descricao.isEmpty() ||
                nome == null || nome.isEmpty() ||
                responsavel == null || responsavel.isEmpty() ||
                prioridade == null || prioridade.isEmpty() ||
                prazo_String == null || prazo_String.isEmpty()) {

            System.out.println("Erro: Campos vazios!");
            response.getWriter().println("<h3>Preencha todos os campos!</h3>");
            return;
        }

        try {
            // Buscar o ID do usuário responsável
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            int id_usuario = usuarioDAO.buscar(responsavel);



            // Converter a data
            LocalDate prazo = LocalDate.parse(prazo_String);


            System.out.println("Criando objeto Tarefas com ID: " + id_tarefa);
            Tarefas tarefa = new Tarefas(descricao, nome, prazo, prioridade, responsavel, id_usuario);
            tarefa.setId_tarefa(id_tarefa);

            // Atualizar no banco
            System.out.println("Criando TarefasDAO...");
            TarefasDAO tarefasDAO = new TarefasDAO();

            System.out.println("Atualizando dados no banco...");
            boolean sucesso = tarefasDAO.atualizar(tarefa);

            if (sucesso) {
                System.out.println("Tarefa alterada com sucesso!");
                // Limpar a sessão
                session.removeAttribute("id_tarefa");
                session.removeAttribute("id_usuario");
                session.removeAttribute("prioridade");
                session.removeAttribute("responsavel");
                session.removeAttribute("nome");
                session.removeAttribute("prazo");
                session.removeAttribute("descricao");

                response.sendRedirect(request.getContextPath() + "/pagina?nome=tarefas");
            } else {
                System.out.println("Erro ao atualizar no banco!");
                response.getWriter().println("<h3>Erro ao atualizar! Tente novamente.</h3>");
            }

        } catch (Exception e) {
            System.err.println("Erro ao processar alteração de tarefa:");
            e.printStackTrace();
            response.getWriter().println("<h3>Erro: " + e.getMessage() + "</h3>");
        }
    }
}