<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLFIM0100Bean,dao.XBRLFIM0100Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
    <%@ page import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat"%>
    
    
    
     
    
     <%
    DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Date date = new Date();
	
	String username = session.getAttribute("userName").toString();
    String curdate = dateFormat.format(date);
%>

	 
  <%
 
 
 String rptdate = request.getParameter("rptdate");
 
 String dt1 = request.getParameter("dt1");
 String dt2 = request.getParameter("dt2");
 
 String reptype=request.getParameter("reptype");
 String curr = request.getParameter("curr");
 String typo=request.getParameter("typo");

String types=request.getParameter("types");

String instno = request.getParameter("instno");
String ReporefSeq = request.getParameter("ReporefSeq");
 
 XBRLFIM0100Dao dmd=new XBRLFIM0100Dao();
 
 DecimalFormat df = new DecimalFormat("##,#0.00");
	   
	
 	
    %>
    
   
  

    
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;url=../XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" /> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>XBRL REPORT</title>

<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="ib.viewport">
<!-- Bootstrap 3.3.6 -->
  
  <link rel="stylesheet" href="../../css/bootstrap.min.css"> <!-- style page -->
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 
 <link rel="stylesheet" href="../../Bootstrap/css/bootstrap.min.css">

<!--  
 <link href="../../css/bootstrap/bootstrap.css" /> -->
  <link rel="stylesheet" href="../../css/ajax/ajax.css" />
 <script src="../../jQuery/jQuery-2.2.0.min.js"></script>
<link rel="stylesheet" media="all" type="text/css"
	href="../../js/TimePicker/jquery-ui.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="../../js/TimePicker/jquery-ui-timepicker-addon.css" />
	<script type="text/javascript"
	src="../../js/TimePicker/jquery-1.10.3-ui.min.js"></script>
<script type="text/javascript"
	src="../../js/TimePicker/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript"
	src="../../js/TimePicker/jquery-ui-sliderAccess.js"></script>
  <script src="../../js/bootstrap.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
 -->
   <script src="../../js/ajax/ajax.js"></script>
 
 <!-- datepicker -->

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
	
  	

  	<link rel="stylesheet" href="../../CSS/bootstrap-datepicker.css" />

<title>XBRL REPORT</title>
</head>

<style>
.filterable {
    margin-top: 15px;
}
.filterable .panel-heading .pull-right {
    margin-top: -20px;
}
.filterable .filters input[disabled] {
    background-color: transparent;
    border: none;
    cursor: auto;
    box-shadow: none;
    padding: 0;
    height: auto;
}
.body{
font-family: arial;
    font-size: 11px;
    line-height: 1.42857143;
    color: #333;

}
.filterable .filters input[disabled]::-webkit-input-placeholder {
    color: #333;
}
.filterable .filters input[disabled]::-moz-placeholder {
    color: #333;
}
.filterable .filters input[disabled]:-ms-input-placeholder {
    color: #333;
}
.panel-primary>.panel-heading {
    color: #fff;
    background-color: #bbc3cb;
    border-color: #bbc3cb;
}
.panel-title {
   
    font-size: 12px;
    }
    .panel-heading {
    padding: 8px;
    }
   .form-control {
   font-size: 11px;
   width: 80%;
    height: 25px;
    }
    
    body {
   font-size: 10px;
   font-family: arial;
   }
   .panel-primary {
    border-color: rgba(18,18,19,0.22);
}
.modal-footer {
   text-align:center;
    border-top: 0;
    padding: 25px;
   padding-right: 208px;
}
.clr{
color: #0c0b0b;
    background-color: #f5f5f5;
    border-color: #f5f5f5;
}

 .navright {
	/* background-color: rgb(238, 238, 238); */
	background-image: none;
	background-repeat: no-repeat;
	width: 100%;
	border-radius: 4px;
	float: right;
	height: 30px;
}
 li  .active a{
    backround-color:#f1efef;
  } 
