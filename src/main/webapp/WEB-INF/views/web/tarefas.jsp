<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.projybyraservletmvc.model.Tarefas" %>
<%@ page import="com.projybyraservletmvc.model.Usuario" %>

<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/tarefas.css"/>
    <title>YBYRA TECH</title>
</head>

<body>
<%
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    List<Tarefas> tarefas = (List<Tarefas>) request.getAttribute("tarefas");
    List<Usuario> usuarios = (List<Usuario>) request.getAttribute(("usuarios"));

    Integer idUsuarioLogado = (Integer) session.getAttribute("usuarioID");
%>

<div class="container-principal">


    <% request.setAttribute("paginaAtual", "tarefas"); %>

    <jsp:include page="../includes/aside.jsp"/>

    <!-- CONTEÚDO PRINCIPAL -->
    <main class="conteudo">
        <header class="topo">
            <div class="area-filtros">
                <form class="campo-busca" method="get" action="<%= request.getContextPath() %>/BuscaTarefas">
                    <input type="text" placeholder="Buscar Tarefas" id="buscar" name="busca" title="Busca" />
                    <button class="btn-lupa" type="submit">
                        <img src="<%= request.getContextPath() %>/assets/imgs/Research.png" alt="Lupa" title="Lupa" />
                    </button>
                </form>

                <a href="<%= request.getContextPath() %>/pagina?nome=adicionarTarefa" id="linkAdi" title="Adicionar">Adicionar</a>
            </div>
        </header>

        <!-- BOARD DE TAREFAS + PESSOAS ONLINE -->
        <section class="secao-board">
            <!-- QUADRO KANBAN -->
            <div class="quadro-tarefas">

                <!-- COLUNA: NÃO INICIADA -->
                <div class="coluna-status">
                    <div class="titulo-status">
                        <h3>Não Iniciada</h3>
                        <!-- BOTÃO APAGAR TODOS COM MODAL -->
                        <label for="modal-apagar-todos-1" id="apagarTodos">Apagar Todos</label>
                    </div>

                    <!-- CHECKBOX E MODAL APAGAR TODOS -->
                    <input type="checkbox" class="menu-lixeira" id="modal-apagar-todos-1" />
                    <div class="modal-overlay">
                        <div class="menu-lixo">
                            <div class="menu-lixo-icone">
                                <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira" />
                            </div>
                            <h1>Deseja excluir TODAS as tarefas?</h1>
                            <p>
                                Esta ação não pode ser desfeita. Todos os dados desta coluna serão
                                permanentemente removidos.
                            </p>
                            <div class="info-item">
                                <strong>Coluna:</strong>
                                <span>Não Iniciada</span>
                            </div>
                            <div class="info-item">
                                <strong>Total de tarefas:</strong>
                                <span><%
                                    int countNaoIniciada = 0;
                                    if (tarefas != null) {
                                        for (Tarefas t : tarefas) {
                                            if ("nao_iniciada".equals(t.getPrioridade())) countNaoIniciada++;
                                        }
                                    }
                                %><%= countNaoIniciada %> tarefa<%= countNaoIniciada != 1 ? "s" : "" %></span>
                            </div>
                            <form action="<%= request.getContextPath()%>/ExcluirTarefa" method="post">
                                <div class="buttons">
                                    <input type="hidden" name="prioridade" value="nao_iniciada">
                                    <input type="hidden" name="id_usuario" value="<%= idUsuarioLogado %>">
                                    <input type="hidden" name="acao" value="excluirPrioridade">
                                    <label for="modal-apagar-todos-1" class="btn-cancelar">Não</label>
                                    <button type="submit" class="btn-excluir">Sim, apagar tudo</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <%
                        if (tarefas != null && !tarefas.isEmpty()) {
                            int contadorNaoIniciada = 1;
                            for (Tarefas tarefa : tarefas) {
                                if ("nao_iniciada".equals(tarefa.getPrioridade())) {
                                    String tarefaId = "tarefa-ni-" + contadorNaoIniciada;
                                    String modalid = "modal-ni-" + contadorNaoIniciada;
                    %>
                    <div class="tarefa nao-iniciada">
                        <input type="checkbox" id="<%= tarefaId %>" class="checkbox-expandir">
                        <label for="<%= tarefaId %>" class="cabecalho-tarefa">
                            <span class="titulo-tarefa"><%= tarefa.getNome() %></span>
                            <div class="acoes-tarefa">
                                <form method="post" action="<%=request.getContextPath()%>/DadosAlterarTarefa">
                                    <input type="hidden" name="id_tarefa" value="<%= tarefa.getId_tarefa()%>">
                                    <input type="hidden" name="id_usuario" value="<%= tarefa.getId_usuario()%>">
                                    <input type="hidden" name="prioridade" value="<%= tarefa.getPrioridade()%>">
                                    <input type="hidden" name="responsavel" value="<%= tarefa.getResponsavel()%>">
                                    <input type="hidden" name="nome" value="<%= tarefa.getNome()%>">
                                    <input type="hidden" name="prazo" value="<%= tarefa.getPrazo()%>">
                                    <input type="hidden" name="descricao" value="<%= tarefa.getDescricao()%>">

                                    <button class="btn-acao btn-editar" type="submit">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/icone_alterar.png" alt="Editar" title="Alterar">
                                    </button>
                                </form>

                                <label for="<%= modalid %>" class="btn-acao icone-lixeira">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira" title="Lixeira">
                                </label>
                            </div>
                            <span class="seta-expandir" title="detalhes">▼</span>
                        </label>

                        <!-- CHECKBOX E MODAL FORA DO LABEL -->
                        <input type="checkbox" class="menu-lixeira" id="<%= modalid %>">
                        <div class="modal-overlay">
                            <div class="menu-lixo">
                                <div class="menu-lixo-icone">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
                                </div>
                                <h1>Deseja excluir a tarefa?</h1>
                                <p>
                                    Esta ação não pode ser desfeita. Todos os dados serão
                                    permanentemente removidos.
                                </p>
                                <div class="info-item">
                                    <strong>Responsável:</strong>
                                    <span><%= tarefa.getResponsavel() %></span>
                                </div>
                                <div class="info-item">
                                    <strong>Prazo de enceramento:</strong>
                                    <span><%= tarefa.getPrazo().format(formatter) %></span>
                                </div>
                                <div class="info-item">
                                    <strong>Descrição:</strong>
                                    <span><%= tarefa.getDescricao() %></span>
                                </div>

                                <form method="post" action="<%= request.getContextPath() %>/ExcluirTarefa">
                                    <input type="hidden" name="id" value="<%= tarefa.getId_tarefa() %>">
                                    <input type="hidden" name="acao" value="excluir">

                                    <div class="buttons">
                                        <label for="<%= modalid %>" class="btn-cancelar">Não</label>
                                        <button type="submit" class="btn-excluir">Sim</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="detalhes-tarefa">
                            <p><strong>Responsável:</strong> <%= tarefa.getResponsavel() %></p>
                            <p><strong>Prazo de enceramento:</strong> <%= tarefa.getPrazo().format(formatter) %></p>
                            <p><strong>Descrição:</strong> <%= tarefa.getDescricao() %></p>
                        </div>
                    </div>
                    <%
                                    contadorNaoIniciada++;
                                }
                            }
                        }
                    %>
                </div>

                <!-- COLUNA: EM ANDAMENTO -->
                <div class="coluna-status">
                    <div class="titulo-status">
                        <h3>Em Andamento</h3>
                        <!-- BOTÃO APAGAR TODOS COM MODAL -->
                        <label for="modal-apagar-todos-2" id="apagarTodos">Apagar Todos</label>
                    </div>

                    <!-- CHECKBOX E MODAL APAGAR TODOS -->
                    <input type="checkbox" class="menu-lixeira" id="modal-apagar-todos-2" />
                    <div class="modal-overlay">
                        <div class="menu-lixo">
                            <div class="menu-lixo-icone">
                                <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira" />
                            </div>
                            <h1>Deseja excluir TODAS as tarefas?</h1>
                            <p>
                                Esta ação não pode ser desfeita. Todos os dados desta coluna serão
                                permanentemente removidos.
                            </p>
                            <div class="info-item">
                                <strong>Coluna:</strong>
                                <span>Em Andamento</span>
                            </div>
                            <div class="info-item">
                                <strong>Total de tarefas:</strong>
                                <span><%
                                    int countEmAndamento = 0;
                                    if (tarefas != null) {
                                        for (Tarefas t : tarefas) {
                                            if ("em_andamento".equals(t.getPrioridade())) countEmAndamento++;
                                        }
                                    }
                                %><%= countEmAndamento %> tarefa<%= countEmAndamento != 1 ? "s" : "" %></span>
                            </div>
                            <form action="<%= request.getContextPath()%>/ExcluirTarefa" method="post">
                                <div class="buttons">
                                    <input type="hidden" name="prioridade" value="em_andamento">
                                    <input type="hidden" name="id_usuario" value="<%= idUsuarioLogado %>">
                                    <input type="hidden" name="acao" value="excluirPrioridade">
                                    <label for="modal-apagar-todos-2" class="btn-cancelar">Não</label>
                                    <button type="submit" class="btn-excluir">Sim, apagar tudo</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <%
                        if (tarefas != null && !tarefas.isEmpty()) {
                            int contadorEmAndamento = 1;
                            for (Tarefas tarefa : tarefas) {
                                if ("em_andamento".equals(tarefa.getPrioridade())) {
                                    String tarefaId = "tarefa-ea-" + contadorEmAndamento;
                                    String modalid = "modal-ea-" + contadorEmAndamento;
                    %>
                    <div class="tarefa em-andamento">
                        <input type="checkbox" id="<%= tarefaId %>" class="checkbox-expandir">
                        <label for="<%= tarefaId %>" class="cabecalho-tarefa">
                            <span class="titulo-tarefa"><%= tarefa.getNome() %></span>
                            <div class="acoes-tarefa">
                                <form method="post" action="<%=request.getContextPath()%>/DadosAlterarTarefa">
                                    <input type="hidden" name="id_tarefa" value="<%= tarefa.getId_tarefa()%>">
                                    <input type="hidden" name="id_usuario" value="<%= tarefa.getId_usuario()%>">
                                    <input type="hidden" name="prioridade" value="<%= tarefa.getPrioridade()%>">
                                    <input type="hidden" name="responsavel" value="<%= tarefa.getResponsavel()%>">
                                    <input type="hidden" name="nome" value="<%= tarefa.getNome()%>">
                                    <input type="hidden" name="prazo" value="<%= tarefa.getPrazo()%>">
                                    <input type="hidden" name="descricao" value="<%= tarefa.getDescricao()%>">

                                    <button class="btn-acao btn-editar" type="submit">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/icone_alterar.png" alt="Editar" title="Alterar">
                                    </button>
                                </form>

                                <label for="<%= modalid %>" class="btn-acao icone-lixeira">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira" title="Lixeira">
                                </label>
                            </div>
                            <span class="seta-expandir" title="detalhes">▼</span>
                        </label>

                        <input type="checkbox" class="menu-lixeira" id="<%= modalid %>">
                        <div class="modal-overlay">
                            <div class="menu-lixo">
                                <div class="menu-lixo-icone">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
                                </div>
                                <h1>Deseja excluir a tarefa?</h1>
                                <p>
                                    Esta ação não pode ser desfeita. Todos os dados serão
                                    permanentemente removidos.
                                </p>
                                <div class="info-item">
                                    <strong>Responsável:</strong>
                                    <span><%= tarefa.getResponsavel() %></span>
                                </div>
                                <div class="info-item">
                                    <strong>Prioridade:</strong>
                                    <span>Média</span>
                                </div>
                                <div class="info-item">
                                    <strong>Prazo:</strong>
                                    <span><%= tarefa.getPrazo().format(formatter) %></span>
                                </div>
                                <div class="info-item">
                                    <strong>Descrição:</strong>
                                    <span><%= tarefa.getDescricao() %></span>
                                </div>

                                <form method="post" action="<%= request.getContextPath() %>/ExcluirTarefa">
                                    <input type="hidden" name="id" value="<%= tarefa.getId_tarefa() %>">
                                    <input type="hidden" name="acao" value="excluir">

                                    <div class="buttons">
                                        <label for="<%= modalid %>" class="btn-cancelar">Não</label>
                                        <button type="submit" class="btn-excluir">Sim</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="detalhes-tarefa">
                            <p><strong>Responsável:</strong> <%= tarefa.getResponsavel() %></p>
                            <p><strong>Prazo de enceramento:</strong> <%= tarefa.getPrazo().format(formatter) %></p>
                            <p><strong>Descrição:</strong> <%= tarefa.getDescricao() %></p>
                        </div>
                    </div>
                    <%
                                    contadorEmAndamento++;
                                }
                            }
                        }
                    %>
                </div>

                <!-- COLUNA: CONCLUÍDA -->
                <div class="coluna-status">
                    <div class="titulo-status">
                        <h3>Concluídas</h3>
                        <!-- BOTÃO APAGAR TODOS COM MODAL -->
                        <label for="modal-apagar-todos-3" id="apagarTodos">Apagar Todos</label>
                    </div>

                    <!-- CHECKBOX E MODAL APAGAR TODOS -->
                    <input type="checkbox" class="menu-lixeira" id="modal-apagar-todos-3" />
                    <div class="modal-overlay">
                        <div class="menu-lixo">
                            <div class="menu-lixo-icone">
                                <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira" />
                            </div>
                            <h1>Deseja excluir TODAS as tarefas?</h1>
                            <p>
                                Esta ação não pode ser desfeita. Todos os dados desta coluna serão
                                permanentemente removidos.
                            </p>
                            <div class="info-item">
                                <strong>Coluna:</strong>
                                <span>Concluídas</span>
                            </div>
                            <div class="info-item">
                                <strong>Total de tarefas:</strong>
                                <span><%
                                    int countConcluida = 0;
                                    if (tarefas != null) {
                                        for (Tarefas t : tarefas) {
                                            if ("concluida".equals(t.getPrioridade())) countConcluida++;
                                        }
                                    }
                                %><%= countConcluida %> tarefa<%= countConcluida != 1 ? "s" : "" %></span>
                            </div>
                            <form action="<%= request.getContextPath()%>/ExcluirTarefa" method="post">
                                <div class="buttons">
                                    <input type="hidden" name="prioridade" value="concluida">
                                    <input type="hidden" name="id_usuario" value="<%= idUsuarioLogado %>">
                                    <input type="hidden" name="acao" value="excluirPrioridade">
                                    <label for="modal-apagar-todos-3" class="btn-cancelar">Não</label>
                                    <button type="submit" class="btn-excluir">Sim, apagar tudo</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <%
                        if (tarefas != null && !tarefas.isEmpty()) {
                            int contadorConcluida = 1;
                            for (Tarefas tarefa : tarefas) {
                                if ("concluida".equals(tarefa.getPrioridade())) {
                                    String tarefaId = "tarefa-c-" + contadorConcluida;
                                    String modalid = "modal-c-" + contadorConcluida;
                    %>
                    <div class="tarefa concluida">
                        <input type="checkbox" id="<%= tarefaId %>" class="checkbox-expandir">
                        <label for="<%= tarefaId %>" class="cabecalho-tarefa">
                            <span class="titulo-tarefa"><%= tarefa.getNome() %></span>
                            <div class="acoes-tarefa">
                                <form method="post" action="<%=request.getContextPath()%>/DadosAlterarTarefa">
                                    <input type="hidden" name="id_tarefa" value="<%= tarefa.getId_tarefa()%>">
                                    <input type="hidden" name="id_usuario" value="<%= tarefa.getId_usuario()%>">
                                    <input type="hidden" name="prioridade" value="<%= tarefa.getPrioridade()%>">
                                    <input type="hidden" name="responsavel" value="<%= tarefa.getResponsavel()%>">
                                    <input type="hidden" name="nome" value="<%= tarefa.getNome()%>">
                                    <input type="hidden" name="prazo" value="<%= tarefa.getPrazo()%>">
                                    <input type="hidden" name="descricao" value="<%= tarefa.getDescricao()%>">

                                    <button class="btn-acao btn-editar" type="submit">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/icone_alterar.png" alt="Editar" title="Alterar">
                                    </button>
                                </form>

                                <label for="<%= modalid %>" class="btn-acao icone-lixeira">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira" title="Lixeira">
                                </label>
                            </div>
                            <span class="seta-expandir" title="detalhes">▼</span>
                        </label>

                        <input type="checkbox" class="menu-lixeira" id="<%= modalid %>">
                        <div class="modal-overlay">
                            <div class="menu-lixo">
                                <div class="menu-lixo-icone">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
                                </div>
                                <h1>Deseja excluir a tarefa?</h1>
                                <p>
                                    Esta ação não pode ser desfeita. Todos os dados serão permanentemente removidos.
                                </p>
                                <div class="info-item">
                                    <strong>Responsável:</strong>
                                    <span><%= tarefa.getResponsavel() %></span>
                                </div>
                                <div class="info-item">
                                    <strong>Prazo:</strong>
                                    <span><%= tarefa.getPrazo().format(formatter) %></span>
                                </div>
                                <div class="info-item">
                                    <strong>Descrição:</strong>
                                    <span><%= tarefa.getDescricao() %></span>
                                </div>

                                <form method="post" action="<%= request.getContextPath() %>/ExcluirTarefa">
                                    <input type="hidden" name="id" value="<%= tarefa.getId_tarefa() %>">
                                    <input type="hidden" name="acao" value="excluir">

                                    <div class="buttons">
                                        <label for="<%= modalid %>" class="btn-cancelar">Não</label>
                                        <button type="submit" class="btn-excluir">Sim</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="detalhes-tarefa">
                            <p><strong>Responsável:</strong> <%= tarefa.getResponsavel() %></p>
                            <p><strong>Prazo de enceramento:</strong> <%= tarefa.getPrazo().format(formatter) %></p>
                            <p><strong>Descrição:</strong> <%= tarefa.getDescricao() %></p>
                        </div>
                    </div>
                    <%
                                    contadorConcluida++;
                                }
                            }
                        }
                    %>
                </div>
            </div>

            <!-- PAINEL PESSOAS ONLINE -->
            <aside class="painel-pessoas">
                <div class="topo-painel">
                    <h3>Pessoas Online</h3>
                </div>
                <div class="lista-usuarios">
                    <%
                        if (usuarios != null && !usuarios.isEmpty()) {
                            for (Usuario usuario : usuarios) { %>
                    <div class="usuario">
                        <div class="avatar-usuario">
                            <img src="<%= request.getContextPath() %>/assets/imgs/icone_usuario.png" alt="icone de usuário">
                        </div>
                        <span class="nome-usuario"><%= usuario.getNome() %></span>
                        <span class="status-online"></span>
                    </div>
                    <%}}%>
                </div>
            </aside>
        </section>
    </main>
</div>
</body>
</html>