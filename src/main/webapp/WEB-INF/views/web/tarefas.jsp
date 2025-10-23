<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/tarefas.css" />
    <title>YBYRA TECH</title>
</head>

<body>
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
        <header class="topo" id="header">
            <div class="area-filtros">
                <div class="campo-busca">
                    <input type="text" placeholder="Buscar Tarefas" />
                    <button class="btn-lupa">
                        <img src="<%= request.getContextPath() %>/assets/imgs/Research.png" alt="Buscar" />
                    </button>
                </div>
                <input type="checkbox" id="adicionar">
                <label for="adicionar" id="menu-adicionar">
                    <span>Adicionar</span>
                </label>

                <div id="menu-tarefas">
                    <form action="<%= request.getContextPath() %>/AdicionarTarefa" method="post">

                        <select class="filtro-select" name="prioridade" required>
                            <option value="" disabled selected hidden>Prioridade</option>
                            <option value="nao_iniciada">Não Iniciada</option>
                            <option value="em_andamento">Em Andamento</option>
                            <option value="concluida">Concluída</option>
                        </select>

                        <input type="text" name="nome" placeholder="Nome da tarefa" required>
                        <input type="text" name="responsavel" placeholder="Responsável" required>
                        <input type="date" name="prazo" placeholder="Prazo" required>
                        <input type="text" name="descricao" placeholder="Descrição" required>
                        <div class="confirmar">
                            <button type="submit" class="btn-confirmar">confirmar</button>
                        </div>
                    </form>
                </div>

                <button class="btn-buscar">Buscar</button>
            </div>
            <div class="area-icones-usuario">
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
        </header>
        <!-- BOARD DE TAREFAS + PESSOAS ONLINE -->
        <section class="secao-board">
            <!-- QUADRO KANBAN -->
            <div class="quadro-tarefas">

                <!-- COLUNA: NÃO INICIADA -->
                <div class="coluna-status">
                    <h3 class="titulo-status">Não Iniciada</h3>

                    <!-- TAREFA 1 -->
                    <div class="tarefa nao-iniciada">
                        <input type="checkbox" id="tarefa-1" class="checkbox-expandir">
                        <label for="tarefa-1" class="cabecalho-tarefa">
                            <span class="titulo-tarefa">Manutenção na máquina do setor C.</span>
                            <div class="acoes-tarefa">
                                <a href="#header" class="btn-acao btn-editar">
                                    <label for="adicionar" class="icone-alterar">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/icone%20alterar.png" alt="Editar">
                                    </label>
                                </a>
                                <input type="checkbox" class="menu-lixeira" id="modal-1">
                                <label for="modal-1" class="icone-lixeira">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira">
                                </label>
                                <div class="modal-overlay">
                                    <div class="menu-lixo">
                                        <div class="menu-lixo-icone">
                                            <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
                                        </div>
                                        <h1>Deseja excluir o relatório?</h1>
                                        <p>Esta ação não pode ser desfeita. Todos os dados serão permanentemente
                                            removidos.</p>
                                        <div class="info-item">
                                            <strong>Prazo:</strong>
                                            <span>15/10/2025</span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Descrição:</strong>
                                            <span>Verificar ruído no motor principal e trocar o filtro de
                                                óleo.</span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Responsável:</strong>
                                            <span>Jorge Silva</span>
                                        </div>
                                        <div class="buttons">
                                            <label for="modal-1" class="btn-cancelar">Não</label>
                                            <label for="modal-1" class="btn-excluir">Sim</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <span class="seta-expandir">▼</span>
                        </label>
                        <div class="detalhes-tarefa">
                            <p><strong>Responsável:</strong> Jorge Silva</p>
                            <p><strong>Prazo:</strong> 15/10/2025</p>
                            <p><strong>Descrição:</strong> Verificar ruído no motor principal e trocar o filtro de
                                óleo.</p>
                        </div>
                    </div>

                    <!-- TAREFA 2 -->
                    <div class="tarefa nao-iniciada">
                        <input type="checkbox" id="tarefa-2" class="checkbox-expandir">
                        <label for="tarefa-2" class="cabecalho-tarefa">
                            <span class="titulo-tarefa">Manter a limpeza do setor.</span>
                            <div class="acoes-tarefa">
                                <a href="#menu-adicionar" class="btn-acao btn-editar">
                                    <label for="adicionar" class="icone-alterar">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/icone%20alterar.png" alt="Editar">
                                    </label>
                                </a>
                                <input type="checkbox" class="menu-lixeira" id="modal-3">
                                <label for="modal-3" class="icone-lixeira">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira">
                                </label>
                                <div class="modal-overlay">
                                    <div class="menu-lixo">
                                        <div class="menu-lixo-icone">
                                            <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
                                        </div>
                                        <h1>Deseja excluir o relatório?</h1>
                                        <p>Esta ação não pode ser desfeita. Todos os dados serão permanentemente
                                            removidos.</p>
                                        <div class="info-item">
                                            <strong>Prioridade:</strong>
                                            <span>Alta</span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Descrição:</strong>
                                            <span>Realizar limpeza completa do setor incluindo equipamentos
                                                e área de produção.</span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Responsável:</strong>
                                            <span>Equipe de Limpeza</span>
                                        </div>
                                        <div class="buttons">
                                            <label for="modal-3" class="btn-cancelar">Não</label>
                                            <label for="modal-3" class="btn-excluir">Sim</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <span class="seta-expandir">▼</span>
                        </label>
                        <div class="detalhes-tarefa">
                            <p><strong>Responsável:</strong> Equipe de Limpeza</p>
                            <p><strong>Prioridade:</strong> Alta</p>
                            <p><strong>Descrição:</strong> Realizar limpeza completa do setor incluindo equipamentos
                                e área de produção.</p>
                        </div>
                    </div>
                </div>

                <!-- COLUNA: EM ANDAMENTO -->
                <div class="coluna-status">
                    <h3 class="titulo-status">Em Andamento</h3>

                    <!-- TAREFA 3 -->
                    <div class="tarefa em-andamento">
                        <input type="checkbox" id="tarefa-3" class="checkbox-expandir">
                        <label for="tarefa-3" class="cabecalho-tarefa">
                            <span class="titulo-tarefa">Manutenção na máquina 15.</span>
                            <div class="acoes-tarefa">
                                <a href="#menu-adicionar" class="btn-acao btn-editar">
                                    <label for="adicionar" class="icone-alterar">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/icone%20alterar.png" alt="Editar">
                                    </label>
                                </a>
                                <input type="checkbox" class="menu-lixeira" id="modal-4">
                                <label for="modal-4" class="icone-lixeira">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira">
                                </label>
                                <div class="modal-overlay">
                                    <div class="menu-lixo">
                                        <div class="menu-lixo-icone">
                                            <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
                                        </div>
                                        <h1>Deseja excluir o relatório?</h1>
                                        <p>Esta ação não pode ser desfeita. Todos os dados serão permanentemente
                                            removidos.</p>
                                        <div class="info-item">
                                            <strong>Início em:</strong>
                                            <span>01/9/2025</span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Descrição:</strong>
                                            <span>Aguardando peça.</span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Responsável:</strong>
                                            <span>Carlos Mendes</span>
                                        </div>
                                        <div class="buttons">
                                            <label for="modal-4" class="btn-cancelar">Não</label>
                                            <label for="modal-4" class="btn-excluir">Sim</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <span class="seta-expandir">▼</span>
                        </label>
                        <div class="detalhes-tarefa">
                            <p><strong>Responsável:</strong> Carlos Mendes</p>
                            <p><strong>Início:</strong> 01/9/2025</p>
                            <p><strong>Descrição:</strong> Aguardando peça</p>
                        </div>
                    </div>

                    <!-- TAREFA 4 -->
                    <div class="tarefa em-andamento">
                        <input type="checkbox" id="tarefa-4" class="checkbox-expandir">
                        <label for="tarefa-4" class="cabecalho-tarefa">
                            <span class="titulo-tarefa">Adicionar dados do app.</span>
                            <div class="acoes-tarefa">
                                <a href="#menu-adicionar" class="btn-acao btn-editar">
                                    <label for="adicionar" class="icone-alterar">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/icone%20alterar.png" alt="Editar">
                                    </label>
                                </a>
                                <input type="checkbox" class="menu-lixeira" id="modal-5">
                                <label for="modal-5" class="icone-lixeira">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira">
                                </label>
                                <div class="modal-overlay">
                                    <div class="menu-lixo">
                                        <div class="menu-lixo-icone">
                                            <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
                                        </div>
                                        <h1>Deseja excluir o relatório?</h1>
                                        <p>Esta ação não pode ser desfeita. Todos os dados serão permanentemente
                                            removidos.</p>
                                        <div class="info-item">
                                            <strong>Prioridade:</strong>
                                            <span>Média</span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Descrição:</strong>
                                            <span>Inserir informações atualizadas no sistema do aplicativo.</span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Responsável:</strong>
                                            <span>Ana Paula</span>
                                        </div>
                                        <div class="buttons">
                                            <label for="modal-5" class="btn-cancelar">Não</label>
                                            <label for="modal-5" class="btn-excluir">Sim</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <span class="seta-expandir">▼</span>
                        </label>
                        <div class="detalhes-tarefa">
                            <p><strong>Responsável:</strong> Ana Paula</p>
                            <p><strong>Prioridade:</strong> Média</p>
                            <p><strong>Descrição:</strong> Inserir informações atualizadas no sistema do aplicativo.
                            </p>
                            <p><strong>Prazo:</strong>19/9/2025</p>
                        </div>
                    </div>
                </div>

                <!-- COLUNA: CONCLUÍDA -->
                <div class="coluna-status">
                    <h3 class="titulo-status">Matéria Concluída</h3>

                    <!-- TAREFA 5 -->
                    <div class="tarefa concluida">
                        <input type="checkbox" id="tarefa-5" class="checkbox-expandir">
                        <label for="tarefa-5" class="cabecalho-tarefa">
                            <span class="titulo-tarefa">Revisão de estoque.</span>
                            <div class="acoes-tarefa">
                                <a href="#header" class="btn-acao btn-editar">
                                    <label for="adicionar" class="icone-alterar">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/icone%20alterar.png" alt="Editar">
                                    </label>
                                </a>
                                <input type="checkbox" class="menu-lixeira" id="modal-6">
                                <label for="modal-6" class="icone-lixeira">
                                    <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira">
                                </label>
                                <div class="modal-overlay">
                                    <div class="menu-lixo">
                                        <div class="menu-lixo-icone">
                                            <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
                                        </div>
                                        <h1>Deseja excluir o relatório?</h1>
                                        <p>Esta ação não pode ser desfeita. Todos os dados serão permanentemente
                                            removidos.</p>
                                        <div class="info-item">
                                            <strong>Concluído em:</strong>
                                            <span>08/10/2025</span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Descrição:</strong>
                                            <span>Revisão completa do estoque de materiais e atualização do
                                                sistema.</span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Responsável:</strong>
                                            <span>Pedro Santos</span>
                                        </div>
                                        <div class="buttons">
                                            <label for="modal-6" class="btn-cancelar">Não</label>
                                            <label for="modal-6" class="btn-excluir">Sim</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <span class="seta-expandir">▼</span>
                        </label>
                        <div class="detalhes-tarefa">
                            <p><strong>Responsável:</strong> Pedro Santos</p>
                            <p><strong>Concluído em:</strong> 08/10/2025</p>
                            <p><strong>Descrição:</strong> Revisão completa do estoque de materiais e atualização do
                                sistema.</p>
                        </div>
                    </div>
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