.headingtab {
	font-size: 11px;
	line-height: 0.428971;
}
</style>


<style>



.zui-table thead th {
    background-color: #DDEFEF;
    border: solid 1px #DDEEEE;
    color: #336B6B;
    padding: 10px;
    text-align: left;
    text-shadow: 1px 1px 1px #fff;
}



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



table tbody tr:hover { 

 -webkit-box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  -moz-box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  -ms-box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  -o-box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);



 }



.gmd-4 {
 
}


.table>thead>tr>th {
    vertical-align: top;
    border-bottom: 2px solid #ddd;
}


#notification {
    position:fixed;
    top:40px; /* Set to 0 or wherever */
    width:95%; /* set to 100% if space is available */
    z-index:105;
    text-align:center;
    font-weight:normal;
    font-size:14px;
    font-weight:bold;
    color:white;
    background-color:#58585b;
    padding:5px;
    width:350px;
    padding-left:100px;
}
#notification span.dismiss {
    border:2px solid #FFF;
    padding:0 5px;
    cursor:pointer;
    float:right;
    margin-right:10px;
}
#notification a {
    color:white;
    text-decoration:none;
    font-weight:bold
}


.loader {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url('../images/Loader.gif') 40% 40% no-repeat rgb(249,249,249);
    opacity: .8;
}

.nav-tabs {
    border-bottom: 1px solid #bbc3cb;
}
.filterable .filters input[disabled] {
    background-color: transparent;
    border: none;
    cursor: auto;
    box-shadow: none;
    padding: 0;
    height: auto;
}
.form-control {
	height: 22px;
	border: 1px solid #6b6a6a;
	width: 170px;
	font-size: 11px;
	padding: 3px 12px;
	margin-top: 2px;
}

.form-horizontal .control-label {
	text-align: left;
	padding-top: 0px;
}

textarea.form-control {
	height: 20px;
}

#filter{

padding: 25px;

}

.form-horizontal .form-group {
	margin-top: -13px;
	margin-right: -93px;
	margin-left: -15px;
}

.sumdet{
	
	 text-align: left;

}

.sumder{
	
	 text-align: right;

}


.panel-heading {
    padding: 6px 22px;
    border-bottom: 5px solid transparent;
    height: 41px;
}


.modal-footer {
	text-align: center;
	border-top: 0;
	padding: 25px;
	
}

.panel-body {
	width: 1200px;
}

.btn {
	width: 50px;
}

.glyphicon {
	top: 4px;
	margin-left: -20px;
}

form {
	margin: -7px 0;
}

form input, button {
	padding: 5px;
}

table {
	width: 95%;
	margin-bottom: 20px;
	border-collapse: collapse;
	background-color: #f5f5f5;
}

table, th, th {
	border: 1px solid #cdcdcd;
}


table th, table th {
	padding: 2px;
	text-align: left;
	font-size: 10px;
	font-family: arial;
}

table td{

	padding: 2px;
	text-align: left;
	font-size: 10px;
	font-family: arial;
	background-color: white;

}

table.dataTable tbody th, table.dataTable tbody th {
	padding: 8px 22px;
}

.filterable {
	margin-top: 10px;
}

.nav-tabs>li>a {
	margin-right: 2px;
	line-height: 0.23217;
}

.filterable .panel-heading .pull-right {
	margin-top: 20px;
}


.filterable .filters input[disabled] {
    background-color: transparent;
    border: none;
    cursor: auto;
    box-shadow: none;
    padding: 0;
    height: auto;
}

.filterable .filters input[disabled] {
	background-color: transparent;
	border: none;
	cursor: auto;
	box-shadow: none;
	padding: 0;
	height: auto;
}

.panel-heading {
	/* border-top-left-radius: 17px;
	border-top-right-radius: 17px; */
	padding: 6px 22px;
	border-bottom: 1px solid transparent;
	height: 34px;
}

/* .text-center {
    text-align: center;
} */

