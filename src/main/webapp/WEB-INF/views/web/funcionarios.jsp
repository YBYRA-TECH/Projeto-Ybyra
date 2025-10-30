<%--
  Created by IntelliJ IDEA.
  User: murilofonseca-ieg
  Date: 30/10/2025
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/funcionarios.css" />
    <title>YBYRA TECH</title>
</head>

<body>
<div class="container-principal">

    <% request.setAttribute("paginaAtual", "funcionarios"); %>

    <jsp:include page="../includes/aside.jsp"/>


    <!-- CONTEÚDO PRINCIPAL -->
    <main class="conteudo">
        <!-- HEADER COM BUSCA E FILTROS -->
        <header class="topo">
            <div class="area-filtros">
                <form class="campo-busca">
                    <input type="text" placeholder="Buscar Tarefas" id="buscar" title="Busca" />
                    <button class="btn-lupa" type="button">
                        <img src="<%= request.getContextPath() %>/assets/imgs/Research.png" alt="Lupa" title="Lupa" />
                    </button>
                </form>
                <a href="<%= request.getContextPath() %>/pagina?nome=adicionarUsuario" id="linkAdi" title="Adicionar">Adicionar</a>

                <div class="area-icones">
                    <input type="checkbox" id="menu-notificacoes" />
                    <label for="menu-notificacoes" id="label-notificações" title="Notificações">
                        <img src="<%= request.getContextPath() %>/assets/imgs/notificacoes.png" alt="Notificações" />
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
                <!-- COLUNA: USUÁRIOS -->
                <div class="coluna-status">
                    <div class="titulo-status">
                        <h3>Usuários</h3>
                        <label for="modal-apagar-todos-1" class="btn-apagar-todos">Apagar Todos</label>
                    </div>

                    <!-- CHECKBOX E MODAL APAGAR TODOS -->
                    <input type="checkbox" class="menu-lixeira" id="modal-apagar-todos-1" />
                    <div class="modal-overlay">
                        <div class="menu-lixo">
                            <div class="menu-lixo-icone">
                                <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira" />
                            </div>
                            <h1>Deseja excluir TODOS os Usuários?</h1>
                            <p>
                                Esta ação não pode ser desfeita. Todos os dados desta coluna
                                serão permanentemente removidos.
                            </p>

                            <div class="info-item">
                                <strong>Total de Usuários:</strong>
                                <span>4 usuários</span>
                            </div>
                            <div class="buttons">
                                <label for="modal-apagar-todos-1" class="btn-cancelar">Não</label>
                                <button type="submit" class="btn-excluir">Sim</button>
                            </div>
                        </div>
                    </div>

                    <!-- GRID DE USUÁRIOS -->
                    <div class="usuarios-grid">
                        <!-- USUÁRIO 1 -->
                        <div class="tarefa nao-iniciada">
                            <label for="tarefa-1" class="cabecalho-tarefa">
                                <span class="titulo-tarefa">Felipe Augusto</span>
                                <div class="acoes-tarefa">
                                    <a href="<%= request.getContextPath() %>/pagina?nome=alterarUsuario" class="btn-acao btn-editar">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/icone%20alterar.png" alt="Editar" title="Alterar" />
                                    </a>
                                    <label for="modal-1" class="btn-acao icone-lixeira">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira" title="Lixeira" />
                                    </label>
                                </div>
                            </label>

                            <!-- CHECKBOX E MODAL DA TAREFA -->
                            <input type="checkbox" class="menu-lixeira" id="modal-1" />
                            <div class="modal-overlay">
                                <div class="menu-lixo">
                                    <div class="menu-lixo-icone">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira" />
                                    </div>
                                    <h1>Deseja excluir o usuário?</h1>
                                    <p>
                                        Esta ação não pode ser desfeita. Todos os dados serão
                                        permanentemente removidos.
                                    </p>
                                    <div class="info-item">
                                        <strong>Nome:</strong>
                                        <span>Felipe Augusto</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Data de Nascimento:</strong>
                                        <span>10/10/2000</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Área:</strong>
                                        <span>Quente</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Localização:</strong>
                                        <span>Carapicuiba</span>
                                    </div>
                                    <div class="buttons">
                                        <label for="modal-1" class="btn-cancelar">Não</label>
                                        <button type="submit" class="btn-excluir">Sim</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- USUÁRIO 2 -->
                        <div class="tarefa nao-iniciada">
                            <label for="tarefa-2" class="cabecalho-tarefa">
                                <span class="titulo-tarefa">Murilo Rosa</span>
                                <div class="acoes-tarefa">
                                    <a href="<%= request.getContextPath() %>/pagina?nome=alterarUsuario" class="btn-acao btn-editar">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/icone%20alterar.png" alt="Editar" title="Alterar" />
                                    </a>
                                    <label for="modal-2" class="btn-acao icone-lixeira">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira" title="Lixeira" />
                                    </label>
                                </div>
                            </label>

                            <!-- CHECKBOX E MODAL DA TAREFA -->
                            <input type="checkbox" class="menu-lixeira" id="modal-2" />
                            <div class="modal-overlay">
                                <div class="menu-lixo">
                                    <div class="menu-lixo-icone">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira" />
                                    </div>
                                    <h1>Deseja excluir o usuário?</h1>
                                    <p>
                                        Esta ação não pode ser desfeita. Todos os dados serão
                                        permanentemente removidos.
                                    </p>
                                    <div class="info-item">
                                        <strong>Nome:</strong>
                                        <span>Murilo Rosa</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Data de Nascimento:</strong>
                                        <span>10/10/2000</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Área:</strong>
                                        <span>Quente</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Localização:</strong>
                                        <span>Carapicuiba</span>
                                    </div>
                                    <div class="buttons">
                                        <label for="modal-2" class="btn-cancelar">Não</label>
                                        <button type="submit" class="btn-excluir">Sim</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- USUÁRIO 3 -->
                        <div class="tarefa nao-iniciada">
                            <label for="tarefa-3" class="cabecalho-tarefa">
                                <span class="titulo-tarefa">David Reche</span>
                                <div class="acoes-tarefa">
                                    <a href="<%= request.getContextPath() %>/pagina?nome=alterarUsuario" class="btn-acao btn-editar">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/icone%20alterar.png" alt="Editar" title="Alterar" />
                                    </a>
                                    <label for="modal-3" class="btn-acao icone-lixeira">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira" title="Lixeira" />
                                    </label>
                                </div>
                            </label>

                            <!-- CHECKBOX E MODAL DA TAREFA -->
                            <input type="checkbox" class="menu-lixeira" id="modal-3" />
                            <div class="modal-overlay">
                                <div class="menu-lixo">
                                    <div class="menu-lixo-icone">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira" />
                                    </div>
                                    <h1>Deseja excluir o usuário?</h1>
                                    <p>
                                        Esta ação não pode ser desfeita. Todos os dados serão
                                        permanentemente removidos.
                                    </p>
                                    <div class="info-item">
                                        <strong>Nome:</strong>
                                        <span>David Reche</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Data de Nascimento:</strong>
                                        <span>10/10/2000</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Área:</strong>
                                        <span>Quente</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Localização:</strong>
                                        <span>Carapicuiba</span>
                                    </div>
                                    <div class="buttons">
                                        <label for="modal-3" class="btn-cancelar">Não</label>
                                        <button type="submit" class="btn-excluir">Sim</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- USUÁRIO 4 -->
                        <div class="tarefa nao-iniciada">
                            <label for="tarefa-4" class="cabecalho-tarefa">
                                <span class="titulo-tarefa">Davi Lacerda</span>
                                <div class="acoes-tarefa">
                                    <a href="<%= request.getContextPath() %>/pagina?nome=alterarUsuario" class="btn-acao btn-editar">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/icone%20alterar.png" alt="Editar" title="Alterar" />
                                    </a>
                                    <label for="modal-4" class="btn-acao icone-lixeira">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira" title="Lixeira" />
                                    </label>
                                </div>
                            </label>

                            <!-- CHECKBOX E MODAL DA TAREFA -->
                            <input type="checkbox" class="menu-lixeira" id="modal-4" />
                            <div class="modal-overlay">
                                <div class="menu-lixo">
                                    <div class="menu-lixo-icone">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira" />
                                    </div>
                                    <h1>Deseja excluir o usuário?</h1>
                                    <p>
                                        Esta ação não pode ser desfeita. Todos os dados serão
                                        permanentemente removidos.
                                    </p>
                                    <div class="info-item">
                                        <strong>Nome:</strong>
                                        <span>Davi Lacerda</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Data de Nascimento:</strong>
                                        <span>10/10/2000</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Área:</strong>
                                        <span>Quente</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Localização:</strong>
                                        <span>Carapicuiba</span>
                                    </div>
                                    <div class="buttons">
                                        <label for="modal-4" class="btn-cancelar">Não</label>
                                        <button type="submit" class="btn-excluir">Sim</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>
</body>
</html>
