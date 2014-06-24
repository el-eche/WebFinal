<%-- 
    Document   : mostrar
    Created on : 28/05/2014, 10:18:09 PM
    Author     : pico
--%>

<%@page import="conexion.*"%>
<%@page import="Logica.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TPlayStore|Alta de Version</title>
       <link type="text/css" href="EstiloPruebas.css" rel="stylesheet">
     <%
        HttpSession sesion=request.getSession(true);
        String use=(String)sesion.getAttribute("usuario");
        buscar bu=new buscar();
        String tipo="";
        String ti="Desarrollador";
        String cli="Cliente";
        
        %>
    </head>
    <body>
        <div id="cabezera"><img src="http://localhost/Imagenes/iconoJuego.png"><img src="http://localhost/Imagenes/TPlay.jpg">
            <div id="buscar"> <form name="juegos" action="traerJuego.jsp" method="post">
                    <table> <tr>    <td><input type="text" name="criterio" class="criterio" id="criterio" style="width: 100px;border-radius: 25px;" placeholder="Buscar juegos :"/></td>
<%--<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">--%>
                            <td><input type="image" src="http://localhost/Imagenes/lupaBuscar.jpg" width="30" height="25" style="position: absolute; top: 3px;"> </td> 
 </tr></table>       
    </form></div>
        <div id="inSesion">
            
           <%
       if(use==null||use==""){%>
       
                <a href="IniciarSesion.jsp"> Crear Cuenta :<img src="http://localhost/Imagenes/Registrarse.png" width="30" height="30"></a><br>
                <a href="IniciarSesion.jsp"> Iniciar Sesion :<img src="http://localhost/Imagenes/sesion.png" width="30" height="30"></a><br>  
                 
       <%}else
       {
       perfil per=bu.verEspecifico(use);
       String ima=per.getImagen();
      tipo=per.getTipo();
       %>
      
       <a href="MiPerfil.jsp">Mi perfil<img src="http://localhost/Imagenes/<%=ima%>" width="30" height="25"></a><br>
          
          <a href="FinSession"> Cerrar Sesion :<img src="http://localhost/Imagenes/cerrar-sesion-icono.png" width="30" height="30"></a><br>  
 
           
       <%}%>   </div>
                            
</div>
        <div id="inicio"><a href="indexDes.jsp" style="color: #FFFFFF;">
                <img id="mifoto" src="http://localhost/Imagenes/home.png" width="30" height="30">
                <font style="position: absolute; top:15px;left: 30px;">Inicio</a>
        
        <%if(tipo.equals(ti)){%>    
           
           <div id="otro" style="position: absolute;left: 100px;width: 600px;">
          <a href="altaJuego.jsp" >Agregar Juegos Nuevo</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="AltaVersion.jsp" >Alta Version Nueva</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="#" onclick="traerMisJuegos();">Todos mis Juegos</a> 
          <div id="reloj" class="reloj" style="position: absolute;left: 520px;top: -10px;">
              <embed src="http://www.clocklink.com/clocks/5005-white.swf?TimeZone=UYT&"  width="140" height="50" wmode="transparent" type="application/x-shockwave-flash">
          </div>
           
           </div>
           <%}else if(tipo.equals(cli)){%>     
         <div id="otrootro" style="position: absolute;left: 100px;width: 600px;">   
          <a href="#" onclick="traerMisJuegos();">Mis Compras de Juegos</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="#" onclick="traerJuegosparaComprar();">Comprar Juego</a>&nbsp;&nbsp;&nbsp;&nbsp
         <div id="reloj" class="reloj" style="position: absolute;left: 520px;top: -10px;">
              <embed src="http://www.clocklink.com/clocks/5005-white.swf?TimeZone=UYT&"  width="140" height="50" wmode="transparent" type="application/x-shockwave-flash">
          </div>
         </div>
      <%}else{%>
      <div style="position: absolute;top: -30px;left: 100px;width: 500px;">
      <h4 >Para utilizar todas las funcionalidades de este sitio debes
    <a href="IniciarSesion.jsp"> iniciar sesion</a> ó<a href="IniciarSesion.jsp"> crear una cuenta</a>. Gracias </h4>
      <div id="reloj" class="reloj" style="position: absolute;left: 520px;top: 20px;">
              <embed src="http://www.clocklink.com/clocks/5005-white.swf?TimeZone=UYT&"  width="140" height="50" wmode="transparent" type="application/x-shockwave-flash">
          </div>
      </div>           

<%}%> 
        </div>
        
        <div id="medio">
        <%
        String nom=request.getParameter("juego");
        juego ju=new juego();
        ju=bu.traerJuegoUn(nom);
        String nombre=ju.getNombre();
        String ur=ju.getImagen();
        %>
      
        <div id="solo" style="top: 150px;left: 400px;">
                <div id="marcar" class="marcar">  
                       <a href="#"><br/><font color="red"><%=nom%><br/>
                    <img class="min" src="http://localhost/Imagenes/<%=ur%>" 
                         onmouseover="this.style.opacity = 0.5" onmouseout="this.style.opacity = 1"  alt="#"/>
                    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
                     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
                </a>
            </div>
        </div><br>
                <form name="alta" action="altaVersion" method="post">
                <br>Numero de version :<input type="text" name="version">
                <br>Tamaño de versión :<input type="text" name="tama">
               <br> Link de descarga :<input type="text" name="descarga">
               <br> Orden alta :<input type="text" name="alta">
                <input type="text" name="nombre" hidden="" value="<%=nombre%>">
                <br> <input type="submit" value="Alta Version" class="texto">
                </form>
                </div>
                
                <div id="pie"><font id="mifuente">@2014 TPlay Store
            <font id="segundafuente"><a href="indexDes.jsp" style="color: #FFFFFF;">Home</a>
        </div> 
    </body>
</html>