.btn-group-xs>.btn, .btn-xs {
    padding: 0px 1px;
    padding-top: -12px;
    margin-top: 0px;
    font-size: 12px;
    line-height: 1.5;
    border-radius: 3px;
    width: 88px;
}

.body {
	font-family: arial;
	font-size: 11px;
	line-height: 1.42857143;
	color: #333;
}

.filterable .filters input[disabled]::-webkit-input-placeholder {
	color: #333;
}

.filterable .filters input[disabled]::-moz-placeholder {
	color: #333;
}

.filterable .filters input[disabled]:-ms-input-placeholder {
	color: #333;
}

.panel-primary>.panel-heading {
	color: #fff;
	background-color: #bbc3cb;
	border-color: #bbc3cb;
}

.panel-title {
	font-size: 12px;
}

.panel-heading1 {
	padding: 8px;
	background: #bbc3cb;
}

.form-control {
	font-size: 11px;
	width: 100%;
	height: 25px;
}

body {
	font-size: 10px;
	font-family: calibri;
}

.panel-primary {
	border-color: rgba(18, 18, 19, 0.22);
}

.modal-footer {
	text-align: center;
	border-top: 0;
	padding: 25px;
	
}

.databody td{
border:1px solid #ddd;
}

.loader {
   position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url('../../images/Loader.gif') 30% 30% no-repeat
		rgb(249, 249, 249);
	opacity: .8;
} 
.
#divLoading {
	display: none;
}

.show {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url('../../images/Loader.gif') 30% 30% no-repeat
		rgb(249, 249, 249);
	opacity: .8;
}

/* 
tr:hover td{
    background: #bebfb0 !important;
}

 */

