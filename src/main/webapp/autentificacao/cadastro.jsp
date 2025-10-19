<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/imgs/Nova logo Sem tech.png" type="image/x-icon" />

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/cadastro.css?v=mensagem-erro" />
    <title>YBYRA TECH - Cadastro</title>
</head>
<body>
<header>
    <img src="<%= request.getContextPath() %>/imgs/Nova%20logo.png" alt="Logo Ybyra Tech" style="width: 8.125rem; max-width: 35vw; height: auto" />
    <a href="<%= request.getContextPath() %>/index.jsp">Conheça o App</a>
    <a href="<%= request.getContextPath() %>/autentificacao/cadastro.jsp">Cadastre-se</a>
    <button>
        <a href="<%= request.getContextPath() %>/autentificacao/login.jsp" style="color: aliceblue; font-size: 1rem">
            Acesse a sua conta
        </a>
    </button>
</header>

<main>
    <div id="inputs">
        <h1>Cadastro</h1>
        <form action="<%= request.getContextPath() %>/cadastro" method="post">

            <!-- ===== CAMPO NOME ===== -->
            <input
                    type="text"
                    name="nome"
                    placeholder="Digite o nome da indústria"
                    value="<%= request.getAttribute("nome") != null ? request.getAttribute("nome") : "" %>"
                    required />

            <!-- ===== CAMPO CNPJ ===== -->
            <input
                    type="text"
                    name="cnpj"
                    placeholder="CNPJ da Empresa"
                    class="<%= request.getAttribute("erroCnpj") != null ? "input-erro" : "" %>"
                    value="<%= request.getAttribute("cnpj") != null ? request.getAttribute("cnpj") : "" %>"
                    required />
            <% if (request.getAttribute("erroCnpj") != null) { %>
            <div class="erro-mensagem">
                <%= request.getAttribute("erroCnpj") %>
            </div>
            <% } %>

            <input
                    type="email"
                    name="email"
                    placeholder="Email / Telefone"
                    class="<%= request.getAttribute("erroEmail") != null ? "input-erro" : "" %>"
                    value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                    required />
            <% if (request.getAttribute("erroEmail") != null) { %>
            <div class="erro-mensagem">
                <%= request.getAttribute("erroEmail") %>
            </div>
            <% } %>

            <input
                    type="password"
                    name="senha"
                    placeholder="Senha"
                    class="<%= request.getAttribute("erroSenha") != null ? "input-erro" : "" %>"
                    value="<%= request.getAttribute("senha") != null ? request.getAttribute("senha") : "" %>"
                    required />
            <% if (request.getAttribute("erroSenha") != null) { %>
            <div class="erro-mensagem">
                <%= request.getAttribute("erroSenha") %>
            </div>
            <% } %>

            <p>Já tem uma conta? <a href="<%= request.getContextPath() %>/autentificacao/login.jsp">Login</a></p>

            <div id="buttons">
                <button type="button" style="color: #767676">
                    <a href="<%= request.getContextPath() %>/index.jsp">Cancelar</a>
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