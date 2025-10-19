<%--
  Created by IntelliJ IDEA.
  User: murilofonseca-ieg
  Date: 11/10/2025
  Time: 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="../imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="../css/inicioBI.css" />
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
                <li class="item-menu ativo">
                    <a href="inicio.jsp">
                        <div class="box-icone">
                            <img src="../imgs/icon.png" alt="Ícone Início" />
                        </div>
                        <span>Início</span>
                    </a>
                </li>
                <li class="item-menu">
                    <a href="relatorios.html">
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

                <li class="item-menu">
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
            <header id="header-imagem">
                <img src="../imgs/Nova logo.png" alt="Logo Header 1" />
                <img src="../imgs/Nova logo.png" alt="Logo Header 2" />
            </header>
        </div>

        <section class="painel">
            <iframe
                    title="2 - Dashboard SAC"
                    id="meuIframe"
                    src="https://app.powerbi.com/view?r=eyJrIjoiNTYxN2MwYTUtMDczZS00YjA3LTk0ZjMtOTY4MzdiNmVhMWUyIiwidCI6ImIxNDhmMTRjLTIzOTctNDAyYy1hYjZhLTFiNDcxMTE3N2FjMCJ9&chromeless=true&filterPaneEnabled=false"
                    frameborder="0">
            </iframe>
        </section>
    </main>
</div>
</body>
</html>
