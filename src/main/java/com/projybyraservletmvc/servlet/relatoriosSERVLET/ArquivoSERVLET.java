package com.projybyraservletmvc.servlet.relatoriosSERVLET;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/InserirDados")@MultipartConfig
public class ArquivoSERVLET extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("ArquivoSERVLET");


        Part filePart = request.getPart("arquivo");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        System.out.println("Nome do arquivo: " + fileName);

        HttpSession session = request.getSession();
        session.setAttribute("arquivoNome", fileName);

        System.out.println("Nome guardado.");

        response.sendRedirect(request.getContextPath() + "/pagina?nome=TelainserirDados");
    }
}