</style>
<SCRIPT>
function fnload(z,d,e,b,c,a,f,g){
	//z --->typo(load or summary)
	//d -->date1
	//e -->date2
	//b -->refseqno
	//c -->instance no
	//a -->reptype
	//f -->types of details
	//g -->currency
	
	 if(z=="load"){
		 
		//FOR DETAILS
		$(".det").addClass("clr");
		 $("#tab1").show();
		$("#tab2").hide(); 
/* 		$(".psc0500,.psc0501").hide();
 */		var refno=b;
		
		var ins=c;
		
		if(ins==""){
			
			ins=0;
			
		}else{
		
			ins=c;
		} 
		if(refno=="null" || refno==null || refno==""){
			
			refno=0;
		}
		
		 $(".repdisp").text(refno);
		 var srno=1;
		
		 $("#divLoading").addClass("show"); 
		 var rptdate1 = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
			var srno=1;	
			$.ajax({
				url : "SUP0500det1",
				data : rptdate1,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				
					
				
					  $("#de1 tr").remove();
						 
						
						var b=JSON.parse(res.sec1SUP0500d1);
						 console.log(b);
						

							 
			
						 	if(f=="onload"){
						 		$("#detb1").show();
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
							 		  $("#det2").append("<tr><td id='instname_row"+srno+"'>"+b[i].instname+"</td><td id='instcode_row"+srno+"'>"+b[i].instcode+"</td><td  id='res_row"+srno+"'>"+b[i].res+"</td><td  id='nonresi_row"+srno+"'>"+b[i].nonresi+"</td><td  id='total_row"+srno+"'>"+b[i].total+"</td><td style=text-align:center><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>") ;  
							 		  
							 		 
									
									 srno++;
									 
									
										}
									
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 		$("#detb1").show();
						 		$("#modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
							 		  $("#det2").append("<tr><td id='instname_row"+srno+"'>"+b[i].instname+"</td><td id='instcode_row"+srno+"'>"+b[i].instcode+"</td><td  id='res_row"+srno+"'>"+b[i].res+"</td><td  id='nonresi_row"+srno+"'>"+b[i].nonresi+"</td><td  id='total_row"+srno+"'>"+b[i].total+"</td></tr>") ;  
							 		  
							 		  
								 
								
								 srno++;
								
								
									}
						 		 $("#divLoading").removeClass('show');
						 	}
							
							
						 $("#divLoading").removeClass('show'); 
						$('.alnum').mask("#,##0.00", {reverse: true}); 
					
						}
						

						
				
			});   
	 }else{
		//For summary
		$(".summ").addClass("clr");
		$("#tab1").hide();
		$("#tb1").show();
			
			var refno=b;
			var ins=c;
				if(ins=="" || ins=="null" || ins==null ){
					ins=0;
				}else{
					ins=c;
				} 
				if(refno=="null" || refno==null || refno==""){
					refno=0;
				}
				
				  /* $("#divLoading").addClass("show");  */
				
				 $(".repdisp").text(refno);
				 
					var srno=1;
						$("#sec1 tr").children().detach().remove();
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "SUP0500sec1",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec1 tr").remove();
								 
								
								var b=JSON.parse(res.sec1SUP0500);
								 console.log(b);
								
                                 
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec1").append("<tr><td id='insname"+srno+"'>"+b[i].insname+"</td><td id='inscode"+srno+"'>"+b[i].inscode+"</td><td class='sumder' id='resident"+srno+"'>"+b[i].resident+"</td><td class='sumder' id='nonres"+srno+"'>"+b[i].nonres+"</td><td class='sumder' id='tot"+srno+"'>"+b[i].tot+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+srno+") id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   	
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
						var srno=1;
						$.ajax({
							url : "SUP0500sec2",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								 // $("#sec2 tr").remove();
								 
								
								var b=JSON.parse(res.sec1SUP0500s2);
								
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec2").append("<tr><td  id='insname"+srno+"'>"+b[i].insname+"</td><td  id='inscode"+srno+"'>"+b[i].inscode+"</td><td class='sumder' id='resident"+srno+"'>"+b[i].resident+"</td><td class='sumder' id='nonres"+srno+"'>"+b[i].nonres+"</td><td class='sumder' id='tot"+srno+"'>"+b[i].tot+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+srno+") id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
						var srno=1;
						$.ajax({
							url : "SUP0500sec3",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec3 tr").remove();
								 
								
								var b=JSON.parse(res.sec1SUP0500s3);
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec3").append("<tr><td id='insname"+srno+"'>"+b[i].insname+"</td><td id='inscode"+srno+"'>"+b[i].inscode+"</td><td class='sumder' id='resident"+srno+"'>"+b[i].resident+"</td><td class='sumder' id='nonres"+srno+"'>"+b[i].nonres+"</td><td class='sumder' id='tot"+srno+"'>"+b[i].tot+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+srno+") id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
						var srno=1;	
						$.ajax({
							url : "SUP0500sec4",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec4 tr").remove();
								 
								
								var b=JSON.parse(res.sec1SUP0500s4);
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec4").append("<tr><td id='insname"+srno+"'>"+b[i].insname+"</td><td id='inscode"+srno+"'>"+b[i].inscode+"</td><td class='sumder' id='resident"+srno+"'>"+b[i].resident+"</td><td class='sumder' id='nonres"+srno+"'>"+b[i].nonres+"</td><td class='sumder' id='tot"+srno+"'>"+b[i].tot+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+srno+") id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   
						
						
				
						
						
						
							
							
					}
				 
	 }
	 
function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_SUP0500_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>

<script>
$(document).ready(function(){
	
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');

	
});   


</script>
<script>
function myFunction(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("det2");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==2 ||b==3 || b==4){
		
		 if(td.innerHTML.replace(/,/g,"").substring(0,input.value.length)==input.value){
			 tr[i].style.display = "";
		}else {
	        tr[i].style.display = "none";
	      }
		 
		 
	    } else{
	    	
	    
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
    	
        tr[i].style.display = "";
       
      } else {
        tr[i].style.display = "none";
      }
	    }
    }       
    
    
  }
}
</script>
<script>
$(document).ready(function(){

	
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
	
	
	
	$('#btnback').on('click', function(e){
		location.href="XBRL_CRT_SUP0500_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

	});
	
	
	
	
	
	
	
	
	
	$("#btnfilter").on("click",function(){
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
		}else{
			$(".form-control2").val("");
			$(".form-control2").prop("disabled",true);
		}
		
	});
	
});	

