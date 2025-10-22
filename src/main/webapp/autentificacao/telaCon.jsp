<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
            rel="shortcut icon"
            href="<%= request.getContextPath() %>/imgs/icon.png"
            type="image/x-icon"
    />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/telaCon.css" />
    <!-- ADICIONADO: link para global.css -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/global.css" />
    <title>YBYRA TECH</title>
</head>
<body>
<header>
    <img
            src="<%= request.getContextPath() %>/imgs/Nova%20logo.png"
            alt="Logo Ybyra Tech"
            style="width: 8.125rem; max-width: 35vw; height: auto"
    />
    <!-- ADICIONADO: input checkbox e label para menu mobile -->
    <input type="checkbox" id="menu">
    <label for="menu" class="menu-icon">☰</label>
    <!-- ADICIONADO: nav com classe menu-links -->
    <nav class="menu-links" >
        <a href="<%= request.getContextPath() %>/index.jsp">Conheça o App</a>
        <a href="<%= request.getContextPath() %>/autentificacao/telaSeparação.jsp">Cadastre-se</a>
        <a href="<%= request.getContextPath() %>/autentificacao/telaSeparaçãoEntrar.jsp" style="color: aliceblue; font-size: 1rem" id="botao-login">Acesse a sua conta</a>
    </nav>
    <!-- REMOVIDO: button envolvendo o link -->
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
                <!-- CORRIGIDO: link do cancelar para verificacaoIndustria.html -->
                <button>
                    <a href="<%= request.getContextPath() %>/autentificacao/verificacaoIndustria.jsp" style="color: #767676">Cancelar</a>
                </button>
                <button style="background-color: #1e88ee;">
                    <a href="<%= request.getContextPath() %>/web/inicio.jsp">Entrar</a>
                </button>
            </div>

        </div>
    </div>
</main>
</body>
</html>