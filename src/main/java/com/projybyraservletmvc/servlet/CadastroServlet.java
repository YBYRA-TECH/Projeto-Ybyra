package com.projybyraservletmvc.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="CadastroServlet", value = "/cadastro")
public class CadastroServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        if (nome.isEmpty() || email.isEmpty() || senha.isEmpty()) {
            response.getWriter().println("<h3>Preencha todos os campos!</h3>");
            return;
        }

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("<h2>Cadastro realizado com sucesso!</h2>");
        response.getWriter().println("<p>Nome: " + nome + "</p>");
        response.getWriter().println("<p>Email: " + email + "</p>");
    }
}