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
                <div id="notificacoes">
                    <h1>Notificações</h1>
                    <div>Murilo adicionou uma tarefa</div>
                    <div>Guilherme concluiu uma tarefa</div>
                    <div>Emilly concluiu uma tarefa</div>
                </div>
            </div>
        </div>

        <section class="detalhesPainel">
            <form action="<%= request.getContextPath() %>/adicionarLote" method="post">
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
                                    <label for="eficiencia">Eficiência</label>
                                    <input type="text" id="eficiencia" name="eficiencia" placeholder="Ex: 95% ou Alta" required>
                                </div>

                                <div class="campo">
                                    <label for="planejado">Planejado</label>
                                    <input type="text" id="planejado" name="planejado" placeholder="Ex: Produção, Logística, Administrativo" required>
                                </div>
                            </div>
                            <div>
                                <div class="campo">
                                    <label for="responsavel">Responsável</label>
                                    <input type="text" id="responsavel" name="responsavel" placeholder="Ex: email@exemplo.com ou (11) 98765-4321" required>
                                </div>

                                <div class="campo">
                                    <label for="producao">Produção</label>
                                    <input type="text" id="producao" name="producao" placeholder="Ex: 150 unidades/dia" required>
                                </div>

                                <div class="campo">
                                    <label for="observacao">Observação</label>
                                    <input type="text" id="observacao" name="observacao" placeholder="Ex: rel-123-abc ou Nome do relatório">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="area-problemas">
                        <label for="problemas">Problemas</label>
                        <input type="text" id="problemas" name="problemas" placeholder="Descreva problemas identificados">
                    </div>
                </div>

                <button type="submit" class="btn-enviar">Confirmar</button>
            </form>
        </section>
    </main>
</div>
</body>

</html>