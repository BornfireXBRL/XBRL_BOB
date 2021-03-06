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
.container1
{
    position: fixed; /* Sit on top of the page content */
  top: 10px; 
    left: 0;
    right: 0;
    bottom: 0;
display:none;
border: 1px outset;
width: 388px;
height:220px;
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

.btn {
	width: 50px;
}

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
    
    
#divLoading{
display:none;
} 
.show {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url('../../images/Loader.gif') 30% 30% no-repeat rgb(249,249,249);
    opacity: .8;
}

</style>
<script>
$(document).ready(function(){
	
	
	var repid={
			"repid":$("#reportType").val()
	};
	$.ajax({
		url:"repdate",
		data:repid,
		dataType:'json',
		type:'POST',
		async:false,
		success:function(res){
			console.log(res.repdate);
			var b=JSON.parse(res.repdate);
	
			for(var i=0;i<b.length;i++){
				
				$("#asonDate").append('<option value="'+b[i].repdate+"/"+b[i].reprefno+'">'+b[i].repdate+'</option>');	
			}
			
			
		}
	});

	var date4 ="";
   $("#asonDate").on("change",function(){
	  /*  $("#dt1").attr("disabled",false);
	   $("#dt2").attr("disabled",false); */
	   $("#ReporefSeq").val($("#asonDate").val().split("/")[1]);
	   if(!$("#asonDate").val().split("/")[0]==""){
var date="";
var month="";
var year="";
		   date4 = $("#asonDate").val().split("/")[0];
		   
           if (date4) {
        	   date=new Date();
        	   date.setDate( date4.split("-")[0]);
        	 
        	  date.setMonth(date4.split("-")[1]-1);
        	  date.setYear(date4.split("-")[2]);
               $('#dt2').val($("#asonDate").val().split("/")[0]);
              
               month= new Date(date.getFullYear(), date.getMonth() + 1, 0);
               month.setDate(1);
          
          // alert(month.getDate()+"-"+(month.getMonth()+1)+"-"+month.getFullYear());
               $('#dt1').val(month.getDate()+"-"+(month.getMonth()+1)+"-"+month.getFullYear());
		   
		  
	   }
           }
	   
	   if($("#asonDate").val().split("/")[0]){
		   
	   }
   });
    
  
   
    
	
	$('.form-control').attr("disabled", true);
	$("#asonDate").attr("disabled",false);
	$( "#btnClear").click(function() {
	
	$('#cform')[0].reset();
	
	});
	
	$( "#btnGo").click(function() {

		 
		
		
			
			  if($("#dt1").val()==""){
			 $("#dt1").focus();
		
		
		
	       
			}else if($("#dt2").val()==""){
			 $("#dt2").focus();

    
		} else if($("#dt1").val()!="" && $("#dt2").val()!=""){
			
			
			
			var dt1 = $("#dt1").val();
			 
			var dtc = {
					  "dt1" : $("#dt1").val(),"dt2" : $("#dt2").val()
					}; 
			 
			 $.ajax({
			     url : "pym0100criteria",
			     data : dtc,
					dataType : 'json', 
					type : 'POST',
					async : true,
					 success : function(res) {						 
						 console.log(res.pym0100);
						
						 
						 if(res.pym0100 == 0){
							
							 
							 swal(
										  '',
										  'No Data Found!',
										  'error'
										);
							 return false;
						 }else{  
							
								
								location.href = "XBRL_REPAr_PYM0100_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val()+"&reptype="+$("#reportType").val()+"&typo="+"sum"+"&curr="+$("#rptCurrency").val()+"&ReporefSeq="+$("#ReporefSeq").val();
								
							}  
						
						 }
				});
			
		}
		
			
			
			
	
		  
		  
		
		
	});
	
	
	
	


 }); 
 
 


function fnentity(){
	
	//alert("HAI");
	
	
	myWindow6 = window.open("XBRL_ENTAr_PYM0100_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val(),"50",
	"width=350,height=250,left=0,top=150,menubar=no,status=yes,location=no,toolbar=no,scrollbars=yes");
}


