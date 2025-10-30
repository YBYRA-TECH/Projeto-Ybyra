<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/inicioBI.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css" />

    <title>YBYRA TECH</title>
</head>
<body>
<div class="painel-principal">

    <% request.setAttribute("paginaAtual", "inicioBI"); %>

    <jsp:include page="../includes/aside.jsp"/>


    <main class="area-conteudo">
        <div class="area-icones-usuario">
            <input type="checkbox" id="menu-notificacoes">
            <label for="menu-notificacoes">
                <img src="<%= request.getContextPath() %>/imgs/notificacoes.png" alt="Notificações">
            </label>
            <div id="notificacoes">
                <h1>Notificações</h1>
                <div>Murilo adicionou uma tarefa</div>
                <div>Guilherme concluiu uma tarefa</div>
                <div>Emilly concluiu uma tarefa</div>
            </div>
        </div>

        <section class="painel">
            <iframe
                    title="YbyraDash"
                    width="1140"
                    height="541.25"
                    src="https://app.powerbi.com/reportEmbed?reportId=c3e1dd76-75b3-4f23-90e3-cb9bdd866b7f&autoAuth=true&ctid=b148f14c-2397-402c-ab6a-1b4711177ac0&navContentPaneEnabled=false"
                    frameborder="0"
                    allowFullScreen="">
            </iframe>
        </section>
    </main>
</div>
</body>
</html>