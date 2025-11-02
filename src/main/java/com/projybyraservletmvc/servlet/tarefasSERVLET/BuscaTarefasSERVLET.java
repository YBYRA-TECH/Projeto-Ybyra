package com.projybyraservletmvc.servlet.tarefasSERVLET;

import com.projybyraservletmvc.dao.TarefasDAO;
import com.projybyraservletmvc.model.Tarefas;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

//Classe servlet para buscar uma tarefa
@WebServlet("/BuscaTarefas")
public class BuscaTarefasSERVLET extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String busca = request.getParameter("busca");

        try {
            HttpSession session = request.getSession();

            if (busca != null && !busca.trim().isEmpty()) {
                TarefasDAO dao = new TarefasDAO();
                List<Tarefas> tarefasBusca = dao.buscarComParametro(busca);

                session.setAttribute("tarefas", tarefasBusca);
                session.setAttribute("buscaAtiva", true);

                System.out.println("Tarefas encontradas: " + tarefasBusca.size());
            }

            response.sendRedirect(request.getContextPath() + "/pagina?nome=tarefas&busca=true");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pagina?nome=tarefas");
        }
    } }