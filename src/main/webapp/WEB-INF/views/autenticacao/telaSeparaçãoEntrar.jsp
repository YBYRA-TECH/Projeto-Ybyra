<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/global.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/telaSeparação.css" />
    <title>YBYRA TECH</title>
</head>
<body>
<header>
    <img src="<%= request.getContextPath() %>/assets/imgs/Nova%20logo.png" alt="Logo Ybyra Tech" style="width: 8.125rem; max-width: 35vw; height: auto" />
    <input type="checkbox" id="menu">
    <label for="menu" class="menu-icon">☰</label>
    <nav class="menu-links" >
        <a href="<%= request.getContextPath() %>/index.jsp">Conheça o App</a>
        <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=telaSeparação">Cadastre-se</a>
        <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=telaSeparaçãoEntrar" style="color: aliceblue; font-size: 1rem" id="botao-login">Acesse a sua conta</a>
    </nav>
</header>

<main>
    <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=login">
        <div class="industria">
            <h2>Indústria</h2>
            <p>Cadastre-se como uma indústria parceira.</p>
            <button type="button">Continuar como Indústria</button>
        </div>
    </a>

    <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=loginUsuario">
        <div class="usuario">
            <h2>Usuário</h2>
            <p>Cadastre-se como um usuário para acessar o app.</p>
            <button type="button">Continuar como Usuário</button>
        </div>
    </a>
</main>
</body>
</html>