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
<jsp:include page="../includes/header.jsp"/>

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

            <p style="margin-left: 0.6rem;">Não tem uma conta? <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=cadastro">Crie uma!</a></p>
            <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=cadastroSenhaIndsutria" style="margin-left: 0.6rem;">Esqueceu a Senha?</a>

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