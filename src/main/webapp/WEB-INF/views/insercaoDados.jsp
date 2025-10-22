<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/imgs/icon.png" type="image/x-icon" />
    <!-- CORRIGIDO: ordem dos CSS - globalApp.css antes de insercaoDados.css -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/globalApp.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/insercaoDados.css" />

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
                            <!-- CORRIGIDO: alt com dois espaços no final -->
                            <img src="<%= request.getContextPath() %>/imgs/clipboard.png" alt="Ícone Tarefas" />
                        </div>
                        <span>Tarefas</span>
                    </a>
                </li>

                <li class="item-menu ativo">
                    <a href="<%= request.getContextPath() %>/web/insercaoDados.jsp">
                        <div class="box-icone">
                            <!-- CORRIGIDO: alt com aspas duplas extras no final -->
                            <img src="<%= request.getContextPath() %>/imgs/camera_insercao.png" alt="Ícone Inserir Dados">
                        </div>
                        <span>Inserir Dados</span>
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
        <!-- REMOVIDO: div overlay (não existe no HTML insercaoDados.html) -->
    </aside>

    <main class="area-conteudo">
        <div class="conteudo-principal-header">
            <header class="header-principal">
                <div class="busca-filtros">
                    <div class="busca-relatorios">
                        <input type="text" placeholder="Buscar Relatórios" />
                        <button class="icone-busca">
                            <!-- CORRIGIDO: src da imagem Research.png -->
                            <img src="<%= request.getContextPath() %>/imgs/Research.png" alt="Lupa">
                        </button>
                    </div>
                    <!-- ADICIONADO: id="categorias" -->
                    <select name="categorias" id="categorias">
                        <!-- CORRIGIDO: atributo hidden adicionado -->
                        <option value="" disabled selected hidden>Todas as Categorias</option>
                        <!-- ADICIONADO: opções do select -->
                        <option value="">Área Fria</option>
                        <option value="">Área Quente</option>
                    </select>
                    <!-- ADICIONADO: id="periodo" -->
                    <select name="periodo" id="periodo">
                        <!-- CORRIGIDO: atributo hidden adicionado -->
                        <option value="" disabled selected hidden>Período</option>
                        <!-- ADICIONADO: opções do select -->
                        <option value="">Manhã</option>
                        <option value="">Tarde</option>
                        <option value="">Noite</option>
                    </select>
                    <!-- ADICIONADO: id="prioridade" -->
                    <select name="prioridade" id="prioridade">
                        <!-- CORRIGIDO: atributo hidden adicionado -->
                        <option value="" disabled selected hidden>Prioridade</option>
                        <!-- ADICIONADO: opções do select -->
                        <option value="">Baixa</option>
                        <option value="">Média</option>
                        <option value="">Alta</option>
                    </select>
                    <button class="btn-buscar">Buscar</button>
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
            </header>
        </div>

        <section class="painel">
            <div class="area-upload-arquivo">
                    <form action="<%= request.getContextPath() %>/InserirDados"
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