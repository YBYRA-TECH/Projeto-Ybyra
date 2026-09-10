<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.projybyraservletmvc.model.Industria" %>
<%
    // Buscar dados da indústria logada
    Industria industria = (Industria) request.getAttribute("industria");
    if (industria == null) {
        industria = (Industria) session.getAttribute("industriaLogada");
    }

    // Valores para os campos
    String nome = (industria != null) ? industria.getNome() : "";
    String email = (industria != null) ? industria.getEmail() : "";
    String cnpj = (industria != null) ? industria.getCnpj() : "";
%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/perfil.css?<%=System.currentTimeMillis()%>" />
    <title>Alterar Perfil - YBYRA TECH</title>
</head>

<body>
<div class="painel-principal">
    <% request.setAttribute("paginaAtual", "perfil"); %>

    <jsp:include page="../includes/aside.jsp"/>

    <main class="area-conteudo">
        <div class="conteudo-principal-header">
            <div class="area-titulo-pagina">
                <h1>Alterar Perfil</h1>
            </div>
        </div>

        <section class="detalhes-upload-painel">

            <% if (request.getAttribute("erro") != null) { %>
            <div class="mensagem-erro">
                <%= request.getAttribute("erro") %>
            </div>
            <% } %>

            <% if (request.getAttribute("erroEmail") != null) { %>
            <div class="mensagem-erro">
                <%= request.getAttribute("erroEmail") %>
            </div>
            <% } %>

            <% if (request.getAttribute("erroSenha") != null) { %>
            <div class="mensagem-erro">
                <%= request.getAttribute("erroSenha") %>
            </div>
            <% } %>

            <form action="<%= request.getContextPath() %>/AlterarIndustria" method="post">
                <div class="formulario-detalhes">

                    <div class="area-detalhes">
                        <h3 class="subtitulo-secao">Dados da Indústria</h3>
                        <div class="detalhes-campos">
                            <div>
                                <div class="campo">
                                    <label for="nome">Nome</label>
                                    <input type="text"
                                           id="nome"
                                           placeholder="Digite o nome completo"
                                           name="nome"
                                           value="<%= nome %>"
                                           required>
                                </div>

                            <div>
                                <div class="campo">
                                    <label for="email">Email</label>
                                    <input type="email"
                                           id="email"
                                           placeholder="Digite o Email"
                                           name="email"
                                           value="<%= email %>"
                                           required>
                                </div>

                                <div class="campo">
                                    <label for="senha">Senha (deixe em branco para manter a atual)</label>
                                    <input type="password"
                                           id="senha"
                                           placeholder="Nova senha (opcional)"
                                           name="senha">
                                    <small class="campo-ajuda">Mínimo 8 caracteres e pelo menos 1 número</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="area-botoes">
                        <button type="submit" class="btn-enviar">Salvar Alterações</button>
                        <a href="<%= request.getContextPath() %>/pagina?nome=alterarPerfil" class="btn-cancelar">
                            Cancelar
                        </a>
                    </div>
                </div>
                </div>
            </form>
        </section>
    </main>
</div>
</body>

</html>