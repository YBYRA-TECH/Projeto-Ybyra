<%--
  Created by IntelliJ IDEA.
  User: murilofonseca-ieg
  Date: 11/10/2025
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="./imgs/Nova logo Sem tech.png" type="image/x-icon" />
    <link rel="stylesheet" href="tarefas.css" />
    <title>YBYRA TECH</title>
</head>
<body>
<div class="container-principal">

    <aside class="barra-lateral">
        <div class="logo-site">
            <img src="./imgs/Nova logo.png" alt="" />
        </div>

        <nav class="menu-principal">
            <ul>
                <li class="item-menu">
                    <a href="inicio.html">
                        <div class="box-icone">
                            <img src="./imgs/Nova logo Sem tech.png" alt="Ícone Início" />
                        </div>
                        <span>Início</span>
                    </a>
                </li>
                <li class="item-menu">
                    <a href="relatorios.html">
                        <div class="box-icone">
                            <img src="./imgs/icone-relatorios.png" alt="Ícone relatórios" />
                        </div>
                        <span>Relatórios</span>
                    </a>
                </li>

                <li class="item-menu ativo">
                    <a href="tarefas.html">
                        <div class="box-icone">
                            <img src="./imgs/icone-tarefas.png" alt="Ícone Tarefas" />
                        </div>
                        <span>Tarefas</span>
                    </a>
                </li>

                <li class="item-menu">
                    <a href="insercaoDados.html">
                        <div class="box-icone">
                            <img src="./imgs/icone-inserir.png" alt="Ícone Inserir Dados" />
                        </div>
                        <span>Inserir Dados</span>
                    </a>
                </li>

                <li class="item-menu">
                    <a href="#">
                        <div class="box-icone">
                            <img src="./imgs/icone-chatbot.png" alt="Ícone IA" />
                        </div>
                        <span>ChatBot</span>
                    </a>
                </li>

                <li class="item-menu" style="margin-top: 6.5rem;">
                    <a href="#">
                        <div class="box-icone">
                            <img src="./imgs/icone-ajuda.png" alt="Ícone Ajuda" />
                        </div>
                        <span>Ajuda</span>
                    </a>
                </li>

                <li class="item-menu">
                    <a href="#">
                        <div class="box-icone">
                            <img src="./imgs/icone-config.png" alt="Ícone Configurações" />
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
                <div class="campo-busca">
                    <input type="text" placeholder="Buscar Tarefas" />
                    <button class="btn-lupa">
                        <img src="./imgs/icone-lupa.png" alt="Buscar" />
                    </button>
                </div>
                <select class="filtro-select" name="prioridade" >
                    <option value="" disabled selected hidden>Prioridade</option>
                    <option value="">Não Iniciada</option>
                    <option value="">Em Andamento</option>
                    <option value="">Concluída</option>

                </select>
                <button class="btn-adicionar">
                    <img src=" " alt="icone" />
                    <span>Adicionar</span>
                </button>
                <button class="btn-buscar">Buscar</button>
            </div>

            <div class="area-icones-usuario">
                <img src="./imgs/icone-sino.png" alt="Notificações">
                <img src="./imgs/icone-usuario.png" alt="Perfil">
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
                            <span class="indicador-status"></span>
                            <span class="titulo-tarefa">Manutenção na máquina do setor C.</span>
                            <div class="acoes-tarefa">
                                <button class="btn-acao btn-editar">
                                    <img src="./imgs/icone-editar.png" alt="Editar">
                                </button>
                                <button class="btn-acao btn-excluir">
                                    <img src="./imgs/icone-excluir.png" alt="Excluir">
                                </button>
                            </div>
                            <span class="seta-expandir">▼</span>
                        </label>
                        <div class="detalhes-tarefa">
                            <p><strong>Responsável:</strong> Jorge Silva</p>
                            <p><strong>Prazo:</strong> 15/Out/2025</p>
                            <p><strong>Descrição:</strong> Verificar ruído no motor principal e trocar o filtro de óleo.</p>
                        </div>
                    </div>

                    <!-- TAREFA 2 -->
                    <div class="tarefa nao-iniciada">
                        <input type="checkbox" id="tarefa-2" class="checkbox-expandir">
                        <label for="tarefa-2" class="cabecalho-tarefa">
                            <span class="indicador-status"></span>
                            <span class="titulo-tarefa">Manter a limpeza do setor.</span>
                            <div class="acoes-tarefa">
                                <button class="btn-acao btn-editar">
                                    <img src="./imgs/icone-editar.png" alt="Editar">
                                </button>
                                <button class="btn-acao btn-excluir">
                                    <img src="./imgs/icone-excluir.png" alt="Excluir">
                                </button>
                            </div>
                            <span class="seta-expandir">▼</span>
                        </label>
                        <div class="detalhes-tarefa">
                            <p><strong>Responsável:</strong> Equipe de Limpeza</p>
                            <p><strong>Prioridade:</strong> Alta</p>
                            <p><strong>Descrição:</strong> Realizar limpeza completa do setor incluindo equipamentos e área de produção.</p>
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
                            <span class="indicador-status"></span>
                            <span class="titulo-tarefa">Manutenção na máquina 15.</span>
                            <div class="acoes-tarefa">
                                <button class="btn-acao btn-editar">
                                    <img src="./imgs/icone-editar.png" alt="Editar">
                                </button>
                                <button class="btn-acao btn-excluir">
                                    <img src="./imgs/icone-excluir.png" alt="Excluir">
                                </button>
                            </div>
                            <span class="seta-expandir">▼</span>
                        </label>
                        <div class="detalhes-tarefa">
                            <p><strong>Responsável:</strong> Carlos Mendes</p>
                            <p><strong>Status:</strong> Aguardando peça</p>
                            <p><strong>Início:</strong> 01/Nov/2025</p>
                        </div>
                    </div>

                    <!-- TAREFA 4 -->
                    <div class="tarefa em-andamento">
                        <input type="checkbox" id="tarefa-4" class="checkbox-expandir">
                        <label for="tarefa-4" class="cabecalho-tarefa">
                            <span class="indicador-status"></span>
                            <span class="titulo-tarefa">Adicionar dados do app.</span>
                            <div class="acoes-tarefa">
                                <button class="btn-acao btn-editar">
                                    <img src="./imgs/icone-editar.png" alt="Editar">
                                </button>
                                <button class="btn-acao btn-excluir">
                                    <img src="./imgs/icone-excluir.png" alt="Excluir">
                                </button>
                            </div>
                            <span class="seta-expandir">▼</span>
                        </label>
                        <div class="detalhes-tarefa">
                            <p><strong>Responsável:</strong> Ana Paula</p>
                            <p><strong>Prioridade:</strong> Média</p>
                            <p><strong>Descrição:</strong> Inserir informações atualizadas no sistema do aplicativo.</p>
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
                            <span class="indicador-status"></span>
                            <span class="titulo-tarefa">Revisão de estoque.</span>
                            <div class="acoes-tarefa">
                                <button class="btn-acao btn-editar">
                                    <img src="./imgs/icone-editar.png" alt="Editar">
                                </button>
                                <button class="btn-acao btn-excluir">
                                    <img src="./imgs/icone-excluir.png" alt="Excluir">
                                </button>
                            </div>
                            <span class="seta-expandir">▼</span>
                        </label>
                        <div class="detalhes-tarefa">
                            <p><strong>Responsável:</strong> Pedro Santos</p>
                            <p><strong>Concluído em:</strong> 08/Out/2025</p>
                            <p><strong>Descrição:</strong> Revisão completa do estoque de materiais e atualização do sistema.</p>
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
                            <img src="./imgs/avatar-marcia.png" alt="icone de usuário">
                        </div>
                        <span class="nome-usuario">Davi Lacerda</span>
                        <span class="status-online"></span>
                    </div>
                    <div class="usuario">
                        <div class="avatar-usuario">
                            <img src="./imgs/avatar-eduardo.png" alt="icone de usuário">
                        </div>
                        <span class="nome-usuario">Murilo Rosa</span>
                        <span class="status-online"></span>
                    </div>
                    <div class="usuario">
                        <div class="avatar-usuario">
                            <img src="./imgs/avatar-eduardo.png" alt="icone de usuário">
                        </div>
                        <span class="nome-usuario">Felipe Augusto</span>
                        <span class="status-online"></span>
                    </div>
                    <div class="usuario">
                        <div class="avatar-usuario">
                            <img src="./imgs/avatar-eduardo.png" alt="icone de usuário">
                        </div>
                        <span class="nome-usuario">David Reche</span>
                        <span class="status-online"></span>
                    </div>
                    <div class="usuario">
                        <div class="avatar-usuario">
                            <img src="./imgs/avatar-eduardo.png" alt="icone de usuário">
                        </div>
                        <span class="nome-usuario">Matheus fazan</span>
                        <span class="status-online"></span>
                    </div>
                    <div class="usuario">
                        <div class="avatar-usuario">
                            <img src="./imgs/avatar-eduardo.png" alt="icone de usuário">
                        </div>
                        <span class="nome-usuario">Emilly Dantas</span>
                        <span class="status-online"></span>
                    </div>
                    <div class="usuario">
                        <div class="avatar-usuario">
                            <img src="./imgs/avatar-eduardo.png" alt="icone de usuário">
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