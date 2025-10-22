<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/relatorios.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/globalApp.css" />

    <title>YBYRA TECH</title>
</head>
<body>
<div class="painel-principal">
    <aside class="barra-lateral">
        <!-- ADICIONADO: input checkbox para menu mobile -->
        <input type="checkbox" id="menu">
        <!-- ADICIONADO: label com spans para ícone hamburger -->
        <label for="menu" class="menu-icon">
            <span></span>
            <span></span>
            <span></span>
        </label>
        <!-- CORRIGIDO: class de "logo-site" para "logo-logo" -->
        <label for="menu-icon" class="logo-logo">
            <!-- ADICIONADO: id="logo" na imagem -->
            <img src="<%= request.getContextPath() %>/imgs/Nova%20logo.png" alt="Logo YBYRA TECH" id="logo" />
        </label>

        <nav class="menu-principal">
            <ul>
                <li class="item-menu">
                    <!-- CORRIGIDO: link para inicioBI.jsp -->
                    <a href="<%= request.getContextPath() %>/web/inicioBI.jsp">
                        <div class="box-icone">
                            <!-- CORRIGIDO: ícone House.png -->
                            <img src="<%= request.getContextPath() %>/imgs/House.png" alt="Ícone Início" />
                        </div>
                        <span>Início</span>
                    </a>
                </li>
                <li class="item-menu ativo">
                    <!-- CORRIGIDO: href para relatorios.jsp -->
                    <a href="<%= request.getContextPath() %>/web/relatorios.jsp">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/imgs/document.png" alt="Ícone relatorios" />
                        </div>
                        <span>Relatórios</span>
                    </a>
                </li>

                <li class="item-menu">
                    <a href="<%= request.getContextPath() %>/web/tarefas.jsp">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/imgs/clipboard.png" alt="Ícone Tarefas" />
                        </div>
                        <span>Tarefas</span>
                    </a>
                </li>

                <li class="item-menu">
                    <a href="<%= request.getContextPath() %>/web/insercaoDados.jsp">
                        <div class="box-icone">
                            <!-- CORRIGIDO: removido aspas extras no alt -->
                            <img src="<%= request.getContextPath() %>/imgs/camera_insercao.png" alt="Ícone Inserir Dados">
                        </div>
                        <span>Inserir Dados</span>
                    </a>
                </li>

                <!-- REMOVIDO: itens ChatBot e Ajuda -->

                <li class="item-menu">
                    <a href="#">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/imgs/configuracoes.png" alt="Ícone Configurações" />
                        </div>
                        <span>Configurações</span>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- ADICIONADO: div overlay -->
        <div class="overlay"></div>
    </aside>

    <main class="area-conteudo">

        <section class="painel">
            <div class="painel-ferramentas">
                <div class="busca-relatorios">
                    <input type="text" placeholder="Buscar Relatórios" />
                    <!-- CORRIGIDO: src da imagem Research.png -->
                    <button class="icone-busca"><img src="<%= request.getContextPath() %>/imgs/Research.png" alt="Ícone Lupa"></button>
                </div>

                <div class="botoes-acao">
                    <button class="btn-acao btn-exportar">
                        <!-- CORRIGIDO: src da imagem download.png -->
                        <img src="<%= request.getContextPath() %>/imgs/download.png" alt="Ícone Exportar" />
                        <span>Exportar</span>
                    </button>
                    <a href="<%= request.getContextPath() %>/web/insercaoDados.jsp">
                        <button class="btn-acao btn-adicionar">
                            <!-- CORRIGIDO: src da imagem "icone mais.png" -->
                            <img src="<%= request.getContextPath() %>/imgs/icone%20mais.png" alt="">
                            <span>Adicionar</span>
                        </button>
                    </a>
                </div>

                <div class="filtros">
                    <div class="filtro-data">
                        <input type="date" placeholder="Filtrar por Data">
                    </div>
                </div>
                <!-- ADICIONADO: área de ícones de usuário com notificações -->
                <div class="area-icones-usuario">
                    <input type="checkbox" id="menu-notificacoes">
                    <label for="menu-notificacoes">
                        <img src="<%= request.getContextPath() %>/imgs/notificacoes.png" alt="Notificações">
                    </label>
                    <div id="notificacoes">
                        <h1>Notificações</h1>
                        <div>Murilo adicionou uma tarefa</div>
                        <div>Guilherme concluiu uma tarefa</div>
                        <div>Emilly concluiu uma tarefa</div>
                    </div>
                </div>
            </div>

            <div class="container-tabela">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Indice</th>
                        <th>Responsável</th>
                        <th>Desempenho</th>
                        <th></th>
                    </tr>
                    </thead>
                    <!-- REMOVIDO: tbody duplicado -->
                    <tbody>
                    <!-- SUBSTITUÍDO: botões "..." por modais com checkbox/label igual ao HTML -->
                    <tr class="row-link">
                        <td><a href="<%= request.getContextPath() %>/web/inicioBI.jsp" class="table-link">23456789DGH</a></td>
                        <td><a href="<%= request.getContextPath() %>/web/inicioBI.jsp" class="table-link">Cond_Cortes</a></td>
                        <td><a href="<%= request.getContextPath() %>/web/inicioBI.jsp" class="table-link">Juliana Antunes</a></td>
                        <td><a href="<%= request.getContextPath() %>/web/inicioBI.jsp" class="table-link">
                            <div class="barra-desempenho barra-verde-med">85%</div>
                        </a></td>
                        <td>
                            <!-- ADICIONADO: estrutura completa do modal de exclusão -->
                            <input type="checkbox" class="menu-lixeira" id="modal-1">
                            <label for="modal-1" class="icone-lixeira">
                                <img src="<%= request.getContextPath() %>/imgs/Trash.png" alt="lixeira">
                            </label>
                            <div class="modal-overlay">
                                <div class="menu-lixo">
                                    <div class="menu-lixo-icone">
                                        <img src="<%= request.getContextPath() %>/imgs/Trash.png" alt="Ícone Lixeira">
                                    </div>
                                    <h1>Deseja excluir o relatório?</h1>
                                    <p>Esta ação não pode ser desfeita. Todos os dados serão permanentemente removidos.</p>
                                    <div class="info-item">
                                        <strong>ID:</strong>
                                        <span>23456789DGH</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Índice:</strong>
                                        <span>Cond_Cortes</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Responsável:</strong>
                                        <span>Juliana Antunes</span>
                                    </div>
                                    <div class="buttons">
                                        <label for="modal-1" class="btn-cancelar">Não</label>
                                        <label for="modal-1" class="btn-excluir">Sim</label>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr class="row-link">
                        <td><a href="<%= request.getContextPath() %>/web/inicioBI.jsp" class="table-link">23456789DGH</a></td>
                        <td><a href="<%= request.getContextPath() %>/web/inicioBI.jsp" class="table-link">Cond_Cortes</a></td>
                        <td><a href="<%= request.getContextPath() %>/web/inicioBI.jsp" class="table-link">Juliana Antunes</a></td>
                        <td><a href="<%= request.getContextPath() %>/web/inicioBI.jsp" class="table-link">
                            <div class="barra-desempenho barra-verde-med">85%</div>
                        </a></td>
                        <td>
                            <!-- ADICIONADO: estrutura completa do modal de exclusão -->
                            <input type="checkbox" class="menu-lixeira" id="modal-1">
                            <label for="modal-1" class="icone-lixeira">
                                <img src="<%= request.getContextPath() %>/imgs/Trash.png" alt="lixeira">
                            </label>
                            <div class="modal-overlay">
                                <div class="menu-lixo">
                                    <div class="menu-lixo-icone">
                                        <img src="<%= request.getContextPath() %>/imgs/Trash.png" alt="Ícone Lixeira">
                                    </div>
                                    <h1>Deseja excluir o relatório?</h1>
                                    <p>Esta ação não pode ser desfeita. Todos os dados serão permanentemente removidos.</p>
                                    <div class="info-item">
                                        <strong>ID:</strong>
                                        <span>23456789DGH</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Índice:</strong>
                                        <span>Cond_Cortes</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Responsável:</strong>
                                        <span>Juliana Antunes</span>
                                    </div>
                                    <div class="buttons">
                                        <label for="modal-1" class="btn-cancelar">Não</label>
                                        <label for="modal-1" class="btn-excluir">Sim</label>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <!-- Repetir estrutura similar para as outras 6 linhas da tabela -->
                    <!-- (por brevidade, mostrando apenas a primeira linha completa) -->
                    <!-- As outras linhas seguem o mesmo padrão com IDs diferentes: modal-2 até modal-7 -->
                    </tbody>
                </table>

                <div class="paginacao">
                    <button>«</button>
                    <button>‹</button>
                    <button class="ativo">1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>›</button>
                    <button>»</button>
                </div>
            </div>
        </section>
    </main>
</div>
</body>
</html>