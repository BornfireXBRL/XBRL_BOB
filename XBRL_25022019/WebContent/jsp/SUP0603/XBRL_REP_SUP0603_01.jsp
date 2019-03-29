<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLSUP0603Bean,dao.XBRLSUP0603Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
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
 
 XBRLSUP0603Dao dmd=new XBRLSUP0603Dao();
 
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
 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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

.databody td{
border:1px solid #ddd;
}

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

.clr{
color: #0c0b0b;
    background-color: #f5f5f5;
    border-color: #f5f5f5;
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



.databody td{
border:1px solid #ddd;
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
 .ui-dialog-titlebar-close {
    visibility: hidden;
}
.hidden {
  display: none;
}

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
	var save=0;
	$("#tb1").show();
	$("#btnSave").hide();
	$("#btnXML").hide();
	 if(z=="load"){
		//FOR DETAILS
		$(".det").addClass("clr");
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
		
		// $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "SUP0603details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				
					
					  $("#sup3dets tr").remove();
					 
					
					var b=JSON.parse(res.detSUP0603);
					
					 console.log(b);
					
			
						 	if(f=="onload"){
						 		$("#tab2").hide();
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 			 $("#sup3dets").append("<tr id='sup3add"+srno+"'><td id='acctNum_row"+srno+"'>"+b[i].acctNum+"</td><td id='acctName_row"+srno+"'>"+b[i].acctName+"</td><td id='custId_row"+srno+"'>"+b[i].custId+"</td><td id='schmCode_row"+srno+"' >"+b[i].schmCode+"</td><td id='schmType_row"+srno+"' >"+b[i].schmType+"</td><td id='acctopenDate_row"+srno+"'>"+b[i].acctopenDate+"</td><td id='intRate_row"+srno+"' class='sumder'>"+b[i].intRate+"</td><td id='acctBalanceamtac_row"+srno+"' class='sumder'>"+b[i].acctBalanceamtac+"</td><td id='acctCrncyCode_row"+srno+"'>"+b[i].acctCrncyCode+"</td><td id='isicCode_row"+srno+"'>"+b[i].isicCode+"</td><td id='natureofCust_row"+srno+"' >"+b[i].natureofCust+"</td><td id='nreFlg_row"+srno+"'>"+b[i].nreFlg+"</td><td id='country_row"+srno+"'>"+b[i].country+"</td><td id='bomGroupIdentifier_row"+srno+"'>"+b[i].bomGroupIdentifier+"</td><td id='custUniqueIdentifier_row"+srno+"'>"+b[i].custUniqueIdentifier+"</td><td id='loanAmt_row"+srno+"' class='sumder'>"+b[i].loanAmt+"</td><td id='specProv_row"+srno+"' class='sumder'>"+b[i].specProv+"</td><td id='badDrwroff_row"+srno+"' class='sumder'>"+b[i].badDrwroff+"</td><td id='dprCntr_row"+srno+"'>"+b[i].dprCntr+"</td><td id='impairedFlg_row"+srno+"'>"+b[i].impairedFlg+"</td><td id='secAmt_row"+srno+"' class='sumder'>"+b[i].secAmt+"</td><td id='purposeofLoan_row"+srno+"'>"+b[i].purposeofLoan+"</td><td id='smeFlg_row"+srno+"'>"+b[i].smeFlg+"</td><td id='nonFundBasedFacilities_row"+srno+"'>"+b[i].nonFundBasedFacilities+"</td><td id='resdt_row"+srno+"'>"+b[i].resdt+"</td><td id='resflg_row"+srno+"'>"+b[i].resflg+"</td><td id='noofres_row"+srno+"'>"+b[i].nofres+"</td><td id='reportDate_row"+srno+"'>"+b[i].reportDate+"</td><td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none; ' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')></td></tr>") ;  

							 		 

								
								 srno++;
								 
								
									}
								// $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 		$("#tab2").hide();
						 		$("#modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
						 			$("#sup3dets").append("<tr ><td id='acctNum_row"+srno+"'>"+b[i].acctNum+"</td><td id='acctName_row"+srno+"'>"+b[i].acctName+"</td><td id='custId_row"+srno+"'>"+b[i].custId+"</td><td id='schmCode_row' >"+b[i].schmCode+"</td><td id='schmType_row"+srno+"' >"+b[i].schmType+"</td><td id='acctopenDate_row"+srno+"'>"+b[i].acctopenDate+"</td><td id='intRate_row"+srno+"' class='sumder'>"+b[i].intRate+"</td><td id='acctBalanceamtac_row"+srno+"' class='sumder'>"+b[i].acctBalanceamtac+"</td><td id='acctCrncyCode_row"+srno+"'>"+b[i].acctCrncyCode+"</td><td id='isicCode_row"+srno+"'>"+b[i].isicCode+"</td><td id='natureofCust_row"+srno+"' >"+b[i].natureofCust+"</td><td id='nreFlg_row"+srno+"'>"+b[i].nreFlg+"</td><td id='country_row"+srno+"'>"+b[i].country+"</td><td id='bomGroupIdentifier_row"+srno+"'>"+b[i].bomGroupIdentifier+"</td><td id='custUniqueIdentifier_row"+srno+"'>"+b[i].custUniqueIdentifier+"</td><td id='loanAmt_row"+srno+"' class='sumder'>"+b[i].loanAmt+"</td><td id='specProv_row"+srno+"' class='sumder'>"+b[i].specProv+"</td><td id='badDrwroff_row"+srno+"' class='sumder'>"+b[i].badDrwroff+"</td><td id='dprCntr_row"+srno+"'>"+b[i].dprCntr+"</td><td id='impairedFlg_row"+srno+"'>"+b[i].impairedFlg+"</td><td id='secAmt_row"+srno+"' class='sumder'>"+b[i].secAmt+"</td><td id='purposeofLoan_row"+srno+"'>"+b[i].purposeofLoan+"</td><td id='smeFlg_row"+srno+"'>"+b[i].smeFlg+"</td><td id='nonFundBasedFacilities_row"+srno+"'>"+b[i].nonFundBasedFacilities+"</td><td id='resdt_row"+srno+"'>"+b[i].resdt+"</td><td id='resflg_row"+srno+"'>"+b[i].resflg+"</td><td id='nofres_row"+srno+"'>"+b[i].nofres+"</td><td id='reportDate_row"+srno+"'>"+b[i].reportDate+"</td></tr>") ;  
																	
						 			srno++;
								
								
									}
						 		// $("#divLoading").removeClass('show');
						 	}
							
							
						// $("#divLoading").removeClass('show'); 
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
				
		
				 $(".repdisp").val(refno);
				 
					
						$("#sec1 tr").children().detach().remove();
						
						 var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "sup0603sec1",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec1 tr").remove();
								 
								
								var b=JSON.parse(res.sec1SUP0603);
								 console.log(b);
								
                                 
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec1").append("<tr><td id='instanceName"+srno+"'>"+b[i].instanceName+"</td><td id='instanceCode"+srno+"'>"+b[i].instanceCode+"</td><td id='totOutstanding' class='sumder'>"+b[i].totOutstanding+"</td><td class='b190totOut' id='outbal"+srno+"'>"+b[i].b190totOut+"</td><td id='b190impamts"+srno+"' class='sumder'>"+b[i].b190impamts+"</td><td id='b190specprov"+srno+"' class='sumder'>"+b[i].b190specprov+"</td><td id='b191to180totOut"+srno+"' class='sumder'>"+b[i].b191to180totOut+"</td><td id='b191to180impamts"+srno+"' class='sumder'>"+b[i].b191to180impamts+"</td><td id='b191to180specprov"+srno+"' class='sumder'>"+b[i].b191to180specprov+"</td><td id='b181to360totOut"+srno+"' class='sumder'>"+b[i].b181to360totOut+"</td><td id='b181to360impamts"+srno+"' class='sumder'>"+b[i].b181to360impamts+"</td><td id='b181to360specprov"+srno+"' class='sumder'>"+b[i].b181to360specprov+"</td><td id='Gto360totOut"+srno+"' class='sumder'>"+b[i].Gto360totOut+"</td><td id='Gto360impamts"+srno+"' class='sumder'>"+b[i].Gto360impamts+"</td><td id='Gto360specprov"+srno+"' class='sumder'>"+b[i].Gto360specprov+"</td><td id='othertotOutstanding"+srno+"' class='sumder'>"+b[i].othertotOutstanding+"</td><td id='othertotOutstanding"+srno+"' class='sumder'>"+b[i].otherImpairedAmt+"</td><td id='otherSpecProv"+srno+"' class='sumder'>"+b[i].otherSpecProv+"</td><td id='totArrears"+srno+"' class='sumder'>"+b[i].totArrears+"</td><td id='totImpairedAmt"+srno+"' class='sumder'>"+b[i].totImpairedAmt+"</td><td id='totSpecProv"+srno+"' class='sumder'>"+b[i].totSpecProv+"</td><td id='colval"+srno+"' class='sumder'>"+b[i].colval+"</td><td id='totnonfunfact"+srno+"' class='sumder'>"+b[i].totnonfunfact+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads(0) id='edit"+srno+"'></td></tr>");  
									 		  
									 		 
											
											 srno++;
											 
											
												}
								
									}
									

						});   	
						
						
							 var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "sup0603sec2",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec2 tr").remove();
								 
								
								var b=JSON.parse(res.sec2SUP0603);
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 			 $("#sec2").append("<tr><td id='slno"+srno+"'>"+b[i].slno+"</td><td id='custname"+srno+"'>"+b[i].custname+"</td><td id='namofcoun"+srno+"'>"+b[i].namofcoun+"</td><td id='bomgroup"+srno+"'>"+b[i].bomgroup+"</td><td id='resstatus"+srno+"'>"+b[i].resstatus+"</td><td id='natureofCus"+srno+"'>"+b[i].natureofCus+"</td><td id='out' class='sumder'>"+b[i].totOutstanding+"</td><td id='outbal"+srno+"'>"+b[i].b190totOut+"</td><td id='intrate"+srno+"' class='sumder'>"+b[i].b190impamts+"</td><td id='accopndate"+srno+"' class='sumder'>"+b[i].b190specprov+"</td><td id='recvddate"+srno+"' class='sumder'>"+b[i].b191to180totOut+"</td><td id='appdate"+srno+"' class='sumder'>"+b[i].b191to180impamts+"</td><td id='rejctddate"+srno+"' class='sumder'>"+b[i].b191to180specprov+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].b181to360totOut+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].b181to360impamts+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].b181to360specprov+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].Gto360totOut+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].Gto360impamts+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].Gto360specprov+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].othertotOutstanding+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].otherImpairedAmt+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].otherSpecProv+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].totArrears+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].totImpairedAmt+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].totSpecProv+"</td><td id='colval"+srno+"' class='sumder'>"+b[i].colval+"</td><td id='totnonfunfact"+srno+"' class='sumder'>"+b[i].totnonfunfact+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads(0) id='edit"+srno+"'></td></tr>");  
									 		  
									 		 
											
											 srno++;
											 
											
												}
							
									}
									

						});   
						
						
						/* 	var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "sup0603sec3",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec3 tr").remove();
								 
								
								var b=JSON.parse(res.sec3SUP0603);
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec3").append("<tr><td id='refCode3"+srno+"'>"+b[i].refCode3+"</td><td id='instanceCode"+srno+"'>"+b[i].instanceCode+"</td><td id='value"+srno+"' class='sumder'>"+b[i].value+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads(0) id='edit"+srno+"'></td></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
								
									}
									

						});    */
						
						
							
							
							
					}
	 var datasum={
				"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>'
		};
	 

	 $.ajax({
			url:"savechecks3",
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
	 

</SCRIPT>
<script>
$(document).ready(function(){
	
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');
	var det={
			"repdate":'<%=dt2%>',"type":"chckmodified"
		};
		$.ajax({
			url:"SUP0603chckmodified",
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
					        	location.href = "XBRL_CRT_SUP0603_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
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
function myFunction(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("sup3dets");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==0 ||b==5 || b==6 || b==7 ||b==15 || b==16 || b==17 ||b==18 || b==20 || b==24 || b==27){
		
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
$("#tb1").show();

	
	
	
	
	$( ".btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
	
	$( '.btnback').click(function() {
		 location.href="XBRL_CRT_SUP0603_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	
$("#btnfilter").on("click",function(){
		
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
			 $('#acctNum,#acctName,#custId,#schmCode,#schmType,#acctopenDate,#intRate,#acctBalanceamtac,#acctCrncyCode,#isicCode,#natureofCust,#nreFlg,#country,#bomGroupIdentifier,#custUniqueIdentifier,#loanAmt,#specProv,#badDrwroff,#dprCntr,#impairedFlg,#secAmt,#purposeofLoan,#smeFlg,#nonFundBasedFacilities,#resdt,#resflg,#noofres,#reportDate').css({
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
			
		    $('#acctNum,#acctName,#custId,#schmCode,#schmType,#acctopenDate,#intRate,#acctBalanceamtac,#acctCrncyCode,#isicCode,#natureofCust,#nreFlg,#country,#bomGroupIdentifier,#custUniqueIdentifier,#loanAmt,#specProv,#badDrwroff,#dprCntr,#impairedFlg,#secAmt,#purposeofLoan,#smeFlg,#nonFundBasedFacilities,#resdt,#resflg,#noofres,#reportDate').css({
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
				 table = document.getElementById("sup3dets");
				 tr = table.getElementsByTagName("tr");
				 for (i = 0; i < tr.length; i++) {
					 
						 
						 tr[i].style.display = ""; 
						 
				 
					 
				 }
				
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
	$("#btnSave").hide();
	$("#btnXML").hide();

	$("#btnpre").prop("disabled",true);
	 $("#btnnext").prop("disabled",false);
	 $("#li1").addClass("active");
	 $("#li2").removeClass("active");
}else{
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
		
		location.href = "XBRL_REP_SUP0603_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_SUP0603_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	
	
	$('#btnExcel').click(function() {
		
		 SUP0603Form.action = "SUP0603EXCELREPORT.action?method=SUP0603EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 SUP0603Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 SUP0603Form.action = "SUP0603EXCELSum.action?method=SUP0603EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 SUP0603Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 SUP0603Form.action = "SUP0603PDFREPORT.action?method=SUP0603PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 SUP0603Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  SUP0603Form.action = "XMLDOWNLOADs3.action?method=sup6xml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 SUP0603Form.submit(); 
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
	 					url:"saveSums3",
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
	 				   			url:"saveSums3",
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
	$("#sup3dets").prepend("<tr id='sup3add"+rowno+"'><td id='acctNum_row"+rowno+"'><input type='text' id='acctNum_text"+rowno+"' style='width: 100px;'></td><td id='acctName_row"+rowno+"'><input type='text'  id='acctName_text"+rowno+"'style='width: 250px;'></td><td id='custId_row"+rowno+"'><input type='text' id='custId_text"+rowno+"' style='width:70px;'></td><td id='schmCode_row"+rowno+"'><input type='text' 	id='schmCode_text"+rowno+"' style='    width: 52px;'></td><td id='schmType_row"+rowno+"'><input type='text' id='schmType_text"+rowno+"' style='width:52px;'></td><td id='acctopenDate_row"+rowno+"' ><input type='text'  id='acctopenDate_text"+rowno+"'    style='width: 70px;'></td><td class='sumder alnum' id='intRate_row"+rowno+"'><input type='text'  id='intRate_text"+rowno+"' class='decimalPt roundUp' style='width: 60px;'></td><td class='sumder alnum' id='acctBalanceamtac_row"+rowno+"'><input type='text'  id='acctBalanceamtac_text"+rowno+"' class='decimalPt roundUp' style='width:80px;'></td><td id='acctCrncyCode_row"+rowno+"'><input type='text' id='acctCrncyCode_text"+rowno+"' style='width: 50px;'></td><td  id='isicCode_row"+rowno+"'><input  type='text' id='isicCode_text"+rowno+"' style='width: 60px;'></td><td  id='natureofCust_row"+rowno+"'><input  type='text' id='natureofCust_text"+rowno+"' style='width: 70px;'></td><td id='nreFlg_row"+rowno+"'><input type='text' id='nreFlg_text"+rowno+"' style='width: 60px;'></td><td id='country_row"+rowno+"'><input type='text' id='country_text"+rowno+"' style='width: 60px;'></td><td id='bomGroupIdentifier_row"+rowno+"'><input type='text' id='bomGroupIdentifier_text"+rowno+"' style='width:100px;'></td><td id='custUniqueIdentifier_row"+rowno+"'><input type='text' id='custUniqueIdentifier_text"+rowno+"' style='width:80px;'></td><td class='sumder alnum' id='loanAmt_row"+rowno+"'><input type='text'  id='loanAmt_text"+rowno+"' class='decimalPt roundUp' style='width:80px;'></td><td class='sumder alnum' id='specProv_row"+rowno+"'><input type='text'  id='specProv_text"+rowno+"' class='decimalPt roundUp' style='width: 80px;'></td><td class='sumder alnum' id='badDrwroff_row"+rowno+"'><input type='text'  id='badDrwroff_text"+rowno+"' class='decimalPt roundUp' style='width: 80px;'></td><td class='sumder alnum' id='dprCntr_row"+rowno+"'><input class='decimalPt roundUp' type='text' id='dprCntr_text"+rowno+"' style='width: 60px;'></td><td id='impairedFlg_row"+rowno+"'><input type='text' id='impairedFlg_text"+rowno+"' style='width:60px;'></td><td class='sumder alnum' id='secAmt_row"+rowno+"'><input  type='text' id='secAmt_text"+rowno+"' class='decimalPt roundUp' style='width:80px;'></td><td id='purposeofLoan_row"+rowno+"'><input type='text'  id='purposeofLoan_text"+rowno+"' style='    width:100px;'></td><td id='smeFlg_row"+rowno+"'><input type='text' id='smeFlg_text"+rowno+"' style='width:60px;'></td><td id='nonFundBasedFacilities_row"+rowno+"'><input type='text' 	id='nonFundBasedFacilities_text"+rowno+"' style='    width: 80px;'></td><td id='resdt_row"+rowno+"'><input type='text' id='resdt_text"+rowno+"' style='width: 100px;'></td><td id='resflg_row"+rowno+"' ><input type='text'  id='resflg_text"+rowno+"'    style='width: 80px;'></td><td id='noofres_row"+rowno+"' ><input type='text'  id='noofres_text"+rowno+"'    style='width: 60px;'></td><td id='reportDate_row"+rowno+"'><input type='text' id='reportDate_text"+rowno+"' style='width:70px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");
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
		});


	});


	
});	




function fnkeyup(a){
	$("#acctopenDate_text"+a).datepicker({
	dateFormat: "dd-mm-yy",
	        changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: "today"
	});


	$("#resdt_text"+a).datepicker({
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

	
var	intRate =  document.getElementById("intRate_row"+no);
var	intRate_data = intRate.innerHTML;


var	acctBalanceamtac =  document.getElementById("acctBalanceamtac_row"+no);

var	acctBalanceamtac_data = acctBalanceamtac.innerHTML;	 	


var	loanAmt =  document.getElementById("loanAmt_row"+no);
var	loanAmt_data = loanAmt.innerHTML; 
	


var	specProv =  document.getElementById("specProv_row"+no);
var	specProv_data = specProv.innerHTML; 



var	badDrwroff =  document.getElementById("badDrwroff_row"+no);
var	badDrwroff_data = badDrwroff.innerHTML; 



var	secAmt =  document.getElementById("secAmt_row"+no);
var	secAmt_data = secAmt.innerHTML; 



intRate.innerHTML="<input type='text' class='decimalPt roundUp'  id='intRate_text"+no+"'  style='width: 53px'; value='"+intRate_data+"'>";

acctBalanceamtac.innerHTML="<input type='text' class='decimalPt roundUp' id='acctBalanceamtac_text"+no+"' style='width: 83px'; value='"+acctBalanceamtac_data+"'>";

loanAmt.innerHTML="<input type='text' class='decimalPt roundUp' id='loanAmt_text"+no+"' style='width: 83px'; value='"+loanAmt_data+"'>";

specProv.innerHTML="<input type='text' class='decimalPt roundUp' id='specProv_text"+no+"' style='width:53px'; value='"+specProv_data+"'>";

badDrwroff.innerHTML="<input type='text' class='decimalPt roundUp' id='badDrwroff_text"+no+"' style='width: 73px'; value='"+badDrwroff_data+"'>"; 

secAmt.innerHTML="<input type='text' class='decimalPt roundUp' id='secAmt_text"+no+"' style='width: 73px'; value='"+secAmt_data+"'>"; 


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
		
		
		if(document.getElementById("intRate_text"+no).value==""){
			alert("Enter Interest Rate ..");
			error="Y"
		}else if(document.getElementById("acctBalanceamtac_text"+no).value==""){
			alert("Enter No of coins ..");
			error="Y"
		}else if(document.getElementById("loanAmt_text"+no).value==""){
			alert("Enter Type of coin ..");	
			error="Y"
		}else if(document.getElementById("specProv_text"+no).value==""){
			alert("Enter No of coins ..");
			error="Y"
		}else if(document.getElementById("secAmt_text"+no).value==""){
			alert("Enter No of coins ..");
			error="Y"
		}
		
	} else if (modtyp=="A") {
		

		if(document.getElementById("acctNum_text"+no).value==""){
			alert("Enter Account Number ..");
			error="Y"
		}else if(document.getElementById("acctName_text"+no).value==""){
			alert("Enter Account Name ..");	
			error="Y"
		}else if(document.getElementById("custId_text"+no).value==""){
			alert("Enter Customer Id ..");
			error="Y"
		}else if(document.getElementById("schmCode_text"+no).value==""){
			alert("Enter Scheme Code..");	
			error="Y"
		}else if(document.getElementById("schmType_text"+no).value==""){
			alert("Enter Scheme Type ..");
			error="Y"
		}else if(document.getElementById("acctopenDate_text"+no).value==""){
			alert("Enter Account Open Date..");	
			error="Y"
		}else if(document.getElementById("intRate_text"+no).value==""){
			alert("Enter Interest Rate ..");
			error="Y"
		}else if(document.getElementById("acctBalanceamtac_text"+no).value==""){
			alert("Enter Account Balance Amount ..");
			error="Y"
		}else if(document.getElementById("acctCrncyCode_text"+no).value==""){
			alert("Enter Account Currency Code ..");	
			error="Y"
		}else if(document.getElementById("isicCode_text"+no).value==""){
			alert("Enter ISIC code ..");
			error="Y"
		}else if(document.getElementById("natureofCust_text"+no).value==""){
			alert("Enter Nature of Customer ..");
			error="Y"
		}else if(document.getElementById("nreFlg_text"+no).value==""){
			alert("Enter NRE Flag ..");	
			error="Y"
		}else if(document.getElementById("country_text"+no).value==""){
			alert("Enter Country ..");
			error="Y"
		}else if(document.getElementById("bomGroupIdentifier_text"+no).value==""){
			alert("Enter BOM Group Identifier ..");
			error="Y"
		}else if(document.getElementById("custUniqueIdentifier_text"+no).value==""){
			alert("Enter Customer Unique Identifier ..");	
			error="Y"
		}else if(document.getElementById("loanAmt_text"+no).value==""){
			alert("Enter Loan Amount..");
			error="Y"
		}else if(document.getElementById("specProv_text"+no).value==""){
			alert("Enter Specific Provision ..");
			error="Y"
		}else if(document.getElementById("badDrwroff_text"+no).value==""){
			alert("Enter Return of Amount ..");
			error="Y"
		}else if(document.getElementById("dprCntr_text"+no).value==""){
			alert("Enter DPR Counter..");	
			error="Y"
		}else if(document.getElementById("impairedFlg_text"+no).value==""){
			alert("Enter Impaired Flag ..");
			error="Y"
		}else if(document.getElementById("secAmt_text"+no).value==""){
			alert("Enter Sec Amount..");
			error="Y"
		}else if(document.getElementById("purposeofLoan_text"+no).value==""){
			alert("Enter Purpose of Loan ..");	
			error="Y"
		}else if(document.getElementById("smeFlg_text"+no).value==""){
			alert("Enter SME Flag ..");
			error="Y"
		}else if(document.getElementById("nonFundBasedFacilities_text"+no).value==""){
			alert("Enter Non Fund Based Facilities ..");
			error="Y"
		}else if(document.getElementById("resdt_text"+no).value==""){
			alert("Enter Rescheduled Date ..");	
			error="Y"
		}else if(document.getElementById("resflg_text"+no).value==""){
			alert("Enter Restructured flag ..");
			error="Y"
		}else if(document.getElementById("noofres_text"+no).value==""){
			alert("Enter No of Restructure ..");
			error="Y"
		}else if(document.getElementById("reportDate_text"+no).value==""){
			alert("Enter Report Date..");
			error="Y"
		}
	}
	
	

	
	if (error=="N"){
	
	$("#modflg").val("Y");
	modtyp="M";
	document.getElementById("edit_button"+no).checked = false;

	  

var intRate_val=document.getElementById("intRate_text"+no).value;

document.getElementById("intRate_row"+no).innerHTML=intRate_val;

var acctBalanceamtac_val=document.getElementById("acctBalanceamtac_text"+no).value;

document.getElementById("acctBalanceamtac_row"+no).innerHTML=acctBalanceamtac_val;


var loanAmt_val=document.getElementById("loanAmt_text"+no).value;

document.getElementById("loanAmt_row"+no).innerHTML=loanAmt_val;

var specProv_val=document.getElementById("specProv_text"+no).value;

document.getElementById("specProv_row"+no).innerHTML=specProv_val;



var badDrwroff_val=document.getElementById("badDrwroff_text"+no).value;

document.getElementById("badDrwroff_row"+no).innerHTML=badDrwroff_val;

var secAmt_val=document.getElementById("secAmt_text"+no).value;

document.getElementById("secAmt_row"+no).innerHTML=secAmt_val;



if($("#addrowno").val()=="1"){

	modtyp="A";

	
var  acctNum_val=document.getElementById("acctNum_text"+no).value;	 
document.getElementById("acctNum_row"+no).innerHTML=acctNum_val;



var acctName_val=document.getElementById("acctName_text"+no).value;
document.getElementById("acctName_row"+no).innerHTML=acctName_val;



var custId_val=document.getElementById("custId_text"+no).value;
document.getElementById("custId_row"+no).innerHTML=custId_val;


var schmCode_val=document.getElementById("schmCode_text"+no).value;
	document.getElementById("schmCode_row"+no).innerHTML=schmCode_val;
	

	
	
var schmType_val=document.getElementById("schmType_text"+no).value;	
document.getElementById("schmType_row"+no).innerHTML=schmType_val;



var  acctopenDate_val=document.getElementById("acctopenDate_text"+no).value;	 
document.getElementById("acctopenDate_row"+no).innerHTML=acctopenDate_val;



var  acctCrncyCode_val=document.getElementById("acctCrncyCode_text"+no).value;	 
document.getElementById("acctCrncyCode_row"+no).innerHTML=acctCrncyCode_val;


var  isicCode_val=document.getElementById("isicCode_text"+no).value;	 
document.getElementById("isicCode_row"+no).innerHTML=isicCode_val;



var  natureofCust_val=document.getElementById("natureofCust_text"+no).value;	 
document.getElementById("natureofCust_row"+no).innerHTML=natureofCust_val;





var nreFlg_val=document.getElementById("nreFlg_text"+no).value;	
document.getElementById("nreFlg_row"+no).innerHTML=nreFlg_val; 



var  country_val=document.getElementById("country_text"+no).value;	 
document.getElementById("country_row"+no).innerHTML=country_val;



var  bomGroupIdentifier_val=document.getElementById("bomGroupIdentifier_text"+no).value;	 
document.getElementById("bomGroupIdentifier_row"+no).innerHTML=bomGroupIdentifier_val;



var  custUniqueIdentifier_val=document.getElementById("custUniqueIdentifier_text"+no).value;	 
document.getElementById("custUniqueIdentifier_row"+no).innerHTML=custUniqueIdentifier_val;



var  dprCntr_val=document.getElementById("dprCntr_text"+no).value;	 
document.getElementById("dprCntr_row"+no).innerHTML=dprCntr_val;


var  impairedFlg_val=document.getElementById("impairedFlg_text"+no).value;	 
document.getElementById("impairedFlg_row"+no).innerHTML=impairedFlg_val;

var  purposeofLoan_val=document.getElementById("purposeofLoan_text"+no).value;	 
document.getElementById("purposeofLoan_row"+no).innerHTML=purposeofLoan_val;



var  smeFlg_val=document.getElementById("smeFlg_text"+no).value;	 
document.getElementById("smeFlg_row"+no).innerHTML=smeFlg_val;

var  nonFundBasedFacilities_val=document.getElementById("nonFundBasedFacilities_text"+no).value;	 
document.getElementById("nonFundBasedFacilities_row"+no).innerHTML=nonFundBasedFacilities_val;


var  resdt_val=document.getElementById("resdt_text"+no).value;	 
document.getElementById("resdt_row"+no).innerHTML=resdt_val;

var  resflg_val=document.getElementById("resflg_text"+no).value;	 
document.getElementById("resflg_row"+no).innerHTML=resflg_val;

var noofres_val=document.getElementById("noofres_text"+no).value;	 
document.getElementById("noofres_row"+no).innerHTML=noofres_val;

var reportDate_val=document.getElementById("reportDate_text"+no).value;	
document.getElementById("reportDate_row"+no).innerHTML=reportDate_val;



}else{
	document.getElementById("Cancel_button"+no).style.display="inline-block";
	document.getElementById("Cancel_btn"+no).style.display="none";
}

document.getElementById("edit_button"+no).style.display="inline-block";
document.getElementById("save_button"+no).style.display="none";



var acctNum=document.getElementById("acctNum_row"+no).innerHTML;	 

var acctName=document.getElementById("acctName_row"+no).innerHTML;


var custId=document.getElementById("custId_row"+no).innerHTML;

var schmCode=document.getElementById("schmCode_row"+no).innerHTML;


var schmType=document.getElementById("schmType_row"+no).innerHTML;


var acctopenDate=document.getElementById("acctopenDate_row"+no).innerHTML;

var intRate=document.getElementById("intRate_row"+no).innerHTML;

var acctBalanceamtac=document.getElementById("acctBalanceamtac_row"+no).innerHTML;

var acctCrncyCode=document.getElementById("acctCrncyCode_row"+no).innerHTML;

var isicCode=document.getElementById("isicCode_row"+no).innerHTML;	 
var natureofCust=document.getElementById("natureofCust_row"+no).innerHTML;

var nreFlg=document.getElementById("nreFlg_row"+no).innerHTML;	

var country=document.getElementById("country_row"+no).innerHTML;



var bomGroupIdentifier=document.getElementById("bomGroupIdentifier_row"+no).innerHTML;

var custUniqueIdentifier=document.getElementById("custUniqueIdentifier_row"+no).innerHTML;

var loanAmt=document.getElementById("loanAmt_row"+no).innerHTML;

var specProv=document.getElementById("specProv_row"+no).innerHTML;

var badDrwroff=document.getElementById("badDrwroff_row"+no).innerHTML;

var dprCntr=document.getElementById("dprCntr_row"+no).innerHTML;

var impairedFlg=document.getElementById("impairedFlg_row"+no).innerHTML;

var secAmt=document.getElementById("secAmt_row"+no).innerHTML;

var purposeofLoan=document.getElementById("purposeofLoan_row"+no).innerHTML;

var smeFlg=document.getElementById("smeFlg_row"+no).innerHTML;

var nonFundBasedFacilities=document.getElementById("nonFundBasedFacilities_row"+no).innerHTML;

var resdt=document.getElementById("resdt_row"+no).innerHTML;

var resflg=document.getElementById("resflg_row"+no).innerHTML;

var noofres=document.getElementById("noofres_row"+no).innerHTML;

var reportDate=document.getElementById("reportDate_row"+no).innerHTML;	 


$("#sup3add"+no).addClass("rowaddedd");

$("#det1 td").attr("padding","8px");
var refeSUP603=document.getElementById("refDisplay").value;

acctBalanceamtac=acctBalanceamtac.replace(/\,/g,'');
acctBalanceamtac=Number(acctBalanceamtac);


loanAmt=loanAmt.replace(/\,/g,'');
loanAmt=Number(loanAmt);




specProv=specProv.replace(/\,/g,'');
specProv=Number(specProv);

badDrwroff=badDrwroff.replace(/\,/g,'');
badDrwroff=Number(badDrwroff);


secAmt=secAmt.replace(/\,/g,'');
secAmt=Number(secAmt);



var rptdate1 = {
		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeSUP603,"acctNum":acctNum,"acctName":acctName,"custId":custId,"schmCode":schmCode,"schmType":schmType,"acctopenDate":acctopenDate,"intRate":intRate,"acctBalanceamtac":acctBalanceamtac,"acctCrncyCode":acctCrncyCode,"isicCode":isicCode,"natureofCust":natureofCust,"nreFlg":nreFlg,"country":country,"bomGroupIdentifier":bomGroupIdentifier,"custUniqueIdentifier":custUniqueIdentifier,"loanAmt":loanAmt,"specProv":specProv,"badDrwroff":badDrwroff,"dprCntr":dprCntr,"impairedFlg":impairedFlg,"secAmt":secAmt,"purposeofLoan":purposeofLoan,"smeFlg":smeFlg,"nonFundBasedFacilities":nonFundBasedFacilities,"resdt":resdt,"resflg":resflg,"noofres":noofres,"reportDate":reportDate,"modtyp":modtyp  
		}; 

$.ajax({
   url : "SUP0603",
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
	        	
	        	
	        	var acctNum=document.getElementById("acctNum_row"+no).innerHTML;	 

	        	var acctName=document.getElementById("acctName_row"+no).innerHTML;
	        	var custId=document.getElementById("custId_row"+no).innerHTML;

	        	var schmCode=document.getElementById("schmCode_row"+no).innerHTML;

	        	var schmType=document.getElementById("schmType_row"+no).innerHTML;

	        	var acctopenDate=document.getElementById("acctopenDate_row"+no).innerHTML;
	        	var intRate=document.getElementById("intRate_row"+no).innerHTML;
	        	var acctBalanceamtac=document.getElementById("acctBalanceamtac_row"+no).innerHTML;
	        	var acctCrncyCode=document.getElementById("acctCrncyCode_row"+no).innerHTML;
	        	var isicCode=document.getElementById("isicCode_row"+no).innerHTML;	 
	        	var natureofCust=document.getElementById("natureofCust_row"+no).innerHTML;
	        	var nreFlg=document.getElementById("nreFlg_row"+no).innerHTML;	 
	        	var country=document.getElementById("country_row"+no).innerHTML;



	        	var bomGroupIdentifier=document.getElementById("bomGroupIdentifier_row"+no).innerHTML;
	        	var custUniqueIdentifier=document.getElementById("custUniqueIdentifier_row"+no).innerHTML;
	        	var loanAmt=document.getElementById("loanAmt_row"+no).innerHTML;
	        	var specProv=document.getElementById("specProv_row"+no).innerHTML;
	        	var badDrwroff=document.getElementById("badDrwroff_row"+no).innerHTML;	
	        	var dprCntr=document.getElementById("dprCntr_row"+no).innerHTML;	
	        	var impairedFlg=document.getElementById("impairedFlg_row"+no).innerHTML;
	        	var secAmt=document.getElementById("secAmt_row"+no).innerHTML;

	        	var purposeofLoan=document.getElementById("purposeofLoan_row"+no).innerHTML;
	        	var smeFlg=document.getElementById("smeFlg_row"+no).innerHTML;
	        	var nonFundBasedFacilities=document.getElementById("nonFundBasedFacilities_row"+no).innerHTML;
	        	var resdt=document.getElementById("resdt_row"+no).innerHTML;
	        	var resflg=document.getElementById("resflg_row"+no).innerHTML;
	        	var noofres=document.getElementById("noofres_row"+no).innerHTML;
	        	var reportDate=document.getElementById("reportDate_row"+no).innerHTML;	 



	        	$("#det1 td").attr("padding","8px");
	        	var refeSUP603=document.getElementById("refDisplay").value;

	        	acctBalanceamtac=acctBalanceamtac.replace(/\,/g,'');
	        	acctBalanceamtac=Number(acctBalanceamtac);


	        	loanAmt=loanAmt.replace(/\,/g,'');
	        	loanAmt=Number(loanAmt);




	        	specProv=specProv.replace(/\,/g,'');
	        	specProv=Number(specProv);

	        	badDrwroff=badDrwroff.replace(/\,/g,'');
	        	badDrwroff=Number(badDrwroff);


	        	secAmt=secAmt.replace(/\,/g,'');
	        	secAmt=Number(secAmt);


	        	var rptdate1 = {
	        			     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeSUP603,"acctNum":acctNum,"acctName":acctName,"custId":custId,"schmCode":schmCode,"schmType":schmType,"acctopenDate":acctopenDate,"intRate":intRate,"acctBalanceamtac":acctBalanceamtac,"acctCrncyCode":acctCrncyCode,"isicCode":isicCode,"natureofCust":natureofCust,"nreFlg":nreFlg,"country":country,"bomGroupIdentifier":bomGroupIdentifier,"custUniqueIdentifier":custUniqueIdentifier,"loanAmt":loanAmt,"specProv":specProv,"badDrwroff":badDrwroff,"dprCntr":dprCntr,"impairedFlg":impairedFlg,"secAmt":secAmt,"purposeofLoan":purposeofLoan,"smeFlg":smeFlg,"nonFundBasedFacilities":nonFundBasedFacilities,"resdt":resdt,"resflg":resflg,"noofres":noofres,"reportDate":reportDate,"modtyp":modtyp  
	        			}; 

	        	$.ajax({
	        	   url : "SUP0603",
	        	   data : rptdate1  ,
	        			dataType : 'json', 
	        			type : 'POST',
	        			async : true,
	        			 success : function(res) {
	        				
	        				 $("#refDisplay").val(res.refno);
		   
			  
	        				 $("#sup3add"+no).closest("tr").remove();

			   
	        				
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
			"acctNum":$("#acctNum_row"+no).text(),"custId":$("#custId_row"+no).text(),"reportDate":'<%=dt2%>'
	};

	 $.ajax({
	     url : "SUP0603cancel",
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
 	
 var intRate_val=document.getElementById("intRate_text"+no).value;

 document.getElementById("intRate_row"+no).innerHTML=intRate_val;

 var acctBalanceamtac_val=document.getElementById("acctBalanceamtac_text"+no).value;

 document.getElementById("acctBalanceamtac_row"+no).innerHTML=acctBalanceamtac_val;


 var loanAmt_val=document.getElementById("loanAmt_text"+no).value;

 document.getElementById("loanAmt_row"+no).innerHTML=loanAmt_val;

 var specProv_val=document.getElementById("specProv_text"+no).value;

 document.getElementById("specProv_row"+no).innerHTML=specProv_val;



 var badDrwroff_val=document.getElementById("badDrwroff_text"+no).value;

 document.getElementById("badDrwroff_row"+no).innerHTML=badDrwroff_val;

 var secAmt_val=document.getElementById("secAmt_text"+no).value;

 document.getElementById("secAmt_row"+no).innerHTML=secAmt_val;

		$("#edit_button"+no).show();
		/* document.getElementById("edit_button"+no).style.display="block"; */
		document.getElementById("save_button"+no).style.display="none";
		document.getElementById("Cancel_btn"+no).style.display="none";
		 location.reload(true); 
		 var intRate=document.getElementById("intRate_row"+no).innerHTML;
		 var acctBalanceamtac=document.getElementById("acctBalanceamtac_row"+no).innerHTML;
		 var loanAmt=document.getElementById("loanAmt_row"+no).innerHTML;
     	var specProv=document.getElementById("specProv_row"+no).innerHTML;
     	var badDrwroff=document.getElementById("badDrwroff_row"+no).innerHTML;	
		 var secAmt=document.getElementById("secAmt_row"+no).innerHTML;

		 
		 if($("#sup3add"+no).hasClass( "rowaddedd" )){
			  
			  document.getElementById("Cancel_button"+no).style.display="inline-block";


		  }else{
			  document.getElementById("Cancel_button"+no).style.display="none";
		  }
		  
		
 }

 
 function Canadd_row(no){
	 
	  /* document.getElementById("del_button"+no).style.display="inline-block"; */

																   

	 if($("#sup3add"+no).hasClass( "rowaddedd" )){
		
		var detcancel={
				"acctNum":$("#acctNum_row"+no).text(),"custId":$("#custId_row"+no).text(),"reportDate":'<%=dt2%>'
		};
		

		 $.ajax({
		     url : "SUP0603cancel",
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
	 $("#sup3add"+no).remove();
	 
 }
</script> 

<SCRIPT>

function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_SUP0603.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>

<body>


<div class="container" style="width:1518px" >
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="SUP0603Form"
		enctype="multipart/form-data">
             	<div class="tab-content" >
             	
             	 <input type="hidden" id="modflg" >
   <input type="hidden" id="modtyp" >
    <input type="hidden" id="savecheck" >
   
	 	<div class="active psc0105" id="tab2" style="width: 2161px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>SUP0603-Detailed List of Credit in Arrears and Impaired in excess of Rs. 100,000 equivalent<b id="sub"
					Style="display: none"></b></b></font>
			</div> 
		<ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">




  
					<li class=" pull-right list" onclick="functionli(2);"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" onclick="functionli(1);" ><a href="#tab1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>




				</ul>
					<table class="" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <font size="1">
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab " id="sumfrst">Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
		
			
            <table class="table" id="tb2" style="width:100%;display:none;margin-top:-20px;">
           <tr>
          
            <th rowspan="4"  colspan="1" style="text-align:center">Sr.No.</th>
            <th rowspan="3"  colspan="1" style="text-align:center">Name of Customer</th>
            <th rowspan="3"  colspan="1" style="text-align:center">Name of Country</th>
            <th rowspan="3"  colspan="1" style="text-align:center">BOM Group Identifier (where applicable)</th>
            <th rowspan="3"  colspan="1" style="text-align:center">Residential Status of Customer</th>
            <th rowspan="3"  colspan="1" style="text-align:center">ISIC Code/Household/Institutional Sector</th>
             <th rowspan="3" style="text-align:center">Total Outstanding Credit Facilities</th>
             <th rowspan="1"  colspan="12" style="text-align:center">No. of days in arrears</th>
     
         <th rowspan="2"  colspan="3" style="text-align:center">Accounts Impaired for other Reasons	</th>
          <th rowspan="3" colspan="1" style="text-align:center">Total Amount in arrears</th>
           <th rowspan="3" colspan="1" style="text-align:center">Total Amount Classified as Impaired</th>
           <th rowspan="3" colspan="1" style="text-align:center">Total Specific Provisions</th>
           <th rowspan="3" colspan="1" style="text-align:center">Value of Collateral (Including Cash)</th>
           <th rowspan="3" colspan="1" style="text-align:center">Total Non Fund Based Facilities</th>
           <th rowspan="4" style="text-align:center">Select</th>
         </tr>
            <tr>
           
                <th colspan="3" style="text-align:center">1-90 days</th>
           <th colspan="3" style="text-align:center">91-180 days</th>
           <th colspan="3" style="text-align:center">181-360 days</th>
           <th colspan="3" style="text-align:center">>360 days</th>
          
          </tr>
           <tr>
        
            <th colspan="1" style="text-align:center">Amount in arrears</th>
           <th colspan="1" style="text-align:center">Amount Classified as Impaired</th>
           <th colspan="1" style="text-align:center">Specific Provisions</th>
         <th colspan="1" style="text-align:center">Amount in arrears</th>
           <th colspan="1" style="text-align:center">Amount Classified as Impaired</th>
           <th colspan="1" style="text-align:center">Specific Provisions</th>
              <th colspan="1" style="text-align:center">Amount in arrears</th>
           <th colspan="1" style="text-align:center">Amount Classified as Impaired</th>
           <th colspan="1" style="text-align:center">Specific Provisions</th>
              <th colspan="1" style="text-align:center">Amount in arrears</th>
           <th colspan="1" style="text-align:center">Amount Classified as Impaired</th>
           <th colspan="1" style="text-align:center">Specific Provisions</th>
            <th colspan="1" style="text-align:center">Amount in arrears</th>
           <th colspan="1" style="text-align:center">Amount Classified as Impaired</th>
           <th colspan="1" style="text-align:center">Specific Provisions</th>
           
           
         </tr>
         
         <tr>
          
         
          <th style="text-align:center">V</th>
          <th style="text-align:center">W</th> 
          <th style="text-align:center">X</th>
          <th style="text-align:center">Y</th>
          <th style="text-align:center">Z</th>
          <th style="text-align:center">AA</th> 
          <th style="text-align:center">AB</th>
          <th style="text-align:center">AC</th>
          <th style="text-align:center">AD</th>
          <th style="text-align:center">AE</th>
          <th style="text-align:center">AF</th>
          <th style="text-align:center">AG</th>
          <th style="text-align:center">AH</th>
          <th style="text-align:center">AI</th>
          <th style="text-align:center">AJ</th>
          <th style="text-align:center">AK</th>
          <th style="text-align:center">AL</th>
           <th style="text-align:center">AM</th>
          <th style="text-align:center">AN</th> 
           <th style="text-align:center">AO</th>
          <th style="text-align:center">AP</th> 
           <th style="text-align:center">AQ</th>
          <th style="text-align:center">AR</th> 
           <th style="text-align:center">AS</th>
          <th style="text-align:center">AT</th> 
          <th style="text-align:center">AU</th> 
          </tr>
          <tr>
         
          
          </tr>
             <tbody class="databody" id="sec2"></tbody>
          </table>
          
          
               <table class="table" id="tb1" style="width:100%;display:none;margin-top:-20px;">											
			
          <tr><th rowspan="3"    style="text-align:center">Particulars</th>
         
          <th rowspan="4"  colspan="1" style="text-align:center"></th>
          <th rowspan="3" style="text-align:center">Total Outstanding Credit Facilities</th>
          <th rowspan="1"  colspan="12" style="text-align:center">No. of days in arrears</th>
     
         <th rowspan="2"  colspan="3" style="text-align:center">Accounts Impaired for other Reasons	</th>
         
           <th rowspan="3" colspan="1" style="text-align:center">Total Amount in arrears</th>
           <th rowspan="3" colspan="1" style="text-align:center">Total Amount Classified as Impaired</th>
           <th rowspan="3" colspan="1" style="text-align:center">Total Specific Provisions</th>
           <th rowspan="3" colspan="1" style="text-align:center">Value of Collateral (Including Cash)</th>
           <th rowspan="3" colspan="1" style="text-align:center">Total Non Fund Based Facilities</th>
           <th rowspan="4" style="text-align:center">Select</th>
          
          
          </tr>
            <tr>
           
                <th colspan="3" style="text-align:center">1-90 days</th>
           <th colspan="3" style="text-align:center">91-180 days</th>
           <th colspan="3" style="text-align:center">181-360 days</th>
           <th colspan="3" style="text-align:center">>360 days</th>
          
          </tr>
         
         <tr>
        
            <th colspan="1" style="text-align:center">Amount in arrears</th>
           <th colspan="1" style="text-align:center">Amount Classified as Impaired</th>
           <th colspan="1" style="text-align:center">Specific Provisions</th>
         <th colspan="1" style="text-align:center">Amount in arrears</th>
           <th colspan="1" style="text-align:center">Amount Classified as Impaired</th>
           <th colspan="1" style="text-align:center">Specific Provisions</th>
              <th colspan="1" style="text-align:center">Amount in arrears</th>
           <th colspan="1" style="text-align:center">Amount Classified as Impaired</th>
           <th colspan="1" style="text-align:center">Specific Provisions</th>
              <th colspan="1" style="text-align:center">Amount in arrears</th>
           <th colspan="1" style="text-align:center">Amount Classified as Impaired</th>
           <th colspan="1" style="text-align:center">Specific Provisions</th>
            <th colspan="1" style="text-align:center">Amount in arrears</th>
           <th colspan="1" style="text-align:center">Amount Classified as Impaired</th>
           <th colspan="1" style="text-align:center">Specific Provisions</th>
           
         
           
         </tr>
         
          <tr>
           <th   style="text-align:center">Loans Extended to the Other Nonfinancial Corporations</th>
          <th style="text-align:center">A</th>
          <th style="text-align:center">B</th> 
          <th style="text-align:center">C</th>
          <th style="text-align:center">D</th> 
          <th style="text-align:center">E</th>
          <th style="text-align:center">F</th>
          <th style="text-align:center">G</th>
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
          </tr>
        
          
          
          
          <tr>
         
          
          </tr>   <tbody class="databody" id="sec1"></tbody>
          </table>
          
            <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
     <!--  <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button> -->
    
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
      <!--  <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button> -->
      <button type="button" class="btn btn-xs btn-primary btnback" value="back" id="btnback">Back</button></div>
          
            </div>
            
          
          <!-- DETAIL TABLE -->
          
        <input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			<div class="active" id="tab1" style="width: 2825px;padding-top: 1px;margin-top: -17px;display:none" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>SUP0603-Detailed List of Credit in Arrears and Impaired in excess of Rs. 100,000 equivalent<b id="sub"
					Style="display: none"></b></b></font>
			</div> <br>
			<div id="divLoading"> 
    </div>
           <table class="table" style="width: 2825px;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;">
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width: 600px;"></td><td style="background-color: #bbc3cb;text-align:right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
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
					 
						<th ><textarea type="text" style="width: 100px;" onkeyup="myFunction(this.id,0)" class="form-control2" id="acctNum" placeholder="Account Number" disabled></textarea></th>
						<!-- <th id="chalpha">Cheque Alpha</th>					 -->	
						<th ><textarea type="text" style="width: 250px;" id="acctName" onkeyup="myFunction(this.id,1)" class="form-control2" placeholder="Account Name" disabled></textarea></th>	
						<th ><textarea type="text" style="width: 70px;" id="custId" onkeyup="myFunction(this.id,2)" class="form-control2" placeholder="Customer Id" disabled></textarea></th>						
											
						<th  ><textarea type="text" style="width: 52px;" id="schmCode" onkeyup="myFunction(this.id,3)" class="form-control2" placeholder="Scheme Code" disabled></textarea></th>
						<th ><textarea type="text"  style="width: 52px;" id="schmType" class="form-control2" onkeyup="myFunction(this.id,4)" placeholder="Scheme Type" disabled></textarea></th>
						<!-- <th id="valdate">Value Date</th> -->
						<th  style=""><textarea type="text" style="width: 70px;" id="acctopenDate"  onkeyup="myFunction(this.id,5)" class="form-control2" placeholder="Acct Open Date" disabled></textarea></th>						
						<th ><textarea type="text"  style="width: 60px;" class="form-control2" id="intRate" onkeyup="myFunction(this.id,6)" placeholder="Int Rate" disabled></textarea></th>
						<th ><textarea type="text" style="width: 80px;" class="form-control2" id="acctBalanceamtac" onkeyup="myFunction(this.id,7)" placeholder="Acct Bal Amt Ac" disabled></textarea></th>
						<th ><textarea type="text" style="width: 50px;" class="form-control2" id="acctCrncyCode" onkeyup="myFunction(this.id,8)" placeholder="Acct Crncy Code" disabled></textarea></th>
						<th ><textarea type="text" style="width: 60px;" class="form-control2" id="isicCode" onkeyup="myFunction(this.id,9)" placeholder="ISIC Code" disabled></textarea></th>
						<th ><textarea type="text" style="width: 70px;" class="form-control2" id="natureofCust" onkeyup="myFunction(this.id,10)" placeholder="Nature of Cust" disabled></textarea></th>
						<th ><textarea type="text" style="width: 60px;" class="form-control2" id="nreFlg" onkeyup="myFunction(this.id,11)" placeholder="NRE Flg" disabled></textarea></th>
						<th ><textarea type="text" style="width: 60px;" class="form-control2" id="country" onkeyup="myFunction(this.id,12)" placeholder="Country" disabled></textarea></th>
						<th ><textarea type="text" style="width: 100px;" class="form-control2" id="bomGroupIdentifier" onkeyup="myFunction(this.id,13)" placeholder="BOM Group Identifier" disabled></textarea></th>
						<th ><textarea type="text" style="width: 100px;" class="form-control2" id="custUniqueIdentifier" onkeyup="myFunction(this.id,14)" placeholder="Cust Unique Identifier" disabled></textarea></th>
						<th ><textarea type="text" style="width: 80px;" class="form-control2" id="loanAmt" onkeyup="myFunction(this.id,15)" placeholder="Loan Amount" disabled></textarea></th>
						<th ><textarea type="text" style="width: 80px;" class="form-control2" id="specProv" onkeyup="myFunction(this.id,16)" placeholder="Spec Prov" disabled></textarea></th>
						<th ><textarea type="text" style="width: 80px;" class="form-control2" id="badDrwroff" onkeyup="myFunction(this.id,17)" placeholder="Bad Dr Wr Off" disabled></textarea></th>
						<th ><textarea type="text" style="width: 60px;" class="form-control2" id="dprCntr" onkeyup="myFunction(this.id,18)" placeholder="DPD Cntr" disabled></textarea></th>
						<th ><textarea type="text" style="width: 60px;" class="form-control2" id="impairedFlg" onkeyup="myFunction(this.id,19)" placeholder="Impaired Flg" disabled></textarea></th>
						<th ><textarea type="text" style="width: 80px;" class="form-control2" id="secAmt" onkeyup="myFunction(this.id,20)" placeholder="Sec Amount" disabled></textarea></th>
						<th ><textarea type="text"  style="width: 100px;"class="form-control2" id="purposeofLoan" onkeyup="myFunction(this.id,21)" placeholder="Purpose of Loan" disabled></textarea></th>
						<th ><textarea type="text" style="width: 60px;" class="form-control2" id="smeFlg" onkeyup="myFunction(this.id,22)" placeholder="SME Flg" disabled></textarea></th>
						<th ><textarea type="text"  style="width: 80px;"class="form-control2" id="nonFundBasedFacilities" onkeyup="myFunction(this.id,23)" placeholder="Non Fund Based Facilities" disabled></textarea></th>
						<th ><textarea type="text"  style="width: 100px;"class="form-control2" id="resdt" onkeyup="myFunction(this.id,24)" placeholder="Rescheduled Date" disabled></textarea></th>
						<th ><textarea type="text"  style="width: 80px;"class="form-control2" id="resflg" onkeyup="myFunction(this.id,25)" placeholder="Restructured flag" disabled></textarea></th>
						<th ><textarea type="text"  style="width: 60px;"class="form-control2" id="noofres" onkeyup="myFunction(this.id,26)" placeholder="No of restructure" disabled></textarea></th>
						
						
						<th ><textarea type="text" style="width: 70px;" class="form-control2" id="reportDate" onkeyup="myFunction(this.id,27)" placeholder="Report Date" disabled></textarea></th>
						<th id="modify" style="width: 150px;">Modify</th>
						 
					</tr>
					
					
				</thead>
					
					

                    <tbody class="databody" id="sup3dets">
 


              </tbody>
              
   
        
				</table> 
			
				</div>
				<div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
     
      <button type="button" class="btn btn-xs btn-primary btnback" value="back" id="btnback">Back</button></div> 
			  </div>	
				
				
            </div>

    
    
    
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
 
    
    
    
    
     </form>
    
    
</div>





</body>
</html>