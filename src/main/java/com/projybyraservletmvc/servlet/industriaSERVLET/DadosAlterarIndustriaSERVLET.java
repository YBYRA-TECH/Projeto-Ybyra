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

//Classe servlet para alterar dados da industria
@WebServlet("/DadosAlterarIndustria")
public class DadosAlterarIndustriaSERVLET extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Carregando dados para alteração");

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        Industria industriaLogada = (Industria) session.getAttribute("industriaLogada");

        // Verificar se há indústria logada
        if (industriaLogada == null) {
            System.out.println("Erro: Nenhuma indústria logada na sessão!");
            response.sendRedirect(request.getContextPath() + "/paginaAutenticacao?nome=login");
            return;
        }

        try {
            IndustriaDAO dao = new IndustriaDAO();
            Industria industria = dao.buscarPorID(industriaLogada.getIdIndustria());

            if (industria != null) {
                System.out.println("Dados carregados:");
                System.out.println("ID: " + industria.getIdIndustria());
                System.out.println("Nome: " + industria.getNome());
                System.out.println("Email: " + industria.getEmail());
                System.out.println("CNPJ: " + industria.getCnpj());

                request.setAttribute("industria", industria);

                request.getRequestDispatcher("/pagina?nome=perfil").forward(request, response);
            } else {
                System.out.println("Erro: Indústria não encontrada no banco!");
                request.setAttribute("erro", "Indústria não encontrada!");
                request.getRequestDispatcher("/pagina?nome=perfil").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao carregar dados: " + e.getMessage());
            request.setAttribute("erro", "Erro ao carregar dados: " + e.getMessage());
            request.getRequestDispatcher("/pagina?nome=perfil").forward(request, response);
        }
    }
}