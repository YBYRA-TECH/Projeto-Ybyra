package com.projybyraservletmvc.servlet.autenticacaoSERVLET;

import com.projybyraservletmvc.dao.IndustriaDAO;
import com.projybyraservletmvc.dao.UsuarioDAO;
import com.projybyraservletmvc.model.Usuario;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "CadastroUsuario", urlPatterns = {"/cadastroUsuario"})
public class CadastroUsuarioSERVLET extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws  IOException {

        System.out.println(" doPost chamado no CadastroSERVLET");

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Receber dados
        String nome = request.getParameter("nome");
        String data_nasc_String = request.getParameter("data_nasc");
        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        String industria = request.getParameter("industria");

        IndustriaDAO daoInd = new IndustriaDAO();
        int idIndustria = daoInd.buscarID(industria);

        System.out.println("Dados recebidos:");
        System.out.println("Nome: " + nome);
        System.out.println("Data de nascimento: " + data_nasc_String);
        System.out.println("Cpf: " + cpf);
        System.out.println("Email: " + email);
        System.out.println("Id Industria:" + idIndustria);

        // Validar campos vazios
        if (nome == null || nome.isEmpty() ||
                data_nasc_String == null || data_nasc_String.isEmpty() ||
                cpf == null || cpf.isEmpty() ||
                email == null || email.isEmpty() ||
                senha == null || senha.isEmpty()) {

            System.out.println("Erro: Campos vazios!");
            response.getWriter().println("<h3> Preencha todos os campos!</h3>");
            return;
        }


        try {
            LocalDate data_nasc = LocalDate.parse(data_nasc_String);
            System.out.println("Criando objeto Usuario...");
            Usuario usuario = new Usuario(email, cpf, nome, data_nasc,senha,idIndustria);

            // VALIDAR CNPJ
            if (!usuario.validarCpf()){
                System.out.println("O cpf está incorreto!");
                request.setAttribute("erroCpf", "Ops! O cpf está incorreto!");
                request.setAttribute("nome", nome);
                request.setAttribute("cpf", cpf);
                request.setAttribute("email", email);
                request.setAttribute("senha", senha);
                request.getRequestDispatcher("/WEB-INF/views/autenticacao/cadastroUsuario.jsp").forward(request, response);
                return;
            }

            // VALIDAR EMAIL
            if (!usuario.validarEmail()){
                System.out.println("O email está incorreto!");
                request.setAttribute("erroEmail", "Ops! O email está incorreto!");
                request.setAttribute("nome", nome);
                request.setAttribute("cpf", cpf);
                request.setAttribute("email", email);
                request.setAttribute("senha", senha);
                request.getRequestDispatcher("/WEB-INF/views/autenticacao/cadastroUsuario.jsp").forward(request, response);
                return;
            }

            // VALIDAR SENHA
            if (!usuario.validarSenha()){
                System.out.println("A senha está incorreta!");
                request.setAttribute("erroSenha", "Ops! A senha está incorreta! Ela precisa ter no mínimo 8 dígitos e um número");
                request.setAttribute("nome", nome);
                request.setAttribute("cpf", cpf);
                request.setAttribute("email", email);
                request.setAttribute("senha", senha);
                request.getRequestDispatcher("/WEB-INF/views/autenticacao/cadastroUsuario.jsp").forward(request, response);
                return;
            }

            System.out.println("Criando UsuarioDao...");
            UsuarioDAO dao = new UsuarioDAO();

            System.out.println("Inserindo dados no banco...");
            boolean sucesso = dao.inserir(usuario);

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
}}