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


<%
	//String RRID = request.getParameter("RRID");

	String rptdate = request.getParameter("rptdate");

	String dt1 = request.getParameter("dt1");
	String dt2 = request.getParameter("dt2");

	String reptype = request.getParameter("reptype");
	String curr = request.getParameter("curr");
	String typo = request.getParameter("typo");
	// String ReporefSeq = request.getParameter("ReporefSeq");
	String types = request.getParameter("types");

	String instno = request.getParameter("instno");
	String ReporefSeq = request.getParameter("ReporefSeq");

	XBRLFIM0100Dao dmd = new XBRLFIM0100Dao();

	DecimalFormat df = new DecimalFormat("##,#0.00");

	// ArrayList<XBRLCRR0100Bean> list=dmd.xbrlcrr100();

	/*  
	 ArrayList<XBRLFIM0100Bean> list=new ArrayList<XBRLFIM0100Bean>();
	
	 if(ReporefSeq != null){ 
	  
	// out.println("IFFF ---------------->>>>>>>>> RR ID Created" + ReporefSeq);
	  list=dmd.xbrlfimRR(dt1,dt2,ReporefSeq);
	   
	  
	} 
	
	 else{
	
	 //out.println("ELSE RR ID Created" + ReporefSeq);
	 //list=dmd.xbrlcrrRR(ReporefSeq);
	 list=dmd.xbrlfim100(dt1,dt2);
	 
	  } */

	/* 	 
		  
		ArrayList<XBRLFIM0100Bean> list1=new ArrayList<XBRLFIM0100Bean>();
		  String ReporefSeqBB = request.getParameter("ReporefSeq");
		  DecimalFormat df1 = new DecimalFormat("0.00"); 
		  if(ReporefSeqBB != null){ 
			  
			 // out.println("IFFF RR ID Created" + ReporefSeq);
			 // list=dmd.xbrlcrrRRBB(ReporefSeq);
			   
			  
		 } 
	
		  else{
				
				// out.println("ELSE RR ID Created" + ReporefSeq);
				 //list=dmd.xbrlcrrRR(ReporefSeq);
				 list1=dmd.xbrlfim100BB(dt1,dt2);
				 
			   }  
	  
		  
		  ArrayList<XBRLFIM0100Bean> list2=new ArrayList<XBRLFIM0100Bean>();
		  String ReporefSeqAC = request.getParameter("ReporefSeqAC");
		  String dt1AC = request.getParameter("dt1AC");
		  String dt2AC = request.getParameter("dt2AC");
		  if(ReporefSeqAC != null){ 
			  
			  
			 // out.println("IFFF AC RR Created" + ReporefSeq);
			 // list=dmd.xbrlcrrRRBB(ReporefSeq);
			  list2=dmd.xbrlfimACRR(dt1AC,dt2AC,ReporefSeqAC);
			  
		 } 
	
		  else{
			
			  
			  
			  
			// out.println("ACCCCCCC" + ReporefSeq);
			 //list=dmd.xbrlcrrRR(ReporefSeq);
			 list2=dmd.xbrlfim100AC(dt1,dt2);
			 
		   }
	*/
%>





<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="refresh"
	content="<%=session.getMaxInactiveInterval()%>;url=../XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" />
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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="../../CSS/bootstrap-datepicker.css" />

<title>XBRL REPORT</title>
</head>

