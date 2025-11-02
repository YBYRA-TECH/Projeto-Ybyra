package com.projybyraservletmvc.servlet.tarefasSERVLET;



import com.projybyraservletmvc.dao.TarefasDAO;
import com.projybyraservletmvc.dao.UsuarioDAO;
import com.projybyraservletmvc.model.Tarefas;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;

//Classe servlet para inserir uma tarefa
@WebServlet(name = "TarefasSERVLET", urlPatterns = {"/AdicionarTarefa"})
public class TarefasSERVLET extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        System.out.println("doPost chamado no TarefasSERVLET");

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Receber dados

        String prioridade =  request.getParameter("prioridade");
        String nome = request.getParameter("nome");
        String responsavel = request.getParameter("responsavel");
        String descricao = request.getParameter("descricao");
        String prazo_String = request.getParameter("prazo");


            System.out.println("Dados recebidos:");
            System.out.println("Nome: " + nome);
            System.out.println("Desc: " + descricao);
            System.out.println("Responsavel: " + responsavel);
            System.out.println("Prioridade: " + prioridade);
            System.out.println("Prazo: " + prazo_String);

            // Validar campos vazios
            if (descricao.isEmpty() || nome.isEmpty() || responsavel.isEmpty() || prioridade.isEmpty() || prazo_String.isEmpty()) {
                System.out.println("Erro: Campos vazios!");
                response.getWriter().println("<h3> Preencha todos os campos!</h3>");
                return;
            }
        HttpSession session = request.getSession(false);
        if (session != null) {
            String nomeUsuario = (String) session.getAttribute("nomeUsuario");
            System.out.println("-----------------------------------------------------------------Nomes Usuario");
            System.out.println("Nome do usuario que inseriu a tarefa: "+ nomeUsuario);
            System.out.println("-----------------------------------------------------------------");
            UsuarioDAO dao = new UsuarioDAO();
            int id_usuario = dao.buscar(nomeUsuario);
            System.out.println("Id do usuario que adicionou uma Tarefa: " + id_usuario);

            try {
                LocalDate prazo = LocalDate.parse(prazo_String);
                System.out.println("Criando objeto Tarefas...");
                Tarefas tarefa = new Tarefas( descricao, nome, prazo, prioridade, responsavel, id_usuario);


                System.out.println("Criando TarefasDAO...");
                TarefasDAO tarefasDAO = new TarefasDAO();

                System.out.println("Inserindo dados no banco...");
                boolean sucesso = tarefasDAO.inserir(tarefa);

                if (sucesso) {
                    System.out.println("Tarefa inserida com sucesso!");
                    response.sendRedirect(request.getContextPath() + "/pagina?nome=tarefas");
                } else {
                    System.out.println("Erro ao carregar no banco!");
                    response.getWriter().println("<h3> Erro ao carregar! Tente novamente.</h3>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("<h3> Erro: " + e.getMessage() + "</h3>");
            }
        }
    }}