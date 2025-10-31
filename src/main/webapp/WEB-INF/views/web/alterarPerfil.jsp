<%--
  Created by IntelliJ IDEA.
  User: murilofonseca-ieg
  Date: 31/10/2025
  Time: 07:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/alterarPerfil.css"/>
    <title>YBYRA TECH</title>
</head>

<body>
<% request.setAttribute("paginaAtual", "perfil"); %>

<div class="painel-principal">
    <jsp:include page="../includes/aside.jsp"/>
    <main class="area-conteudo">

        <section class="painel">
            <div id="conteudo">
                <img src="<%= request.getContextPath() %>/assets/imgs/icone_usuario.png" alt="imagem vazio">
                <h1>Aqui você irá alterar os dados da indústria!</h1>
                <form method="post" action="<%= request.getContextPath() %>/DadosAlterarIndustria">
                    <div id="button">
                        <button type="submit">Alterar</button>

                    </div>
                </form>
            </div>
        </section>

    </main>
</div>
</body>

</html>