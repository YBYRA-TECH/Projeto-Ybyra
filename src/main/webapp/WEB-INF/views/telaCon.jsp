<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
            rel="shortcut icon"
            href="./imgs/Nova logo Sem tech.png"
            type="image/x-icon"
    />
    <link rel="stylesheet" href="css/telaCon.css" />
    <title>YBYRA TECH</title>
</head>
<body>
<header>
    <img
            src="./imgs/Nova logo.png"
            alt="Logo Ybyra Tech"
            style="width: 8.125rem; max-width: 35vw; height: auto"
    />
    <a href="./index.jsp">Conheça o App</a>
    <a href="./cadastro.jsp">Cadastre-se</a>
    <button>
        <p>
            <a href="./login.jsp" style="color: aliceblue; font-size: 1rem"
            >Acesse a sua conta</a
            >
        </p>
    </button>
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
                <button >
                    <a href="verificacao.jsp" style="color: #767676">Cancelar</a>
                </button>
                <button style="background-color: #1e88ee;">
                    <a href="inicio.jsp">Entrar</a>
                </button>
            </div>

        </div>
    </div>
</main>
</body>
</html>