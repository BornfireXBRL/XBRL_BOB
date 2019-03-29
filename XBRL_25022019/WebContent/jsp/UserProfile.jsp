<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat,dao.XBRLUserProfileDao"%>
	<%@page	import="bean.XBRLUserProfileBean,dao.XBRLUserProfileDao,java.util.ArrayList,java.util.Iterator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
   // String type=request.getParameter("type");
    XBRLUserProfileDao Upd=new XBRLUserProfileDao();
    ArrayList<XBRLUserProfileBean> list=Upd.listOfFinUser();
    
    %>
    
<%
	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	Date date = new Date();
	String curdate = dateFormat.format(date);
	String type="";
	if(!request.getParameter("type").equals(null)){
		type=request.getParameter("type");
	}
%>
        
<head>

<%-- <meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;url=../XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" /> --%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>XBRL</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
 <link href="../css/bootstrap.min.css" rel="stylesheet">
 <link href="../css/bootstrap.css" rel="stylesheet">
 <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

 <script src="../jQuery/jQuery-2.2.0.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  <link href="../CSS/bootstrap.min.css" rel="stylesheet">  -->
<link href="../css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="../css/bootstrap-datepicker.css" />
 <script src="../js/bootstrap-datepicker.js"></script>
 <script type="text/javascript" src="../js/TimePicker/jquery-ui-timepicker-addon.js"></script>
 <link rel="stylesheet" media="all" type="text/css" href="../js/TimePicker/jquery-ui-timepicker-addon.css" />

	
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
    margin-left: -40px;
}


.tab-content {
    width: 78%;
    margin-left: 101px;
}

fieldset.scheduler-border {
	width: 840px;
	/* border: 1px groove #ddd !important; */
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
	/* border: 1px solid #CCC; */
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

#ui-datepicker-div{
top: 285.375px;
    left: 430.328px;;
}

 fieldset{
border:1px solid #ddd;
}
</style>


<script>


