
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="bean.XBRLSUP1500Bean,dao.XBRLSUP1500Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>

<%@ page
	import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat,utilities.NullCheck"%>


<%  
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
  DecimalFormat df = new DecimalFormat("#,###.00");  
  %>

<%
    DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Date date = new Date();	
	String username = session.getAttribute("userName").toString();
    String curdate = dateFormat.format(date);
	%>







<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh"
	content="<%=session.getMaxInactiveInterval() %>;url=XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" />

</head>

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
.table>thead>tr>th {
	vertical-align: top;
	border-bottom: 2px solid #ddd;
}

.tables {
	width: 109%;
	max-width: 117%;
	margin-bottom: 20px;
}

.glyphicon {
	font-weight: 600;
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

.clr {
	color: #0c0b0b;
	background-color: #f5f5f5;
	border-color: #f5f5f5;
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

form {
	margin: 6px 0;
}

.next, .previous {
	color: blue;
	text-decoration: underline;
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
}

form {
	margin: -7px 0;
}

form input, button {
	padding: 5px;
}

table {
	width: 109%;
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

#pymdets td {
	padding: 8px;
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
	padding: 1px 1px;
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

.form-control2 {
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
	padding-right: 208px;
}

/* 
 .tab-content .tab-pane {
 
   display: block;
}

.tab-content .tab-pane.active {
  display: none;
}
   */
.next, .previous {
	cursor: pointer;
}

.alnum {
	text-align: right;
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
/* 
.loader {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url('../../images/Loader.gif') 30% 30% no-repeat rgb(249,249,249);
    opacity: .8;
} */
.tab-pane, #tbcates {
	display: none;
}

.tab-pane, #tbcates {
	display: none;
}
</style>




<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){

	
	
	$("#addrowno").val("0");
	
	
	fnload('<%=typo%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');
	
	$("#sumfirst").on("click",function(){ 
	
		 location.href = "XBRL_REP_SUP1500_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
	<%-- 	fnsummary('<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>');  --%>
			
		 });
	$(".det").on("click",function(){
		
		<%-- fundetails('<%=repname%>','<%=ReporefSeq%>',0,'<%=dt2%>','<%=dt1%>',"onload");  --%>
		location.href = "XBRL_REP_SUP1500_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '#btnback').click(function() {
		 location.href="XBRL_CRT_SUP1500_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	$('#btnExcel').click(function() {
	
		 SUP1500Form.action = "SUP1500EXCELREPORT.action?method=SUP1500EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 SUP1500Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 SUP1500Form.action = "SUP1500EXCELSum.action?method=SUP1500EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 SUP1500Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 SUP1500Form.action = "SUP1500PDFREPORT.action?method=SUP1500PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 SUP1500Form.submit();
		}
	});
	$('#btnXML').click(function() {
		//alert("pym0100EXCELSum");//return false;
		
		  SUP1500Form.action = "XMLDOWNLOADs15.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 SUP1500Form.submit(); 
	});
	var save=0;

$('#btnSave').on("click",function() {
	 /*  $("#divLoading").addClass('show'); */
	  var datasum={
				"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").text()
	};
	$.ajax({
		url:"saveSums15",
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

			/*  $("#divLoading").removeClass('show'); */
		}
	});  
	 
		 
	 
});

	$("#addrow").on("click",function(){
		var rowno=$("#rowno").val();
		$("#addrowno").val("1"); 
		$("#pymdets").prepend("<tr><td></td><td ></td><td id='resident_row"+rowno+"' ><input type='text' id='resident_text"+rowno+"' style='width: 50px;'></td><td id='nonresident_row"+rowno+"' ><input type='text' id='nonresident_text"+rowno+"' style='width: 100px;'></td><td ></td><td hidden id='rcrusrid_row"+rowno+"'></td><td hidden id='rcrtme_row"+rowno+"'></td><td hidden id='lchusrid_row"+rowno+"'></td><td hidden id='lchtme_row"+rowno+"'></td><td hidden id='del_row"+rowno+"'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");


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

		/*  $( "#trdate_text"+rowno ).datepicker({
		
    	
	   	  
		   dateFormat: 'dd-mm-yy',
			changeMonth: false,//this option for allowing user to select month
		  changeYear: false//this option for allowing user to select from year range
		  
	   }); */
		});


		
});	



</script>



<script>
 

	
   
