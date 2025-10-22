<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/imgs/icon.png" type="image/x-icon" />
    <!-- CORRIGIDO: ordem dos CSS - inicioBI.css antes de globalApp.css -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/inicioBI.css" />
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
                <li class="item-menu ativo">
                    <!-- CORRIGIDO: link para inicioBI.jsp -->
                    <a href="<%= request.getContextPath() %>/web/inicioBI.jsp">
                        <div class="box-icone">
                            <!-- CORRIGIDO: ícone House.png ao invés de icon.png -->
                            <img src="<%= request.getContextPath() %>/imgs/House.png" alt="Ícone Início" />
                        </div>
                        <span>Início</span>
                    </a>
                </li>
                <li class="item-menu">
                    <!-- CORRIGIDO: link para relatorios.jsp -->
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
                            <img src="<%= request.getContextPath() %>/imgs/camera_insercao.png" alt="Ícone Inserir Dados" />
                        </div>
                        <span>Inserir Dados</span>
                    </a>
                </li>

                <!-- REMOVIDO: item ChatBot (comentado no HTML original) -->
                <!-- REMOVIDO: item Ajuda (comentado no HTML original) -->

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
        <!-- ADICIONADO: div overlay para menu mobile -->
        <div class="overlay"></div>
    </aside>

    <main class="area-conteudo">
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

        <section class="painel">
            <!-- CORRIGIDO: atributos do iframe -->
            <iframe
                    title="YbyraDash"
                    width="1140"
                    height="541.25"
                    src="https://app.powerbi.com/reportEmbed?reportId=c3e1dd76-75b3-4f23-90e3-cb9bdd866b7f&autoAuth=true&ctid=b148f14c-2397-402c-ab6a-1b4711177ac0&navContentPaneEnabled=false"
                    frameborder="0"
                    allowFullScreen="true">
            </iframe>
        </section>
    </main>
</div>
</body>
</html>