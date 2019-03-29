<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="bean.XBRLFIM0100Bean,dao.XBRLFIM0100Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>


<%@ page
	import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat"%>





<%
    DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Date date = new Date();
	
	String username = session.getAttribute("userName").toString();
    String curdate = dateFormat.format(date);
%>


<%//String RRID = request.getParameter("RRID");
 
 
 String rptdate = request.getParameter("rptdate");
 
 String dt1 = request.getParameter("dt1");
 String dt2 = request.getParameter("dt2");
 String dt3 =request.getParameter("asonDate");
 String reptype=request.getParameter("reptype");
 String curr = request.getParameter("curr");
 String typo=request.getParameter("typo");
// String ReporefSeq = request.getParameter("ReporefSeq");
String types=request.getParameter("types");

String instno = request.getParameter("instno");
String ReporefSeq = request.getParameter("ReporefSeq");
 
 XBRLFIM0100Dao dmd=new XBRLFIM0100Dao();
 
 DecimalFormat df = new DecimalFormat("##,#0.00");
	   
	
 	
    %>





<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="refresh"
	content="<%=session.getMaxInactiveInterval() %>;url=../XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>XBRL REPORT</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="ib.viewport">
<!-- Bootstrap 3.3.6 -->

<link rel="stylesheet" href="../../css/bootstrap.min.css">
<!-- style page -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

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
.zui-table thead th {
	background-color: #DDEFEF;
	border: solid 1px #DDEEEE;
	color: #336B6B;
	padding: 10px;
	text-align: left;
	text-shadow: 1px 1px 1px #fff;
}

.tl {
	-webkit-box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px
		rgba(0, 0, 0, 0.23);
	-moz-box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px
		rgba(0, 0, 0, 0.23);
	-ms-box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px
		rgba(0, 0, 0, 0.23);
	-o-box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px
		rgba(0, 0, 0, 0.23);
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
}

.gmd-1 {
	-webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px
		rgba(0, 0, 0, 0.24);
	-moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px
		rgba(0, 0, 0, 0.24);
	-ms-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px
		rgba(0, 0, 0, 0.24);
	-o-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px
		rgba(0, 0, 0, 0.24);
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	-webkit-transition: all 0.25s ease-in-out;
	-moz-transition: all 0.25s ease-in-out;
	-ms-transition: all 0.25s ease-in-out;
	-o-transition: all 0.25s ease-in-out;
	transition: all 0.25s ease-in-out;
}

.gmd-1:hover {
	-webkit-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	-moz-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	-ms-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	-o-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
}

table tbody tr:hover {
	-webkit-box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	-moz-box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	-ms-box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	-o-box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
}

.gmd-4 {
	
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

.table>thead>tr>th {
	vertical-align: top;
	border-bottom: 2px solid #ddd;
}

#notification {
	position: fixed;
	top: 40px; /* Set to 0 or wherever */
	width: 95%; /* set to 100% if space is available */
	z-index: 105;
	text-align: center;
	font-weight: normal;
	font-size: 14px;
	font-weight: bold;
	color: white;
	background-color: #58585b;
	padding: 5px;
	width: 350px;
	padding-left: 100px;
}

#notification span.dismiss {
	border: 2px solid #FFF;
	padding: 0 5px;
	cursor: pointer;
	float: right;
	margin-right: 10px;
}

#notification a {
	color: white;
	text-decoration: none;
	font-weight: bold
}

.loader {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url('../images/Loader.gif') 40% 40% no-repeat
		rgb(249, 249, 249);
	opacity: .8;
}

.nav-tabs {
	border-bottom: 1px solid #bbc3cb;
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

#filter {
	padding: 25px;
}

.form-horizontal .form-group {
	margin-top: -13px;
	margin-right: -93px;
	margin-left: -15px;
}

.clr {
	color: #0c0b0b;
	background-color: #f5f5f5;
	border-color: #f5f5f5;
}

.sumdet {
	text-align: left;
}

