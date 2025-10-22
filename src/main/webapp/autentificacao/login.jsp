<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
            rel="shortcut icon"
            href="<%= request.getContextPath() %>/imgs/icon.png"
            type="image/x-icon"
    />
    <!-- CORRIGIDO: ordem dos CSS - login.css antes de global.css -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/login.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/global.css" />

    <title>YBYRA TECH</title>
</head>
<body>
<header>
    <img
            src="<%= request.getContextPath() %>/imgs/Nova%20logo.png"
            alt="Logo Ybyra Tech"
            style="width: 8.125rem; max-width: 35vw; height: auto"
    />
    <!-- ADICIONADO: input checkbox e label para menu mobile -->
    <input type="checkbox" id="menu">
    <label for="menu" class="menu-icon">☰</label>
    <!-- ADICIONADO: nav com classe menu-links -->
    <nav class="menu-links" >
        <a href="<%= request.getContextPath() %>/index.jsp">Conheça o App</a>
        <a href="<%= request.getContextPath() %>/autentificacao/telaSeparação.jsp">Cadastre-se</a>
        <a href="<%= request.getContextPath() %>/autentificacao/telaSeparaçãoEntrar.jsp" style="color: aliceblue; font-size: 1rem" id="botao-login">Acesse a sua conta</a>
    </nav>
    <!-- REMOVIDO: button envolvendo o link -->
</header>

<main>
    <div id="inputs">
        <h1>Entrar</h1>
        <form action="<%= request.getContextPath()%>/login" method="post">
            <input type="email" name="email" placeholder="Email" required
                   value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" />

            <input type="password" name="senha" placeholder="Senha" required/>
            <% if (request.getAttribute("erro") != null) { %>
            <div class="erro-mensagem">
                <%= request.getAttribute("erro") %>
            </div>
            <% } %>

            <p style="margin-left: 0.6rem;">Não tem uma conta? <a href="<%= request.getContextPath() %>/autentificacao/cadastroIndustria.jsp">Crie uma!</a></p>
            <!-- CORRIGIDO: link para cadastroSenhaIndsutria.jsp -->
            <a href="<%= request.getContextPath() %>/autentificacao/cadastroSenhaIndsutria.jsp" style="margin-left: 0.6rem;">Esqueceu a Senha?</a>

            <div id="buttons">
                <!-- CORRIGIDO: botão cancelar aponta para telaSeparaçãoEntrar.jsp -->
                <button type="button">
                    <a href="<%= request.getContextPath() %>/autentificacao/telaSeparaçãoEntrar.jsp" style="color: #767676">Cancelar</a>
                </button>
                <!-- CORRIGIDO: link de submit aponta para inicio.html (será inicio.jsp) -->
                <button type="submit" style="background-color: #1e88ee;">
                    Entrar
                </button>
            </div>
        </form>
    </div>
</main>
</body>
</html>