package com.example.ybyraservlet.servlet;

import java.io.IOException;

import com.example.ybyraservlet.dao.IndustriaDAO;
import com.example.ybyraservlet.model.Industria;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CadastroSERVLET", urlPatterns = {"/cadastro"})
public class CadastroSERVLET extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
        System.out.println("=== CadastroSERVLET inicializado com sucesso! ===");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("=== doGet chamado - Redirecionando para cadastro.jsp ===");
        response.sendRedirect(request.getContextPath() + "/cadastro.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== doPost chamado no CadastroSERVLET ===");

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Receber dados
        String nome = request.getParameter("nome");
        String cnpj = request.getParameter("cnpj");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        System.out.println("Dados recebidos:");
        System.out.println("Nome: " + nome);
        System.out.println("CNPJ: " + cnpj);
        System.out.println("Email: " + email);

        // Validar
        if (nome == null || nome.isEmpty() ||
                cnpj == null || cnpj.isEmpty() ||
                email == null || email.isEmpty() ||
                senha == null || senha.isEmpty()) {

            System.out.println("Erro: Campos vazios!");
            response.getWriter().println("<h3>❌ Preencha todos os campos!</h3>");
            return;
        }

        try {
            System.out.println("Criando objeto Industria...");
            Industria industria = new Industria(nome, cnpj, email, senha);

            System.out.println("Criando IndustriaDAO...");
            IndustriaDAO dao = new IndustriaDAO();

            System.out.println("Inserindo dados no banco...");
            boolean sucesso = dao.inserirDados(industria);

            // Redirecionar baseado no resultado
            if (sucesso) {
                System.out.println("Cadastro realizado com sucesso!");
                request.setAttribute("mensagem", "Cadastro realizado com sucesso!");
                request.getRequestDispatcher("telaCon.jsp").forward(request, response);
            } else {
                System.out.println("Erro ao cadastrar no banco!");
                response.getWriter().println("<h3> Erro ao cadastrar! Tente novamente.</h3>");
            }
        } catch (Exception e) {
            System.err.println("Exceção capturada:");
            e.printStackTrace();
            response.getWriter().println("<h3> Erro: " + e.getMessage() + "</h3>");
        }
    }
}