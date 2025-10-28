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
            <header class="header-principal">
                <div class="busca-filtros">
                    <div class="busca-relatorios">
                        <input type="text" placeholder="Buscar Relatórios" />
                        <button class="icone-busca">
                            <img src="<%= request.getContextPath() %>/assets/imgs/Research.png" alt="Lupa">
                        </button>
                    </div>
                    <select name="categorias" id="categorias">
                        <option value="" disabled selected hidden>Todas as Categorias</option>
                        <option value="">Área Fria</option>
                        <option value="">Área Quente</option>
                    </select>
                    <select name="periodo" id="periodo">
                        <option value="" disabled selected hidden>Período</option>
                        <option value="">Manhã</option>
                        <option value="">Tarde</option>
                        <option value="">Noite</option>
                    </select>
                    <select name="prioridade" id="prioridade">
                        <option value="" disabled selected hidden>Prioridade</option>
                        <option value="">Baixa</option>
                        <option value="">Média</option>
                        <option value="">Alta</option>
                    </select>
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
        </div>

        <section class="painel">
            <div class="area-upload-arquivo">
                <form action="<%=request.getContextPath() %>/InserirDados"
                      method="post"
                      enctype="multipart/form-data">

                    <input type="file"
                           id="upload"
                           name="arquivo"
                           accept=".pdf,.jpg,.jpeg,.png"
                           required/>

                    <button type="submit" class="btn-escolher-arquivo">
                        Confirmar Arquivo
                    </button>
                </form>
            </div>
            <h1>Recentes</h1>
            <div class="area-upload-recentes">
                <img src="<%= request.getContextPath() %>/imgs/imagem%20modelo%20arquivo%20.jpg" alt="imagem papel">
                <p>Digitalizar novos documentos</p>
            </div>
        </section>
    </main>
</div>
</body>
</html>