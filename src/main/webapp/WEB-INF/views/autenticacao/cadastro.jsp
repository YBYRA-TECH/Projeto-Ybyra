<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />

    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/cadastro.css?<%=System.currentTimeMillis()%>" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/global.css?<%=System.currentTimeMillis()%>" />

    <title>YBYRA TECH</title>
</head>
<body>
<jsp:include page="../includes/header.jsp"/>

<main>
    <div id="inputs">
        <h1>Cadastro</h1>
        <form action="<%= request.getContextPath() %>/cadastro" method="post">

            <input
                    type="text"
                    name="nome"
                    placeholder="Digite o nome da industria: "
                    value="<%= request.getAttribute("nome") != null ? request.getAttribute("nome") : "" %>"
                    required />

            <input
                    type="text"
                    name="cnpj"
                    placeholder="CNPJ da Empresa"
                    class="<%= request.getAttribute("erroCnpj") != null ? "input-erro" : "" %>"
                    value="<%= request.getAttribute("cnpj") != null ? request.getAttribute("cnpj") : "" %>"
                    required />
            <% if (request.getAttribute("erroCnpj") != null) { %>
            <div class="erro-mensagem">
                <%= request.getAttribute("erroCnpj") %>
            </div>
            <% } %>

            <input
                    type="email"
                    name="email"
                    placeholder="Email / Telefone"
                    class="<%= request.getAttribute("erroEmail") != null ? "input-erro" : "" %>"
                    value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                    required />
            <% if (request.getAttribute("erroEmail") != null) { %>
            <div class="erro-mensagem">
                <%= request.getAttribute("erroEmail") %>
            </div>
            <% } %>
            <input
                    type="password"
                    name="senha"
                    placeholder="Digite sua senha: "
                    class="<%= request.getAttribute("erroSenha") != null ? "input-erro" : "" %>"
                    value="<%= request.getAttribute("senha") != null ? request.getAttribute("senha") : "" %>"
                    required />
            <% if (request.getAttribute("erroSenha") != null) { %>
            <div class="erro-mensagem">
                <%= request.getAttribute("erroSenha") %>
            </div>
            <% } %>

            <p>Já tem uma conta? <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=login">Login</a></p>

            <div id="buttons">
                <button type="button">
                    <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=telaSeparação" style="color: #767676">Cancelar</a>
                </button>
                <button style="background-color: #1e88ee;">
                    Entrar
                </button>
            </div>
        </form>
    </div>
</main>
</body>
</html>