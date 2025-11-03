<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/adicionarLote.css"/>
    <title>YBYRA TECH - Adicionar Lote</title>
</head>

<body>
<div class="painel-principal">

    <% request.setAttribute("paginaAtual", "relatorios"); %>

    <jsp:include page="../includes/aside.jsp"/>

    <main class="area-conteudo">
        <div class="conteudo-principal-header">
            <a href="<%= request.getContextPath() %>/pagina?nome=relatorios" title="Voltar">
                <img src="<%= request.getContextPath() %>/assets/imgs/voltar.png" alt="Voltar" id="voltar">
            </a>
            <h1>Adicionar Lote</h1>
            <div class="area-icones">
                <input type="checkbox" id="menu-notificacoes">
                <label for="menu-notificacoes" title="Notificações">
                    <img src="<%= request.getContextPath() %>/assets/imgs/notificacoes.png" alt="Notificações">
                </label>
            </div>
        </div>

        <section class="detalhesPainel">
            <form action="<%= request.getContextPath() %>/AdicionarLote" method="post">
                <div class="formulario-detalhes">

                    <div class="area-detalhes">
                        <h3 class="subtitulo-secao">⚠️ Não recomendamos a inserção manual de lotes, pois o BI não conseguirá processar os dados corretamente.</h3>

                        <div class="detalhes-campos">
                            <div>
                                <div class="campo">
                                    <label for="nome">Nome do Lote *</label>
                                    <input type="text" id="nome" name="nome" placeholder="Digite o nome do lote" required>
                                </div>

                                <div class="campo">
                                    <label for="planejado">Quantidade Planejada *</label>
                                    <input type="number" id="planejado" name="planejado" placeholder="Ex: 200" min="0" required>
                                </div>

                                <div class="campo">
                                    <label for="descricao">Descrição *</label>
                                    <input type="text" id="descricao" name="descricao" placeholder="Ex: Lote de carnes" required>
                                </div>
                            </div>

                            <div>
                                <div class="campo">
                                    <label for="responsavel">Responsável *</label>
                                    <input type="text" id="responsavel" name="responsavel" placeholder="Ex: Davi" required>
                                </div>

                                <div class="campo">
                                    <label for="producao">Quantidade Produzida *</label>
                                    <input type="number" id="producao" name="producao" placeholder="Ex: 150" min="0" required>
                                </div>

                                <div class="campo">
                                    <label for="id_relatorio">ID do Relatório *</label>
                                    <input type="number" id="id_relatorio" name="id_relatorio" placeholder="Ex: 8 (deve existir no sistema)" min="1" required>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="area-problemas">
                        <label for="problemas">Quantidade de Problemas</label>
                        <input type="number" id="problemas" name="problemas" placeholder="Ex: 4" min="0" value="0">
                    </div>
                </div>

                <button type="submit" class="btn-enviar">Confirmar e Adicionar</button>
            </form>
        </section>
    </main>
</div>
</body>

</html>