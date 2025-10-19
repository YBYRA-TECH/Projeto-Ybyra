<%--
  Created by IntelliJ IDEA.
  User: murilofonseca-ieg
  Date: 11/10/2025
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="../imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="../css/insercaoDados.css" />
    <title>YBYRA TECH</title>
</head>
<body>
<div class="painel-principal">
    <aside class="barra-lateral">
        <div class="logo-site">
            <img src="../imgs/Nova logo.png" alt="Logo YBYRA TECH" />
        </div>

        <nav class="menu-principal">
            <ul>
                <li class="item-menu">
                    <a href="inicio.jsp">
                        <div class="box-icone">
                            <img src="../imgs/icon.png" alt="Ícone Início" />
                        </div>
                        <span>Início</span>
                    </a>
                </li>
                <li class="item-menu">
                    <a href="relatorios.jsp">
                        <div class="box-icone">
                            <img src="../imgs/document.png" alt="Ícone relatorios" />
                        </div>
                        <span>Relatórios</span>
                    </a>
                </li>

                <li class="item-menu">
                    <a href="tarefas.jsp">
                        <div class="box-icone">
                            <img src="../imgs/clipboard.png" alt="Ícone Tarefas" />
                        </div>
                        <span>Tarefas</span>
                    </a>
                </li>

                <li class="item-menu ativo">
                    <a href="insercaoDados.jsp">
                        <div class="box-icone">
                            <img src="../imgs/camera_insercao.png" alt="Ícone Inserir Dados" />
                        </div>
                        <span>Inserir Dados</span>
                    </a>
                </li>

                <li class="item-menu">
                    <a href="#">
                        <div class="box-icone">
                            <img src="" alt="Ícone IA" />
                        </div>
                        <span>ChatBot</span>
                    </a>
                </li>

                <li class="item-menu" style="margin-top: 6.5rem;">
                    <a href="#">
                        <div class="box-icone">
                            <img src="../imgs/Help.png" alt="Ícone Ajuda" />
                        </div>
                        <span>Ajuda</span>
                    </a>
                </li>

                <li class="item-menu">
                    <a href="#">
                        <div class="box-icone">
                            <img src="../imgs/configuracoes.png" alt="Ícone Configurações" />
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
                            <img src="" alt="">
                        </button>
                    </div>
                    <select name="categorias">
                        <option value="" disabled selected>Todas as Categorias</option>
                    </select>
                    <select name="periodo">
                        <option value="" disabled selected>Período</option>
                    </select>
                    <select name="prioridade">
                        <option value="" disabled selected>Prioridade</option>
                    </select>
                    <button class="btn-buscar">Buscar</button>
                </div>

                <div class="icones-header-direita">
                    <i class="fa-solid fa-bell icone-notificacao"></i>
                    <i class="fa-solid fa-circle-user icone-usuario"></i>
                </div>
                <div class="icones-header-direita">
                    <img src="" alt="imagem sino">
                    <img src="" alt="imagem usuario">
                </div>
            </header>
        </div>

        <section class="painel">
            <div class="area-upload-arquivo">
                <form action="<%= request.getContextPath() %>/InserirDados" method="post" enctype="multipart/form-data">
                    <input type="file" name="arquivo" id="upload" required>
                    <button type="submit" class="btn-escolher-arquivo">Confirmar Arquivo</button>
                </form>

            </div>
            <h1>Recentes</h1>
            <div class="area-upload-recentes">

                <img src="" alt="imagem papel">
                <p>Digitalizar novos documentos</p>
            </div>
        </section>
    </main>
</div>
</body>
</html>
