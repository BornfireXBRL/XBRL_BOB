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
<script  type="text/javascript" src="../../js/sweetalert/sweetie.js"></script>
<!-- <link href="https://cdn.jsdelivr.net/sweetalert2/5.3.8/sweetalert2.css" rel="stylesheet"/> -->


 <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">  -->
	<link rel="stylesheet" href="/../../css/animatee.css">
	<script src="../../js/am.js"></script> 
<!-- <script src="../JS/jquerydatepicker.js"></script> -->
<!-- <script src="../JS/bootbox.min.js"></script>   -->

</head>
<style>



.tl {

border-style: solid;
    border-color: #337ab7;
    border-width: 1px;
   
}






/* .hover {
    background-color: #f1f1f1;
    padding: 0.01em 16px;
    margin: 20px 0;
    box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12)!important;
} */

.tl {
  -webkit-box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
  -moz-box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
  -ms-box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
  -o-box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
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
    padding-right: 34px;
}

.panel-body {
	width: 1075px;
}

.btn {
	width: 50px;
}

.glyphicon {
	top: 4px;
	margin-left: -58px;
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
	
    $( "#dt1" ).datepicker({
    	
    	 dateFormat: "dd-mm-yy",
         changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      maxDate: new Date(),
		      
        onClose: function() {
            var date2 = $('#dt1').datepicker('getDate');
            date2.setDate(date2.getDate()+0)
            $( "#dt2" ).datepicker("setDate", date2);
            $('#dt3').val($('#dt2').val());
        }
    });
    $( "#dt2" ).datepicker({
    	
    	 dateFormat: "dd-mm-yy",
         changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      maxDate: new Date(),
   
        onClose: function() {
            var date3 = $('#dt2').datepicker('getDate');
            date3.setDate(date3.getDate()-0)
            $( "#dt1" ).datepicker("setDate", date3);
            $('#dt3').val($('#dt2').val());
        }
    });
    
    
    $( "#dt3" ).datepicker({
    	
   	 dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      maxDate: new Date(),
       onClose: function() {
           var date4 = $('#dt3').datepicker('getDate');
           date4.setDate(date4.getDate()-0)
           $( "#dt1" ).datepicker("setDate", date4);
           $('#dt2').val($('#dt3').val());
       }
   });
   
});







