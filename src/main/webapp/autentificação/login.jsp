<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
            rel="shortcut icon"
            href="../imgs/Nova logo Sem tech.png"
            type="image/x-icon"
    />
    <link rel="stylesheet" href="../css/login.css" />
    <title>YBYRA TECH</title>
</head>
<body>
<header>
    <img
            src="../imgs/Nova%20logo.png"
            alt="Logo Ybyra Tech"
            style="width: 8.125rem; max-width: 35vw; height: auto"
    />
    <a href="../index.jsp">Conheça o App</a>
    <a href="cadastro.jsp">Cadastre-se</a>
    <button>
        <p>
            <a href="login.jsp" style="color: aliceblue; font-size: 1rem"
            >Acesse a sua conta</a
            >
        </p>
    </button>
</header>

<main>
    <div id="inputs">
        <h1>Entrar</h1>
        <form action="login" method="post">
            <input type="email" name="email" placeholder="Email" required
                   value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" />

            <input type="password" name="senha" placeholder="Senha" required/>
            <% if (request.getAttribute("erro") != null) { %>
            <div class="erro-mensagem">
                <%= request.getAttribute("erro") %>
            </div>
            <% } %>

            <p style="margin-left: 0.6rem;">Não tem uma conta? <a href="cadastro.jsp">Crie uma!</a></p>
            <a href="cadastroSenha.jsp" style="margin-left: 0.6rem;">Esqueceu a Senha?</a>

            <div id="buttons">
                <button type="button" onclick="window.location.href='index.jsp'" style="color: #767676">
                    Cancelar
                </button>
                <button type="submit" style="background-color: #1e88ee; color: white;">
                    Entrar
                </button>
            </div>
        </form>
    </div>
</main>
</body>
</html>