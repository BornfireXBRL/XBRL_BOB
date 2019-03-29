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
 
 String reptype=request.getParameter("reptype");
 String curr = request.getParameter("curr");
 String typo=request.getParameter("typo");
// String ReporefSeq = request.getParameter("ReporefSeq");
String types=request.getParameter("types");

String instno = request.getParameter("instno");
String ReporefSeq = request.getParameter("ReporefSeq");
 
 XBRLFIM0100Dao dmd=new XBRLFIM0100Dao();
 
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

.clr {
	color: #0c0b0b;
	background-color: #f5f5f5;
	border-color: #f5f5f5;
}
.ui-dialog-titlebar-close {
    visibility: hidden;
}
.hidden {
  display: none;
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

.databody td {
	border: 1px solid #ddd;
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
<SCRIPT>
function fnload(z,d,e,b,c,a,f,g){
	var save=0;
	//z --->typo(load or summary)
	//d -->date1
	//e -->date2
	//b -->refseqno
	//c -->instance no
	//a -->reptype
	//f -->types of details
	//g -->currency
	$("#tb1").show();
	$("#btnSave").hide();
	$("#btnXML").hide();
	 if(z=="load"){
		 
		//FOR DETAILS
		$(".det").addClass("clr");
		$("#tab1").show();
		$("#tab2").hide();
		$("#detb1").show();
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
		 var cnt1=1;
			var srno=1;
			
			
			$(".activetab1").show();
			$(".activetab2").hide();
			 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "PSC0103det1",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				
					
					 $("#det1 tr").remove();
					
					

					 var b=JSON.parse(res.sec1PSC0103d1);
						 console.log(b);
						
						 if(f=="onload"){
						 
						 		for(var i=0;i<b.length;i++){
						 			
						 		 /*  $("#de1").append("<tr><td id='d1benownname"+srno+"'>"+b[i].d1benownname+"</td><td id='d1citiz"+srno+"'>"+b[i].d1citiz+"</td><td id='d1typhold"+srno+"'>"+b[i].d1typhold+"</td><td id='d1noofshares"+srno+"'>"+b[i].d1noofshares+"</td><td id='d1perofshare"+srno+"'>"+b[i].d1perofshare+"</td><td id='d1perofdirind"+srno+"'>"+b[i].d1perofdirind+"</td><td id='d1repdate"+srno+"'>"+b[i].d1repdate+"</td><td><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>") ;   */
						 		  
						 		 $("#det1").append("<tr id='psc3add"+srno+"'><td  id='acctno_row"+srno+"'>"+b[i].acctno+"</td><td id='acctname_row"+srno+"'>"+b[i].acctname+"</td><td id='secflag_row"+srno+"'>"+b[i].secflag+"</td><td class='sumder' id='sancamt_row"+srno+"'>"+b[i].sancamt+"</td><td class='sumder' id='outamt_row"+srno+"'>"+b[i].outamt+"</td><td id='inttyp_row"+srno+"'>"+b[i].inttyp+"</td><td class='sumder' id='intrate_row"+srno+"'>"+b[i].intrate+"</td><td id='primsecflg_row"+srno+"'>"+b[i].primsecflg+"</td><td id='otherresflg_row"+srno+"'>"+b[i].otherresflg+"</td><td id='othrassflg_row"+srno+"'>"+b[i].othrassflg+"</td><td id='isacdel_row"+srno+"'>"+b[i].isacdel+"</td><td id='isacfor_row"+srno+"'>"+b[i].isacfor+"</td><td id='acfordat_row"+srno+"'>"+b[i].acfordat+"</td><td id='acopndat_row"+srno+"'>"+b[i].acopndat+"</td><td class='sumder' id='intamt_row"+srno+"'>"+b[i].intamt+"</td><td class='sumder' id='moninamt_row"+srno+"'>"+b[i].moninamt+"</td><td id='scode_row"+srno+"'>"+b[i].scode+"</td><td id='repdate_row"+srno+"'>"+b[i].repdate+"</td><td style=text-align:center;><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none; ' onclick=Cancel_row('"+cnt1+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+cnt1+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+cnt1+"')></td></tr>") ;  
								
								 srno++;
								 
								
									}
								
						 		 $("#divLoading").removeClass('show');
									$("#rowno").val(srno);
							 	}else if(f=="frmsum"){
							 		$(".add").hide();//add button hide
							 	
							 		$("#modify").hide();//modify in the header hide
							 		for(var i=0;i<b.length;i++){
							 			
								 		 $("#det1").append("<tr><td  id='acctno_row"+srno+"'>"+b[i].acctno+"</td><td id='acctname_row"+srno+"'>"+b[i].acctname+"</td><td id='secflag_row"+srno+"'>"+b[i].secflag+"</td><td class='sumder' id='sancamt_row"+srno+"'>"+b[i].sancamt+"</td><td class='sumder' id='outamt_row"+srno+"'>"+b[i].outamt+"</td><td id='inttyp_row"+srno+"'>"+b[i].inttyp+"</td><td class='sumder' id='intrate_row"+srno+"'>"+b[i].intrate+"</td><td id='primsecflg_row"+srno+"'>"+b[i].primsecflg+"</td><td id='otherresflg_row"+srno+"'>"+b[i].otherresflg+"</td><td id='othrassflg_row"+srno+"'>"+b[i].othrassflg+"</td><td id='isacdel_row"+srno+"'>"+b[i].isacdel+"</td><td id='isacfor_row"+srno+"'>"+b[i].isacfor+"</td><td id='acfordat_row"+srno+"'>"+b[i].acfordat+"</td><td id='acopndat_row"+srno+"'>"+b[i].acopndat+"</td><td class='sumder' id='intamt_row"+srno+"'>"+b[i].intamt+"</td><td class='sumder' id='moninamt_row"+srno+"'>"+b[i].moninamt+"</td><td id='scode_row"+srno+"'>"+b[i].scode+"</td><td id='repdate_row"+srno+"'>"+b[i].repdate+"</td></tr>") ;  
								 		  
								 		  
									 
									
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
				 
					var cnt1=1;
						$("#sec1 tr").children().detach().remove();
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "PSC0103sec1",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec1 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC0103);
								 console.log(b);
								
                                 
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		
									 		 $("#sec1").append("<tr><td id='intname"+cnt1+"'>"+b[i].intname+"</td><td id='intcode"+cnt1+"'>"+b[i].intcode+"</td><td class='sumder' id='secprimamt"+cnt1+"'>"+b[i].secprimamt+"</td><td class='sumder' id='secprimrate"+cnt1+"'>"+b[i].secprimrate+"</td><td class='sumder' id='secresamt"+cnt1+"'>"+b[i].secresamt+"</td><td class='sumder' id='secresrate"+cnt1+"'>"+b[i].secresrate+"</td><td class='sumder' id='secastamt"+cnt1+"'>"+b[i].secastamt+"</td><td class='sumder' id='secastrate"+cnt1+"'>"+b[i].secastrate+"</td><td class='sumder' id='unsecdamt"+cnt1+"'>"+b[i].unsecdamt+"</td><td class='sumder' id='unsecdrate"+cnt1+"'>"+b[i].unsecdrate+"</td><td class='sumder' id='totamt"+cnt1+"'>"+b[i].totamt+"</td><td class='sumder' id='totrate"+cnt1+"'>"+b[i].totrate+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+cnt1+") id='edit"+cnt1+"'></td></tr>");
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   	
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "PSC0103sec2",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec2 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC0103s2);
								
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 			 $("#sec2").append("<tr><td id='intname"+cnt1+"'>"+b[i].intname+"</td><td id='intcode"+cnt1+"'>"+b[i].intcode+"</td><td class='sumder' id='secprimamt"+cnt1+"'>"+b[i].secprimamt+"</td><td class='sumder' id='secprimrate"+cnt1+"'>"+b[i].secprimrate+"</td><td class='sumder' id='secresamt"+cnt1+"'>"+b[i].secresamt+"</td><td class='sumder' id='secresrate"+cnt1+"'>"+b[i].secresrate+"</td><td class='sumder' id='secastamt"+cnt1+"'>"+b[i].secastamt+"</td><td class='sumder' id='secastrate"+cnt1+"'>"+b[i].secastrate+"</td><td class='sumder' id='unsecdamt"+cnt1+"'>"+b[i].unsecdamt+"</td><td class='sumder' id='unsecdrate"+cnt1+"'>"+b[i].unsecdrate+"</td><td class='sumder' id='totamt"+cnt1+"'>"+b[i].totamt+"</td><td class='sumder' id='totrate"+cnt1+"'>"+b[i].totrate+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+cnt1+") id='edit"+cnt1+"'></td></tr>");
									 		 
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   
						
					
						
						
					
							
					}
  var datasum={
				"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>'
		};
	 

	 $.ajax({
			url:"savecheckPSC3",
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
	location.href = "XBRL_REP_PSC0103_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>


<script>
function myFunction(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("det1");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==0 || b==3|| b==4|| b==6|| b==13|| b==14|| b==15|| b==16|| b==17 ){
		
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
	var det={
			"repdate":'<%=dt2%>',"type":"chckmodified"
		};
		$.ajax({
			url:"PSC0103chckmodified",
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
					        	location.href = "XBRL_CRT_PSC0103_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
					        }
					      }
					    });
					
					
				}else{
					$("#modflg").val("N");
				}
			}
		});
		
		
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');

	
});   
</script>

