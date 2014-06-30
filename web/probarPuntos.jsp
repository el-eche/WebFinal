<%-- 
    Document   : probarPuntos
    Created on : 25/06/2014, 11:22:59 PM
    Author     : pico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="jRatingjquery.css" media="screen" />
<!-- jQuery files -->
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="jRatingjquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
      // simple jRating call
      $(".basic").jRating();
 
      // more complex jRating call
      $(".basic").jRating({
         step:true,
         length : 5, // nb of stars
         onSuccess : function(){
           alert('Success : your rate has been saved :)');
         }
       });
 
      // you can rate 3 times ! After, jRating will be disabled
      $(".basic").jRating({
         canRateAgain : true,
         nbRates : 3
       });
 
      // get the clicked rate !
      $(".basic").jRating({
        onClick : function(element,rate) {
         alert(rate);
        }
      });
});
</script>
    </head>
    <body>
      <div class="exemple">
 
   <!-- in this exemple, 12 is the average and 1 is the id of the line to update in DB -->
   <div class="basic" data-average="12" data-id="1"></div>
 
    <!-- in this other exemple, 8 is the average and 2 is the id of the line to update in DB -->
    <%--  <div class="basic" data-average="8" data-id="2"></div>--%>
 
</div>
    </body>
</html>
