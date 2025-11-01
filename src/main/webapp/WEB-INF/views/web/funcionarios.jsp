<%--
  Created by IntelliJ IDEA.
  User: murilofonseca-ieg
  Date: 30/10/2025
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.projybyraservletmvc.model.Usuario" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@page import="java.util.List" %>
<%@ page import="com.projybyraservletmvc.model.Industria" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/funcionarios.css" />
    <title>YBYRA TECH</title>
</head>

<body>
<%
    Industria industriaLogada = (Industria) session.getAttribute("industriaLogada");
    Integer id_industria = (industriaLogada != null) ? industriaLogada.getIdIndustria() : null;

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");

%>
<div class="container-principal">

    <% request.setAttribute("paginaAtual", "funcionarios"); %>

    <jsp:include page="../includes/aside.jsp"/>


    <!-- CONTEÚDO PRINCIPAL -->
    <main class="conteudo">
        <!-- HEADER COM BUSCA E FILTROS -->
        <header class="topo">
            <div class="area-filtros">
                <form class="campo-busca">
                    <input type="text" placeholder="Buscar Tarefas" id="buscar" title="Busca" />
                    <button class="btn-lupa" type="button">
                        <img src="<%= request.getContextPath() %>/assets/imgs/Research.png" alt="Lupa" title="Lupa" />
                    </button>
                </form>
                <a href="<%= request.getContextPath() %>/pagina?nome=adicionarUsuario" id="linkAdi" title="Adicionar">Adicionar</a>

                <div class="area-icones">
                    <input type="checkbox" id="menu-notificacoes" />
                    <label for="menu-notificacoes" id="label-notificações" title="Notificações">
                        <img src="<%= request.getContextPath() %>/assets/imgs/notificacoes.png" alt="Notificações" />
                    </label>
                    <div id="notificacoes">
                        <h1>Notificações</h1>
                        <div>Murilo adicionou uma tarefa</div>
                        <div>Guilherme concluiu uma tarefa</div>
                        <div>Emilly concluiu uma tarefa</div>
                    </div>
                </div>
            </div>
        </header>

        <!-- BOARD DE TAREFAS + PESSOAS ONLINE -->
        <section class="secao-board">
            <!-- QUADRO KANBAN -->
            <div class="quadro-tarefas">
                <!-- COLUNA: USUÁRIOS -->
                <div class="coluna-status">
                    <div class="titulo-status">
                        <h3>Usuários</h3>
                        <label for="modal-apagar-todos-1" class="btn-apagar-todos">Apagar Todos</label>
                    </div>

                    <!-- CHECKBOX E MODAL APAGAR TODOS -->
                    <input type="checkbox" class="menu-lixeira" id="modal-apagar-todos-1" />
                    <div class="modal-overlay">
                        <div class="menu-lixo">
                            <div class="menu-lixo-icone">
                                <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira" />
                            </div>
                            <h1>Deseja excluir TODOS os Usuários?</h1>
                            <p>
                                Esta ação não pode ser desfeita. Todos os dados desta coluna
                                serão permanentemente removidos.
                            </p>

                            <div class="info-item">
                                <strong>Total de Usuários:</strong>
                                <%
                                    int contador = (usuarios != null) ? usuarios.size() : 0;
                                %>
                                <span><%= contador %> Usuário<%= contador != 1 ? "s" : "" %></span>
                            </div>
                            <div class="buttons">
                                <label for="modal-apagar-todos-1" class="btn-cancelar">Não</label>
                                <form action="<%= request.getContextPath() %>/excluirUsuario" method="post" style="display:inline;">
                                    <input type="hidden" name="acao" value="excluirTodos"/>
                                    <input type="hidden" name="id_industria" value="<%= id_industria %>" />
                                    <button type="submit" class="btn-excluir">Sim</button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- GRID DE USUÁRIOS -->
                    <div class="usuarios-grid">
                        <% if (usuarios != null && !usuarios.isEmpty()) {
                            for (Usuario u : usuarios) { %>

                        <div class="tarefa nao-iniciada">
                            <label for="tarefa-<%= u.getIdUsuario() %>" class="cabecalho-tarefa">
                                <span class="titulo-tarefa"><%=u.getNome()%></span>
                                <form action="/DadosAlterarUsuario" method="post">
                                <div class="acoes-tarefa">

                                    <button type="submit" class="btn-acao btn-editar">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/icone_alterar.png" alt="Editar" title="Alterar" />
                                    </button>
                                    <label for="modal-<%= u.getIdUsuario() %>" class="btn-acao icone-lixeira">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira" title="Lixeira" />
                                    </label>
                                </div>
                                </form>
                            </label>

                            <input type="checkbox" class="menu-lixeira" id="modal-<%= u.getIdUsuario() %>" />
                            <div class="modal-overlay">
                                <div class="menu-lixo">
                                    <div class="menu-lixo-icone">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira" />
                                    </div>
                                    <h1>Deseja excluir o usuário?</h1>
                                    <p>
                                        Esta ação não pode ser desfeita. Todos os dados serão
                                        permanentemente removidos.
                                    </p>
                                    <div class="info-item">
                                        <strong>Nome:</strong>
                                        <span><%= u.getNome()%></span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Data de Nascimento:</strong>
                                        <span><%=u.getDataNascimento().format(formatter)%></span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Email:</strong>
                                        <span><%= u.getEmail() %></span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Data de Cadastro:</strong>
                                        <span><%= u.getDataCadastro().format(formatter)%></span>
                                    </div>
                                    <div class="buttons">
                                        <label for="modal-<%= u.getIdUsuario() %>" class="btn-cancelar">Não</label>
                                        <form action="<%= request.getContextPath() %>/excluirUsuario" method="post" style="display:inline;">
                                            <input type="hidden" name="acao" value="excluir"/>
                                            <input type="hidden" name="id_usuario" value="<%= u.getIdUsuario() %>" />
                                            <button type="submit" class="btn-excluir">Sim</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <% }
                        } else { %>
                        <p>Nenhum usuário cadastrado.</p>
                        <% } %>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>
</body>
</html>