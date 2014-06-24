<%-- 
    Document   : trearJuego
    Created on : 12/05/2014, 02:40:38 PM
    Author     : pico
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="Logica.*"%>
<%@page import="conexion.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
        <title>TPlayStore|Buscar Juegos</title>
        <link type="text/css" href="EstiloPruebas.css" rel="stylesheet">
         <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script>
         <script type="text/javascript">
           $(document).ready(function(){
    $("select[name=select1]").change(function(){
           juego=$('select[name=select1]').val();
           nombre=document.getElementById("oculto").value;
          var ajax_data = {
  "juego"     : juego,
  "nombre"   : nombre,

};
           $.ajax({
               url:"ordenarJuegos.jsp",
               type:"POST",
               data:ajax_data,
               success:function (data){
               $("#tamaño2").fadeIn(1000).html(data);    
               }
               
           });
        });
        $("select[name=select2]").change(function(){
            juego=$('select[name=select2]').val();
            nombre=document.getElementById("oculto").value;
            dataString='juego='+juego+'oculto='+nombre;
      var ajax_data = {
  "juego"     : juego,
  "nombre"   : nombre,

};
           $.ajax({
               url:"ordenarJuegos.jsp",
               type:"POST",
               data:ajax_data,
               success:function (data){
               $("#tamaño2").fadeIn(1000).html(data);    
               }
               
           });
        });

});
         </script>
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
        String nom=request.getParameter("criterio");
        int cont=0;
        ResultSet rs,sr;
        juego ju=new juego();
        sr=bu.juegoAutoNombre(nom);
        rs=bu.juegoAutoNombre(nom);
        while(sr.next()){
        cont++;
        }%>
          <div id="resultado" class="resultado" style="background: #999999;float: left;width: auto;-webkit-border-radius: 40px;-moz-border-radius: 40px;border-radius: 40px;">       
        <h2>Resultados para <%=nom%> (<%=cont%> resultados)</h2></div>
        <input type="text" id="oculto" name="oculto" value="<%=nom%>" hidden="">
        <div style="  position: absolute;top: 70px;left: 100px;width: 600px;
 height: auto;
 background: #999999;
 opacity: 0.9;">Ordenado por <select name="select1"><option value="Alfabetica">Alfabeticamente(a-z)</option>
                <option value="Ventas">Por ventas (desc)</option></select>&nbsp;&nbsp;Precio<select name="select2"><option value="menostres">$0 - 3</option>
                
                    <option value="menosdiez">$3 - $10</option><option value="masdiez">Mas de $10</option></select></div>  
        
        <div id="tamaño2" style="  position: absolute;
    top: 90px;
    left: 100px;
 width: 600px;
 height: 360px;
 background: #145675;
 opacity: 0.9;
 overflow: scroll;">
             
 <%--  <div class="ribbon"><div class="ribbon-stitches-top"></div><strong class="ribbon-content"><h1>Resultados para <%=nom%> (<%=cont%> resultados) </h1></strong><div class="ribbon-stitches-bottom"></div></div>           
    --%>         
        <%while(rs.next()){
            String nombre=rs.getString("nombre");
            String ur=rs.getString("imagen");
            double pre=rs.getDouble("precio");
            int num=bu.numeroJuego(nombre);
            ResultSet otrosr=bu.traerCat(num);
            
        %>
        
          <div id="divotromarcar" class="divotromarcar">  
 <br/><font color="red"><%=nombre%><br/>
 <img class="min" src="http://localhost/Imagenes/<%=ur%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
 <br/><font color="red">Precio u$u<%=pre%> /<%while(otrosr.next()){
            String cate=otrosr.getString("tipo");%><%=cate%> ,<% }//fin while otrosr%>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
     <br/> </div>&nbsp;&nbsp;
      
           <%  
   }//fin while rs
        %>
    </div> 
    </div> 
  
    
    
    
    
    <div id="pie" style="top: 600px;left: 100px;"><font id="mifuente">@2014 TPlay Store
            <font id="segundafuente"><a href="indexDes.jsp" style="color: #FFFFFF;">Home</a>
        </div> 
    </body>
</html>
