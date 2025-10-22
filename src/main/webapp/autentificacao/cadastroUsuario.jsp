<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- ADICIONADO: atributo lang="en" -->
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/imgs/icon.png" type="image/x-icon" />

    <!-- ADICIONADO: link para global.css -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/global.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/cadastro.css?v=mensagem-erro" />

    <!-- CORRIGIDO: título sem "- Cadastro" -->
    <title>YBYRA TECH</title>
</head>
<body>
<header>
    <img src="<%= request.getContextPath() %>/imgs/Nova%20logo.png" alt="Logo Ybyra Tech" style="width: 8.125rem; max-width: 35vw; height: auto" />
    <!-- ADICIONADO: input checkbox e label para menu mobile -->
    <input type="checkbox" id="menu">
    <label for="menu" class="menu-icon">☰</label>
    <!-- ADICIONADO: nav com classe menu-links -->
    <nav class="menu-links" >
        <a href="<%= request.getContextPath() %>/index.jsp">Conheça o App</a>
        <a href="<%= request.getContextPath() %>/autentificacao/telaSeparação.jsp">Cadastre-se</a>
        <a href="<%= request.getContextPath() %>/autentificacao/telaSeparaçãoEntrar.jsp" style="color: aliceblue; font-size: 1rem" id="botao-login">Acesse a sua conta</a>
    </nav>
</header>

<main>
    <div id="inputs">
        <h1>Cadastro</h1>
        <!-- CORRIGIDO: action para /cadastroUsuario -->
        <form action="<%= request.getContextPath() %>/cadastroUsuario" method="post">

            <!-- CORRIGIDO: placeholder "Nome da Industria" -->
            <input
                    type="text"
                    name="industria"
                    placeholder="Nome da Industria"
                    value="<%= request.getAttribute("industria") != null ? request.getAttribute("industria") : "" %>"
                    required />

            <!-- ADICIONADO: campo Nome Completo -->
            <input
                    type="text"
                    name="nome"
                    placeholder="Nome Completo"
                    value="<%= request.getAttribute("nome") != null ? request.getAttribute("nome") : "" %>"
                    required />

            <!-- CAMPO CPF: mantido -->
            <input
                    type="text"
                    name="cpf"
                    placeholder="CPF"
                    class="<%= request.getAttribute("erroCpf") != null ? "input-erro" : "" %>"
                    value="<%= request.getAttribute("cpf") != null ? request.getAttribute("cpf") : "" %>"
                    required />
            <% if (request.getAttribute("erroCpf") != null) { %>
            <div class="erro-mensagem">
                <%= request.getAttribute("erroCpf") %>
            </div>
            <% } %>

            <!-- REMOVIDO: campo data_nasc (não existe no HTML) -->
            <!-- REMOVIDO: campo industria separado (já está no primeiro input) -->

            <!-- CORRIGIDO: placeholder "Email / Telefone" -->
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
                    type="date"
                    name="data_nasc"
                    value="<%= request.getAttribute("data_nasc") != null ? request.getAttribute("data_nasc") : "" %>"
                    required />
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


            <!-- CORRIGIDO: link para loginIdustria.html -->
            <p>Já tem uma conta? <a href="<%= request.getContextPath() %>/autentificacao/login.jsp">Login</a></p>

            <div id="buttons">
                <button type="button">
                    <a href="<%= request.getContextPath() %>/autentificacao/telaSeparação.jsp" style="color: #767676">Cancelar</a>
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