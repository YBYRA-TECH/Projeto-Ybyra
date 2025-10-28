<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="./imgs/Nova logo Sem tech.png" type="image/x-icon" />
    <link rel="stylesheet" href="css/cadastro.css" />
    <title>YBYRA TECH</title>
</head>
<body>
<header>
    <img src="./imgs/Nova logo.png" alt="Logo Ybyra Tech"
         style="width: 8.125rem; max-width: 35vw; height: auto" />
    <a href="./index.jsp">Conheça o App</a>
    <a href="./cadastro.jsp">Cadastre-se</a>
    <button>
        <a href="./login.jsp" style="color: aliceblue; font-size: 1rem">Acesse a sua conta</a>
    </button>
</header>

<main>
    <div id="inputs">
        <h1>Cadastro</h1>

        <form action="${pageContext.request.contextPath}/cadastro" method="post">
            <input type="text" name="nome" placeholder="CNPJ da Empresa" required />
            <input type="email" name="email" placeholder="Email / Telefone" required />
            <input type="password" name="senha" placeholder="Crie uma senha" required />

            <p>Já tem uma conta? <a href="login.jsp">Login</a></p>

            <div id="buttons">
                <button type="submit" onclick="window.location.href='login.jsp'" style="color: #767676;">
                    Cancelar
                </button>
                <button type="submit" style="background-color: #1e88ee; color: white;">
                    Cadastrar
                </button>
            </div>
        </form>
    </div>
</main>
</body>
</html>
