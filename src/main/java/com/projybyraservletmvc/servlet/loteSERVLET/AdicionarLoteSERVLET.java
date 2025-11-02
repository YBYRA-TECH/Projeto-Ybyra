package com.projybyraservletmvc.servlet.loteSERVLET;

import com.projybyraservletmvc.dao.LoteDAO;
import com.projybyraservletmvc.dao.RelatoriosDAO;
import com.projybyraservletmvc.model.Lote;
import com.projybyraservletmvc.model.Relatorios;
import com.projybyraservletmvc.model.Usuario;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/AdicionarLote")
public class AdicionarLoteSERVLET extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        System.out.println("doPost chamado no Adicionando Lote");

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        if (usuarioLogado == null) {
            System.err.println("Usuário não está logado!");
            response.sendRedirect(request.getContextPath() + "/pagina?nome=login");
            return;
        }

        // Receber dados do formulário
        String descricao = request.getParameter("descricao");
        String responsavel = request.getParameter("responsavel");
        String producaoStr = request.getParameter("producao");
        String planejadoStr = request.getParameter("planejado");
        String problemasStr = request.getParameter("problemas");
        String idRelatorioStr = request.getParameter("id_relatorio");

        System.out.println("Dados recebidos:");
        System.out.println("Descrição: " + descricao);
        System.out.println("Responsável: " + responsavel);
        System.out.println("Produção: " + producaoStr);
        System.out.println("Planejado: " + planejadoStr);
        System.out.println("Problemas: " + problemasStr);
        System.out.println("ID Relatório: " + idRelatorioStr);

        // Validar campos obrigatórios
        if (descricao == null || descricao.isEmpty() ||
                responsavel == null || responsavel.isEmpty() ||
                producaoStr == null || producaoStr.isEmpty() ||
                planejadoStr == null || planejadoStr.isEmpty() ||
                idRelatorioStr == null || idRelatorioStr.isEmpty()) {

            System.out.println("Erro: Campos obrigatórios vazios!");
            response.getWriter().println("<h3>Preencha todos os campos obrigatórios!</h3>");
            return;
        }

        try {
            // Converter valores
            int producao = Integer.parseInt(producaoStr);
            int planejado = Integer.parseInt(planejadoStr);
            int problemas = (problemasStr != null && !problemasStr.isEmpty()) ? Integer.parseInt(problemasStr) : 0;
            int idRelatorio = Integer.parseInt(idRelatorioStr);
            int idIndustria = usuarioLogado.getIdIndustria();

            System.out.println("Validando relatório...");

            RelatoriosDAO relDAO = new RelatoriosDAO();

            Relatorios relatorio = relDAO.buscar(idRelatorio,idIndustria);

            if (relatorio == null) {
                System.err.println("Erro: Relatório não encontrado!");
                response.getWriter().println("<h3>Erro: Relatório não encontrado!</h3>");
                return;
            }

            if (relatorio.getId_industria() != idIndustria) {
                System.err.println("Erro: Relatório não pertence à indústria do usuário!");
                response.getWriter().println("<h3>Erro: Você não tem permissão para adicionar lote neste relatório!</h3>");
                return;
            }

            System.out.println("Criando objeto Lote...");
            Lote lote = new Lote(descricao, responsavel, producao, planejado, problemas, idIndustria, idRelatorio);

            System.out.println("Criando LoteDAO...");
            LoteDAO dao = new LoteDAO();

            System.out.println("Inserindo lote no banco...");
            boolean sucesso = dao.inserir(lote);

            if (sucesso) {
                System.out.println("Lote cadastrado com sucesso!");

                session.removeAttribute("lote");

                response.sendRedirect(request.getContextPath() + "/pagina?nome=relatorios");
            } else {
                System.out.println("Erro ao cadastrar lote no banco!");
                response.getWriter().println("<h3>Erro ao cadastrar! Tente novamente.</h3>");
            }

        } catch (NumberFormatException e) {
            System.err.println("Erro ao converter números: " + e.getMessage());
            e.printStackTrace();
            response.getWriter().println("<h3>Erro: Valores numéricos inválidos!</h3>");
        } catch (Exception e) {
            System.err.println("Erro ao adicionar lote: " + e.getMessage());
            e.printStackTrace();
            response.getWriter().println("<h3>Erro: " + e.getMessage() + "</h3>");
        }
    }
}