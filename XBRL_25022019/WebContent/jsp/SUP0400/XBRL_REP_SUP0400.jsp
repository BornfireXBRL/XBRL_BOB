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

	 
  <%//String RRID = request.getParameter("RRID");
 
 
 String rptdate = request.getParameter("rptdate");
 
 String dt1 = request.getParameter("dt1");
 String dt2 = request.getParameter("dt2");
 
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
<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;url=../XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" /> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>XBRL REPORT</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="ib.viewport">
<!-- Bootstrap 3.3.6 -->
  
  <link rel="stylesheet" href="../../css/bootstrap.min.css"> <!-- style page -->
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 
 <link rel="stylesheet" href="../../Bootstrap/css/bootstrap.min.css">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="../Bootstrap/css/bootstrap.min.css">
  <script src="../../js/modal/code.js"></script>
    <script src="../../js/modal/codejquery.js"></script>
  
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

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="../Bootstrap/css/bootstrap.min.css">
  	

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

.clr{
color: #0c0b0b;
    background-color: #f5f5f5;
    border-color: #f5f5f5;
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
textarea
{
text-align:center;
overflow: hidden;
resize:none;
height: 40px;
border:none;
background-color: #f5f5f5;
white-space:pre-wrap;
word-wrap:break-word;
resize: none;
-webkit-text-fill-color: #333333;
}

.ui-dialog-titlebar-close {
    visibility: hidden;
}
</style>


<script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});

/* checking count in SUP0400_MOD_TABLE for  redirecting to XBRL_VER_SUP0400_01.jsp */
var det={
	"repdate":'<%=dt2%>',"type":"chckmodified"
};
$.ajax({
	url:"SUP0400chckmodified",
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
			        	location.href = "XBRL_CRT_SUP0400.jsp?reptype="+'<%=request.getParameter("reptype")%>';
			        }
			      }
			    });
			
			
		}else{
			$("#modflg").val("N");
		}
	}
});

