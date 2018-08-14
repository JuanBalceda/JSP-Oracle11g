<%-- 
    Document   : registroUsuario
    Created on : 14-ago-2018, 15:25:33
    Author     : jbalceda
--%>

<%@page import="clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usr" class="clases.Usuario" scope="page" />
<jsp:useBean id="usrDatos" class="clases.UsuarioDatos" scope="request" />
<jsp:setProperty name="usr" property="*"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <h1>Registro de usuarios</h1>
        <%
            String nombre, email;
            nombre = request.getParameter("nombre");
            email = request.getParameter("email");
            if (nombre == null && email == null) {
        %>
        <form name="registro" action="RegistroUsuario.jsp" method="GET">
            Nombres: <input type="text" name="nombre">
            Email: <input type="text" name="email">
            <input type="submit" value="Registrar">
        </form>
        <%  } else {
            //Usuario newUser = new Usuario(nombre, email);
            usrDatos.registrarUsuario(usr);
        %>
        <h3>Registro correcto</h3>
        <jsp:forward page="ConsultaUsuario.jsp"/>
        <% } %>
    </body>
</html>
