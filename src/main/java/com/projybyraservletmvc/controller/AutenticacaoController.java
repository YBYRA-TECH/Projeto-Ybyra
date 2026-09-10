package com.projybyraservletmvc.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/paginaAutenticacao")
public class AutenticacaoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String caminho = "/WEB-INF/views/autenticacao/" + nome + ".jsp";

        request.getRequestDispatcher(caminho).forward(request, response);
    }
}
