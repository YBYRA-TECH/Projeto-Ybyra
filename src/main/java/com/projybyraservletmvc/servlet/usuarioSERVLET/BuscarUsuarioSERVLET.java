package com.projybyraservletmvc.servlet.usuarioSERVLET;

import com.projybyraservletmvc.dao.UsuarioDAO;
import com.projybyraservletmvc.model.Usuario;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/BuscaUsuario")
public class BuscarUsuarioSERVLET extends HttpServlet {

    //CLASSE SERVLET PARA A BUSCA DE USUARIOS

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        System.out.println("-- Buscar Usuarios Servlet --");

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String busca = request.getParameter("busca");
        String id_industria = request.getParameter("id_industria");

        System.out.println("Dados da busca: ");
        System.out.println("Busca: " + busca );
        System.out.println("id_industria: " + id_industria );


        try {
            HttpSession session = request.getSession();

            if (busca != null && !busca.trim().isEmpty()) {
                UsuarioDAO dao = new UsuarioDAO();
                int id_industriaINT = Integer.parseInt(id_industria);
                List<Usuario> usuariosBusca = dao.buscarComParametro(busca, id_industriaINT);

                session.setAttribute("usuarios", usuariosBusca);
                session.setAttribute("buscaAtiva", true);

                System.out.println("Usuarios encontrados: " + usuariosBusca.size());
            }

            response.sendRedirect(request.getContextPath() + "/pagina?nome=funcionarios&busca=true");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pagina?nome=funcionarios");
        }
    } }