<%@ page import="com.projybyraservletmvc.model.Industria" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/add_alterarUsuario.css" />
    <title>YBYRA TECH</title>
</head>

<body>
<div class="painel-principal">

    <%
        Industria industriaLogada = (Industria) session.getAttribute("industriaLogada");
        Integer id_industria = (industriaLogada != null) ? industriaLogada.getIdIndustria() : null;

        request.setAttribute("paginaAtual", "funcionarios");
    %>

    <jsp:include page="../includes/aside.jsp"/>


    <main class="area-conteudo">
        <div class="conteudo-principal-header">
            <a href="<%= request.getContextPath() %>/pagina?nome=funcionarios">
                <img src="<%= request.getContextPath() %>/assets/imgs/voltar.png" alt="voltar" id="voltar">
            </a>
            <h1>Adicionar</h1>
            <div class="area-icones">
                <input type="checkbox" id="menu-notificacoes">
                <label for="menu-notificacoes">
                    <img src="<%= request.getContextPath() %>/assets/imgs/notificacoes.png" alt="Notificações">
                </label>
                <div id="notificacoes">
                    <h1>Notificações</h1>
                    <div>Murilo adicionou uma tarefa</div>
                    <div>Guilherme concluiu uma tarefa</div>
                    <div>Emilly concluiu uma tarefa</div>
                </div>
            </div>
        </div>

        <section class="detalhes-upload-painel">
            <form action="<%=request.getContextPath()%>/adicionarUsuario" method="post">
                <div class="formulario-detalhes">

                    <div class="area-detalhes">
                        <h3 class="subtitulo-secao">Dados do Usuário</h3>
                        <div class="detalhes-campos">
                            <div>
                                <div class="campo">
                                    <label for="nome">Nome Completo</label>
                                    <input
                                            type="text"
                                            name="nome"
                                            placeholder="Nome Completo"
                                            value="<%= request.getAttribute("nome") != null ? request.getAttribute("nome") : "" %>"
                                            required />
                                </div>

                                <div class="campo">
                                    <label for="cpf">Cpf</label>
                                    <input
                                            type="text"
                                            name="cpf"
                                            placeholder="CPF"
                                            class="<%= request.getAttribute("erroCpf") != null ? "input-erro" : "" %>"
                                            value="<%= request.getAttribute("cpf") != null ? request.getAttribute("cpf") : "" %>"
                                            required />
                                </div>
                                <% if (request.getAttribute("erroCpf") != null) { %>
                                <div class="erro-mensagem">
                                    <%= request.getAttribute("erroCpf") %>
                                </div>
                                <% } %>
                                <div class="campo">
                                    <label for="senha">Senha</label>
                                    <input
                                            type="password"
                                            name="senha"
                                            placeholder="Digite sua senha: "
                                            class="<%= request.getAttribute("erroSenha") != null ? "input-erro" : "" %>"
                                            value="<%= request.getAttribute("senha") != null ? request.getAttribute("senha") : "" %>"
                                            required />
                                </div>
                                <% if (request.getAttribute("erroSenha") != null) { %>
                                <div class="erro-mensagem">
                                    <%= request.getAttribute("erroSenha") %>
                                </div>
                                <% } %>
                            </div>
                            <div>
                                <div class="campo">
                                    <label for="email">Email</label>
                                    <input
                                            type="email"
                                            name="email"
                                            placeholder="Email"
                                            class="<%= request.getAttribute("erroEmail") != null ? "input-erro" : "" %>"
                                            value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                                            required />
                                </div>
                                <% if (request.getAttribute("erroEmail") != null) { %>
                                <div class="erro-mensagem">
                                    <%= request.getAttribute("erroEmail") %>
                                </div>
                                <% } %>
                                <div class="campo">
                                    <label for="data-nas">Data de Nascimento</label>
                                    <input
                                            type="date"
                                            name="data_nasc"
                                            class="<%= request.getAttribute("erroData") != null ? "input-erro" : "" %>"
                                            value="<%= request.getAttribute("data_nasc") != null ? request.getAttribute("data_nasc") : "" %>"
                                            required />
                                </div>
                                <% if (request.getAttribute("erroData") != null) { %>
                                <div class="erro-mensagem">
                                    <%= request.getAttribute("erroData") %>
                                </div>
                                <% } %>

                                <div class="campo">
                                    <label for="confirma-senha">Confirme a senha</label>
                                    <input
                                            type="password"
                                            name="confirmarSenha"
                                            placeholder="Digite sua senha novamente: "
                                            class="<%= request.getAttribute("erroSenha") != null ? "input-erro" : "" %>"
                                            value="<%= request.getAttribute("senha") != null ? request.getAttribute("senha") : "" %>"
                                            required />
                                </div>

                                    <input
                                            type="hidden"
                                            name="id_industria"
                                            value="<%= id_industria %>"

                                    />
                                <% if (request.getAttribute("erroSenha") != null) { %>
                                <div class="erro-mensagem">
                                    <%= request.getAttribute("erroSenha") %>
                                </div>
                                <% } %>
                            </div>
                            <button type="submit" class="btn-enviar">Adicionar Usuario</button>
                        </div>
                    </div>
                </div>
            </form>
        </section>
    </main>
</div>
</body>

</html>