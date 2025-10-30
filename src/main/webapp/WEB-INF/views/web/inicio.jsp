<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/inicio.css" />
    <title>YBYRA TECH</title>
</head>

<body>
<div class="painel-principal">

    <% request.setAttribute("paginaAtual", "inicio"); %>

    <jsp:include page="../includes/aside.jsp"/>

    <main class="area-conteudo">

        <section class="painel">
            <div id="conteudo">
                <img src="<%= request.getContextPath() %>/assets/imgs/sem_documento.png" alt="imagem vazio">
                <h1>Nenhum Índice Inserido</h1>

                <a href="<%= request.getContextPath() %>/pagina?nome=insercaoDados">
                    <div id="button">
                        <button>Adicione um agora!</button>
                    </div>
                </a>
            </div>
        </section>

    </main>
</div>
</body>

</html>