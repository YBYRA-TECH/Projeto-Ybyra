package com.projybyraservletmvc.servlet.industriaSERVLET;

import com.projybyraservletmvc.dao.IndustriaDAO;
import com.projybyraservletmvc.model.Industria;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/AlterarIndustria")
public class AlterarIndustriaSERVLET extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== Processando alteração de indústria ===");

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        Industria industriaLogada = (Industria) session.getAttribute("industriaLogada");

        if (industriaLogada == null) {
            response.sendRedirect(request.getContextPath() + "/paginaAutenticacao?nome=login");
            return;
        }

        String nome = request.getParameter("nome");
        String cnpj = request.getParameter("cnpj");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        System.out.println("Dados recebidos:");
        System.out.println("Nome: " + nome);
        System.out.println("CNPJ: " + cnpj);
        System.out.println("Email: " + email);

        if (nome == null || nome.isEmpty() ||
                cnpj == null || cnpj.isEmpty() ||
                email == null || email.isEmpty()) {

            System.out.println("Erro: Campos obrigatórios vazios!");
            request.setAttribute("erro", "Preencha todos os campos obrigatórios!");
            request.getRequestDispatcher("/WEB-INF/views/perfil/telaAlterar.jsp").forward(request, response);
            return;
        }

        try {
            Industria industria = new Industria();
            industria.setIdIndustria(industriaLogada.getIdIndustria());
            industria.setNome(nome);
            industria.setCnpj(cnpj);
            industria.setEmail(email);

            if (senha != null && !senha.isEmpty()) {
                industria.setSenha(senha);
                if (!industria.validarSenha()) {
                    System.out.println("A senha está incorreta!");
                    request.setAttribute("erroSenha", "A senha precisa ter no mínimo 8 dígitos e um número!");
                    request.setAttribute("industria", industria);
                    request.getRequestDispatcher("/WEB-INF/views/perfil/telaAlterar.jsp").forward(request, response);
                    return;
                }
            } else {
                industria.setSenha(industriaLogada.getSenha());
            }

            if (!industria.validarCnpj()) {
                System.out.println("O CNPJ está incorreto!");
                request.setAttribute("erroCnpj", "CNPJ inválido!");
                request.setAttribute("industria", industria);
                request.getRequestDispatcher("/WEB-INF/views/perfil/telaAlterar.jsp").forward(request, response);
                return;
            }

            if (!industria.validarEmail()) {
                System.out.println("O email está incorreto!");
                request.setAttribute("erroEmail", "Email inválido!");
                request.setAttribute("industria", industria);
                request.getRequestDispatcher("/WEB-INF/views/perfil/telaAlterar.jsp").forward(request, response);
                return;
            }

            IndustriaDAO dao = new IndustriaDAO();
            boolean sucesso = dao.atualizar(industria);

            if (sucesso) {
                System.out.println("Indústria atualizada com sucesso!");

                // Atualizar sessão com novos dados

                session.setAttribute("industriaLogada", industria);
                session.setAttribute("nomeIndustria", industria.getNome());
                session.setAttribute("emailIndustria", industria.getEmail());

                request.setAttribute("sucesso", "Dados atualizados com sucesso!");
                response.sendRedirect(request.getContextPath() + "/pagina?nome=perfil");
            } else {
                System.out.println("Erro ao atualizar no banco!");
                request.setAttribute("erro", "Erro ao atualizar dados. Tente novamente.");
                request.getRequestDispatcher("/WEB-INF/views/perfil/telaAlterar.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro: " + e.getMessage());
            request.getRequestDispatcher("/pagina?nome=perfil").forward(request, response);
        }
    }
}