<script>
$(document).ready(function(){
<%-- $("#tb1").show();

	if('<%=reptype%>'=="PSC0106" || '<%=reptype%>'=="psc0106"){
		
		$(".psc0106,#tb").show();
		
		$(".psc0105").hide();
	}else if('<%=reptype%>'=="PSC0105" || '<%=reptype%>'=="psc0105"){
		
		$(".psc0105").show();
		$(".psc0106").hide();
	}
	 --%>
	
	
	$( ".btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
$("#btnfilter").on("click",function(){
		
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
			 $('#acctno,#acctname,#secflag,#sancamt,#outamt,#inttyp,#intrate,#primsecflg,#otherresflg,#othrassflg,#isacdel,#isacfor,#acfordat,#acopndat,#intamt,#moninamt,#scode,#repdate').css({
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
			
		    $('#acctno,#acctname,#secflag,#sancamt,#outamt,#inttyp,#intrate,#primsecflg,#otherresflg,#othrassflg,#isacdel,#isacfor,#acfordat,#acopndat,#intamt,#moninamt,#scode,#repdate').css({
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
				 table = document.getElementById("det1");
				 tr = table.getElementsByTagName("tr");
				 for (i = 0; i < tr.length; i++) {
					 
						 
						 tr[i].style.display = ""; 
						 
				 
					 
				 }
				
		}
		
	});

	
	$( '.btnback').click(function() {
		 location.href="XBRL_CRT_PSC0103_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

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
}else {
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
		
		location.href = "XBRL_REP_PSC0103_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_PSC0103_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	
	
	$('#btnExcel').click(function() {
		if($("#modflg").val()=="N"){
		PSC0103Form.action = "PSC0103EXCELREPORT.action?method=PSC0103EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		PSC0103Form.submit();
		}else{
			alert("Some Records are Modified");
		}

	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			PSC0103Form.action = "PSC0103EXCELSum.action?method=PSC0103EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			PSC0103Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			PSC0103Form.action = "PSC0103PDFREPORT.action?method=PSC0103PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			PSC0103Form.submit();
		}
	});
	$('#btnXML').click(function() {
		PSC0103Form.action = "XMLDOWNLOADp3.action?method=blsxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		PSC0103Form.submit(); 
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
	 					url:"saveSump3",
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
	 				   			url:"saveSump3",
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
	$("#det1").prepend("<tr style='width: 2200px;' id='psc3add"+rowno+"'><td id='acctno_row"+rowno+"'><input type='text' id='acctno_text"+rowno+"' style='width: 100px;'></td><td id='acctname_row"+rowno+"'><input type='text'  id='acctname_text"+rowno+"' style='    width:333px;'></td><td id='secflag_row"+rowno+"'><input type='text' id='secflag_text"+rowno+"' style='     width: 88px;'></td><td id='sancamt_row"+rowno+"'><input type='text' 	id='sancamt_text"+rowno+"' style='    width: 100px;'></td><td id='outamt_row"+rowno+"'><input type='text' id='outamt_text"+rowno+"' style='    width: 100px;'></td><td id='inttyp_row"+rowno+"' class='sumder alnum'><input type='text'  id='inttyp_text"+rowno+"'  class='decimalPt roundUp'  style='    width: 92px;'><td  id='intrate_row"+rowno+"'><input type='text'  id='intrate_text"+rowno+"'  class='decimalPt roundUp'  style='    width: 60px;'></td><td id='primsecflg_row"+rowno+"'><input type='text' id='primsecflg_text"+rowno+"' style='width: 100px;'></td><td id='otherresflg_row"+rowno+"'><input type='text' id='otherresflg_text"+rowno+"' style='width: 100px;'></td><td id='othrassflg_row"+rowno+"'><input type='text' id='othrassflg_text"+rowno+"' style='width: 100px;'></td><td id='isacdel_row"+rowno+"'><input type='text' id='isacdel_text"+rowno+"' style='width: 100px;'></td><td id='isacfor_row"+rowno+"'><input type='text' id='isacfor_text"+rowno+"' style='width: 100px;'></td><td id='acfordat_row"+rowno+"'><input type='text' id='acfordat_text"+rowno+"' style='width:100px;'></td><td id='acopndat_row"+rowno+"'><input type='text' id='acopndat_text"+rowno+"' style='width: 100px;'></td><td id='intamt_row"+rowno+"'><input type='text' id='intamt_text"+rowno+"' style='width: 100px;'></td><td id='moninamt_row"+rowno+"'><input type='text' id='moninamt_text"+rowno+"' style='width: 95px;'></td><td id='scode_row"+rowno+"'><input type='text' id='scode_text"+rowno+"' style='width: 100px;'></td><td id='repdate_row"+rowno+"'><input type='text' id='repdate_text"+rowno+"' style='width:83px;'></td><td style='width:100px'><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");
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
 $("#info").on("click",function(){
		$("#info").popover('show');
	});


	
});	


function fnkeyup(a){
$("#acopndat_text"+a).datepicker({
	dateFormat: "dd-mm-yy",
    changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: "today"
});
$("#repdate_text"+a).datepicker({
	dateFormat: "dd-mm-yy",
    changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: "today"
});

}


function edit_row(no)
{
//alert("happyyyyyyyyyyyyy");
//alert("hiii 2d AGccccccccc" +  edit_row(no));
$(".add").attr("disabled",true);

$("#del_button"+no).addClass('hidden');
$("#addrowno").val("0");
modtyp="M";
document.getElementById("edit_button"+no).style.display="none";
  document.getElementById("save_button"+no).style.display="inline-block";
 document.getElementById("Cancel_btn"+no).style.display="inline-block";
document.getElementById("Cancel_button"+no).style.display="none";

	  var	sancamt =  document.getElementById("sancamt_row"+no);

	  var	sancamt_data = sancamt.innerHTML;



	  var	outamt =  document.getElementById("outamt_row"+no);

	  var	outamt_data = outamt.innerHTML;



	  var	intrate =  document.getElementById("intrate_row"+no);

	  var	intrate_data = intrate.innerHTML;
	  
	  var	intamt =  document.getElementById("intamt_row"+no);

	  var	intamt_data = intamt.innerHTML;
	  
	  var	moninamt =  document.getElementById("moninamt_row"+no);

	  var	moninamt_data = moninamt.innerHTML;



sancamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='sancamt_text"+no+"'  style='width: 83px'; value='"+sancamt_data+"'>";
outamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='outamt_text"+no+"'  style='width: 83px'; value='"+outamt_data+"'>";
intrate.innerHTML="<input type='text' class='decimalPt roundUp'  id='intrate_text"+no+"'  style='width: 83px'; value='"+intrate_data+"'>";
intamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='intamt_text"+no+"'  style='width: 83px'; value='"+intamt_data+"'>";
moninamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='moninamt_text"+no+"'  style='width: 83px'; value='"+moninamt_data+"'>";



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
		
		
		if(document.getElementById("sancamt_text"+no).value==""){
			alert("Enter Sanction Amount ..");
			error="Y"
		}else if(document.getElementById("outamt_text"+no).value==""){
			alert("Enter Outstanding Amount ..");
			error="Y"
		}else if(document.getElementById("intrate_text"+no).value==""){
			alert("Enter Interest Rate ..");
			error="Y"
		}else if(document.getElementById("intamt_text"+no).value==""){
			alert("Enter Interest Amount..");
			error="Y"
		}else if(document.getElementById("moninamt_text"+no).value==""){
			alert("Enter Monthly Interest Amount..");
			error="Y"
		}
		
		
	} else if (modtyp=="A") {
		
	
		if(document.getElementById("acctno_text"+no).value==""){
			alert("Enter Account Number ..");
			error="Y"
		}else if(document.getElementById("acctname_text"+no).value==""){
			alert("Enter Account Name ..");	
			error="Y"
		}else if(document.getElementById("secflag_text"+no).value==""){
			alert("Enter Secured Flag ..");
			error="Y"
		}else if(document.getElementById("sancamt_text"+no).value==""){
			alert("Enter Sanction Amount..");
			error="Y"
		}else if(document.getElementById("outamt_text"+no).value==""){
			alert("Enter Outstanding Amount ..");
			error="Y"
		}else if(document.getElementById("inttyp_text"+no).value==""){
			alert("Enter Interest Type ..");
			error="Y"
		}else if(document.getElementById("intrate_text"+no).value==""){
			alert("Enter Interest Rate ..");
			error="Y"
		}else if(document.getElementById("primsecflg_text"+no).value==""){
			alert("Enter Primary Security Flag..");	
			error="Y"
		}else if(document.getElementById("otherresflg_text"+no).value==""){
			alert("Enter Other Resident Flag..");
			error="Y"
		}else if(document.getElementById("othrassflg_text"+no).value==""){
			alert("Enter Other Asset Flag ..");
			error="Y"
		}else if(document.getElementById("isacdel_text"+no).value==""){
			alert("Enter Is Account Delinquent ..");	
			error="Y"
		}else if(document.getElementById("isacfor_text"+no).value==""){
			alert("Enter Is Account Foreclosed..");
			error="Y"
		}else if(document.getElementById("acfordat_text"+no).value==""){
			alert("Enter Account Foreclosed Date ..");
			error="Y"
		}else if(document.getElementById("acopndat_text"+no).value==""){
			alert("Enter Account Open Date..");
			error="Y"
		}else if(document.getElementById("intamt_text"+no).value==""){
			alert("Enter Interest Amount ..");
			error="Y"
		}else if(document.getElementById("moninamt_text"+no).value==""){
			alert("Enter Monthly Interest Amount ..");
			error="Y"
		}else if(document.getElementById("scode_text"+no).value==""){
			alert("Enter Scheme Code ..");	
			error="Y"
		}else if(document.getElementById("repdate_text"+no).value==""){
			alert("Enter Report Date ..");
			error="Y"
		}
	}
	
	
	
	if (error=="N"){
	
	$("#modflg").val("Y");
	modtyp="M";
	
	
$(".add").attr("disabled",false);
document.getElementById("edit_button"+no).checked = false;

  

var sancamt_val=document.getElementById("sancamt_text"+no).value;
document.getElementById("sancamt_row"+no).innerHTML=sancamt_val;

var outamt_val=document.getElementById("outamt_text"+no).value;
document.getElementById("outamt_row"+no).innerHTML=outamt_val;

var intrate_val=document.getElementById("intrate_text"+no).value;
document.getElementById("intrate_row"+no).innerHTML=intrate_val;

var intamt_val=document.getElementById("intamt_text"+no).value;
document.getElementById("intamt_row"+no).innerHTML=intamt_val;

var moninamt_val=document.getElementById("moninamt_text"+no).value;
document.getElementById("moninamt_row"+no).innerHTML=moninamt_val;


if($("#addrowno").val()=="1"){
	modtyp="A";

   var  acctno_val=document.getElementById("acctno_text"+no).value;	 
document.getElementById("acctno_row"+no).innerHTML=acctno_val;

   var acctname_val=document.getElementById("acctname_text"+no).value;
   document.getElementById("acctname_row"+no).innerHTML=acctname_val;
   
   var secflag_val=document.getElementById("secflag_text"+no).value;
   document.getElementById("secflag_row"+no).innerHTML=secflag_val;
   
   var inttyp_val=document.getElementById("inttyp_text"+no).value;	
  document.getElementById("inttyp_row"+no).innerHTML=inttyp_val;

   var primsecflg_val=document.getElementById("primsecflg_text"+no).value;
	document.getElementById("primsecflg_row"+no).innerHTML=primsecflg_val;
	
   var otherresflg_val=document.getElementById("otherresflg_text"+no).value;
    document.getElementById("otherresflg_row"+no).innerHTML=otherresflg_val;
	   
	var othrassflg_val=document.getElementById("othrassflg_text"+no).value;
	 document.getElementById("othrassflg_row"+no).innerHTML=othrassflg_val;
	   
	var isacdel_val=document.getElementById("isacdel_text"+no).value;	
	 document.getElementById("isacdel_row"+no).innerHTML=isacdel_val;

	 var isacfor_val=document.getElementById("isacfor_text"+no).value;
	document.getElementById("isacfor_row"+no).innerHTML=isacfor_val;
		
    var acfordat_val=document.getElementById("acfordat_text"+no).value;	
	document.getElementById("acfordat_row"+no).innerHTML=acfordat_val;

    var acopndat_val=document.getElementById("acopndat_text"+no).value;
	document.getElementById("acopndat_row"+no).innerHTML=acopndat_val;
			
	 var scode_val=document.getElementById("scode_text"+no).value;
	 document.getElementById("scode_row"+no).innerHTML=scode_val;
			   
	 var repdate_val=document.getElementById("repdate_text"+no).value;
	document.getElementById("repdate_row"+no).innerHTML=repdate_val;
			   
			 
		
}else{
	document.getElementById("Cancel_button"+no).style.display="inline-block";
	document.getElementById("Cancel_btn"+no).style.display="none";
}

document.getElementById("edit_button"+no).style.display="inline-block";
document.getElementById("save_button"+no).style.display="none";

 var acctno=document.getElementById("acctno_row"+no).innerHTML;	 
   var acctname=document.getElementById("acctname_row"+no).innerHTML;
  var secflag=document.getElementById("secflag_row"+no).innerHTML;
  var sancamt=document.getElementById("sancamt_row"+no).innerHTML;
  var outamt=document.getElementById("outamt_row"+no).innerHTML;	
  var inttyp=document.getElementById("inttyp_row"+no).innerHTML;	 
  var intrate=document.getElementById("intrate_row"+no).innerHTML;
 var primsecflg=document.getElementById("primsecflg_row"+no).innerHTML;
 var otherresflg=document.getElementById("otherresflg_row"+no).innerHTML;	
 var othrassflg=document.getElementById("othrassflg_row"+no).innerHTML;	
 var isacdel=document.getElementById("isacdel_row"+no).innerHTML;	 
 var isacfor=document.getElementById("isacfor_row"+no).innerHTML;
var acfordat=document.getElementById("acfordat_row"+no).innerHTML;
var acopndat=document.getElementById("acopndat_row"+no).innerHTML;
var intamt=document.getElementById("intamt_row"+no).innerHTML;	
var moninamt=document.getElementById("moninamt_row"+no).innerHTML;	 
var scode=document.getElementById("scode_row"+no).innerHTML;
var repdate=document.getElementById("repdate_row"+no).innerHTML;
$("#psc3add"+no).addClass("rowaddedd");

 $("#pymdets1 td").attr("padding","8px");

var refePSC103=document.getElementById("refDisplay").value;
sancamt=sancamt.replace(/\,/g,'')
  sancamt=Number(sancamt)
  
  outamt=outamt.replace(/\,/g,'')
  outamt=Number(outamt)
  
  intrate=intrate.replace(/\,/g,'')
  intrate=Number(intrate)
 
  intamt=intamt.replace(/\,/g,'')
  intamt=Number(intamt)
   
  moninamt=moninamt.replace(/\,/g,'')
  moninamt=Number(moninamt)
  
  var rptdate1 = {
     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refePSC103, "acctno":acctno,"acctname":acctname,"secflag":secflag,"sancamt":sancamt,"outamt":outamt,"inttyp":inttyp,"intrate":intrate,"primsecflg":primsecflg,"otherresflg":otherresflg,"othrassflg":othrassflg,"isacdel":isacdel,"isacfor":isacfor,"acfordat":acfordat,"acopndat":acopndat,"intamt":intamt,"moninamt":moninamt,"scode":scode,"repdate":repdate,"modtyp":modtyp
}; 

$.ajax({
url : "PSC0103",
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
		        	
		        	
		        	 var acctno=document.getElementById("acctno_row"+no).innerHTML;	 
		        	   var acctname=document.getElementById("acctname_row"+no).innerHTML;
		        	  var secflag=document.getElementById("secflag_row"+no).innerHTML;
		        	  var sancamt=document.getElementById("sancamt_row"+no).innerHTML;
		        	  var outamt=document.getElementById("outamt_row"+no).innerHTML;	
		        	  var inttyp=document.getElementById("inttyp_row"+no).innerHTML;	 
		        	  var intrate=document.getElementById("intrate_row"+no).innerHTML;
		        	 var primsecflg=document.getElementById("primsecflg_row"+no).innerHTML;
		        	 var otherresflg=document.getElementById("otherresflg_row"+no).innerHTML;	
		        	 var othrassflg=document.getElementById("othrassflg_row"+no).innerHTML;	
		        	 var isacdel=document.getElementById("isacdel_row"+no).innerHTML;	 
		        	 var isacfor=document.getElementById("isacfor_row"+no).innerHTML;
		        	var acfordat=document.getElementById("acfordat_row"+no).innerHTML;
		        	var acopndat=document.getElementById("acopndat_row"+no).innerHTML;
		        	var intamt=document.getElementById("intamt_row"+no).innerHTML;	
		        	var moninamt=document.getElementById("moninamt_row"+no).innerHTML;	 
		        	var scode=document.getElementById("scode_row"+no).innerHTML;
		        	var repdate=document.getElementById("repdate_row"+no).innerHTML;
		        	var refePSC103=document.getElementById("refDisplay").value;
		        	sancamt=sancamt.replace(/\,/g,'')
		        	  sancamt=Number(sancamt)
		        	  
		        	  outamt=outamt.replace(/\,/g,'')
		        	  outamt=Number(outamt)
		        	  
		        	  intrate=intrate.replace(/\,/g,'')
		        	  intrate=Number(intrate)
		        	 
		        	  intamt=intamt.replace(/\,/g,'')
		        	  intamt=Number(intamt)
		        	   
		        	  moninamt=moninamt.replace(/\,/g,'')
		        	  moninamt=Number(moninamt)
		        	  
		        	  var rptdate1 = {
		        	     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refePSC103, "acctno":acctno,"acctname":acctname,"secflag":secflag,"sancamt":sancamt,"outamt":outamt,"inttyp":inttyp,"intrate":intrate,"primsecflg":primsecflg,"otherresflg":otherresflg,"othrassflg":othrassflg,"isacdel":isacdel,"isacfor":isacfor,"acfordat":acfordat,"acopndat":acopndat,"intamt":intamt,"moninamt":moninamt,"scode":scode,"repdate":repdate,"modtyp":modtyp
		        	}; 

		        	$.ajax({
		        	url : "PSC0103",
		        	data : rptdate1  ,
		        			dataType : 'json', 
		        			type : 'POST',
		        			async : true,
		        			 success : function(res) {
		        				 console.log(res.refno);
		        				//	alert("refeDCG100"+refeDCG100);
		        				
		        				// alert("sfsdf");
		        				 $("#refDisplay").val(res.refno);
			   
				  
		        				 $("#psc3add"+no).closest("tr").remove();

				   
		        				
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
				"acctno":$("#acctno_row"+no).text(),"repdate":'<%=dt2%>'
		};
		
		 $.ajax({
		     url : "PSC0103cancel",
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
	 	
	 var sancamt_val=document.getElementById("sancamt_text"+no).value;
	 document.getElementById("sancamt_row"+no).innerHTML=sancamt_val;

	 var outamt_val=document.getElementById("outamt_text"+no).value;
	 document.getElementById("outamt_row"+no).innerHTML=outamt_val;

	 var intrate_val=document.getElementById("intrate_text"+no).value;
	 document.getElementById("intrate_row"+no).innerHTML=intrate_val;

	 var intamt_val=document.getElementById("intamt_text"+no).value;
	 document.getElementById("intamt_row"+no).innerHTML=intamt_val;

	 var moninamt_val=document.getElementById("moninamt_text"+no).value;
	 document.getElementById("moninamt_row"+no).innerHTML=moninamt_val;
			$("#edit_button"+no).show();
			/* document.getElementById("edit_button"+no).style.display="block"; */
			document.getElementById("save_button"+no).style.display="none";
			document.getElementById("Cancel_btn"+no).style.display="none";
			 location.reload(true); 
			 var sancamt=document.getElementById("sancamt_row"+no).innerHTML;
       	  var outamt=document.getElementById("outamt_row"+no).innerHTML;
    	  var intrate=document.getElementById("intrate_row"+no).innerHTML;

       	var intamt=document.getElementById("intamt_row"+no).innerHTML;	
    	var moninamt=document.getElementById("moninamt_row"+no).innerHTML;	 

       	  
       	  if($("#psc3add"+no).hasClass( "rowaddedd" )){
				  
				  document.getElementById("Cancel_button"+no).style.display="inline-block";


			  }else{
				  document.getElementById("Cancel_button"+no).style.display="none";
			  }
			  
			
	 }

	 
	 function Canadd_row(no){
		 
		  /* document.getElementById("del_button"+no).style.display="inline-block"; */

																	   

		 if($("#psc3add"+no).hasClass( "rowaddedd" )){
			
			var detcancel={
					"acctno":$("#acctno_row"+no).text(),"repdate":'<%=dt2%>'
			};
			

			 $.ajax({
			     url : "PSC0103cancel",
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
		 $("#psc3add"+no).remove();
		 
	 }


</script>
<SCRIPT>

function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_PSC0103_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>

<body>


	<div class="container">

		<div class="loader"></div>

		<form class="form-horizontal" method="post" name="PSC0103Form"
			enctype="multipart/form-data">
			<div class="tab-content">
				<input type="hidden" id="modflg"> <input type="hidden"
					id="modtyp"> <input type="hidden" id="savecheck">

				<div class="active psc0105" id="tab2"
					style="width: 968px; padding-top: 1px; margin-top: -17px;">
					<div style="text-align: left; margin-top: 40px;">
						<font size="2" style="font-size: 15px;"><b>PSC0103-Housing
								credit to Household </b></font>
					</div>
					<ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">





						<li class=" pull-right list" onclick="functionli(2);"><a
							href="#tab2" data-toggle="tab"><span class="headingtab">2</span></a></li>


						<li class=" pull-right active list" onclick="functionli(1);"><a
							href="#tab1" data-toggle="tab"><span class="headingtab">
									1 </span></a></li>




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
								</span></a> <a class="btn btn-xs btn-primary summ" href="#tab2"
								data-toggle="tab"><span class="headingtab ">Summary
								</span></a> <a id="btndwnld"><i
									class="glyphicon glyphicon-download-alt"
									style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><select
								id="dnloadfrmt" style="border-radius: 4px; margin-left: 10px;"><option
										value="pdf">pdf</option>
									<option value="excel">Excel</option></select>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table>




					<!--******************SUMMARY SECTION2********************************-->

					<table class="table" id="tb2"
						style="width: 100%; display: none; margin-top: -20px;">
						<tr>
							<th rowspan="3" style="text-align: center;">New housing
								credit during the reporting period</th>
							<th rowspan="3" style="text-align: center;"></th>
							<th colspan="2" style="text-align: center;">Secured by
								Primary Residential Property</th>
							<th colspan="2" style="text-align: center;">Secured by Other
								Residential Property</th>
							<th colspan="2" style="text-align: center;">Secured by Other
								Assets</th>
							<th colspan="2" style="text-align: center;">Unsecured</th>
							<th colspan="2" style="text-align: center;">Total</th>
							<TH ROWSPAN="3" style="text-align: center;">Select</TH>
						</tr>



						<tr>
							<th style="text-align: center;">Amount/Number</th>
							<th style="text-align: center;">Rate (%)</th>
							<th style="text-align: center;">Amount/Number</th>
							<th style="text-align: center;">Rate (%)</th>
							<th style="text-align: center;">Amount/Number</th>
							<th style="text-align: center;">Rate (%)</th>
							<th style="text-align: center;">Amount/Number</th>
							<th style="text-align: center;">Rate (%)</th>
							<th style="text-align: center;">Amount/Number</th>
							<th style="text-align: center;">Average Rate</th>
						</tr>
						<tr>
							<th style="text-align: center;">K</th>
							<th style="text-align: center;">L</th>
							<th style="text-align: center;">M</th>
							<th style="text-align: center;">N</th>
							<th style="text-align: center;">O</th>
							<th style="text-align: center;">P</th>
							<th style="text-align: center;">Q</th>
							<th style="text-align: center;">R</th>
							<th style="text-align: center;">S</th>
							<th style="text-align: center;">T</th>
						</tr>

						<tbody class="databody" id="sec2"></tbody>
					</table>

					<!--******************SUMMARY SECTION1********************************-->

					<table class="table" id="tb1"
						style="width: 100%; display: none; margin-top: -20px;">



						<tr>
							<th style="text-align: center;" rowspan="3">Outstanding
								housing credit as at end of period</th>
							<th style="text-align: center;" rowspan="3"></th>
							<th style="text-align: center;" colspan="2">Secured by
								Primary Residential Property</th>
							<th style="text-align: center;" colspan="2">Secured by Other
								Residential Property</th>
							<th style="text-align: center;" colspan="2">Secured by Other
								Assets</th>
							<th style="text-align: center;" colspan="2">Unsecured</th>
							<th style="text-align: center;" colspan="2">Total</th>
							<th style="text-align: center;" ROWSPAN="3">Select</th>
						</tr>



						<tr>
							<th style="text-align: center;">Amount/Number</th>
							<th style="text-align: center;">Rate (%)</th>
							<th style="text-align: center;">Amount/Number</th>
							<th style="text-align: center;">Rate (%)</th>
							<th style="text-align: center;">Amount/Number</th>
							<th style="text-align: center;">Rate (%)</th>
							<th style="text-align: center;">Amount/Number</th>
							<th style="text-align: center;">Rate (%)</th>
							<th style="text-align: center;">Amount/Number</th>
							<th style="text-align: center;">Average Rate</th>
						</tr>
						<tr>
							<th style="text-align: center;">A</th>
							<th style="text-align: center;">B</th>
							<th style="text-align: center;">C</th>
							<th style="text-align: center;">D</th>
							<th style="text-align: center;">E</th>
							<th style="text-align: center;">F</th>
							<th style="text-align: center;">G</th>
							<th style="text-align: center;">H</th>
							<th style="text-align: center;">I</th>
							<th style="text-align: center;">J</th>
						</tr>

						<tbody class="databody" id="sec1"></tbody>
					</table>



					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
						<!-- <button type="button" class="btn btn-xs btn-primary"   value="back" id="btnpre">Previous</button> -->

						<button type="button" class="btn btn-xs btn-primary" value="Excel"
							id="btnSave">Save</button>

						<button type="button" class="btn btn-xs btn-primary"
							 value="Excel" id="btnXML">Gen XML
							Sum</button>

						<!-- <button type="button" class="btn btn-xs btn-primary"   value="back" id="btnnext">Next</button> -->
						<button type="button" class="btn btn-xs btn-primary btnback" value="back"
							id="btnback">Back</button>
					</div>

				</div>






				<div class="tab-content">
					<input type="hidden" id="rowno"> <input type="hidden"
						id="addrowno">
					<div class="active" id="tab1"
						style="width: 2393px; padding-top: 1px; margin-top: -17px;">
						<div style="text-align: left; margin-top: 40px;">
							<font size="2" style="font-size: 13px;"><b> <b
									id="sub" Style="display: none"></b></b></font> <br>
							<b style="font-size: 15px;">PSC0103-Housing credit to
								Household <b id="sub" style="display: none"></b>
							</b>
						</div>
						<br>




						<table class="" style="width: 2393px; height: 50px;">
							<tr>
								<td style="background-color: #bbc3cb; width: 250px;"><font
									size="1"><input type="hidden"
										style="color: #0c1190; font-size: 11px;" class="repdisp"
										id="refDisplay"></b></font></td>
								<td
									style="text-align: center; background-color: #bbc3cb; width: 325px;"></td>
								<td style="background-color: #bbc3cb; text-align: right;"><a
									class="btn btn-xs btn-primary det" href="#tab1" id="det"
									data-toggle="tab"><span class="headingtab"> Details
									</span></a> <a class="btn btn-xs btn-primary" href="#tab2"
									data-toggle="tab" id="sumfirst"><span class="headingtab">Summary
									</span></a><a id="btnExcel"><i
										class="glyphicon glyphicon-download-alt"
										style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a
									class="btn btn-xs btn-primary add"
									style="width: 45px; margin-left: 15px;" href="#"
									data-toggle="tab"><span class="headingtab" id="addrow">Add
									</span></a><a class="btn btn-default btn-xs btn-primary"
									style="margin-left: 10px;" id="btnfilter"><span
										class="glyphicon glyphicon-filter"></span> Filter</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>
						</table>

						<div class="panel panel-primary filterable">

							<table class="table" id="detb1"
								style="width: 100%; display: none; margin-top: -20px;">
								<tr>
								<tr class="filters btnfopn" >
									<th rowspan="2" style="text-align: center"><textarea
										type="text" id="acctno" onkeyup="myFunction(this.id,0)"
										style="width: 100px;" class="form-control2"
										placeholder="Account Number" disabled></textarea></th>
									<th style="text-align: center"><textarea type="text"
										id="acctname" onkeyup="myFunction(this.id,1)"
										style="width: 300px;" class="form-control2"
										placeholder="Account Name" disabled></textarea></th>
									<th style="text-align: center"><textarea type="text"
										id="secflag" onkeyup="myFunction(this.id,2)"
										style="width: 100px;" class="form-control2"
										placeholder="Secured Flag" disabled></textarea></th>
									<th style="text-align: center"><textarea type="text"
										id="sancamt" onkeyup="myFunction(this.id,3)"
										style="width: 100px;" class="form-control2"
										placeholder="Sanction Amount" disabled></textarea></th>
									<th rowspan="2" style="text-align: center"><textarea
										type="text" id="outamt" onkeyup="myFunction(this.id,4)"
										style="width: 100px;" class="form-control2"
										placeholder="Outstanding Amount" disabled></textarea></th>

									<th rowspan="2" style="text-align: center"><textarea
										type="text" id="inttyp" onkeyup="myFunction(this.id,5)"
										style="width: 100px;" class="form-control2"
										placeholder="Interest Type" disabled></textarea></th>

									<th rowspan="2" style="text-align: center"><textarea
										type="text" id="intrate" onkeyup="myFunction(this.id,6)"
										style="width: 63px;" class="form-control2"
										placeholder="Interest Rate" disabled></textarea></th>

									<th rowspan="2" style="text-align: center"><textarea
										type="text" id="primsecflg" onkeyup="myFunction(this.id,7)"
										style="width: 100px;" class="form-control2"
										placeholder="Primary Security Flag" disabled></textarea></th>

									<th rowspan="2" style="text-align: center"><textarea
										type="text" id="otherresflg" onkeyup="myFunction(this.id,8)"
										style="width: 74px;" class="form-control2"
										placeholder="Other Resident Flag" disabled></textarea></th>

									<th rowspan="2" style="text-align: center"><textarea
										type="text" id="othrassflg" onkeyup="myFunction(this.id,9)"
										style="width: 73px;" class="form-control2"
										placeholder="Other Asset Flag" disabled></textarea></th>

									<th rowspan="2" style="text-align: center"><textarea
										type="text" id="isacdel" onkeyup="myFunction(this.id,10)"
										style="width: 100px;" class="form-control2"
										placeholder="Is Account Delinquent" disabled></textarea></th>

									<th rowspan="2" style="text-align: center"><textarea
										type="text" id="isacfor" onkeyup="myFunction(this.id,11)"
										style="width: 100px;" class="form-control2"
										placeholder="Is Account Foreclosed" disabled></textarea></th>

									<th rowspan="2" style="text-align: center"><textarea
										type="text" id="acfordat" onkeyup="myFunction(this.id,12)"
										style="width: 100px;" class="form-control2"
										placeholder="Account Foreclosed Date" disabled></textarea></th>
									<th rowspan="2" style="text-align: center"><textarea
										type="text" id="acopndat" onkeyup="myFunction(this.id,13)"
										style="width: 75px;" class="form-control2"
										placeholder="Account Open Date" disabled></textarea></th>
									<th rowspan="2" style="text-align: center"><textarea
										type="text" id="intamt" onkeyup="myFunction(this.id,14)"
										style="width: 100px;" class="form-control2"
										placeholder="Interest Amount" disabled></textarea></th>
									<th rowspan="2" style="text-align: center"><textarea
										type="text" id="moninamt" onkeyup="myFunction(this.id,15)"
										style="width: 100px;" class="form-control2"
										placeholder="Monthly Interest Amount" disabled></textarea></th>
									<th rowspan="2" style="text-align: center"><textarea
										type="text" id="scode" onkeyup="myFunction(this.id,16)"
										style="width: 100px;" class="form-control2"
										placeholder="Scheme Code" disabled></textarea></th>
									<th rowspan="2" style="text-align: center"><textarea
										type="text" id="repdate" onkeyup="myFunction(this.id,17)"
										style="width: 85px;" class="form-control2"
										placeholder="Report Date" disabled></textarea></th>
									<th id="modify">Modify</th>
								</tr>


								</thead>

								<tbody class="databody" id="det1">





								</tbody>


							</table>

						</div>
<div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
     
      <button type="button" class="btn btn-xs btn-primary btnback" value="back" id="btnback">Back</button></div> 
          
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