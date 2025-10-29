package com.projybyraservletmvc.servlet;

import com.projybyraservletmvc.util.EmailUtil; // ← E AQUI
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/enviarParceria")
public class EnviarParceriaSERVLET extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String nome = request.getParameter("nome");
        String tipoIndustria = request.getParameter("tipoIndustria");

        if (email == null || email.trim().isEmpty() ||
                telefone == null || telefone.trim().isEmpty() ||
                nome == null || nome.trim().isEmpty() ||
                tipoIndustria == null || tipoIndustria.trim().isEmpty()) {

            request.setAttribute("erro", "Todos os campos são obrigatórios!");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        boolean emailEnviado = EmailUtil.enviarEmailParceria(nome, email, telefone, tipoIndustria);

        if (emailEnviado) {
            request.setAttribute("sucesso", "Solicitação enviada com sucesso! Entraremos em contato em breve.");
        } else {
            request.setAttribute("erro", "Erro ao enviar solicitação. Tente novamente mais tarde.");
        }

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}