function childwindow(a){
	//alert(a);
	$("#ReporefSeq").val(a);
}




$(window).load(function() {
    $(".loader").fadeOut("slow");
});
 
</script>

<body>

<div class="loader"></div>
	<form class="form-horizontal" method="post" name="CriteriaForm" id="cform"
		enctype="multipart/form-data">
		
		<div id="divLoading"> 
    </div>
        <input type="hidden" id="count">
		
		<div class="panel-heading text-center" 
			style="width: 94%;  align:center; display: block;
    margin-left: auto;
    margin-right: auto; margin-top: 36px; margin-bottom: 20px;height:30px; background-color: #bbc3cb;">
			
			
			
			<font size="2"><b> PYM 0100  XBRL Report : <b id="sub"
					Style="display: none"></b></b> Statistics for Interbank Clearing Cheques </font>
			

			
		</div>
		
		<div class="container-fluid" >





			<div class="panel-body">
				
				<div  class="container-fluid gmd-1 hover " STYLE="padding-top: 23px;
    width: 100%;">

					

				<div class="form-group ">
						<div class="row col-sm-12 ">
							<label class="col-sm-2 control-label" style="margin-top: 4px;"><font
								size="1">Report Type</font></label>
							<div class="col-sm-3 ">
								<input type="text" name="reportType" id="reportType" value="PYM0100"
									class="form-control" />

							</div>
						
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" style="margin-top: 4px;"><font
								size="1">As On date</font></label>
							<div class="col-sm-3">
								<select name="dt3" id="asonDate"
									value="" class="form-control"  ><option value="">Select</option></select>
<span style="color: red; font-size: 10px; display: none;" id="asondt" class="error">Select as on date</span>

							</div>

						</div>
					</div>

					<div class="form-group ">
						<div class="row col-sm-12 ">
							<label class="col-sm-2 control-label" style="margin-top: 4px;"><font
								size="1">From date</font><!-- <span
								style="color: red; font-size: 10px;" class="mant">*</span> --></label>
							<div class="col-sm-3 ">
								<input type="text" name="dt1" id="dt1" value=""
									class="form-control" placeholder="dd-mm-yyyy" />
									
									<!-- <span style="color: red; font-size: 10px; display: none; padding-left: 125px;" id="frmdt" class="error">Enter From Date</span> -->

							</div>
							<!-- <div class="col-sm-1" id="datepicker"><a href="#" ><i class="glyphicon glyphicon-calendar icon" ></i></a></div> -->
							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" style="margin-top: 4px;"><font
								size="1">To date</font><!-- <span
								style="color: red; font-size: 10px;"  class="mant">*</span> --></label>
							<div class="col-sm-3">
								<input type="text" name="dt2" id="dt2"
									value="" class="form-control" placeholder="dd-mm-yyyy" />
									
								<!-- <span style="color: red; font-size: 10px; display: none; padding-left: 125px;" id="todt" class="error">Enter To Date</span> -->

							</div>

						</div>
					</div>
					
					
					
					<div class="form-group ">
						<div class="row col-sm-12 ">
							<label class="col-sm-2 control-label" style="margin-top: 4px;"><font
								size="1">Report Ref No</font><!-- <span
								style="color: red; font-size: 10px;"  class="mants">*</span> --></label>
							<div class="col-sm-3 ">
								<input type="text" name="ReporefSeq" id="ReporefSeq" value=""
									class="form-control"  />
								<span style="color: red; font-size: 10px; display: none;" id="etid" class="error">Enter Report Ref No</span>

							</div>
							<div class="col-sm-1" ><!-- <a href="#"><i class="glyphicon glyphicon-search icon mantsb" id="search" onclick="fnentity();"></i></a> --></div> 

						
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
				
				<div class="modal-footer">

					<button type="button" class="btn btn-xs btn-primary" id="btnGo">Go</button>
					
					<button type="button" class="btn btn-xs btn-primary" id="btnClear">Clear</button>
					
				</div>




			</div>


		</div>
		
	</form>
</body>

<!-- <script type="text/javascript" src="XBRL_CRT_PYM0100.js"></script> -->

</html>



