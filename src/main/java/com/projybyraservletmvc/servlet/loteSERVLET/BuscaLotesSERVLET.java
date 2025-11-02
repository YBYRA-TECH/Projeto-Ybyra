package com.projybyraservletmvc.servlet.loteSERVLET;

import com.projybyraservletmvc.dao.LoteDAO;
import com.projybyraservletmvc.model.Lote;
import com.projybyraservletmvc.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/BuscaLote")
public class BuscaLotesSERVLET extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
        session.removeAttribute("lote");


        if (usuarioLogado == null) {
            response.sendRedirect(request.getContextPath() + "/pagina?nome=login");
            return;
        }

        String busca = request.getParameter("busca");
        String area = request.getParameter("area");
        String turno = request.getParameter("turno");
        String eficiencia = request.getParameter("eficiencia");
        int id_industria = usuarioLogado.getIdIndustria();

        LoteDAO dao = new LoteDAO();
        List<Lote> lotesBusca = dao.buscarComFiltros(id_industria, area, turno, eficiencia, busca);

        session.setAttribute("lote", lotesBusca);


        response.sendRedirect(request.getContextPath() + "/pagina?nome=relatorios");
    }
}