<%--
  Created by IntelliJ IDEA.
  User: matheusfazan-ieg
  Date: 01/11/2025
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true"%>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/imgs/Nova_logo_sem_tech.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/paginaErro.css" />
    <title>YBYRA TECH</title>
</head>

<body>

<main>
    <div id="container">
        <div class="container-conclusao">
            <div id="icon-error">
                &#9888;
            </div>

            <h1 id="titulo-erro">Página não encontrada!</h1>
            <p id="mensagem-erro">Desculpe, a página que você está procurando não existe ou foi movida para outro endereço.</p>

            <div id="sugestoes">
                <h3>O que você pode fazer?</h3>
                <ul>
                    <li>Verificar se o endereço está digitado corretamente</li>
                    <li>Voltar para a página anterior</li>
                    <li>Acessar a página inicial do site</li>
                    <li>Usar o menu de navegação acima</li>
                </ul>
            </div>

            <div id="buttons">
                <button>
                    <a href="">Voltar</a>
                </button>
                <button>
                    <a href="">Ir para o Início</a>
                </button>
            </div>
        </div>
    </div>
</main>
</body>
</html>
