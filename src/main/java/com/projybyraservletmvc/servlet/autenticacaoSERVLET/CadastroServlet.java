package com.projybyraservletmvc.servlet.autenticacaoSERVLET;

import java.io.IOException;

import com.projybyraservletmvc.dao.IndustriaDAO;
import com.projybyraservletmvc.model.Industria;

import com.projybyraservletmvc.util.VerificacoesUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CadastroSERVLET", urlPatterns = {"/cadastro"})
public class CadastroServlet extends HttpServlet {

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

        // Validar campos vazios
        if (nome == null || nome.isEmpty() ||
                cnpj == null || cnpj.isEmpty() ||
                email == null || email.isEmpty() ||
                senha == null || senha.isEmpty()) {

            System.out.println("Erro: Campos vazios!");
            response.getWriter().println("<h3> Preencha todos os campos!</h3>");
            return;
        }

        try {
            // VALIDAR CNPJ
            cnpj = VerificacoesUtil.validarCnpj(cnpj);
            if (cnpj == null) {
                System.out.println("O cnpj está incorreto!");
                request.setAttribute("erroCnpj", "Ops! O cnpj está incorreto!");
                request.setAttribute("nome", nome);
                request.setAttribute("email", email);
                request.setAttribute("senha", senha);
                request.getRequestDispatcher("/WEB-INF/views/autenticacao/cadastro.jsp").forward(request, response);
                return;
            }

            // AGORA SIM cria o objeto com o CNPJ limpo (só números)
            System.out.println("Criando objeto Industria...");
            Industria industria = new Industria(nome, cnpj, email, senha);

            // VALIDAR EMAIL
            if (!VerificacoesUtil.validarEmail(email)){
                System.out.println("O email está incorreto!");
                request.setAttribute("erroEmail", "Ops! O email está incorreto!");
                request.setAttribute("nome", nome);
                request.setAttribute("cnpj", cnpj);
                request.setAttribute("email", email);
                request.setAttribute("senha", senha);
                request.getRequestDispatcher("/WEB-INF/views/autenticacao/cadastro.jsp").forward(request, response);
                return;
            }

            // VALIDAR SENHA
            if (!VerificacoesUtil.validarSenha(senha)){
                System.out.println("A senha está incorreta!");
                request.setAttribute("erroSenha", "Ops! A senha está incorreta! Ela precisa ter no mínimo 8 dígitos e um número");
                request.setAttribute("nome", nome);
                request.setAttribute("cnpj", cnpj);
                request.setAttribute("email", email);
                request.setAttribute("senha", senha);
                request.getRequestDispatcher("/WEB-INF/views/autenticacao/cadastro.jsp").forward(request, response);
                return;
            }

            System.out.println("Criando IndustriaDAO...");
            IndustriaDAO dao = new IndustriaDAO();

            System.out.println("Inserindo dados no banco...");
            boolean sucesso = dao.inserir(industria);

            if (sucesso) {
                System.out.println("Cadastro realizado com sucesso!");
                request.setAttribute("mensagem", "Cadastro realizado com sucesso!");
                response.sendRedirect(request.getContextPath() + "/paginaAutenticacao?nome=telaCon");
            } else {
                System.out.println("Erro ao cadastrar no banco!");
                response.getWriter().println("<h3> Erro ao cadastrar! Tente novamente.</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3> Erro: " + e.getMessage() + "</h3>");
        }
    }
}