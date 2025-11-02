<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/adicionarLote.css"/>
    <title>YBYRA TECH</title>
</head>

<body>
<div class="painel-principal">

    <% request.setAttribute("paginaAtual", "relatorios"); %>

    <jsp:include page="../includes/aside.jsp"/>

    <main class="area-conteudo">
        <div class="conteudo-principal-header">
            <a href="<%= request.getContextPath() %>/pagina?nome=relatorios">
                <img src="<%= request.getContextPath() %>/assets/imgs/voltar.png" alt="voltar" id="voltar">
            </a>
            <h1>Adicionar</h1>
            <div class="area-icones">
                <input type="checkbox" id="menu-notificacoes">
                <label for="menu-notificacoes">
                    <img src="<%= request.getContextPath() %>/assets/imgs/notificacoes.png" alt="Notificações">
                </label>
            </div>
        </div>

        <section class="detalhesPainel">
            <form action="<%= request.getContextPath() %>/AdicionarLote" method="post">
                <div class="formulario-detalhes">

                    <div class="area-detalhes">
                        <h3 class="subtitulo-secao">Não recomendamos a inserção de lotes manualmente, pois o BI não conseguirá dados.</h3>
                        <div class="detalhes-campos">
                            <div>
                                <div class="campo">
                                    <label for="nome">Nome</label>
                                    <input type="text" id="nome" name="nome" placeholder="Digite o nome do lote" required>
                                </div>

                                <div class="campo">
                                    <label for="planejado">Planejado</label>
                                    <input type="text" id="planejado" name="planejado" placeholder="Ex:200" required>
                                </div>
                            </div>
                            <div class="campo">
                                <label for="descricao">Descrição</label>
                                <input type="text" id="planejado" name="descricao" placeholder="Ex: Lote de carnes" required>
                            </div>
                        </div>
                            <div>
                                <div class="campo">
                                    <label for="responsavel">Responsável</label>
                                    <input type="text" id="responsavel" name="responsavel" placeholder="Ex:Davi" required>
                                </div>

                                <div class="campo">
                                    <label for="producao">Produção</label>
                                    <input type="text" id="producao" name="producao" placeholder="Ex: 150" required>
                                </div>

                                <div class="campo">
                                    <label for="relatorios">Id do relatorio</label>
                                    <input type="text" id="observacao" name="id_relatorio" placeholder="Ex: 8 (O id do relatorio tem que existir)" required>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="area-problemas">
                        <label for="problemas">Problemas</label>
                        <input type="text" id="problemas" name="problemas" placeholder="Ex: 4">
                    </div>
                </div>

                <button type="submit" class="btn-enviar">Confirmar</button>
            </form>
        </section>
    </main>
</div>
</body>

</html>