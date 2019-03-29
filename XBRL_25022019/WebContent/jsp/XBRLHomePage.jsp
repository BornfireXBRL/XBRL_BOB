<%@ page contentType="text/html; charset=UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>
<%--<%@page	import="notification.NotificationExample,notification.SelectAlert,java.util.ArrayList,java.util.Iterator,dao.NullCheck"%> --%>
<%-- <%@page	import="../application.jsp %> --%>

<html>
<head>
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
 
<!--  <meta http-equiv="refresh" content="url=BTMLogout.jsp" /> -->
<title>Bornfire Innovations - Team Manager</title>
<link rel="stylesheet" type="text/css" href="<s:url value="/css/Styles.css"/>">

<link rel="stylesheet" href="../CSS/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="../jQuery/jQuery-2.2.0.min.js"></script>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>


.gmd-1:hover {
  -webkit-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  -moz-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  -ms-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  -o-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
}

 body
        {
            background:url('../images/XBRL.png') no-repeat center;            
			/*background-color: beige;*/
            background-size: 300px 300px;           
            margin: 0;
            padding: 0;
            
            
        }





.notifyjs-happyblue-base {
  white-space: nowrap;
  background-color: lightblue;
  padding: 5px;
}
.notifyjs-happyblue-superblue {
  color: white;
  background-color: blue;
}

.container1
{
padding:4px 2px;
border: 1px outset;
width: 388px;
height:180px;
background-color: #e4dfdf;
margin:0 auto;
margin-top: 75px;
border-radius: 10px;
display:none;
position: absolute;
right: 425px;
top:85px;
transition: opacity .25s ease;
 z-index: 99999;
  -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.5s;
    animation-name: animatetop;
    animation-duration: 0.5s
}
</style>

<script>

$(document).ready(function(){


	//parent.frames[2].location='application.jsp';
	
	$.ajax({
		url : "checknodays",
		dataType : 'json',
		contentType : 'application/json',
		type : 'POST',
		async : true,
		success : function(res) {	
			if(res.countdays<7){
				$("#message").html("Your Password Expires within "+res.countdays+" Days.<br> Do you want to change?");
				$(".container1").modal('toggle');
			}
		}
	});
	$("#btnproceed").on("click",function(){
		location.href="XBRL_ChangePassword.jsp";
	});
	$.ajax({
		url : "notifi",
		//data : {"pre" : $(this).prev().html()},
		dataType : 'json',
		contentType : 'application/json',
		type : 'POST',
		async : true,
		success : function(res) {	
			//alert("hiiiijj"+trList);
			var b=JSON.parse(res.msgliteral);
			console.log(b);	
			
			for ( var i = 0; i < b.length; i++)	 { 
				//alert("HAII");		
				//alert(b[i].message);
				$.notify(b[i].message, "info");
						}
			
				}
		
		
	});
	
	

	 window.setTimeout(function() {
		    $(".alert").fadeTo(100, 0).slideUp(200, function(){
		        $(this).remove(); 
		    });
		}, 400);
	 
	 
});


</script>




</head>
<body class="gmd-1" >

     <div class="container1" style="display:none;" data-backdrop="static" data-keyboard="false">
<span style="color: red;" id="key1" ><font size="1"  class="errormsg" ></font></span> <span class="close" data-dismiss="modal">&times;&nbsp;&nbsp;</span><br> 
<h4 style="margin-left:10px;font-family: Calibri;background-color:#e4dfdf"><b>Password Expiry Alert</b></h4>
<div style="padding-left: 25px;"><font style="" id="message"></font></div>
 <div class="modal-footer" style="    padding-right: 140px;"><button type="button"  class="btn btn-primary btn-xs" id="btnproceed" >Change</button>
 <button type="button"  class="btn btn-primary btn-xs" data-dismiss="modal" id="btnclose">Cancel</button></div>


</div>
  
</body>
</html>