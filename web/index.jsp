<%-- 
    Document   : index
    Created on : 19/06/2014, 10:41:36 PM
    Author     : pico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link href="sistemaPuntuacion.css" type="text/css" rel="stylesheet">  
        <link type="text/css" href="EstiloPruebas.css" rel="stylesheet"> 
       <link type="text/css" href="estiloTabla.css" rel="stylesheet">
       <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script> 
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
            <div id="medio">
            <div id="categoria">
                <%String juego="Angry Birds";%>
                <form id="form" action="boorrarr" method="post">
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
            </div>
    </body>
</html>
