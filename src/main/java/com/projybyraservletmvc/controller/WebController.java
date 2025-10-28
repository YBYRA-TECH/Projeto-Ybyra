package com.projybyraservletmvc.controller;

import com.projybyraservletmvc.dao.LoteDAO;
import com.projybyraservletmvc.dao.TarefasDAO;
import com.projybyraservletmvc.model.Lote;
import com.projybyraservletmvc.model.Tarefas;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/pagina")
public class WebController extends HttpServlet {

    // Páginas que NÃO precisam de login
    private boolean isPaginaPublica(String nome) {
        return "login".equals(nome) ||
                "cadastro".equals(nome) ||
                "sobre".equals(nome) ||
                "contato".equals(nome);
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processarRequisicao(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processarRequisicao(request, response);
    }

    private void processarRequisicao(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");

        // Verificar se a página precisa de login
        if (!isPaginaPublica(nome)) {
            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("usuarioLogado") == null) {
                response.sendRedirect(request.getContextPath() + "/pagina?nome=login");
                return;
            }
        }

        if ("tarefas".equals(nome)) {
            HttpSession session = request.getSession();

            List<Tarefas> tarefas = (List<Tarefas>) session.getAttribute("tarefas");

            if (tarefas == null) {
                try {
                    TarefasDAO dao = new TarefasDAO();
                    tarefas = dao.buscar();
                    System.out.println("Tarefas carregadas do banco: " + tarefas.size());
                } catch (Exception e) {
                    System.err.println("Erro ao carregar tarefas: " + e.getMessage());
                    e.printStackTrace();
                }
            } else {
                System.out.println("Tarefas vindas da busca: " + tarefas.size());
                session.removeAttribute("tarefas");
            }

            request.setAttribute("tarefas", tarefas);
        }
        if ("relatorios".equals(nome)) {
            HttpSession session = request.getSession();

            List<Lote> lote = (List<Lote>) session.getAttribute("lote");

            if (lote == null) {
                try {
                    LoteDAO loteDAO = new LoteDAO();
                    lote = loteDAO.buscar();
                    System.out.println("Tarefas carregadas do banco: " + lote.size());
                } catch (Exception e) {
                    System.err.println("Erro ao carregar tarefas: " + e.getMessage());
                    e.printStackTrace();
                }
            } else {
                System.out.println("Lotes vindos da busca: " + lote.size());
                session.removeAttribute("lote");
            }

            request.setAttribute("lote", lote);
        }

        String caminho = "/WEB-INF/views/web/" + nome + ".jsp";
        request.getRequestDispatcher(caminho).forward(request, response);
    }
}

