package com.projybyraservletmvc.servlet;

import com.projybyraservletmvc.dao.IndustriaDAO;
import com.projybyraservletmvc.model.Industria;
import com.projybyraservletmvc.util.EmailUtil; // ← E AQUI
import com.projybyraservletmvc.util.VerificacoesUtil;
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

        try {
            // VALIDAR EMAIL
            if (!VerificacoesUtil.validarEmail(email)){
                System.out.println("O email está incorreto!");
                request.setAttribute("erroEmail", "Ops! O email está incorreto!");
                request.setAttribute("nome", nome);
                request.setAttribute("email", email);
                request.getRequestDispatcher("/WEB-INF/views/autenticacao/index.jsp").forward(request, response);
                return;
            }
            // VALIDAR TELEFONE
            if (!VerificacoesUtil.validarTelefone(telefone)){
                System.out.println("O telefone está incorreto!");
                request.setAttribute("erroTel", "Ops! O telefone está incorreto!");
                request.setAttribute("nome", nome);
                request.setAttribute("telefone", telefone);
                request.getRequestDispatcher("/WEB-INF/views/autenticacao/index.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3> Erro: " + e.getMessage() + "</h3>");
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