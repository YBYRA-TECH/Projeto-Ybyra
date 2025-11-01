<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/add_alterarUsuario.css" />
    <title>YBYRA TECH</title>
</head>

<body>
<div class="painel-principal">

    <% request.setAttribute("paginaAtual", "funcionarios"); %>

    <jsp:include page="../includes/aside.jsp"/>

    <main class="area-conteudo">
        <div class="conteudo-principal-header">
            <a href="<%= request.getContextPath() %>/pagina?nome=funcionarios">
                <img src="<%= request.getContextPath() %>/assets/imgs/voltar.png" alt="voltar" id="voltar">
            </a>
            <h1>Alterar</h1>
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
            <%
                String nome = (String) session.getAttribute("nome");
                String email = (String) session.getAttribute("email");
            %>

            <form action="<%=request.getContextPath()%>/AlterarUsuario" method="post">
                <div class="formulario-detalhes">

                    <div class="area-detalhes">
                        <h3 class="subtitulo-secao">Dados do Usuário</h3>
                        <div class="detalhes-campos">
                            <div>
                                <div class="campo">
                                    <label for="nome">Nome Completo</label>
                                    <input type="text" id="nome" name="nome" value="<%= nome %>" placeholder="Digite o nome completo">
                                </div>

                                <div class="campo">
                                    <label for="senha">Senha</label>
                                    <input type="password" id="senha" name="senha" placeholder="Digite a nova senha">
                                </div>
                            </div>
                            <div>
                                <div class="campo">
                                    <label for="email">Email</label>
                                    <input type="email" id="email" name="email" value="<%= email %>" placeholder="Digite o Email">
                                </div>

                                <div class="campo">
                                    <label for="confirma-senha">Confirme a senha</label>
                                    <input type="password" id="confirma-senha" placeholder="Confirme a senha">
                                </div>
                            </div>
                        </div>

                        <div class="area-botoes">
                            <button type="submit" class="btn-enviar">Salvar</button>
                        </div>
                    </div>
                </div>
            </form>
        </section>
    </main>
</div>
</body>

</html>