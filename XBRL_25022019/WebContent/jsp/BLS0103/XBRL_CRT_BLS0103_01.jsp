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
<title>XBRL</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="../../CSS/bootstrap.min.css">
 <link rel="stylesheet" href="../../Bootstrap/css/bootstrap.min.css">

<!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<!--  <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">  -->
	 <link rel="stylesheet" href="../../css/bootstrap/bootstrap.css" /> 
  <link href="../../css/ajax/ajax.css" />
	<link rel="stylesheet" href="../../CSS/bootstrap-datepicker.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="../../js/TimePicker/jquery-ui.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="../../js/TimePicker/jquery-ui-timepicker-addon.css" />
	  <script  type="text/javascript" src="../../js/sweetalert/sweetie.js"></script>
	
<script src="../../jQuery/jQuery-2.2.0.min.js"></script>
<script src="../../js/bootbox.min.js"></script>

<script type="text/javascript"
	src="../../js/TimePicker/jquery-1.10.3-ui.min.js"></script>
<script type="text/javascript"
	src="../../js/TimePicker/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript"
	src="../../js/TimePicker/jquery-ui-sliderAccess.js"></script>
	
	
	<!-- <script src="https://cdn.jsdelivr.net/sweetalert2/5.3.8/sweetalert2.js" ></script> -->
	<link  rel="stylesheet" href="../../css/sweetalert/sweetalert.css"/>
<script  type="text/javascript" src="../../js/sweetalert/sweetalert.js"></script>
<!-- <link href="https://cdn.jsdelivr.net/sweetalert2/5.3.8/sweetalert2.css" rel="stylesheet"/> -->


 <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">  -->
	<link rel="stylesheet" href="/../../css/animatee.css">
	
	<script src="../../js/am.js"></script> 
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
	width: 1075px;
}

/* .btn {
	width: 50px;
}
 */
