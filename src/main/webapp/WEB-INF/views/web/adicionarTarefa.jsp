<%--
  Created by IntelliJ IDEA.
  User: murilofonseca-ieg
  Date: 25/10/2025
  Time: 17:58
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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/telaAdd_Alterar.css" />
    <title>YBYRA TECH</title>
</head>

<body>
<div class="painel-principal">

    <%= request.setAttribute("paginaAtual", "tarefas")%>

    <jsp:include page="../includes/aside.jsp"/>

    <main class="area-conteudo">
        <div class="conteudo-principal-header">
            <a href="<%= request.getContextPath() %>/pagina?nome=tarefas">
                <img src="<%= request.getContextPath() %>/assets/imgs/voltar.png" alt="voltar" id="voltar">
            </a>
            <h1>Adicionar</h1>
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
            <form method="post" action="<%= request.getContextPath() %>/AdicionarTarefa">

            <div class="formulario-detalhes">

                <div class="area-detalhes">
                    <h3 class="subtitulo-secao">Detalhes</h3>
                    <div class="detalhes-campos">
                        <div>
                            <div class="campo">
                                <label for="">Prioridade</label>
                                <select class="filtro-select" name="prioridade">
                                    <option value="" disabled selected hidden>Prioridade</option>
                                    <option value="nao_iniciada">Não Iniciada</option>
                                    <option value="em_andamento">Em Andamento</option>
                                    <option value="concluida">Concluída</option>
                                </select>
                            </div>

                            <div class="campo">
                                <label for="nome-tarefa">Nome da Tarefa</label>
                                <input type="text" id="nome-tarefa" name="nome" placeholder="Digite o Nome da Tarefa">
                            </div>
                        </div>
                        <div>
                            <div class="campo">
                                <label for="responsavel">Responsável</label>
                                <input type="text" name="responsavel" id="responsavel"
                                       placeholder="Digite o Nome do Responsável">
                            </div>
                            <div class="campo">
                                <label for="data-tarefa">Data da Tarefa</label>
                                <input type="date" id="data-tarefa" name="prazo">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="area-descricao">
                    <h3 class="subtitulo-secao">Descrição</h3>
                    <h3 style="opacity: 0;">Espaço</h3>
                    <textarea class="texto-descricao" placeholder="coloque aqui a descrição da tarefa" name="descricao" e></textarea>

                    <a href="<%= request.getContextPath() %>/pagina?nome=tarefas" class="link-inserir"><button
                            class="btn-enviar">Confirmar</button></a>
                </div>
            </div>
            </form>
        </section>
    </main>
</div>
</body>

</html>
