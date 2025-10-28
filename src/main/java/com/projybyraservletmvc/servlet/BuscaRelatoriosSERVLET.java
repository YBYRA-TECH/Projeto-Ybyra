//package com.projybyraservletmvc.servlet;
//
//import com.projybyraservletmvc.dao.LoteDAO;
//import com.projybyraservletmvc.dao.TarefasDAO;
//import com.projybyraservletmvc.model.Tarefas;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/BuscaRelatorios")
//public class BuscaRelatoriosSERVLET {
//
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws IOException {
//
//        request.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html;charset=UTF-8");
//
//        String busca = request.getParameter("busca");
//
//        try {
//            HttpSession session = request.getSession();
//
//            if (busca != null && !busca.trim().isEmpty()) {
//                LoteDAO dao = new LoteDAO();
//                List<Tarefas> tarefasBusca = dao.buscarComParametro(busca);
//
//                session.setAttribute("lote", loteBusca);
//                session.setAttribute("buscaAtiva", true);
//
//                System.out.println("Lotes encontrados: " + .size());
//            }
//
//            response.sendRedirect(request.getContextPath() + "/pagina?nome=tarefas&busca=true");
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.sendRedirect(request.getContextPath() + "/pagina?nome=tarefas");
//        }
//    }}