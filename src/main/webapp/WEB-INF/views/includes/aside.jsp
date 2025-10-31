<%--
  Created by IntelliJ IDEA.
  User: murilofonseca-ieg
  Date: 30/10/2025
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    boolean isIndustria = false;
    HttpSession verificacaoLogin = request.getSession(false);
    if (verificacaoLogin != null && verificacaoLogin.getAttribute("industriaLogada") != null) {
        isIndustria = true;
    }


 String paginaAtual = (String) request.getAttribute("paginaAtual");

 if (paginaAtual == null){
     paginaAtual = "";
 }
%>

<aside class="barra-lateral">
    <input type="checkbox" id="menu">
    <label for="menu" class="menu-icon">
        <span></span>
        <span></span>
        <span></span>
    </label>
    <label for="menu-icon" class="logo-logo">
        <img src="<%= request.getContextPath() %>/assets/imgs/Nova_logo.png" alt="Logo YBYRA TECH" id="logo" />
    </label>

    <nav class="menu-principal">
        <ul>
            <li class="item-menu <%= paginaAtual.equals("inicioBI")? "ativo" : ""%>">
                <a href="<%= request.getContextPath() %>/pagina?nome=inicioBI">
                    <div class="box-icone">
                        <img src="<%= request.getContextPath() %>/assets/imgs/House.png" alt="Ícone Início" />
                    </div>
                    <span>Início</span>
                </a>
            </li>
            <li class="item-menu <%= paginaAtual.equals("relatorios")? "ativo" : ""%>">
                <a href="<%= request.getContextPath() %>/pagina?nome=relatorios">
                    <div class="box-icone">
                        <img src="<%= request.getContextPath() %>/assets/imgs/document.png" alt="Ícone relatorios" />
                    </div>
                    <span>Relatórios</span>
                </a>
            </li>

            <li class="item-menu <%= paginaAtual.equals("tarefas")? "ativo" : ""%>">
                <a href="<%= request.getContextPath() %>/pagina?nome=tarefas">
                    <div class="box-icone">
                        <img src="<%= request.getContextPath() %>/assets/imgs/clipboard.png" alt="Ícone Tarefas" />
                    </div>
                    <span>Tarefas</span>
                </a>
            </li>

            <li class="item-menu <%= paginaAtual.equals("insercaoDados")? "ativo" : ""%>">
                <a href="<%= request.getContextPath() %>/pagina?nome=insercaoDados">
                    <div class="box-icone">
                        <img src="<%= request.getContextPath() %>/assets/imgs/camera_insercao.png" alt="Ícone Inserir Dados">
                    </div>
                    <span>Inserir Dados</span>
                </a>
            </li>
            <% if(isIndustria){%>
            <li class="item-menu <%= paginaAtual.equals("funcionarios")? "ativo" : ""%>">
                <button type="submit">
                <a href="<%= request.getContextPath() %>/pagina?nome=funcionarios">
                    <div class="box-icone">
                        <img src="<%= request.getContextPath() %>/assets/imgs/icone_funcionario.png" alt="Ícone Funcionários" />
                    </div>
                    <span>Funcionários</span>
            </a></button>
            </li>


            <li class="item-menu <%= paginaAtual.equals("perfil")? "ativo" : ""%>">
                <a href="<%= request.getContextPath() %>/pagina?nome=perfil">
                    <div class="box-icone">
                        <img src="<%= request.getContextPath() %>/assets/imgs/icone_usuario.png" alt="Ícone Perfil" />
                    </div>
                    <span>Perfil</span>
                </a>
            </li>
            <%}%>
        </ul>
    </nav>
</aside>