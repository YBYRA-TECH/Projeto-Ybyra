<%--
  Created by IntelliJ IDEA.
  User: murilofonseca-ieg
  Date: 11/10/2025
  Time: 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="./imgs/Nova logo Sem tech.png" type="image/x-icon" />
    <link rel="stylesheet" href="inicio.css" />
    <title>YBYRA TECH</title>
</head>
<body>
<div class="painel-principal">
    <aside class="barra-lateral">
        <div class="logo-site">
            <img src="./imgs/Nova logo.png" alt="Logo YBYRA TECH" />
        </div>

        <nav class="menu-principal">
            <ul>
                <li class="item-menu ativo">
                    <a href="inicio.html">
                        <div class="box-icone">
                            <img src="./imgs/Nova logo Sem tech.png" alt="Ícone Início" />
                        </div>
                        <span>Início</span>
                    </a>
                </li>
                <li class="item-menu">
                    <a href="relatorios.html">
                        <div class="box-icone">
                            <img src="relatorios.html" alt="Ícone relatorios" />
                        </div>
                        <span>Relatórios</span>
                    </a>
                </li>

                <li class="item-menu">
                    <a href="tarefas.html">
                        <div class="box-icone">
                            <img src="tarefas" alt="Ícone Tarefas" />
                        </div>
                        <span>Tarefas</span>
                    </a>
                </li>

                <li class="item-menu">
                    <a href="insercaoDados.html">
                        <div class="box-icone">
                            <img src="inserir dados" alt="Ícone Inserir Dados" />
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
                            <img src="ajuda" alt="Ícone Ajuda" />
                        </div>
                        <span>Ajuda</span>
                    </a>
                </li>

                <li class="item-menu">
                    <a href="#">
                        <div class="box-icone">
                            <img src="configuracao" alt="Ícone Configurações" />
                        </div>
                        <span>Configurações</span>
                    </a>
                </li>
            </ul>
        </nav>
    </aside>

    <main class="area-conteudo">

        <section class="painel">
            <div id="conteudo">
                <img src="./imgs/Dois celulare 1Pa.png" alt="imagem vazio">
                <h1>Nenhum Índice Inserido</h1>

                <a href="insercaoDados.html"> <div id="button">
                    <button>Adicione um agora!</button>
                </div>
                </a>
            </div>
        </section>

    </main>
</div>
</body>
</html>