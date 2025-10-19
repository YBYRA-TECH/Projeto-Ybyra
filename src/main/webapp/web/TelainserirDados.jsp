<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/imgs/Nova logo Sem tech.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/TelaInserirDados.css" />
    <title>YBYRA TECH</title>
</head>
<body>
<div class="painel-principal">
    <aside class="barra-lateral">
        <div class="logo-site">
            <img src="<%= request.getContextPath() %>/imgs/Nova logo.png" alt="Logo YBYRA TECH" />
        </div>

        <nav class="menu-principal">
            <ul>
                <li class="item-menu">
                    <a href="<%= request.getContextPath() %>/web/inicio.jsp">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/imgs/House.png" alt="Ícone Início" />
                        </div>
                        <span>Início</span>
                    </a>
                </li>
                <li class="item-menu">
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

                <li class="item-menu ativo">
                    <a href="<%= request.getContextPath() %>/web/TelaInserirDados.jsp">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/imgs/camera_insercao.png" alt="Ícone Inserir Dados" />
                        </div>
                        <span>Inserir Dados</span>
                    </a>
                </li>

                <li class="item-menu">
                    <a href="#">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/imgs/chatbot.png" alt="Ícone ChatBot" />
                        </div>
                        <span>ChatBot</span>
                    </a>
                </li>

                <li class="item-menu" style="margin-top: 6.5rem;">
                    <a href="#">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/imgs/Help.png" alt="Ícone Ajuda" />
                        </div>
                        <span>Ajuda</span>
                    </a>
                </li>

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
    </aside>

    <main class="area-conteudo">
        <section class="painel">
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
                                   name="nome"
                                   placeholder="Digite o título do relatório"
                                   required />>
                        </div>

                        <div class="campo">
                            <label for="categoria">Categoria</label>
                            <input type="text" id="categoria" name="area" placeholder="Digite a categoria" required>
                        </div>
                    </div>

                    <div class="area-descricao">
                        <h3 class="subtitulo-secao">Descrição</h3>
                        <textarea name="descricao" class="texto-descricao" placeholder="Coloque aqui a descrição do arquivo" required></textarea>
                    </div>
                </div>

                <input type="hidden" name="pdf" value="<%= session.getAttribute("arquivoNome") != null ? session.getAttribute("arquivoNome") : "" %>">

                <button type="submit" class="btn-enviar">Enviar Arquivo</button>
            </form>
        </section>
    </main>
</div>
</body>
</html>