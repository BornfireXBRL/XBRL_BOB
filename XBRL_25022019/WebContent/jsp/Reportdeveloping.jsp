<%@ page contentType="text/html; charset=UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>
<%--<%@page	import="notification.NotificationExample,notification.SelectAlert,java.util.ArrayList,java.util.Iterator,dao.NullCheck"%> --%>
<%-- <%@page	import="../application.jsp %> --%>

<html>
<head>
<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;url=XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 

<!--  <meta http-equiv="refresh" content="url=BTMLogout.jsp" /> -->
<title>Bornfire Innovations - Team Manager</title>
<link rel="stylesheet" type="text/css" href="<s:url value="/css/Styles.css"/>">

<script src="../jQuery/jQuery-2.2.0.min.js"></script>

<!-- <link rel="stylesheet"
	href="https://github.com/mouse0270/bootstrap-notify"> -->
 <script src="../js/notify.js"></script>  
<!-- <meta http-equiv="refresh" content="5">   -->
<script src="../js/notify.min.js"></script>  
<%-- <script src="../chat.window.js"></script>   --%>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/sweetalert2/5.3.8/sweetalert2.js"></script>
<link href="https://cdn.jsdelivr.net/sweetalert2/5.3.8/sweetalert2.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
 body
        {
            background:url('../images/webunddev.jpg') no-repeat center;            
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


</style>

<script>

$(document).ready(function(){


	//parent.frames[2].location='application.jsp';
	
	
	
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
<body >

     
  
</body>
</html>