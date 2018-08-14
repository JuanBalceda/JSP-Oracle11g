<%-- 
    Document   : ConsultaUsuario
    Created on : 14-ago-2018, 12:25:53
    Author     : jbalceda
--%>

<%@page import="clases.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioDatos" class="clases.UsuarioDatos" scope="request" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Usuarios</title>
    </head>
    <body>
        <h1>Lista de Usuarios</h1>
        <table border="0">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
        <%
            List lista = usuarioDatos.consultarUsuarios();
            Iterator i = lista.iterator();
            Usuario usr;
            while (i.hasNext()) {
                usr = (Usuario) i.next();

        %>
                <tr>
                    <td><%=usr.getNombre()%></td>
                    <td><%=usr.getEmail()%></td>
                </tr>
        <%}%>
            </tbody>
        </table>

        
    </body>
</html>