<style>
.databody td {
	border: 1px solid #ddd;
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

.clr {
	color: #0c0b0b;
	background-color: #f5f5f5;
	border-color: #f5f5f5;
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
	
	 if(z=="load"){
		//FOR DETAILS
		$(".det").addClass("clr");
		$("#tab1").show();
		
		$(".psc0106,.psc0105").hide();
		$(".det").addClass("clr");
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
		
		 $(".repdisp").text(refno);
		 var srno=1;
		
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "psc0020details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				
					
					  $("#pymdets tr").remove();
					 
					
					var b=JSON.parse(res.detailsPSC0020);
					
					 console.log(b);
					
			
						 	if(f=="onload"){
						 		$("#tab2").hide();
						 		
						 		$(".tab2").hide();
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#pymdets").append("<tr><td id='applno"+srno+"'>"+b[i].appNo+"</td><td id='applname"+srno+"'>"+b[i].acctName+"</td><td id='schmtyp"+srno+"'>"+b[i].receivedDate+"</td><td id='curr' class='sumder'>"+b[i].appliedAmount+"</td><td id='outbal"+srno+"' class='sumder'>"+b[i].restructuredAmount+"</td><td id='intrate"+srno+"'>"+b[i].schemeType+"</td><td id='accopndate"+srno+"'>"+b[i].schemeCode+"</td><td id='recvddate"+srno+"'>"+b[i].rejectedFlg+"</td><td id='appdate"+srno+"'>"+b[i].npaFlg+"</td><td id='rejctddate"+srno+"'>"+b[i].currency+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].outstandingAmt+"</td><td id='rejreason"+srno+"'>"+b[i].renewalDate+"</td><td id='rejreason"+srno+"'>"+b[i].securedFlg+"</td><td id='rejreason"+srno+"'>"+b[i].entityType+"</td><td id='rejreason"+srno+"'>"+b[i].rejectionReason+"</td><td id='rejreason"+srno+"'>"+b[i].isicCode+"</td><td><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>") ;  
						 		  
						 		 
								
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 		$("#tab2").hide();
						 		$(".tab2").hide();
						 		$("#modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
						 			$("#pymdets").append("<tr><td id='applno"+srno+"'>"+b[i].appNo+"</td><td id='applname"+srno+"'>"+b[i].acctName+"</td><td id='schmtyp"+srno+"'>"+b[i].receivedDate+"</td><td id='curr' class='sumder'>"+b[i].appliedAmount+"</td><td id='outbal"+srno+"' class='sumder'>"+b[i].restructuredAmount+"</td><td id='intrate"+srno+"'>"+b[i].schemeType+"</td><td id='accopndate"+srno+"'>"+b[i].schemeCode+"</td><td id='recvddate"+srno+"'>"+b[i].rejectedFlg+"</td><td id='appdate"+srno+"'>"+b[i].npaFlg+"</td><td id='rejctddate"+srno+"'>"+b[i].currency+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].outstandingAmt+"</td><td id='rejreason"+srno+"'>"+b[i].renewalDate+"</td><td id='rejreason"+srno+"'>"+b[i].securedFlg+"</td><td id='rejreason"+srno+"'>"+b[i].entityType+"</td><td id='rejreason"+srno+"'>"+b[i].rejectionReason+"</td><td id='rejreason"+srno+"'>"+b[i].isicCode+"</td></tr>") ;  
							
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
				
		
				 $(".repdisp").text(refno);
				 
					
						$("#sec1 tr").children().detach().remove();
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "psc0020sec1",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec1 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC0020);
								 console.log(b);
								
                                 
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec1").append("<tr><td id='applno"+srno+"'>"+b[i].instname+"</td><td id='applname"+srno+"'>"+b[i].instcode+"</td><td id='schmtyp"+srno+"'>"+b[i].appReceived+"</td><td id='curr' class='sumder'>"+b[i].amtReceived+"</td><td id='outbal"+srno+"'>"+b[i].appRejected+"</td><td id='intrate"+srno+"' class='sumder'>"+b[i].amtRejected+"</td><td id='accopndate"+srno+"' class='sumder'>"+b[i].restructuredAmount+"</td><td id='recvddate"+srno+"' class='sumder'>"+b[i].smeAmt+"</td><td id='appdate"+srno+"' class='sumder'>"+b[i].outstandingAmt+"</td><td id='rejctddate"+srno+"' class='sumder'>"+b[i].flAmt+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].otherAmt+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].totalAmt+"</td><td style=text-align:center;><input type=radio style=width: 15px;text-align:center; onclick=fnloads(0) id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
								
									}
									

						});   	
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "psc0020sec2",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec2 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC0020s2);
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec2").append("<tr><td id='applno"+srno+"'>"+b[i].instname+"</td><td id='applname"+srno+"'>"+b[i].instcode+"</td><td id='schmtyp"+srno+"'>"+b[i].appReceived+"</td><td id='curr' class='sumder'>"+b[i].amtReceived+"</td></td><td id='outbal"+srno+"'>"+b[i].appRejected+"</td><td id='intrate"+srno+"' class='sumder'>"+b[i].amtRejected+"</td><td id='accopndate"+srno+"' class='sumder'>"+b[i].restructuredAmount+"</td><td id='recvddate"+srno+"' class='sumder'>"+b[i].smeAmt+"</td><td id='appdate"+srno+"' class='sumder'>"+b[i].outstandingAmt+"</td><td id='rejctddate"+srno+"' class='sumder'>"+b[i].flAmt+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].otherAmt+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].totalAmt+"</td><td style=text-align:center;><input type=radio style=width: 15px;text-align:center; onclick=fnloads(0) id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
							
									}
									

						});   
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "psc0020sec3",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec3 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC0020s3);
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec3").append("<tr><td id='applno"+srno+"'>"+b[i].instname+"</td><td id='applname"+srno+"'>"+b[i].instcode+"</td><td id='applname"+srno+"' class='sumder'>"+b[i].amtPerforming+"</td><td id='applname"+srno+"' class='sumder'>"+b[i].amtImpaired+"</td><td id='schmtyp"+srno+"'>"+b[i].appReceived+"</td><td id='curr' class='sumder'>"+b[i].amtReceived+"</td><td id='outbal"+srno+"'>"+b[i].appRejected+"</td><td id='intrate"+srno+"' class='sumder'>"+b[i].amtRejected+"</td><td id='accopndate"+srno+"' class='sumder'>"+b[i].restructuredAmount+"</td><td id='recvddate"+srno+"' class='sumder'>"+b[i].smeAmt+"</td><td id='appdate"+srno+"' class='sumder'>"+b[i].outstandingAmt+"</td><td id='rejctddate"+srno+"' class='sumder'>"+b[i].flAmt+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].otherAmt+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].totalAmt+"</td><td style=text-align:center;><input type=radio style=width: 15px;text-align:center; onclick=fnloads(0) id='edit"+srno+"'></td></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
								
									}
									

						});   
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "psc0020sec4",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec4 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC0020s4);
								 console.log(b);
								 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec4").append("<tr><td id='applno"+srno+"'>"+b[i].instname+"</td><td id='applname"+srno+"'>"+b[i].instcode+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].smeAmt+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].msmeAmt+"</td><td style=text-align:center;><input type=radio style=width: 15px;text-align:center; onclick=fnloads(0) id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
								
									}
									

						});   
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "psc0020sec5",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec5 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC0020s5);
								 console.log(b);
								
		 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec5").append("<tr><td id='applno"+srno+"'>"+b[i].acctName+"</td><td id='applname"+srno+"'>"+b[i].entityType+"</td><td id='rejreason"+srno+"'>"+b[i].typeFacility+"</td><td id='rejreason"+srno+"'>"+b[i].amountFacility+"</td><td id='rejreason"+srno+"'>"+b[i].rejectionReason+"</td><td style=text-align:center;><input type=radio style=width: 15px;text-align:center; onclick=fnloads(0) id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
									
									
									}
									

						});   
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "psc00106",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#section1 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC00106);
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#section1").append("<tr><td id='applno"+srno+"'>"+b[i].isicCode+"</td><td id='applname"+srno+"'>"+b[i].acctName+"</td><td id='rejreason"+srno+"'>"+b[i].entityType+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].amtPerforming+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].amtImpaired+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].smeAmt+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].outstandingAmt+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].flAmt+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].otherAmt+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].totalAmt+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].outsmeAmt+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].outOd+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].outFlease+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].outOthers+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].outTotal+"</td><td style=text-align:center;><input type=radio style=width: 15px;text-align:center; onclick=fnloads(0) id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
							}
									

						});   
							
							
					}
				 
	 }
	 

