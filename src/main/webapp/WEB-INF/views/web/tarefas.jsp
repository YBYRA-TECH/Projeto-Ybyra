<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.projybyraservletmvc.model.Tarefas" %>
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
%>

<div class="container-principal">

    <aside class="barra-lateral">
        <input type="checkbox" id="menu">
        <label for="menu" class="menu-icon">
            <span></span>
            <span></span>
            <span></span>
        </label>
        <label for="menu-icon" class="logo-logo">
            <img src="<%= request.getContextPath() %>/assets/imgs/Nova%20logo.png" alt="Logo YBYRA TECH" id="logo" />
        </label>

        <nav class="menu-principal">
            <ul>
                <li class="item-menu">
                    <a href="<%= request.getContextPath() %>/pagina?nome=inicioBI">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/assets/imgs/House.png" alt="Ícone Início" />
                        </div>
                        <span>Início</span>
                    </a>
                </li>
                <li class="item-menu">
                    <a href="<%= request.getContextPath() %>/pagina?nome=relatorios">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/assets/imgs/document.png" alt="Ícone relatorios" />
                        </div>
                        <span>Relatórios</span>
                    </a>
                </li>

                <li class="item-menu ativo">
                    <a href="<%= request.getContextPath() %>/pagina?nome=tarefas">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/assets/imgs/clipboard.png" alt="Ícone Tarefas" />
                        </div>
                        <span>Tarefas</span>
                    </a>
                </li>

                <li class="item-menu">
                    <a href="<%= request.getContextPath() %>/pagina?nome=insercaoDados">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/assets/imgs/camera_insercao.png" alt="Ícone Inserir Dados">
                        </div>
                        <span>Inserir Dados</span>
                    </a>
                </li>

                <li class="item-menu">
                    <a href="#">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/assets/imgs/configuracoes.png" alt="Ícone Configurações" />
                        </div>
                        <span>Configurações</span>
                    </a>
                </li>
            </ul>
        </nav>
    </aside>

    <!-- CONTEÚDO PRINCIPAL -->
    <main class="conteudo">
        <header class="topo">
            <div class="area-filtros">
                <form method="get" action="<%= request.getContextPath() %>/BuscaTarefas">
                    <div class="campo-busca">
                        <input type="text" placeholder="Buscar Tarefas" id="buscar" name="busca"  />
                        <button class="btn-lupa" type="submit">
                            <img src="<%= request.getContextPath() %>/assets/imgs/Research.png" alt="Buscar" />
                        </button>
                    </div>
                </form>

                <label for="adicionar" id="menu-adicionar">
                    <a href="<%= request.getContextPath() %>/pagina?nome=adicionarTarefa" id="linkAdi">Adicionar</a>
                </label>-
                <div class="area-icones">
                    <input type="checkbox" id="menu-notificacoes">
                    <label for="menu-notificacoes" id="label-notificações">
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
        </header>

        <!-- BOARD DE TAREFAS + PESSOAS ONLINE -->
        <section class="secao-board">
            <!-- QUADRO KANBAN -->
            <div class="quadro-tarefas">

                <!-- COLUNA: NÃO INICIADA -->
                <div class="coluna-status">
                    <h3 class="titulo-status">Não Iniciada</h3>
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
                                <a href="<%= request.getContextPath() %>/pagina?nome=telaAlterar" class="btn-acao btn-editar">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/icone%20alterar.png" alt="Editar">
                                </a>
                                <input type="checkbox" class="menu-lixeira" id="<%= modalid %>">
                                <label for="<%= modalid %>" class="icone-lixeira">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira">
                                </label>
                                <div class="modal-overlay">
                                    <div class="menu-lixo">
                                        <div class="menu-lixo-icone">
                                            <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
                                        </div>
                                        <h1>Deseja excluir a tarefa?</h1>
                                        <p>Esta ação não pode ser desfeita.</p>
                                        <div class="info-item">
                                            <strong>Prazo:</strong>
                                            <span><%= tarefa.getPrazo().format(formatter) %></span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Descrição:</strong>
                                            <span><%= tarefa.getDescricao() %></span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Responsável:</strong>
                                            <span><%= tarefa.getResponsavel() %></span>
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
                            </div>
                            <span class="seta-expandir">▼</span>
                        </label>
                        <div class="detalhes-tarefa">
                            <p><strong>Responsável:</strong> <%= tarefa.getResponsavel() %></p>
                            <p><strong>Prazo:</strong> <%= tarefa.getPrazo().format(formatter) %></p>
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
                    <h3 class="titulo-status">Em Andamento</h3>
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
                                <a href="<%= request.getContextPath() %>/pagina?nome=telaAlterar" class="btn-acao btn-editar">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/icone%20alterar.png" alt="Editar">
                                </a>
                                <input type="checkbox" class="menu-lixeira" id="<%= modalid %>">
                                <label for="<%= modalid %>" class="icone-lixeira">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira">
                                </label>
                                <div class="modal-overlay">
                                    <div class="menu-lixo">
                                        <div class="menu-lixo-icone">
                                            <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
                                        </div>
                                        <h1>Deseja excluir a tarefa?</h1>
                                        <p>Esta ação não pode ser desfeita.</p>
                                        <div class="info-item">
                                            <strong>Prazo:</strong>
                                            <span><%= tarefa.getPrazo().format(formatter) %></span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Descrição:</strong>
                                            <span><%= tarefa.getDescricao() %></span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Responsável:</strong>
                                            <span><%= tarefa.getResponsavel() %></span>
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
                            </div>
                            <span class="seta-expandir">▼</span>
                        </label>
                        <div class="detalhes-tarefa">
                            <p><strong>Responsável:</strong> <%= tarefa.getResponsavel() %></p>
                            <p><strong>Prazo:</strong> <%= tarefa.getPrazo().format(formatter) %></p>
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
                    <h3 class="titulo-status">Tarefa Concluída</h3>
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
                                <a href="<%= request.getContextPath() %>/pagina?nome=telaAlterar" class="btn-acao btn-editar">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/icone%20alterar.png" alt="Editar">
                                </a>
                                <input type="checkbox" class="menu-lixeira" id="<%= modalid %>">
                                <label for="<%= modalid %>" class="icone-lixeira">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira">
                                </label>
                                <div class="modal-overlay">
                                    <div class="menu-lixo">
                                        <div class="menu-lixo-icone">
                                            <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
                                        </div>
                                        <h1>Deseja excluir a tarefa?</h1>
                                        <p>Esta ação não pode ser desfeita.</p>
                                        <div class="info-item">
                                            <strong>Prazo:</strong>
                                            <span><%= tarefa.getPrazo().format(formatter) %></span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Descrição:</strong>
                                            <span><%= tarefa.getDescricao() %></span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Responsável:</strong>
                                            <span><%= tarefa.getResponsavel() %></span>
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
                            </div>
                            <span class="seta-expandir">▼</span>
                        </label>
                        <div class="detalhes-tarefa">
                            <p><strong>Responsável:</strong> <%= tarefa.getResponsavel() %></p>
                            <p><strong>Concluído em:</strong> <%= tarefa.getPrazo().format(formatter) %></p>
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
                    <div class="usuario">
                        <div class="avatar-usuario">
                            <img src="<%= request.getContextPath() %>/assets/imgs/icone_usuario.png" alt="icone de usuário">
                        </div>
                        <span class="nome-usuario">Davi Lacerda</span>
                        <span class="status-online"></span>
                    </div>
                    <div class="usuario">
                        <div class="avatar-usuario">
                            <img src="<%= request.getContextPath() %>/assets/imgs/icone_usuario.png" alt="icone de usuário">
                        </div>
                        <span class="nome-usuario">Murilo Rosa</span>
                        <span class="status-online"></span>
                    </div>
                    <div class="usuario">
                        <div class="avatar-usuario">
                            <img src="<%= request.getContextPath() %>/assets/imgs/icone_usuario.png" alt="icone de usuário">
                        </div>
                        <span class="nome-usuario">Felipe Augusto</span>
                        <span class="status-online"></span>
                    </div>
                    <div class="usuario">
                        <div class="avatar-usuario">
                            <img src="<%= request.getContextPath() %>/assets/imgs/icone_usuario.png" alt="icone de usuário">
                        </div>
                        <span class="nome-usuario">David Reche</span>
                        <span class="status-online"></span>
                    </div>
                    <div class="usuario">
                        <div class="avatar-usuario">
                            <img src="<%= request.getContextPath() %>/assets/imgs/icone_usuario.png" alt="icone de usuário">
                        </div>
                        <span class="nome-usuario">Matheus fazan</span>
                        <span class="status-online"></span>
                    </div>
                    <div class="usuario">
                        <div class="avatar-usuario">
                            <img src="<%= request.getContextPath() %>/assets/imgs/icone_usuario.png" alt="icone de usuário">
                        </div>
                        <span class="nome-usuario">Emilly Dantas</span>
                        <span class="status-online"></span>
                    </div>
                    <div class="usuario">
                        <div class="avatar-usuario">
                            <img src="<%= request.getContextPath() %>/assets/imgs/icone_usuario.png" alt="icone de usuário">
                        </div>
                        <span class="nome-usuario">Marcelo Grilo</span>
                        <span class="status-online"></span>
                    </div>
                </div>
            </aside>
        </section>
    </main>
</div>
</body>
</html>