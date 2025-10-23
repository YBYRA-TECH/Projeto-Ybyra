<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/relatorios.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css" />

    <title>YBYRA TECH</title>
</head>
<body>
<div class="painel-principal">
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
                <li class="item-menu ativo">
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
        <div class="overlay"></div>
    </aside>

    <main class="area-conteudo">

        <section class="painel">
            <div class="painel-ferramentas">
                <div class="busca-relatorios">
                    <input type="text" placeholder="Buscar Relatórios" />
                    <button class="icone-busca"><img src="<%= request.getContextPath() %>/asssets/imgs/Research.png" alt="Ícone Lupa"></button>
                </div>

                <div class="botoes-acao">
                    <button class="btn-acao btn-exportar">
                        <img src="<%= request.getContextPath() %>/assets/imgs/download.png" alt="Ícone Exportar" />
                        <span>Exportar</span>
                    </button>
                    <a href="<%= request.getContextPath() %>/pagina?nome=insercaoDados">
                        <button class="btn-acao btn-adicionar">
                            <img src="<%= request.getContextPath() %>/assets/imgs/icone%20mais.png" alt="">
                            <span>Adicionar</span>
                        </button>
                    </a>
                </div>

                <div class="filtros">
                    <div class="filtro-data">
                        <input type="date" placeholder="Filtrar por Data">
                    </div>
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
                    <tbody>
                    <tr class="row-link">
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">23456789DGH</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Cond_Cortes</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Juliana Antunes</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">
                            <div class="barra-desempenho barra-verde-med">85%</div>
                        </a></td>
                        <td>
                            <input type="checkbox" class="menu-lixeira" id="modal-1">
                            <label for="modal-1" class="icone-lixeira">
                                <img src="<%= request.getContextPath() %>/asseta/imgs/Trash.png" alt="lixeira">
                            </label>
                            <div class="modal-overlay">
                                <div class="menu-lixo">
                                    <div class="menu-lixo-icone">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
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
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">23456789DGH</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Cond_Cortes</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Juliana Antunes</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">
                            <div class="barra-desempenho barra-verde-med">85%</div>
                        </a></td>
                        <td>
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