$(document).ready(function(){
	
	$('.mant').css('color', '#eee');
	$('.form-control').attr("readonly", true);
	$('#btnSubmit,#btnpassub,#btnsessrst,#btnpassrst').hide();
	
	$( "#btnAdd" ).click(function() {
		$('.mant').css('color', 'red');
		$('.form-control').attr("readonly", true);	
		$("#sub").html(" - Add");
		$('#userId').css("background-color","#fff");
		$('.input-sm').attr("readonly", false);
		
		
		$( "#btnAdd" ).attr("disabled", true);
		$("#btnSubmit,#iconacc").show();
		$('#roleDesc').attr("readonly", true);	
		
		 $("#entryuser").val('<%=session.getAttribute("userName") %>');
			$("#entrytime").val('<%=curdate %>');
			$("#modifyuser").val('<%=session.getAttribute("userName") %>');
			$("#modifytime").val('<%=curdate %>');
	});
$( "#btnHome" ).click(function() {
		
		location.href = "XBRLHomePage.jsp";
		
		});
	
	$( "#btnBack" ).click(function() {
		window.history.back();
	});
	$( "#btnInq" ).click(function() {
		location.href = "UserProfileList.jsp?type=open";
	});
/* $( "#issDate,#docIssDate0,#docIssDate1,#docIssDate2").datepicker({
		
	    dateFormat: 'dd-mm-yy',
		changeMonth: true,//this option for allowing user to select month
	  changeYear: true,//this option for allowing user to select from year range
	  yearRange: "-100:+0",
	   maxDate: new Date()
	  
	}); */
	$( "#disableDate,#disableTilDate,#passExDate,#expiryDate,#effectiveTill").datepicker({
		 
	    dateFormat: 'dd-mm-yy',
		changeMonth: true,//this option for allowing user to select month
	  changeYear: true,//this option for allowing user to select from year range
	  minDate:"0+1",
	  maxDate: "50years",
	 
	  
	  
	});
	$("#inactiveTime,#loginLow,#loginHigh").timepicker(); 
	
	$("#permission").on("change",function(){
		if($(this).val()=="R"){
$("#admin,#config,#reports,#bjsch,#bjExc,#xmlReport,#misReport,#arch,#genInq,#audInq").empty();
			
			var opt='<option value="O">Select</option>';
			   opt +='<option value="R">Read</option>';
			   opt +='<option value="N">No</option>';
			 $("#admin,#config,#reports,#bjsch,#bjExc,#xmlReport,#misReport,#arch,#genInq,#audInq").append(opt);
		}else{
			$("#admin,#config,#reports,#bjsch,#bjExc,#xmlReport,#misReport,#arch,#genInq,#audInq").empty();
			
			var opt='<option value="O">Select</option>';
			   opt +='<option value="R">Read</option>';
			   opt +='<option value="W">Write</option>';
			   opt +='<option value="N">No</option>';
			   $("#admin,#config,#reports,#bjsch,#bjExc,#xmlReport,#misReport,#arch,#genInq,#audInq").append(opt);
		}
		
		
		/* $("#admin,#config,#reports,#bjsch,#bjExc,#xmlReport,#misReport,#arch,#genInq,#audInq").append('<option value="O">Select</option>');
		$("#pschemecode").append('<option value="R">Read</option>');
		$("#pschemecode").append('<option value="W">Write</option>');
		 */
		
	});
	$("#roleId").on("change",function(){
		
	    if($(this).val()=="ADM"){
	    	$("#roleDesc").val("Admin");
	    }else if($(this).val()=="ADT"){
	    	$("#roleDesc").val("Audit");
	    }else if($(this).val()=="XBRL"){
			$("#roleDesc").val("XBRL Reports");
	    }else if($(this).val()=="MIS"){
			$("#roleDesc").val("MIS Reports");
		}else if($(this).val()=="GEN"){
			$("#roleDesc").val("General User");
		}else if($(this).val()=="EXE"){
			$("#roleDesc").val("Executives");
		}else{
			$("#roleDesc").val("");
		}
		
	});
	
$( "#btnSubmit" ).click(function() {
	/*if($("#bankCode").val()==""){
		$("#bankCodeError").text("Enter Bank Code");
		$("#bankCodeError").show().fadeOut(3000);
		$("#bankCode").focus();
	}else if($("#bankName").val()==""){
		$("#bankNameError").text("Enter Bank Name");
		$("#bankNameError").show().fadeOut(3000);
		$("#bankName").focus();
	} else if($("#branchCode").val()==""){
		$("#branchCodeError").text("Enter Branch Code");
		$("#branchCodeError").show().fadeOut(3000);
		$("#branchCode").focus();
	}else if($("#branchName").val()==""){
		$("#branchNameError").text("Enter Branch Name");
		$("#branchNameError").show().fadeOut(3000);
		$("#branchName").focus();
	} 	
	else if($("#empId").val()==""){
		$("#empIdError").text("Enter Employee Id");
		$("#empIdError").show().fadeOut(3000);
		$("#empId").focus();
	}else if($("#empName").val()==""){
		$("#empNameError").text("Enter Employee Name");
		$("#empNameError").show().fadeOut(3000);
		$("#empName").focus();
	}else if($("#userId").val()==""){
		$("#userIdError").text("Enter User Id");
		$("#userIdError").show().fadeOut(3000);
		$("#userId").focus();
	}
	*/
	if($("#userName").val()==""){
		$("#userNameError").text("Enter User Name");
		$("#userNameError").show().fadeOut(3000);
		$("#userName").focus();
	}else if($("#pass").val()==""){
		$("#pasword").text("Enter Password");
		$("#pasword").show().fadeOut(3000);
		$("#pass").focus();
	}
	else if($("#passExDate").val()==""){
		$("#passExDateError").text("Enter Password Expiry Date");
		$("#passExDateError").show().fadeOut(3000);
		$("#passExDate").focus();
	}
	else{
	UserForm.action="useradd.action?method=addUser";
    UserForm.submit(); 
	}
		});
$('#btnModify').click(function() {
	$("#sub").html(" - Modify");
	$('.form-control').attr("readonly", false);
	$('#bankCode,#bankName,#branchCode,#branchName,#empId,#empName,#userId,#userName').attr("readonly", true);
	$('#btnSubmit,#btnInq,#btnAdd,#btnModify,#btnsessrst,#btnpassrst,#btnpassub').hide();
	$('#btnMsubmit').show();
	$("#modifyuser").val('<%=session.getAttribute("userName") %>');
	$("#modifytime").val('<%=curdate %>');
});

$('#btnMsubmit').click(function() {
	if($("#authFlg").val()=="N" && $("#modifyuser").val()=='<%=session.getAttribute("userName") %>'){
		alert("Same user can't verify");
	}else{
		UserForm.action="modifyUser.action?method=modifyUser&status="+$("#authFlg").val();
	    UserForm.submit();  
	}	 
	
});

$('#btnsessrst').click(function() {
	$('.form-control').attr("readonly", true);
	$('#btnSubmit,#btnInq,#btnAdd,#btnMsubmit,#btnpassub').hide();
	
	var usrid = {
			"usrid" : $("#userId").val() 
		}; 
	 $.ajax({
        url : "sessionreset",
        data : usrid,
		dataType : 'json', 
		type : 'POST',
		async : true,
		 success : function(res) {
		
	if(res="success"){
		alert("Session Reset Successfully.");
		location.href = "UserProfileList.jsp?type=open";
	}
		
	}
		 });
	 
});
	 	 

$('#btnpassrst').click(function() {
		
	$("#btnpassub").show();
	$('#pass').attr("readonly", false);
	$('#pass').val("");
	$("#sub").html(" - Password Reset");	
	$("#pass").focus();	
	$('#btnSubmit,#btnInq,#btnAdd,#btnMsubmit,#btnModify,#btnsessrst,#btnpassrst').hide();
});

$('#btnpassub').click(function() {
		
	//$('#bankCode,#bankName,#branchCode,#branchName,#empId,#empName,#userId,#userName').attr("readonly", true);
		if(	$('#pass').val()==""){
				$("#pasword").text("Enter The New Password.");
				$("#pasword").show().fadeOut(3000);
				$("#pass").focus();	
		}else{	
	var usrid = {
			"usrid" : $("#userId").val() , "newpswd" : $("#pass").val()
		}; 
	 $.ajax({
        url : "passwordreset",
        data : usrid,
		dataType : 'json', 
		type : 'POST',
		async : true,
		 success : function(res) {
			 
	$("#sub").html(" - Password Reset");
	$('.form-control').attr("readonly", true);
	
	$('#pass').attr("readonly", false);
		
	
	if(res="success"){
		alert("Password Reset Successfully.");
		location.href = "UserProfileList.jsp?type=open";
		
	}
			
		 }
	 
		 });
	 
		}
		
});

if("list"=='<%=type%>'){
	$('.mant').css('color', '#eee');
	$('.form-control').attr("readonly", true);
	$('#btnSubmit,#btnInq,#btnAdd,#btnpassub').hide();
	$('#btnModify,#btnsessrst,#btnpassrst').show();
	$("#sub").html(" - Inquiry");
	var usrid = {
			"usrid" : '<%=request.getParameter("userid")%>'
		}; 
	 $.ajax({
        url : "userDetails",
        data : usrid,
		dataType : 'json', 
		type : 'POST',
		async : true,
		 success : function(res) {
	
			    $("#bankCode").val(res.userdata[0]);
				$("#bankName").val(res.userdata[1]);
				$("#branchCode").val(res.userdata[2]);
				$("#branchName").val(res.userdata[3]);
				$("#empId").val(res.userdata[4]);
				$("#empName").val(res.userdata[5]);
				$("#userId").val(res.userdata[6]);
				$("#userName").val(res.userdata[7]);
				$("#inactiveTime").val(res.userdata[8]);
				$("#expiryDate").val(res.userdata[9]);
				$("#loginLow").val(res.userdata[10]);
				$("#loginHigh").val(res.userdata[11]);
				$("#disableDate").val(res.userdata[12]);
				$("#disableTilDate").val(res.userdata[13]);
				$("#pass").val(res.userdata[14]);
				$("#passExDate").val(res.userdata[15]);
				$("#userStatus").val(res.userdata[16]);
				$("#loginStatus").val(res.userdata[17]);
				$("#virtual").val(res.userdata[18]);
				$("#workClass").val(res.userdata[19]);
				$("#mobNo").val(res.userdata[20]);
				$("#emailId").val(res.userdata[21]);
				$("#roleId").val(res.userdata[22]);
				$("#roleDesc").val(res.userdata[23]);
				$("#permission").val(res.userdata[24]);
				$("#effectiveTill").val(res.userdata[25]);
				$("#admin").val(res.userdata[26]);
				$("#config").val(res.userdata[27]);
				$("#reports").val(res.userdata[28]);
				$("#bjsch").val(res.userdata[29]);
				$("#bjExc").val(res.userdata[30]);
				$("#xmlReport").val(res.userdata[31]);
				$("#misReport").val(res.userdata[32]);
				$("#arch").val(res.userdata[33]);
				$("#genInq").val(res.userdata[34]);
				$("#audInq").val(res.userdata[35]);
				$("#chnl").val(res.userdata[36]);
			    $("#authFlg").val(res.userdata[43]);
			   
			     $("#entryuser").val(res.userdata[37]);
				 $("#entrytime").val(res.userdata[38]);
				 $("#verifyuser").val(res.userdata[39]);
				 $("#verifytime").val(res.userdata[40]); 
				 $("#modifyuser").val(res.userdata[41]);
				 $("#modifytime").val(res.userdata[42]); 
				 
				 if(res.userdata[43]=="N"){
				    	$("#sub").html(" - Verify");
				    	$('.form-control').attr("readonly", false);
				    	$('#bankCode,#bankName,#branchCode,#branchName,#empId,#empName,#userId,#userName').attr("readonly", true);
				    	$('#btnSubmit,#btnInq,#btnAdd,#btnModify,#btnpassub,#btnsessrst,#btnpassrst').hide();
				    	$('#btnMsubmit').show();
				    	$("#verifyuser").val('<%=session.getAttribute("userName") %>');
						$("#verifytime").val('<%=curdate %>');
				    }else{
				    	$("#sub").html(" - Inquiry");
				    }
		 }	});}

 }); 