$(document).ready(function(){
	
	
	$('.mant').css('color', '#eee');
	$('.mants').css('color', '#eee');
	 $('.mantss').css('color', 'red');
	 
	 $('.mantsb').css('color', '#eee');
	 
	
	$('#reportType,#dt3,#dt1,#dt2,#rptCurrency,#ReporefSeq').attr("disabled", true);
	
	$( "#btnClear").click(function() {
		//alert("are you want to clear the fields!");
	$('#cform')[0].reset();
	
	});
	
	$( "#btnGo").click(function() {
		
	//alert("Please Select the Function");
		
		/*  +"<div id='loadingBar'> "+ 
		 +"<div id='bar'> </div> "+
		 +"</div>"+
		
		  
		 function animateLoad(animationLength){
			 $('#bar').css('left','-100%');
			 $('#bar').html('');
			 $('#bar').stop().animate({
			    left: '+=100%'
			  }, animationLength, function() {
			    $('#bar').html('Load complete');
			  }); 
			}

			$('document').ready(function(){
			  var animationLength = 5000;
			  $('#loadingTimer').change(function(){ 
			    animationLength = $(this).val() * 1000;
			    animateLoad(animationLength);
			  });
			  
			  animateLoad(animationLength);
			});
       */
    

  

		
		  if($("#function1").val()=="Select"){
			  $("#function1").focus();
			//alert("Please Select the function");
			
			$("#fun").show().fadeOut(2000);
		       $("#fun").html("Select function Name");

		  }
		  
		  if($("#function1").val()=="AddEntity"){
		
			  //alert("ADD ENTITY");
			
			  if($("#dt1").val()==""){
			 $("#dt1").focus();
		//alert("Please Select the FromDate");
		
		$("#frmdt").show().fadeOut(2000);
	       $("#frmdt").html("Enter From Date");
	       
			}else if($("#dt2").val()==""){
			 $("#dt2").focus();
	//alert("Please Select the dt2");
	
	$("#todt").show().fadeOut(2000);
    $("#todt").html("Enter To Date");
    
		} else if($("#dt1").val()!="" && $("#dt2").val()!=""){
			
			//alert("HAI date");
					
			//alert("HAI date" + $("#dt1").val());
			
			var dt1 = $("#dt1").val();
			
		
			
			
			//var textarea_value = $("#dt1").val();
			 
			 
			 
			var dtc = {
					  "dt1" : $("#dt1").val()
					}; 
			 
			 $.ajax({
			     url : "FIM0500criteria",
			     data : dtc,
					dataType : 'json', 
					type : 'POST',
					async : true,
					 success : function(res) {						 
						 console.log(res.kasama);
						// alert(res.fun);
						//alert("eeeeeeeeeeeeeeeeeeeee");
						 //alert("1111" + res.count);
						 
						 if(res.kasama == 0){
							 swal(
									  '',
									  'No Data Found!',
									  'error'
									);
							 return false;
						 }else{  
							 
							 location.href = "XBRL_REP_FIM0500_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val()+"&reptype="+$("#reportType").val()+"&typo="+"sum"+"&curr="+$("#rptCurrency").val()+"&rtime="+$("#rpttime").val();
								
							}  
						
						 }
				});
			
		}
		
			
			
			
		}/* else{
				
				location.href = "XBRLReport1.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val();
				  } */
		  
		  
		  
		  
		  
		  
		  if($("#function1").val()=="EditEntity"){
			  
			  //alert("Edit ENTITY");
			  
			  if($("#ReporefSeq").val()==""){
			 $("#ReporefSeq").focus();
		//alert("Please Enter the Entity Id");
		
		$("#etid").show().fadeOut(2000);
	       $("#etid").html("Enter Report Ref No");
	} 
			  else{
					
				  
					location.href = "XBRL_REP_FIM0500_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val()+"&ReporefSeq="+$("#ReporefSeq").val()+"&reptype="+$("#reportType").val()+"&typo="+"sum"+"&curr="+$("#rptCurrency").val()+"&rtime="+$("#rpttime").val();

					//alert("From Date" + $("#dt1").val());
					 }   
			  
			  
		  }
		//location.href = "XBRLReport.jsp?dt1="+$(this).val();
		
		/* CriteriaForm.action="bopDetails.action?method=detailsBop";
		CriteriaForm.submit(); */
	});
	
	
	
	
	
	/*  $(function () {           
		            var d = new Date().getDate();
		            var m = new Date().getMonth() + 1; // JavaScript months are 0-11
		            var y = new Date().getFullYear();
		            $("[id$=dt3]").val(d + "/" + m + "/" + y);
		            $("[id$=dt3]").datepicker({ weekStart: 1, dateFormat: 'dd/mm/yy' });
		        });
	 */
	
	

		 $("#function1").change(function(){
			
		     var status = this.value;
		     
		   if(status=="AddEntity"){
			   $('.mant').css('color', 'red');
			   
			   $('.mants').css('color', '#eee');
			   
			   $('.mantsb').css('color', '#eee');
			   
		     $("#dt1, #dt2, #dt3").attr("disabled", false);
		   $("#rptCurrency,#ReporefSeq").attr("disabled", true);
		   
		   } else if(status=="EditEntity"){
			 
			   $('.mants').css('color', 'red');
			   
			   $('.mant').css('color', '#eee');
			   
			   $('.mantsb').css('color', '#428bca');
			   $("#dt1").val('');
			   $("#dt2").val('');
			   
			  
			   $("#dt1, #dt2, #rptCurrency").attr("disabled", true);
			   $("#ReporefSeq, #dt3").attr("disabled", false);
		   }
		  });

		
	
	
 
				 $( "#dt3,#dt1,#dt2").datepicker({
	    		    	
	    		        dateFormat: 'dd-mm-yy',
	    		    	changeMonth: true,//this option for allowing user to select month
	    		      changeYear: true //this option for allowing user to select from year range
	    		      
	    		    }); 
 }); 
 
 



