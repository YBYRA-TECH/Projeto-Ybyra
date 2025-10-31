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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/telaCon.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/global.css?<%=System.currentTimeMillis()%>" />
    <title>YBYRA TECH</title>
</head>
<body>
<jsp:include page="../includes/header.jsp"/>

<main>
    <div id="container">
        <div class="container-conclusao">
            <div id="icon-success">
                &#10003;
            </div>

            <h1 id="titulo-conclusao">Concluído com Sucesso!</h1>
            <p id="mensagem-conclusao">Sua operação foi realizada com êxito. Obrigado por usar nossos serviços.</p>

            <div id="buttons">
                <button>
                    <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=verificacaoIndustria" style="color: #767676">Cancelar</a>
                </button>
                <button style="background-color: #1e88ee;">
                    <a href="<%= request.getContextPath() %>/pagina?nome=inicio">Entrar</a>
                </button>
            </div>

        </div>
    </div>
</main>
</body>
</html>