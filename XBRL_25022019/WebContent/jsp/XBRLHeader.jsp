<%@ page import="java.text.DateFormat,java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
<% DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
Date date = new Date();
String curdate=dateFormat.format(date);

%>

<!DOCTYPE HTML>
<html> 
<head> 
<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;url=XBRLSessionOut.jsp?autoClose=auto&userName=<%=session.getAttribute("userName")%>" /> 
<link rel="stylesheet" href="../css/bootstrap.min.css">

<script src='../jQuery/jQuery-2.2.0.min.js'></script>
</head><!--from ww w .ja  va  2 s  .co  m-->
<STYLE>

.gmd-1:hover {
  -webkit-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  -moz-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  -ms-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  -o-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
}



body {
    background: rgba(46, 68, 94, 0.32);
    font-family: calibri;
    font-size:0.8em;
    line-height: 0.528571;
}

.imglog
{
float:right;
    width: 86px;
    border:solid 1px;

}

img#zoom {
   
    -webkit-transition: all .2s ease-in-out;
    -moz-transition: all .2s ease-in-out;
    -o-transition: all .2s ease-in-out;
    -ms-transition: all .2s ease-in-out;
}
 
.transition {
    -webkit-transform: scale(2.0); 
    -moz-transform: scale(2.0);
    -o-transform: scale(2.0);
    transform: scale(2.0);
}

</STYLE>

<script>
$(document).ready(function(){
    $('#zoom').hover(function() {
        $(this).addClass('transition');
    }, function() {
        $(this).removeClass('transition');
    });
    $("#changepass").on("click",function(){
    	
        parent.frames[2].location='XBRL_ChangePassword.jsp'; 
       });
   
});
</script>

<script>
function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    var ampm = h >= 12 ? 'pm' : 'am';
    h = h % 12;
    h = h ? h : 12;
   
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('txt').innerHTML =
    h + ":" + m + ":" + s + ' '+ampm;
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}


</script>
<body onload="startTime()" oncontextmenu="return false">
<div class="row">
<div class="col-sm-4"><img src="../images/Bornfire.png" height="75" width="100" /></div>
<!-- <div class="col-sm-4"><h2 class="text-center" style="color:#0c1190;"> Team Manager</h2></div> -->

<div class="col-sm-4"><h2 class="text-center" style="color:#0c1190; font-family: GearsofPeace;"> Bornfire XBRL</h2></div>

<%-- <div class="col-sm-4" style="padding-left: 230px;padding-top: 25px;"><p ><font size="1" color="white">User Id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=session.getAttribute("userName") %></font><p><font size="1" color="white">  Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=curdate %></font></p><p><font size="1" color="white">Login Time : <b id="txt"></b></font></p></div> --%>

<div class="col-sm-4" style="padding-left: 230px;padding-top: 25px;">

<div class=" col-sm-2 ">
                <img id="zoom"  class="img-circle imglog gmd-1"
                     src="../images/<%=session.getAttribute("userName")%>.jpg" style="height: 57px;MARGIN-TOP:-11PX;"
                     alt="User Pic">
            </div>
<p ><font size="1" color="white"  style="font-family: GearsofPeace;">User Id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=session.getAttribute("userName")%>	</font><p><font size="1" color="white" style="font-family: GearsofPeace;">  Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <%=curdate %>  </font></p><%-- <p><font size="1" color="white">Login Time :  <%=session.getAttribute("logintime") %> </font></p> --%>
<a id="changepass"><font size="1" style="color:red;text-align:center;cursor:pointer;   ">Change Password</font></a></div>

    </div>    
        
   
 

   

        
</body>
</html>