</script>




<script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});


</script>



<script>
function functionli(a){
	$(".table").hide();
	$("#tb"+a).show();
	
if(a==1){
	
	$("#btnpre").prop("disabled",true);
	 $("#btnnext").prop("disabled",false);
	 $("#li1").addClass("active");
	 $("#li2,#li3,#li4").removeClass("active");
}else if(a==2){
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li2").addClass("active");
	 $("#li1,#li3,#li4").removeClass("active");
}else if(a==3){
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li3").addClass("active");
	 $("#li1,#li2,#li4").removeClass("active");
}else {
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li4").addClass("active");
	 $("#li1,#li3,#li2").removeClass("active");
}
}

function funli(a){
	$(".table").hide();
	$("#detb"+a).show();
if(a==1){
	
	$("#btnpre1").prop("disabled",true);
	 $("#btnnext1").prop("disabled",false);
	 $("#li1").addClass("active");
	 $("#li2").removeClass("active");
}else {
	$("#btnpre1").prop("disabled",false);
	 $("#btnnext1").prop("disabled",true);
	 $("#li2").addClass("active");
	 $("#li1").removeClass("active");
}
}

</script>

<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	
	
	
 	
$("#sumfirst").on("click",function(){
		
		location.href = "XBRL_REP_SUP0500_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
	
<%--  	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>'); 
 --%> 
	
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_SUP0500_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	
	
	
	
	
	
	
	$('#btnExcel').click(function() {
	
		 SUP0500Form.action = "SUP0500EXCELREPORT.action?method=SUP0500EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 SUP0500Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 SUP0500Form.action = "SUP0500EXCELSum.action?method=SUP0500EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 SUP0500Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 SUP0500Form.action = "SUP0500PDFREPORT.action?method=SUP0500PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 SUP0500Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  SUP0500Form.action = "XMLDOWNLOADs5.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 SUP0500Form.submit(); 
	});
	var save=0;

$('#btnSave').on("click",function() {
	
	  var datasum={
			"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").text()
	};
	$.ajax({
		url:"saveSums5",
		data:datasum,
		dataType:'json',
		type:'POST',
		async:true,
		success:function(res){
			alert("Saved Successfully");
			save++;
			if(save>0){
				$("#btnXML").show();
				$("#btnSave").hide();
			}else{
				$("#btnXML").hide();
				$("#btnSave").show();
			}
		
		}
	});  
	  
	 
});





	
		



 $("#addrow").on("click",function(){
	
	
	var rowno=$("#rowno").val();
	$("#addrowno").val("1"); 
	$("#det2").prepend("<tr><td  id='instname_row"+rowno+"'><input type='text' id='instname_text"+rowno+"'  style='width: 67px;'></td><td  id='instcode_row"+rowno+"'><input type='text'  id='instcode_text"+rowno+"'  style=' width:182px;'></td><td class='sumder alnum' id='res_row"+rowno+"'><input type='text' id='res_text"+rowno+"' class='decimalPt roundUp' style='width: 121px;'></td><td class='sumder alnum' id='nonresi_row"+rowno+"'><input type='text' 	id='nonresi_text"+rowno+"' class='decimalPt roundUp' style=' width: 100px;'></td><td class='sumder alnum' id='total_row"+rowno+"'><input type='text' id='total_text"+rowno+"' class='decimalPt roundUp'  style='width: 121px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");
	fnkeyup(rowno);

	 var rownum= parseInt($("#rowno").val());
	rownum++;
	$("#rowno").val(rownum);
	

		
	
 $('.roundUp').blur(function() {
		
	  var value = parseFloat($(this).val());
	  if (!isNaN(value).replace(/\,/g,'')) {
	    $(this).val(parseFloat(value).toFixed(2));
	  }				


	});
 
 $('#decimalPt, .decimalPt').keypress(function(evt) {
		
	  evt = (evt) ? evt : window.event;
	  var charCode = (evt.which) ? evt.which : evt.keyCode;
	  if (charCode == 8 || charCode == 37) {
	    return true;
	  } else if (charCode == 46 && $(this).val().indexOf('.') != -1) {
	    return false;
	  } else if (charCode > 31 && charCode != 46 && (charCode < 48 || charCode > 57)) {
	    return false;
	  }
	  return true;
	});
 
	});
	
$("#info").on("click",function(){
	$("#info").popover('show');
});

	
 
});	


