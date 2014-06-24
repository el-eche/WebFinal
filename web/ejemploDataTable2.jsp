<%-- 
    Document   : ejemploDataTable2
    Created on : 18/06/2014, 10:50:26 PM
    Author     : pico
--%>
<%@page import="java.util.LinkedList"%>
<%@page import="Logica.*"%>
<%@page import="conexion.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link type="text/css" href="EstiloPruebas.css" rel="stylesheet">    
<link type="text/css" href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css" rel="stylesheet">
<script type="text/javascript" language="javascript" src="jquery.js"></script> 
<script type="text/javascript" src="dataTables.js" charset="utf-8"></script> 
<script type="text/javascript" charset="utf-8"> 
$(document).ready(function() {
$('#tablamia').dataTable( {//Linea 4812 arreglar
    "bProcessing": true,
    "oLanguage": {  
                "sUrl": "dataTables.spanish.txt"  
            }, 
            "sLengthMenu":false,
    "iDisplayLength": 8,
"aaSorting": [[ 2, "desc" ]],
"aoColumns": [

null,
null,
null
]

} );
} );
</script> 
    </head>
    <body>
        <div id="resto">
<table cellpadding="0" cellspacing="0" border="0" class="display" id="tablamia">
<thead> 
<tr> 
<th>Juegos</th> <th>Desarrollador</th> 
</tr> 
</thead> 
<tbody> 
    <%
    int ca=1;
    buscar bu=new buscar();
    for(int i=0;i<bu.JuegoCategoria(ca).size();i++){
    String nom=bu.JuegoCategoria(ca).get(i).getNombre();
    String des=bu.JuegoCategoria(ca).get(i).getDesarrollador();
    String ima=bu.JuegoCategoria(ca).get(i).getImagen();
    
    
    %>    
<tr class="center"> 
   
<td><div id="cuadro" class="cuadro" style=" width: 140px;
    height: 160px; 
    float: right;">
<div id="marcar" class="marcar" >  
 <a href="mostrarJuego.jsp?juego=<%=nom%>"><br/><font color="red"><%=nom%><br/>
 <img class="min" src="http://localhost/Imagenes/<%=ima%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
</a>
</div></div></td> 
<td class="center"><%=des%></td> 

</tr> <%}%>
</tbody>
</table>
</div>
    </body>
</html>
<%----%>