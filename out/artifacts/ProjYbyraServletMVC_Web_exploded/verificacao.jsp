<%--
  Created by IntelliJ IDEA.
  User: davioliveira-ieg
  Date: 07/10/2025
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="stylesheet" href="css/verificacao.css" />
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
    <div id="inputs">
        <h1>Verificação</h1>
        <p>Insira o código de 5 dígitos enviado para exemplo@email.com:</p>
        <form action="">
            <div id="input_veri">
                <input type="text" maxlength="1" />
                <input type="text" maxlength="1" />
                <input type="text" maxlength="1" />
                <input type="text" maxlength="1" />
                <input type="text" maxlength="1" />
            </div>

            <p>
                Não recebeu um código?
                <a href="#">Enviar Novamente</a>
            </p>
            <div id="buttons">
                <button style="background-color: #eeeeee; color: #767676" type="reset">
                    <a href="cadastroSenha.jsp" style="color: #767676;">Voltar</a>
                </button>
                <button style="background-color: #1e88ee; color: aliceblue">
                    <a href="telaCon.jsp" style="color: white;"> Avançar</a>
                </button>
            </div>
        </form>
    </div>
</main>
</body>
</html>