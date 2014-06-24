<%-- 
    Document   : verReclamos
    Created on : 24/06/2014, 06:34:12 PM
    Author     : pico
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Logica.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comentarios</title>
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
    </head>
    <body>
  
        <div id="cabezera"><img src="http://localhost/Imagenes/iconoJuego.png"><img src="http://localhost/Imagenes/TPlay.jpg">
            <div id="buscar"> <form name="juegos" action="traerJuego.jsp" method="post">
                    <table> <tr>    <td><input type="text" name="criterio" class="criterio" id="criterio" style="width: 100px;border-radius: 25px;" placeholder="Buscar juegos :"/></td>
<%--<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">--%>
                            <td><input type="image" src="http://localhost/Imagenes/lupaBuscar.jpg" width="30" height="25" style="position: absolute; top: 3px;"> </td> 
 </tr></table>       
    </form></div>
      
                            

       
         
        <%
            buscar bu=new buscar();
            HttpSession se=request.getSession(true);
            String us=(String)se.getAttribute("usuario");
            String juego=request.getParameter("juego");
 
       if(us==null||us==""){%>
  <div id="inSesion">
            <a href="IniciarSesion.jsp"> Crear Cuenta :<img src="http://localhost/Imagenes/Registrarse.png" width="20" height="20"></a><br><br>
                <a href="IniciarSesion.jsp"> Iniciar Sesion :<img src="http://localhost/Imagenes/sesion.png" width="20" height="20"></a> 
                   </div>
       <%}else
       {
       perfil per=bu.verEspecifico(us);
       String ima=per.getImagen();
       %>
      <div id="iniciarSesion" style="float: right; height: 500px"> 
          <a href="FinSession"> Cerrar Sesion :<img src="http://localhost/Imagenes/cerrar-sesion-icono.png" class="otromin"></a><br><br>  
          <a href="MiPerfil.jsp">Mi perfil :<img src="http://localhost/Imagenes/<%=ima%>" class="otromin"></a>
      </div> 
           
       <%}%>
    
     <div id="inicio" style="top: 100px;left: 120px;"><a href="indexDes.jsp" style="color: #FFFFFF;">
                <img id="mifoto" src="http://localhost/Imagenes/home.png" class="otromin">
                <font style="position: absolute; top:15px;left: 30px;">Inicio</a></div>
          <div id="reloj" class="reloj" style="position: absolute;left: 750px;top: 100px;">
              <embed src="http://www.clocklink.com/clocks/5005-white.swf?TimeZone=UYT&"  width="140" height="50" wmode="transparent" type="application/x-shockwave-flash">
          </div>
   </div>
        
        
        
        
        
        
        
        
        
        
        
        
        <div id="medio">
            <div id="categoria">
                   
            </div>
            
            
            
            
            <div id="resto">
               <table cellpadding="0" cellspacing="0" border="0" id="tablamia" width="100%">
           <thead> 
<tr> 

<th>ID Reclamo</th> <th>ID Juego</th> <th>ID Version</th> 
<th>Cliente</th> <th>Fecha</th> <th>Categoria</th> <th>Texto</th>
</tr> 
</thead>  
<tbody>
       <%
       ResultSet rs;
         int numj=bu.numeroJuego(juego);
         rs=bu.traerReclamos(numj);
         while(rs.next()){
        int id_rec=rs.getInt("id_reclamo");
        int id_juego=rs.getInt("id_juego");
        String id_version=rs.getString("id_version");
        String texto=rs.getString("texto");
        String categoria=rs.getString("categoria");
        String cliente=rs.getString("cliente");
        String fecha=rs.getString("fecha");%>
        <tr>
            <td><%=id_rec%></td> <td><%=id_juego%></td>
            <td><%=id_version%></td><td><%=cliente%>
            </td><td><%=fecha%></td>
            <td><%=categoria%></td><td><%=texto%></td> 
        </tr> 
                
                
                <%
        
         }
       %>
   </tbody>
                </table>
            </div>              
                   
                   
     
                   
                   
       <div id="pie" style="top: 600px;left: 100px;"><font id="mifuente">@2014 TPlay Store
            <font id="segundafuente"><a href="indexDes.jsp" style="color: #FFFFFF;">Home</a>
        </div>             
                   
                   
    </body>
</html>
