package com.projybyraservletmvc.controller;


import com.projybyraservletmvc.dao.LoteDAO;
import com.projybyraservletmvc.dao.TarefasDAO;
import com.projybyraservletmvc.dao.UsuarioDAO;
import com.projybyraservletmvc.model.Lote;
import com.projybyraservletmvc.model.Tarefas;
import com.projybyraservletmvc.model.Usuario;
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

            if (session == null || session.getAttribute("usuarioLogado") == null &&
                    session.getAttribute("industriaLogada") == null) {
                response.sendRedirect(request.getContextPath() + "/pagina?nome=login");
                return;
            }
        }

        if ("tarefas".equals(nome)) {
            HttpSession session = request.getSession();

            Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

            if (usuarioLogado != null) {
                List<Tarefas> tarefas = (List<Tarefas>) session.getAttribute("tarefas");

                if (tarefas == null) {
                    try {
                        TarefasDAO dao = new TarefasDAO();

                        // Buscar apenas tarefas criadas por usuarios da mesma industria que o usuario logado

                        tarefas = dao.buscarPorIndustria(usuarioLogado.getIdIndustria());
                        System.out.println("Tarefas carregadas da indústria " + usuarioLogado.getIdIndustria() + ": " + tarefas.size());
                    } catch (Exception e) {
                        System.err.println("Erro ao carregar tarefas: " + e.getMessage());
                        e.printStackTrace();
                    }
                } else {
                    System.out.println("Tarefas vindas da busca: " + tarefas.size());
                    session.removeAttribute("tarefas");
                }

                request.setAttribute("tarefas", tarefas);
            } else {
                System.err.println("Usuário não está logado!");

                // Redirecionar para login se não tiver usuário logado (acho que nao tem como)

                response.sendRedirect(request.getContextPath() + "/pagina?nome=login");
                return;
            }
        }
        if ("tarefas".equals(nome) || "configuracoes".equals(nome)) {
            HttpSession session = request.getSession();

                Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

            if (usuarioLogado != null) {
                List<Usuario> usuarios = (List<Usuario>) session.getAttribute("usuarios");

                if (usuarios == null) {
                    try {
                        UsuarioDAO usuarioDAO = new UsuarioDAO();

                        // Buscar apenas usuários da mesma indústria

                        usuarios = usuarioDAO.buscarUsuarios(usuarioLogado.getIdIndustria());
                        System.out.println("Usuarios carregados da indústria " + usuarioLogado.getIdIndustria() + ": " + usuarios.size());
                    } catch (Exception e) {
                        System.err.println("Erro ao carregar usuários: " + e.getMessage());
                        e.printStackTrace();
                    }
                } else {
                    System.out.println("Usuarios vindos da cache: " + usuarios.size());
                    session.removeAttribute("usuarios");
                }

                request.setAttribute("usuarios", usuarios);
            } else {
                System.err.println("Usuário não está logado!");
            }
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

