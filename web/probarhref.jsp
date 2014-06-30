<%-- 
    Document   : probarhref
    Created on : 25/06/2014, 04:54:01 PM
    Author     : pico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script>
        <title>Muestra Estrellas</title>

    </head>
    <%int i=1;%>
    <body>
        <a  href="miservlet?dato=<%=i%>">click</a>
    
        <div id="mostrar"><%
        String respuesta=request.getParameter("respuesta");
        %>
        <p><%=respuesta%></p>
        </div>
    </body>
</html>
