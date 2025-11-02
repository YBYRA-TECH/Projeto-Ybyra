<%@ page import="com.projybyraservletmvc.model.Lote" %>
<%@ page import="com.projybyraservletmvc.model.Usuario" %>
<%@page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/relatorios.css" />
    <title>YBYRA TECH</title>
</head>

<body>
<%
    List<Lote> lote = (List<Lote>) session.getAttribute("lote");

    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
    Integer id_industria = (usuarioLogado != null) ? usuarioLogado.getIdIndustria() : null;
%>
<div class="painel-principal">

    <% request.setAttribute("paginaAtual", "relatorios"); %>

    <jsp:include page="../includes/aside.jsp"/>

    <main class="area-conteudo">

        <section class="painel">
            <header>
                <form method="get" action="<%=request.getContextPath()%>/BuscaLote">
                <div class="busca-filtros">


                    <select name="area" id="categorias" title="Categorias">
                        <option value="" disabled selected hidden>Todas as Categorias</option>
                        <option value="Area Fria">Área Fria</option>
                        <option value="Area Quente">Área Quente</option>
                        <option value="FFO">FFO</option>
                        <option value="ETA E ETE">ETA E ETE</option>


                    </select>
                    <select name="turno" id="periodo" title="Período">
                        <option value="" disabled selected hidden>Período</option>
                        <option value="Manhã">Manhã</option>
                        <option value="Tarde">Tarde</option>
                        <option value="Noite">Noite</option>
                    </select>
                    <select name="eficiencia" id="prioridade" title="Prioridade">
                        <option value="" disabled selected hidden>Eficiência</option>
                        <option value="Baixa">Baixa</option>
                        <option value="Média">Média</option>
                        <option value="Alta">Alta</option>
                    </select>
                    <div class="busca-relatorios">
                        <input name="busca" type="text" placeholder="Buscar Relatórios" title="Busca"/>
                        <button type="submit" class="icone-busca">
                            <img src="<%= request.getContextPath() %>/assets/imgs/Research.png" alt="Lupa" title="lupa">
                        </button>
                    </div>
                    <input type="checkbox" class="menu-lixeira" id="modal-apagar-todos">
                    <label for="modal-apagar-todos" id="apagarTodos">Apagar todos</label>
                    <button class="btn-add">
                        <a href="<%=request.getContextPath()%>/pagina?nome=adicionarLote">Adicionar Lote
                        </a>
                    </button>
                    <!-- MODAL APAGAR TODOS -->
                    <div class="modal-overlay">
                        <div class="menu-lixo">
                            <div class="menu-lixo-icone">
                                <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira" />
                            </div>
                            <h1>Deseja excluir TODOS os lotes?</h1>
                            <p>Esta ação não pode ser desfeita. Todos os dados serão permanentemente removidos.</p>
                            <div class="info-item">
                                <strong>Total de lotes:</strong>
                                <%
                                    int contador = (lote != null) ? lote.size() : 0;
                                %>
                                <span><%= contador %> Lote<%= contador != 1 ? "s" : "" %></span>
                            </div>
                            <form method="post" action="<%=request.getContextPath()%>/ExcluirLote">
                                <div class="buttons">
                                    <input type="hidden" name="id_industria" value="<%=id_industria != null ? id_industria : 0%>">
                                    <input type="hidden" name="acao" value="excluirTodos">
                                    <label for="modal-apagar-todos" class="btn-cancelar">Não</label>
                                    <button type="submit" class="btn-excluir">Sim, apagar tudo</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                </form>

                <div class="area-icones">
                    <input type="checkbox" id="menu-notificacoes">
                    <label for="menu-notificacoes" title="Notificações">
                        <img src="<%= request.getContextPath() %>/assets/imgs/notificacoes.png" alt="Notificações">
                    </label>
                </div>
            </header>

            <div class="container-tabela">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Índice</th>
                        <th>Turno</th>
                        <th>Área</th>
                        <th>Responsável</th>
                        <th>Desempenho</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        if (lote != null && !lote.isEmpty()) {
                            int modalCounter = 1;
                            for (Lote l : lote) {
                                String modalId = "modal-" + modalCounter++;
                    %>
                    <tr class="row-link">
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI&id_lote=<%= l.getId_lote() %>" class="table-link"><%= l.getId_lote() %></a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI&id_lote=<%= l.getId_lote() %>" class="table-link"><%= l.getDescricao() %></a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI&id_lote=<%= l.getId_lote() %>" class="table-link"><%= l.getTurno() %></a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI&id_lote=<%= l.getId_lote() %>" class="table-link"><%= l.getArea() %></a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI&id_lote=<%= l.getId_lote() %>" class="table-link"><%= l.getResponsavel() %></a></td>
                        <td><a href="<%= request.getContextPath() %>/pagina?nome=inicioBI&id_lote=<%= l.getId_lote() %>" class="table-link">
                            <%
                                String classEficiencia = "";
                                double eficiencia = l.getEficiencia();
                                if(eficiencia >= 97){
                                    classEficiencia = "-verde";
                                }else if(eficiencia >= 85){
                                    classEficiencia = "-verde-med";
                                }else if(eficiencia >= 76){
                                    classEficiencia = "-verde-claro";
                                }else if(eficiencia >= 50){
                                    classEficiencia = "-amarela";
                                }else{
                                    classEficiencia = "-vermelha";
                                }
                            %>
                            <div class="barra-desempenho barra<%=classEficiencia%>"><%=String.format("%.2f", eficiencia)%>%</div>
                        </a></td>
                        <td>
                            <input type="checkbox" class="menu-lixeira" id="<%= modalId %>">
                            <label for="<%= modalId %>" class="icone-lixeira" title="Lixeira">
                                <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="lixeira">
                            </label>
                            <div class="modal-overlay">
                                <div class="menu-lixo">
                                    <div class="menu-lixo-icone" title="Lixeira">
                                        <img src="<%= request.getContextPath() %>/assets/imgs/Trash.png" alt="Ícone Lixeira">
                                    </div>
                                    <h1>Deseja excluir o lote?</h1>
                                    <p>Esta ação não pode ser desfeita. Todos os dados serão permanentemente removidos.</p>
                                    <div class="info-item">
                                        <strong>ID:</strong>
                                        <span><%= l.getId_lote()%></span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Índice:</strong>
                                        <span><%= l.getDescricao()%></span>
                                    </div>
                                    <div class="info-item">
                                        <strong>Responsável:</strong>
                                        <span><%= l.getResponsavel()%></span>
                                    </div>
                                    <form method="post" action="<%=request.getContextPath()%>/ExcluirLote">
                                        <div class="buttons">
                                            <input type="hidden" name="id_lote" value="<%=l.getId_lote()%>">
                                            <input type="hidden" name="id_industria" value="<%=l.getId_industria()%>">
                                            <input type="hidden" name="acao" value="excluir">
                                            <label for="<%= modalId %>" class="btn-cancelar">Não</label>
                                            <button type="submit" class="btn-excluir">Sim</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7" style="text-align: center;">Nenhum lote encontrado</td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
</div>
</body>

</html>