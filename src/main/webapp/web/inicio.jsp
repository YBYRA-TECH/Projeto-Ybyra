<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/inicio.css" />
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
                    <a href="<%= request.getContextPath() %>/web/inicio.jsp">
                        <div class="box-icone">
                            <!-- CORRIGIDO: ícone House.png ao invés de icon.png -->
                            <img src="<%= request.getContextPath() %>/imgs/House.png" alt="Ícone Início" />
                        </div>
                        <span>Início</span>
                    </a>
                </li>
                <!-- REMOVIDO: todos os outros itens do menu que estavam comentados no HTML original -->
                <!-- Apenas Início e Configurações ficam -->

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
            <div id="conteudo">
                <!-- CORRIGIDO: nome da imagem "sem documento.png" -->
                <img src="<%= request.getContextPath() %>/imgs/sem%20documento.png" alt="imagem vazio">
                <h1>Nenhum Índice Inserido</h1>

                <!-- CORRIGIDO: link para insercaoDados.jsp -->
                <a href="<%= request.getContextPath() %>/web/insercaoDados.jsp">
                    <div id="button">
                        <button>Adicione um agora!</button>
                    </div>
                </a>
            </div>
        </section>

    </main>
</div>
</body>
</html>