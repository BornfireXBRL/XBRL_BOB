<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%-- <meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;url=../XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" /> --%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">




<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>BACP</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
 <link href="../CSS/bootstrap.min.css" rel="stylesheet">
 <link href="../CSS/bootstrap.css" rel="stylesheet">
 <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

 <script src="../jQuery/jQuery-2.2.0.min.js"></script>
<script src="../JS/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  <link href="../CSS/bootstrap.min.css" rel="stylesheet">  -->
<link href="../CSS/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="../CSS/bootstrap-datepicker.css" />
 <script src="../JS/bootstrap-datepicker.js"></script>
 <script type="text/javascript" src="../JS/TimePicker/jquery-ui-timepicker-addon.js"></script>
 <link rel="stylesheet" media="all" type="text/css" href="../JS/TimePicker/jquery-ui-timepicker-addon.css" />


	
	
<!-- <script src="../JS/jquerydatepicker.js"></script> -->
<!-- <script src="../JS/bootbox.min.js"></script>   -->

</head>
<style>
body {
	font-family: Arial;
	background-color: #eee;
	 overflow-x:hidden;
	 
	   width: auto;
}

.form-control {
	height: 20px;
	border: 1px solid #6b6a6a;
	width: 170px;
	font-size: 11px;
	padding: 3px 12px;
}

.form-horizontal .control-label {
	text-align: left;
	padding-top: 0px;
}

textarea.form-control {
	height: 20px;
}

.form-horizontal .form-group {
	margin-top: -13px;
	margin-right: -93px;
	margin-left: -15px;
}

.panel-heading {
    padding: 0px 18px;
    padding-top: 3px;
    /* padding-right: 838px; */
    margin-left: 0px;
}

.text-center {
	text-align: -webkit-left;
}

.modal-footer {
	text-align: center;
	border-top: 0;
	padding: 25px;
	padding-right: 208px;
}

.panel-body {
	width: 1200px;
}

.btn {
	width: 50px;
}

.glyphicon {
    top: 4px;
    margin-left: 92px;
}

.tab-content {
    width: 78%;
    margin-left: 101px;
}

fieldset.scheduler-border {
	width: 840px;
	border: 1px groove #ddd !important;
	/*  padding:-1px 1.4em 1.4em !important;
    margin: 0 0 1.5em 40px !important; */
	margin-left: 111px;
	-webkit-box-shadow: 0px 0px 0px 0px #000;
	box-shadow: 0px 0px 0px 0px #000;
}

.dash-heading {
	float: right;
	padding-bottom: 12px;
	padding-right: 0px;
	padding-left: 0px;
}

button#b2 {
	top: 30%;
	left: 2%;
	bottom: 30%;
	/* background-color:#eee; */
}



.loader {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url('../images/Loader.gif') 30% 30% no-repeat rgb(249,249,249);
    opacity: .8;
}
fieldset.scheduler-border {
	border: 1px solid #CCC;
	border-radius: 5px;
	padding: 10px;
	margin-top: 4px;
    margin-left: -47px;
}

legend.scheduler-border {
	color: #3C6EAC;
	font-size: 11px;
	font-weight: bold !important;
	text-align: left !important;
	border-bottom: none;
}