.sumder {
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

table td {
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

.databody td {
	border: 1px solid #ddd;
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
.ui-dialog-titlebar-close {
    visibility: hidden;
}
.hidden {
  display: none;
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

textarea {
	text-align: center;
	overflow: hidden;
	resize: none;
	height: 40px;
	border: none;
	background-color: #f5f5f5;
	white-space: pre-wrap;
	word-wrap: break-word;
	resize: none;
	-webkit-text-fill-color: #333333;
}
</style>
<script>
$(document).ready(function(){
var det={
		"repdt":'<%=dt2%>',"type":"chckmodified"
	};
	$.ajax({
		url:"PSC0300chckmodified",
		data:det,
		dataType:'json',
		type:'POST',
		async:true,
		success:function(res){
			console.log(res.cnt);
			if(res.cnt>0){
				$("#modflg").val("Y");
				$("#msg").html('Verification pending for some records');
				$( "#dialog-confirm" ).dialog({
				      resizable: false,
				      closeOnEscape: false,
				      height: "auto",
				      width: 400,
				      modal: true,
				      buttons: {
				        "OK": function() {
				        	$( this ).dialog( "close" );
				        	location.href = "XBRL_CRT_PSC0300_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
				        }
				      }
				    });
				
				
			}else{
				$("#modflg").val("N");
			}
		}
	});
});
</script>

<script>
function functionli(a){
	$(".table").hide();
	$("#tb"+a).show();
if(a==1){
	$("#btnSave").hide();
	$("#btnXML").hide();
	$("#btnpre").prop("disabled",true);
	 $("#btnnext").prop("disabled",false);
	 $("#li1").addClass("active");
	 $("#li2").removeClass("active");
}else if(a==2){
	$("#btnSave").show();
	$("#btnXML").show();
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
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
		
		location.href = "XBRL_REP_PSC0300_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
 	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>'); 
 
	$(".det").on("click",function(){
	
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_PSC0300_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( ".btnhome" ).click(function() {

		location.href = "../XBRLHomePage.jsp";
		});
	$( '.btnback').click(function() {
	 location.href="XBRL_CRT_PSC0300_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

	});
	
		
	$('#btnExcel').click(function() {
		
		PSC0300Form.action = "PSC0300EXCELREPORT.action?method=PSC0300EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		PSC0300Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			PSC0300Form.action = "PSC0300EXCELSum.action?method=PSC0300EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			PSC0300Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			PSC0300Form.action = "PSC0300PDFREPORT.action?method=PSC0300PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			PSC0300Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  PSC0300Form.action = "XMLDOWNLOAD.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 PSC0300Form.submit(); 
	});
	$("#btnfilter").on("click",function(){
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
			 $('#accno,#custid,#custname,#systp,#syscode,#uqid,#nrefg,#iscode,#cntrycode,#snamt,#outstdamt,#acccurcode,#resfg,#resdate,#nfblimit,#nfboutstd,#npaflg,#secflg,#secamt,#arrday,#arramt,#loanratio,#spcprvsn,#npareason,#repdt').css({
				'text-align':'center',
				'height':'30px',
				'white-space':'pre-wrap',
				'scroll':'none',
				'word-wrap':'break-word',
				'resize':'none',
				'background-color': 'white',
				'border':'1px solid',
				'color':' rgb(21, 19, 19)',
				'border-color':'#a9a9a9',
				'-webkit-text-fill-color': 'rgb(117, 117, 117)'
				}); 
		
		
		}else{
			$(".form-control2").val("");
			$(".form-control2").prop("disabled",true);
			
		    $('#accno,#custid,#custname,#systp,#syscode,#uqid,#nrefg,#iscode,#cntrycode,#snamt,#outstdamt,#acccurcode,#resfg,#resdate,#nfblimit,#nfboutstd,#npaflg,#secflg,#secamt,#arrday,#arramt,#loanratio,#spcprvsn,#npareason,#repdt').css({
					'text-align':'center',
					'height':'30px',
					'white-space':'pre-wrap',
					'scroll':'none',
					'word-wrap':'break-word',
					'resize':'none',
					'background-color': '#f5f5f5',
					'border':'none',
					'-webkit-text-fill-color': '#333333'
					}); 
			  var   table, tr, td, i;
				 table = document.getElementById("pymdets");
				 tr = table.getElementsByTagName("tr");
				 for (i = 0; i < tr.length; i++) {
					 
						 
						 tr[i].style.display = ""; 
						 
				 
					 
				 }
				
		}
	});

	

	var hh=0;

	 $('#btnSave').on("click",function() {
	 	 
	 		
	 	if((hh==0)&&($("#savecheck").val()==0)){
	 		
	 			if($("#savecheck").val()==0){
	 	
	 				var datasum={
	 						"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").val()
	 				};
	 				 $("#divLoading").addClass('show');
	 				$.ajax({
	 					url:"saveSump30",
	 					data:datasum,
	 					
	 					dataType:'json',
	 					type:'POST',
	 					async:true,
	 					success:function(res){
	 						 $("#divLoading").removeClass('show');

	 						alert("Saved Successfully");
	 						 $("#btnXML").prop("disabled",false);
	 					}
	 				
	 				}); 
	 				
	 			}
	 		
	 	}	else
	 				{
	 				
				
				 $("#msg").html("Report already exist, do you want to replace it?");
	 				  $( "#dialog-confirm" ).dialog({
	 				      resizable: false,
	 				      height: "auto",
	 				      width: 400,
	 				      modal: true,
	 				      
	 				     
	 				      buttons: {
	 				        "OK": function() {
	 				        	
	 				        	$( this ).dialog( "close" );
	 				        	
	 				        	var datasum={
	 				   				"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").val()
	 				   		};
	 			 			 	$("#divLoading").addClass('show'); 

	 				   		$.ajax({
	 				   			url:"saveSump30",
	 				   			data:datasum,
	 								dataType:'json',
	 								type:'POST',
	 								async:true,
	 								success:function(res){
	 		 							 $("#divLoading").removeClass('show');

	 									alert("Saved Successfully");
	 									
	 							
	 								}
	 							});  
	 				        			        
	 				  
	 				      },
	 				      Cancel: function() {
	 				          $( this ).dialog( "close" );
	 				        }
	 				      }
	 				  
	 				    });
	 				
	 			}
	 	
	 	hh++;	
	  
	 });


		
});	

</script>

<script>
var modtyp;
$(document).ready(function(){

$("#addrow").on("click",function(){
	var rowno=$("#rowno").val();
	modtyp="A";
	$("#addrowno").val("1"); 
	$("#pymdets").prepend("<tr id='pscadd"+rowno+"'><td id='accno_row"+rowno+"'><input type='text' id='accno_text"+rowno+"' style='width: 100px;'></td><td id='custid_row"+rowno+"'><input type='text'  id='custid_text"+rowno+"' style='    width:70px;'></td><td id='custname_row"+rowno+"'><input type='text' id='custname_text"+rowno+"' style='     width: 200px;'></td><td id='systp_row"+rowno+"'><input type='text' 	id='systp_text"+rowno+"' style='    width: 50px;'></td><td id='syscode_row"+rowno+"'><input type='text' id='syscode_text"+rowno+"' style='    width: 53px;'></td><td id='uqid_row"+rowno+"' ><input type='text'  id='uqid_text"+rowno+"'    style='    width: 66px;'></td><td id='nrefg_row"+rowno+"'><input type='text' id='nrefg_text"+rowno+"' style='width:54px;'></td><td id='iscode_row"+rowno+"'><input type='text' id='iscode_text"+rowno+"' style='width:50px;'></td><td id='cntrycode_row"+rowno+"'><input type='text' id='cntrycode_text"+rowno+"' style='width: 45px;'></td><td class='sumder alnum' id='snamt_row"+rowno+"'><input class='decimalPt roundUp' type='text' id='snamt_text"+rowno+"' style='width:83px;'></td><td class='sumder alnum' id='outstdamt_row"+rowno+"'><input class='decimalPt roundUp' type='text' id='outstdamt_text"+rowno+"' style='width:100px;'></td><td id='acccurcode_row"+rowno+"'><input type='text' id='acccurcode_text"+rowno+"' style='width:100px;'></td><td id='resfg_row"+rowno+"'><input type='text' id='resfg_text"+rowno+"' style='width:51px;'></td><td id='resdate_row"+rowno+"'><input type='text' id='resdate_text"+rowno+"' style='width:58px;'></td><td id='nfblimit_row"+rowno+"'><input type='text' id='nfblimit_text"+rowno+"' style='width:72px;'></td><td id='nfboutstd_row"+rowno+"'><input type='text' id='nfboutstd_text"+rowno+"' style='width:58px;'></td><td id='npaflg_row"+rowno+"'><input type='text' id='npaflg_text"+rowno+"' style='width: 87px;'></td><td id='secflg_row"+rowno+"'><input type='text' id='secflg_text"+rowno+"' style='width:64px;'></td><td class='sumder alnum' id='secamt_row"+rowno+"'><input class='decimalPt roundUp' type='text' id='secamt_text"+rowno+"' style='width:89px;'></td><td id='arrday_row"+rowno+"'><input type='text' id='arrday_text"+rowno+"' style='width:55px;'></td><td class='sumder alnum' id='arramt_row"+rowno+"'><input class='decimalPt roundUp' type='text' id='arramt_text"+rowno+"' style='width:86px;'></td><td id='loanratio_row"+rowno+"'><input type='text' id='loanratio_text"+rowno+"' style='width:59px;'></td><td class='sumder alnum' id='spcprvsn_row"+rowno+"'><input class='decimalPt roundUp' type='text' id='spcprvsn_text"+rowno+"' style='width:73px;'></td><td id='npareason_row"+rowno+"'><input type='text' id='npareason_text"+rowno+"' style='width:75px;'></td><td  id='repdt_row"+rowno+"'><input  type='text' id='repdt_text"+rowno+"' style='width: 73px;'></td><td style='width: 100px;text-align:center;'><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");


	 var rownum= parseInt($("#rowno").val());
	rownum++;
	$("#rowno").val(rownum);
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


	});


	
});	
 
 
   
function edit_row(no)
{
	
$(".add").prop("disabled",true);

	
	 $("#del_button"+no).addClass('hidden');
	$("#addrowno").val("0");
	modtyp="M";
 	document.getElementById("edit_button"+no).style.display="none";
 	  document.getElementById("save_button"+no).style.display="inline-block";
 	 document.getElementById("Cancel_btn"+no).style.display="inline-block";
 	document.getElementById("Cancel_button"+no).style.display="none";
  
  var	snamt =  document.getElementById("snamt_row"+no);
  var	snamt_data = snamt.innerHTML;
  var	outstdamt =  document.getElementById("outstdamt_row"+no);
  var	outstdamt_data = outstdamt.innerHTML;
 var	secamt =  document.getElementById("secamt_row"+no);
 var	secamt_data = secamt.innerHTML; 
 var	arramt =  document.getElementById("arramt_row"+no);
 var	arramt_data = arramt.innerHTML; 
 var	spcprvsn =  document.getElementById("spcprvsn_row"+no);
 var	spcprvsn_data = spcprvsn.innerHTML; 
 

 snamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='snamt_text"+no+"'  style='width: 83px'; value='"+snamt_data+"'>";
 outstdamt.innerHTML="<input type='text' class='decimalPt roundUp' id='outstdamt_text"+no+"' style='width: 83px'; value='"+outstdamt_data+"'>";
 secamt.innerHTML="<input type='text' class='decimalPt roundUp' id='secamt_text"+no+"' style='width: 83px'; value='"+secamt_data+"'>";
 arramt.innerHTML="<input type='text' class='decimalPt roundUp' id='arramt_text"+no+"' style='width: 83px'; value='"+arramt_data+"'>";
 spcprvsn.innerHTML="<input type='text' class='decimalPt roundUp' id='spcprvsn_text"+no+"' style='width: 83px'; value='"+spcprvsn_data+"'>"; 


 

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
	 var error="N";
		
		if (modtyp=="M"){
			
			
			if(document.getElementById("snamt_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}else if(document.getElementById("outstdamt_text"+no).value==""){
				alert("Enter Type of coin ..");	
				error="Y"
			}else if(document.getElementById("secamt_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}else if(document.getElementById("arramt_text"+no).value==""){
				alert("Enter Type of coin ..");	
				error="Y"
			}else if(document.getElementById("spcprvsn_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}
			
		} else if (modtyp=="A") {
			

			if(document.getElementById("accno_text"+no).value==""){
				alert("Enter Report Date ..");
				error="Y"
			}else if(document.getElementById("custid_text"+no).value==""){
				alert("Enter Type of coin ..");	
				error="Y"
			}else if(document.getElementById("custname_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}else if(document.getElementById("systp_text"+no).value==""){
				alert("Enter Type of coin ..");	
				error="Y"
			}else if(document.getElementById("syscode_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}else if(document.getElementById("uqid_text"+no).value==""){
				alert("Enter Type of coin ..");	
				error="Y"
			}else if(document.getElementById("nrefg_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}else if(document.getElementById("iscode_text"+no).value==""){
				alert("Enter Type of coin ..");	
				error="Y"
			}else if(document.getElementById("cntrycode_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}else if(document.getElementById("snamt_text"+no).value==""){
				alert("Enter Type of coin ..");	
				error="Y"
			}else if(document.getElementById("outstdamt_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}else if(document.getElementById("acccurcode_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}else if(document.getElementById("resfg_text"+no).value==""){
				alert("Enter Type of coin ..");	
				error="Y"
			}else if(document.getElementById("resdate_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}else if(document.getElementById("nfblimit_text"+no).value==""){
				alert("Enter Report Date ..");
				error="Y"
			}else if(document.getElementById("nfboutstd_text"+no).value==""){
				alert("Enter Type of coin ..");	
				error="Y"
			}else if(document.getElementById("npaflg_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}else if(document.getElementById("secflg_text"+no).value==""){
				alert("Enter Type of coin ..");	
				error="Y"
			}else if(document.getElementById("secamt_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}else if(document.getElementById("arrday_text"+no).value==""){
				alert("Enter Type of coin ..");	
				error="Y"
			}else if(document.getElementById("arramt_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}else if(document.getElementById("loanratio_text"+no).value==""){
				alert("Enter Type of coin ..");	
				error="Y"
			}else if(document.getElementById("cntrycode_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}else if(document.getElementById("spcprvsn_text"+no).value==""){
				alert("Enter Type of coin ..");	
				error="Y"
			}else if(document.getElementById("npareason_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}else if(document.getElementById("repdt_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}
		}
		
		
		
		if (error=="N"){
		
		$("#modflg").val("Y");
		modtyp="M";
		document.getElementById("edit_button"+no).checked = false;

		  

 var snamt_val=document.getElementById("snamt_text"+no).value;

 document.getElementById("snamt_row"+no).innerHTML=snamt_val;

 

 var outstdamt_val=document.getElementById("outstdamt_text"+no).value;

 document.getElementById("outstdamt_row"+no).innerHTML=outstdamt_val;


 var secamt_val=document.getElementById("secamt_text"+no).value;

 document.getElementById("secamt_row"+no).innerHTML=secamt_val;


 
 var arramt_val=document.getElementById("arramt_text"+no).value;

 document.getElementById("arramt_row"+no).innerHTML=arramt_val;



 var spcprvsn_val=document.getElementById("spcprvsn_text"+no).value;

 document.getElementById("spcprvsn_row"+no).innerHTML=spcprvsn_val;



 if($("#addrowno").val()=="1"){
 	
	 modtyp="A";
 	
 var  accno_val=document.getElementById("accno_text"+no).value;	 
 document.getElementById("accno_row"+no).innerHTML=accno_val;

    var custid_val=document.getElementById("custid_text"+no).value;
    document.getElementById("custid_row"+no).innerHTML=custid_val;

   var custname_val=document.getElementById("custname_text"+no).value;
    document.getElementById("custname_row"+no).innerHTML=custname_val;
   
    var systp_val=document.getElementById("systp_text"+no).value;
 	document.getElementById("systp_row"+no).innerHTML=systp_val;
 	
   
   var syscode_val=document.getElementById("syscode_text"+no).value;	
   document.getElementById("syscode_row"+no).innerHTML=syscode_val;
   
   var  uqid_val=document.getElementById("uqid_text"+no).value;	 
   document.getElementById("uqid_row"+no).innerHTML=uqid_val;
   
   var  nrefg_val=document.getElementById("nrefg_text"+no).value;	 
   document.getElementById("nrefg_row"+no).innerHTML=nrefg_val;
  
   var  iscode_val=document.getElementById("iscode_text"+no).value;	 
   document.getElementById("iscode_row"+no).innerHTML=iscode_val;
   
   var  cntrycode_val=document.getElementById("cntrycode_text"+no).value;	 
   document.getElementById("cntrycode_row"+no).innerHTML=cntrycode_val;

   
   var acccurcode_val=document.getElementById("acccurcode_text"+no).value;	 
   document.getElementById("acccurcode_row"+no).innerHTML=acccurcode_val;
  
   var  resfg_val=document.getElementById("resfg_text"+no).value;	 
   document.getElementById("resfg_row"+no).innerHTML=resfg_val;
   
   var  resdate_val=document.getElementById("resdate_text"+no).value;	 
   document.getElementById("resdate_row"+no).innerHTML=resdate_val;
   
   var nfblimit_val=document.getElementById("nfblimit_text"+no).value;	
   document.getElementById("nfblimit_row"+no).innerHTML=nfblimit_val;
  
   var  nfboutstd_val=document.getElementById("nfboutstd_text"+no).value;	 
   document.getElementById("nfboutstd_row"+no).innerHTML=nfboutstd_val;
   
   var npaflg_val=document.getElementById("npaflg_text"+no).value;	 
   document.getElementById("npaflg_row"+no).innerHTML=npaflg_val;
  
   var  secflg_val=document.getElementById("secflg_text"+no).value;	 
   document.getElementById("secflg_row"+no).innerHTML=secflg_val;
   
 
   var  arrday_val=document.getElementById("arrday_text"+no).value;	 
   document.getElementById("arrday_row"+no).innerHTML=arrday_val;
   
  
  
   var  loanratio_val=document.getElementById("loanratio_text"+no).value;	 
   document.getElementById("loanratio_row"+no).innerHTML=loanratio_val;
   
  
  
   var npareason_val=document.getElementById("npareason_text"+no).value;	 
   document.getElementById("npareason_row"+no).innerHTML=npareason_val;
   
   var  repdt_val=document.getElementById("repdt_text"+no).value;	 
   document.getElementById("repdt_row"+no).innerHTML=repdt_val;
 	
  
 }else{
		document.getElementById("Cancel_button"+no).style.display="inline-block";
		document.getElementById("Cancel_btn"+no).style.display="none";
	}
	
	document.getElementById("edit_button"+no).style.display="inline-block";
	document.getElementById("save_button"+no).style.display="none";
	
 
  var accno=document.getElementById("accno_row"+no).innerHTML;	 
    var custid=document.getElementById("custid_row"+no).innerHTML;
   var custname=document.getElementById("custname_row"+no).innerHTML;
   var systp=document.getElementById("systp_row"+no).innerHTML;
   var syscode=document.getElementById("syscode_row"+no).innerHTML;
   var uqid=document.getElementById("uqid_row"+no).innerHTML;	
   var nrefg=document.getElementById("nrefg_row"+no).innerHTML;
   var iscode=document.getElementById("iscode_row"+no).innerHTML;	 
   var cntrycode=document.getElementById("cntrycode_row"+no).innerHTML;
   var snamt=document.getElementById("snamt_row"+no).innerHTML;	 
   var outstdamt=document.getElementById("outstdamt_row"+no).innerHTML;
   var acccurcode=document.getElementById("acccurcode_row"+no).innerHTML;
   var resfg=document.getElementById("resfg_row"+no).innerHTML;
   var resdate=document.getElementById("resdate_row"+no).innerHTML;
   var nfblimit=document.getElementById("nfblimit_row"+no).innerHTML;
   var nfboutstd=document.getElementById("nfboutstd_row"+no).innerHTML;	
   var npaflg=document.getElementById("npaflg_row"+no).innerHTML;	 
   var secflg=document.getElementById("secflg_row"+no).innerHTML;
  var secamt=document.getElementById("secamt_row"+no).innerHTML;
  var arrday=document.getElementById("arrday_row"+no).innerHTML;
  var arramt=document.getElementById("arramt_row"+no).innerHTML;
  var loanratio=document.getElementById("loanratio_row"+no).innerHTML;	
  var spcprvsn=document.getElementById("spcprvsn_row"+no).innerHTML;
  var npareason=document.getElementById("npareason_row"+no).innerHTML;	 
  var repdt=document.getElementById("repdt_row"+no).innerHTML;
 
  $("#pscadd"+no).addClass("rowaddedd");

   $("#det1 td").attr("padding","8px");
   var refePSC300=document.getElementById("refDisplay").value;
   snamt=snamt.replace(/\,/g,'');
   snamt=Number(snamt);
   
   outstdamt=outstdamt.replace(/\,/g,'');
   outstdamt=Number(outstdamt);
  
   
   secamt=secamt.replace(/\,/g,'');
   secamt=Number(secamt);
   
   

   arramt=arramt.replace(/\,/g,'');
   arramt=Number(arramt);
   
   spcprvsn=spcprvsn.replace(/\,/g,'');
   spcprvsn=Number(spcprvsn);
  

   var rptdate1 = {
  		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refePSC300,"accno":accno,"custid":custid,"custname":custname,"systp":systp,"syscode":syscode,"uqid":uqid,"nrefg":nrefg,"iscode":iscode,"cntrycode":cntrycode,"snamt":snamt,"outstdamt":outstdamt,"acccurcode":acccurcode,"resfg":resfg,"resdate":resdate,"nfblimit":nfblimit,"nfboutstd":nfboutstd,"npaflg":npaflg,"secflg":secflg,"secamt":secamt,"arrday":arrday,"arramt":arramt,"loanratio":loanratio,"spcprvsn":spcprvsn,"npareason":npareason,"repdt":repdt,"modtyp":modtyp  
  		}; 
   
   $.ajax({
       url : "PSC0300",
       data : rptdate1  ,
  		dataType : 'json', 
  		type : 'POST',
  		async : true,
  		 success : function(res) {
  			 console.log(res.refno);
  		
  			 $(".repdisp").val(res.refno);
  			
  			 $("#msg").html("Record Saved successfully");
	         $( "#dialog-confirm" ).dialog({
			      resizable: false,
			      closeOnEscape: false,
			      height: "auto",
			      width: 400,
			      modal: true,
			      buttons: {
			        "OK": function() {
			        	$( this ).dialog( "close" );
			        	

			        }
			      }
			    });
	         
  			
  		}
  	});

		}

 }
 function savedel_row(no){
		
		 $("#msg").html("Are you sure you want to delete?");
		  $( "#dialog-confirm" ).dialog({
		      resizable: false,
		      height: "auto",
		      width: 400,
		      modal: true,
		      
		     
		      buttons: {
		        "OK": function() {
		        	modtyp="D";
		        	document.getElementById("edit_button"+no).checked = false;
		        	document.getElementById("edit_button"+no).style.display="inline-block";
		        	document.getElementById("save_button"+no).style.display="none";
		        	 var accno=document.getElementById("accno_row"+no).innerHTML;	 
		        	    var custid=document.getElementById("custid_row"+no).innerHTML;
		        	   var custname=document.getElementById("custname_row"+no).innerHTML;
		        	   var systp=document.getElementById("systp_row"+no).innerHTML;
		        	   var syscode=document.getElementById("syscode_row"+no).innerHTML;
		        	   var uqid=document.getElementById("uqid_row"+no).innerHTML;	
		        	   var nrefg=document.getElementById("nrefg_row"+no).innerHTML;
		        	   var iscode=document.getElementById("iscode_row"+no).innerHTML;	 
		        	   var cntrycode=document.getElementById("cntrycode_row"+no).innerHTML;
		        	   var snamt=document.getElementById("snamt_row"+no).innerHTML;	 
		        	   var outstdamt=document.getElementById("outstdamt_row"+no).innerHTML;
		        	   var acccurcode=document.getElementById("acccurcode_row"+no).innerHTML;
		        	   var resfg=document.getElementById("resfg_row"+no).innerHTML;
		        	   var resdate=document.getElementById("resdate_row"+no).innerHTML;
		        	   var nfblimit=document.getElementById("nfblimit_row"+no).innerHTML;
		        	   var nfboutstd=document.getElementById("nfboutstd_row"+no).innerHTML;	
		        	   var npaflg=document.getElementById("npaflg_row"+no).innerHTML;	 
		        	   var secflg=document.getElementById("secflg_row"+no).innerHTML;
		        	  var secamt=document.getElementById("secamt_row"+no).innerHTML;
		        	  var arrday=document.getElementById("arrday_row"+no).innerHTML;
		        	  var arramt=document.getElementById("arramt_row"+no).innerHTML;
		        	  var loanratio=document.getElementById("loanratio_row"+no).innerHTML;	
		        	  var spcprvsn=document.getElementById("spcprvsn_row"+no).innerHTML;
		        	  var npareason=document.getElementById("npareason_row"+no).innerHTML;	 
		        	  var repdt=document.getElementById("repdt_row"+no).innerHTML;
		        	  var refePSC300=document.getElementById("refDisplay").value;
		        	   snamt=snamt.replace(/\,/g,'');
		        	   snamt=Number(snamt);
		        	   
		        	   outstdamt=outstdamt.replace(/\,/g,'');
		        	   outstdamt=Number(outstdamt);
		        	  
		        	   
		        	   secamt=secamt.replace(/\,/g,'');
		        	   secamt=Number(secamt);
		        	   
		        	   

		        	   arramt=arramt.replace(/\,/g,'');
		        	   arramt=Number(arramt);
		        	   
		        	   spcprvsn=spcprvsn.replace(/\,/g,'');
		        	   spcprvsn=Number(spcprvsn);
		        	  

		        	   var rptdate1 = {
		        	  		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refePSC300,"accno":accno,"custid":custid,"custname":custname,"systp":systp,"syscode":syscode,"uqid":uqid,"nrefg":nrefg,"iscode":iscode,"cntrycode":cntrycode,"snamt":snamt,"outstdamt":outstdamt,"acccurcode":acccurcode,"resfg":resfg,"resdate":resdate,"nfblimit":nfblimit,"nfboutstd":nfboutstd,"npaflg":npaflg,"secflg":secflg,"secamt":secamt,"arrday":arrday,"arramt":arramt,"loanratio":loanratio,"spcprvsn":spcprvsn,"npareason":npareason,"repdt":repdt,"modtyp":modtyp  
		        	  		}; 
		        	   
		        	   $.ajax({
		        	       url : "PSC0300",
		        	       data : rptdate1  ,
		        	  		dataType : 'json', 
		        	  		type : 'POST',
		        	  		async : true,
		        	  		 success : function(res) {
		        	  			 console.log(res.refno);
		        				
		        				
		        				 $("#refDisplay").val(res.refno);
			   
				  
		        				 $("#pscadd"+no).closest("tr").remove();

				   
		        				
		        			}
		        		});
		        	
		        	 $( this ).dialog( "close" );	        
		  
		      },
		      Cancel: function() {
		          $( this ).dialog( "close" );
		        }
		      }
		  

		      
		    });
		
	}

	function Cancel_row(no){
	 /*  document.getElementById("del_button"+no).style.display="inline-block"; */
	 
	var detcancel={
				"accno":$("#accno_row"+no).text(),"custid":$("#custid_row"+no).text(),"repdt":'<%=dt2%>'
		};
		
		 $.ajax({
		     url : "PSC0300cancel",
		     data : detcancel  ,
				dataType : 'json', 
				type : 'POST',
				async : true,
				 success : function(res) {
					 
	        /*  alert("Cancelation Successful"); */
	       
	         $("#msg").html("Cancellation successful");
	         $( "#dialog-confirm" ).dialog({
			      resizable: false,
			      closeOnEscape: false,
			      height: "auto",
			      width: 400,
			      modal: true,
			      buttons: {
			        "OK": function() {
			        	$( this ).dialog( "close" );
			        	$("#del_button"+no).removeClass('hidden');
			        	location.reload(true);
			        }
			      }
			    });
	         
	         
	         $("#Cancel_button"+no).hide();
	         $("#Cancel_btn"+no).hide();
	         
				}
			});
	}
	 
	 function Canedit_row(no){
	 $("#del_button"+no).removeClass('hidden');
	 	
	 var snamt_val=document.getElementById("snamt_text"+no).value;

	 document.getElementById("snamt_row"+no).innerHTML=snamt_val;

	 

	 var outstdamt_val=document.getElementById("outstdamt_text"+no).value;

	 document.getElementById("outstdamt_row"+no).innerHTML=outstdamt_val;


	 var secamt_val=document.getElementById("secamt_text"+no).value;

	 document.getElementById("secamt_row"+no).innerHTML=secamt_val;


	 
	 var arramt_val=document.getElementById("arramt_text"+no).value;

	 document.getElementById("arramt_row"+no).innerHTML=arramt_val;



	 var spcprvsn_val=document.getElementById("spcprvsn_text"+no).value;

	 document.getElementById("spcprvsn_row"+no).innerHTML=spcprvsn_val;


			$("#edit_button"+no).show();
			/* document.getElementById("edit_button"+no).style.display="block"; */
			document.getElementById("save_button"+no).style.display="none";
			document.getElementById("Cancel_btn"+no).style.display="none";
			 location.reload(true); 
			 var snamt=document.getElementById("snamt_row"+no).innerHTML;	 
      	   var outstdamt=document.getElementById("outstdamt_row"+no).innerHTML;
var secamt=document.getElementById("secamt_row"+no).innerHTML;
var arramt=document.getElementById("arramt_row"+no).innerHTML;
var spcprvsn=document.getElementById("spcprvsn_row"+no).innerHTML;

			  if($("#pscadd"+no).hasClass( "rowaddedd" )){
				  
				  document.getElementById("Cancel_button"+no).style.display="inline-block";


			  }else{
				  document.getElementById("Cancel_button"+no).style.display="none";
			  }
			  
			
	 }

	 
	 function Canadd_row(no){
		 
	
																	   

		 if($("#pscadd"+no).hasClass( "rowaddedd" )){
			
			var detcancel={
					"accno":$("#accno_row"+no).text(),"custid":$("#custid_row"+no).text(),"repdt":'<%=dt2%>'
			};
			

			 $.ajax({
			     url : "PSC0300cancel",
			     data : detcancel  ,
					dataType : 'json', 
					type : 'POST',
					async : true,
					 success : function(res) {
						 $("#msg").html("Cancellation successful");
				         $( "#dialog-confirm" ).dialog({
						      resizable: false,
						      closeOnEscape: false,
						      height: "auto",
						      width: 400,
						      modal: true,
						      buttons: {
						        "OK": function() {
						        	$( this ).dialog( "close" );
						        	
						        }
						      }
						    });
				         
				         
					}
				});
		 }
		 $("#pscadd"+no).remove();
		 
	 }
 </script>

<script>
function myFunction(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("pymdets");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==0 ||b==9 || b==10||b==13|| b==18||b==19 || b==20||b==21|| b==22||b==24){
		
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
	var save=0;
	$("#tb1").show();
	$("#btnSave").hide();
	$("#btnXML").hide();
	 if(z=="load"){
		 $(".det").addClass("clr");
		//FOR DETAILS
		$("#tab1").show();
		$("#tab2").hide();
		var refno=b;
		
		var ins=c;
		
		if(ins==""){
			
			ins=0;
			
		}else{
		
			ins=c;
		} 
		if(refno=="null" || refno==null || refno==""){
			
			refno=0;
		}
		
		 $(".repdisp").val(refno);
		 var srno=1;
		
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "PSC0300details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#pymdets tr").remove();
					 
					
					var b=JSON.parse(res.detpsc0300);
					 console.log(b);
					
					
				
				
						 	if(f=="onload"){
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  //$("#pymdets").append("<tr><td id='custname"+srno+"'>"+b[i].custname+"</td><td id='schmtp"+srno+"'>"+b[i].schmtp+"</td><td id='uqid"+srno+"'>"+b[i].uqid+"</td><td id='nrefg"+srno+"'>"+b[i].nrefg+"</td><td id='iscode"+b[i].iscode+"'></td><td id='custtyp"+srno+"'>"+b[i].custtyp+"</td><td id='cntrycode"+srno+"'>"+b[i].cntrycode+"</td><td id='snamt"+srno+"'>"+b[i].snamt+"</td><td id='outstdamt"+srno+"'>"+b[i].outstdamt+"</td><td id='nfbamtap"+srno+"'>"+b[i].nfbamtap+"</td><td id='nfboutstd"+srno+"'>"+b[i].nfboutstd+"</td><td id='npafg"+srno+"'>"+b[i].npafg+"</td><td id='arrday"+srno+"'>"+b[i].arrday+"</td><td id='spcprvsn"+srno+"'>"+b[i].spcprvsn+"</td><td id='resfg"+srno+"'>"+b[i].resfg+"</td><td id='resn"+srno+"'>"+b[i].resn+"</td><td id='repdt"+srno+"'>"+b[i].repdt+"</td><td><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>") ;  
						 		 $("#pymdets").append(
						 				  "<tr id='pscadd"+srno+"'>"

				                   	  +"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
				                      +"<td id='custid_row"+srno+"' >"+b[i].custid+"</td>"
				                      +"<td id='custname_row"+srno+"' >"+b[i].custname+"</td>"
				                      +"<td  id='systp_row"+srno+"' >"+b[i].systp+"</td>"
				                      +"<td id='syscode_row"+srno+"' >"+b[i].syscode+"</td>"
				                      +"<td id='uqid_row"+srno+"'>"+b[i].uqid+"</td>"
				                      +"<td  id='nrefg_row"+srno+"' >"+b[i].nrefg+"</td>"
				                      +"<td id='iscode_row"+srno+"' >"+b[i].iscode+"</td>"
				                    
				                      +"<td   id='cntrycode_row"+srno+"' >"+b[i].cntrycode+"</td>"
				                      +"<td class='sumder alnum' id='snamt_row"+srno+"' >"+b[i].snamt+"</td>"
				                      				                     				                     	
				                      
				                      +"<td class='sumder alnum'  id='outstdamt_row"+srno+"'>"+b[i].outstdamt+"</td>"	
				                      +"<td  id='acccurcode_row"+srno+"'>"+b[i].acccurcode+"</td>"	
				                      +"<td   id='resfg_row"+srno+"'>"+b[i].resfg+"</td>"	
				                      +"<td id='resdate_row"+srno+"'>"+b[i].resdate+"</td>"	
				                      +"<td id='nfblimit_row"+srno+"'>"+b[i].nfblimit+"</td>"	
				                      +"<td id='nfboutstd_row"+srno+"'>"+b[i].nfboutstd+"</td>"	
				                      +"<td id='npaflg_row"+srno+"'>"+b[i].npaflg+"</td>"	
				                      +"<td id='secflg_row"+srno+"'>"+b[i].secflg+"</td>"	
				                      +"<td class='sumder alnum' id='secamt_row"+srno+"'>"+b[i].secamt+"</td>"	
				                      +"<td id='arrday_row"+srno+"'>"+b[i].arrday+"</td>"	
				                      
				                      +"<td class='sumder alnum' id='arramt_row"+srno+"'>"+b[i].arramt+"</td>"	
				                      +"<td id='loanratio_row"+srno+"'>"+b[i].loanratio+"</td>"	
				                      
				                      +"<td class='sumder alnum' id='spcprvsn_row"+srno+"'>"+b[i].spcprvsn+"</td>"	
				                      
				                      +"<td id='npareason_row"+srno+"'>"+b[i].npareason+"</td>"		
				                    
				                      +"<td id='repdt_row"+srno+"'>"+b[i].repdt+"</td>"	
				                    
				                      +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none; ' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')></td>"	
				                     
				                      
				                    +"</tr>" ) ; 
						 		 
								
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 	
						 		$("#modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
						 			$("#pymdets").append("<tr>"

					 				  
					 				  
					 				 
						 					+"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
						                      +"<td id='custid_row"+srno+"' >"+b[i].custid+"</td>"
						                      +"<td id='custname_row"+srno+"' >"+b[i].custname+"</td>"
						                      +"<td  id='systp_row"+srno+"' >"+b[i].systp+"</td>"
						                      +"<td id='syscode_row"+srno+"' >"+b[i].syscode+"</td>"
						                      +"<td id='uqid_row"+srno+"'>"+b[i].uqid+"</td>"
						                      +"<td  id='nrefg_row"+srno+"' >"+b[i].nrefg+"</td>"
						                      +"<td id='iscode_row"+srno+"' >"+b[i].iscode+"</td>"
						                    
						                      +"<td   id='cntrycode_row"+srno+"' >"+b[i].cntrycode+"</td>"
						                      +"<td class='sumder alnum' id='snamt_row"+srno+"' >"+b[i].snamt+"</td>"
						                      				                     				                     	
						                      
						                      +"<td class='sumder alnum'  id='outstdamt_row"+srno+"'>"+b[i].outstdamt+"</td>"	
						                      +"<td  id='acccurcode_row"+srno+"'>"+b[i].acccurcode+"</td>"	
						                      +"<td   id='resfg_row"+srno+"'>"+b[i].resfg+"</td>"	
						                      +"<td id='resdate_row"+srno+"'>"+b[i].resdate+"</td>"	
						                      +"<td id='nfblimit_row"+srno+"'>"+b[i].nfblimit+"</td>"	
						                      +"<td id='nfboutstd_row"+srno+"'>"+b[i].nfboutstd+"</td>"	
						                      +"<td id='npaflg_row"+srno+"'>"+b[i].npaflg+"</td>"	
						                      +"<td id='secflg_row"+srno+"'>"+b[i].secflg+"</td>"	
						                      +"<td class='sumder alnum' id='secamt_row"+srno+"'>"+b[i].secamt+"</td>"	
						                      +"<td id='arrday_row"+srno+"'>"+b[i].arrday+"</td>"	
						                      
						                      +"<td class='sumder alnum' id='arramt_row"+srno+"'>"+b[i].arramt+"</td>"	
						                      +"<td id='loanratio_row"+srno+"'>"+b[i].loanratio+"</td>"	
						                      
						                      +"<td class='sumder alnum'id='spcprvsn_row"+srno+"'>"+b[i].spcprvsn+"</td>"	
						                      
						                      +"<td id='npareason_row"+srno+"'>"+b[i].npareason+"</td>"		
						                    
						                      +"<td id='repdt_row"+srno+"'>"+b[i].repdt+"</td>"	
						                    
				                      +"</tr>" ) ; 
								
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
			
			var refno=b;
			var ins=c;
				if(ins==""){
					ins=0;
				}else{
					ins=c;
				} 
				if(refno=="null" || refno==null || refno==""){
					refno=0;
				}
				
				  /* $("#divLoading").addClass("show");  */
				
				 $(".repdisp").val(refno);
				
						$("#test tr").children().detach().remove();
						
						 var rptdate1 = {
								  "dt1" : d,"dt2":e,"reportrefnos":refno,"curr":g,"reptype":a
								}; 
						 
						 $.ajax({
						     url : "PSC0300SUM",
						     data : rptdate1  ,
								dataType : 'json', 
								type : 'POST',
								async : true,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							console.log(res.summarypsc0300);
						
							var b=JSON.parse(res.summarypsc0300);
							
							var k=1;
							var cnt1=1;
							var srno=1;
							
							for (var i = 0;i < b.length; i++) {
							
								$("#sec1").append("<tr><td id='slno"+cnt1+"'>"+b[i].slno+"</td><td id='cusname"+cnt1+"'>"+b[i].cusname+"</td><td id='schmtp"+cnt1+"'>"+b[i].schmtp+"</td><td id='uqidfr"+cnt1+"'>"+b[i].uqidfr+"</td><td id='rests"+cnt1+"'>"+b[i].rests+"</td><td id='isiccode"+cnt1+"'>"+b[i].isiccode+"</td><td id='custyp"+cnt1+"'>"+b[i].custyp+"</td><td id='cntry"+cnt1+"'>"+b[i].cntry+"</td><td class='sumder alnum' id='lnvalrto"+cnt1+"'>"+b[i].lnvalrto+"</td><td class='sumder alnum' id='fbaprvd"+cnt1+"'>"+b[i].fbaprvd+"</td><td class='sumder alnum' id='fboutsndg"+cnt1+"'>"+b[i].fboutsndg+"</td><td class='sumder alnum' id='nfbaprvd"+cnt1+"'>"+b[i].nfbaprvd+"</td><td class='sumder alnum' id='nfboutsndg"+cnt1+"'>"+b[i].nfboutsndg+"</td><td class='sumder alnum' id='totoutsndg"+cnt1+"'>"+b[i].totoutsndg+"</td><td class='sumder alnum' id='amtarr"+cnt1+"'>"+b[i].amtarr+"</td><td class='sumder alnum' id='nodarr"+cnt1+"'>"+b[i].nodarr+"</td><td class='sumder alnum' id='amtimp"+cnt1+"'>"+b[i].amtimp+"</td><td class='sumder alnum' id='amtspcprvsn"+cnt1+"'>"+b[i].amtspcprvsn+"</td><td class='sumder alnum' id='amtres"+cnt1+"'>"+b[i].amtres+"</td><td id='reason"+cnt1+"'>"+b[i].reason+"</td><td style='text-align:center;'><input type=radio style=width: 15px; text-align:center; onclick=fnloads("+cnt1+") id='edit"+cnt1+"'></td></tr>");
								
							srno++;
								cnt1++;
								
							} 
						
							
							  $("#divLoading").removeClass('show'); 
							 $('.alnum').mask("#,##0.00", {reverse: true});
							
								 }
								 }); 
						 
						 
						 var rptdate2= {
								  "dt1" : d,"dt2":e,"reportrefnos":refno,"curr":g,"reptype":a
								}; 
						 
						 $.ajax({
						     url : "PSC0300SUM1",
						     data : rptdate2  ,
								dataType : 'json', 
								type : 'POST',
								async : true,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							console.log(res.sumpsc0300);
						
							var b=JSON.parse(res.sumpsc0300);
							
							var k=1;
							var cnt1=1;
							var srno=1;
							
							for (var i = 0; i < b.length; i++) {
							
								$("#sec2").append("<tr><td id='instname"+cnt1+"'>"+b[i].instname+"</td><td id='inscode"+cnt1+"'>"+b[i].inscode+"</td><td class='sumder alnum' id='resprmtr"+cnt1+"'>"+b[i].resprmtr+"</td><td class='sumder alnum' id='resbyr"+cnt1+"'>"+b[i].resbyr+"</td><td class='sumder alnum' id='nrsprmtr"+cnt1+"'>"+b[i].nrsprmtr+"</td><td class='sumder alnum' id='nrsbyr"+cnt1+"'>"+b[i].nrsbyr+"</td><td style='text-align:center;'><input type=radio style=width: 15px; onclick=fnloads("+cnt1+") id='edit"+cnt1+"'></td></tr>");
								
							srno++;
								cnt1++;
								
							} 
						
							  $("#divLoading").removeClass('show'); 
							 $('.alnum').mask("#,##0.00", {reverse: true});
							
								 }
								 }); 
						 
						 
						 
					
				 
	 }
	 var datasum={
				"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>'
		};
	 

	 $.ajax({
			url:"savecheckPSC",
			data:datasum,
			dataType:'json',
			type:'POST',
			async:true,
			success : function(res) {
				
				/* $("#savecheck").val(res.cnt); */
			
					 			 	

				if(res.cnt1=="0"){
					save=0;	
					 $("#btnXML").prop("disabled",true); 
					
				
					
				}
				else
					{
					
					$("#btnXML").prop("disabled",false);
			save++;
					
					
				}
				 
				 $("#savecheck").val(save);
				 
			}
		
	
		
		
		});  	   


				
	 }

function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_PSC0300_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>
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
	border-color: rgba(18, 18, 19, 0.22);
}

.modal-footer {
	text-align: center;
	border-top: 0;
	padding: 25px;
	padding-right: 208px;
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

li  .active a {
	backround-color: #f1efef;
}

.headingtab {
	font-size: 11px;
	line-height: 0.428971;
}
</style>

<body>


	<div class="container">

		<div class="loader"></div>

		<form class="form-horizontal" method="post" name="PSC0300Form"
			enctype="multipart/form-data">
			<div class="tab-content">
				<input type="hidden" id="modflg"> <input type="hidden"
					id="modtyp"> <input type="hidden" id="savecheck">
				<div class="active psc0500" id="tab2"
					style="width: 1618px; padding-top: 1px; margin-top: -17px;">
					<div style="text-align: left; margin-top: 40px;">
						<font size="2" style="font-size: 13px;"><b>PSC0300-Sectorwise
								Distribution of Credit to the Small and Medium Enterprises
								(SMEs) <b id="sub" Style="display: none"></b>
						</b></font>
					</div>
					<br>
					<ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">

						<li class=" pull-right list" id="li2" onclick="functionli(2);"><a
							href="#tab2" data-toggle="tab"><span class="headingtab">2</span></a></li>


						<li class=" pull-right active list" id="li1"
							onclick="functionli(1);"><a href="#tab1" data-toggle="tab"><span
								class="headingtab"> 1 </span></a></li>




					</ul>
					<table class="" style="width: 100%; height: 50px;">
						<tr>
							<td style="background-color: #bbc3cb;"><font size="1"><input
									type="hidden" style="color: #0c1190; font-size: 11px;"
									class="repdisp" id="refDisplay"></b></font></td>
							<td
								style="text-align: center; background-color: #bbc3cb; width: 325px;"></td>
							<td style="background-color: #bbc3cb; text-align: right;"><a
								class="btn btn-xs btn-primary det" href="#tab1" id="det"
								data-toggle="tab"><span class="headingtab"> Details
								</span></a> <a class="btn btn-xs btn-primary summ" href="#tab2" id=""
								data-toggle="tab"><span class="headingtab ">Summary
								</span></a> <a id="btndwnld"><i
									class="glyphicon glyphicon-download-alt"
									style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><select
								id="dnloadfrmt" style="border-radius: 4px; margin-left: 10px;"><option
										value="pdf">pdf</option>
									<option value="excel">Excel</option></select></td>
						</tr>
					</table>

					<table class="table" id="tb1"
						style="width: 100%; display: none; margin-top: -20px;">
						<tr>
							<th rowspan="3">Sr.No</th>
							<th rowspan="2">Name of customer</th>
							<th rowspan="2">Type of Scheme</th>
							<th rowspan="2">Unique identifier of customer</th>
							<th rowspan="2">Residential status</th>
							<th rowspan="2">ISIC Code</th>
							<th rowspan="2">Type of Customer in the scheme</th>
							<th rowspan="2">Country of residence</th>
							<th rowspan="2">Actual loan to value ratio</th>
							<th colspan="2" style="text-align: center">Fund based</th>
							<th colspan="2" style="text-align: center">Non Fund based</th>
							<th rowspan="2">Total amount outstanding for fund based and
								non-fund based credit facility</th>
							<th rowspan="2">Amount in Arrears</th>
							<th rowspan="2">Number of days in Arrears</th>
							<th rowspan="2">Amount Impaired</th>
							<th rowspan="2">Amount of specific Provision</th>
							<th rowspan="2">Amount of facility restructured</th>
							<th rowspan="2">Reason for account which is reported as
								arrears/ impaired/ restructured/ bad debts written off</th>
							<th rowspan="3" style="text-align: center">Select</th>
						</tr>
						<tr>
							<th rowspan="1">Amount approved</th>
							<th rowspan="1">Amount OutStanding</th>
							<th rowspan="1">Amount approved</th>
							<th rowspan="1">Amount OutStanding</th>
						</tr>
						<tr>
							<th style="text-align: center">A</th>
							<th style="text-align: center">B</th>
							<th style="text-align: center">C</th>
							<th style="text-align: center">D</th>
							<th style="text-align: center">E</th>
							<th style="text-align: center">F</th>
							<th style="text-align: center">G</th>
							<th style="text-align: center">H</th>
							<th style="text-align: center">I</th>
							<th style="text-align: center">J</th>
							<th style="text-align: center">K</th>
							<th style="text-align: center">L</th>
							<th style="text-align: center">M</th>
							<th style="text-align: center">N</th>
							<th style="text-align: center">O</th>
							<th style="text-align: center">P</th>
							<th style="text-align: center">Q</th>
							<th style="text-align: center">R</th>
							<th style="text-align: center">S</th>
						</tr>
						<tbody class="databody" id="sec1"></tbody>
					</table>

					<table class="table" id="tb2"
						style="width: 100%; display: none; margin-top: -20px;">
						<tr>
							<th rowspan="3" style="text-align: center">Particulars</th>
							<th rowspan="3" style="text-align: center"></th>
							<th style="text-align: center" colspan="2">Resident</th>
							<th style="text-align: center" colspan="2">Non-Resident</th>
							<th rowspan="3" style="text-align: center">Select</th>
						</tr>
						<tr>
							<th rowspan="1" style="text-align: center">Promoter</th>
							<th rowspan="1" style="text-align: center">Buyer</th>
							<th rowspan="1" style="text-align: center">Promoter</th>
							<th rowspan="1" style="text-align: center">Buyer</th>
						</tr>
						<tr>
							<th style="text-align: center">A</th>
							<th style="text-align: center">B</th>
							<th style="text-align: center">C</th>
							<th style="text-align: center">D</th>
						</tr>
						<tbody class="databody" id="sec2"></tbody>
					</table>
					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-primary btnhome"
							id="btnhome">Home</button>
						<!--     <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button> -->

						<button type="button" class="btn btn-xs btn-primary" value="Excel"
							id="btnSave">Save</button>

						<button type="button" class="btn btn-xs btn-primary"
							style="display: none" value="Excel" id="btnXML">Gen XML
							Sum</button>

						<!--  <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button> -->
						<button type="button" class="btn btn-xs btn-primary btnback"
							value="back" id="btnback">Back</button>
					</div>

				</div>




				<!-- DETAIL TABLE -->

				<input type="hidden" id="rowno"> <input type="hidden"
					id="addrowno">
				<div class="active" id="tab1"
					style="width: 2550px; padding-top: 1px; margin-top: -17px; display: none">
					<div style="text-align: left; margin-top: 40px;">
						<font size="2" style="font-size: 13px;"><b>PSC0300-Sectorwise
								Distribution of Credit to the Small and Medium Enterprises
								(SMEs)<b id="sub" Style="display: none"></b>
						</b></font>
					</div>
					<br>
					<table class="table" style="width: 2550px; height: 50px;">
						<tr>
							<td style="background-color: #bbc3cb; width: 250px;"><font
								size="1"><input type="hidden"
									style="color: #0c1190; font-size: 11px;" class="repdisp"
									id="refDisplay"></b></font></td>
							<td
								style="text-align: center; background-color: #bbc3cb; width: 1697px;"></td>
							<td style="background-color: #bbc3cb; text-align: right;"><a
								class="btn btn-xs btn-primary det" href="#tab1" id="det"
								data-toggle="tab"><span class="headingtab"> Details
								</span></a> <a class="btn btn-xs btn-primary" href="#tab2"
								data-toggle="tab"><span class="headingtab" id="sumfirst">Summary
								</span></a><a id="btnExcel"><i class="glyphicon glyphicon-download-alt"
									style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a
								class="btn btn-xs btn-primary add"
								style="width: 45px; margin-left: 15px;" href="#"
								data-toggle="tab"><span class="headingtab" id="addrow">Add
								</span></a> <a class="btn btn-default btn-xs btn-primary"
								style="margin-left: 10px;" id="btnfilter"><span
									class="glyphicon glyphicon-filter"></span> Filter</a></td>
						</tr>
					</table>
					<div class="panel panel-primary filterable">


						<table class="table" id="tbcate" border="1"
							style="width: 100%; margin-top: -20px;">

							<thead>

								<tr class="filters">
									<th style="text-align: center"><textarea
											style="text-align: center; width: 100px;" type="text"
											id="accno" onkeyup="myFunction(this.id,0)"
											class="form-control2" placeholder="Account Number" disabled></textarea></th>

									<th style="text-align: center"><textarea
											style="text-align: center; width: 70px;" type="text"
											id="custid" onkeyup="myFunction(this.id,1)"
											class="form-control2" placeholder="Customer Id" disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 200px;" type="text"
											id="custname" onkeyup="myFunction(this.id,2)"
											class="form-control2" placeholder="Customer Name" disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 50px;" type="text"
											id="systp" onkeyup="myFunction(this.id,3)"
											class="form-control2" placeholder="Scheme Type" disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 53px;" type="text"
											id="syscode" onkeyup="myFunction(this.id,4)"
											class="form-control2" placeholder="Scheme Code" disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 66px;" type="text"
											id="uqid" onkeyup="myFunction(this.id,5)"
											class="form-control2" placeholder="Unique Identifier"
											disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 54px;" type="text"
											id="nrefg" onkeyup="myFunction(this.id,6)"
											class="form-control2" placeholder="NRE Flag" disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 50px;" type="text"
											id="iscode" onkeyup="myFunction(this.id,7)"
											class="form-control2" placeholder="ISIC Code" disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 45px;" type="text"
											id="cntrycode" onkeyup="myFunction(this.id,8)"
											class="form-control2" placeholder="Country Code" disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 83px;" type="text"
											id="snamt" onkeyup="myFunction(this.id,9)"
											class="form-control2" placeholder="Sanction Amount" disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 100px;" type="text"
											id="outstdamt" onkeyup="myFunction(this.id,10)"
											class="form-control2" placeholder="Outstanding Amount"
											disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 100px;" type="text"
											id="acccurcode" onkeyup="myFunction(this.id,11)"
											class="form-control2" placeholder="Account Currency Code"
											disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 70px;" type="text"
											id="resfg" onkeyup="myFunction(this.id,12)"
											class="form-control2" placeholder="Restructured flag"
											disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 100px;" type="text"
											id="resdate" onkeyup="myFunction(this.id,13)"
											class="form-control2" placeholder="Restructured Date"
											disabled></textarea></th>

									<th style="text-align: center"><textarea
											style="text-align: center; width: 52px;" type="text"
											id="nfblimit" onkeyup="myFunction(this.id,14)"
											class="form-control2" placeholder="NFB Limit" disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 100px;" type="text"
											id="nfboutstd" onkeyup="myFunction(this.id,15)"
											class="form-control2" placeholder="NFB Outstanding" disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 51px;" type="text"
											id="npaflg" onkeyup="myFunction(this.id,16)"
											class="form-control2" placeholder="NPA Flag" disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 58px;" type="text"
											id="secflg" onkeyup="myFunction(this.id,17)"
											class="form-control2" placeholder="Secured Flag" disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 87px;" type="text"
											id="secamt" onkeyup="myFunction(this.id,18)"
											class="form-control2" placeholder="Secured Amount" disabled></textarea></th>

									<th style="text-align: center"><textarea
											style="text-align: center; width: 55px;" type="text"
											id="arrday" onkeyup="myFunction(this.id,19)"
											class="form-control2" placeholder="Arrear Days" disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 89px;" type="text"
											id="arramt" onkeyup="myFunction(this.id,20)"
											class="form-control2" placeholder="Arrear Amount" disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 64px;" type="text"
											id="loanratio" onkeyup="myFunction(this.id,21)"
											class="form-control2" placeholder="Loan Ratio" disabled></textarea></th>

									<th style="text-align: center"><textarea
											style="text-align: center; width: 89px;" type="text"
											id="spcprvsn" onkeyup="myFunction(this.id,22)"
											class="form-control2" placeholder="Specific Provision"
											disabled></textarea></th>
									<th style="text-align: center"><textarea
											style="text-align: center; width: 77px;" type="text"
											id="npareason" onkeyup="myFunction(this.id,23)"
											class="form-control2" placeholder="NPA Reason" disabled></textarea></th>
									<th style="width: 73px; text-align: center"><textarea
											style="text-align: center; width: 73px;" type="text"
											id="repdt" onkeyup="myFunction(this.id,24)"
											class="form-control2" placeholder="Report Date" disabled></textarea></th>
									<th style="text-align: center; width: 105px" id="modify">Modify</th>
								</tr>

							</thead>



							<tbody class="databody" id="pymdets">





							</tbody>



						</table>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-primary btnhome"
							id="btnhome">Home</button>

						<button type="button" class="btn btn-xs btn-primary btnback"
							value="back" id="btnback">Back</button>
					</div>

				</div>




			</div>



			<div id="dialog-confirm" title="Alert" style="display: none">
				<p>
					<span class="glyphicon glyphicon-alert"
						style="float: left; margin: 0px 12px 20px 0;"></span><font
						id="msg"></font>
				</p>
			</div>
			<div tabindex="-1" role="dialog"
				class="ui-dialog ui-corner-all ui-widget ui-widget-content ui-front ui-dialog-buttons ui-draggable"
				aria-describedby="dialog-confirm" aria-labelledby="ui-id-1"
				style="height: auto; width: 400px; top: 322px; left: 325px; display: none; z-index: 101;">
				<div
					class="ui-dialog-titlebar ui-corner-all ui-widget-header ui-helper-clearfix ui-draggable-handle">
					<span id="ui-id-1" class="ui-dialog-title">Alert</span>
					<button type="button"
						class="ui-button ui-corner-all ui-widget ui-button-icon-only ui-dialog-titlebar-close"
						title="Close">
						<span class="ui-button-icon ui-icon ui-icon-closethick"> </span> <span
							class="ui-button-icon-space"> </span>Close
					</button>
				</div>
				<div id="dialog-confirm"
					style="width: auto; min-height: 63px; max-height: none; height: auto;"
					class="ui-dialog-content ui-widget-content">
					<p>
						<span class="glyphicon glyphicon-alert"
							style="float: left; margin: 0px 12px 20px 0;"></span> <font
							id="msg">Are you sure,you want to delete it?</font>
					</p>
				</div>
				<div
					class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
					<div class="ui-dialog-buttonset">
						<button type="button" class="ui-button ui-corner-all ui-widget">OK</button>

						<button type="button" class="ui-button ui-corner-all ui-widget">CLOSE</button>
					</div>
				</div>
			</div>




		</form>


	</div>





</body>
</html>