.glyphicon {
	top: 4px;
	margin-left: -75px;
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
.gmd-1 {
  -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  -moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  -ms-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  -o-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  -webkit-transition: all 0.25s ease-in-out;
  -moz-transition: all 0.25s ease-in-out;
  -ms-transition: all 0.25s ease-in-out;
  -o-transition: all 0.25s ease-in-out;
  transition: all 0.25s ease-in-out;
}
.gmd-1:hover {
  -webkit-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  -moz-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  -ms-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  -o-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
}






  	.gmd-1{
		width:100%; 
		border-collapse:collapse; 
	}
	.gmd-1 td{ 
		padding:7px; border:#4e95f4 1px solid;
	}

    .gmd-1 tr:hover {
          background-color: #ffff99;
    }
    .navright {
	background-color: rgb(238, 238, 238);
	background-image: none;
	background-repeat: no-repeat;
	width: 100%;
	border-radius: 4px;
	float: right;
	height: 30px;
}
    
.headingtab {
	font-size: 11px;
	line-height: 0.428971;
}


 .container1{
display:none;
} 

.container1
{
    position: fixed; /* Sit on top of the page content */
  top: 10px; 
    left: 0;
    right: 0;
    bottom: 0;
display:none;
border: 1px outset;
width: 502px;
height:211px;
background-color: #eee;
margin:0 auto;

border-radius: 10px;


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

	var det={
			"type":"chkuser"
		};
		$.ajax({
			url:"BLS0103chckmodified",
			data:det,
			dataType:'json',
			type:'POST',
			async:true,
			success:function(res){
				console.log(res.cnt);
				if(res.cnt>0){
					$("#function1").append("<option value='verifycancel'>Verify/Cancel Records</option>");
					

				}
			}
		});
	
 	 $( "#dt1" ).datepicker({
		
    	
	   	 dateFormat: "dd-mm-yy",
	        changeMonth: true,//this option for allowing user to select month
			      changeYear: true,
			      yearRange: "-100:+0",
			      maxDate: new Date(),
			      onClose: function() {
	       	
	       	 var date = $(this).datepicker('getDate');
	            if (date) {
	                  date.setDate(1);
	                  $(this).datepicker('setDate', date);
	            }
	       }
	   });
 	 $( "#dt2" ).datepicker({
     	
    	 dateFormat: "dd-mm-yy",
         changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: new Date(),
		      onClose: function() {
		        	
		        	 var date = $(this).datepicker('getDate');
		             if (date) {
		                   //date.setDate(31);
		                   date = new Date(date.getFullYear(), date.getMonth() + 1, 0);

		                   $(this).datepicker('setDate', date);
		                   
		                   
		             }
		        }
    });
    
    
   
    
    var date4 ="";
    $( "#asonDate" ).datepicker({
    	
   	 dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: new Date(),
	      onClose: function() {
            date4 = $(this).datepicker('getDate');

           if (date4) {
        	   date4 = new Date(date4.getFullYear(), date4.getMonth() + 1, 0);
               $(this).datepicker("setDate", date4);
               $('#dt2').datepicker("setDate", date4);
               date4.setDate(1);
               $('#dt1').datepicker("setDate", date4);
         }
       }
   });
    $('.mant').css('color', '#eee');
	$('.mants').css('color', '#eee');
	 $('.mantss').css('color', 'red');
	 
	 $('.mantsb').css('color', '#eee');
	 
	
	$('#reportType,#asonDate,#dt1,#dt2,#rptCurrency,#ReporefSeq').attr("disabled", true);
	
	$( "#btnClear").click(function() {
	
		 location.href="XBRL_CRT_BLS0103_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
	
	});
	
	$( "#btnGo").click(function() {

		  if($("#function1").val()=="Select"){
			  $("#function1").focus();
			
			
			$("#fun").show().fadeOut(2000);
		       $("#fun").html("Select function Name");

		  }
		  if($("#function1").val()=="verifycancel"){
				 location.href = "XBRL_VER_BLS0103_01.jsp?reptype="+$("#reportType").val(); 
				
		  }
		  else if($("#function1").val()=="AddEntity"){
		
		
			
			  if($("#dt1").val()==""){
			 $("#dt1").focus();
		
		
		
	       
			}else if($("#dt2").val()==""){
			 $("#dt2").focus();

    
		} else if($("#dt1").val()!="" && $("#dt2").val()!=""){
			
			
			
			var dt1 = $("#dt1").val();
			 
			var dtc = {
					  "dt1" : $("#dt1").val(),"dt2" : $("#dt2").val(),"reptype":$("#reportType").val()
					}; 
			 
			 $.ajax({
			     url : "BLS0103criteria",
			     data : dtc,
					dataType : 'json', 
					type : 'POST',
					async : true,
					 success : function(res) {						 
						 console.log(res.bls0103);
						 
					 if(res.bls0103== 0){
							
							 
							 swal(
										  '',
										  'No Data Found!',
										  'error'
										);
							 return false;
						 }else{  
							
								
								location.href = "XBRL_REP_BLS0103_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val()+"&ReporefSeq="+$("#ReporefSeq").val()+"&reptype="+$("#reportType").val()+"&typo="+"sum"+"&curr="+$("#rptCurrency").val();
								
							}  
						
						 }
				});
			
		}
		
			
			
			
		}
		  
		  
		  if($("#function1").val()=="EditEntity"){
			  
			  
			  if($("#asonDate").val()==""){
					 $("#asonDate").focus();
				
			}
			  else if($("#ReporefSeq").val()==""){
			 $("#ReporefSeq").focus();
		
		
		$("#etid").show().fadeOut(2000);
	       $("#etid").html("Enter Report Ref No");
	} 
			  else{	
				  
					
					location.href = "XBRL_REP_BLS0103_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val()+"&ReporefSeq="+$("#ReporefSeq").val()+"&reptype="+$("#reportType").val()+"&typo="+"sum"+"&curr="+$("#rptCurrency").val();
					  }   
			  
			  
		  }
		
	
	
	
	});
	

		 $("#function1").change(function(){
			
		     var status = this.value;
		     
		   if(status=="AddEntity"){
			   $('.mant').css('color', 'red');
			   $("#dt1,#dt2,#asonDate,#ReporefSeq").val('');
			   $('.mants').css('color', '#eee');
			   
			   $('.mantsb').css('color', '#eee');
			   
			   $("#dt1, #dt2, #asonDate,#rptCurrency").attr("disabled", false);
			   $("#ReporefSeq").attr("disabled", true);
			   
		  
		   
		   } else if(status=="EditEntity"){
			 
			   $('.mants').css('color', 'red');
			   
			   $('.mant').css('color', '#eee');
			   
			   $('.mantsb').css('color', '#428bca');
			   $("#dt1").val('');
			   $("#dt2").val('');
			   
			  
			   $("#dt1, #dt2, #rptCurrency").attr("disabled", true);
			   $("#ReporefSeq, #asonDate").attr("disabled", false);
		   }else if(status=="Select"){
			   $("#dt1, #dt2, #asonDate,#rptCurrency,#ReporefSeq").val("");
			   
		   }
		  });
		 
		
 }); 
 
 


function fnentity(){
	
	//alert("HAI");
	if($("#asonDate").val()==""){
		$("#asonDate").focus();
		$("#asondt").show().fadeOut(2000);
	}else{
		myWindow6 = window.open("XBRL_ENT_BLS0103_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val(),"50",
		"width=350,height=250,left=0,top=150,menubar=no,status=yes,location=no,toolbar=no,scrollbars=yes");
	}
	
	
	
}


function childwindow(a){
	//alert(a);
	$("#ReporefSeq").val(a);
}