</script>





<script>
 
 
function edit_row(no)
{
	//alert("happyyyyyyyyyyyyy");
//alert("hiii 2d AGccccccccc" +  edit_row(no));
$(".add").attr("disabled",true);
$("#addrowno").val("0");
 	
 	document.getElementById("edit_button"+no).style.display="none";
 	  document.getElementById("save_button"+no).style.display="block";
 	 	
 
 	  
 	 
  
 var res =  document.getElementById("res_row"+no);
  
 var res_data = res.innerHTML;
 
 res.innerHTML="<input type='text' class='decimalPt roundUp'  id='res_text"+no+"'  style='width: 83px'; value='"+res_data+"'>";
 

 
 var nonresi =  document.getElementById("nonresi_row"+no);
 
 var nonresi_data = nonresi.innerHTML;
 
 nonresi.innerHTML="<input type='text' class='decimalPt roundUp'  id='nonresi_text"+no+"'  style='width: 83px'; value='"+nonresi_data+"'>";
 
 
 
 var total =  document.getElementById("total_row"+no);
 
 var total_data = total.innerHTML;
 
 total.innerHTML="<input type='text' class='decimalPt roundUp'  id='total_text"+no+"'  style='width: 83px'; value='"+total_data+"'>";
 
 
 
 
 $('#decimalPt, .decimalPt').keypress(function(evt) {
		
	  evt = (evt) ? evt : window.event;
	  var charCode = (evt.which) ? evt.which : evt.keyCode;
	  if (charCode == 8 || charCode == 37) {
	    return true;
	  } else if (charCode == 46 && $(this).val().indexOf('.') != -1) {
	    return false;
	  } else if (charCode > 31 && charCode != 46 && (charCode < 48 || charCode > 57)) {
	    return false;
	  }
	  return true;
	});

	$('.roundUp').blur(function() {
		
	  var value = parseFloat($(this).val());
	  if (!isNaN(value).replace(/\,/g,'')) {
	    $(this).val(parseFloat(value).toFixed(2));
	  }
	});




	
 
}

function save_row(no)
{
	
	$(".add").attr("disabled",false);
	document.getElementById("edit_button"+no).checked = false;
	
	  
	
	var res_val=document.getElementById("res_text"+no).value;
	document.getElementById("res_row"+no).innerHTML=res_val;
	
	
	var nonresi_val=document.getElementById("nonresi_text"+no).value;
	document.getElementById("nonresi_row"+no).innerHTML=nonresi_val;
	
	
	
	var total_val=document.getElementById("total_text"+no).value;
	document.getElementById("total_row"+no).innerHTML=total_val;
	
	
	
	
	if($("#addrowno").val()=="1"){
		
	var  instname_val=document.getElementById("instname_text"+no).value;	 
	document.getElementById("instname_row"+no).innerHTML=instname_val;
	

	   var instcode_val=document.getElementById("instcode_text"+no).value;
	   document.getElementById("instcode_row"+no).innerHTML=instcode_val;
		

	 
			


			
	}
	
	document.getElementById("edit_button"+no).style.display="block";
	document.getElementById("save_button"+no).style.display="none";
	

	 var instname=document.getElementById("instname_row"+no).innerHTML;	 
		

	 var instcode=document.getElementById("instcode_row"+no).innerHTML;
		

     var res=document.getElementById("res_row"+no).innerHTML;	


	 var nonresi=document.getElementById("nonresi_row"+no).innerHTML;
		

     var total=document.getElementById("total_row"+no).innerHTML;

		 
		
	

	 
	 $("#det2 td").attr("padding","8px");
	
	var refeSUP0500=document.getElementById("refDisplay").innerHTML;
   
		
	  

	 var rptdate1 = {
			     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeSUP0500, "instname":instname,"instcode":instcode,"res" : res, "nonresi":nonresi, "total":total
			}; 
	 $.ajax({
	     url : "SUP0500",
	     data : rptdate1  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 console.log(res.refno);
				 $(".repdisp").html(res.refno);

					
			}
		});
	

	
}

 

