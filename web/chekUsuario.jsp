<%-- 
    Document   : chekUsuario
    Created on : 04/04/2014, 09:54:38 PM
    Author     : pico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conexion.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="estilo.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            buscar bu=new buscar();
        String usuario=request.getParameter("usuario");
        String pico="Pico";
 if(bu.existeNick(usuario)){%>
 <div id="Error" style="font-weight: bolder;"><font color="red"><h4><img src="http://localhost/Imagenes/alerta.png" width="20" height="20">Nick está en uso</h4></div>
        <% }
        else{%>
 <div id="Error" style="font-weight: bolder;"><font color="green"><h4><img src="http://localhost/Imagenes/exito.png" width="20" height="20">Nick disponible </h4></div>
        <% }%>
        
    </body>
</html>
