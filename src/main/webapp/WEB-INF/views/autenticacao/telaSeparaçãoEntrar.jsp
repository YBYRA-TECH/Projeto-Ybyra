<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/global.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/telaSeparação.css?<%=System.currentTimeMillis()%>"/>
    <title>YBYRA TECH</title>
</head>
<body>
<jsp:include page="../includes/header.jsp"/>
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