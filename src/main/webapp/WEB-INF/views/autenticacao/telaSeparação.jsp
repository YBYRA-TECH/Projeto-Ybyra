<%--
  Created by IntelliJ IDEA.
  User: murilofonseca-ieg
  Date: 30/10/2025
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<jsp:include page="../includes/header.jsp"/>
<main>
    <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=cadastro">
        <div class="industria">
            <h2>Indústria</h2>
            <p>Cadastre-se como uma indústria parceira.</p>
            <button type="button">Cadastrar sua Indústria</button>
        </div>
    </a>
</main>
</body>
</html>