function edit_row(no)
{
	//alert("happyyyyyyyyyyyyy");
//alert("hiii 2d AGccccccccc" +  edit_row(no));

$("#addrowno").val("0");
 	
 	document.getElementById("edit_button"+no).style.display="none";
 	  document.getElementById("save_button"+no).style.display="block";
 		  

 
 var	nonresident =  document.getElementById("nonresident_row"+no);
 
 var	nonresident_data = nonresident.innerHTML;
 
  
 
 nonresident.innerHTML="<input type='text' class='decimalPt roundUp'  id='nonresident_text"+no+"'  style='width: 83px'; value='"+nonresident_data+"'>";
 

 
 
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

	
 
}

function save_row(no)
{
	
	document.getElementById("edit_button"+no).checked = false;
	
	
	var nonresident_val=document.getElementById("nonresident_text"+no).value;
	
	document.getElementById("nonresident_row"+no).innerHTML=nonresident_val;
	
	
	if($("#addrowno").val()=="1"){
		
	   
	 /*  var instancname_val=document.getElementById("instancname_text"+no).value;
	   document.getElementById("instancname_row"+no).innerHTML=instancname_val; */
	   

	   
	  var instanccode_val=document.getElementById("instanccode_text"+no).value;
	  document.getElementById("instanccode_row"+no).innerHTML=instanccode_val;

	  var resident_val=document.getElementById("resident_text"+no).value;
	  document.getElementById("resident_row"+no).innerHTML=resident_val;
	  	  
	
	  
	 /*  var total_val=document.getElementById("total_text"+no).value;
	  document.getElementById("total_row"+no).innerHTML=total_val;
	   */
	 
	 
	  
  
	 /*  document.getElementById("rcrusrid_row"+no).innerHTML="";
	  document.getElementById("rcrtme_row"+no).innerHTML="";
	  document.getElementById("lchusrid_row"+no).innerHTML="";
	  document.getElementById("lchtme_row"+no).innerHTML=""; */
	  
	 // document.getElementById("del_row"+no).innerHTML="";
	}
	
	document.getElementById("edit_button"+no).style.display="block";
	document.getElementById("save_button"+no).style.display="none";

	

	 /*  var instancname=document.getElementById("instancname_row"+no).innerHTML; */
	  
	  var instanccode=document.getElementById("instanccode_row"+no).innerHTML;
	  
	  var resident=document.getElementById("resident_row"+no).innerHTML;
	  
	  var nonresident=document.getElementById("nonresident_row"+no).innerHTML;
	 
/* 	  var total=document.getElementById("total_row"+no).innerHTML;
 */	  
	 
	
	
	  
/* 	 var rcrusrid=document.getElementById("rcrusrid_row"+no).innerHTML;
	var rcrtme=document.getElementById("rcrtme_row"+no).innerHTML;
	 var lchusrid=document.getElementById("lchusrid_row"+no).innerHTML;
	 var lchtme=document.getElementById("lchtme_row"+no).innerHTML; */
	// var del=document.getElementById("del_row"+no).innerHTML;  
	
	 $("#pymdets td").attr("padding","8px");
	
	 var refeSUP15=document.getElementById("refDisplay").innerHTML;
	
	/* resident=resident.replace(/\,/g,'')
	  resident=Number(resident)

	  nonresident=nonresident.replace(/\,/g,'')
	  nonresident=Number(nonresident) */
	  
	 

	
	 var rptdate1 = {
			 "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeSUP15, "instanccode": instanccode, "resident": resident,"nonresident": nonresident
			}; 
	 $.ajax({
		 url : "SUP1500",
	     data : rptdate1  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 console.log(res.refno);
				//	alert("refePYM100"+refePYM100);
				
				// alert("sfsdf");
				 $(".repdisp").html(res.refno);
				 

				
				
			}
		}); 
	

	
}

 

</script>

