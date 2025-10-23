package com.projybyraservletmvc.servlet;


import com.projybyraservletmvc.dao.UsuarioDAO;
import com.projybyraservletmvc.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginUsuarioSERVLET", urlPatterns = {"/loginUsuario"})
public class LoginUsuarioSERVLET extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
            request.getRequestDispatcher("/autentificação/login.jsp").forward(request, response);
            return;
        }

        try {
            System.out.println("Criando UsuarioDAO...");
            UsuarioDAO dao = new UsuarioDAO();

            System.out.println("Verificando credenciais...");
            Usuario usuario = dao.login(email, senha);

            if (usuario != null) {
                System.out.println("Login bem-sucedido!");

                // Criar sessão para o usuário
                HttpSession session = request.getSession();
                session.setAttribute("usuarioLogado", usuario);
                session.setAttribute("nomeUsuario", usuario.getNome());
                session.setAttribute("emailUsuario", usuario.getEmail());

                // Redirecionar para página principal
                response.sendRedirect(request.getContextPath() + "/web/inicio.jsp");

            } else {
                System.out.println("Credenciais inválidas!");
                request.setAttribute("erro", "Ops! O login está incorreto!");
                request.getRequestDispatcher("/autentificacao/login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro ao processar login: " + e.getMessage());
            request.getRequestDispatcher("/autentificacao/login.jsp").forward(request, response);
        }
    }
}