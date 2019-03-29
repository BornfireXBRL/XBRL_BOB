<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Date date = new Date();
	String curdate = dateFormat.format(date);
	
%>





        
<head>

<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;url=../XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">




<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Asset Manager</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="../../CSS/bootstrap.min.css">

<!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../CSS/bootstrap-datepicker.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="../../js/TimePicker/jquery-ui.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="../../js/TimePicker/jquery-ui-timepicker-addon.css" />
	
<script src="../../jQuery/jQuery-2.2.0.min.js"></script>
<script src="../../js/bootbox.min.js"></script>

<script type="text/javascript"
	src="../../js/TimePicker/jquery-1.10.3-ui.min.js"></script>
<script type="text/javascript"
	src="../../js/TimePicker/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript"
	src="../../js/TimePicker/jquery-ui-sliderAccess.js"></script>
	
	
	<script src="https://cdn.jsdelivr.net/sweetalert2/5.3.8/sweetalert2.js"></script>
<link href="https://cdn.jsdelivr.net/sweetalert2/5.3.8/sweetalert2.css" rel="stylesheet"/>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
	
	
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


</style>


<script>




$(document).ready(function(){
	
	
	
	
	
	
	
	$('.mant').css('color', '#eee');
	$('.mants').css('color', '#eee');
	 $('.mantss').css('color', 'red');
	 
	 $('.mantsb').css('color', '#eee');
	 
	
	$('#reportType,#asonDate,#dt1,#dt2,#rptCurrency,#ReporefSeq').attr("disabled", true);
	
	$( "#btnClear").click(function() {
		//alert("are you want to clear the fields!");
	$('#cform')[0].reset();
	
	});
	
	$( "#btnGo").click(function() {
		
    
		
	});
	
	
	
	

		 $("#function1").change(function(){
			
		     var status = this.value;
		     
		 
		   
		   if(status=="Add"){
				 
			   $('.mants').css('color', 'red');
			   
			   
			   $("#ReporefSeq").attr("disabled", false);
			   
			   $('.mantsb').css('color', '#428bca');
			  
		   }
		   
		   
		  
		   
		   else if(status=="Modify"){
				 
			   $('.mants').css('color', 'red');
			   
			  
			   $("#ReporefSeq").attr("disabled", false);
			   $('.mantsb').css('color', '#428bca');
			  
		   }
		   
		   else if(status=="Inquire"){
				 
			   $('.mants').css('color', 'red');
			   
			  
			   $("#ReporefSeq").attr("disabled", false);
			   $('.mantsb').css('color', '#428bca');
			  
		   }
		   
		   else if(status=="Delete"){
				 
			   $('.mants').css('color', 'red');
			   
			  
			   $("#ReporefSeq").attr("disabled", false);
			   $('.mantsb').css('color', '#428bca');
			  
		   }
		  });

		
	
 }); 



</script>



<body>

<div class="loader"></div>
	<form class="form-horizontal" method="post" name="CriteriaForm" id="cform"
		enctype="multipart/form-data">
		
		
        
		
		<div class="panel-heading text-center" 
			style="width: 86%; margin-left: 53px; margin-right: 0px; margin-top: 36px; margin-bottom: 20px; background-color: #bbc3cb;">
			
			
			
			<font size="2"><b> Parameter<b id="sub"
					Style="display: none"></b></b></font>
			
			

			
		</div>
		
		<div class="container-fluid" >





			<div class="panel-body">
				
				<div class="tab-content">

					<div class="form-group ">
						
						<div class="col-sm-6">
						
							<label class="col-sm-3 control-label" style="margin-top: 4px;"><font
								size="1">Function</font><span
								style="color: red; font-size: 10px;" class="mantss">*</span></label> 
							
								<div class="col-sm-3 ">
									
							<select	name="function" id="function1" onclick="" class="form-control">
								
								<option value="Select">Select</option>
																							
								<option value="Add">Add </option>
								<option value="Modify">Modify</option>
								<option value="Inquire">Inquire </option>
								<option value="Delete">Delete</option> 
								
		
							</select>
							
							<span style="color: red; font-size: 10px; display: none; padding-left: 125px;" id="fun" class="error">Enter function Name</span>
						</div>
						</div>
						
						
						<div class="col-sm-6">
						
						<label class="col-sm-2 control-label" style="margin-top: 4px;"><font
								size="1">RCT</font><span
								style="color: red; font-size: 10px;"  class="mants">*</span></label>
							<div class="col-sm-2 ">
								<input type="text" name="ReporefSeq" id="ReporefSeq" value=""
									class="form-control"  />
								<span style="color: red; font-size: 10px; display: none;" id="etid" class="error">Enter Report Ref No</span>

							</div>
							<div class="col-sm-1" ><a href="#"><i class="glyphicon glyphicon-search icon mantsb" id="search" onclick="fnentity();"></i></a></div> 
						
						</div>
						
					</div>
					
					
					
					
				
				
					

				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-xs btn-primary" id="btnGo">Go</button>
					<button type="button" class="btn btn-xs btn-primary" id="btnClear">Clear</button>
					
				</div>




			</div>


		</div>
		
	</form>
</body>

<script type="text/javascript" src="XBRL_PARME.js"></script>

</html>



