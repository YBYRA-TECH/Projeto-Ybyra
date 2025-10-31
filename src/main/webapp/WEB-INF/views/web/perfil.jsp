<%--
  Created by IntelliJ IDEA.
  User: murilofonseca-ieg
  Date: 30/10/2025
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/perfil.css" />
    <title>YBYRA TECH</title>
</head>

<body>
<div class="painel-principal">

    <% request.setAttribute("paginaAtual", "perfil"); %>

    <jsp:include page="../includes/aside.jsp"/>


    <main class="area-conteudo">
        <div class="conteudo-principal-header">
            <div class="area-titulo-pagina">
                <h1>Alterar</h1>
            </div>
            <div class="area-icones">
                <input type="checkbox" id="menu-notificacoes">
                <label for="menu-notificacoes">
                    <img src="<%= request.getContextPath() %>/assets/imgs/notificacoes.png" alt="Notificações">
                </label>
                <div id="notificacoes">
                    <h1>Notificações</h1>
                    <div>Murilo adicionou uma tarefa</div>
                    <div>Guilherme concluiu uma tarefa</div>
                    <div>Emilly concluiu uma tarefa</div>
                </div>
            </div>
        </div>

        <section class="detalhes-upload-painel">
            <form action="../industriaSERVLET/AlterarIndustria" method="post">
                <div class="formulario-detalhes">

                    <div class="area-detalhes">
                        <h3 class="subtitulo-secao">Dados da Indústria</h3>
                        <div class="detalhes-campos">
                            <div>
                                <div class="campo">
                                    <label for="nome">Nome</label>
                                    <input type="text" id="nome" placeholder="Digite o nome completo" name="nome" required>
                                </div>

                                <div class="campo">
                                    <label for="cpf">Cnpj</label>
                                    <input type="text" id="cpf" value="" placeholder="Digite o Cnpj" name="cnpj" required>
                                </div>

                            </div>
                            <div>
                                <div class="campo">
                                    <label for="email">Email</label>
                                    <input type="email" value="" id="email" placeholder="Digite o Email" name="email" required>
                                </div>

                                <div class="campo">
                                    <label for="senha">Senha</label>
                                    <input type="password" id="senha" value="" placeholder="Digite a senha" name="senha" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn-enviar">Alterar Indústria </button>
                </div>
            </form>
        </section>
    </main>
</div>
</body>

</html>