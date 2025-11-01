package com.projybyraservletmvc.servlet.usuarioSERVLET;

import com.projybyraservletmvc.dao.UsuarioDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/excluirUsuario")
public class ExcluirUsuarioSERVLET extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String id_usuario = request.getParameter("id_usuario");
        String acao = request.getParameter("acao");
        String id_industria = request.getParameter("id_industria");


        System.out.println("------------------- EXCLUIR USUARIO --------------------------------");
        System.out.println("Ação: "+ acao);
        System.out.println("ID: " + id_usuario);

        if("excluir".equals(acao) && id_usuario != null) {
            int id_usuarioINT = Integer.parseInt(id_usuario);
            System.out.println("O id da tarefa que sera deleta é: " + id_usuarioINT);
            UsuarioDAO dao = new UsuarioDAO();
            dao.deletar(id_usuarioINT);
        }
        if("excluirTodos".equals(acao) && id_industria != null) {
            int id_industriaINT = Integer.parseInt(id_industria);
            System.out.println("Os usuarios da industria " + id_industria + " foram deletados.");
            UsuarioDAO dao = new UsuarioDAO();
            dao.deletarPorIndustria(id_industriaINT);
        }

        response.sendRedirect(request.getContextPath() + "/pagina?nome=funcionarios");
    }
}