</script>



<SCRIPT>

function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_SUP0500_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>

<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="SUP0500Form"
		enctype="multipart/form-data">
             	<div class="tab-content" >
	 	<div class="active sup0500" id="tab2" style="width: 968px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 15px;" ><b>SUP0500-Profit and Loss Statement<b id="sub"
					Style="display: none"></b></b></font>
			</div> <br>
		<ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">




  <li class=" pull-right list" onclick="functionli(4);" id="li4"><a href="#tab4" data-toggle="tab"><span
							class="headingtab">4</span></a></li>
             <li class=" pull-right list" onclick="functionli(3);" id="li3"><a href="#tab3" data-toggle="tab"><span
							class="headingtab">3</span></a></li>
					<li class=" pull-right list" onclick="functionli(2);" id="li2"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" onclick="functionli(1);" id="li1"><a href="#tab1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>




				</ul>
					
			
            <table class="" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
			
				
				
			 <!--******************SUMMARY SECTION 4********************************-->   		
				
				  <table class="table" id="tb4" style="width:100%;display:none;margin-top:-20px;"><tr >
           <tr>
			
            <th  rowspan="2"style="text-align:center">Other MEMORANDUM ITEMS for Cash Dealers</th>
          <th  rowspan="2" style="text-align:center"></th>
          <th  style="text-align:center">Resident</th>
          <th style="text-align:center">Non Resident</th>
          <th  style="text-align:center">Total</th>
          <th rowspan="2" id="" style="text-align:center">Select</th>
          </tr>
          
          <tr>
          <th style="text-align:center">J</th>
          <th style="text-align:center">K</th> 
          <th style="text-align:center">L</th> 
          </tr>
         
          
           <tbody class="databody" id="sec4"></tbody>
          
          
          </table>
          
			 <!--******************SUMMARY SECTION 3********************************-->   		
		
				   <table class="table" id="tb3" style="width:100%;display:none;margin-top:-20px;">
           <tr>
            <th  rowspan="2"style="text-align:center">Other MEMORANDUM ITEMS for Non Bank Deposit Taking Institutions: </th>
          <th  rowspan="2" style="text-align:center"></th>
          <th  style="text-align:center">Resident</th>
          <th style="text-align:center">Non Resident</th>
          <th  style="text-align:center">Total</th>
          <th rowspan="2" id="" style="text-align:center">Select</th>
          </tr>
          
          <tr>
          <th style="text-align:center">G</th>
          <th style="text-align:center">H</th> 
          <th style="text-align:center">I</th> 
          </tr>
         
          
             <tbody class="databody" id="sec3"></tbody>
          </table>
          
          
	 <!--******************SUMMARY SECTION2********************************-->   			
			
            <table class="table" id="tb2" style="width:100%;display:none;margin-top:-20px;">
            <tr>
            <th  rowspan="2"style="text-align:center">MEMORANDUM ITEMS: PROFIT AND LOSS STATEMENT</th>
             <th  rowspan="2" style="text-align:center"></th>
          <th  style="text-align:center">Resident</th>
          <th style="text-align:center">Non Resident</th>
          <th  style="text-align:center">Total</th>
          <th rowspan="2" id="" style="text-align:center">Select</th>
          </tr>
          
          <tr>
          <th style="text-align:center">D</th>
          <th style="text-align:center">E</th> 
          <th style="text-align:center">F</th> 
          </tr>
         
             <tbody class="databody" id="sec2"></tbody>
          </table>
          
  <!--******************SUMMARY SECTION1********************************-->   
               
               <table class="table" id="tb1" style="width:100%;display:none;margin-top:-20px;">
          
          <tr>
          <th  rowspan="2" style="text-align:center">Particulars</th>
          <th  rowspan="2" style="text-align:center"></th>
          <th  style="text-align:center">Resident</th>
           <th  style="text-align:center">Non Resident</th>
           <th  style="text-align:center">Total</th>
          <th rowspan="2" id="" style="text-align:center">Select</th>
          </tr>
          
          <tr>
          <th style="text-align:center">A</th>
          <th style="text-align:center">B</th> 
          <th style="text-align:center">C</th>
          <tr>
         
   
    
          </tr>   <tbody class="databody" id="sec1"></tbody>
          </table>
          
          
          
            <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
     <!--  <button type="button" class="btn btn-xs btn-primary"   value="back" id="btnpre">Previous</button> -->
     
     <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 <!--   <button type="button" class="btn btn-xs btn-primary"   value="back" id="btnnext">Next</button> -->
      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div>
          
            </div>
            
            
            
            
            
            
             	<div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			<div class="active" id="tab1" style="width: 968px;padding-top: 1px;margin-top: -17px;" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>
			<b id="sub"
					Style="display: none"></b></b></font>
			<br>
			<b style="font-size: 15px;">SUP0500-Profit and Loss Statement
			 <b id="sub" style="display: none"></b></b>
			</div><br>
			<div id="divLoading"> 
    </div>
    <ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">




  <!-- 
					<li class=" pull-right list" onclick="funli(2);"><a  data-toggle="tab"><span
							class="headingtab">2</span></a></li> -->
					
					
					<!-- <li class=" pull-right active list" onclick="funli(1);" ><a
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>
 -->



				</ul>
           <table class="" style="width:100%;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width: 325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab" id="sumfirst"><span class="headingtab"  >Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a> <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></td></tr>
          		  </table>
       
             <div class="panel panel-primary filterable">
           
				   <table class="table" id="detb1" style="width:100%;display:none;margin-top:-20px;">   <thead><tr ><td colspan="14" style="text-align:center;background-color: #bbc3cb;font-size: 11px;text-align:center"><b></b>  </td></tr>
             <tr class="filters">
					 <th style="text-align: center;"><input type="text" id="instname" onkeyup="myFunction(this.id,0)" style="width: 100px;" class="form-control2" placeholder="Instance Name" disabled></th>
					<th style="text-align: center;"><input type="text" id="instcode" onkeyup="myFunction(this.id,1)" style="width: 100px;" class="form-control2" placeholder="Instance code" disabled></th>						
						<th style="text-align: center;"><input type="text" id="res" onkeyup="myFunction(this.id,2)" style="width: 100px;" class="form-control2" placeholder="Resident" disabled></th>
						<th style="text-align: center;"><input type="text" id="nonresi" onkeyup="myFunction(this.id,3)" style="width: 100px;" class="form-control2" placeholder="Non Resident" disabled></th>
						<th style="text-align: center;"><input type="text" id="total" onkeyup="myFunction(this.id,4)" style="width: 100px;" class="form-control2" placeholder="Total" disabled></th>						
						
						<th id="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det2">


 


              </tbody>
              
				</table>
				
				</div>
				
				
				
				
            </div>


     </form>
    
    
</div>





</body>
</html>