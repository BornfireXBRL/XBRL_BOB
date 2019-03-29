<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="ie=edge chrome=1 firefox">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>XBRL</title>

	<!-- Global stylesheets -->
	 <script src="../jQuery/jQuery-2.2.0.min.js"></script>
	<link href="../Login/icons/icomoon/styles.css" rel="stylesheet" type="text/css"> 
	<link href="../Login/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="../Login/core.css" rel="stylesheet" type="text/css">
	<link href="../Login/components.css" rel="stylesheet" type="text/css">

	<!-- /theme JS files -->
<style>
.form-control-feedback{
	       align-items: center;
    display: flex;
}
.sign-in{
background-color:#3870AF;
color:#fff;
margin-left:96px;
}

.footer{
position:relative;
}

background-image{
filter:blur(5px);
}
/* body {
opacity: 0.5;
filter:blur(3px);
} */
</style>

<script>
$(document).ready(function() {

	if('<%=request.getAttribute("alert")%>'=="null"){
		
	}else if('<%=request.getAttribute("alert")%>'=="Password Expired"){
		$(".container1").modal('toggle'); 
		$(".errormsg").show().html('<%=request.getAttribute("alert")%>').fadeOut(3000);
	}else{
		$("#errormsg").show();
    	$("#errormsg").html('<%=request.getAttribute("alert")%>').fadeOut(3000);
	}
	
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
				"newpass":	$("#newpass").val(),"oldpass":$("#oldpass").val(),"userName":'<%=session.getAttribute("userName")%>'
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
										"newpass":	$("#newpass").val(),"userName":'<%=session.getAttribute("userName")%>'
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
													 $(".container1").modal('toggle'); 
													 $("#newpass").val("");
													 $("#oldpass").val("");
													 $("#confpass").val("");
													 
												 }else{
													 alert("Technical Issue.. Try again Later");
													 $(".container1").modal('toggle'); 
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
<script>

$(document).ready(function() {
	$("#sub").on("click",function(){
		
		 if($("#username").val()==""){
			
		alert("Enter Username");
			$("#username").focus(); 
			return false;
		}else if($("#password").val()==""){
			alert("Enter Password");
			$("#password").focus();
			return false;
		} 
	});
    $('#btnConvert').click(function(e) {
        var strVal = $('#txtValue').val();
        if (strVal.length == 0) {
            $('#dvValue').html('Please enter something');
        }
        else {
            var strMD5 = $().crypt({
                method: "md5",
                source: strVal
            });
            $('#dvValue').html("MD5 string of <b>" + strVal + "</b> is <b>" + strMD5 + "</b>");
        }
        e.preventDefault();
    });
});

</script>
  


</head>
<body class="login-container" style="background: url() center center no-repeat ;backdrop-filter: blur(10px);   
-webkit-background-size: auto;
-moz-background-size: auto;
-o-background-size: auto;
background-size: auto;
 align-items: center;
    display: flex;width:100%;height:100%;
      background-position: center;
    background-repeat: no-repeat;background-attachment: fixed;background-color:rgba(143, 154, 168, 1)">

	<!-- Main navbar -->
	
	<!-- /main navbar -->


	<!-- Page container -->
	<div class="page-container">

		<!-- Page content -->
		<div class="page-content">

			<!-- Main content -->
			<div class="content-wrapper">

				<!-- Content area -->
				<div class="content">

					<!-- Simple login form -->
					<form  name="loginform" method="POST"  action="login.action">
						<div class="panel panel-body login-form" style="background-color: rgba(188, 195, 204, 1);border: 1px solid #ff9765; ">
							<div class="text-center">
								<div class="icon-object" style="border: 0.5px solid white; border-image: none; width: 174px; height: 150px; background-color: rgba(143, 154, 169, 1);"><img src="../images/XBRL.png" style="margin: -22px; height: 130px;"></div>
								
							</div>
<div style="text-align:center;"> <span style="color: red;" id="key1" ><font size="1" style="display:none;"  id="errormsg"></font></span>
   <span style="color:red;  font-size: 10px;" id="error1" class="error"></span></div>
							<div style="margin-left:50px;">
							<div class="form-group has-feedback has-feedback-left">
								<input type="text" class="form-control" placeholder="Username" style="border: 1px solid #ff9765;" name="lb.username" id="username">
								<div class="form-control-feedback">
									<i class="icon-user text-muted" ></i>
								</div>
							</div>

							<div class="form-group has-feedback has-feedback-left">
								<input type="password" class="form-control" placeholder="Password" style="border: 1px solid #ff9765;" name="lb.password" id="password" >
								<div class="form-control-feedback">
									<i class="icon-lock2 text-muted"></i>
								</div>
							</div></div>

							<div class="form-group">
								<button type="submit" class="btn btn-block sign-in" >Login </button>
							</div>
						</div>
						<br>
							<!-- Footer -->
					<!-- <div class="footer text-muted text-center" style="color:#001D48">
						&copy; 2019 Licensed to Mauritius Civil Service Mutual Aid Association Ltd
					</div> -->
					
					<!-- /footer -->
					</form>
					<!-- /simple login form -->


				

				</div>
				<!-- /content area -->

			</div>
			<!-- /main content -->

		</div>
		<!-- /page content -->

	</div>
	<!-- /page container -->

</body>
</html>