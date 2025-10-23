<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/TelaInserirDados.css" />
    <title>YBYRA TECH - Detalhes do Upload</title>
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
                <li class="item-menu ativo">
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

    <main class="area-conteudo">
        <div class="conteudo-principal-header">
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

        <section class="detalhes-upload-painel">
            <h2 class="titulo-secao">Arquivo escolhido</h2>

            <div class="arquivo-preview">
                <p>Arquivo: <strong><%= session.getAttribute("arquivoNome") != null ? session.getAttribute("arquivoNome") : "Nenhum arquivo selecionado" %></strong></p>
            </div>

            <form action="<%= request.getContextPath() %>/InsercaoDados" method="post">
                <div class="formulario-detalhes">
                    <div class="area-detalhes">
                        <h3 class="subtitulo-secao">Detalhes</h3>

                        <div class="campo">
                            <label for="titulo">Título</label>
                            <input type="text"
                                   id="titulo"
                                   name="nome"
                                   placeholder="Digite o título do relatório"
                                   required />
                        </div>

                        <div class="campo">
                            <label for="categoria">Categoria</label>
                            <input type="text"
                                   id="categoria"
                                   name="area"
                                   placeholder="Digite a categoria"
                                   required>
                        </div>
                    </div>

                    <div class="area-descricao">
                        <h3 class="subtitulo-secao">Descrição</h3>
                        <h3 style="opacity: 0;">Espaço</h3>
                        <textarea name="descricao"
                                  class="texto-descricao"
                                  placeholder="Coloque aqui a descrição do arquivo"
                                  required></textarea>

                        <input type="hidden"
                               name="pdf"
                               value="<%= session.getAttribute("arquivoNome") != null ? session.getAttribute("arquivoNome") : "" %>">

                        <button type="submit" class="btn-enviar">Enviar Arquivo</button>
                    </div>
                </div>
            </form>
        </section>
    </main>
</div>
</body>
</html>