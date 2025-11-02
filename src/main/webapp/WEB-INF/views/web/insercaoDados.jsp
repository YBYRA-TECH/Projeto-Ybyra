<%@ page import="com.projybyraservletmvc.model.Relatorios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/insercaoDados.css"<%=System.currentTimeMillis()%>/>
    <title>YBYRA TECH</title>
</head>

<body>
<div class="painel-principal">

    <%
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");


        request.setAttribute("paginaAtual", "insercaoDados");

        List<Relatorios> relatorios = (List<Relatorios>) request.getAttribute("relatorios");
    %>

    <jsp:include page="../includes/aside.jsp"/>

    <main class="area-conteudo">
        <div class="conteudo-principal-header">
            <header class="header-principal">
                <h1>Inserção de relatórios</h1>
                <div class="area-icones">
                    <input type="checkbox" id="menu-notificacoes">
                    <label for="menu-notificacoes">
                        <img src="<%= request.getContextPath() %>/assets/imgs/notificacoes.png" alt="Notificações" title="Notificações">
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
                <form action="<%=request.getContextPath() %>/InserirDados" method="post" enctype="multipart/form-data">
                    <input type="file" id="upload" name="arquivo" accept=".pdf,.jpg,.jpeg,.png" placeholder="Escolher arquivo" required/>
                    <button type="submit" class="btn-escolher-arquivo" title="Confirmar Arquivo">Confirmar</button>
                </form>
            </div>

            <h1>Recentes</h1>

            <% if (relatorios == null || relatorios.isEmpty()) { %>
            <div class="area-upload-recentes">
                <img src="<%= request.getContextPath() %>/assets/imgs/imagem_modelo_arquivo.jpg" alt="imagem papel" title="imagem">
                <p>Digitalizar novos documentos</p>
            </div>
            <% } else {
                int contador = 1;
                for (Relatorios r : relatorios) {
                    String modalId = "modal-relatorio-" + contador;
            %>
            <div class="relatorios-recentes">
                <div class="relatorio-item">
                    <span class="relatorio-id"><%=r.getIdRelatorios()%></span>
                    <span class="relatorio-nome"><%= r.getNome() %></span>
                    <span class="relatorio-responsavel"><%= r.getResponsavel() %></span>
                    <span class="relatorio-pdf"><%= r.getPdfDocumento() %></span>
                    <span class="relatorio-turno"><%= r.getTurno() %></span>
                    <span class="relatorio-area"><%= r.getArea() %></span>



                </div>

                <label for="<%= modalId %>" class="icone-lixeira">
                    <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Excluir" title="Excluir relatório" />
                </label>
            </div>

            <!-- Modal de confirmação -->
            <input type="checkbox" class="menu-lixeira" id="<%= modalId %>" />
            <div class="modal-overlay">
                <div class="menu-lixo">
                    <div class="menu-lixo-icone">
                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira" />
                    </div>
                    <h1>Deseja excluir o relatório?</h1>
                    <p>
                        Esta ação não pode ser desfeita. Todos os dados serão
                        permanentemente removidos.
                    </p>
                    <div class="info-item">
                        <strong>Nome do arquivo:</strong>
                        <span><%= r.getNome() %></span>
                    </div>
                    <div class="info-item">
                        <strong>Responsável:</strong>
                        <span><%= r.getResponsavel() %></span>
                    </div>
                    <div class="buttons">
                        <label for="<%= modalId %>" class="btn-cancelar">Não</label>
                        <form action="<%=request.getContextPath()%>/ExcluirRelatorio" method="post" style="flex: 1; margin: 0;">
                            <input type="hidden" name="idRelatorio" value="<%= r.getIdRelatorios() %>" />
                            <button type="submit" class="btn-excluir">Sim</button>
                        </form>
                    </div>
                </div>
            </div>
            <%
                        contador++;
                    }
                }
            %>
        </section>
    </main>
</div>
</body>
</html>