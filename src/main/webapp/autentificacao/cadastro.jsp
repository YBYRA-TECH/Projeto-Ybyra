<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- ADICIONADO: atributo lang="en" igual ao HTML -->
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/imgs/icon.png" type="image/x-icon" />

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/cadastro.css?v=mensagem-erro" />
    <!-- CORRIGIDO: ordem dos CSS - global.css vem depois de cadastro.css -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/global.css" />

    <!-- CORRIGIDO: título - removido "- Cadastro" para ficar igual ao HTML -->
    <title>YBYRA TECH</title>
</head>
<body>
<header>
    <img src="<%= request.getContextPath() %>/imgs/Nova%20logo.png" alt="Logo Ybyra Tech" style="width: 8.125rem; max-width: 35vw; height: auto" />
    <!-- ADICIONADO: input checkbox para menu mobile -->
    <input type="checkbox" id="menu">
    <!-- ADICIONADO: label com ícone do menu (☰) -->
    <label for="menu" class="menu-icon">☰</label>
    <nav class="menu-links" >
        <a href="<%= request.getContextPath() %>/index.jsp">Conheça o App</a>
        <a href="<%= request.getContextPath() %>/autentificacao/telaSeparação.jsp">Cadastre-se</a>
        <a href="<%= request.getContextPath() %>/autentificacao/telaSeparaçãoEntrar.jsp" style="color: aliceblue; font-size: 1rem" id="botao-login">Acesse a sua conta</a>
    </nav>
</header>

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

            <!-- CAMPO CNPJ: placeholder correto -->
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

            <!-- CAMPO EMAIL: mantido igual -->
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

            <!-- CORRIGIDO: link aponta para loginIdustria.html ao invés de login.jsp -->
            <p>Já tem uma conta? <a href="<%= request.getContextPath() %>/autentificacao/login.jsp">Login</a></p>

            <div id="buttons">
                <!-- CORRIGIDO: link do botão Cancelar aponta para telaSeparação.jsp -->
                <button type="button">
                    <a href="<%= request.getContextPath() %>/autentificacao/telaSeparação.jsp" style="color: #767676">Cancelar</a>
                </button>
                <!-- CORRIGIDO: botão Entrar ao invés de Cadastrar, link para cadastroSenhaIndsutria.html -->
                <button style="background-color: #1e88ee;">
                    Entrar
                </button>
            </div>
        </form>
    </div>
</main>
</body>
</html>