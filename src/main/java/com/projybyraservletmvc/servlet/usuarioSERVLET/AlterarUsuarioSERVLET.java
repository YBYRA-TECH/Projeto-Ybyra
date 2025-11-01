package com.projybyraservletmvc.servlet.usuarioSERVLET;

import com.projybyraservletmvc.dao.UsuarioDAO;
import com.projybyraservletmvc.model.Usuario;
import com.projybyraservletmvc.util.VerificacoesUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/AlterarUsuario")
public class AlterarUsuarioSERVLET extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Processando alteração do usuário");

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();

        Integer idUsuario = (Integer) session.getAttribute("id_usuario");

        if (idUsuario == null) {
            response.sendRedirect(request.getContextPath() + "/paginaAutenticacao?nome=login");
            return;
        }

        // Pegar os dados do formulário
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        System.out.println("Dados recebidos:");
        System.out.println("ID Usuário: " + idUsuario);
        System.out.println("Nome: " + nome);
        System.out.println("Email: " + email);

        // Validação de campos obrigatórios
        if (nome == null || nome.trim().isEmpty() ||
                email == null || email.trim().isEmpty()) {

            System.out.println("Erro: Campos obrigatórios vazios!");
            request.setAttribute("erro", "Preencha todos os campos obrigatórios!");
            request.getRequestDispatcher("/pagina?nome=alterarUsuario").forward(request, response);
            return;
        }

        try {
            UsuarioDAO dao = new UsuarioDAO();

            Usuario usuario = dao.buscarPorID(idUsuario);

            if (usuario == null) {
                System.out.println("Usuário não encontrado!");
                request.setAttribute("erro", "Usuário não encontrado!");
                request.getRequestDispatcher("/pagina?nome=listarUsuarios").forward(request, response);
                return;
            }

            usuario.setNome(nome.trim());
            usuario.setEmail(email.trim());

            if (senha != null && !senha.isEmpty()) {
                usuario.setSenha(senha);

                if (!VerificacoesUtil.validarSenha(senha)) {
                    System.out.println("A senha está incorreta!");
                    request.setAttribute("erroSenha", "A senha precisa ter no mínimo 8 dígitos e um número!");
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("/pagina?nome=alterarUsuario").forward(request, response);
                    return;
                }
            }

            // Validar email
            if (!VerificacoesUtil.validarEmail(email)) {
                System.out.println("O email está incorreto!");
                request.setAttribute("erroEmail", "Email inválido!");
                request.setAttribute("usuario", usuario);
                request.getRequestDispatcher("/pagina?nome=alterarUsuario").forward(request, response);
                return;
            }

            boolean sucesso = dao.atualizar(usuario);

            if (sucesso) {
                System.out.println("Usuário atualizado com sucesso!");

                session.removeAttribute("id_usuario");
                session.removeAttribute("nome");
                session.removeAttribute("email");

                response.sendRedirect(request.getContextPath() + "/pagina?nome=funcionarios");
            } else {
                System.out.println("Erro ao atualizar no banco!");
                request.setAttribute("erro", "Erro ao atualizar dados. Tente novamente.");
                request.getRequestDispatcher("/pagina?nome=alterarUsuario").forward(request, response);
            }

        } catch (NumberFormatException e) {
            System.out.println("Erro: ID inválido!");
            e.printStackTrace();
            request.setAttribute("erro", "ID de usuário inválido!");
            request.getRequestDispatcher("/pagina?nome=listarUsuarios").forward(request, response);

        } catch (Exception e) {
            System.out.println("Erro ao processar alteração!");
            e.printStackTrace();
            request.setAttribute("erro", "Erro: " + e.getMessage());
            request.getRequestDispatcher("/pagina?nome=alterarUsuario").forward(request, response);
        }
    }
}