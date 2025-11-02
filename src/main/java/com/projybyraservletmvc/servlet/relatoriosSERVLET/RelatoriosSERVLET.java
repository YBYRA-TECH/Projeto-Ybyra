package com.projybyraservletmvc.servlet.relatoriosSERVLET;


import com.projybyraservletmvc.dao.RelatoriosDAO;
import com.projybyraservletmvc.dao.UsuarioDAO;
import com.projybyraservletmvc.model.Relatorios;
import com.projybyraservletmvc.model.Usuario;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

//Classe servlet para inserir relatorio
@WebServlet(name = "RelatoriosSERVLET", urlPatterns = {"/InsercaoDados"})
public class RelatoriosSERVLET extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        System.out.println("doPost chamado no relatorioSERVLET");

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Receber dados
        String nome =  request.getParameter("nome");
        String area = request.getParameter("area");
        String descricao = request.getParameter("descricao");
        String pdf_documento = request.getParameter("pdf");
        String turno = request.getParameter("turno");




        HttpSession session = request.getSession(false);
        if (session != null) {
            // Pegar o usuário logado da sessão
            Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

            if (usuarioLogado == null) {
                System.err.println("Usuário não está logado!");
                response.sendRedirect(request.getContextPath() + "/pagina?nome=login");
                return;
            }

            String nomeUsuario = usuarioLogado.getNome();
            int id_usuario = usuarioLogado.getIdUsuario();
            int id_industria = usuarioLogado.getIdIndustria();



        System.out.println("Dados recebidos:");
        System.out.println("Nome: " + nome);
        System.out.println("Desc: " + descricao);
        System.out.println("Area: " + area);
        System.out.println("PDF: " + pdf_documento);
        System.out.println("Turno: " + turno);
        System.out.println("Nome de quem inseriu o relatorio: " + nomeUsuario);
        System.out.println("Id usuario: " + id_usuario);
        System.out.println("Id indsutria: " + id_industria);



            // Validar campos vazios
        if (descricao.isEmpty() || area.isEmpty() || pdf_documento.isEmpty() || id_usuario == 0) {
            System.out.println("Erro: Campos vazios!");
            response.getWriter().println("<h3> Preencha todos os campos!</h3>");
            return;
        }

        try {
            System.out.println("Criando objeto Realtorios...");
            Relatorios relatorio = new Relatorios(nome, area, id_usuario, pdf_documento,descricao, turno, nomeUsuario, id_industria);


            System.out.println("Criando RelatoriosDAO...");
            RelatoriosDAO relatoriosDAO = new RelatoriosDAO();

            System.out.println("Inserindo dados no banco...");
            boolean sucesso = relatoriosDAO.inserir(relatorio);

            if (sucesso) {
                System.out.println("Relatorio carregado com sucesso!");
                response.sendRedirect(request.getContextPath() + "/pagina?nome=inicioBI");
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