<script>
$(document).ready(function(){
	
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





<script>

function fnload(z,e,b,c,a,f,g){
	

	
	
	if(z=="load"){
		$(".det").addClass("clr");
		$(".tab-pane,#tbcates").hide();
		$(".active,#tbcate").show(); 
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
			
			 $(".repdisp").text(refno);
			 var srno=1;
			 $("#divLoading").addClass("show");
			 /*   $(".loader").fadeOut("slow"); */
				 var SUPd = {
						 "repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"curr":g  
					}; 
				 //alert("inside the ajaxxxxxxxxxxxxx");
				$.ajax({
					url : "sup1500details",
					data : SUPd,
					dataType : 'json',
					type : 'POST',
					async : true,
					success : function(res) {	
					//	alert("refePYM100"+refePYM100);
						
						  $("#pymdets tr").remove();						 
						  //alert("hi this is details");
						var b=JSON.parse(res. detSUP1500);
						 console.log(b);
						
									//alert(f);
					
							 	if(f=="onload"){
							 		$("#modify").show();
							 		for(var i=0;i<b.length;i++){
							 			
							 		  $("#pymdets").append(
												 
																							
												 "<tr>"

							                    +"<td id='instancname_row"+srno+"'>"+b[i].instancname+"</td>"
							                      +"<td  id='instanccode_row"+srno+"' >"+b[i].instanccode+"</td>"
							                      +"<td  class='sumder alnum'id='resident_row"+srno+"' >"+b[i].resident+"</td>"
							                      +"<td  class='sumder alnum' id='nonresident_row"+srno+"' >"+b[i].nonresident+"</td>"
							                      +"<td  class='sumder alnum' id='total_row"+srno+"' >"+b[i].total+"</td>"
							                      
							                     	
							                      
							                      +"<td  hidden id='del_row"+srno+"'>"+b[i].delflg+"</td>"	
							                      +"<td  hidden id='rcrusrid_row"+srno+"'>"+b[i].rcrusrid+"</td>"	
							                      +"<td  hidden id='rcrtme_row"+srno+"'>"+b[i].rcrtime+"</td>"	
							                      +"<td  hidden id='lchusrid_row"+srno+"'>"+b[i].lchgusrid+"</td>"	
							                      +"<td  hidden id='lchtme_row"+srno+"'>"+b[i].lchgtime+"</td>"		
							                     
							                      
							                    
							                      +"<td ><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td>"	
							                    
							                     
							                     
							                      
							                    +"</tr>" ) ;  
							 		 
									/*  $("#chqamt_row"+srno+"").html(parseFloat(document.getElementById("chqamt_row"+srno+"").innerHTML).toFixed(2)); */
									
									 srno++;
									 
									 
									 
										} $("#divLoading").removeClass('show');
									$("#rowno").val(srno);
							 	}
								
							 	else if(f=="frmsum"){
							 		$(".add").hide();
							 		/* $("").padStart(6, "0");.padStart(6, "0"); */
							 		$("#modify").hide();
							 		for(var i=0;i<b.length;i++){
							 			
							 		  $("#pymdets").append(
												 
												
												
												 "<tr>"
												
						                       +"<td  id='instancname_row"+srno+"'>"+b[i].instancname+"</td>"
							                      +"<td  id='instanccode_row"+srno+"' >"+b[i].instanccode+"</td>"
							                      +"<td class='sumder alnum' id='resident_row"+srno+"' >"+b[i].resident+"</td>"
							                      +"<td class='sumder alnum' id='nonresident_row"+srno+"' >"+b[i].nonresident+"</td>"
							                      +"<td class='sumder alnum' id='total_row"+srno+"' >"+b[i].total+"</td>"
							                      
							                      
							                      +"<td  hidden id='del_row"+srno+"'>"+b[i].delflg+"</td>"	
							                      +"<td  hidden id='rcrusrid_row"+srno+"'>"+b[i].rcrusrid+"</td>"	
							                      +"<td  hidden id='rcrtme_row"+srno+"'>"+b[i].rcrtime+"</td>"	
							                      +"<td  hidden id='lchusrid_row"+srno+"'>"+b[i].lchgusrid+"</td>"	
							                      +"<td  hidden id='lchtme_row"+srno+"'>"+b[i].lchgtime+"</td>"	
							                      
							                    
							                   /*    +"<td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td>" */	
							                    							                     
							                      
							                    +"</tr>" ) ;  
									 
									/*  $("#chqamt_row"+srno+"").html(parseFloat(document.getElementById("chqamt_row"+srno+"").innerHTML).toFixed(2)); */
									
									 srno++;
									 
									 
									 
										}
							 		 $("#divLoading").removeClass('show');
							 	}
								
							 $("#divLoading").removeClass('show'); 
							$('.alnum').mask("#,##0.00", {reverse: true}); 
						
							}						
				
				});   
	 }else{
		 $("#divLoading").addClass('show');
		 $(".active,#tbcate").hide(); 
			$(".tab-pane,#tbcates").show(); 
			$(".summ").addClass("clr");
			$("#tab2").show();
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
			
			  $("#divLoading").addClass("show"); 
			
			 $(".repdisp").text(refno);
			
				$("#test tr").children().detach().remove();
			
				var rptdate1 = {
						"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"curr":g  
						}; 
				 
				 $.ajax({
				     url : "SUP1500SUM",
				     data : rptdate1  ,
						dataType : 'json', 
						type : 'POST',
						async : true,
						 success : function(res) {
							 //console.log(res.refnoAB);
					//alert("hi this is summary");
							
					console.log(res.summarySUP1500);
				
					var b=JSON.parse(res.summarySUP1500);
					
					var k=1;
					var cnt1=1;
					
					
					for (var i = 0; i < b.length; i++) {
					
						
						//$('.alnum').mask("#,##0.00", {reverse: true});
					
					if(b.length==i+1){
						
						$("#test").append('<tr><td id="mt'+cnt1+'">'+b[i].instancname+'</td><td  id="it'+cnt1+'" style="text-align:right">'+b[i].instanccode+'</td><td id="ite'+cnt1+'" class=alnum style="text-align:right">'+b[i].resident+'</td><td id="ited'+cnt1+'" class=alnum style="text-align:right">'+b[i].nonresident+'</td><td id="itedt'+cnt1+'" class=alnum style="text-align:right">'+b[i].total+'</td><td><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td></tr>');	
						
					}	  else{
						$("#test").append('<tr><td id="mt'+cnt1+'">'+b[i].instancname+'</td><td  id="it'+cnt1+'" style="text-align:right">'+b[i].instanccode+'</td><td id="ite'+cnt1+'" class=alnum style="text-align:right">'+b[i].resident+'</td><td id="ited'+cnt1+'" class=alnum style="text-align:right" >'+b[i].nonresident+'</td><td id="itedt'+cnt1+'" class=alnum style="text-align:right">'+b[i].total+'</td><td><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td></tr>');	
						
					} 
					//alert($("#it"'+cnt1+'")val());
						//  $("#it"+cnt1+" ").html(parseFloat(document.getElementById("it"+cnt1+"").innerHTML).toFixed(2));
					//	$("#ite"+cnt1+" ").html(parseFloat(document.getElementById("ite"+cnt1+"").innerHTML).toFixed(2));
						
						cnt1++;
						
					} 
					
					  $("#divLoading").removeClass('show'); 
					 $('.alnum').mask("#,##0.00", {reverse: true});

						 }
						 });	
	 }
}

function fnloads(cnt){
	
	<%-- "load","<%=dt1%>","<%=dt2%>","'+refno+'","'+cnt1+'","<%=reptype%>","frmsum" --%>
	location.href = "XBRL_REP_SUP1500_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
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
	if(b==1 ||b==2 || b==3 || b==4){
		
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

.databody td {
	border: 1px solid #ddd;
}
</style>



<body>
	<div class="container">


		<form class="form-horizontal" method="post" name="SUP1500Form"
			enctype="multipart/form-data">


			<div id="nav">
				<div class="loader"></div>

				<div id="tab3">




					<div class="tab-content">
						<input type="hidden" id="rowno"> <input type="hidden"
							id="addrowno">
						<div class="active" id="tab1"
							style="width: 1121px; padding-top: 1px; margin-top: -17px;">
							<div style="margin-top: 40px;">
								<font size="2" style="font-size: 13px;"><b
									style="font-size: 13px;"> SUP1500 - <b id="sub"
										style="display: none"></b></b><b>Assessment of Domestic -
										Systemically Important Banks<b id="sub" Style="display: none"></b>
								</b></font> <br>
								<br>
							</div>
							<div id="divLoading"></div>
							<table class="table" style="width: 1121px; height: 50px;">
								<tr>
									<td style="background-color: #bbc3cb; width: 250px;"><font
										size="1"><b style="color: #0c1190; font-size: 11px;">
												Report Ref No : </b></font> <font size="1"><b
											style="color: #0c1190; font-size: 11px;" class="repdisp"
											id="refDisplay"></b></font></td>
									<td
										style="text-align: right; background-color: #bbc3cb; width: 325px;"></td>
									<td style="background-color: #bbc3cb; text-align: right;"><a
										class="btn btn-xs btn-primary det" href="#tab1" id="det"
										data-toggle="tab"><span class="headingtab">
												Details </span></a> <a class="btn btn-xs btn-primary summ" href="#tab1"
										data-toggle="tab"><span class="headingtab" id="sumfirst">Summary
										</span></a><a id="btnExcel"><i
											class="glyphicon glyphicon-download-alt"
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
										<tr class="filters">
											<th style="text-align: center;" rowspan="3"><input
												type="text" id="instancname1"
												style="width: 400px; text-align: center"
												onkeyup="myFunction(this.id,0)" class="form-control2"
												placeholder="" disabled></th>
											<th style="text-align: center;" rowspan="3"><input
												type="text" id="modez1"
												style="width: 125px; text-align: center"
												onkeyup="myFunction(this.id,1)" class="form-control2"
												placeholder="" disabled></th>
										</tr>
										<tr class="filters">
											<th style="text-align: center;" colspan="1"><input
												type="text" id="res"
												style="width: 150px; text-align: center;"
												onkeyup="myFunction(this.id,2)" class="form-control2"
												placeholder="Resident" disabled></th>
											<th style="text-align: center;" colspan="1"><input
												type="text" id="nonres"
												style="width: 150px; text-align: center;"
												onkeyup="myFunction(this.id,3)" class="form-control2"
												placeholder="Non-resident" disabled></th>
											<th style="text-align: center;" colspan="1"><input
												type="text" id="tot"
												style="width: 150px; text-align: center;"
												onkeyup="myFunction(this.id,4)" class="form-control2"
												placeholder="Total" disabled></th>
											<th id="modify">Modify</th>
										</tr>
										<tr>
											<th>A</th>
											<th>B</th>
											<th>C</th>

										</tr>


										</tr>

									</thead>

									<tbody class="databody" id="pymdets">


									</tbody>


								</table>
							</div>


						</div>


						<div class="tab-pane" id="tab2"
							style="width: 968px; padding-top: 1px; margin-top: -17px;">
							<div style="margin-top: 40px;">
								<font size="2" style="font-size: 13px;"><b
									style="font-size: 13px;"> SUP1500 - <b id="sub"
										style="display: none"></b></b><b>Assessment of Domestic -
										Systemically Important Banks<b id="sub" Style="display: none"></b>
								</b></font> <br>
								<br>
							</div>

							<div id="divLoading"></div>
							<table class="table" style="width: 100%; height: 50px;">
								<tr>
									<td style="background-color: #bbc3cb;"><font size="1"><b
											style="color: #0c1190; font-size: 11px;"> Report Ref No :
										</b></font> <font size="1"><b
											style="color: #0c1190; font-size: 11px;" class="repdisp"
											id="refDisplay"></b></font></td>
									<td
										style="text-align: right; background-color: #bbc3cb; width: 325px;"></td>
									<td style="background-color: #bbc3cb; text-align: right;"><a
										class="btn btn-xs btn-primary det" href="#tab1" id="det"
										data-toggle="tab"><span class="headingtab">
												Details </span></a> <a class="btn btn-xs btn-primary summ" href="#tab2"
										data-toggle="tab"><span class="headingtab" id="sumfirst">Summary
										</span></a><a id="btndwnld"><i
											class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><select
										id="dnloadfrmt" style="border-radius: 4px; margin-left: 10px;"><option
												value="pdf">pdf</option>
											<option value="excel">Excel</option></select></td>
								</tr>
							</table>
							<table class="table" id="tbcates" border="1"
								style="margin-top: -21px;">

								<thead>


									<tr>
										<th rowspan="3" id="instancname"
											style="width: 400px; text-align: center;"></th>
										<th rowspan="3" id="modez"
											style="width: 125px; text-align: center;"></th>
									</tr>
									<tr>
										<th colspan="1" id="noofitemsz"
											style="width: 150px; text-align: center;">Resident</th>
										<th colspan="1" id="amtz"
											style="width: 150px; text-align: center;">Non-resident</th>
										<th colspan="1" id="amtz"
											style="width: 150px; text-align: center;">Total</th>
										<th id="rad">Select</th>
									</tr>
									<tr>
										<th>A</th>
										<th>B</th>
										<th>C</th>
										<th></th>
									</tr>







								</thead>

								<tbody class="databody" id="test">
								</tbody>
							</table>

							<div class="modal-footer">

								<button type="button" class="btn btn-xs btn-primary"
									id="btnhome">Home</button>
								<!--     <button type="button" class="btn btn-xs btn-primary" value="Excel" >Generate Excel</button> -->
								<!-- <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnExcelSum">Gen Sum</button> -->
								<!--   <button type="button" class="btn btn-xs btn-primary" value="Pdf" id="btnPdf">Generate PDF</button> -->
								<button type="button" class="btn btn-xs btn-primary"
									value="Excel" id="btnSave">Save</button>

								<button type="button" class="btn btn-xs btn-primary"
									style="display: none" value="Excel" id="btnXML">Gen
									XML Sum</button>

								<button type="button" class="btn btn-xs btn-primary"
									value="back" id="btnback">Back</button>
							</div>


						</div>



					</div>

				</div>




			</div>

		</form>


	</div>


</body>
</html>