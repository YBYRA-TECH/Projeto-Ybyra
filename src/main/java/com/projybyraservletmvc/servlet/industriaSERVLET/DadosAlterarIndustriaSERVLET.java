package com.projybyraservletmvc.servlet.industriaSERVLET;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import com.projybyraservletmvc.dao.IndustriaDAO;
import com.projybyraservletmvc.model.Industria;

@WebServlet("/DadosAlterarIndustria")
public class DadosAlterarIndustriaSERVLET extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== Carregando dados para alteração ===");

        HttpSession session = request.getSession();
        Industria industriaLogada = (Industria) session.getAttribute("industriaLogada");


        try {
            IndustriaDAO dao = new IndustriaDAO();
            Industria industria = dao.buscarPorID(industriaLogada.getIdIndustria());

            if (industria != null) {
                session.setAttribute("industriaAlterar", industria);

                System.out.println("Dados carregados:");
                System.out.println("ID: " + industria.getIdIndustria());
                System.out.println("Nome: " + industria.getNome());
                System.out.println("Email: " + industria.getEmail());
                System.out.println("CNPJ: " + industria.getCnpj());

                response.sendRedirect(request.getContextPath() + "/pagina?nome=perfil");
            } else {
                request.setAttribute("erro", "Indústria não encontrada!");
                request.getRequestDispatcher("/WEB-INF/views/erro.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro ao carregar dados: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/erro.jsp").forward(request, response);
        }
    }
}
