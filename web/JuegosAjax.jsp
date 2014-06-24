<%-- 
    Document   : JuegosAjax
    Created on : 21/06/2014, 03:21:01 PM
    Author     : pico
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.buscar"%>
<%@page import="Logica.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script>
       <link type="text/css" href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css" rel="stylesheet">
<script type="text/javascript" src="dataTables.js" charset="utf-8"></script>
        <title>TPlayStore</title>
        <script src="http://www.clocklink.com/embed.js"></script><script type="text/javascript" language="JavaScript"></script>
        <script src="http://jsonip.appspot.com/?callback=getip" type="application/javascript">
</script>
        <script type="text/javascript" src="http://www.paginaswebynnova.com/lib/js-ynnova.js"></script>
            <link type="text/css" href="EstiloPruebas.css" rel="stylesheet"> 
<script type="text/javascript" charset="utf-8"> 
$(document).ready(function() {
$('#tablamia').dataTable({
     "iDisplayLength": 8,
     "bProcessing": false,
    "oLanguage": {  
                "sUrl": "dataTables.spanish.txt"  
            }, 
});
} );
</script>
    </head>
    <body>
        <table cellpadding="0" cellspacing="0" border="0" class="display" id="tablamia">
<thead> 
<tr> 
<th>Juegos</th> <th>Desarrollador</th> 
</tr> 
</thead>
<tbody> 
    
<%     
    HttpSession sesion=request.getSession(true);
    String de=(String)sesion.getAttribute("usuario");
     String tip="Desarrollador";
     ResultSet rs;
     perfil per=new perfil();
     buscar bu =new buscar();
     per=bu.verEspecifico(de);
     if(per.getTipo().equals(tip)){
     
     rs=bu.juegoXdesarrollador(de);
     while(rs.next()){
     String nom=rs.getString("nombre");
     String ur=rs.getString("imagen");
     String des=rs.getString("desarrollador");
%>


 
   
<tr class="center"> 
<td><div id="cuadro" class="cuadro" style=" width: 140px;
    height: 160px; 
    float: right;">
<div id="marcar" class="marcar" >  
 <a href="mostrarJuego.jsp?juego=<%=nom%>"><br/><font color="red"><%=nom%><br/>
 <img class="min" src="http://localhost/Imagenes/<%=ur%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
</a>
</div></div></td> 


<td style="float: right;"><%=des%></td>     
             </tr>


<%}}else{  
     rs=bu.juegoXcliente(de);
     while(rs.next()){
     String nom=rs.getString("nombre");
     String ur=rs.getString("imagen");
     String des=rs.getString("desarrollador");
%>

<tr class="center"> 
<td><div id="cuadro" class="cuadro" style=" width: 140px;
    height: 160px; 
    float: right;">
<div id="marcar" class="marcar" >  
 <a href="mostrarJuego.jsp?juego=<%=nom%>"><br/><font color="red"><%=nom%><br/>
 <img class="min" src="http://localhost/Imagenes/<%=ur%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
</a>
</div></div></td> 


<td style="float: right;"><%=des%></td>     
             </tr> 


<%}}%>
</tbody>
</table>
<%--<table cellpadding="0" cellspacing="0" border="0" id="example" width="100%">
<thead> 
<tr> 

<th>Juego</th> 
<th>Desarrollador</th> 
</tr> 
</thead> 
<tbody> 
              
  <%
        
                String va="";
                String estado="Aprobada";
     String v=request.getParameter("caja"); 
        
    int ca=bu.idCategoria(v);

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
</a>
</div></div></td> 


<td style="float: right;"><%=des%></td>     
             </tr> 
             
             <%}%>
</tbody>
<tfoot>

</tfoot>
</table>--%>

    </body>
</html>
