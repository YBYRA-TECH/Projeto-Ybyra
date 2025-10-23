<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
            rel="shortcut icon"
            href="<%= request.getContextPath() %>/assets/imgs/icon.png"
            type="image/x-icon"
    />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/login.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/global.css" />

    <title>YBYRA TECH</title>
</head>
<body>
<header>
    <img
            src="<%= request.getContextPath() %>/assets/imgs/Nova%20logo.png"
            alt="Logo Ybyra Tech"
            style="width: 8.125rem; max-width: 35vw; height: auto"
    />
    <input type="checkbox" id="menu">
    <label for="menu" class="menu-icon">☰</label>
    <nav class="menu-links" >
        <a href="<%= request.getContextPath() %>/index.jsp">Conheça o App</a>
        <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=telaSeparação">Cadastre-se</a>
        <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=telaSeparaçãoEntrar" style="color: aliceblue; font-size: 1rem" id="botao-login">Acesse a sua conta</a>
    </nav>
</header>

<main>
    <div id="inputs">
        <h1>Entrar</h1>
        <form action="<%= request.getContextPath() %>/loginUsuario" method="post">
            <input type="email" name="email" placeholder="Email / Telefone / Usuário" required
                   value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" />

            <input type="password" name="senha" placeholder="Senha" required/>
            <% if (request.getAttribute("erro") != null) { %>
            <div class="erro-mensagem">
                <%= request.getAttribute("erro") %>
            </div>
            <% } %>

            <p style="margin-left: 0.6rem;">Não tem uma conta? <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=cadastroUsuario">Crie uma!</a></p>
            <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=cadastroSenhaUsuario" style="margin-left: 0.6rem;">Esqueceu a Senha?</a>

            <div id="buttons">
                <button type="button">
                    <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=telaSeparaçãoEntrar" style="color: #767676">Cancelar</a>
                </button>
                <button type="submit" style="background-color: #1e88ee;">
                    Entrar
                </button>
            </div>
        </form>
    </div>
</main>
</body>
</html>