<%--
  Created by IntelliJ IDEA.
  User: murilofonseca-ieg
  Date: 30/10/2025
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <img src="<%= request.getContextPath() %>/assets/imgs/Nova_logo.png" alt="Logo Ybyra Tech" style="width: 8.125rem; max-width: 35vw; height: auto" />
    <input type="checkbox" id="menu">
    <label for="menu" class="menu-icon">☰</label>
    <nav class="menu-links" >
        <a href="<%= request.getContextPath() %>/index.jsp">Conheça o App</a>
        <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=telaSeparação">Cadastre-se</a>
        <a href="<%= request.getContextPath() %>/paginaAutenticacao?nome=telaSeparaçãoEntrar" style="color: aliceblue; font-size: 1rem" id="botao-login">Acesse a sua conta</a>
    </nav>
</header>
