
package com.ybyraservletmvc.servlet;

import java.io.IOException;

import com.ybyraservletmvc.dao.IndustriaDAO;
import com.ybyraservletmvc.model.Industria;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginSERVLET", urlPatterns = {"/login"})
public class LoginSERVLET extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== doPost chamado no LoginSERVLET ===");

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Receber dados do formulário
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        System.out.println("Tentativa de login:");
        System.out.println("Email: " + email);

        // Validar campos
        if (email == null || email.isEmpty() || senha == null || senha.isEmpty()) {
            System.out.println("Erro: Campos vazios!");
            request.setAttribute("erro", "Preencha todos os campos!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        try {
            System.out.println("Criando IndustriaDAO...");
            IndustriaDAO dao = new IndustriaDAO();

            System.out.println("Verificando credenciais...");
            Industria industria = dao.login(email, senha);

            if (industria != null) {
                System.out.println("Login bem-sucedido!");

                // Criar sessão para o usuário
                HttpSession session = request.getSession();
                session.setAttribute("usuarioLogado", industria);
                session.setAttribute("nomeUsuario", industria.getNome());
                session.setAttribute("emailUsuario", email);

                // Redirecionar para página principal
                response.sendRedirect(request.getContextPath() + "/index.jsp");

            } else {
                System.out.println("Credenciais inválidas!");
                request.setAttribute("erro", "Ops! O login está incorreto!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro ao processar login: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}