function validateEmail(emailField){
    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

    if (reg.test(emailField.value) == false) 
    {
        alert('Invalid Email Address');
       /*  $("#emailId").focus(); */
        return false;
    }

    return true;

}
function fnnumber(evt)
{
	var e = event || evt;
	var charCode = e.which || e.keyCode;
	
	if (charCode < 48 || charCode > 57)
	{
		
		alert("Enter Numbers Only");
		event.preventDefault();
		
		
		return false;
	}
}
function fnpassword()  
{ 
	if("open"=='<%=type%>'){
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
	
	
}


function usersearch(){
	$("#myModal").modal('show');
}

function fnclick(userid,createStatus){
	if(createStatus=="Y"){
		
		
		
		
		/* $("#msg").html("Already Created.");
		$( "#dialog-confirm" ).dialog({
		      resizable: false,
		      height: "auto",
		      width: 400,
		      modal: true,
		      buttons: {
		        "OK": function() {
		        	$( this ).dialog( "close" );
		        }
		      }
		    }); */
		
		alert("Already Created.");
	}else{
	var usrid = {
			"usrid" : userid
		}; 
	$.ajax({
        url : "finuserDetails",
        data : usrid,
		dataType : 'json', 
		type : 'POST',
		async : true,
		 success : function(res) {
	
			   
				$("#branchCode").val(res.userdata[0]);
				$("#userId").val(res.userdata[1]);
				$("#empId").val(res.userdata[2]);
				$("#expiryDate").val(res.userdata[3]);
				$("#workClass").val(res.userdata[4]);
				$("#inactiveTime").val(res.userdata[5]);
				$("#disableDate").val(res.userdata[6]);
				$("#disableTilDate").val(res.userdata[7]);
				$("#loginLow").val(res.userdata[8]);
				$("#loginHigh").val(res.userdata[9]);
				$("#virtual").val(res.userdata[10]);
				$("#myModal").modal('hide');
				$('#userId').attr("readonly", true);
				$('.mant').css('color', 'red');
				$('#userId').css("background-color","#fff");
				$('#userName,#pass,#passExDate,#userStatus,#loginStatus,#mobNo,#emailId,#roleId,#permission,#effectiveTill,.input-sm').attr("readonly", false);
				var date = new Date();
				var newdate = new Date(date);
                newdate.setDate(date.getDate() + 60);
				
                var dd = newdate.getDate();
				var mm = newdate.getMonth() + 1;
				var y = newdate.getFullYear();
				var someFormattedDate = dd + '-' + mm + '-' + y;    
				$("#passExDate").val(someFormattedDate);
		 }	});
}
}
</script>



<body>


	<form class="form-horizontal" method="post" name="UserForm" id="cform"
		enctype="multipart/form-data">
		
		
        <input type="hidden"id="authFlg" value=""/>
		
		<div class="panel-heading text-center" 
			style="width: 86%; margin-left: 53px; margin-right: 0px; margin-top: 36px; margin-bottom: 20px; background-color: #bbc3cb;">
			
			
			
			<font size="2"><b> User Profile<b id="sub"></b></b></font>
			 <button type="button" class="btn btn-xs btn-primary" id="btnAdd" style="margin-left: 653px;width:75px;">Create User</button>
			  <button type="button" class="btn btn-xs btn-primary" id="btnInq" style="width: 60px;">List</button>
			

			
		</div>
		
		<div class="container-fluid" >


			<div class="panel-body">
				
				<div class="tab-content" style="width:75%;margin-left:95px;">
<fieldset class="scheduler-border ds"><legend class="scheduler-border">General Details </legend>

<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">User Id</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="ub.userId" id="userId" value=""  class="form-control " autocomplete="off"/> 
								<span style="color: red;font-size: 10px;display:none" id="userIdError" class="error"></span>
							</div>
							<div class="col-sm-1"><a href="#" ><i class="glyphicon glyphicon-search icon"  id="iconacc" style="display:none;" onclick="usersearch();"></i></a></div>
							 <!-- <div class="col-sm-1"></div> -->
							<label class="col-sm-2 control-label" ><font size="1">User Name</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								<input type="text" name="ub.userName" id="userName" value=""  class="form-control"/> 
								<span style="color: red;font-size: 10px;display:none" id="userNameError" class="error"></span>
							</div>
							
							</div></div>

					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Bank Code</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="ub.bankCode" id="bankCode" value=""  class="form-control " autocomplete="off"/> 
								<span style="color: red;font-size: 10px;display:none" id="bankCodeError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">Bank Name</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								<input type="text" name="ub.bankName" id="bankName" value=""  class="form-control" autocomplete="off"/> 
								<span style="color: red;font-size: 10px;display:none" id="bankNameError" class="error"></span>
							</div>
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Branch Code</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="ub.branchCode" id="branchCode" value=""  class="form-control " autocomplete="off"/> 
								<span style="color: red;font-size: 10px;display:none" id="branchCodeError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">Branch Name</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								<input type="text" name="ub.branchName" id="branchName" value=""  class="form-control" autocomplete="off"/> 
								<span style="color: red;font-size: 10px;display:none" id="branchNameError" class="error"></span>
							</div>
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Employee Id</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="ub.empId" id="empId" value=""  class="form-control " autocomplete="off"/> 
								<span style="color: red;font-size: 10px;display:none" id="empIdError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">Employee Name</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								<input type="text" name="ub.empName" id="empName" value=""  class="form-control"/> 
								<span style="color: red;font-size: 10px;display:none" id="empNameError" class="error"></span>
							</div>
							
							</div></div>
					
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Max Inactive Time</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="ub.inactiveTime" id="inactiveTime" value=""  class="form-control " autocomplete="off"/> 
								<span style="color: red;font-size: 10px;display:none" id="inactiveTimeError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">Account Expiry Date</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								<input type="text" name="ub.expiryDate" id="expiryDate" value=""  class="form-control"/> 
								<span style="color: red;font-size: 10px;display:none" id="expiryDateError" class="error"></span>
							</div>
							
							</div></div>
					
				<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Login Low</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="ub.loginLow" id="loginLow" value=""  class="form-control " autocomplete="off"/> 
								<span style="color: red;font-size: 10px;display:none" id="loginLowError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">Login High</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								<input type="text" name="ub.loginHigh" id="loginHigh" value=""  class="form-control"/> 
								<span style="color: red;font-size: 10px;display:none" id="loginHighError" class="error"></span>
							</div>
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">User Disable Date</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="ub.disableDate" id="disableDate" value=""  class="form-control " autocomplete="off"/> 
								<span style="color: red;font-size: 10px;display:none" id="disableDateError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">User Disable Till Date</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								<input type="text" name="ub.disableTilDate" id="disableTilDate" value=""  class="form-control"/> 
								<span style="color: red;font-size: 10px;display:none" id="disableTilDateError" class="error"></span>
							</div>
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Password</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="password" name="ub.pass" id="pass" value="" onblur="fnpassword();" class="form-control " autocomplete="off"/> 
								<span style="color: red;font-size: 10px;display:none" id="pasword" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">Password Expiry Date</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								<input type="text" name="ub.passExDate" id="passExDate" value=""  class="form-control"/> 
								<span style="color: red;font-size: 10px;display:none" id="passExDateError" class="error"></span>
							</div>
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">User Status</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								
								<select name="ub.userStatus" id="userStatus" class="form-control " autocomplete="off">
								
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
								</select>
								<span style="color: red;font-size: 10px;display:none" id="userStatusError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">Login Status</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								 
								<select name="ub.loginStatus" id="loginStatus" class="form-control " autocomplete="off">
								
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
								
								</select>
								<span style="color: red;font-size: 10px;display:none" id="loginStatusError" class="error"></span>
							</div>
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Virtual User Flag</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								
								<select name="ub.virtual" id="virtual" class="form-control " autocomplete="off">
								<option value="N">N</option>
								<option value="Y">Y</option>
								
								
								</select>
								<span style="color: red;font-size: 10px;display:none" id="vFlgError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">Work Class</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								<input type="text" name="ub.workClass" id="workClass" value=""  class="form-control" autocomplete="off"/> 
								<span style="color: red;font-size: 10px;display:none" id="workClassError" class="error"></span>
							</div>
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Mobile No</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="ub.mobNo" id="mobNo" value="" onkeypress="fnnumber();" maxlength="10" class="form-control " autocomplete="off"/> 
								<span style="color: red;font-size: 10px;display:none" id="mobNoError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">Email Id</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								<input type="text" name="ub.emailId" id="emailId" value=""  onblur="validateEmail(this);" class="form-control" autocomplete="off"/> 
								<span style="color: red;font-size: 10px;display:none" id="emailIdError" class="error"></span>
							</div>
							
							</div></div>
				</fieldset> 
				<fieldset class="scheduler-border"><legend class="scheduler-border">Role and Rights </legend>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Role Id</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								 
								<select name="ub.roleId" id="roleId" class="form-control " autocomplete="off">
								<option value="">Select</option>
								<option value="ADM">ADM</option>
								<option value="ADT">ADT</option>
								<option value="XBRL">XBRL</option>
								<option value="MIS">MIS</option>
								<option value="GEN">GEN</option>
								<option value="EXE">EXE</option>
								</select>
								<span style="color: red;font-size: 10px;display:none" id="roleIdError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">Role Description</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								<input type="text" name="ub.roleDesc" id="roleDesc" value="" readonly  class="form-control"/> 
								<span style="color: red;font-size: 10px;display:none" id="roleDescError" class="error"></span>
							</div>
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Permissions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								 
								<select name="ub.permission" id="permission" class="form-control " autocomplete="off">
								<option value="O">Select</option>
								<option value="R">Read</option>
								<option value="W">Write</option>
								</select>
								<span style="color: red;font-size: 10px;display:none" id="permissionError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">Effective Till</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								<input type="text" name="ub.effectiveTill" id="effectiveTill" value=""  class="form-control"/> 
								<span style="color: red;font-size: 10px;display:none" id="effectiveTillError" class="error"></span>
							</div>
							
							</div></div>
							
				</fieldset>	 
				<fieldset class="scheduler-border ds"><legend class="scheduler-border">Modules</legend>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Admin</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								
								<select name="ub.admin" id="admin" class="form-control " autocomplete="off">
								<option value="O">Select</option>
								<option value="R">Read</option>
								<option value="W">Write</option>
								
								</select>
								<span style="color: red;font-size: 10px;display:none" id="adminError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">XBRL Configuration</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								
								<select name="ub.config" id="config" class="form-control " autocomplete="off">
								<option value="O">Select</option>
								<option value="R">Read</option>
								<option value="W">Write</option>
								<option value="N">No</option>
								</select>
								<span style="color: red;font-size: 10px;display:none" id="configError" class="error"></span>
							</div>
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">XBRL Reports</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								
								<select name="ub.reports" id="reports" class="form-control " autocomplete="off">
								<option value="O">Select</option>
								<option value="R">Read</option>
								<option value="W">Write</option>
								<option value="N">No</option>
								</select> 
								<span style="color: red;font-size: 10px;display:none" id="reportsError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">Batch Job Scheduler</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								
								<select name="ub.bjsch" id="bjsch"  class="form-control " autocomplete="off">
								<option value="O">Select</option>
								<option value="R">Read</option>
								<option value="W">Write</option>
								<option value="N">No</option>
								</select> 
								<span style="color: red;font-size: 10px;display:none" id="bjschError" class="error"></span>
							</div>
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Batch Job Execution</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								
								<select name="ub.bjExc" id="bjExc" class="form-control " autocomplete="off">
								<option value="O">Select</option>
								<option value="R">Read</option>
								<option value="W">Write</option>
								<option value="N">No</option>
								</select> 
								<span style="color: red;font-size: 10px;display:none" id="bjExcError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">XML Reports</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								
								<select name="ub.xmlReport" id="xmlReport"  class="form-control " autocomplete="off">
								<option value="O">Select</option>
								<option value="R">Read</option>
								<option value="W">Write</option>
								<option value="N">No</option>
								</select> 
								<span style="color: red;font-size: 10px;display:none" id="xmlReportError" class="error"></span>
							</div>
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">MIS Report</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								
								<select name="ub.misReport" id="misReport" class="form-control " autocomplete="off">
								<option value="O">Select</option>
								<option value="R">Read</option>
								<option value="W">Write</option>
								<option value="N">No</option>
								</select> 
								<span style="color: red;font-size: 10px;display:none" id="misReportError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">XBRL Archival</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								
								<select name="ub.arch" id="arch"  class="form-control " autocomplete="off">
								<option value="O">Select</option>
								<option value="R">Read</option>
								<option value="W">Write</option>
								<option value="N">No</option>
								</select> 
								<span style="color: red;font-size: 10px;display:none" id="archError" class="error"></span>
							</div>
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">General Inquiries</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								
								<select name="ub.genInq" id="genInq" class="form-control " autocomplete="off">
								<option value="O">Select</option>
								<option value="R">Read</option>
								<option value="W">Write</option>
								<option value="N">No</option>
								</select> 
								<span style="color: red;font-size: 10px;display:none" id="genInqError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">Audit Inquiries</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								
								<select name="ub.audInq" id="audInq"  class="form-control " autocomplete="off">
								<option value="O">Select</option>
								<option value="R">Read</option>
								<option value="W">Write</option>
								<option value="N">No</option>
								</select> 
								<span style="color: red;font-size: 10px;display:none" id="audInqError" class="error"></span>
							</div>
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Channels</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								
								<select name="ub.chnl" id="chnl" class="form-control " autocomplete="off">
								<option value="O">Select</option>
								<option value="A">All</option>
								<option value="G">General</option>
								<option value="W">Web</option>
								<option value="M">Mobile</option>
								</select> 
								<span style="color: red;font-size: 10px;display:none" id="chnlError" class="error"></span>
							</div>
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" ><font size="1">User Profile</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								
								<select name="ub.usrprof" id="usrprof"  class="form-control " autocomplete="off">
								<option value="O">Select</option>
								<option value="R">Read</option>
								<option value="W">Write</option>
								<option value="N">No</option>
								</select> 
								<span style="color: red;font-size: 10px;display:none" id="usrprofError" class="error"></span>
							</div>
							</div></div>
							
				</fieldset>	

				</div>
				<div class="modal-footer" style="margin-top: 20px;">
                    <button type="button" class="btn btn-xs btn-primary" id="btnHome">Home</button>
                    <button type="button" class="btn btn-xs btn-primary" style="display:none;" id="btnModify">Modify</button>
                     <button type="button" class="btn btn-xs btn-primary" style="display:none;" id="btnMsubmit">Submit</button>
                     
                     <button type="button" class="btn btn-xs btn-primary" style="width: 85px;" id="btnsessrst">SessionReset</button>
                     <button type="button" class="btn btn-xs btn-primary" style="width: 95px;" id="btnpassrst">PasswordReset</button>
                     
                     
                     
                     <button type="button" class="btn btn-xs btn-primary" style="width: 100px;" id="btnpassub">PasswordSubmit</button>
                 
					<button type="button" class="btn btn-xs btn-primary" id="btnSubmit">Submit</button>
					<button type="button" class="btn btn-xs btn-primary" id="btnBack">Back</button>
					
				</div>
<table Style="border:1px solid;    height: 63px; width: 690px; margin-left: 139px;">
<tr><td style="text-align: center;"><font size="1"><B>Entry User :</B></font></td><td style="width:112px"><input type="text" id="entryuser" name="ub.entryuser" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td><td style="text-align: center;"><font size="1"><B>Modify User :</B></font></td><td style="width: 112px;" ><input type="text" id="modifyuser" name="ub.modifyuser" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td><td style="text-align: center;"><font size="1"><B>Verify User :</B></font></td><td style="width: 112px;" ><input type="text" id="verifyuser" name="ub.verifyuser" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td></tr>
<tr><td style="text-align: center;"><font size="1"><B>Entry Time :</B></font></td><td style="width:112px"><input type="text" id="entrytime" name="ub.entrytime" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td><td style="text-align: center;"><font size="1"><B>Modify Time :</B></font></td><td style="width:112px"><input type="text" id="modifytime" name="ub.modifytime" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td><td style="text-align: center;"><font size="1"><B>Verify Time :</B></font></td><td style="width:112px"><input type="text" id="verifytime" name="ub.verifytime" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td></tr></table>



			</div>


		</div>
		
	</form>
	
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        
        <div class="modal-body">
          <div class="table-responsive" style="overflow-x: hidden;">
                                <table class="table table-striped table-bordered table-hover" style="font-size: 10px;" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>SL</th>
                                            <th>SOL ID</th>
                                            <th>USER ID</th>
                                            <th>EMPLOYEE ID</th>
                                            <th>ACCOUNT EXPIRY DATE</th>
                                        </tr>
                                    </thead>
                                    <tbody id="userlist">
                                        <%if(list.size()>0){
                int i = 1;
                Iterator<XBRLUserProfileBean> itlist=list.iterator();
								while(itlist.hasNext()){
									XBRLUserProfileBean upb=itlist.next();
					
									
									%>
									<tr onclick="fnclick('<%=upb.getUserId() %>','<%=upb.getUserStatus()%>');">
									<td style="width: 4%;"><%=i++ %></td>
									<td style="width: 7%;"><%=upb.getBranchCode()%></td>
									<td style="width: 14%;"><%=upb.getUserId() %></td>
									<td style="width: 14%;"><%=upb.getEmpId()%></td>
									<td><%=upb.getExpiryDate()%></td>
									
									
									
									
									</tr>
                                        <%}} %>
                                    </tbody>
                                </table>
                                
                            </div>
                </div>
      </div>
    </div>
  </div>
  <div id="dialog-confirm" title="Alert" style="display:none;">
  <p><span class="glyphicon glyphicon-alert" style="float:left; margin:12px 12px 20px 0;"></span><font id="msg"></font></p>
</div>
</body>



</html>



