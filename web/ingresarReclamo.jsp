<%-- 
    Document   : ingresarReclamo
    Created on : 23/06/2014, 07:42:05 PM
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
           <link type="text/css" href="EstiloPruebas.css" rel="stylesheet"> 
       <link type="text/css" href="estiloTabla.css" rel="stylesheet">
       <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script> 
              <script type="text/javascript">
function prepareList() {
    jQuery('#expList').find('li:has(ul)')
    .addClass('el_collapsed')
    .children('ul').hide();
    jQuery('#expList').find('.expandIcon')
    .click( function(evt) {
        if (this == evt.target) {
            jQuery(this).toggleClass('el_expanded');
            jQuery(this).children('ul').toggle('medium');
        }
        // Impedir la propagación de eventos
        if (!evt) var evt = window.event;
        evt.cancelBubble = true; // in IE
        if (evt.stopPropagation) evt.stopPropagation();
    });
};
 
jQuery(document).ready( function() {
    prepareList()
});
      
         
</script>
<script type="text/javascript">
    function comentar(){
        var idcom=document.getElementById("idcom");
        var fecha=document.getElementById("fecha");
        var comentario=document.getElementById("comentario");
        var ajax_data={
            "idcom":idcom,
            "fecha":fecha,
            "comentario":comentario   
        };
        
    }
    
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
                <form action="procesarReclamo" method="post">
                    <input type="text" name="juego" value="<%=juego%>" hidden="hidden">
                Reclamo :<textarea name="textarea" cols="67" rows="5"></textarea><br> 
               <br> Tipo de Reclamo: <select name="seleccion"><option value="Mal Funcionamiento">Mal Funcionamiento</option>
                    <option value="Contenido Inapropiado">Contenido Inapropiado </option>
                    <option value="Facturacion Errónea">Facturacion Errónea</option>
                </select>
           <br><br> Seleccione Version :<select name="version">
                    <% 
                    
                    int num=bu.numeroJuego(juego);
                    
                    ResultSet rs;
                    rs=bu.traerVersiones(num);
                    while(rs.next()){
                    String ver=rs.getString("id_version");%>
                    <option value="<%=ver%>"><%=ver%></option> 
                   <% }
                    
                    %>
                    
 
                </select>
                    
                    <br><br> Fecha Reclamo :<input type="date" name="fecha"> 
                    
                
                    <br> <input type="submit" value="Ingresar Reclamo">
                </form>
                    
                     <div><%
                    String vac="";
                    String respuesta=request.getParameter("respuesta");
                    if(respuesta==null||respuesta.equals(vac)){
                    
                    }
                    else{
                    %>
                   <h4>
                       <%=respuesta%>
                    </h4>
                        <%
                    }
                    %></div>
     </div>              
                   
                   
     
                   
                   
       <div id="pie" style="top: 600px;left: 100px;"><font id="mifuente">@2014 TPlay Store
            <font id="segundafuente"><a href="indexDes.jsp" style="color: #FFFFFF;">Home</a>
        </div>             
                   
                   
    </body>
</html>