function fnentity(){
	
	//alert("HAI");

	if($("#dt3").val()==""){
		$("#dt3").focus();
		$("#dt333").show().fadeOut(2000);
	}else{
		myWindow6 = window.open("XBRL_ENT_FIM0500_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val(),"50",
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
			     url : "FIM0500criteria",
			     data : dtc,
					dataType : 'json', 
					type : 'POST',
					async : true,
					 success : function(res) {						 
						 console.log(res.kasama);
						$("#count").val(res.kasama);
						 if(res.kasama>0){ 
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
	//alert(ext); 
		switch (ext) {
		//alert("inside switch");
	//	case 'xls':
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
				
				 CriteriaForm.action="drcsvuploadFilefim500.action?method=fim0500Upload1"+"&dt2="+$("#dt2").val()+"&cnt="+$("#count").val();
					CriteriaForm.submit();
			 }else{
				 
				 CriteriaForm.action="druploadFilefim500.action?method=fim0500Upload"+"&dt2="+$("#dt2").val()+"&cnt="+$("#count").val();
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
        
		
		<div class="panel-heading  tl" 
			style=" margin-right: 21px; margin-top: 36px; margin-bottom: 20px; margin-left: 63px;background-color: #bbc3cb;width: 85%;">
			
			
			
			<font size="2"><b> FIM 0500  XBRL Report : <b id="sub"
					Style="display: none"></b></b> Foreign Currency Transactions
</font>
			
			

			
			
		</div>

		



<!-- <div class="panel-body"> -->
				
				<div  class="container-fluid gmd-1 hover " STYLE="padding-top: 23px;
    width: 85%;
    margin-left: 60px;">


					<div class="form-group ">
						<div class="col-sm-6 col-md-offset-3">
							<label class="col-sm-3 control-label" style="margin-top: 4px;"><font
								size="1">Function</font><span
								style="color: red; font-size: 10px;" class="mantss">*</span></label> <select
								name="function" id="function1" onclick="" class="form-control">

								<option value="Select">Select</option>
								<option value="AddEntity">Generate New Report</option>
								<option value="EditEntity">Modify Existing Report</option>


							</select> <span
								style="color: red; font-size: 10px; display: none; padding-left: 125px;"
								id="fun" class="error">Enter function Name</span>

						</div>
					</div>

					<div class="col-md-1"></div>

					<div class="form-group ">
						<div class="row col-sm-12 ">
							<label class="col-sm-2 control-label" style="margin-top: 4px;"><font
								size="1">Report Type</font></label>
							<div class="col-sm-3 ">
								<input type="text" name="reportType" id="reportType"
									value="FIM0500" class="form-control" />

							</div>

							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" style="margin-top: 4px;"><font
								size="1">As On date</font></label>
							<div class="col-sm-3">
								<input type="text" name="dt3" id="dt3" value=""
									class="form-control" placeholder="dd-mm-yyyy" />
<span style="color: red; font-size: 10px; display: none;" id="dt333" class="error">Select as on date</span>

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
								style="color: red; font-size: 10px;" class="mant">*</span></label>
							<div class="col-sm-3">
								<input type="text" name="dt2" id="dt2" value=""
									class="form-control" placeholder="dd-mm-yyyy" />

								<!-- <span style="color: red; font-size: 10px; display: none; padding-left: 125px;" id="todt" class="error">Enter To Date</span> -->

							</div>

						</div>
					</div>



					<div class="form-group ">
						<div class="row col-sm-12 ">
							<label class="col-sm-2 control-label" style="margin-top: 4px;"><font
								size="1">Report Ref No</font><span
								style="color: red; font-size: 10px;" class="mants">*</span></label>
							<div class="col-sm-3 ">
								<input type="text" name="ReporefSeq" id="ReporefSeq" value=""
									class="form-control" /> <span
									style="color: red; font-size: 10px; display: none;" id="etid"
									class="error">Enter Report Ref No</span>

							</div>
							<div class="col-sm-1">
								<a href="#"><i
									class="glyphicon glyphicon-search icon mantsb" id="search"
									onclick="fnentity();"></i></a>
							</div>
<label class="col-sm-2 control-label"
								style="margin-top: 4px;"><font
								size="1">Reporting time</font><span
								style="color: red; font-size: 10px;" class="mants"></span></label>
							<div class="col-sm-3">
								<select name="rpttime" id="rpttime"
									class="form-control" />
									<option value="AM">Morning</option>
							<option value="PM">Evening</option>
</select>
							</div>
							
						</div>
					</div>
							
					<div class="form-group ">
						<div class="row col-sm-12 ">
							<label class="col-sm-2 control-label"
								style="margin-top: 4px;"><font
								size="1">Report Currency</font><span
								style="color: red; font-size: 10px;" class="mants"></span></label>
							<div class="col-sm-3">
								<select name="rptCurrency" id="rptCurrency"
									class="form-control" />
									<option value="MUR">MUR</option>
							<option value="USD">USD</option>
</select>
							</div>
							</div>
							</div>

					</div>
					
<div class="container1" >

						 
						<div class="panel-heading" style="padding-left: 84px;"><font size="3"><b>FIM0500 - Upload</b></font>
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

					
					
					<div class="modal-footer ">

					<button type="button" class="btn btn-xs btn-primary" id="btnGo">Go</button>
					<button type="button" class="btn btn-xs btn-primary" id="btnUpload">Upload</button>
					<button type="button" class="btn btn-xs btn-primary" id="btnClear">Clear</button>

				</div>


				
				






	</form>
</body>

<!-- <script type="text/javascript" src="XBRL_CRT_FIM0500_01.js"></script> -->

</html>



