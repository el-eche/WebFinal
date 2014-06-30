<%-- 
    Document   : probarRaty
    Created on : 27/06/2014, 08:05:44 PM
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
       <script language="JavaScript" type="text/javascript" src="jquery.raty.min.js" charset="utf-8"></script>   
<script type="text/javascript">
            $(document).ready(function() {
              $('#radio').raty({
                  target:'#score',
                  targetKeep:true,
                targetType:'numero',
                  
              });  

});
        </script>
    </head>
    <body>
        <form action="borrar" method="post">
        <h3>Mostrar Bien</h3>
        <div id="radio"> </div>
        <span id="live"></span>
       
<select id="score" >
<option value=""> 0 </ option>
<option value="1"> 1 </ option>
<option value="2"> 2 </ option>
<option value="3"> 3 </ option>
<option value="4"> 4 </ option>
<option value="5"> 5 </ option>
</select>
        <input type="submit">
       </form> 
        <%--      --%>
        

    </body>
</html>
