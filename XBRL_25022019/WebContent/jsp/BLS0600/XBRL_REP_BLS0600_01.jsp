<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLBLS0600Bean,dao.XBRLBLS0600Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    <%@ page import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat,utilities.NullCheck"%>
    

  
    
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
 
 
 
  <%--  <%
   
   XBRLPYM0100Dao dmd=new XBRLPYM0100Dao();
   ArrayList<XBRLPYM0100Bean> list=new ArrayList<XBRLPYM0100Bean>();
    
   
  // ArrayList<XBRLPYM0100Bean> listsum=dmd.xbrlpymsum(dt1,dt2,ReporefSeq);
	  
	  DecimalFormat df1 = new DecimalFormat("0.00");
	//out.print(repname+" "+ReporefSeq);
	  if(repname == null ){ 
		//  out.println("if");
		   
	//	 list=dmd.xbrlpym400(dt1,dt2);
	 } 

	   else{
		// out.println("else");
	//list=dmd.xbrlpym4RR(dt1,dt2,ReporefSeq);	
		  

	      }
	  
    %>  --%>
    
   
  
    

<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;url=XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" /> 

</head>
<meta charset="utf-8">

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

/* 
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
 */


form {
    margin: 6px 0;
}

 .next,.previous{
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

/* .sumder{
	
	 text-align: right;

} */


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

table td{

	padding: 2px;
	text-align: left;
	font-size: 10px;
	font-family: arial;
	background-color: white;

}
#pymdets td{
padding:8px;
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
.clr{
color: #0c0b0b;
    background-color: #f5f5f5;
    border-color: #f5f5f5;
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

.alnum{


    text-align: right;


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
.tab-pane,#tbcates{
display:none;
}

.tab-pane,#tbcates{
display:none;
}

 .ui-dialog-titlebar-close {
    visibility: hidden;
}
.hidden {
  display: none;
}
 
</style>




<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	 $("#sumfrst").click(function(){
		 
		    	
		    		  location.href = "XBRL_REP_BLS0600_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		    		
		 });
	
	$("#addrowno").val("0");
	
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');
	
	$(".det").on("click",function(){
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_BLS0600_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( ".btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '.btnback').click(function() {
		 location.href="XBRL_CRT_BLS0600_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	$('#btnExcel').click(function() {
		//alert("srdgihsdukl");//return false;
     if($("#modflg").val()=="N"){
		 BLS0600Form.action = "BLS0600EXCELREPORT.action?method=BLS0600EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 BLS0600Form.submit();
	}else{
		alert("Some Records are Modified");
	}
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 BLS0600Form.action = "BLS0600EXCELSum.action?method=BLS0600EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 BLS0600Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 BLS0600Form.action = "BLS0600PDFREPORT.action?method=BLS0600PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 BLS0600Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  BLS0600Form.action = "XMLDOWNLOADb6.action?method=blsxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 BLS0600Form.submit(); 
	});
	var save=0;

	var hh=0;

	 $('#btnSave').on("click",function() {
	 	 
	 		
	 	if((hh==0)&&($("#savecheck").val()==0)){
	 		
	 			if($("#savecheck").val()==0){
	 	
	 /*  $("#divLoading").addClass('show'); */
	  var datasum={
			"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").val()
	};
	$.ajax({
		url:"saveSumb6",
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
		   			url:"saveSumb6",
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
	$("#pymdets").prepend("<tr id='bls6add"+rowno+"'><td id='accountnumber_row"+rowno+"'><input type='text' id='accountnumber_text"+rowno+"' style='width: 87px;'></td><td id='accountname_row"+rowno+"'><input type='text'  id='accountname_text"+rowno+"' style='    width:117px;'></td><td id='accntopndate_row"+rowno+"'><input type='text' id='accntopndate_text"+rowno+"' style='     width: 121px;'></td><td id='schemetype_row"+rowno+"'><input type='text' 	id='schemetype_text"+rowno+"' style='    width: 142px;'></td><td class='sumder alnum' id='interestperioddays_row"+rowno+"'><input type='text' id='interestperioddays_text"+rowno+"' style='    width: 100px;'></td><td id='reportdate_row"+rowno+"'><input type='text' id='reportdate_text"+rowno+"' style='    width: 100px;'></td><td style='text-align:center'><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");
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
	$("#reportdate_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
	});
	$("#accntopndate_text"+a).datepicker({
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

	 
	  
	 

var	interestperioddays=document.getElementById("interestperioddays_row"+no);

var	interestperioddays_data=interestperioddays.innerHTML;



interestperioddays.innerHTML="<input type='text' class='decimalPt roundUp'  id='interestperioddays_text"+no+"'  style='width: 83px'; value='"+interestperioddays_data+"'>";




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
		
		
		if(document.getElementById("interestperioddays_text"+no).value==""){
			alert("Enter Interest Period Days ..");
			error="Y"
		}
		
	} else if (modtyp=="A") {
		
		if(document.getElementById("accountnumber_text"+no).value==""){
			alert("Enter Account Number..");
			error="Y"
		}else if(document.getElementById("accountname_text"+no).value==""){
			alert("Enter Account Name ..");	
			error="Y"
		}else if(document.getElementById("accntopndate_text"+no).value==""){
			alert("Enter Account Open Date ..");
			error="Y"
		}else if(document.getElementById("schemetype_text"+no).value==""){
			alert("Enter Scheme Type..");
			error="Y"
		}else if(document.getElementById("interestperioddays_text"+no).value==""){
			alert("Enter Interest Period Days ..");	
			error="Y"
		}else if(document.getElementById("reportdate_text"+no).value==""){
			alert("Enter Report Date ..");
			error="Y"
		}
	}
	
	
	
	if (error=="N"){
	
	$("#modflg").val("Y");
	modtyp="M";
	document.getElementById("edit_button"+no).checked = false;


var interestperioddays_val=document.getElementById("interestperioddays_text"+no).value;
document.getElementById("interestperioddays_row"+no).innerHTML=interestperioddays_val;


if($("#addrowno").val()=="1"){
	
	modtyp="A";

var  accountnumber_val=document.getElementById("accountnumber_text"+no).value;	 
document.getElementById("accountnumber_row"+no).innerHTML=accountnumber_val;

   var accountname_val=document.getElementById("accountname_text"+no).value;
   document.getElementById("accountname_row"+no).innerHTML=accountname_val;
   
  var accntopndate_val=document.getElementById("accntopndate_text"+no).value;
   document.getElementById("accntopndate_row"+no).innerHTML=accntopndate_val;

   var schemetype_val=document.getElementById("schemetype_text"+no).value;
	document.getElementById("schemetype_row"+no).innerHTML=schemetype_val;
	 
  
  var reportdate_val=document.getElementById("reportdate_text"+no).value;	
  document.getElementById("reportdate_row"+no).innerHTML=reportdate_val;
 

  
}else{
	document.getElementById("Cancel_button"+no).style.display="inline-block";
	document.getElementById("Cancel_btn"+no).style.display="none";
}

document.getElementById("edit_button"+no).style.display="inline-block";
document.getElementById("save_button"+no).style.display="none";

 var accountnumber=document.getElementById("accountnumber_row"+no).innerHTML;	 
   var accountname=document.getElementById("accountname_row"+no).innerHTML;
  var accntopndate=document.getElementById("accntopndate_row"+no).innerHTML;
  var schemetype=document.getElementById("schemetype_row"+no).innerHTML;	
  var interestperioddays=document.getElementById("interestperioddays_row"+no).innerHTML;	 
  var reportdate=document.getElementById("reportdate_row"+no).innerHTML;

 
 $("#det1 td").attr("padding","8px");
 $("#bls6add"+no).addClass("rowaddedd");

var refeBLS600=document.getElementById("refDisplay").value;
interestperioddays=interestperioddays.replace(/\,/g,'')
  interestperioddays=Number(interestperioddays)
  
  var rptdate1 = {
     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeBLS600, "accountnumber":accountnumber,"accountname":accountname,"accntopndate" : accntopndate, "schemetype":schemetype, "interestperioddays":interestperioddays,"reportdate":reportdate,"modtyp":modtyp
}; 

$.ajax({
url : "BLS0600",
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
		        	
		        	var accountnumber=document.getElementById("accountnumber_row"+no).innerHTML;	 
		        	   var accountname=document.getElementById("accountname_row"+no).innerHTML;
		        	  var accntopndate=document.getElementById("accntopndate_row"+no).innerHTML;
		        	  var schemetype=document.getElementById("schemetype_row"+no).innerHTML;	
		        	  var interestperioddays=document.getElementById("interestperioddays_row"+no).innerHTML;	 
		        	  var reportdate=document.getElementById("reportdate_row"+no).innerHTML;
		        	var refeBLS600=document.getElementById("refDisplay").value;
		        	interestperioddays=interestperioddays.replace(/\,/g,'')
		        	  interestperioddays=Number(interestperioddays)
		        	var rptdate1 = {
		        		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeBLS600, "accountnumber":accountnumber,"accountname":accountname,"accntopndate" : accntopndate, "schemetype":schemetype, "interestperioddays":interestperioddays,"reportdate":reportdate,"modtyp":modtyp
		        		}; 

		        		$.ajax({
		        		url : "BLS0600",
		        		data : rptdate1  ,
		        			dataType : 'json', 
		        			type : 'POST',
		        			async : true,
		        			 success : function(res) {
		        				 console.log(res.refno);
		        				//	alert("refeDCG100"+refeDCG100);
		        				
		        				// alert("sfsdf");
		        				 $("#refDisplay").val(res.refno);
			   
				  
		        				 $("#bls6add"+no).closest("tr").remove();

				   
		        				
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
					"accountnumber":$("#accountnumber_row"+no).text(),"reportdate":'<%=dt2%>'
			};
			
			 $.ajax({
			     url : "BLS0600cancel",
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
		 	
		 var interestperioddays_val=document.getElementById("interestperioddays_text"+no).value;
		 document.getElementById("interestperioddays_row"+no).innerHTML=interestperioddays_val;

				$("#edit_button"+no).show();
				/* document.getElementById("edit_button"+no).style.display="block"; */
				document.getElementById("save_button"+no).style.display="none";
				document.getElementById("Cancel_btn"+no).style.display="none";
				 location.reload(true); 
				  var interestperioddays=document.getElementById("interestperioddays_row"+no).innerHTML;	 
				  if($("#bls6add"+no).hasClass( "rowaddedd" )){
					  
					  document.getElementById("Cancel_button"+no).style.display="inline-block";


				  }else{
					  document.getElementById("Cancel_button"+no).style.display="none";
				  }
				  
				
		 }

		 
		 function Canadd_row(no){
			 
			  /* document.getElementById("del_button"+no).style.display="inline-block"; */

																		   

			 if($("#bls6add"+no).hasClass( "rowaddedd" )){
				
				var detcancel={
						"accountnumber":$("#accountnumber_row"+no).text(),"reportdate":'<%=dt2%>'
				};
				

				 $.ajax({
				     url : "BLS0600cancel",
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
			 $("#bls6add"+no).remove();
			 
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
	if(b==0 ||b==2|| b==4 ||b==5){
		
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
			url:"BLS0600chckmodified",
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
					        	location.href = "XBRL_CRT_BLS0600_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
					        }
					      }
					    });
					
					
				}else{
					$("#modflg").val("N");
				}
			}
		});
		
		
	 /* filter script */
	  $("#btnfilter").on("click",function(){
			if($(".form-control2").prop("disabled")==true){
				$(".form-control2").prop("disabled",false);
			}else{
				$(".form-control2").val("");
				$(".form-control2").prop("disabled",true);
				
				var   table, tr, td, i;
				  
				 table = document.getElementById("pymdets");
				 tr = table.getElementsByTagName("tr");
				 for (i = 0; i < tr.length; i++) {
					 
						 
						 tr[i].style.display = ""; 
						 
				 
					 
				 }
			}
			
		});

	

   
   
    
	
    		
});
</script>




<script>

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
	
	 if(z=="load"){
		//FOR DETAILS
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
			
			 $(".repdisp").val(refno);
			 var srno=1;
			 $("#divLoading").addClass("show");
			 /*   $(".loader").fadeOut("slow"); */
				 var pymd = {
						"reptype" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
					}; 
					
				$.ajax({
					url : "BLS0600details",
					data : pymd,
					dataType : 'json',
					type : 'POST',
					async : true,
					success : function(res) {	
					//	alert("refePYM100"+refePYM100);
						
						  $("#pymdets tr").remove();
						 
						
						var b=JSON.parse(res.detBLS0600);
						 console.log(b);
						
						
							 	if(f=="onload"){
							 		$("#modify").show();
							 		for(var i=0;i<b.length;i++){
							 			
							 		  $("#pymdets").append(
												 
												
												
							 				 '<tr  id="bls6add'+srno+'"><td  id="accountnumber_row'+srno+'">'+b[i].accountnumber+'</td><td id="accountname_row'+srno+'">'+b[i].accountname+'</td><td id="accntopndate_row'+srno+'">'+b[i].accntopndate+'</td><td id="schemetype_row'+srno+'">'+b[i].schemetype+'</td><td class="sumder alnum" id="interestperioddays_row'+srno+'">'+b[i].interestperioddays+'</td><td id="reportdate_row'+srno+'">'+b[i].reportdate+'</td><td style="text-align:center;" ><input type="button" id="edit_button'+srno+'" value="Edit" class="btn btn-xs btn-primary edit" style="width: 37px;text-align:center;" onclick=edit_row("'+srno+'")>  <input type="button" id="save_button'+srno+'" value="Save" class="btn btn-xs btn-primary save" style="text-align:center;width: 37px; display:none;" onclick=save_row("'+srno+'")><input type="button" id="Cancel_button'+srno+'" value="Cancel" class="btn btn-xs btn-primary Cancel" style="width: 44px; display:none; " onclick=Cancel_row("'+srno+'")><input type="button" id="Cancel_btn'+srno+'" value="Cancel" class="btn btn-xs btn-primary Cancel1" style="width: 44px; display:none; " onclick=Canedit_row("'+srno+'")><input type="button" id="del_button'+srno+'" value="Delete" class="btn btn-xs btn-primary delete" style="width: 39px;" onclick=savedel_row("'+srno+'")></td></tr>');
							                     
							      
									 srno++;
									 
									 
									 
										} $("#divLoading").removeClass('show');
									$("#rowno").val(srno);
							 	}else if(f=="frmsum"){
							 		$(".add").hide();//add button hide
							 	
							 		$("#modify").hide();//modify in the header hide
							 		for(var i=0;i<b.length;i++){
							 			
							 		  $("#pymdets").append(
									
							                   					'<tr><td id="accountnumber_row'+srno+'">'+b[i].accountnumber+'</td><td id="accountname_row'+srno+'">'+b[i].accountname+'</td><td id="accntopndate_row'+srno+'">'+b[i].accntopndate+'</td><td id="schemetype_row'+srno+'">'+b[i].schemetype+'</td><td id="interestperioddays_row'+srno+'">'+b[i].interestperioddays+'</td><td id="reportdate_row'+srno+'">'+b[i].reportdate+'</td></tr>');

							                     
							           
									 srno++;
									 
									 
									 
										}
							 		 $("#divLoading").removeClass('show');
							 	}
								
								
							 $("#divLoading").removeClass('show'); 
							$('.alnum').mask("#,##0.00", {reverse: true}); 
						
							}
							
				/* <td><input type="radio" id="edit_button'+srno+'" value="Edit" class="btn btn-xs btn-primary edit" style="width: 37px;" onclick=edit_row("'+srno+'")>  <input type="button" id="save_button'+srno+'" value="Save" class="btn btn-xs btn-primary save" style="width: 37px; display:none;" onclick=save_row("'+srno+'")></td> */
							
					
				});   
	 }else{
		
		 //For summary
		 $(".summ").addClass("clr");
		 $("#divLoading").addClass('show');
		
		 //active,tab-pane for whole div
		 //tbcate,tbcates for table
		 $(".active,#tbcate").hide(); //tab1 or for details
			$(".tab-pane,#tbcates").show(); //tab2 or for summary
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
			
			 $(".repdisp").val(refno);
			
				$("#test tr").children().detach().remove();
			
				var rptdate1 = {
						  "dt1" : d,"dt2":e,"reportrefnos":refno,"curr":g
						}; 
				 
				 $.ajax({
				     url : "BLS0600SUM",
				     data : rptdate1  ,
						dataType : 'json', 
						type : 'POST',
						async : true,
						 success : function(res) {
							 //console.log(res.refnoAB);
					
					console.log(res.summaryBLS0600);
				
					var b=JSON.parse(res.summaryBLS0600);
					
					var k=1;
					var cnt1=1;
					
					
					for (var i = 0; i < b.length; i++) {
					
						
						//$('.alnum').mask("#,##0.00", {reverse: true});
					
					 
						
						$("#test").append('<tr><td  id="instname'+cnt1+'">'+b[i].instname+'</td><td id="instcode'+cnt1+'">'+b[i].instcode+'</td><td class="alnum" id="min'+cnt1+'">'+b[i].min+'</td><td class="alnum" id="max'+cnt1+'">'+b[i].max+'</td><td class="alnum" id="weightedavg'+cnt1+'">'+b[i].weightedavg+'</td><td class="alnum"  id="overalmin'+cnt1+'">'+b[i].overalmin+'</td><td class="alnum"  id="overalmax'+cnt1+'">'+b[i].overalmax+'</td><td class="alnum"  id="overalwgtedavg'+cnt1+'">'+b[i].overalwgtedavg+'</td><td style="text-align:center"><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td></tr>');
						
						
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
	
	
	 var datasum={
				"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>'
		};
	 

	 $.ajax({
			url:"savecheckBLS6",
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
	location.href = "XBRL_REP_BLS0600_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
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
</style>







<body>
<div class="container">
   
   
  
    
    <form class="form-horizontal" method="post" name="BLS0600Form"
		enctype="multipart/form-data">
    
    
    <div id="nav">
    <div class="loader"></div>
   <input type="hidden" id="modflg" >
   <input type="hidden" id="modtyp" >
   <input type="hidden" id="savecheck" >
         <div id="tab3" >
			  
			 
		
	 	<div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			<div class="active" id="tab1" style="width: 968px;padding-top: 1px;margin-top: -17px;" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>BLS0600-Statement of interest rates applicable on deposits in national currency
			<b id="sub"
					Style="display: none"></b></b></font>
			<b style="font-size: 13px;">  <b id="sub" style="display: none"></b></b></div><br>
			<div id="divLoading"> 
    </div>
           <table class="table" style="width:100%;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;">
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width: 325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary " href="#tab2" data-toggle="tab" id="sumfrst"><span class="headingtab"  >Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a><a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></td></tr>
          		  </table>
       
            
           <div class="panel panel-primary filterable">
            <table class="table" id="tbcate" border="1" style="width:100%;   margin-top: -20px;">
            
            
					 <tr class="filters">
					 
					 
					 					 <th style="width:100px;text-align:center"><input type="text" style="width:100px" id="accntno" onkeyup="myFunction(this.id,0)" style="width: 100px;" class="form-control2" placeholder="Account Number" disabled></th>
					 <th style="width:100px;text-align:center"><input type="text" style="width:100px" id="accntname" onkeyup="myFunction(this.id,1)" style="width: 100px;" class="form-control2" placeholder="Account Name" disabled></th>
						
						<th style="width:100px;text-align:center"><input type="text" style="width:100px" id="accntopndate" onkeyup="myFunction(this.id,2)" style="width: 100px;" class="form-control2" placeholder="Account Open Date" disabled></th>							
						<th style="width:100px;text-align:center"> <input type="text" style="width:100px" id="schmtyp" onkeyup="myFunction(this.id,3)" style="width: 100px;" class="form-control2" placeholder="Scheme Type" disabled></th>						
						<th style="width:100px;text-align:center"><input type="text" style="width:100px" id="intstperdays" onkeyup="myFunction(this.id,4)" style="width: 100px;" class="form-control2" placeholder="Interest Period Days" disabled></th>
						<th style="width:100px;text-align:center"><input type="text" style="width:100px" id="repdate" onkeyup="myFunction(this.id,5)" style="width: 100px;" class="form-control2" placeholder="Report Date" disabled></th>
					 <th style="width:100px;text-align:center" id="modify">Modify</th>
					 
					 
					</tr>
				
				
					<tbody class="databody" id="pymdets">


 


              </tbody>
              
				</table>
								</div>
				
					<div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
               
                 
                <button type="button" class="btn btn-xs btn-primary btnback" value="back" id="btnback">Back</button>
            </div>
			
       
			  </div>
			 
				
				
				
 
		
   
				
				<div class="tab-pane" id="tab2" style="width: 968px;padding-top: 1px;margin-top: -17px;">
<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>BLS0600-Statement of interest rates applicable on deposits in national currency<b id="sub"
					Style="display: none"></b></b></font>
			</div><br>
					
					 <div id="divLoading"> 
    </div>  <table class="table" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;">
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab" id="sumfrst"><span class="headingtab" >Summary </span></a><a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  
          		  
          		  	</table>	
          		  
          		  
					<table class="table" id="tbcates" border="1" style="margin-top: -21px;">
            
           <thead>
					 <tr>
					 	<th rowspan="3" style="width:240px;text-align:center" id="memo"></th>
					 	<th rowspan="3"style="width:20px;text-align:center" id="no"></th>
						<th colspan="3" style="text-align:center">New Rupee Deposits during the Month (percent)</th>
									
						<th colspan="3" style="text-align:center">Overall Rupee Deposits Portfolio (percent)</th>						
						<th rowspan="3" style="text-align:center" id="select">Select</th>
					</tr>
					
				
					 <tr>
					 	
						<th id="min" style="width:100px;text-align:center">Min</th>
						<th id="max" style="width:100px;text-align:center">Max</th>						
						<th id="wgtavg"style="width:100px;text-align:center"> Weighted Average</th>		
						<th id="min1"style="width:100px;text-align:center">Min</th>
						<th id="max1"style="width:100px;text-align:center">Max</th>						
						<th id="ovgavg1"style="width:100px;text-align:center"> Weighted Average</th>
						</tr>
					 <tr>
					 	
						<th id="a" style="width:100px;text-align:center">A</th>
						<th id="b" style="width:100px;text-align:center">B</th>						
						<th id="c" style="width:100px;text-align:center"> C</th>						
						<th id="d" style="width:100px;text-align:center">D</th>
						<th id="e" style="width:100px;text-align:center">E</th>
						<th id="f" style="width:100px;text-align:center" >F</th>
						
					</tr>
				</thead>
					
					<tbody class="databody" id="test">

            
					
              </tbody>
              
</table>
              </tbody>
              
  
				</table>
				
				
				<div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
            <!--     <button type="button" class="btn btn-xs btn-primary" value="Excel" >Generate Excel</button> -->
                 <!-- <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnExcelSum">Gen Sum</button> -->
               <!--   <button type="button" class="btn btn-xs btn-primary" value="Pdf" id="btnPdf">Generate PDF</button> -->
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary"  value="Excel" id="btnXML">Gen XML Sum</button>
                 
                <button type="button" class="btn btn-xs btn-primary btnback" value="back" id="btnback">Back</button>
            </div>


			</div>
			
			
         
        </div>
   
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