$(window).load(function() {
    $(".loader").fadeOut("slow");
});
</script>
<script>
$(document).ready(function(){

var repid={
			"repid":$("#reportType").val()
	};
	$.ajax({
		url:"reportupload",
		data:repid,
		dataType:'json',
		type:'POST',
		async:false,
		success:function(res){
			console.log(res.upflg);
			if(res.upflg=="Y" || res.upflg=="y"){
				$("#btnUpload").show();
			}else{
				$("#btnUpload").hide();
			}
			
		}
	});



$( "#btnUpload").click(function() {
		 if($("#function1").val()=="Select"){
			  $("#function1").focus();
			
			
			$("#fun").show().fadeOut(2000);
		       $("#fun").html("Select function Name");

		  }
		  
		 else  if($("#function1").val()=="AddEntity"){
		
		
			
			  if($("#dt1").val()==""){
			 $("#dt1").focus();
		
		
		
	       
			}else if($("#dt2").val()==""){
			 $("#dt2").focus();

   
		} else {
			var dt1 = $("#dt1").val();
			 
			var dtc = {
					  "dt1" : $("#dt1").val(),"dt2" : $("#dt2").val()
					}; 
			 
			 $.ajax({
			     url : "BLS0103criteria",
			     data : dtc,
					dataType : 'json', 
					type : 'POST',
					async : true,
					 success : function(res) {						 
						 console.log(res.bls0103);
						$("#count").val(res.bls0103);
						
						 if(res.bls0103>0){ 
							 swal({
								    title: "Are you sure?",
								    text: " Data Already exist for given date. Do you want to reupload?",
								    type: "warning",
								    showCancelButton: true,
								    confirmButtonColor: '#DD6B55',
								    confirmButtonText: 'Yes',
								    cancelButtonText: "No"
								 }).then(
								       function () {  $(".container1").modal('toggle');  },
								       function () { return false; });
						  }else{
							  
							 
							 $(".container1").modal('toggle'); 
						 } 
					 
						
						 }
				});
			 
		
		/*  myWindow6 = window.open("Fileupload.jsp","50",
			"width=850,height=550,left=0,top=150,menubar=no,status=yes,location=no,toolbar=no,scrollbars=yes"); */
		} }});

});

function fnFile() {
	
	var filetype = document.getElementById("fd");
	filetype.onchange = function(e) {
		
		
		var ext = this.value.match(/\.(.+)$/)[1].toLowerCase();
	alert(ext); 
		switch (ext) {
		//alert("inside switch");
		case 'xls':
		case 'xlsx':
		case 'csv':
		break;
		default:
			alert('Allows only Excel (.xls,.xlsx,.csv) File Only');
			this.value = '';
		}
	};
}
function sub() {

	if (document.getElementById("fd").value == "" ) {

		alert("Please Upload File");
		

	} else {
		var ext = document.getElementById("fd").value.match(/\.(.+)$/)[1].toLowerCase();
		$("#divLoading").addClass('show'); 
		 $(".container1").modal('toggle'); 
			
			if(ext=="csv"){
				
				 CriteriaForm.action="drcsvuploadFilebls103.action?method=bls0103Upload1"+"&dt2="+$("#dt2").val()+"&cnt="+$("#count").val();
					CriteriaForm.submit();
			 }else{
				 
				 CriteriaForm.action="druploadFilebls103.action?method=bls0103Upload"+"&dt2="+$("#dt2").val()+"&cnt="+$("#count").val();
					CriteriaForm.submit();
			 }
		
	}
	
}
function fnHome(){
	 $(".container1").modal('toggle'); 
	
}
</script>




<body>

<div class="loader"></div>
	<form class="form-horizontal" method="post" name="CriteriaForm" id="cform"
		enctype="multipart/form-data">
		
		
        <input type="hidden" id="count">
		
		<div class="panel-heading " 
			style="width:86%; 
    margin-left: 53px;
    margin-right: 0px; margin-top: 36px; margin-bottom: 20px; background-color: #bbc3cb;">
		
			
			<font size="2"><b> BLS0103   XBRL Report : <b id="sub"
					Style="display: none"></b></b> Investments in Shares and Fixed-dated securities		
					 </font>
	<!-- <div class="pull-right">
	
	<a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > BLS0103 </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">PSC0501 </span></a>
	</div>		 -->
 
			
		</div>
		
		<!-- <div class="container-fluid" >





			<div class="panel-body">
				 -->
				
					<div  class="container-fluid gmd-1 hover " STYLE="padding-top: 23px;
    width: 85%;
    margin-left: 60px;">

					<div class="form-group ">
						<div class="col-sm-6 col-md-offset-3">
							<label class="col-sm-3 control-label" style="margin-top: 4px;"><font
								size="1">Function</font><span
								style="color: red; font-size: 10px;" class="mantss">*</span></label> 
								
							<select	name="function" id="function1" onclick="" class="form-control">
								
								<option value="Select">Select</option>
								<option value="AddEntity">Generate New Report</option>
