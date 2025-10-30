<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/relatorios.css" />
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
                <li class="item-menu ativo">
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
                            <img src="<%= request.getContextPath() %>/assets/imgs/camera_insercao.png" alt="Ícone Inserir Dados">
                        </div>
                        <span>Inserir Dados</span>
                    </a>
                </li>
                <li class="item-menu">
                    <a href="<%= request.getContextPath() %>/pagina?nome=funcionarios">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/assets/imgs/icone_funcionario.png" alt="Ícone Funcionários" />
                        </div>
                        <span>Funcionários</span>
                    </a>
                </li>
                <li class="item-menu">
                    <a href="<%= request.getContextPath() %>/pagina?nome=perfil">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/assets/imgs/icone_usuario.png" alt="Ícone Perfil" />
                        </div>
                        <span>Perfil</span>
                    </a>
                </li>
            </ul>
        </nav>
    </aside>

    <main class="area-conteudo">

        <section class="painel">
            <header>
                <div class="busca-filtros">

                    <select name="categorias" id="categorias" title="Categorias">
                        <option value="" disabled selected hidden>Todas as Categorias</option>
                        <option value="">Área Fria</option>
                        <option value="">Área Quente</option>
                    </select>
                    <select name="periodo" id="periodo" title="Período">
                        <option value="" disabled selected hidden>Período</option>
                        <option value="">Manhã</option>
                        <option value="">Tarde</option>
                        <option value="">Noite</option>
                    </select>
                    <select name="prioridade" id="prioridade" title="Prioridade">
                        <option value="" disabled selected hidden>Eficiência</option>
                        <option value="">Baixa</option>
                        <option value="">Média</option>
                        <option value="">Alta</option>
                    </select>
                    <div class="busca-relatorios">
                        <input type="text" placeholder="Buscar Relatórios" title="Busca"/>
                        <button class="icone-busca">
                            <img src="<%= request.getContextPath() %>/assets/imgs/Research.png" alt="Lupa" title="lupa">
                        </button>
                    </div>
                    <input type="checkbox" class="menu-lixeira" id="modal-apagar-todos">
                    <label for="modal-apagar-todos" id="apagarTodos">Apagar todos</label>

                    <!-- MODAL APAGAR TODOS -->
                    <div class="modal-overlay">
                        <div class="menu-lixo">
                            <div class="menu-lixo-icone">
                                <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira" />
                            </div>
                            <h1>Deseja excluir TODOS os relatórios?</h1>
                            <p>Esta ação não pode ser desfeita. Todos os dados serão permanentemente removidos.</p>
                            <div class="info-item">
                                <strong>Total de relatórios:</strong>
                                <span>4 relatórios</span>
                            </div>
                            <div class="buttons">
                                <label for="modal-apagar-todos" class="btn-cancelar">Não</label>
                                <button type="button" class="btn-excluir">Sim, apagar tudo</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="area-icones">
                    <input type="checkbox" id="menu-notificacoes">
                    <label for="menu-notificacoes" title="Notificações">
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


            <div class="container-tabela">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Índice</th>
                        <th>Turno</th>
                        <th>Área</th>
                        <th>Responsável</th>
                        <th>Desempenho</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="row-link">
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">23456789DGH</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Cond_Cortes</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Manhã</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Área Fria</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Juliana Antunes</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">
                            <div class="barra-desempenho barra-verde-med">85%</div>
                        </a></td>
                        <td>
                            <input type="checkbox" class="menu-lixeira" id="modal-1">
                            <label for="modal-1" class="icone-lixeira" title="Lixeira">
                                <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira">
                            </label>
                            <div class="modal-overlay">
                                <div class="menu-lixo">
                                    <div class="menu-lixo-icone" title="Lixeira">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
                                    </div>
                                    <h1>Deseja excluir o lote?</h1>
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
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">09875438ORT</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Ctrl_Embalagens</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Tarde</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Área Quente</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Tiago Araújo</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">
                            <div class="barra-desempenho barra-vermelha">37%</div>
                        </a></td>
                        <td>
                            <input type="checkbox" class="menu-lixeira" id="modal-2">
                            <label for="modal-2" class="icone-lixeira" title="Lixeira">
                                <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira">
                            </label>
                            <div class="modal-overlay">
                                <div class="menu-lixo">
                                    <div class="menu-lixo-icone" title="Lixeira">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
                                    </div>
                                    <h1>Deseja excluir o lote?</h1>
                                    <p>Esta ação não pode ser desfeita. Todos os dados serão permanentemente removidos.</p>
                                    <div class="info-item">
                                        <strong>ID:</strong>
                                        <span>09875438ORT</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Índice:</strong>
                                        <span>Ctrl_Embalagens</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Responsável:</strong>
                                        <span>Tiago Araújo</span>
                                    </div>
                                    <div class="buttons">
                                        <label for="modal-2" class="btn-cancelar">Não</label>
                                        <label for="modal-2" class="btn-excluir">Sim</label>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr class="row-link">
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">84972749ENI</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Gord_Picanha</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Noite</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Área Fria</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Roberto Ferreira</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">
                            <div class="barra-desempenho barra-amarela">50%</div>
                        </a></td>
                        <td>
                            <input type="checkbox" class="menu-lixeira" id="modal-3">
                            <label for="modal-3" class="icone-lixeira" title="Lixeira">
                                <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira">
                            </label>
                            <div class="modal-overlay">
                                <div class="menu-lixo">
                                    <div class="menu-lixo-icone" title="Lixeira">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
                                    </div>
                                    <h1>Deseja excluir o lote?</h1>
                                    <p>Esta ação não pode ser desfeita. Todos os dados serão permanentemente removidos.</p>
                                    <div class="info-item">
                                        <strong>ID:</strong>
                                        <span>84972749ENI</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Índice:</strong>
                                        <span>Gord_Picanha</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Responsável:</strong>
                                        <span>Roberto Ferreira</span>
                                    </div>
                                    <div class="buttons">
                                        <label for="modal-3" class="btn-cancelar">Não</label>
                                        <label for="modal-3" class="btn-excluir">Sim</label>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr class="row-link">
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">2804375COW</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Escald</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Manhã</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Área Quente</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">Liliana Mendes</a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI" class="table-link">
                            <div class="barra-desempenho barra-verde">97%</div>
                        </a></td>
                        <td>
                            <input type="checkbox" class="menu-lixeira" id="modal-4">
                            <label for="modal-4" class="icone-lixeira" title="Lixeira">
                                <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira">
                            </label>
                            <div class="modal-overlay">
                                <div class="menu-lixo">
                                    <div class="menu-lixo-icone" title="Lixeira">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
                                    </div>
                                    <h1>Deseja excluir o lote?</h1>
                                    <p>Esta ação não pode ser desfeita. Todos os dados serão permanentemente removidos.</p>
                                    <div class="info-item">
                                        <strong>ID:</strong>
                                        <span>2804375COW</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Índice:</strong>
                                        <span>Escald</span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Responsável:</strong>
                                        <span>Liliana Mendes</span>
                                    </div>
                                    <div class="buttons">
                                        <label for="modal-4" class="btn-cancelar">Não</label>
                                        <label for="modal-4" class="btn-excluir">Sim</label>
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