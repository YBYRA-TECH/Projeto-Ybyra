<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/telaAdd_Alterar.css" />
    <title>YBYRA TECH</title>
</head>

<body>
<%
    Integer id_tarefa = (Integer) session.getAttribute("id_tarefa");
    Integer id_usuario = (Integer) session.getAttribute("id_usuario");
    String prioridade = (String) session.getAttribute("prioridade");
    String responsavel = (String) session.getAttribute("responsavel");
    String nome = (String) session.getAttribute("nome");
    LocalDate prazo = (LocalDate) session.getAttribute("prazo");
    String descricao = (String) session.getAttribute("descricao");

    // Formatar data para o input
    String prazoFormatado = "";
    if (prazo != null) {
        prazoFormatado = prazo.toString();
    }
%>

<div class="painel-principal">

    <% request.setAttribute("paginaAtual", "tarefas"); %>

    <jsp:include page="../includes/aside.jsp"/>

    <main class="area-conteudo">
        <div class="conteudo-principal-header">
            <a href="<%= request.getContextPath() %>/pagina?nome=tarefas">
                <img src="<%= request.getContextPath() %>/assets/imgs/voltar.png" alt="voltar" id="voltar">
            </a>
            <h1>Alterar</h1>
        </div>

        <section class="detalhes-upload-painel">
            <form method="post" action="<%= request.getContextPath() %>/AlterarTarefas" class="formulario-detalhes">

                <div class="area-detalhes">
                    <h3 class="subtitulo-secao">Detalhes</h3>
                    <div class="detalhes-campos">
                        <div>
                            <div class="campo">
                                <label for="prioridade">Prioridade</label>
                                <select class="filtro-select" id="prioridade" name="prioridade" required>
                                    <option value="" disabled <%= (prioridade == null || prioridade.isEmpty()) ? "selected" : "" %>>Selecione a Prioridade</option>
                                    <option value="nao_iniciada" <%= "nao_iniciada".equals(prioridade) ? "selected" : "" %>>Não Iniciada</option>
                                    <option value="em_andamento" <%= "em_andamento".equals(prioridade) ? "selected" : "" %>>Em Andamento</option>
                                    <option value="concluida" <%= "concluida".equals(prioridade) ? "selected" : "" %>>Concluída</option>
                                </select>
                            </div>

                            <div class="campo">
                                <label for="nome-tarefa">Nome da Tarefa</label>
                                <input type="text" id="nome-tarefa" name="nome" value="<%= nome != null ? nome : "" %>" placeholder="Digite o Nome da Tarefa" required>
                            </div>
                        </div>
                        <div>
                            <div class="campo">
                                <label for="responsavel">Responsável</label>
                                <input type="text" value="<%= responsavel != null ? responsavel : "" %>" id="responsavel" name="responsavel" placeholder="Digite o Nome do Responsável" required>
                            </div>
                            <div class="campo">
                                <label for="data-tarefa">Data da Tarefa</label>
                                <input type="date" id="data-tarefa" name="prazo" value="<%= prazoFormatado %>" required>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="area-descricao">
                    <h3 class="subtitulo-secao">Descrição</h3>
                    <h3 style="opacity: 0;">Espaço</h3>
                    <textarea class="texto-descricao" name="descricao" placeholder="Coloque aqui a descrição da tarefa" required><%= descricao != null ? descricao : "" %></textarea>

                    <button type="submit" class="btn-enviar">Confirmar</button>
                </div>
            </form>
        </section>
    </main>
</div>
</body>

</html>