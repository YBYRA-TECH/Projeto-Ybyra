package com.projybyraservletmvc.servlet.usuarioSERVLET;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/DadosAlterarUsuario")
public class DadosAlterarUsuarioSERVLET extends HttpServlet {

    //CLASSE SERVLET PARA GUARDAR OS DADOS DO USUARIO

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Dados Alterar Tarefa");


        String id_usuarioStr = request.getParameter("id_usuario");
        String email = request.getParameter("email");
        String nome = request.getParameter("nome");


        System.out.println("Dados pegos:");
        System.out.println("Id_usuario: " + id_usuarioStr);
        System.out.println("Nome: " + nome);
        System.out.println("Email: " + email);


        int id_usuario = Integer.parseInt(id_usuarioStr);

        HttpSession session = request.getSession();
        session.setAttribute("id_usuario", id_usuario);
        session.setAttribute("nome", nome);
        session.setAttribute("email", email);

        System.out.println("Dados guardados com sucesso.");

        response.sendRedirect(request.getContextPath() + "/pagina?nome=alterarUsuario");
    }
}