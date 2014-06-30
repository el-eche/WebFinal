<%-- 
    Document   : confirmarCompra
    Created on : 22/06/2014, 02:11:52 PM
    Author     : pico
--%>
<%@page import="conexion.*"%>
<%@page import="Logica.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmar Compra</title>
         <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script>
        <link type="text/css" href="EstiloPruebas.css" rel="stylesheet"> 
        <script type="text/javascript">
            function cancelarCompra(){
                window.location.href="indexDes.jsp";
            }
        </script>
        <script type="text/javascript">
            function confirmarCompra(){
                var jueg=document.getElementById("miJuego").value;
               window.location.href="confirmarCompra?juego="+jueg;
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
        <div id="inSesion">
            
   
                 <%
            String jue=request.getParameter("juego");
            HttpSession sesion=request.getSession(true);
      calculoEdad ed=new calculoEdad();
        String us=(String)sesion.getAttribute("usuario");
        perfil per=new perfil();
        buscar bu=new buscar();
        per=bu.verEspecifico(us);
        String ima=per.getImagen();
        String tip=per.getTipo();
        juego Juego=new juego();
        Juego=bu.traerJuegoUn(jue);
        String nombDes=Juego.getDesarrollador();
        String desc=Juego.getDescripcion();
        String imag=Juego.getImagen();
        double preci=Juego.getPrecio();
       %>
      
       <a href="MiPerfil.jsp">Mi perfil<img src="http://localhost/Imagenes/<%=ima%>" width="30" height="25"></a><br>
          
          <a href="FinSession"> Cerrar Sesion :<img src="http://localhost/Imagenes/cerrar-sesion-icono.png" width="30" height="30"></a><br>  
 </div>
                            
</div>
        <div id="inicio"><a href="indexDes.jsp" style="color: #FFFFFF;">
                <img id="mifoto" src="http://localhost/Imagenes/home.png" width="30" height="30">
                <font style="position: absolute; top:15px;left: 30px;">Inicio</a>     
         <div id="otrootro" style="position: absolute;left: 100px;width: 600px;">   
          <a href="#" onclick="traerMisJuegos();">Mis Compras de Juegos</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="#" onclick="traerJuegosparaComprar();">Comprar Juego</a>&nbsp;&nbsp;&nbsp;&nbsp
         <div id="reloj" class="reloj" style="position: absolute;left: 520px;top: -10px;">
              <embed src="http://www.clocklink.com/clocks/5005-white.swf?TimeZone=UYT&"  width="140" height="50" wmode="transparent" type="application/x-shockwave-flash">
          </div>
         </div>
        </div>     
        
        
        
        
        
       
       
        <div id="medio">
            <input type="text" id="miJuego" value="<%=jue%>" hidden="hidden">
            <h4> Nick Comprador: <%=us%></h4>
           <h4> Nombre Juego: <%=jue%></h4>
           <h4>   Descripcion Juego: <%=desc%></h4>
             <h4>  Precio (U$): <%=preci%></h4>
             <input type="submit" value="Confirmar Compra"  onclick="confirmarCompra()" class="texto">
              <input type="submit" value="Cancelar"  onclick="cancelarCompra()" class="texto">
        </div>
               
               
               
               
                <div id="pie"><font id="mifuente">@2014 TPlay Store
            <font id="segundafuente"><a href="indexDes.jsp">Home</a>
        </div>  
    </body>
</html>