</SCRIPT>
<script>
$(document).ready(function(){
	
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');

	
});   
</script>

<script>
$(document).ready(function(){
$("#tb1").show();

	if('<%=reptype%>'=="PSC0106" || '<%=reptype%>'=="psc0106"){
		
		$(".psc0106,#tb").show();
		
		$(".psc0105").hide();
	}else if('<%=reptype%>'=="PSC0105" || '<%=reptype%>'=="psc0105"){
		
		$(".psc0105").show();
		$(".psc0106").hide();
	}
	
	
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
	
	$('#btnback').on('click', function(e){
	    e.preventDefault();
	    window.history.back();
	});
	
	
	$("#btnExcel").click(function(){ 
    	
		 //return false;
		 PSC0020Form.action = "PSC0020EXCELREPORT.action?method=PSC0020EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+document.getElementById("refdisplayFIM").innerHTML;
		 PSC0020Form.submit();
});
	
	
	
});	

</script>

<script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
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
	if(b==0 ||b==2 || b==3 ||b==4 || b==10 || b==11){
		
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
	 
	var btn=1;
	 $("#btnpre").prop("disabled",true);
  $("#tb1").show();
  
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
if(a==1){
	
	$("#btnpre").prop("disabled",true);
	 $("#btnnext").prop("disabled",false);
	 $("#li1").addClass("active");
	 $("#li2").removeClass("active");
}else if(a==5){
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
		
		location.href = "XBRL_REP_PSC0020_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_PSC0020_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	
	
	$('#btnExcel').click(function() {
		
		 PSC0020Form.action = "PSC0020EXCELREPORT.action?method=PSC0020EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 PSC0020Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 PSC0020Form.action = "PSC0020EXCELSum.action?method=PSC0020EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 PSC0020Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 PSC0020Form.action = "PSC0020PDFREPORT.action?method=PSC0020PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 PSC0020Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  PSC0020Form.action = "XMLDOWNLOAD.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 PSC0020Form.submit(); 
	});
	
	
	$("#btnfilter").on("click",function(){
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
		}else{
			$(".form-control2").val("");
			$(".form-control2").prop("disabled",true);
		}
		
	});

	var save=0;

$('#btnSave').on("click",function() {
	
	  var datasum={
			"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>'
	};
	$.ajax({
		url:"saveSum",
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

	/* $("#addrow").on("click",function(){
		var rowno=$("#rowno").val();
		$("#addrowno").val("1"); 
		$("#pymdets").prepend("<tr><td id='modes_row"+rowno+"'><input type='text' id='modes_text"+rowno+"' style='width: 47px;'></td><td id='chqno_row"+rowno+"'><input type='text'  id='chqno_text"+rowno+"' style='    width:117px;'></td><td id='secflg_row"+rowno+"'><input type='text' id='secflg_text"+rowno+"' style='     width: 121px;'></td><td id='accname_row"+rowno+"'><input type='text' 	id='accname_text"+rowno+"' style='    width: 242px;'></td><td id='trdate_row"+rowno+"'><input type='text' id='trdate_text"+rowno+"' style='    width: 100px;'></td><td id='chqamt_row"+rowno+"' class='sumder alnum'><input type='text'  id='chqamt_text"+rowno+"'  class='decimalPt roundUp'  style='    width: 115px;'><td hidden id='rcrusrid_row"+rowno+"'></td><td hidden id='rcrtme_row"+rowno+"'></td><td hidden id='lchusrid_row"+rowno+"'></td><td hidden id='lchtme_row"+rowno+"'></td><td hidden id='del_row"+rowno+"'></td></td><td id='crncy_row"+rowno+"'><input type='text' id='crncy_text"+rowno+"' style='    width: 52px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");


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
			  if (!isNaN(value)) {
			    $(this).val(parseFloat(value).toFixed(2));
			  }
			});


		}); */


		
});	



</script>
<SCRIPT>

function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_PSC0020_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>

<body>


	<div class="container">

		<div class="loader"></div>

		<form class="form-horizontal" method="post" name="PSC0020Form"
			enctype="multipart/form-data">
			<div class="tab-content">
				<div class="active psc0105 tab2" id="tab2"
					style="width: 968px; padding-top: 1px; margin-top: -17px;">
					<div style="margin-top: 40px;">
						<font size="2" style="font-size: 13px;"><b
							style="font-size: 13px;"><%=reptype%> - <b id="sub"
								style="display: none"></b></b><b>Credit facilities extended
								under the SME Financing Scheme to SMEs and to Micro and Small
								Enterprises<b id="sub" Style="display: none"></b>
						</b></font> <br>
					</div>
					<ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">



						<li class=" pull-right list" onclick="functionli(5);"><a
							href="#tab5" data-toggle="tab"><span class="headingtab">5</span></a></li>
						<li class=" pull-right list" onclick="functionli(4);"><a
							href="#tab4" data-toggle="tab"><span class="headingtab">4</span></a></li>
						<li class=" pull-right list" onclick="functionli(3);"><a
							href="#tab3" data-toggle="tab"><span class="headingtab">3</span></a></li>
						<li class=" pull-right list" onclick="functionli(2);"><a
							href="#tab2" data-toggle="tab"><span class="headingtab">2</span></a></li>


						<li class=" pull-right active list" onclick="functionli(1);"><a
							href="#tab1" data-toggle="tab"><span class="headingtab">
									1 </span></a></li>




					</ul>
					<table class="" style="width: 100%; height: 50px;">
						<tr>
							<td style="background-color: #bbc3cb;"><font size="1"><b
									style="color: #0c1190; font-size: 11px;"> Report Ref No : </b></font>
								<font size="1"><b
									style="color: #0c1190; font-size: 11px;" class="repdisp"
									id="refDisplay"></b></font></td>

							<td
								style="text-align: right; background-color: #bbc3cb; width: 325px;"></td>
							<td style="background-color: #bbc3cb; text-align: right;"><a
								class="btn btn-xs btn-primary det" href="#tab1" id="det"
								data-toggle="tab"><span class="headingtab"> Details
								</span></a> <a class="btn btn-xs btn-primary summ" href="#tab2"
								data-toggle="tab"><span class="headingtab " id="">Summary
								</span></a> <a id="btndwnld"><i
									class="glyphicon glyphicon-download-alt"
									style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><select
								id="dnloadfrmt" style="border-radius: 4px; margin-left: 10px;"><option
										value="pdf">pdf</option>
									<option value="excel">Excel</option></select></td>

						</tr>
					</table>

					<table class="table" id="tb5"
						style="width: 100%; display: none; margin-top: -20px;">
						<tr>
							<td colspan="14"
								style="text-align: center; background-color: #bbc3cb; font-size: 13px; text-align: center"><b>Memorandum
									items</b></td>
						</tr>
						<tr>
							<!--   <th rowspan="2">Sr.No.

          </th> -->
							<th>Name of Entity Rejected</th>
							<th>Type of Entity</th>
							<th>Type of Facility Rejected</th>

							<th>Amount of Facility Rejected</th>
							<th>Reasons</th>
							<th rowspan="3" style="text-align: center">Select</th>
						</tr>


						<tr>
							<th>AN</th>
							<th>AO</th>
							<th>AP</th>
							<th>AQ</th>
							<th>AR</th>


						</tr>

						<tr>
							<!--  <th >1

          </th> -->


						</tr>

						<tbody class="databody" id="sec5"></tbody>

					</table>







					<table class="table" id="tb4"
						style="width: 100%; display: none; margin-top: -20px;">
						<tr>
							<td colspan="14"
								style="text-align: center; background-color: #bbc3cb; font-size: 13px; text-align: center"><b>Memorandum
									items</b></td>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th rowspan="2">SMEs</th>
							<th rowspan="2">Micro & Small Enterprises</th>
							<th rowspan="3" style="text-align: center">Select</th>
						</tr>
						<tr>
							<th>AL</th>
							<th>AM</th>





						</tr>

						<tbody class="databody" id="sec4"></tbody>


					</table>


					<table class="table" id="tb3"
						style="width: 100%; display: none; margin-top: -20px;">
						<tr>
							<td colspan="15"
								style="text-align: center; background-color: #bbc3cb; font-size: 13px; text-align: center"><b>Closing
									Cumulative Data On Credit Extended under the SME Financing
									Scheme to SMEs and to Micro and Small Enterprises till date</b></td>
						</tr>
						<tr>
							<th rowspan="3" style="text-align: center">Closing
								Cumulative Data On Credit Extended under the SME Financing
								Scheme to SMEs and to Micro and Small Enterprises Till date</th>
							<th rowspan="3"></th>
							<th colspan="2" style="text-align: center">Status of
								Outstanding Credit Facilities as at end of month</th>
							<th colspan="2" style="text-align: center">Applications
								Received</th>
							<th colspan="2" style="text-align: center">Applications
								Rejected</th>
							<th rowspan="2" style="text-align: center">Restructured
								Credit Facilities</th>
							<th colspan="5" style="text-align: center">Credit Facilities
								approved</th>
							<th rowspan="3" style="text-align: center">Select</th>

						</tr>

						<tr>
							<th style="text-align: center">Amount Performing</th>
							<th style="text-align: center">Amount Impaired</th>
							<th style="text-align: center">Number</th>
							<th style="text-align: center">Amount</th>
							<th style="text-align: center">Number</th>
							<th style="text-align: center">Amount</th>
							<th style="text-align: center">SME Loans</th>
							<th style="text-align: center">Overdrafts</th>
							<th style="text-align: center">Finance Lease</th>
							<th style="text-align: center">Others</th>
							<th style="text-align: center">Total</th>
						</tr>
						<tr>
							<th>U</th>
							<th>V</th>
							<th style="text-align: center">W</th>
							<th style="text-align: center">X</th>
							<th style="text-align: center">Y</th>
							<th style="text-align: center">Z</th>
							<th style="text-align: center">AA</th>
							<th style="text-align: center">AB</th>
							<th style="text-align: center">AC</th>
							<th style="text-align: center">AD</th>
							<th style="text-align: center">AE</th>
							<th style="text-align: center">AF</th>
						</tr>
						<tr>



						</tr>
						<tbody class="databody" id="sec3"></tbody>
					</table>


					<table class="table" id="tb2"
						style="width: 100%; display: none; margin-top: -20px;">
						<tr>
							<td colspan="13"
								style="text-align: center; background-color: #bbc3cb; font-size: 13px; text-align: center"><b>Data
									On Credit Extended under the SME Financing Scheme to SMEs and
									to Micro and Small Enterprises during the month </b></td>
						</tr>
						<tr>
							<th rowspan="3" style="text-align: center">Aggregate Data On
								Credit extended under the SME Financing Scheme to SMEs and to
								Micro and Small Enterprises</th>
							<th rowspan="2"></th>
							<th colspan="2" style="text-align: center">Applications
								Received</th>
							<th colspan="2" style="text-align: center">Applications
								Rejected</th>
							<th rowspan="2" style="text-align: center">Restructured
								Credit Facilities during the month</th>
							<th colspan="5" style="text-align: center">Credit Facilities
								approved during the month</th>
							<th rowspan="3" style="text-align: center">Select</th>

						</tr>

						<tr>
							<th style="text-align: center">Number</th>
							<th style="text-align: center">Amount</th>
							<th style="text-align: center">Number</th>
							<th style="text-align: center">Amount</th>
							<th style="text-align: center">SME Loans</th>
							<th style="text-align: center">Overdrafts</th>
							<th style="text-align: center">Finance Lease</th>
							<th style="text-align: center">Others</th>
							<th style="text-align: center">Total</th>
						</tr>
						<tr>
							<th rowspan="1"></th>
							<th style="text-align: center">K</th>
							<th style="text-align: center">L</th>
							<th style="text-align: center">M</th>
							<th style="text-align: center">N</th>
							<th style="text-align: center">O</th>
							<th style="text-align: center">P</th>
							<th style="text-align: center">Q</th>
							<th style="text-align: center">R</th>
							<th style="text-align: center">S</th>
							<th style="text-align: center">T</th>
						</tr>
						<tr>


						</tr>
						<tbody class="databody" id="sec2"></tbody>
					</table>


					<table class="table" id="tb1"
						style="width: 100%; display: none; margin-top: -20px;">
						<tr>
							<td colspan="13"
								style="text-align: center; background-color: #bbc3cb; font-size: 13px; text-align: center"><b>Opening
									Cumulative Data On Credit Extended under the SME Financing
									Scheme to SMEs and to Micro and Small Enterprises till date </b></td>
						</tr>
						<tr>
							<th rowspan="3" style="text-align: center">Opening
								Cumulative Data On Credit Extended under the SME Financing
								Scheme to SMEs and to Micro and Small Enterprises Till Date</th>
							<th rowspan="2"></th>
							<th colspan="2" style="text-align: center">Applications
								Received</th>
							<th colspan="2" style="text-align: center">Applications
								Rejected</th>
							<th rowspan="2" style="text-align: center">Restructured
								Credit Facilities</th>
							<th colspan="5" style="text-align: center">Credit Facilities
								approved</th>
							<th rowspan="3" style="text-align: center">Select</th>

						</tr>

						<tr>
							<th style="text-align: center">Number</th>
							<th style="text-align: center">Amount</th>
							<th style="text-align: center">Number</th>
							<th style="text-align: center">Amount</th>
							<th style="text-align: center">SME Loans</th>
							<th style="text-align: center">Overdrafts</th>
							<th style="text-align: center">Finance Lease</th>
							<th style="text-align: center">Others</th>
							<th style="text-align: center">Total</th>
						</tr>
						<tr>
							<th rowspan="1"></th>
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
						</tr>

						<tr>


						</tr>
						<tbody class="databody" id="sec1"></tbody>
					</table>

					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
						<!--   <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button> -->

						<button type="button" class="btn btn-xs btn-primary" value="Excel"
							id="btnSave">Save</button>

						<button type="button" class="btn btn-xs btn-primary"
							style="display: none" value="Excel" id="btnXML">Gen XML
							Sum</button>

						<!-- <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button> -->
						<button type="button" class="btn btn-xs btn-primary" value="back"
							id="btnback">Back</button>
					</div>

				</div>
				<!-- psc0106 -->
				<div class="active psc0106 tab2" id="tab2"
					style="width: 968px; padding-top: 1px; margin-top: -17px;">
					<div style="margin-top: 40px;">
						<font size="2" style="font-size: 13px;"><b
							style="font-size: 13px;"> <%=reptype%> - <b id="sub"
								style="display: none"></b></b><b>List of Names of SMEs - SME
								Financing Scheme and MSME<b id="sub" Style="display: none"></b>
						</b></font> <br>
						<br>
					</div>

					<table class="table" style="width: 100%; height: 50px;">
						<tr>
							<td style="background-color: #bbc3cb;"><font size="1"><b
									style="color: #0c1190; font-size: 11px;"> Report Ref No : </b></font>
								<font size="1"><b
									style="color: #0c1190; font-size: 11px;" class="repdisp"
									id="refDisplay"></b></font></td>
							<td
								style="text-align: right; background-color: #bbc3cb; width: 325px;"></td>
							<td style="background-color: #bbc3cb; text-align: right;"><a
								class="btn btn-xs btn-primary det" href="#tab1" id="det"
								data-toggle="tab"><span class="headingtab"> Details
								</span></a> <a class="btn btn-xs btn-primary summ" href="#tab2"
								data-toggle="tab"><span class="headingtab ">Summary
								</span></a> <a id="btndwnld"><i
									class="glyphicon glyphicon-download-alt"
									style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><select
								id="dnloadfrmt" style="border-radius: 4px; margin-left: 10px;"><option
										value="pdf">pdf</option>
									<option value="excel">Excel</option></select></td>
						</tr>
					</table>

					<table class="table" id="tb"
						style="width: 100%; display: none; margin-top: -20px;">
						<tr>
							<td colspan="16"
								style="text-align: center; background-color: #bbc3cb; font-size: 13px; text-align: center"><b>List
									of Names of SMEs - SME Financing Scheme and MSME </b></td>
						</tr>
						<tr>
							<th rowspan="2" style="text-align: center">ISIC Code</th>
							<th rowspan="2" style="text-align: center">Name</th>
							<th rowspan="2" style="text-align: center">Type of Entity</th>
							<th colspan="2" style="text-align: center">Status of
								Outstanding Credit Facilities</th>
							<th colspan="5" style="text-align: center">Credit Facilities
								approved Under the SME Financing Scheme and MSME-Cumulative
								Basis</th>
							<th colspan="5" style="text-align: center">Amount
								Outstanding</th>
							<th rowspan="3" style="text-align: center">Select</th>
						</tr>

						<tr>
							<th style="text-align: center">Amount Performing</th>
							<th style="text-align: center">Amount Impaired</th>
							<th style="text-align: center">SME Loans</th>
							<th style="text-align: center">Overdrafts</th>
							<th style="text-align: center">Finance Lease</th>
							<th style="text-align: center">Others</th>
							<th style="text-align: center">Total</th>
							<th style="text-align: center">SME Loans</th>
							<th style="text-align: center">Overdrafts</th>
							<th style="text-align: center">Finance Lease</th>
							<th style="text-align: center">Others</th>
							<th style="text-align: center">Total</th>
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
						</tr>

						<tr>


						</tr>

						<tbody class="databody" id="section1"></tbody>
					</table>
					<div class="modal-footer">

						<button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>

						<button type="button" class="btn btn-xs btn-primary" value="Excel"
							id="btnSave">Save</button>

						<button type="button" class="btn btn-xs btn-primary"
							style="display: none" value="Excel" id="btnXML">Gen XML
							Sum</button>

						<button type="button" class="btn btn-xs btn-primary" value="back"
							id="btnback">Back</button>
					</div>

				</div>

				<!-- DETAIL TABLE -->

				<input type="hidden" id="rowno"> <input type="hidden"
					id="addrowno">
				<div class="active" id="tab1"
					style="width: 1938px; padding-top: 1px; margin-top: -17px; display: none">
					<div style="margin-top: 40px;">
						<font size="2" style="font-size: 13px;"><b
							style="font-size: 13px;"><%=reptype%> - <b id="sub"
								style="display: none"></b></b><b>Credit facilities extended
								under the SME Financing Scheme to SMEs and to Micro and Small
								Enterprises <b id="sub" Style="display: none"></b>
						</b></font> <br>
						<br>
					</div>
					<div id="divLoading"></div>
					<table class="table" style="width: 1938px; height: 50px;">
						<tr>
							<td style="background-color: #bbc3cb; width: 250px;"><font
								size="1"><b style="color: #0c1190; font-size: 11px;">
										Report Ref No : </b></font> <font size="1"><b
									style="color: #0c1190; font-size: 11px;" class="repdisp"
									id="refDisplay"></b></font></td>
							<td
								style="text-align: right; background-color: #bbc3cb; width: 600px;"></td>
							<td style="background-color: #bbc3cb; text-align: right;"><a
								class="btn btn-xs btn-primary det" href="#tab1" id="det"
								data-toggle="tab"><span class="headingtab"> Details
								</span></a> <a class="btn btn-xs btn-primary summ" href="#tab2"
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

									<th><input type="text" style="width: 100px;"
										onkeyup="myFunction(this.id,0)" class="form-control2"
										id="applno" placeholder="Application Number" disabled></th>
									<!-- <th id="chalpha">Cheque Alpha</th>					 -->
									<th><input type="text" id="accname" style="width: 100px;"
										onkeyup="myFunction(this.id,1)" class="form-control2"
										placeholder="Account Name" disabled></th>
									<th><input type="text" id="revdt" style="width: 100px;"
										onkeyup="myFunction(this.id,2)" class="form-control2"
										placeholder="Received Date" disabled></th>
									<th><input type="text" id="appamt" style="width: 100px;"
										onkeyup="myFunction(this.id,3)" class="form-control2"
										placeholder="Applied Amount" disabled></th>
									<th><input type="text" id="resamt" style="width: 110px;"
										class="form-control2" onkeyup="myFunction(this.id,4)"
										placeholder="Restructured Amount" disabled></th>
									<!-- <th id="valdate">Value Date</th> -->
									<th style=""><input type="text" style="width: 100px;"
										id="schmtyp" onkeyup="myFunction(this.id,5)"
										class="form-control2" placeholder="Scheme Type" disabled></th>
									<th><input type="text" style="width: 100px;"
										class="form-control2" id="schmcode"
										onkeyup="myFunction(this.id,6)" placeholder="Scheme Code"
										disabled></th>
									<th><input type="text" style="width: 100px;"
										class="form-control2" id="rejfg"
										onkeyup="myFunction(this.id,7)" placeholder="Rejected Flg"
										disabled></th>
									<th><input type="text" style="width: 100px;"
										class="form-control2" id="nfafg"
										onkeyup="myFunction(this.id,8)" placeholder="NPA Flg" disabled></th>
									<th><input type="text" style="width: 100px;"
										class="form-control2" id="curncy"
										onkeyup="myFunction(this.id,9)" placeholder="Currency"
										disabled></th>
									<th><input type="text" style="width: 100px;"
										class="form-control2" id="outamt"
										onkeyup="myFunction(this.id,10)"
										placeholder="Outstanding Amount" disabled></th>
									<th><input type="text" style="width: 100px;"
										class="form-control2" id="rendate"
										onkeyup="myFunction(this.id,11)" placeholder="Renewal Date"
										disabled></th>
									<th><input type="text" style="width: 100px;"
										class="form-control2" id="secfg"
										onkeyup="myFunction(this.id,12)" placeholder="Secured Flg"
										disabled></th>
									<th><input type="text" style="width: 100px;"
										class="form-control2" id="entyp"
										onkeyup="myFunction(this.id,13)" placeholder="Entity Type"
										disabled></th>
									<th><input type="text" style="width: 100px;"
										class="form-control2" id="rejrsn"
										onkeyup="myFunction(this.id,14)"
										placeholder="Rejection Reason" disabled></th>
									<th><input type="text" style="width: 100px;"
										class="form-control2" id="isic"
										onkeyup="myFunction(this.id,15)" placeholder="ISIC Code"
										disabled></th>
									<th id="modify">Modify</th>

								</tr>

							</thead>



							<tbody class="databody" id="pymdets">



							</tbody>



						</table>

					</div>
				</div>


			</div>








		</form>


	</div>



</body>
</html>