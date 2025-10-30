<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/insercaoDados.css" />
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
        <div class="conteudo-principal-header">
            <header class="header-principal">
                <h1>Inserção de relatorios</h1>
                <div class="area-icones">
                    <input type="checkbox" id="menu-notificacoes">
                    <label for="menu-notificacoes">
                        <img src="<%= request.getContextPath() %>/assets/imgs/notificacoes.png" alt="Notificações" title="Notificações">
                    </label>
                    <div id="notificacoes">
                        <h1>Notificações</h1>
                        <div>Murilo adicionou uma tarefa</div>
                        <div>Guilherme concluiu uma tarefa</div>
                        <div>Emilly concluiu uma tarefa</div>
                    </div>
                </div>
            </header>
        </div>

        <section class="painel">
            <div class="area-upload-arquivo">
                <!-- MANTER O FORM DO SERVLET -->
                <form action="<%=request.getContextPath() %>/InserirDados" method="post" enctype="multipart/form-data">
                    <input type="file" id="upload" name="arquivo" accept=".pdf,.jpg,.jpeg,.png" placeholder="Escolher arquivo" required/>
                    <button type="submit" class="btn-escolher-arquivo" title="Confirmar Arquivo">Confirmar</button>
                </form>
            </div>
            <h1>Recentes</h1>
            <div class="area-upload-recentes">
                <img src="<%= request.getContextPath() %>/assets/imgs/imagem_modelo_arquivo.jpg" alt="imagem papel" title="imagem">
                <p>Digitalizar novos documentos</p>
            </div>

            <!-- Parte a partir de quando o usuário inserir o relatório -->
            <!-- COMENTADO PARA NÃO PERDER A LÓGICA FUTURA
            <div class="relatorios-recentes">
                <div class="relatorio-item">
                    <h3>Controle_de_produção</h3>
                    <span>Felipe Augusto</span>
                </div>

                <label for="modal-relatorio-1" class="icone-lixeira">
                    <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Excluir" title="Excluir relatório" />
                </label>
            </div>

            <input type="checkbox" class="menu-lixeira" id="modal-relatorio-1" />
            <div class="modal-overlay">
                <div class="menu-lixo">
                    <div class="menu-lixo-icone">
                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira" />
                    </div>
                    <h1>Deseja excluir o relatório?</h1>
                    <p>
                        Esta ação não pode ser desfeita. Todos os dados serão
                        permanentemente removidos.
                    </p>
                    <div class="info-item">
                        <strong>Nome do arquivo:</strong>
                        <span>Controle_de_produção</span>
                    </div>
                    <div class="info-item">
                        <strong>Responsável:</strong>
                        <span>Felipe Augusto</span>
                    </div>
                    <div class="buttons">
                        <label for="modal-relatorio-1" class="btn-cancelar">Não</label>
                        <button type="button" class="btn-excluir">Sim</button>
                    </div>
                </div>
            </div>
            -->
        </section>
    </main>
</div>
</body>
</html>