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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/global.css" />
    <title>YBYRA TECH</title>
</head>
<body>
<header>
    <img
            src="<%= request.getContextPath() %>/assets/imgs/Nova%20logo.png"
            alt="Logo Ybyra Tech"
            style="width: 8.125rem; max-width: 35vw; height: auto"
    />
    <input type="checkbox" id="menu">
    <label for="menu" class="menu-icon">☰</label>
    <nav class="menu-links" >
        <a href="<%= request.getContextPath() %>/index.jsp">Conheça o App</a>
        <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=telaSeparação">Cadastre-se</a>
        <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=telaSeparaçãoEntrar" style="color: aliceblue; font-size: 1rem" id="botao-login">Acesse a sua conta</a>
    </nav>
</header>

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