</style>
<script>
$(document).ready(function(){
	$( "#btnHome" ).click(function() {
		
		location.href="XBRLHomePage.jsp";
			
			});
		
		$( "#btnback" ).click(function() {
			window.history.back();
		});
	$("#btnproceed").on("click",function(){
		
		if($("#oldpass").val()==""){
			$("#oldpass").focus();
			$(".errormsg").show().html('Enter Old Password').fadeOut(3000);
		}else if($("#oldpass").val().length<8){
			$("#oldpass").focus();
			$(".errormsg").show().html('Password should have 8 to 15 Characters').fadeOut(3000);
		}else if($("#newpass").val()==""){
			$("#newpass").focus();
			$(".errormsg").show().html('Enter New Password').fadeOut(3000);
		}else if($("#newpass").val().length<8){
			$("#newpass").focus();
			$(".errormsg").show().html('Password should have 8 to 15 Characters').fadeOut(3000);
		}else if($("#confpass").val()==""){
			$("#confpass").focus();
			$(".errormsg").show().html('Enter Confirm Password').fadeOut(3000);
		}else if($("#confpass").val()!=$("#newpass").val()){
			$("#confpass").val("");
			$("#confpass").focus();
			$(".errormsg").show().html('Confirm Password does not match with New Password').fadeOut(3000);
		}else{
			
			var passcheck={
				"newpass":	$("#newpass").val(),"oldpass":$("#oldpass").val(),"userName":'<%=session.getAttribute("userName").toString()%>'
			};
			$.ajax({
				 url : "checkpassexisit",
			        data : passcheck,
					dataType : 'json', 
					type : 'POST',
					async : false,
					 success : function(res) {
						 if(res.passcheck=="oldpassnmatch"){
							 $("#oldpass").val("");
							 $("#oldpass").focus();
								$(".errormsg").show().html('Enter Correct Password').fadeOut(3000);
						 }else if(res.passcheck=="newpassmatch"){
							 $("#newpass").val("");
							 $("#confpass").val("");
							 $("#newpass").focus();
								$(".errormsg").show().html('New Password should not be same as previous password').fadeOut(3000);
						 }else{
							
							 var updpassw={
										"newpass":	$("#newpass").val(),"userName":'<%=session.getAttribute("userName").toString()%>',"typ":"changepass"
									};
									$.ajax({
										 url : "updpass",
									        data : updpassw,
											dataType : 'json', 
											type : 'POST',
											async : false,
											 success : function(res) {
												 if(res.passcheck=="success"){
													 alert("Password Changed successfully");
													
													 $("#newpass").val("");
													 $("#oldpass").val("");
													 $("#confpass").val("");
													 ChangePass.action = "logout.action?method=logout&uName="+'<%=session.getAttribute("userName").toString()%>';
													 ChangePass.submit();
												 }else{
													 alert("Technical Issue.. Try again Later");
													 
													 $("#newpass").val("");
													 $("#oldpass").val("");
													 $("#confpass").val("");
												 }
											 }
									});
						 }
						 
					 }
			});
		}
	});
});
function fnpassword()  
{  
	var passwd=document.UserForm.pass.value;
	
	if(passwd != "") {
	      if(passwd.length <= 7) {
	    	  document.getElementById('pasword').innerHTML="Password must contain at least Eight characters!"; 
	  		  document.getElementById('pasword').style.display='block';
	    	  
	        document.UserForm.pass.focus();
	        return false;
	      }else{
	    	  document.getElementById('pasword').style.display='none'; 
	      }
	      re = /[0-9]/;
	       if(!re.test(passwd)) { 
	    	 document.getElementById('pasword').innerHTML="password must contain at least one number (0-9)!"; 
		     document.getElementById('pasword').style.display='block';
	    	   
	        document.UserForm.pass.focus();
	        return false;
	      }else{
	    	  document.getElementById('pasword').style.display='none'; 
	      }
	      re = /[A-Z]/;
	      if(!re.test(passwd)) {
	    	  document.getElementById('pasword').innerHTML="password must contain at least one uppercase letter (A-Z)!"; 
			  document.getElementById('pasword').style.display='block';
	    	  
	        document.UserForm.pass.focus();
	        return false;
	      }else{
	    	  document.getElementById('pasword').style.display='none'; 
	      }
	      re = /[!@#$%^&*]/;
	      if(!re.test(passwd)) {
	    	  document.getElementById('pasword').innerHTML="password must contain at least one special characters !"; 
			  document.getElementById('pasword').style.display='block';
	    	 
	        document.UserForm.pass.focus();
	        return false;
	      }
	}else{
		document.getElementById('pasword').style.display='none'; 
		
	}
}
	</script>
<body>
<form class="form-horizontal" method="post" name="ChangePass" id="cform"
		enctype="multipart/form-data">
		
		
        <input type="hidden"id="authFlg" value=""/>
		
		<div class="panel-heading text-center" 
			style="width: 86%; margin-left: 53px; margin-right: 0px; margin-top: 36px; margin-bottom: 20px; background-color: #bbc3cb;">
			
			
			
			<font size="2"><b> Change Password<b id="sub"></b></b></font>
			
			

			
		</div>
		
		<div class="container-fluid" >





			<div class="panel-body">
				
				<div class="tab-content" style="width:75%;margin-left:118px;">
				<font size="1"  class="errormsg" style="float: right;
    margin-right: 272px;color:red;"></font>
				<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Old Password</font><span
									style="color: red;" class="mant" ></span></label>
									<div class="col-sm-3 ">
								<input type="password" class="form-control" maxLength="15"  id="oldpass">
							</div>
									
									</div></div>
									
									<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">New Password</font><span
									style="color: red;" class="mant" ></span></label>
									<div class="col-sm-3 ">
								<input type="password" class="form-control" onblur="fnpassword();" maxLength="15"  id="newpass">
							</div>
									
									</div></div>
								<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Confirm Password</font><span
									style="color: red;" class="mant" ></span></label>
									<div class="col-sm-3 ">
								<input type="password" class="form-control" maxLength="15"  id="confpass">
							</div>
									<div class="modal-footer" style="    padding-right: 140px;"><button type="button" class="btn btn-xs btn-primary" id="btnHome">Home</button><button type="button"  class="btn btn-primary btn-xs" id="btnproceed" >Change</button>
 <button type="reset"  class="btn btn-primary btn-xs" id="btnclear">Clear</button><button type="button"  class="btn btn-primary btn-xs" id="btnback">Back</button></div>
									</div></div>	
									
				</div></div></div></form>
</body>
</html>