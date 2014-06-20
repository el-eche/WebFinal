<%-- 
    Document   : MiPerfil
    Created on : 21/05/2014, 06:40:59 PM
    Author     : pico
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="conexion.*"%>
<%@page import="Logica.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="EstiloPruebas.css" rel="stylesheet">
        <title>Mi Perfil</title>
      <%
       String vac="";
       HttpSession sesion=request.getSession(true);
      String ses=(String)sesion.getAttribute("usuario");
       if(ses==vac||ses==(null)){
     int a=JOptionPane.showOptionDialog(null,"El sitio solicita que inicie sesiòn", "Error de sesión",JOptionPane.YES_NO_OPTION, JOptionPane.INFORMATION_MESSAGE, null, null, null);
    if(a==0){ response.sendRedirect("IniciarSesion.jsp"); } 
    else{response.sendRedirect("indexDes.jsp");}
     } else{%>
    </head>
   
    <body background="http://localhost/Imagenes/Fondos-de-pantallaPrincipal.jpg" style="background-attachment: fixed; opacity: 0.8;">
      <%
           String ti="Desarrollador";
           String cli="Cliente";
      calculoEdad ed=new calculoEdad();
        String us=(String)sesion.getAttribute("usuario");
        perfil per=new perfil();
        buscar bu=new buscar();
        per=bu.verEspecifico(us);
        String nic=per.getNick();
        String ema=per.getEmail();
        String nom=per.getNombre();
        String ape=per.getApellido();
        String fech=per.getFechanac();
       int edad=ed.getedad(fech);
        String ima=per.getImagen();
        String tip=per.getTipo();
        String desa="Desarrollador";
       
        %>
      
   <div id="cabezera"><img src="http://localhost/Imagenes/iconoJuego.png"><img src="http://localhost/Imagenes/TPlay.jpg">
            <div id="buscar"> <form name="juegos" action="traerJuego.jsp" method="post">
                    <table> <tr>    <td><input type="text" name="criterio" class="criterio" id="criterio" style="width: 100px;border-radius: 25px;" placeholder="Buscar juegos :"/></td>
<%--<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">--%>
                            <td><input type="image" src="http://localhost/Imagenes/lupaBuscar.jpg" width="30" height="25" style="position: absolute; top: 3px;"> </td> 
 </tr></table>       
    </form></div>
        <div id="inSesion">
            
           <%
       
      tip=per.getTipo();
       %>
      
       <a href="MiPerfil.jsp">Mi perfil<img src="http://localhost/Imagenes/<%=ima%>" width="30" height="25"></a><br>
          
          <a href="FinSession"> Cerrar Sesion :<img src="http://localhost/Imagenes/cerrar-sesion-icono.png" width="30" height="30"></a><br>  
 </div>
                            
</div>
        <div id="inicio"><a href="indexDes.jsp" style="color: #FFFFFF;">
                <img id="mifoto" src="http://localhost/Imagenes/home.png" width="30" height="30">
                <font style="position: absolute; top:15px;left: 30px;">Inicio</a>
        
        <%if(tip.equals(ti)){%>    
           
           <div id="otro" style="position: absolute;left: 100px;width: 600px;">
          <a href="altaJuego.jsp" >Agregar Juegos Nuevo</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="AltaVersion.jsp" >Alta Version Nueva</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="#" onclick="traerMisJuegos();">Todos mis Juegos</a> 
          <div id="reloj" class="reloj" style="position: absolute;left: 520px;top: -10px;">
              <embed src="http://www.clocklink.com/clocks/5005-white.swf?TimeZone=UYT&"  width="140" height="50" wmode="transparent" type="application/x-shockwave-flash">
          </div>
           
           </div>
           <%}else if(tip.equals(cli)){%>     
         <div id="otrootro" style="position: absolute;left: 100px;width: 600px;">   
          <a href="#" onclick="traerMisJuegos();">Mis Compras de Juegos</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="#" onclick="traerJuegosparaComprar();">Comprar Juego</a>&nbsp;&nbsp;&nbsp;&nbsp
         <div id="reloj" class="reloj" style="position: absolute;left: 520px;top: -10px;">
              <embed src="http://www.clocklink.com/clocks/5005-white.swf?TimeZone=UYT&"  width="140" height="50" wmode="transparent" type="application/x-shockwave-flash">
          </div>
         </div>
      <%}%> 
        </div>     
        
        
        
       
        
        
        <div id="medio">  
        <h2>Mis Datos</h2>
        <div id="mostrar" style="float:left; height:auto;position: absolute; ">
            <h4>Nick : <%=nic%></h4>
            <h4>Correo Electronico : <%=ema%></h4>
            <h4>Nombre : <%=nom%></h4>
            <h4>Apellido : <%=ape%></h4>
            <h4>Tipo de Usuario: <%=tip%></h4>
            <h4>Fecha de Nacimiento : <%=fech%></h4>
            <h4>Edad : <%=edad%></h4>
            
        <%
        
        if(per.getTipo().equals(desa)){
        String web=per.getLinkweb();
        ResultSet rs,otrors;
        int jue;
        rs=bu.juegoXdesarrollador(nic);
        while(rs.next()){
        jue=rs.getInt("id_juego");
       String nomju=rs.getString("nombre");
        %>
                        <table>
            <%
            String pendiente="Pendiente";
            String rechazada="Rechazada";
        otrors=bu.traerVersiones(jue);
        while(otrors.next()){
        String idv=otrors.getString("id_version");
        String est=otrors.getString("estado");
        String mot=otrors.getString("rechazo");
        if(est.equals(pendiente)||est.equals(rechazada)){%>
        <tr>
                 <td><h4>Nombre Juego <%=nomju%></h4></td></tr>
                                   
 <tr> <td>   <h4>Version :<%=idv%></h4></td>
            <td><h4>Estado :<%=est%></h4></td>&nbsp;&nbsp;<%
            if(est.equals(rechazada)){
            %>
            <td><h4>&nbsp;  Motivo : <%=mot%></h4></td></tr>
                                    
            <%}
        
        }
        }
        }
       
        }
    %>  
  </tr></table>
        </div>
  </div> 
    <div id="paraImagen" style="position: absolute;top: 200px;left: 500px;"><h4>Imagen <img src="http://localhost/Imagenes/<%=ima%>" width="80" height="80"/></h4></div>
  
  
  
  
     <div id="pie"><font id="mifuente">@2014 TPlay Store
            <font id="segundafuente"><a href="indexDes.jsp" style="color: #FFFFFF;">Home</a>
        </div> 
  
    </body>
   <%} %>
</html>
