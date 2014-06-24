<%-- 
    Document   : juegosReclamados
    Created on : 24/06/2014, 06:33:29 PM
    Author     : pico
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.*"%>
<%@page import="Logica.*"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
               <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script>
       <link type="text/css" href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css" rel="stylesheet">
<script type="text/javascript" src="dataTables.js" charset="utf-8"></script>
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
        
        
        
        <%  String vac="";
  buscar bu=new buscar();
       HttpSession sesion=request.getSession();
       String ses=(String)sesion.getAttribute("usuario");
       if(ses==vac||ses==(null)){
     int a=JOptionPane.showOptionDialog(null,"El sitio solicita que inicie sesiòn", "Error de sesión",JOptionPane.YES_NO_OPTION, JOptionPane.INFORMATION_MESSAGE, null, null, null);
    if(a==0){ response.sendRedirect("IniciarSesion.jsp"); } 
    else{response.sendRedirect("indexDes.jsp");}
     } else{
  juego ju=new juego();
  ResultSet rs=bu.verTodosJuegos();
  %>
       </head>
    <body>
<table cellpadding="0" cellspacing="0" border="0" id="tablamia" width="100%">
<thead> 
<tr> 

<th>Juego</th> 
<th>Desarrollador</th> 
</tr> 
</thead>  
<tbody>
        <%
     while(rs.next()){
     String nom=rs.getString("nombre");
     String ur=rs.getString("imagen");
     String des=rs.getString("desarrollador");
  %>
  
                
<tr class="center"> 
<td> <div id="cuadro" class="cuadro" style="width: 130px;
    height: 170px; 
    float: right;
   background: #999999;">  
 <a href="verReclamos.jsp?juego=<%=nom%>"><br/><font color="red"><%=nom%><br/>
 <img class="min" src="http://localhost/Imagenes/<%=ur%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
   				
</a>
       </div></td> 


<td style="float: right;"><%=des%></td>     
             </tr> 
             
             <%}%>
</tbody>
<tfoot>

</tfoot>
</table>
    </body>
    <%}%>
</html>