<!-- 								<option value="EditEntity">Modify Existing Report</option>
 -->								
		
							</select>
							
							<span style="color: red; font-size: 10px; display: none; padding-left: 125px;" id="fun" class="error">Enter function Name</span>

						</div>
					</div>
				
				<div class="col-md-1">   </div>

				<div class="form-group ">
						<div class="row col-sm-12 ">
							<label class="col-sm-2 control-label" style="margin-top: 4px;"><font
								size="1">Report Type</font></label>
							<div class="col-sm-3 ">
								<input type="text" name="reportType" id="reportType" value="BLS0103"
									class="form-control" />

							</div>
						
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" style="margin-top: 4px;"><font
								size="1">As On date</font></label>
							<div class="col-sm-3">
								<input type="text" name="dt3" id="asonDate"
									value="" class="form-control" placeholder="dd-mm-yyyy" />
<span style="color: red; font-size: 10px; display: none;" id="asondt" class="error">Select as on date</span>

							</div>

						</div>
					</div>

					<div class="form-group ">
						<div class="row col-sm-12 ">
							<label class="col-sm-2 control-label" style="margin-top: 4px;"><font
								size="1">From date</font><span
								style="color: red; font-size: 10px;" class="mant">*</span></label>
							<div class="col-sm-3 ">
								<input type="text" name="dt1" id="dt1" value=""
									class="form-control" placeholder="dd-mm-yyyy" />
									
									<!-- <span style="color: red; font-size: 10px; display: none; padding-left: 125px;" id="frmdt" class="error">Enter From Date</span> -->

							</div>
							<!-- <div class="col-sm-1" id="datepicker"><a href="#" ><i class="glyphicon glyphicon-calendar icon" ></i></a></div> -->
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" style="margin-top: 4px;"><font
								size="1">To date</font><span
								style="color: red; font-size: 10px;"  class="mant">*</span></label>
							<div class="col-sm-3">
								<input type="text" name="dt2" id="dt2"
									value="" class="form-control" placeholder="dd-mm-yyyy" />
									
								<!-- <span style="color: red; font-size: 10px; display: none; padding-left: 125px;" id="todt" class="error">Enter To Date</span> -->

							</div>

						</div>
					</div>
					
					
					
					<div class="form-group ">
						<div class="row col-sm-12 ">
						<!-- 	<label class="col-sm-2 control-label" style="margin-top: 4px;"><font
								size="1">Report Ref No</font><span
								style="color: red; font-size: 10px;"  class="mants">*</span></label>
							<div class="col-sm-3 ">
								<input type="text" name="ReporefSeq" id="ReporefSeq" value=""
									class="form-control"  />
								<span style="color: red; font-size: 10px; display: none;" id="etid" class="error">Enter Report Ref No</span>

							</div>
							<div class="col-sm-1" ><a href="#"><i class="glyphicon glyphicon-search icon mantsb" id="search" onclick="fnentity();"></i></a></div> 
 -->
						
							<label class="col-sm-2 control-label" style="margin-top: 4px; "><font
								size="1">Report Currency</font><span
								style="color: red; font-size: 10px;"  class="mants"></span></label>
							<div class="col-sm-3">
							<select name="rptCurrency" id="rptCurrency"
									 class="form-control">
							<option value="MUR">MUR</option>
							<option value="USD">USD</option>
							</select>
								<!-- <input type="text" name="rptCurrency" id="rptCurrency"
									value="" class="form-control"/> -->

							</div>

						</div>
					</div>
					

				</div>
				
<div class="container1" >

						 
						<div class="panel-heading" style="padding-left: 84px;"><font size="3"><b>BLS0103 - Upload</b></font>
						<button type="button" class="close" data-dismiss="modal">&times;</button> </div>
  <div class="center-div" style="text-align:center">
<br><br>
      <!--   <label>Upload button</label> -->
        <input type="file" id="fd" name="fileUpload"
									 onclick="fnFile();" />
    
  
 <br><br>
  <input type="button" value="Upload" onclick="sub();">
 <!--  <input type="button" value="Download Format" onclick="fnDown();"> -->
   <input type="button" value="Cancel" onclick="fnHome();">
  </div>


</div>


				
				<div class="modal-footer">

					<button type="button" class="btn btn-xs btn-primary" id="btnGo">Go</button>
					<button type="button" class="btn btn-xs btn-primary" id="btnUpload">Upload</button>
					<button type="button" class="btn btn-xs btn-primary" id="btnClear">Clear</button>
					
				</div>




			</div>


		</div>
		
	</form>
</body>

<!-- <script type="text/javascript" src="XBRL_CRT_BLS0103.js"></script> -->

</html>



