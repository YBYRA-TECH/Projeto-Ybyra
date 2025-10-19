<%--
  Created by IntelliJ IDEA.
  User: murilofonseca-ieg
  Date: 17/10/2025
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="../css/global.css">
    <link rel="stylesheet" href="../css/telaSeparação.css" />
    <title>YBYRA TECH</title>
</head>
<body>
<header>
    <img src="../imgs/Nova logo.png" alt="Logo Ybyra Tech" style="width: 8.125rem; max-width: 35vw; height: auto" />
    <input type="checkbox" id="menu">
    <label for="menu" class="menu-icon">☰</label>
    <nav class="menu-links" >
        <a href="../index.jsp">Conheça o App</a>
        <a href="telaSeparação.jsp">Cadastre-se</a>
        <a href="telaSeparaçãoEntrar.jsp" style="color: aliceblue; font-size: 1rem" id="botao-login">Acesse a sua conta</a>
    </nav>
</header>

<main>
    <a href="cadastro.jsp">
        <div class="industria">
            <h2>Indústria</h2>
            <p>Cadastre-se como uma indústria parceira.</p>
            <button type="button">Continuar como Indústria</button>
        </div>
    </a>

    <a href="cadastroUsuario.jsp">
        <div class="usuario">
            <h2>Usuário</h2>
            <p>Cadastre-se como um usuário para acessar o app.</p>
            <button type="button">Continuar como Usuário</button>
        </div>
    </a>
</main>
</body>
</html>