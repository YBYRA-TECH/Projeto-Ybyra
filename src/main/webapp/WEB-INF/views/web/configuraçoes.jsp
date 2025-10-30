<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/configuracoes.css" />
    <title>YBYRA TECH</title>
</head>

<body>
<div class="container-principal">
    <aside class="barra-lateral">
        <input type="checkbox" id="menu" />
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

                <li class="item-menu">
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
                            <img src="<%= request.getContextPath() %>/assets/imgs/camera_insercao.png" alt="Ícone Inserir Dados" />
                        </div>
                        <span>Inserir Dados</span>
                    </a>
                </li>
                <li class="item-menu ativo">
                    <a href="<%= request.getContextPath() %>/pagina?nome=configuracoes">
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
                <!-- COLUNA: NÃO INICIADA -->
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
                                <span>2 tarefas</span>
                            </div>
                            <div class="buttons">
                                <label for="modal-apagar-todos-1" class="btn-cancelar">Não</label>
                                <button type="submit" class="btn-excluir">Sim</button>
                            </div>
                        </div>
                    </div>

                    <!-- TAREFA 1 -->
                    <div class="tarefa nao-iniciada">
                        <label for="tarefa-1" class="cabecalho-tarefa">
                            <span class="titulo-tarefa">Felipe Lindão</span>
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
                                <h1>Deseja excluir a usuário?</h1>
                                <p>
                                    Esta ação não pode ser desfeita. Todos os dados serão
                                    permanentemente removidos.
                                </p>
                                <div class="info-item">
                                    <strong>Nome:</strong>
                                    <span>Seu amor</span>
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
                </div>
            </div>
        </section>
    </main>
</div>
</body>
</html>