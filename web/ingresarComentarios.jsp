<%-- 
    Document   : ingresarComentarios
    Created on : 22/06/2014, 10:29:30 PM
    Author     : pico
--%>
<%@page import="conexion.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Logica.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comentarios</title>
        <link href="sistemaPuntuacion.css" type="text/css" rel="stylesheet">  
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
         <script type="text/javascript">
             function mostrarvalor1(){
                 var dato=1;
                 ajax_data="dato="+dato;
                 $.ajax({
                type: 'POST',
                url: "miservlet",
                data:ajax_data,
                success: function (data) {
                     var dat=data.toString();
                     document.getElementById("muestro").value=dat;
                    
                    
                    }
                
                 });
             }
              function mostrarvalor2(){
                 var dato=2;
                 ajax_data="dato="+dato;
                 $.ajax({
                type: 'POST',
                url: "miservlet",
                data:ajax_data,
                success: function (data) {
                      var dat=data.toString();
                     document.getElementById("muestro").value=dat;  
                    }
                
                 });
             }
              function mostrarvalor3(){
                 var dato=3;
                 ajax_data="dato="+dato;
                 $.ajax({
                type: 'POST',
                url: "miservlet",
                data:ajax_data,
                success: function (data) {
                      var dat=data.toString();
                     document.getElementById("muestro").value=dat;   
                    }
                
                 });
             }
               function mostrarvalor4(){
                 var dato=4;
                 ajax_data="dato="+dato;
                 $.ajax({
                type: 'POST',
                url: "miservlet",
                data:ajax_data,
                success: function (data) {
                      var dat=data.toString();
                     document.getElementById("muestro").value=dat;  
                    }
                
                 });
             }
               function mostrarvalor5(){
                 var dato=5;
                 ajax_data="dato="+dato;
                 $.ajax({
                type: 'POST',
                url: "miservlet",
                data:ajax_data,
                success: function (data) {
                      var dat=data.toString();
                     document.getElementById("muestro").value=dat;   
                    }
                
                 });
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
   int uno=1,dos=2,tres=3,cuatro=4,cinco=5;
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
          <a href="MiPerfil.jsp">Mi perfil<img src="http://localhost/Imagenes/<%=ima%>" class="otromin"></a>
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
                <form id="form" action="procesarComentario" method="post">
                    <input type="text" name="juego" value="<%=juego%>" hidden="">
                    Respuesta a Comentario :<input type="text" class="texto" id="idcom" name="idcom" value="0">
                    <br>Fecha Comentario :<input type="date" name="fecha" required="required">
                  <br>Texto Comentario :<textarea type="text" class="texto" id="comentario" name="comentario" required="required" cols="22" rows="5"></textarea>
                           Sistema de Puntuacion
<div class="ec-stars-wrapper">
        <a href="#" onclick="mostrarvalor1();" title="Votar con 1 estrellas">&#9733;</a>
        <a href="#" onclick="mostrarvalor2();" title="Votar con 2 estrellas">&#9733;</a>
        <a href="#" onclick="mostrarvalor3();" title="Votar con 3 estrellas">&#9733;</a>
        <a href="#" onclick="mostrarvalor4();" title="Votar con 4 estrellas">&#9733;</a>
        <a href="#" onclick="mostrarvalor5();" title="Votar con 5 estrellas">&#9733;</a>
        
 <input type="text" id="muestro" readonly="" style="width: 10px;" name="muestro">

</div>

                    
                    <input type="submit" class="texto" value="Enviar Comentario">
               
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
            
            
            
            
            <div id="resto">
            <h4>
        <br/>  Comentarios : <br/>
   <ul id="expList">  
        <%  
      
          int jue=bu.numeroJuego(juego);    
     ArrayList<comentario> comenta=bu.comentarioXjuego(jue);

              for(comentario Comentario: comenta){
  int com=Comentario.getId_juego();
   String texto=Comentario.getTexto();
   String fecha=Comentario.getFecha();
   String cliente=Comentario.getCliente();
   int puntaje=Comentario.getTotal();
   
   %>
        
              
   <li class="expandIcon">Nº comentario :<%=com%>&nbsp;&nbsp;&nbsp;Usuario :<%=cliente%>&nbsp;&nbsp; Comentario : <%=texto%>&nbsp;&nbsp; Fecha :<%=fecha%>&nbsp;&nbsp;Puntaje :<%=puntaje%>de 5 estrellas.  
   
                 <% ArrayList<comentario> coment=bu.comentarioHijos(com); 
           %>

           
          
                 <%     if(coment!=null){%>
                <ul>  
             <%
                     
                     for(comentario Comenta: coment){ 
             int come=Comenta.getId_juego();
              cliente=Comenta.getCliente();
              texto=Comenta.getTexto();
              fecha=Comenta.getFecha();
              puntaje=Comenta.getTotal();
                  %>
<li class="expandIcon">Nº comentario :<%=come%>&nbsp;&nbsp;&nbsp; Usuario :<%=cliente%>&nbsp;&nbsp;  Comentario : <%=texto%>&nbsp;&nbsp;  Fecha :<%=fecha%>&nbsp;&nbsp;Puntaje :<%=puntaje%>de 5 estrellas. 
    
      

 <% ArrayList<comentario> comentar=bu.comentarioHijos(come); 
           %>

           
          
                 <%     if(comentar!=null){%>
                <ul>  
             <%
                     
                     for(comentario Comentar: comentar){ 
             int idcom=Comentar.getId_juego();
              cliente=Comentar.getCliente();
              texto=Comentar.getTexto();
              fecha=Comentar.getFecha();
              puntaje=Comentar.getTotal();
                  %>
<li class="expandIcon">Nº comentario :<%=idcom%>&nbsp;&nbsp;&nbsp;Usuario : <%=cliente%>&nbsp;&nbsp; Comentario :  <%=texto%>&nbsp;&nbsp;  Fecha :<%=fecha%>&nbsp;&nbsp;Puntaje :<%=puntaje%>de 5 estrellas.
    
    
    <% ArrayList<comentario> comentari=bu.comentarioHijos(idcom); 
           %>

           
          
                 <%     if(comentari!=null){%>
                <ul>  
             <%
                     
                     for(comentario Comentari: comentari){ 
             int idcome=Comentari.getId_juego();
              cliente=Comentari.getCliente();
              texto=Comentari.getTexto();
              fecha=Comentari.getFecha();
              puntaje=Comentari.getTotal();
                  %>
<li class="expandIcon">Nº comentario :<%=idcome%>&nbsp;&nbsp;&nbsp; Usuario :    <%=cliente%>&nbsp;&nbsp;  Comentario : <%=texto%>&nbsp;&nbsp;  Fecha :<%=fecha%>&nbsp;&nbsp;Puntaje :<%=puntaje%>de 5 estrellas.

    
    <% ArrayList<comentario> comentarios=bu.comentarioHijos(idcome); 
           %>

           
          
                 <%     if(comentarios!=null){%>
                <ul>  
             <%
                     
                     for(comentario Comentarios: comentarios){ 
             int idcomen=Comentarios.getId_juego();
              cliente=Comentarios.getCliente();
              texto=Comentarios.getTexto();
              fecha=Comentarios.getFecha(); 
              puntaje=Comentarios.getTotal();
                  %>
<li class="expandIcon">Nº comentario :<%=idcomen%>&nbsp;&nbsp;&nbsp;   Usuario :  <%=cliente%>&nbsp;&nbsp;  Comentario : <%=texto%>&nbsp;&nbsp;  Fecha :<%=fecha%>&nbsp;&nbsp;Puntaje :<%=puntaje%>de 5 estrellas.

         
    
        <% ArrayList<comentario> comentarioso=bu.comentarioHijos(idcomen); 
           %>

           
          
                 <%     if(comentarioso!=null){%>
                <ul>  
             <%
                     
                     for(comentario Comentarioso: comentarioso){ 
             int idcoment=Comentarioso.getId_juego();
              cliente=Comentarioso.getCliente();
              texto=Comentarioso.getTexto();
              fecha=Comentarioso.getFecha();
              puntaje=Comentarioso.getTotal();
                  %>
<li class="expandIcon">Nº comentario :<%=idcoment%>&nbsp;&nbsp;&nbsp;   Usuario :  <%=cliente%>&nbsp;&nbsp;  Comentario : <%=texto%>&nbsp;&nbsp;  Fecha :<%=fecha%>&nbsp;&nbsp;Puntaje :<%=puntaje%>de 5 estrellas.

         
    
        <% ArrayList<comentario> comentariosos=bu.comentarioHijos(idcoment); 
           %>

           
          
                 <%     if(comentariosos!=null){%>
                <ul>  
             <%
                     
                     for(comentario Comentariosos: comentariosos){ 
             int idcomenta=Comentariosos.getId_juego();
              cliente=Comentariosos.getCliente();
              texto=Comentariosos.getTexto();
              fecha=Comentariosos.getFecha();
              puntaje=Comentariosos.getTotal();
                  %>
<li class="expandIcon">Nº comentario :<%=idcomenta%>&nbsp;&nbsp;&nbsp;   Usuario :  <%=cliente%>&nbsp;&nbsp;  Comentario : <%=texto%>&nbsp;&nbsp;  Fecha :<%=fecha%>&nbsp;&nbsp;Puntaje :<%=puntaje%>de 5 estrellas.

         
    
    

                            </li> <%}//fin 7 for y idcomenta%> 
        
             
                     </ul><%}//fin if comentariosos%>
    
    
    
    

                            </li> <%}//fin 6 for y idcoment%> 
        
             
                     </ul><%}//fin if comentarioso%>

                            </li> <%}//fin 5 for y idcomen%> 
        
             
                     </ul><%}//fin if comentarios%>
        

    
                            </li> <%}//fin 4 for y idcome%> 
        
             
                     </ul><%}//fin if comentar%>
   
                            </li> <%}//fin 3 for y idcom%> 
        
             
                     </ul><%}//fin if comentar%>

                           </li> <%}//fin 2 for y come%> 
        
             
                     </ul><%}//fin if coment%>
        
                         </li>  <%}//fin 1 for y li com %>
                   </ul> 
                   </h4>
</div>
                   
     </div>              
                   
                   
     
                   
                   
       <div id="pie" style="top: 600px;left: 100px;"><font id="mifuente">@2014 TPlay Store
            <font id="segundafuente"><a href="indexDes.jsp" style="color: #FFFFFF;">Home</a>
        </div>             
                   
                   
    </body>
</html>
