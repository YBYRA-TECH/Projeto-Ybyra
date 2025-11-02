package com.projybyraservletmvc.controller;

import com.projybyraservletmvc.dao.LoteDAO;
import com.projybyraservletmvc.dao.RelatoriosDAO;
import com.projybyraservletmvc.dao.TarefasDAO;
import com.projybyraservletmvc.dao.UsuarioDAO;
import com.projybyraservletmvc.model.*;
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

            if (session == null || (session.getAttribute("usuarioLogado") == null &&
                    session.getAttribute("industriaLogada") == null)) {
                response.sendRedirect(request.getContextPath() + "/pagina?nome=login");
                return;
            }
        }

        // Carregar dados específicos de cada página


        if ("tarefas".equals(nome)) {

            carregarTarefasPorIndustria(request, response);

            carregarUsuariosPorIndustria(request, response);
        }

        if ("funcionarios".equals(nome)) {

            carregarUsuariosPorIndustria(request, response);

        }

        if ("relatorios".equals(nome)) {

            carregarLotes(request, response);

        }
        if ("insercaoDados".equals(nome)) {

            carregarRelatorios(request, response);

        }

        String caminho = "/WEB-INF/views/web/" + nome + ".jsp";
        request.getRequestDispatcher(caminho).forward(request, response);
    }

    //----------------------------------MÉTODOS---------------------------------------------//

    // Páginas que NÃO precisam de login
    private boolean isPaginaPublica(String nome) {
        return "login".equals(nome) ||
                "cadastro".equals(nome) ||
                "sobre".equals(nome) ||
                "contato".equals(nome);
    }

    // Metodo para obter o id_industria

    private Integer obterIdIndustria(HttpSession session) {
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
        if (usuarioLogado != null) {
            return usuarioLogado.getIdIndustria();
        }

        Industria industriaLogada = (Industria) session.getAttribute("industriaLogada");
        if (industriaLogada != null) {
            return industriaLogada.getIdIndustria();
        }

        return null;
    }

    //Carrega as tarefas com base no id industria dos usuarios.

    private void carregarTarefasPorIndustria(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        if (usuarioLogado == null) {
            System.err.println("Usuário não está logado!");
            response.sendRedirect(request.getContextPath() + "/pagina?nome=login");
            return;
        }

        List<Tarefas> tarefas = (List<Tarefas>) session.getAttribute("tarefas");

        if (tarefas == null) {
            try {
                TarefasDAO dao = new TarefasDAO();
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
    }

    //Carrega os usuarios  com o mesmo id_industria do que o que está logado ou da da industria que esta logada.

    private void carregarUsuariosPorIndustria(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession();

        // Buscar ID da indústria (Usuario OU Industria)
        Integer idIndustria = obterIdIndustria(session);

        if (idIndustria == null) {
            System.err.println("ID da indústria não encontrado!");
            response.sendRedirect(request.getContextPath() + "/pagina?nome=login");
            return;
        }

        List<Usuario> usuarios = (List<Usuario>) session.getAttribute("usuarios");

        if (usuarios == null) {
            try {
                UsuarioDAO usuarioDAO = new UsuarioDAO();
                usuarios = usuarioDAO.buscarUsuariosPorIndustria(idIndustria);
                System.out.println("Usuarios carregados da indústria " + idIndustria + ": " + usuarios.size());
            } catch (Exception e) {
                System.err.println("Erro ao carregar usuários: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            System.out.println("Usuarios vindos da cache: " + usuarios.size());
            session.removeAttribute("usuarios");
        }

        request.setAttribute("usuarios", usuarios);
    }
    /**Carrega os lotes com base nos relatorios que foram inseridos.

    Carrega os lotes com base na indústria do usuário logado
    **/
    private void carregarLotes(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession();

        Integer idIndustria = obterIdIndustria(session);

        if (idIndustria == null) {
            System.err.println("ID da indústria não encontrado!");
            response.sendRedirect(request.getContextPath() + "/pagina?nome=login");
            return;
        }

        List<Lote> lote = (List<Lote>) session.getAttribute("lote");

        if (lote == null) {
            try {
                LoteDAO dao = new LoteDAO();
                lote = dao.buscarPorIndustria(idIndustria);
                System.out.println("Lotes carregados da indústria " + idIndustria + ": " + lote.size());
            } catch (Exception e) {
                System.err.println("Erro ao carregar lotes: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            System.out.println("Lotes vindos da busca: " + lote.size());
        }

        session.setAttribute("lote", lote);
    }

    // Metodo para mostrar os relatorios na pagina insercaoDados.

    private void carregarRelatorios(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession();

        Integer idIndustria = obterIdIndustria(session);

        if (idIndustria == null) {
            System.err.println("Id industria não encontrado!");
            response.sendRedirect(request.getContextPath() + "/pagina?nome=login");
            return;
        }

        List<Relatorios> relatorios = (List<Relatorios>) session.getAttribute("relatorios");


        if (relatorios == null) {
            try {
                RelatoriosDAO dao = new RelatoriosDAO();
                relatorios = dao.buscar(idIndustria);
                System.out.println("Relatórios carregados da indústria " + idIndustria + ": " + relatorios.size());
            } catch (Exception e) {
                System.err.println("Erro ao carregar relatórios: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            System.out.println("Relatórios vindos da busca: " + relatorios.size());
            session.removeAttribute("relatorios");
        }

        request.setAttribute("relatorios", relatorios);
    }
}