</script>
<SCRIPT>
var srno=1;
function fnload(z,d,e,b,c,a,f,g){
	//z --->typo(load or summary)
	//d -->date1
	//e -->date2
	//b -->refseqno
	//c -->instance no
	//a -->reptype
	//f -->types of details
	//g -->currency
	$("#btnXML").hide();
	 $("#btnSave").hide();
	 var save=0;
	 if(z=="load"){
		//FOR DETAILS
		$(".det").addClass("clr");
		$("#tab1").show();
		$("#tab2").hide();
		$(".psc0500,.psc0501").hide();
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
		 var cnt1=1;
		
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "sup0400details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				
					  $("#pymdets tr").remove();
					 
					
					var b=JSON.parse(res.detailsSUP0400);
					 console.log(b);
					
			
						 	if(f=="onload"){
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 			
						 		  
						 		 $("#pymdets").append("<tr id='supadd"+cnt1+"'><td id='groupName_row"+cnt1+"'>"+b[i].groupName+"</td><td id='groupId_row"+cnt1+"'>"+b[i].groupId+"</td><td id='partyName_row"+cnt1+"'>"+b[i].partyName+"</td><td id='uniqueId_row"+cnt1+"'>"+b[i].uniqueId+"</td><td id='typeofParty_row"+cnt1+"'>"+b[i].typeofParty+"</td><td id='relationship_row"+cnt1+"'>"+b[i].relationship+"</td><td id='purpose_row"+cnt1+"'>"+b[i].purpose+"</td><td id='approvalDate_row"+cnt1+"'>"+b[i].approvalDate+"</td><td id='originalCurrency_row"+cnt1+"'>"+b[i].originalCurrency+"</td><td id='sancamtcurfb_row"+cnt1+"' class='sumder'>"+b[i].sancamtcurfb+"</td><td id='sancamtcurnfb_row"+cnt1+"' class='sumder'>"+b[i].sancamtcurnfb+"</td><td id='outamtcurfb_row"+cnt1+"' class='sumder'>"+b[i].outamtcurfb+"</td><td id='outamtcurnfb_row"+cnt1+"' class='sumder'>"+b[i].outamtcurnfb+"</td><td id='numerator_row"+cnt1+"' class='sumder'>"+b[i].numerator+"</td><td id='noofarrears_row"+cnt1+"'>"+b[i].noofarrears+"</td><td id='intRate_row"+cnt1+"' class='sumder'>"+b[i].intRate+"</td><td id='remainingMaturityDays_row"+cnt1+"'>"+b[i].remainingMaturityDays+"</td><td id='collateralType_row"+cnt1+"'>"+b[i].collateralType+"</td><td id='collateralDesc_row"+cnt1+"'>"+b[i].collateralDesc+"</td><td id='lastValuationDate_row"+cnt1+"'>"+b[i].lastValuationDate+"</td><td id='value_row"+cnt1+"' class='sumder'>"+b[i].value+"</td><td id='reportDate_row"+cnt1+"' >"+b[i].reportDate+"</td><td style='text-align:center;'><input type='button' id='edit_button"+cnt1+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+cnt1+"')>  <input type='button' id='save_button"+cnt1+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+cnt1+"')><input type='button' id='Cancel_button"+cnt1+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+cnt1+"')><input type='button' id='Cancel_btn"+cnt1+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+cnt1+"')><input type='button' id='del_button"+cnt1+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+cnt1+"')> </td></tr>");
								 srno++;
								 cnt1++; 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 	
						 		$("#modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
						 			 $("#pymdets").append("<tr><td id='groupName_row"+srno+"'>"+b[i].groupName+"</td><td id='groupId_row"+srno+"'>"+b[i].groupId+"</td><td id='partyName_row"+srno+"'>"+b[i].partyName+"</td><td id='uniqueId_row"+srno+"'>"+b[i].uniqueId+"</td><td id='typeofParty_row"+srno+"'>"+b[i].typeofParty+"</td><td id='relationship_row"+srno+"'>"+b[i].relationship+"</td><td id='purpose_row"+srno+"'>"+b[i].purpose+"</td><td id='approvalDate_row"+srno+"'>"+b[i].approvalDate+"</td><td id='originalCurrency_row"+srno+"'>"+b[i].originalCurrency+"</td><td id='sancamtcurfb_row"+srno+"' class='sumder'>"+b[i].sancamtcurfb+"</td><td id='sancamtcurnfb_row"+srno+"' class='sumder'>"+b[i].sancamtcurnfb+"</td><td id='outamtcurfb_row"+srno+"' class='sumder'>"+b[i].outamtcurfb+"</td><td id='outamtcurnfb_row"+srno+"' class='sumder'>"+b[i].outamtcurnfb+"</td><td id='numerator_row"+srno+"' class='sumder'>"+b[i].numerator+"</td><td id='noofarrears_row"+srno+"'>"+b[i].noofarrears+"</td><td id='intRate_row"+srno+"' class='sumder'>"+b[i].intRate+"</td><td id='remainingMaturityDays_row"+srno+"'>"+b[i].remainingMaturityDays+"</td><td id='collateralType_row"+srno+"'>"+b[i].collateralType+"</td><td id='collateralDesc_row"+srno+"'>"+b[i].collateralDesc+"</td><td id='lastValuationDate_row"+srno+"'>"+b[i].lastValuationDate+"</td><td id='value_row"+srno+"' class='sumder'>"+b[i].value+"</td><td id='reportDate_row"+srno+"' >"+b[i].reportDate+"</td></tr>") ;  
							 		  
							 		  
								 
								
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
				if(ins=="" || ins=="null" || ins==null ){
					ins=0;
				}else{
					ins=c;
				} 
				if(refno=="null" || refno==null || refno==""){
					refno=0;
				}
				
				  /* $("#divLoading").addClass("show");  */
				
				 $(".repdisp").val(refno);
				 
					
						$("#sec1 tr").children().detach().remove();
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "sup0400sec1",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec1 tr").remove();
								 
								
								var b=JSON.parse(res.sec1SUP0400);
								 console.log(b);
								
                                 
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec1").append("<tr><td id='instName"+srno+"'>"+b[i].instName+"</td><td id='instCode"+srno+"'>"+b[i].instCode+"</td><td id='amt"+srno+"' class='sumder'>"+b[i].amt+"</td><td id='percentage' class='sumder'>"+b[i].percentage+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads(0) id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   	
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "sup0400sec2",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec2 tr").remove();
								 
								
								var b=JSON.parse(res.sec2SUP0400);
								 console.log(b);
								
                                 
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec2").append("<tr><td id='slNo"+srno+"'>"+b[i].slNo+"</td><td id='groupName"+srno+"'>"+b[i].groupName+"</td><td id='groupId"+srno+"'>"+b[i].groupId+"</td><td id='partyName'>"+b[i].partyName+"</td><td id='uniqueId'>"+b[i].uniqueId+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads(0) id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   	
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "sup0400sec3",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec3 tr").remove();
								 
								
								var b=JSON.parse(res.sec3SUP0400);
								 console.log(b);
								
                                 
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec3").append("<tr><td id='dyndom"+srno+"'>"+b[i].dyndom+"</td><td id='partyslNo"+srno+"'>"+b[i].partyslNo+"</td><td id='translNo"+srno+"'>"+b[i].translNo+"</td><td id='groupName"+srno+"'>"+b[i].groupName+"</td><td id='groupId'>"+b[i].groupId+"</td><td id='partyName'>"+b[i].partyName+"</td> <td id='uniqueId'>"+b[i].uniqueId+"</td><td id='typeofParty'>"+b[i].typeofParty+"</td><td id='relationship'>"+b[i].relationship+"</td><td id='purpose'>"+b[i].purpose+"</td><td id='approvalDate'>"+b[i].approvalDate+"</td><td id='originalCurrency'>"+b[i].originalCurrency+"</td><td id='amtoriginalCurrency' class='sumder'>"+b[i].amtoriginalCurrency+"</td><td id='fbamtreporCurrency' class='sumder'>"+b[i].fbamtreporCurrency+"</td><td id='nfbreporCurrency' class='sumder'>"+b[i].nfbreporCurrency+"</td><td id='outamtoriginalCurrency' class='sumder'>"+b[i].outamtoriginalCurrency+"</td><td id='fboutamureporCurrency' class='sumder'>"+b[i].fboutamureporCurrency+"</td><td id='nfboutamtreporCurrency' class='sumder'>"+b[i].nfboutamtreporCurrency+"</td><td id='numerator' class='sumder'>"+b[i].numerator+"</td><td id='tier1Percentage' class='sumder'>"+b[i].tier1Percentage+"</td><td id='noofarrears'>"+b[i].noofarrears+"</td><td id='intRate' class='sumder'>"+b[i].intRate+"</td><td id='remainingMaturityDays'>"+b[i].remainingMaturityDays+"</td><td id='collateralType'>"+b[i].collateralType+"</td><td id='collateralDesc'>"+b[i].collateralDesc+"</td><td id='lastValuationDate'>"+b[i].lastValuationDate+"</td><td id='value' class='sumder'>"+b[i].value+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads(0) id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   	
						
							
					}
				 
	

/* Hide & show of GEN Xml button */
var datasum={
			"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>'
	};
$.ajax({
		url:"savecheckSUP0400",
		data:datasum,
		dataType:'json',
		type:'POST',
		async:true,
		success : function(res) {
			
		
			
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
	location.href = "XBRL_REP_SUP0400.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
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
  table = document.getElementById("pymdets");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==3 ||b==7 || b==9||b==10 || b==11||b==12 || b==13||b==14 || b==15||b==16 || b==19||b==20 || b==21){
		
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
$("#tb4").show();

	
	
	
	
	$( ".btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
	$( '.btnback').click(function() {
		 location.href="XBRL_CRT_SUP0400.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	
	
});	

</script>




<script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});


</script>

<script>

$(document).ready(function(){
	 
	var btn=1;
	 $("#btnpre").prop("disabled",true);
  $("#tb4").show();
  
  $("#btnpre").on("click",function(){
		btn--;
		if(btn==1){
			 $("#btnpre").prop("disabled",true);
			 $("#btnnext").prop("disabled",false);
			 $("#li1").addClass("active");
			 $("#li2").removeClass("active");
		}else{
			 $("#btnpre").prop("disabled",false);
			 $("#btnnext").prop("disabled",true);
			 $("#li2").addClass("active");
			 $("#li1").removeClass("active");
		}
  });
  $("#btnnext").on("click",function(){
		btn++;
		if(btn==5){
			 $("#btnnext").prop("disabled",true);
			 $("#btnpre").prop("disabled",false);
			 $("#li2").addClass("active");
			 $("#li1").removeClass("active");
		}else{
			 $("#btnnext").prop("disabled",false);
			 $("#btnpre").prop("disabled",true);
			 $("#li1").addClass("active");
			 $("#li2").removeClass("active");
		}
  });
});
</script>


<script>
function functionli(a){
	$(".table").hide();
	$("#tb"+a).show();
	 $("#btnXML").hide();
	 $("#btnSave").hide();
if(a==1){
	$("#tb2").show();
	$("#btnpre").prop("disabled",true);
	 $("#btnnext").prop("disabled",false);
	 $("#li1").addClass("active");
	 $("#li2").removeClass("active");
	  document.getElementById("tab2").style.width = "904px"; 
	 
}else if(a==2){
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li2").addClass("active");
	 $("#li1").removeClass("active");
	  document.getElementById("tab2").style.width = "952px"; 
}

else if(a==3){
	 $("#btnXML").show();
	 $("#btnSave").show();
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li2").addClass("active");
	 $("#li1").removeClass("active");
	  document.getElementById("tab2").style.width = "1983px"; 
}
}
</script>

<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	
	
	
 	
$("#sumfirst").on("click",function(){
		
		location.href = "XBRL_REP_SUP0400.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_SUP0400.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	
	$("#sumfrst").click(function(){
		 
    	
		  location.href = "XBRL_REP_SUP0400.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		
});
	 
		
	$("#btnfilter").on("click",function(){
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
			$('#grpname,#grpid,#prtyname,#uqid,#typarty,#retnsp,#prps,#appdte,#orgcurncy,#funba,#nonfunba,#funbaout,#nonfunbaout,#numrtr,#noarrdays,#insdate,#remmturtydays,#cltrltype,#cltrldesc,#lstvldt,#val,#repdate').css({
				'text-align':'center',
				'height':'46px',
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
			
			$('#grpname,#grpid,#prtyname,#uqid,#typarty,#retnsp,#prps,#appdte,#orgcurncy,#funba,#nonfunba,#funbaout,#nonfunbaout,#numrtr,#noarrdays,#insdate,#remmturtydays,#cltrltype,#cltrldesc,#lstvldt,#val,#repdate').css({
				'text-align':'center',
					'height':'46px',
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
	
	
	
	$('#btnExcel').click(function() {
		
		SUP0400Form.action = "SUP0400EXCELREPORT.action?method=SUP0400EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		SUP0400Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			SUP0400Form.action = "SUP0400EXCELSum.action?method=SUP0400EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			SUP0400Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			SUP0400Form.action = "SUP0400PDFREPORT.action?method=SUP0400PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			SUP0400Form.submit();
		}
	});
	$('#btnXML').click(function() {
		 SUP0400Form.action = "XMLDOWNLOAD.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		SUP0400Form.submit(); 
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
	 					url:"saveSumSUP0400",
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
	 		
				 $("#btnXML").prop("disabled",false);
			
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
	 				   		url:"saveSumSUP0400",
	 						data:datasum,
	 								dataType:'json',
	 								type:'POST',
	 								async:true,
	 								success:function(res){
	 									
	 									$("#divLoading").removeClass('show');
	 									alert("Saved Successfully");
	 									
	 									 $('#btnSave').css({
	 										
	 										'background-color': 'rgba(51, 122, 183, 1)',
	 										
	 										'color':'white'
	 										
	 										}); 
	 							 
	 								}
	 							});  
	 				        			        
	 				  
	 				      },
	 				      Cancel: function() {
	 				          $( this ).dialog( "close" );
	 				          
	 				         alert("Cancelled Successfully");
								 $('#btnSave').css({
									
									'background-color': 'rgba(51, 122, 183, 1)',
									
									'color':'white'
									
									}); 
						 
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
		$("#pymdets").prepend("<tr  id='supadd"+rowno+"'><td id='groupName_row"+rowno+"'><input type='text' id='groupName_text"+rowno+"' style='width: 136px;'></td><td id='groupId_row"+rowno+"'><input type='text'  id='groupId_text"+rowno+"' style='    width:46px;'></td><td id='partyName_row"+rowno+"'><input type='text' id='partyName_text"+rowno+"' style='     137px;'></td><td id='uniqueId_row"+rowno+"'><input type='text' 	id='uniqueId_text"+rowno+"' style='    width: 55px;'></td><td id='typeofParty_row"+rowno+"'><input type='text' id='typeofParty_text"+rowno+"' style='    width: 176px;'></td><td id='relationship_row"+rowno+"' ><input type='text'  id='relationship_text"+rowno+"'    style='    width: 1000px;'></td><td id='purpose_row"+rowno+"'><input type='text' id='purpose_text"+rowno+"' style='width:129px;'></td><td id='approvalDate_row"+rowno+"'><input type='text' id='approvalDate_text"+rowno+"' style='width:65px;'></td><td id='originalCurrency_row"+rowno+"'><input type='text' id='originalCurrency_text"+rowno+"' style='width: 55px;'></td><td class='sumder alnum' id='sancamtcurfb_row"+rowno+"'><input class='decimalPt roundUp' type='text' id='sancamtcurfb_text"+rowno+"' style='width:109px;'></td><td class='sumder alnum' id='sancamtcurnfb_row"+rowno+"'><input class='decimalPt roundUp' type='text' id='sancamtcurnfb_text"+rowno+"' style='width:149px;'></td><td id='outamtcurfb_row"+rowno+"'><input type='text' id='outamtcurfb_text"+rowno+"' style='width:149px;'></td><td id='outamtcurnfb_row"+rowno+"'><input type='text' id='outamtcurnfb_text"+rowno+"' style='width:149px;'></td><td id='numerator_row"+rowno+"'><input type='text' id='numerator_text"+rowno+"' style='width:100px;'></td><td id='noofarrears_row"+rowno+"'><input type='text' id='noofarrears_text"+rowno+"' style='width:67px;'></td><td id='intRate_row"+rowno+"'><input type='text' id='intRate_text"+rowno+"' style='width:60px;'></td><td id='remainingMaturityDays_row"+rowno+"'><input type='text' id='remainingMaturityDays_text"+rowno+"' style='width:71px;'></td><td id='collateralType_row"+rowno+"'><input type='text' id='collateralType_text"+rowno+"' style='width: 150px;'></td><td class='sumder alnum' id='collateralDesc_row"+rowno+"'><input  type='text' id='collateralDesc_text"+rowno+"' style='width:150px;'></td><td id='lastValuationDate_row"+rowno+"'><input type='text' id='lastValuationDate_text"+rowno+"' style='width:74px;'></td><td class='sumder alnum' id='value_row"+rowno+"'><input class='decimalPt roundUp' type='text' id='value_text"+rowno+"' style='width:92px;'></td><td id='reportDate_row"+rowno+"'><input type='text' id='reportDate_text"+rowno+"' style='width:73px;'></td><td style='text-align:center;'><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')>  <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px;display:inline-block; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");


 fnkeyup(rowno);
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
			}); });

	
		
		
		
});	



									  

 function fnkeyup(a){
 	$("#approvalDate_text"+a).datepicker({
 	dateFormat: "dd-mm-yy",
 	        changeMonth: true,//this option for allowing user to select month
 	      changeYear: true,
 	      yearRange: "-100:+0",
 	      maxDate: "today"
 	});
 
 	
 	$("#lastValuationDate_text"+a).datepicker({
 	 	dateFormat: "dd-mm-yy",
 	 	        changeMonth: true,//this option for allowing user to select month
 	 	      changeYear: true,
 	 	      yearRange: "-100:+0",
 	 	      maxDate: "today"
 	 	});
 	$("#reportDate_text"+a).datepicker({
 	dateFormat: "dd-mm-yy",
 	        changeMonth: true,//this option for allowing user to select month
 	      changeYear: true,
 	      yearRange: "-100:+0",
 	      maxDate: "today"
 	});
 	}  
  
 

   
function edit_row(no)
{
	$(".add").prop("disabled",true);

	/*  	  document.getElementById("del_button"+no).style.display="none";
	 */
	 $("#del_button"+no).addClass('hidden');
	$("#addrowno").val("0");
	modtyp="M";
 	document.getElementById("edit_button"+no).style.display="none";
 	  document.getElementById("save_button"+no).style.display="inline-block";
 	 document.getElementById("Cancel_btn"+no).style.display="inline-block";
 	document.getElementById("Cancel_button"+no).style.display="none";

 	var	sancamtcurfb =  document.getElementById("sancamtcurfb_row"+no);
 	var	sancamtcurfb_data = sancamtcurfb.innerHTML;

 	var	sancamtcurnfb =  document.getElementById("sancamtcurnfb_row"+no);
 	var	sancamtcurnfb_data = sancamtcurnfb.innerHTML;	 	

 	var	outamtcurfb =  document.getElementById("outamtcurfb_row"+no);
 	var	outamtcurfb_data = outamtcurfb.innerHTML; 
 		

 	var	outamtcurnfb =  document.getElementById("outamtcurnfb_row"+no);
 	var	outamtcurnfb_data = outamtcurnfb.innerHTML; 
 		

 	var	numerator =  document.getElementById("numerator_row"+no);
 	var	numerator_data = numerator.innerHTML; 
 		

 	var	intRate =  document.getElementById("intRate_row"+no);
 	var	intRate_data = intRate.innerHTML; 

 	var	value =  document.getElementById("value_row"+no);
 	var	value_data = value.innerHTML; 


 	sancamtcurfb.innerHTML="<input type='text' class='decimalPt roundUp'  id='sancamtcurfb_text"+no+"'  style='width: 83px'; value='"+sancamtcurfb_data+"'>";
 	sancamtcurnfb.innerHTML="<input type='text' class='decimalPt roundUp' id='sancamtcurnfb_text"+no+"' style='width: 83px'; value='"+sancamtcurnfb_data+"'>";
 	outamtcurfb.innerHTML="<input type='text' class='decimalPt roundUp' id='outamtcurfb_text"+no+"' style='width: 83px'; value='"+outamtcurfb_data+"'>";
 	outamtcurnfb.innerHTML="<input type='text' class='decimalPt roundUp' id='outamtcurnfb_text"+no+"' style='width: 83px'; value='"+outamtcurnfb_data+"'>";
 	numerator.innerHTML="<input type='text' class='decimalPt roundUp' id='numerator_text"+no+"' style='width: 83px'; value='"+numerator_data+"'>"; 
 	intRate.innerHTML="<input type='text' class='decimalPt roundUp' id='intRate_text"+no+"' style='width: 83px'; value='"+intRate_data+"'>"; 
 	value.innerHTML="<input type='text' class='decimalPt roundUp' id='value_text"+no+"' style='width: 83px'; value='"+value_data+"'>"; 

 	 
 	 
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
	
		
		if(document.getElementById("sancamtcurfb_text"+no).value==""){
			alert("Enter Fund Based (Amount Account currency) ..");
			error="Y"
		}else if(document.getElementById("sancamtcurnfb_text"+no).value==""){
			alert("Enter  Non FundBased  (Amount Account currency) ..");	
			error="Y"
		}
		else if(document.getElementById("outamtcurfb_text"+no).value==""){
			alert("Enter Fund Based (Outstanding Amount Account currency)  ..");	
			error="Y"
		}
		else if(document.getElementById("outamtcurnfb_text"+no).value==""){
			alert("Enter  Non Fund Based  (Outstanding Amount Account currency)..");	
			error="Y"
		}else if(document.getElementById("numerator_text"+no).value==""){
			alert("Enter Numerator ..");	
			error="Y"
		}else if(document.getElementById("intRate_text"+no).value==""){
			alert("Enter Interest Date ..");	
			error="Y"
		}
		else if(document.getElementById("value_text"+no).value==""){
			alert("Enter Value ..");	
			error="Y"
		}
		
	} else if (modtyp=="A") {
		
	

	
		

    	

		if(document.getElementById("groupName_text"+no).value==""){
			alert("Enter Group name ..");
			error="Y"
		}else if(document.getElementById("groupId_text"+no).value==""){
			alert("Enter Group Id ..");	
			error="Y"
		}else if(document.getElementById("partyName_text"+no).value==""){
			alert("Enter Party Name ..");
			error="Y"
		}else if(document.getElementById("uniqueId_text"+no).value==""){
			alert("Enter Unique Id ..");
			error="Y"
		}else if(document.getElementById("typeofParty_text"+no).value==""){
			alert("Enter Type Of Party ..");
			error="Y"
		}else if(document.getElementById("relationship_text"+no).value==""){
			alert("Enter Relationship ..");	
			error="Y"
		}else if(document.getElementById("purpose_text"+no).value==""){
			alert("Enter Purpose ..");
			error="Y"
		}else if(document.getElementById("approvalDate_text"+no).value==""){
			alert("Enter Approval Date..");
			error="Y"
		}else if(document.getElementById("originalCurrency_text"+no).value==""){
			alert("Enter Original Currency..");
			error="Y"
		}else if(document.getElementById("sancamtcurfb_text"+no).value==""){
			alert("Enter Fund based(Amount account currency) ..");	
			error="Y"
		}else if(document.getElementById("sancamtcurnfb_text"+no).value==""){
			alert("Enter Non Fund based(Amount account currency) ..");	
			error="Y"
		}else if(document.getElementById("outamtcurfb_text"+no).value==""){
			alert("Enter Fund based(Outstanding amount account currency) ..");	
			error="Y"
		}else if(document.getElementById("outamtcurnfb_text"+no).value==""){
			alert("Enter Non fund based(Outstanding amount account) ..");	
			error="Y"
		}else if(document.getElementById("numerator_text"+no).value==""){
			alert("Enter Numerator ..");	
			error="Y"
		}else if(document.getElementById("noofarrears_text"+no).value==""){
			alert("Enter No of Arrear Days ..");	
			error="Y"
		}else if(document.getElementById("intRate_text"+no).value==""){
			alert("Enter Interest Date ..");	
			error="Y"
		}else if(document.getElementById("remainingMaturityDays_text"+no).value==""){
			alert("Enter Remaining Maturity Days ..");	
			error="Y"
		}else if(document.getElementById("collateralType_text"+no).value==""){
			alert("Enter Collateral Type ..");	
			error="Y"
		}else if(document.getElementById("collateralDesc_text"+no).value==""){
			alert("Enter Collateral Description ..");	
			error="Y"
		}else if(document.getElementById("lastValuationDate_text"+no).value==""){
			alert("Enter Last Valuation Date ..");	
			error="Y"
		}else if(document.getElementById("value_text"+no).value==""){
			alert("Enter Value ..");	
			error="Y"
		}else if(document.getElementById("reportDate_text"+no).value==""){
			alert("Enter Report Date ..");	
			error="Y"
		}
		
	}

	if (error=="N"){
	$("#modflg").val("Y");
	modtyp="M";
	document.getElementById("edit_button"+no).checked = false;

	var sancamtcurfb_val=document.getElementById("sancamtcurfb_text"+no).value;

	document.getElementById("sancamtcurfb_row"+no).innerHTML=sancamtcurfb_val;

	var sancamtcurnfb_val=document.getElementById("sancamtcurnfb_text"+no).value;

	document.getElementById("sancamtcurnfb_row"+no).innerHTML=sancamtcurnfb_val;


	var outamtcurfb_val=document.getElementById("outamtcurfb_text"+no).value;

	document.getElementById("outamtcurfb_row"+no).innerHTML=outamtcurfb_val;

	var outamtcurnfb_val=document.getElementById("outamtcurnfb_text"+no).value;

	document.getElementById("outamtcurnfb_row"+no).innerHTML=outamtcurnfb_val;



	var numerator_val=document.getElementById("numerator_text"+no).value;

	document.getElementById("numerator_row"+no).innerHTML=numerator_val;

	var intRate_val=document.getElementById("intRate_text"+no).value;

	document.getElementById("intRate_row"+no).innerHTML=intRate_val;

	var value_val=document.getElementById("value_text"+no).value;

	document.getElementById("value_row"+no).innerHTML=value_val;
	if($("#addrowno").val()=="1"  ){
		modtyp="A";
	
		
		var  groupName_val=document.getElementById("groupName_text"+no).value;	 
		document.getElementById("groupName_row"+no).innerHTML=groupName_val;

		var groupId_val=document.getElementById("groupId_text"+no).value;
		document.getElementById("groupId_row"+no).innerHTML=groupId_val;

		var partyName_val=document.getElementById("partyName_text"+no).value;
		document.getElementById("partyName_row"+no).innerHTML=partyName_val;

		var uniqueId_val=document.getElementById("uniqueId_text"+no).value;
			document.getElementById("uniqueId_row"+no).innerHTML=uniqueId_val;
			

		var typeofParty_val=document.getElementById("typeofParty_text"+no).value;	
		document.getElementById("typeofParty_row"+no).innerHTML=typeofParty_val;

		var  relationship_val=document.getElementById("relationship_text"+no).value;	 
		document.getElementById("relationship_row"+no).innerHTML=relationship_val;

		var  purpose_val=document.getElementById("purpose_text"+no).value;	 
		document.getElementById("purpose_row"+no).innerHTML=purpose_val;

		var  approvalDate_val=document.getElementById("approvalDate_text"+no).value;	 
		document.getElementById("approvalDate_row"+no).innerHTML=approvalDate_val;

		var  originalCurrency_val=document.getElementById("originalCurrency_text"+no).value;	 
		document.getElementById("originalCurrency_row"+no).innerHTML=originalCurrency_val;



		var noofarrears_val=document.getElementById("noofarrears_text"+no).value;	
		document.getElementById("noofarrears_row"+no).innerHTML=noofarrears_val; 

		var  remainingMaturityDays_val=document.getElementById("remainingMaturityDays_text"+no).value;	 
		document.getElementById("remainingMaturityDays_row"+no).innerHTML=remainingMaturityDays_val;

		var collateralType_val=document.getElementById("collateralType_text"+no).value;	 
		document.getElementById("collateralType_row"+no).innerHTML=collateralType_val;

		var  collateralDesc_val=document.getElementById("collateralDesc_text"+no).value;	 
		document.getElementById("collateralDesc_row"+no).innerHTML=collateralDesc_val;

		var  lastValuationDate_val=document.getElementById("lastValuationDate_text"+no).value;	 
		document.getElementById("lastValuationDate_row"+no).innerHTML=lastValuationDate_val;

		var reportDate_val=document.getElementById("reportDate_text"+no).value;	
		document.getElementById("reportDate_row"+no).innerHTML=reportDate_val;


		  
	
	}else{
		document.getElementById("Cancel_button"+no).style.display="inline-block";
		document.getElementById("Cancel_btn"+no).style.display="none";
	}
	
	document.getElementById("edit_button"+no).style.display="inline-block";
	document.getElementById("save_button"+no).style.display="none";


	var groupName=document.getElementById("groupName_row"+no).innerHTML;	 
	var groupId=document.getElementById("groupId_row"+no).innerHTML;
	var partyName=document.getElementById("partyName_row"+no).innerHTML;
	var uniqueId=document.getElementById("uniqueId_row"+no).innerHTML;
	var typeofParty=document.getElementById("typeofParty_row"+no).innerHTML;
	var relationship=document.getElementById("relationship_row"+no).innerHTML;	
	var purpose=document.getElementById("purpose_row"+no).innerHTML;
	var approvalDate=document.getElementById("approvalDate_row"+no).innerHTML;	 
	var originalCurrency=document.getElementById("originalCurrency_row"+no).innerHTML;
	 

	var sancamtcurfb=document.getElementById("sancamtcurfb_row"+no).innerHTML;
	var sancamtcurnfb=document.getElementById("sancamtcurnfb_row"+no).innerHTML;
	var outamtcurfb=document.getElementById("outamtcurfb_row"+no).innerHTML;
	var outamtcurnfb=document.getElementById("outamtcurnfb_row"+no).innerHTML;
	var numerator=document.getElementById("numerator_row"+no).innerHTML;	
	var noofarrears=document.getElementById("noofarrears_row"+no).innerHTML;	 
	var intRate=document.getElementById("intRate_row"+no).innerHTML;
	var remainingMaturityDays=document.getElementById("remainingMaturityDays_row"+no).innerHTML;
	var collateralType=document.getElementById("collateralType_row"+no).innerHTML;
	var collateralDesc=document.getElementById("collateralDesc_row"+no).innerHTML;
	var lastValuationDate=document.getElementById("lastValuationDate_row"+no).innerHTML;	
	var value=document.getElementById("value_row"+no).innerHTML;
	var reportDate=document.getElementById("reportDate_row"+no).innerHTML;	 
	 

	  $("#supadd"+no).addClass("rowaddedd");
	
	var refeSUP400=document.getElementById("refDisplay").value;
	 sancamtcurfb=sancamtcurfb.replace(/\,/g,'');
	 sancamtcurfb=Number(sancamtcurfb);

	 sancamtcurnfb=sancamtcurnfb.replace(/\,/g,'');
	 sancamtcurnfb=Number(sancamtcurnfb);


	 outamtcurfb=outamtcurfb.replace(/\,/g,'');
	 outamtcurfb=Number(outamtcurfb);



	 outamtcurnfb=outamtcurnfb.replace(/\,/g,'');
	 outamtcurnfb=Number(outamtcurnfb);

	 numerator=numerator.replace(/\,/g,'');
	 numerator=Number(numerator);


	 intRate=intRate.replace(/\,/g,'');
	 intRate=Number(intRate);

	 value=value.replace(/\,/g,'');
	 value=Number(value);
	

	 var rptdate1 = {
	 		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeSUP400,"groupName":groupName,"groupId":groupId,"partyName":partyName,"uniqueId":uniqueId,"typeofParty":typeofParty,"relationship":relationship,"purpose":purpose,"approvalDate":approvalDate,"originalCurrency":originalCurrency,"sancamtcurfb":sancamtcurfb,"sancamtcurnfb":sancamtcurnfb,"outamtcurfb":outamtcurfb,"outamtcurnfb":outamtcurnfb,"numerator":numerator,"noofarrears":noofarrears,"intRate":intRate,"remainingMaturityDays":remainingMaturityDays,"collateralType":collateralType,"collateralDesc":collateralDesc,"lastValuationDate":lastValuationDate,"value":value,"reportDate":reportDate,"modtyp":modtyp  
	 		}; 

	 $.ajax({
	    url : "SUP0400",
	     data : rptdate1  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 console.log(res.refno);
				
				
				
				 $("#refDisplay").val(res.refno);
				
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
	//alert(""+Integer.ParseInteger(no));
	
/* 	var	noo= parseInt(no)-1;
 */
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

	        	var groupName=document.getElementById("groupName_row"+no).innerHTML;	 
	        	var groupId=document.getElementById("groupId_row"+no).innerHTML;
	        	var partyName=document.getElementById("partyName_row"+no).innerHTML;
	        	var uniqueId=document.getElementById("uniqueId_row"+no).innerHTML;
	        	var typeofParty=document.getElementById("typeofParty_row"+no).innerHTML;
	        	var relationship=document.getElementById("relationship_row"+no).innerHTML;	
	        	var purpose=document.getElementById("purpose_row"+no).innerHTML;
	        	var approvalDate=document.getElementById("approvalDate_row"+no).innerHTML;	 
	        	var originalCurrency=document.getElementById("originalCurrency_row"+no).innerHTML;
	        	 

	        	var sancamtcurfb=document.getElementById("sancamtcurfb_row"+no).innerHTML;
	        	var sancamtcurnfb=document.getElementById("sancamtcurnfb_row"+no).innerHTML;
	        	var outamtcurfb=document.getElementById("outamtcurfb_row"+no).innerHTML;
	        	var outamtcurnfb=document.getElementById("outamtcurnfb_row"+no).innerHTML;
	        	var numerator=document.getElementById("numerator_row"+no).innerHTML;	
	        	var noofarrears=document.getElementById("noofarrears_row"+no).innerHTML;	 
	        	var intRate=document.getElementById("intRate_row"+no).innerHTML;
	        	var remainingMaturityDays=document.getElementById("remainingMaturityDays_row"+no).innerHTML;
	        	var collateralType=document.getElementById("collateralType_row"+no).innerHTML;
	        	var collateralDesc=document.getElementById("collateralDesc_row"+no).innerHTML;
	        	var lastValuationDate=document.getElementById("lastValuationDate_row"+no).innerHTML;	
	        	var value=document.getElementById("value_row"+no).innerHTML;
	        	var reportDate=document.getElementById("reportDate_row"+no).innerHTML;	  
	        	var refeSUP400=document.getElementById("refDisplay").value;
	       	 sancamtcurfb=sancamtcurfb.replace(/\,/g,'');
	       	 sancamtcurfb=Number(sancamtcurfb);

	       	 sancamtcurnfb=sancamtcurnfb.replace(/\,/g,'');
	       	 sancamtcurnfb=Number(sancamtcurnfb);


	       	 outamtcurfb=outamtcurfb.replace(/\,/g,'');
	       	 outamtcurfb=Number(outamtcurfb);



	       	 outamtcurnfb=outamtcurnfb.replace(/\,/g,'');
	       	 outamtcurnfb=Number(outamtcurnfb);

	       	 numerator=numerator.replace(/\,/g,'');
	       	 numerator=Number(numerator);


	       	 intRate=intRate.replace(/\,/g,'');
	       	 intRate=Number(intRate);

	       	 value=value.replace(/\,/g,'');
	       	 value=Number(value);
	        	var rptdate1 = {
	   	 		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeSUP400,"groupName":groupName,"groupId":groupId,"partyName":partyName,"uniqueId":uniqueId,"typeofParty":typeofParty,"relationship":relationship,"purpose":purpose,"approvalDate":approvalDate,"originalCurrency":originalCurrency,"sancamtcurfb":sancamtcurfb,"sancamtcurnfb":sancamtcurnfb,"outamtcurfb":outamtcurfb,"outamtcurnfb":outamtcurnfb,"numerator":numerator,"noofarrears":noofarrears,"intRate":intRate,"remainingMaturityDays":remainingMaturityDays,"collateralType":collateralType,"collateralDesc":collateralDesc,"lastValuationDate":lastValuationDate,"value":value,"reportDate":reportDate,"modtyp":modtyp  
	   			}; 
	        	
	        	 $.ajax({
	        	     url : "SUP0400",
	        	     data : rptdate1  ,
	        			dataType : 'json', 
	        			type : 'POST',
	        			async : true,
	        			 success : function(res) {
	        				 console.log(res.refno);
	        				//	alert("refeDCG100"+refeDCG100);
	        				
	        				// alert("sfsdf");
	        				 $("#refDisplay").val(res.refno);
	        				
			  
	        				 $("#supadd"+no).closest("tr").remove();

			   
	        				
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
			"groupName":$("#groupName_row"+no).text(),"groupId":$("#groupId_row"+no).text(),"reportDate":$("#reportDate_row"+no).text()
	};

	 $.ajax({
	     url : "SUP0400cancel",
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

 var sancamtcurfb_val=document.getElementById("sancamtcurfb_text"+no).value;

 document.getElementById("sancamtcurfb_row"+no).innerHTML=sancamtcurfb_val;

 var sancamtcurnfb_val=document.getElementById("sancamtcurnfb_text"+no).value;

 document.getElementById("sancamtcurnfb_row"+no).innerHTML=sancamtcurnfb_val;


 var outamtcurfb_val=document.getElementById("outamtcurfb_text"+no).value;

 document.getElementById("outamtcurfb_row"+no).innerHTML=outamtcurfb_val;

 var outamtcurnfb_val=document.getElementById("outamtcurnfb_text"+no).value;

 document.getElementById("outamtcurnfb_row"+no).innerHTML=outamtcurnfb_val;



 var numerator_val=document.getElementById("numerator_text"+no).value;

 document.getElementById("numerator_row"+no).innerHTML=numerator_val;

 var intRate_val=document.getElementById("intRate_text"+no).value;

 document.getElementById("intRate_row"+no).innerHTML=intRate_val;

 var value_val=document.getElementById("value_text"+no).value;

 document.getElementById("value_row"+no).innerHTML=value_val;
	
		$("#edit_button"+no).show();
		/* document.getElementById("edit_button"+no).style.display="block"; */
		document.getElementById("save_button"+no).style.display="none";
		document.getElementById("Cancel_btn"+no).style.display="none";
		 location.reload(true);
		 
		  var sancamtcurfb=document.getElementById("sancamtcurfb_row"+no).innerHTML;
		  var sancamtcurnfb=document.getElementById("sancamtcurnfb_row"+no).innerHTML;
		  var outamtcurfb=document.getElementById("outamtcurfb_row"+no).innerHTML;
		  var outamtcurnfb=document.getElementById("outamtcurnfb_row"+no).innerHTML;
		  var numerator=document.getElementById("numerator_row"+no).innerHTML;
		  var intRate=document.getElementById("intRate_row"+no).innerHTML;
		  var value=document.getElementById("value_row"+no).innerHTML;
		  
		  if($("#supadd"+no).hasClass( "rowaddedd" )){
			  
			  document.getElementById("Cancel_button"+no).style.display="inline-block";


		  }else{
			  document.getElementById("Cancel_button"+no).style.display="none";
		  }
		  
		
 }

 
 function Canadd_row(no){
	 
	  /* document.getElementById("del_button"+no).style.display="inline-block"; */

																   

	 if($("#supadd"+no).hasClass( "rowaddedd" )){
		
		var detcancel={
				"groupName":$("#groupName_row"+no).text(),"groupId":$("#groupId_row"+no).text(),"reportDate":$("#reportDate_row"+no).text()
		};
		

		 $.ajax({
		     url : "SUP0400cancel",
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
	 $("#supadd"+no).remove();
	 
 }
</script> 




<SCRIPT>

function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_SUP0400.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>

<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="SUP0400Form"
		enctype="multipart/form-data">
		
		<input type="hidden" id="fnloadval">
		<input type="hidden" id="savecheck">
		 <input type="hidden" id="modflg">
		 <input type="hidden" id="modtyp">
		 <input type="hidden"  value="1" id="rownoadd">
             	<div class="tab-content" >
	 	<div class="active psc0105"  id="tab2" style="width: 904px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>SUP0400-Statement of Related Party Transactions<b id="sub"
					Style="display: none"></b></b></font>
			</div> 
		<ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">




             <li class=" pull-right list" onclick="functionli(3);"><a href="#tab3" data-toggle="tab"><span
							class="headingtab">3</span></a></li>
					<li class=" pull-right list" onclick="functionli(2);"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" onclick="functionli(1);" ><a href="#tab1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>




				</ul>
					<table class="" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"><!--  <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font> -->
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></originalCurrency></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab" id="sumfrst"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
			
      
				   <table class="table" id="tb4" style="width:100%;display:none;margin-top:-20px;">
            <tr>
          <th rowspan="2"></th>
          <th rowspan="2"></th>
          <th colspan="1">Amount</th>
          <th colspan="1">%</th><th rowspan="3" style="text-align:center">Select</th>
          </tr>
           <tr>
           
          
          <th>A</th>
            <th>B</th>
           
          
      
     
          
          </tr>
          
           <tbody class="databody" id="sec1"></tbody>
          
          
          </table>
				
		
				   <table class="table" id="tb2" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="15" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>Details of Related Party</b>  </td></tr>
            <tr><th rowspan="2" style="text-align:center">Related Party Sr.No.</th>
           <th colspan="1" style="text-align:center" >Name of Group to Which Related Party belongs
</th><th colspan="1" style="text-align:center" >BOM Group Identifier</th><th colspan="1" style="text-align:center" >Related Party Name</th>
          <th colspan="1" style="text-align:center" >Unique Identifier of Related Party </th><th rowspan="2" style="text-align:center">Select</th>
          
          </tr>
          
          
          <tr> <th style="text-align:center">C</th> <th style="text-align:center">D</th><th style="text-align:center">E</th><th style="text-align:center">F</th></tr>
           
             <tbody class="databody" id="sec2"></tbody>
          </table>
				
			
            <table class="table" id="tb3" style="width:100%;display:none;margin-top:-20px;">
            <tr><th rowspan="5" style="text-align:center">Dynamic Domain</th>
          </tr>
        
        
        
         
        
          <tr>
          <th rowspan="4" style="text-align:center">Related Party Sr.No.</th>
          <th rowspan="4" style="text-align:center">Transaction Sr.No.</th>
          
          <th colspan="1" rowspan="3" style="text-align:center">Name of Group to Which Related Party belongs</th>
          <th colspan="1" rowspan="3" style="text-align:center">BOM Group Identifier</th>
          <th colspan="1"  rowspan="3" style="text-align:center">Related Party Name</th>
          <th colspan="1" rowspan="3" style="text-align:center">Unique Identifier of Realted Party </th>
          <th colspan="1" rowspan="3" style="text-align:center">Type of Related Party </th>
          <th colspan="1" rowspan="3" style="text-align:center">Relationship of Related Party with Reporting Institution</th>
          <th colspan="1" rowspan="3" style="text-align:center">Purpose of Transaction</th>
          <th colspan="1" rowspan="3" style="text-align:center">Date of Approval by Bank </th>
          <th colspan="1" rowspan="3" style="text-align:center">Original Currency </th>
          
           <th colspan="3" style="text-align:center">Amount Approved by Bank</th>
             <th colspan="3" style="text-align:center">Amount Outstanding </th> 
         <th colspan="1"  rowspan="3" style="text-align:center">Numerator Value for computation of percentage of exposure to Tier 1 Capital</th>
          
          <th colspan="1" rowspan="3" style="text-align:center">% of Tier 1 Capital</th>
          <th colspan="1" rowspan="3" style="text-align:center">No. of Days in arrears</th>
           <th colspan="6" style="text-align:center">Terms and Condition</th><th rowspan="4" style="text-align:center">Select</th></tr>
           <tr>
          
     
         
          <th  colspan="1" rowspan="2" style="text-align:center">Amount approved by bank (in original currency)</th>
          <th  colspan="1" rowspan="2" style="text-align:center">Fund-based (in reporting currency)</th> 
          <th  colspan="1" rowspan="2" style="text-align:center">Non-fund based (in reporting currency)</th>
       <th colspan="1" rowspan="2" style="text-align:center">Amount outstanding (in original currency)</th> 
          <th colspan="1" rowspan="2" style="text-align:center">Fund-based (in reporting currency) </th>
         <th colspan="1"  rowspan="2" style="text-align:center">Non-fund based (in reporting currency)</th> 
           <th colspan="1" rowspan="2" style="text-align:center">Rate of Interest(%)</th>
          <th colspan="1"  rowspan="2" style="text-align:center">Remaining term to maturity(days)</th>
           <th colspan="4" rowspan="1" style="text-align:center">Collateral-1</th>
           
         
          
          
        
         
          </tr>
           <tr>
          
         
         <th   colspan="1" style="text-align:center">Type of collateral</th>
           
         <th  colspan="1" style="text-align:center">Description of collateral</th>
          <th   colspan="1" style="text-align:center">Last valuation date</th>
         <th   colspan="1" style="text-align:center">Value as per last valuation date </th>
        </tr>
          
         
           <tr>
           <th  style="text-align:center">G</th>
          <th style="text-align:center">H</th> 
          <th style="text-align:center">I</th>
          <th style="text-align:center">J</th>
           <th style="text-align:center">K</th>
           <th style="text-align:center">L</th>
           
           <th style="text-align:center">M</th>
           <th style="text-align:center">N</th>
            <th style="text-align:center">O</th> 
            
            <th style="text-align:center">P</th>
          <th style="text-align:center">Q</th>
          <th style="text-align:center">R</th>
          <th style="text-align:center">S</th>
          <th style="text-align:center">T</th>
          <th style="text-align:center">U</th>
          
          
      
          <th style="text-align:center">V</th>
          <th style="text-align:center">W</th>
          <th style="text-align:center">X</th>
  
         
       
           <th style="text-align:center">Y</th>
          <th style="text-align:center">Z</th>
          
         
      
          
          <th style="text-align:center">AA</th>
          <th style="text-align:center">AB</th>
          <th style="text-align:center">AC</th>
          <th style="text-align:center">AD</th></tr> 
          
          
          
         
        
         <!-- <th style="text-align:center">Type of collateral</th><th style="text-align:center">Description of collateral</th> <th style="text-align:center">Last valuation date</th><th style="text-align:center">Value as per last valuation date </th><th style="text-align:center">Type of collateral</th><th style="text-align:center">Description of collateral</th> <th style="text-align:center">Last valuation date</th><th style="text-align:center">Value as per last valuation date </th><th style="text-align:center">Type of collateral</th><th style="text-align:center">Description of collateral</th> <th style="text-align:center">Last valuation date</th><th style="text-align:center">Value as per last valuation date </th><th style="text-align:center">Type of collateral</th><th style="text-align:center">Description of collateral</th> <th style="text-align:center">Last valuation date</th><th style="text-align:center">Value as per last valuation date </th><th style="text-align:center">Type of collateral</th><th style="text-align:center">Description of collateral</th> <th style="text-align:center">Last valuation date</th><th style="text-align:center">Value as per last valuation date </th>
         <th style="text-align:center">Type of collateral</th><th style="text-align:center">Description of collateral</th> <th style="text-align:center">Last valuation date</th><th style="text-align:center">Value as per last valuation date </th><th style="text-align:center">Type of collateral</th><th style="text-align:center">Description of collateral</th> <th style="text-align:center">Last valuation date</th><th style="text-align:center">Value as per last valuation date </th> --></tr>
         
         
         
          
          
         
             <tbody class="databody" id="sec3"></tbody>
          </table>
          
          
               
          
            <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
      <!-- <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button> -->
    
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
      <!--  <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button> -->
      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div>
          
            </div>
           
            
          
          <!-- DETAIL TABLE -->
          
          <input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			<div class="active" id="tab1" style="width: 4275px;padding-top: 1px;margin-top: -17px;display:none" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>SUP0400-Statement of Related Party Transactions<b id="sub"
					Style="display: none"></b></b></font>
			</div> <br>
			<div id="divLoading"> 
    </div>
           <table class="table" style="width: 4275px;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> <!-- <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font> -->
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></input></font></td><td style="text-align:center;background-color: #bbc3cb;width: 600px;"></td><td style="background-color: #bbc3cb;text-align:right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a>
                    <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></td></tr>
          		  </table>
         <div class="panel panel-primary filterable">
            
           
            <table class="table" id="tbcate" border="1" style="width:100%;   margin-top: -20px;">
            
             <thead>
					 <tr class="filters">
					 
						<th  style="width:136px;text-align:center;"><textarea style="width:136px;text-align:center;"type="text" id="grpname" onkeyup="myFunction(this.id,0)" class="form-control2" placeholder="Group Name" disabled></textarea></th>
						<th  style="width:46px;text-align:center;"><textarea style="width:46px;text-align:center;"type="text" id="grpid" onkeyup="myFunction(this.id,1)" class="form-control2" placeholder="Group Id" disabled></textarea></th>
						<th style="width:137px;text-align:center;"><textarea type="text"style="width:137px;text-align:center;"id="prtyname" class="form-control2" onkeyup="myFunction(this.id,2)" placeholder="Party Name" disabled></textarea></th>
						
						<th  style="width:55px;text-align:center;"><textarea style="width:55px;text-align:center;" type="text" id="uqid"  onkeyup="myFunction(this.id,3)" class="form-control2" placeholder="Unique Id" disabled></textarea></th>						
						<th style="width:176px;text-align:center;"><textarea type="text"style="width:176px;text-align:center;" class="form-control2" id="typarty" onkeyup="myFunction(this.id,4)" placeholder="Type of Party" disabled></textarea></th>
						<th style="width:1000px;text-align:center;"><textarea type="text" style="width:1000px;text-align:center;" class="form-control2" id="retnsp" onkeyup="myFunction(this.id,5)" placeholder="Relationship" disabled></textarea></th>
						<th style="width:129px;text-align:center;"><textarea type="text" style="width:129px;text-align:center;"class="form-control2" id="prps" onkeyup="myFunction(this.id,6)" placeholder="Purpose" disabled></textarea></th>
						<th style="width:65px;text-align:center;"><textarea type="text" style="width:65px;text-align:center;" class="form-control2" id="appdte" onkeyup="myFunction(this.id,7)" placeholder="Approval Date" disabled></textarea></th>
						<th style="width:55px;text-align:center;"><textarea type="text" style="width:55px;text-align:center;" class="form-control2" id="orgcurncy" onkeyup="myFunction(this.id,8)" placeholder="Original Currency" disabled></textarea></th>
		  	 		    <th style="width:109px;text-align:center;"><textarea type="text" style="width:109px;text-align:center;" class="form-control2" id="funba" onkeyup="myFunction(this.id,9)" placeholder="Fund based(Amount account currency)" disabled></textarea></th>
			     		<th  style="width:149px;text-align:center;"><textarea type="text" style="width:149px;text-align:center;" class="form-control2" id="nonfunba" onkeyup="myFunction(this.id,10)" placeholder="Non Fund based(Amount account currency" disabled></textarea></th>
						<th  style="width:149px;text-align:center;"><textarea type="text"  style="width:149px;text-align:center;" class="form-control2" id="funbaout" onkeyup="myFunction(this.id,11)" placeholder="Fund based(Outstanding amount account currency)" disabled></textarea></th>
						<th style="width:149px;text-align:center;" ><textarea type="text"  style="width:149px;text-align:center;" class="form-control2" id="nonfunbaout" onkeyup="myFunction(this.id,12)" placeholder="Non fund based(Outstanding amount account)" disabled></textarea></th>
		
						<th style="width:100px;text-align:center;"><textarea type="text" style="width:100px;text-align:center;" class="form-control2" id="numrtr" onkeyup="myFunction(this.id,13)" placeholder="Numerator" disabled></textarea></th>
						<th style="width:67px;text-align:center;"><textarea type="text" style="width:67px;text-align:center;" class="form-control2" id="noarrdays" onkeyup="myFunction(this.id,14)" placeholder="No of Arrear Days" disabled></textarea></th>
						<th style="width:60px;text-align:center;"><textarea type="text" style="width:60px;text-align:center;" class="form-control2" id="insdate" onkeyup="myFunction(this.id,15)" placeholder="Interest Rate" disabled></textarea></th>
						<th style="width:71px;text-align:center;"><textarea type="text" style="width:71px;text-align:center;" class="form-control2" id="remmturtydays" onkeyup="myFunction(this.id,16)" placeholder="Remaining Maturity Days" disabled></textarea></th>
						<th style="width:150px;text-align:center;"><textarea type="text" style="width:150px;text-align:center;" class="form-control2" id="cltrltype" onkeyup="myFunction(this.id,17)" placeholder="Collateral Type" disabled></textarea></th>
						<th style="width:150px;text-align:center;"><textarea type="text" style="width:150px;text-align:center;" class="form-control2" id="cltrldesc" onkeyup="myFunction(this.id,18)" placeholder="Collateral Description" disabled></textarea></th>
						<th style="width:74px;text-align:center;"><textarea type="text" style="width:74px;text-align:center;" class="form-control2" id="lstvldt" onkeyup="myFunction(this.id,19)" placeholder="Last Valuation Date" disabled></textarea></th>
						<th style="width:92px;text-align:center;"><textarea type="text" style="width:92px;text-align:center;" class="form-control2" id="val" onkeyup="myFunction(this.id,20)" placeholder="Value" disabled></textarea></th>
						<th style="width:73px;text-align:center;"><textarea type="text" style="width:73px;text-align:center;"class="form-control2" id="repdate" onkeyup="myFunction(this.id,21)" placeholder="Report Date" disabled></textarea></th>
						<th style="width:136px;text-align:center;" id="modify">Modify</th>
						
					</tr>
					
				</thead>
					
					

<tbody class="databody" id="pymdets">
 


              </tbody>
   
        
				</table> 
			
				</div>
				
				
				 <br>
  <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary btnhome" >Home</button>
      <!--<button type="button" class="btn btn-xs btn-primary" onclick="funli(1);"  value="back" id="btnpre1">Previous</button>
    
                
       <button type="button" class="btn btn-xs btn-primary" onclick="funli(1);"  value="back" id="btnnext1">Next</button>-->
      <button type="button" class="btn btn-xs btn-primary btnback" value="back" >Back</button>
      
      
      </div> 
			  </div>	
				
				
            </div>

    
    
    
    
    
       <!-- -------------------------------dialog box start---------------------->
    <div id="dialog-confirm" title="Alert" style="display:none">
  <p><span class="glyphicon glyphicon-alert" style="float:left; margin:0px 12px 20px 0;"></span><font id="msg"></font></p>
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
		 <div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
			<div class="ui-dialog-buttonset">
				<button type="button" class="ui-button ui-corner-all ui-widget">OK</button>
			
				<button type="button" class="ui-button ui-corner-all ui-widget">CLOSE</button>
			</div>
			</div> 
	</div>

<!-- -------------------------------dialog box end ---------------------->
    
    
    
     </form>
    
    
</div>





</body>
</html>