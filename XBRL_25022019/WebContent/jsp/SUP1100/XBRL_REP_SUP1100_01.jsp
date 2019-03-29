<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLSUP1100Bean,dao.XBRLSUP1100Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
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
   
   XBRLSUP1100Dao dmd=new XBRLSUP1100Dao();
   ArrayList<XBRLSUP1100Bean> list=new ArrayList<XBRLSUP1100Bean>();
    
   
  // ArrayList<XBRLSUP1100Bean> listsum=dmd.xbrlpymsum(dt1,dt2,ReporefSeq);
	  
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
.clr{
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

 .databody td{
border:1px solid #ddd;
}
.tab-pane,#tbcates{
display:none;
}

 
</style>




<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	$("#addrowno").val("0");
	
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>'); 
	 
	$("#sumfirst").on("click",function(){ 
	
		 location.href = "XBRL_REP_SUP1100_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 

			
		 });
	
	$("#addrowno").val("0");
	$(".det").on("click",function(){
		
	
		location.href = "XBRL_REP_SUP1100_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( ".btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$('.btnback').on('click', function(e){
		 location.href="XBRL_CRT_SUP1100_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

	});
	$('#btnExcel').click(function() {
		//alert("srdgihsdukl");//return false;
		 SUP1100Form.action = "SUP1100EXCELREPORT.action?method=SUP1100EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 SUP1100Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 SUP1100Form.action = "SUP1100EXCELSum.action?method=SUP1100EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 SUP1100Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 SUP1100Form.action = "SUP1100PDFREPORT.action?method=SUP1100PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 SUP1100Form.submit();
		}
	});
	$('#btnXML').click(function() {
		//alert("SUP1100EXCELSum");//return false;
		
		  SUP1100Form.action = "XMLDOWNLOAD.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 SUP1100Form.submit(); 
	});
	var save=0;

	var hh=0;

	 $('#btnSave').on("click",function() {
	 	 
	 		
	 	if((hh==0)&&($("#savecheck").val()==0)){
	 		
	 			if($("#savecheck").val()==0){
	 	
	 				var datasum={
	 						"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").val()
	 				};
	 				 $("#divLoading").addClass('show');
	 				$.ajax({
	 					url:"saveSum",
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
	 				   			url:"saveSum",
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
	$("#addrowno").val("1"); 
	modtyp="A";

	$("#pymdets").prepend("<tr id='dcgadd"+rowno+"'><td id='customername_row"+rowno+"'><input type='text'  id='customername_text"+rowno+"' style='    width:100px;'></td><td  id='uniqidentinoofcust_row"+rowno+"'><input type='text' id='uniqidentinoofcust_text"+rowno+"' style='     width: 100px;'></td><td  id='sanctiondate_row"+rowno+"'><input type='text' 	id='sanctiondate_text"+rowno+"'  style='    width: 100px;'></td><td   id='typeoffacility_row"+rowno+"'><input type='text' id='typeoffacility_text"+rowno+"' style='    width: 100px;'></td><td  class='sumder alnum' id='amtsantioned_row"+rowno+"' ><input type='text' class='decimalPt roundUp' id='amtsantioned_text"+rowno+"'    style='    width: 100px;'><td  id='purpose_row"+rowno+"'><input type='text' id='purpose_text"+rowno+"'  class='date' style='    width: 100px;'></td><td  id='detaiofsecurity_row"+rowno+"'><input type='text' style='  width: 100px;' id='detaiofsecurity_text"+rowno+"' ></td><td   id='lastvaluadate_row"+rowno+"'><input type='text' id='lastvaluadate_text"+rowno+"'  style='width: 100px;'></td><td  id='valueofsecurity_row"+rowno+"'><input type='text' id='valueofsecurity_text"+rowno+"' style='width: 100px;'></td><td  id='nameofvaluer_row"+rowno+"'><input type='text' id='nameofvaluer_text"+rowno+"' style='width: 100px;'></td><td id='dateclassiasnpa_row"+rowno+"'><input type='text'  id='dateclassiasnpa_text"+rowno+"' style='    width:100px;'></td><td  id='estirealivalofsecur_row"+rowno+"'><input type='text' id='estirealivalofsecur_text"+rowno+"' style='     width: 100px;'></td><td  class='sumder alnum'  id='amtofprovismade_row"+rowno+"'><input type='text' 	class='decimalPt roundUp' id='amtofprovismade_text"+rowno+"'  style='    width: 100px;'></td><td   id='dateonwhlegactwainit_row"+rowno+"'><input type='text' id='dateonwhlegactwainit_text"+rowno+"' style='    width: 100px;'></td><td class='sumder alnum'  id='outstabalatforclsdate_row"+rowno+"' ><input type='text'  class='decimalPt roundUp' id='outstabalatforclsdate_text"+rowno+"'    style='    width: 100px;'><td  id='dateofsalbylevy_row"+rowno+"'><input type='text' id='dateofsalbylevy_text"+rowno+"'  class='date' style='    width: 100px;'></td><td  id='leavysalrefno_row"+rowno+"'><input type='text' style=' width: 160px;' id='leavysalrefno_text"+rowno+"' ></td><td  id='securenforced_row"+rowno+"'><input type='text' id='securenforced_text"+rowno+"'  style='width: 100px;'></td><td  id='dateofactusal_row"+rowno+"'><input type='text' id='dateofactusal_text"+rowno+"' style='width: 100px;'></td><td class='sumder alnum'  id='amtofactusal_row"+rowno+"'><input type='text' class='decimalPt roundUp'  id='amtofactusal_text"+rowno+"' style='width: 100px;'></td><td  class='sumder alnum' id='amtattritobank_row"+rowno+"'><input type='text' class='decimalPt roundUp' id='amtattritobank_text"+rowno+"' style='    width:100px;'></td><td  class='sumder alnum' id='acturecovcosts_row"+rowno+"'><input type='text' class='decimalPt roundUp' id='acturecovcosts_text"+rowno+"' style='     width: 100px;'></td><td  id='statwheasstwerpurbank_row"+rowno+"'><input type='text' 	id='statwheasstwerpurbank_text"+rowno+"'  style='    width: 100px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");	
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
		  if (!isNaN(value)) {
		    $(this).val(parseFloat(value).toFixed(2));
		  }
		});


	}); 

		

		
});	



function fnkeyup(a){
	$("#sanctiondate_text"+a).datepicker({
	dateFormat: "dd-mm-yy",
	        changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: "today"
	});


	$("#lastvaluadate_text"+a).datepicker({
	dateFormat: "dd-mm-yy",
	        changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: "today"
	});
	
	
	$("#dateclassiasnpa_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
		        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
		});	
	$("#dateonwhlegactwainit_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
		        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
		});	
	$("#dateofsalbylevy_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
		        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
		});	
	$("#dateofactusal_text"+a).datepicker({
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

 	 	

 
  
  var	amtsantioned =  document.getElementById("amtsantioned_row"+no);
  var	amtsantioned_data = amtsantioned.innerHTML;
 
  
  var	amtofprovismade =  document.getElementById("amtofprovismade_row"+no);
  var	amtofprovismade_data = amtofprovismade.innerHTML;

 var	outstabalatforclsdate =  document.getElementById("outstabalatforclsdate_row"+no);
 var	outstabalatforclsdate_data = outstabalatforclsdate.innerHTML; 
 
 
 var	amtofactusal =  document.getElementById("amtofactusal_row"+no);
 var	amtofactusal_data = amtofactusal.innerHTML; 
 
 
 var	amtattritobank =  document.getElementById("amtattritobank_row"+no);
 var	amtattritobank_data = amtattritobank.innerHTML;

 
 var	acturecovcosts =  document.getElementById("acturecovcosts_row"+no);
 var	acturecovcosts_data = acturecovcosts.innerHTML; 

 

 amtsantioned.innerHTML="<input type='text' class='decimalPt roundUp'  id='amtsantioned_text"+no+"'  style='width: 83px'; value='"+amtsantioned_data+"'>";
 
 
 amtofprovismade.innerHTML="<input type='text' class='decimalPt roundUp' id='amtofprovismade_text"+no+"' style='width: 83px'; value='"+amtofprovismade_data+"'>";
 
 
 outstabalatforclsdate.innerHTML="<input type='text' class='decimalPt roundUp' id='outstabalatforclsdate_text"+no+"' style='width: 83px'; value='"+outstabalatforclsdate_data+"'>";
 
 
 
 amtofactusal.innerHTML="<input type='text' class='decimalPt roundUp' id='amtofactusal_text"+no+"' style='width: 83px'; value='"+amtofactusal_data+"'>";
 

 
 amtattritobank.innerHTML="<input type='text' class='decimalPt roundUp' id='amtattritobank_text"+no+"' style='width: 83px'; value='"+amtattritobank_data+"'>";
 

 acturecovcosts.innerHTML="<input type='text' class='decimalPt roundUp' id='acturecovcosts_text"+no+"' style='width: 83px'; value='"+acturecovcosts_data+"'>"; 

 
 
 

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
	 var error="N";
		
		if (modtyp=="M"){
			
			
			if(document.getElementById("Noofcoins_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}
			
		} else if (modtyp=="A") {
			
			
			

			if(document.getElementById("Reportdate_text"+no).value==""){
				alert("Enter Report Date ..");
				error="Y"
			}else if(document.getElementById("Typeofcoin_text"+no).value==""){
				alert("Enter Type of coin ..");	
				error="Y"
			}else if(document.getElementById("Noofcoins_text"+no).value==""){
				alert("Enter No of coins ..");
				error="Y"
			}
		}
		
		
		
		if (error=="N"){
		
		$("#modflg").val("Y");
		modtyp="M";
		document.getElementById("edit_button"+no).checked = false;

		  
 

 var amtsantioned_val=document.getElementById("amtsantioned_text"+no).value;

 document.getElementById("amtsantioned_row"+no).innerHTML=amtsantioned_val;

 
 



 var amtofprovismade_val=document.getElementById("amtofprovismade_text"+no).value;
 
 document.getElementById("amtofprovismade_row"+no).innerHTML=amtofprovismade_val;

 

 
 

 var outstabalatforclsdate_val=document.getElementById("outstabalatforclsdate_text"+no).value;
 
 document.getElementById("outstabalatforclsdate_row"+no).innerHTML=outstabalatforclsdate_val;


 
 
 var amtofactusal_val=document.getElementById("amtofactusal_text"+no).value;

 document.getElementById("amtofactusal_row"+no).innerHTML=amtofactusal_val;

 
 
 var amtattritobank_val=document.getElementById("amtattritobank_text"+no).value;
 
 document.getElementById("amtattritobank_row"+no).innerHTML=amtattritobank_val;
 
 
 var acturecovcosts_val=document.getElementById("acturecovcosts_text"+no).value;
 
 document.getElementById("acturecovcosts_row"+no).innerHTML=acturecovcosts_val;
 
 
 if($("#addrowno").val()=="1"){
 	
		modtyp="A";
	
 var  customername_val=document.getElementById("customername_text"+no).value;
 document.getElementById("customername_row"+no).innerHTML=customername_val;
 
    var uniqidentinoofcust_val=document.getElementById("uniqidentinoofcust_text"+no).value;
   document.getElementById("uniqidentinoofcust_row"+no).innerHTML=uniqidentinoofcust_val;
    
    
   var sanctiondate_val=document.getElementById("sanctiondate_text"+no).value;
    document.getElementById("sanctiondate_row"+no).innerHTML=sanctiondate_val;
   
    var typeoffacility_val=document.getElementById("typeoffacility_text"+no).value;
 	document.getElementById("typeoffacility_row"+no).innerHTML=typeoffacility_val;
 	
   var purpose_val=document.getElementById("purpose_text"+no).value;	
   document.getElementById("purpose_row"+no).innerHTML=purpose_val;
   
   var  detaiofsecurity_val=document.getElementById("detaiofsecurity_text"+no).value;	 
   document.getElementById("detaiofsecurity_row"+no).innerHTML=detaiofsecurity_val;
  
   var  lastvaluadate_val=document.getElementById("lastvaluadate_text"+no).value;	 
   document.getElementById("lastvaluadate_row"+no).innerHTML=lastvaluadate_val;
   
   var  valueofsecurity_val=document.getElementById("valueofsecurity_text"+no).value;	 
   document.getElementById("valueofsecurity_row"+no).innerHTML=valueofsecurity_val;
  
   var  nameofvaluer_val=document.getElementById("nameofvaluer_text"+no).value;	 
   document.getElementById("nameofvaluer_row"+no).innerHTML=nameofvaluer_val;

  

   var dateclassiasnpa_val=document.getElementById("dateclassiasnpa_text"+no).value;	
   document.getElementById("dateclassiasnpa_row"+no).innerHTML=dateclassiasnpa_val; 
   
   var  estirealivalofsecur_val=document.getElementById("estirealivalofsecur_text"+no).value;	 
   document.getElementById("estirealivalofsecur_row"+no).innerHTML=estirealivalofsecur_val;
   
   var dateonwhlegactwainit_val=document.getElementById("dateonwhlegactwainit_text"+no).value;	 
   document.getElementById("dateonwhlegactwainit_row"+no).innerHTML=dateonwhlegactwainit_val;

   var  dateofsalbylevy_val=document.getElementById("dateofsalbylevy_text"+no).value;	 
   document.getElementById("dateofsalbylevy_row"+no).innerHTML=dateofsalbylevy_val;
   
   var  leavysalrefno_val=document.getElementById("leavysalrefno_text"+no).value;	 
   document.getElementById("leavysalrefno_row"+no).innerHTML=leavysalrefno_val;
 
   var securenforced_val=document.getElementById("securenforced_text"+no).value;	
   document.getElementById("securenforced_row"+no).innerHTML=securenforced_val;
  
   var  dateofactusal_val=document.getElementById("dateofactusal_text"+no).value;	 
   document.getElementById("dateofactusal_row"+no).innerHTML=dateofactusal_val;
   
   var statwheasstwerpurbank_val=document.getElementById("statwheasstwerpurbank_text"+no).value;	 
   document.getElementById("statwheasstwerpurbank_row"+no).innerHTML=statwheasstwerpurbank_val;
  
 }else{
		document.getElementById("Cancel_button"+no).style.display="inline-block";
		document.getElementById("Cancel_btn"+no).style.display="none";
	}
	
	document.getElementById("edit_button"+no).style.display="inline-block";
	document.getElementById("save_button"+no).style.display="none";
	

  var customername=document.getElementById("customername_row"+no).innerHTML;	 
    var uniqidentinoofcust=document.getElementById("uniqidentinoofcust_row"+no).innerHTML;
   var sanctiondate=document.getElementById("sanctiondate_row"+no).innerHTML;
   var typeoffacility=document.getElementById("typeoffacility_row"+no).innerHTML;
   var amtsantioned=document.getElementById("amtsantioned_row"+no).innerHTML;
   var purpose=document.getElementById("purpose_row"+no).innerHTML;	
   var detaiofsecurity=document.getElementById("detaiofsecurity_row"+no).innerHTML;
   var lastvaluadate=document.getElementById("lastvaluadate_row"+no).innerHTML;	 
 
   var valueofsecurity=document.getElementById("valueofsecurity_row"+no).innerHTML;
   var nameofvaluer=document.getElementById("nameofvaluer_row"+no).innerHTML;	 
   var dateclassiasnpa=document.getElementById("dateclassiasnpa_row"+no).innerHTML;
   var estirealivalofsecur=document.getElementById("estirealivalofsecur_row"+no).innerHTML;
   var amtofprovismade=document.getElementById("amtofprovismade_row"+no).innerHTML;
   var dateonwhlegactwainit=document.getElementById("dateonwhlegactwainit_row"+no).innerHTML;
   var outstabalatforclsdate=document.getElementById("outstabalatforclsdate_row"+no).innerHTML;
  
    var dateofsalbylevy=document.getElementById("dateofsalbylevy_row"+no).innerHTML;	
   var leavysalrefno=document.getElementById("leavysalrefno_row"+no).innerHTML;	 
   var securenforced=document.getElementById("securenforced_row"+no).innerHTML;
  var dateofactusal=document.getElementById("dateofactusal_row"+no).innerHTML;
  var amtofactusal=document.getElementById("amtofactusal_row"+no).innerHTML;
  var amtattritobank=document.getElementById("amtattritobank_row"+no).innerHTML;
  var acturecovcosts=document.getElementById("acturecovcosts_row"+no).innerHTML;	
  var statwheasstwerpurbank=document.getElementById("statwheasstwerpurbank_row"+no).innerHTML;
  
  $("#dcgadd"+no).addClass("rowaddedd");

   $("#det1 td").attr("padding","8px");
   var refeSUP1100=document.getElementById("refDisplay").value;
   amtsantioned=amtsantioned.replace(/\,/g,'');
   amtsantioned=Number(amtsantioned);
   
 
   var rptdate1 = {
  		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeSUP1100,"customername":customername,"uniqidentinoofcust":uniqidentinoofcust,"sanctiondate":sanctiondate,"typeoffacility":typeoffacility,"amtsantioned":amtsantioned,"purpose":purpose,"detaiofsecurity":detaiofsecurity,"lastvaluadate":lastvaluadate,"valueofsecurity":valueofsecurity,"nameofvaluer":nameofvaluer,"dateclassiasnpa":dateclassiasnpa,"estirealivalofsecur":estirealivalofsecur,"amtofprovismade":amtofprovismade,"dateonwhlegactwainit":dateonwhlegactwainit,"outstabalatforclsdate":outstabalatforclsdate,"dateofsalbylevy":dateofsalbylevy,"leavysalrefno":leavysalrefno,"securenforced":securenforced,"dateofactusal":dateofactusal,"amtofactusal":amtofactusal,"amtattritobank":amtattritobank,"acturecovcosts":acturecovcosts,"statwheasstwerpurbank":statwheasstwerpurbank,"modtyp":modtyp  
  		}; 
   
   $.ajax({
       url : "SUP1100",
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
				        	
				        	
				        	 var customername=document.getElementById("customername_row"+no).innerHTML;	 
				        	    var uniqidentinoofcust=document.getElementById("uniqidentinoofcust_row"+no).innerHTML;
				        	   var sanctiondate=document.getElementById("sanctiondate_row"+no).innerHTML;
				        	   var typeoffacility=document.getElementById("typeoffacility_row"+no).innerHTML;
				        	   var amtsantioned=document.getElementById("amtsantioned_row"+no).innerHTML;
				        	   var purpose=document.getElementById("purpose_row"+no).innerHTML;	
				        	   var detaiofsecurity=document.getElementById("detaiofsecurity_row"+no).innerHTML;
				        	   var lastvaluadate=document.getElementById("lastvaluadate_row"+no).innerHTML;	 
				        	 
				        	   var valueofsecurity=document.getElementById("valueofsecurity_row"+no).innerHTML;
				        	   var nameofvaluer=document.getElementById("nameofvaluer_row"+no).innerHTML;	 
				        	   var dateclassiasnpa=document.getElementById("dateclassiasnpa_row"+no).innerHTML;
				        	   var estirealivalofsecur=document.getElementById("estirealivalofsecur_row"+no).innerHTML;
				        	   var amtofprovismade=document.getElementById("amtofprovismade_row"+no).innerHTML;
				        	   var dateonwhlegactwainit=document.getElementById("dateonwhlegactwainit_row"+no).innerHTML;
				        	   var outstabalatforclsdate=document.getElementById("outstabalatforclsdate_row"+no).innerHTML;
				        	  
				        	    var dateofsalbylevy=document.getElementById("dateofsalbylevy_row"+no).innerHTML;	
				        	   var leavysalrefno=document.getElementById("leavysalrefno_row"+no).innerHTML;	 
				        	   var securenforced=document.getElementById("securenforced_row"+no).innerHTML;
				        	  var dateofactusal=document.getElementById("dateofactusal_row"+no).innerHTML;
				        	  var amtofactusal=document.getElementById("amtofactusal_row"+no).innerHTML;
				        	  var amtattritobank=document.getElementById("amtattritobank_row"+no).innerHTML;
				        	  var acturecovcosts=document.getElementById("acturecovcosts_row"+no).innerHTML;	
				        	  var statwheasstwerpurbank=document.getElementById("statwheasstwerpurbank_row"+no).innerHTML;
				        	  
				        	  var refeSUP1100=document.getElementById("refDisplay").value;
				        	   amtsantioned=amtsantioned.replace(/\,/g,'');
				        	   amtsantioned=Number(amtsantioned);
				        	   
				        	 
				        	   var rptdate1 = {
				        	  		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeSUP1100,"customername":customername,"uniqidentinoofcust":uniqidentinoofcust,"sanctiondate":sanctiondate,"typeoffacility":typeoffacility,"amtsantioned":amtsantioned,"purpose":purpose,"detaiofsecurity":detaiofsecurity,"lastvaluadate":lastvaluadate,"valueofsecurity":valueofsecurity,"nameofvaluer":nameofvaluer,"dateclassiasnpa":dateclassiasnpa,"estirealivalofsecur":estirealivalofsecur,"amtofprovismade":amtofprovismade,"dateonwhlegactwainit":dateonwhlegactwainit,"outstabalatforclsdate":outstabalatforclsdate,"dateofsalbylevy":dateofsalbylevy,"leavysalrefno":leavysalrefno,"securenforced":securenforced,"dateofactusal":dateofactusal,"amtofactusal":amtofactusal,"amtattritobank":amtattritobank,"acturecovcosts":acturecovcosts,"statwheasstwerpurbank":statwheasstwerpurbank,"modtyp":modtyp  
				        	  		}; 
				        	   
				        	   $.ajax({
				        	       url : "SUP1100",
				        	       data : rptdate1  ,
				        	  		dataType : 'json', 
				        	  		type : 'POST',
				        	  		async : true,
				        	  		 success : function(res) {
				        	  			 console.log(res.refno);
				        				 $("#refDisplay").val(res.refno);
					   
						  
				        				 $("#dcgadd"+no).closest("tr").remove();

						   
				        				
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
						"customername":$("#customername"+no).text(),"uniqidentinoofcust":$("#uniqidentinoofcust"+no).text(),"date":'<%=dt2%>'
				};
				
				 $.ajax({
				     url : "SUP1100cancel",
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
			 	
			 var	amtsantioned =  document.getElementById("amtsantioned_row"+no);
			  var	amtsantioned_data = amtsantioned.innerHTML;
			 
			  
			  var	amtofprovismade =  document.getElementById("amtofprovismade_row"+no);
			  var	amtofprovismade_data = amtofprovismade.innerHTML;

			 var	outstabalatforclsdate =  document.getElementById("outstabalatforclsdate_row"+no);
			 var	outstabalatforclsdate_data = outstabalatforclsdate.innerHTML; 
			 
			 
			 var	amtofactusal =  document.getElementById("amtofactusal_row"+no);
			 var	amtofactusal_data = amtofactusal.innerHTML; 
			 
			 
			 var	amtattritobank =  document.getElementById("amtattritobank_row"+no);
			 var	amtattritobank_data = amtattritobank.innerHTML;

			 
			 var	acturecovcosts =  document.getElementById("acturecovcosts_row"+no);
			 var	acturecovcosts_data = acturecovcosts.innerHTML; 

					$("#edit_button"+no).show();
					/* document.getElementById("edit_button"+no).style.display="block"; */
					document.getElementById("save_button"+no).style.display="none";
					document.getElementById("Cancel_btn"+no).style.display="none";
					 location.reload(true); 
					   var amtsantioned=document.getElementById("amtsantioned_row"+no).innerHTML;
					   var amtofprovismade=document.getElementById("amtofprovismade_row"+no).innerHTML;
					   var outstabalatforclsdate=document.getElementById("outstabalatforclsdate_row"+no).innerHTML;
					   var amtofactusal=document.getElementById("amtofactusal_row"+no).innerHTML;
					   var amtattritobank=document.getElementById("amtattritobank_row"+no).innerHTML;
					   var acturecovcosts=document.getElementById("acturecovcosts_row"+no).innerHTML;

					  if($("#dcgadd"+no).hasClass( "rowaddedd" )){
						  
						  document.getElementById("Cancel_button"+no).style.display="inline-block";


					  }else{
						  document.getElementById("Cancel_button"+no).style.display="none";
					  }
					  
					
			 }

			 
			 function Canadd_row(no){
				 
				  /* document.getElementById("del_button"+no).style.display="inline-block"; */

																			   

				 if($("#dcgadd"+no).hasClass( "rowaddedd" )){
					
					var detcancel={
							"customername":$("#customername"+no).text(),"uniqidentinoofcust":$("#uniqidentinoofcust"+no).text(),"date":'<%=dt2%>'
					};
					

					 $.ajax({
					     url : "SUP1100cancel",
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
				 $("#dcgadd"+no).remove();
				 
			 }
 </script> 
<script>
$(document).ready(function(){
	var det={
			"repdate":'<%=dt2%>',"type":"chckmodified"
		};
		$.ajax({
			url:"SUP1100chckmodified",
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
					        	location.href = "XBRL_CRT_SUP1100_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
					        }
					      }
					    });
					
					
				}else{
					$("#modflg").val("N");
				}
			}
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


<script>

function fnload(z,d,e,b,c,a,f,g){
	
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
			
			 $(".repdisp").val(refno);
			 var srno=1;
			 var cnt1=1;
			 $("#divLoading").addClass("show");
			
				 var SUP1100 = {
						 "reptype" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
					}; 
					
				
				$.ajax({
					url : "sup1100details",
					data : SUP1100,
					dataType : 'json',
					type : 'POST',
					async : true,
					success : function(res) {	
					//	alert("refePYM100"+refePYM100);
					
						  $("#pymdets tr").remove();						 
						
						var b=JSON.parse(res.detSUP1100);
						 console.log(b);
							
									//alert(f);
					
							 	if(f=="onload"){
							 		$("#modify").show();
							 		for(var i=0;i<b.length;i++){
							 		
							 		  $("#pymdets").append(
												 
																							
												 "<tr id='dcgadd"+cnt1+"'>"

					      
						  +"<td  id='customername_row"+srno+"'>"+b[i].customername+"</td>"
						  +"<td  id='uniqidentinoofcust_row"+srno+"'>"+b[i].uniqidentinoofcust+"</td>"
						  +"<td  id='sanctiondate_row"+srno+"'>"+b[i].sanctiondate+"</td>"
						  +"<td  id='typeoffacility_row"+srno+"'>"+b[i].typeoffacility+"</td>"
						  +"<td class='sumder' id='amtsantioned_row"+srno+"'>"+b[i].amtsantioned+"</td>"
						  +"<td  id='purpose_row"+srno+"'>"+b[i].purpose+"</td>"
						  +"<td  id='detaiofsecurity_row"+srno+"'>"+b[i].detaiofsecurity+"</td>"
						  +"<td  id='lastvaluadate_row"+srno+"'>"+b[i].lastvaluadate+"</td>"
						  +"<td  id='valueofsecurity_row"+srno+"'>"+b[i].valueofsecurity+"</td>"
						  +"<td  id='nameofvaluer_row"+srno+"'>"+b[i].nameofvaluer+"</td>"
						  +"<td  id='dateclassiasnpa_row"+srno+"'>"+b[i].dateclassiasnpa+"</td>"
						  +"<td  id='estirealivalofsecur_row"+srno+"'>"+b[i].estirealivalofsecur+"</td>"
						  +"<td class='sumder' id='amtofprovismade_row"+srno+"'>"+b[i].amtofprovismade+"</td>"
						  +"<td  id='dateonwhlegactwainit_row"+srno+"'>"+b[i].dateonwhlegactwainit+"</td>"
						  +"<td  id='outstabalatforclsdate_row"+srno+"'>"+b[i].outstabalatforclsdate+"</td>"
						  +"<td  id='dateofsalbylevy_row"+srno+"'>"+b[i].dateofsalbylevy+"</td>"
						  +"<td  id='leavysalrefno_row"+srno+"'>"+b[i].leavysalrefno+"</td>"
						  +"<td  id='securenforced_row"+srno+"'>"+b[i].securenforced+"</td>"
						  +"<td  id='dateofactusal_row"+srno+"'>"+b[i].dateofactusal+"</td>"
						  +"<td class='sumder' id='amtofactusal_row"+srno+"'>"+b[i].amtofactusal+"</td>"
						  +"<td class='sumder' id='amtattritobank_row"+srno+"'>"+b[i].amtattritobank+"</td>"
						  +"<td  class='sumder' id='acturecovcosts_row"+srno+"'>"+b[i].acturecovcosts+"</td>"
						  +"<td  class='sumder' id='statwheasstwerpurbank_row"+srno+"'>"+b[i].statwheasstwerpurbank+"</td>"
             
			           +"<td style='text-align:center'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none; ' onclick=Cancel_row('"+cnt1+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+cnt1+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+cnt1+"')></td>"	
							                    
							                     						                     
							                      
							                    +"</tr>" ) ;  
							 		 
									
									 srno++;
									 cnt1++;

									 
									 
										} $("#divLoading").removeClass('show');
									$("#rowno").val(srno);
							 	 	}else if(f=="frmsum"){
							 	 		$(".add").hide();
								 		/* $("").padStart(6, "0");.padStart(6, "0"); */
								 		$("#modify").hide();
								 		for(var i=0;i<b.length;i++){
								 			
								 		  $("#pymdets").append(
													 
													
													
								 				 "<tr>"

							                   
						  +"<td  id='customername_row"+srno+"'>"+b[i].customername+"</td>"
						  +"<td  id='uniqidentinoofcust_row"+srno+"'>"+b[i].uniqidentinoofcust+"</td>"
						  +"<td  id='sanctiondate_row"+srno+"'>"+b[i].sanctiondate+"</td>"
						  +"<td  id='typeoffacility_row"+srno+"'>"+b[i].typeoffacility+"</td>"
						  +"<td  class='sumder' id='amtsantioned_row"+srno+"'>"+b[i].amtsantioned+"</td>"
						  +"<td  id='purpose_row"+srno+"'>"+b[i].purpose+"</td>"
						  +"<td  id='detaiofsecurity_row"+srno+"'>"+b[i].detaiofsecurity+"</td>"
						  +"<td  id='lastvaluadate_row"+srno+"'>"+b[i].lastvaluadate+"</td>"
						  +"<td  id='valueofsecurity_row"+srno+"'>"+b[i].valueofsecurity+"</td>"
						  +"<td  id='nameofvaluer_row"+srno+"'>"+b[i].nameofvaluer+"</td>"
						  +"<td  id='dateclassiasnpa_row"+srno+"'>"+b[i].dateclassiasnpa+"</td>"
						  +"<td  id='estirealivalofsecur_row"+srno+"'>"+b[i].estirealivalofsecur+"</td>"
						  +"<td class='sumder' id='amtofprovismade_row"+srno+"'>"+b[i].amtofprovismade+"</td>"
						  +"<td  id='dateonwhlegactwainit_row"+srno+"'>"+b[i].dateonwhlegactwainit+"</td>"
						  +"<td  id='outstabalatforclsdate_row"+srno+"'>"+b[i].outstabalatforclsdate+"</td>"
						  +"<td  id='dateofsalbylevy_row"+srno+"'>"+b[i].dateofsalbylevy+"</td>"
						  +"<td  id='leavysalrefno_row"+srno+"'>"+b[i].leavysalrefno+"</td>"
						  +"<td  id='securenforced_row"+srno+"'>"+b[i].securenforced+"</td>"
						  +"<td  id='dateofactusal_row"+srno+"'>"+b[i].dateofactusal+"</td>"
						  +"<td class='sumder' id='amtofactusal_row"+srno+"'>"+b[i].amtofactusal+"</td>"
						  +"<td class='sumder' id='amtattritobank_row"+srno+"'>"+b[i].amtattritobank+"</td>"
						  +"<td  id='acturecovcosts_row"+srno+"'>"+b[i].acturecovcosts+"</td>"
						  +"<td  id='statwheasstwerpurbank_row"+srno+"'>"+b[i].statwheasstwerpurbank+"</td>"
							         
							                    
							                    
							                     
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
			 $(".summ").addClass("clr");
			 $(".active,#tbcate").hide(); 
				$(".tab-pane,#tbcates").show(); 
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
				
					 var SUP1100 = {
							 "dt2":e,"reportrefnos":refno,"curr":g
							}; 
					 //alert("inside the ajaxxxxxxxxxxxxx");
					$.ajax({
						url : "SUP1100SUM",
						data : SUP1100,
							dataType : 'json', 
							type : 'POST',
							async : true,
							 success : function(res) {
								 //console.log(res.refnoAB);
						
						console.log(res.summarySUP1100);
					
						var b=JSON.parse(res.summarySUP1100);
						
						var k=1;
						var cnt1=1;
						
						
						for (var i = 0; i < b.length; i++) {
						

	
							$("#test").append(
							
							"<tr>"

				                     +"<td  id='srlno_row"+cnt1+"'>"+cnt1+"</td>"
						  +"<td  id='customername_row"+cnt1+"'>"+b[i].customername+"</td>"
						  +"<td  id='uniqidentinoofcust_row"+cnt1+"'>"+b[i].uniqidentinoofcust+"</td>"
						  +"<td  id='sanctiondate_row"+cnt1+"'>"+b[i].sanctiondate+"</td>"
						  +"<td  id='typeoffacility_row"+cnt1+"'>"+b[i].typeoffacility+"</td>"
						  +"<td class='sumder' id='amtsantioned_row"+cnt1+"'>"+b[i].amtsantioned+"</td>"
						  +"<td  id='purpose_row"+cnt1+"'>"+b[i].purpose+"</td>"
						  +"<td  id='detaiofsecurity_row"+cnt1+"'>"+b[i].detaiofsecurity+"</td>"
						  +"<td  id='lastvaluadate_row"+cnt1+"'>"+b[i].lastvaluadate+"</td>"
						  +"<td  id='valueofsecurity_row"+cnt1+"'>"+b[i].valueofsecurity+"</td>"
						  +"<td  id='nameofvaluer_row"+cnt1+"'>"+b[i].nameofvaluer+"</td>"
						  +"<td  id='dateclassiasnpa_row"+cnt1+"'>"+b[i].dateclassiasnpa+"</td>"
						  +"<td  id='estirealivalofsecur_row"+cnt1+"'>"+b[i].estirealivalofsecur+"</td>"
						  +"<td class='sumder' id='amtofprovismade_row"+cnt1+"'>"+b[i].amtofprovismade+"</td>"
						  +"<td  id='dateonwhlegactwainit_row"+cnt1+"'>"+b[i].dateonwhlegactwainit+"</td>"
						  +"<td  id='outstabalatforclsdate_row"+cnt1+"'>"+b[i].outstabalatforclsdate+"</td>"
						  +"<td  id='dateofsalbylevy_row"+cnt1+"'>"+b[i].dateofsalbylevy+"</td>"
						  +"<td  id='leavysalrefno_row"+cnt1+"'>"+b[i].leavysalrefno+"</td>"
						  +"<td  id='securenforced_row"+cnt1+"'>"+b[i].securenforced+"</td>"
						  +"<td  id='dateofactusal_row"+cnt1+"'>"+b[i].dateofactusal+"</td>"
						  +"<td class='sumder' id='amtofactusal_row"+cnt1+"'>"+b[i].amtofactusal+"</td>"
						  +"<td class='sumder' id='amtattritobank_row"+cnt1+"'>"+b[i].amtattritobank+"</td>"
						  +"<td class='sumder' id='acturecovcosts_row"+cnt1+"'>"+b[i].acturecovcosts+"</td>"
						  +"<td class='sumder' id='statwheasstwerpurbank_row"+cnt1+"'>"+b[i].statwheasstwerpurbank+"</td>"
				         

				                      +"<td  hidden id='del_row"+cnt1+"'>"+b[i].delflg+"</td>"	
				                      +"<td  hidden id='rcrusrid_row"+cnt1+"'>"+b[i].rcrusrid+"</td>"	
				                      +"<td  hidden id='rcrtme_row"+cnt1+"'>"+b[i].rcrtime+"</td>"	
				                      +"<td  hidden id='lchusrid_row"+cnt1+"'>"+b[i].lchgusrid+"</td>"	
				                      +"<td  hidden id='lchtme_row"+cnt1+"'>"+b[i].lchgtime+"</td>"	
				   				                      
				                    
				                      +"<td style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads("+cnt1+") id='edit"+cnt1+"'></td>"	
				                    
				                     						                     
				                      
				                    +"</tr>" ) ; 	
							
						
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
	location.href = "XBRL_REP_SUP1100_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
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
	if(b==1 ||b==6 || b==7 ){
		if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	    	
	        tr[i].style.display = "";
	       
	      } else {
	        tr[i].style.display = "none";
	      }
		 
		 
		 
	    } else{
	    	if(td.innerHTML.replace(/,/g,"").substring(0,input.value.length)==input.value){
				 tr[i].style.display = "";
			}else {
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
   
   
  
    
    <form class="form-horizontal" method="post" name="SUP1100Form"
		enctype="multipart/form-data">
    
    
    <div id="nav">
    <div class="loader"></div>
   
         <div id="tab3" >
			  
			 <input type="hidden" id="savecheck">
		    <input type="hidden" id="modflg">
		    <input type="hidden" id="modtyp">
	 	<div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			<div class="active" id="tab1" style="width: 2807px;padding-top: 1px;margin-top: -17px;" >
			<div style=" margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;"> SUP1100 - <b id="sub" style="display: none"></b></b><b>Statement of Sale by Levy<b id="sub"
					Style="display: none"></b></b></font>
			<br><br></div>
			<div id="divLoading"> 
    </div>
           <table class="table" style="width:2807px;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> 
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:right;background-color: #bbc3cb;width: 325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a><a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></td></tr>
          		  </table>
       
            <div class="panel panel-primary filterable">
           
             <table class="table" id="tbcate" border="1" style=" width:100%;   margin-top: -20px;">
            
			<tr class="filters">
						
				

						
						<th rowspan="2" style="width:100px;text-align:center;"><input type="text" style="width:100px;"id="cusname" onkeyup="myFunction(this.id,1)"class="form-control2" placeholder="Customer Name" disabled>
						
						</th>
						
						
						<th rowspan="2" style="width:100px;text-align:center;"><input type="text"  style="width:100px;"id="uqid" onkeyup="myFunction(this.id,2)"class="form-control2" placeholder="Unique identification number of customer" disabled>
						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;"><input type="text" style="width:100px;"id="sandt" onkeyup="myFunction(this.id,3)"class="form-control2" placeholder="Sanction Date" disabled>
						
						</th>
						<th rowspan="2" style="width:100px;text-align:center;"><input type="text" style="width:100px;"id=typfac onkeyup="myFunction(this.id,4)"class="form-control2" placeholder="Type of Facility" disabled>
						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;"> <input type="text" style="width:100px;"id="amtsanc" onkeyup="myFunction(this.id,5)"class="form-control2" placeholder="Amount Sanctioned" disabled>
						
						</th>
							
							
						<th rowspan="2" style="width:100px;text-align:center;" ><input type="text" style="width:100px;"id="prps" onkeyup="myFunction(this.id,6)"class="form-control2" placeholder="Purpose" disabled>

						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;" ><input type="text" style="width:100px;text-align:center;"id="detsec" onkeyup="myFunction(this.id,7)"class="form-control2" placeholder="Details of Security " disabled>
						
						</th>
						
						<th colspan="3" style="width:100px;text-align:center;"><input type="text" style="width:300px;text-align:center;"id="secvalrep" class="form-control" placeholder="Security Valuation Report	" disabled>	
						
						
						</th>
						
						
						
						
						<th rowspan="2" style="width:100px;text-align:center;"><input type="text" style="width:100px;"id="dtnpa" onkeyup="myFunction(this.id,8)"class="form-control2" placeholder="Date Classified as NPA" disabled>
						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;"><input type="text" style="width:100px;"id="estrsval" onkeyup="myFunction(this.id,9)"class="form-control2" placeholder="Estimated Realisable value of Security" disabled> 

						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;"><input type="text" style="width:100px;"id="amtpvsnmd" onkeyup="myFunction(this.id,10)"class="form-control2" placeholder="Amount of Provision Made" disabled>

						
						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;"><input type="text" style="width:100px;"id="dtlgac" onkeyup="myFunction(this.id,11)"class="form-control2" placeholder="Date on which Legal Action was Initiated" disabled>

						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;"><input type="text"  style="width:100px;"id="outbal" onkeyup="myFunction(this.id,12)"class="form-control2" placeholder="Outstanding Balance at foreclosure date" disabled>

						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;"><input type="text" style="width:100px;text-align:center;" id="dtslly" onkeyup="myFunction(this.id,13)"class="form-control2" placeholder="Date of  Sale by Levy" disabled>
						
						</th>	
							
						<th rowspan="2" style="width:160px;text-align:center;"><input type="text" style="width:160px;"id="lslrefno" onkeyup="myFunction(this.id,14)"class="form-control2" placeholder="Levy Sale Reference Number" disabled>

						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;"><input type="text" style="width:100px;"id="secenf" onkeyup="myFunction(this.id,15)"class="form-control2" placeholder="Security Enforced" disabled>

						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;"> <input type="text" style="width:100px;"id="dtatsale" onkeyup="myFunction(this.id,16)"class="form-control2" placeholder="Date of Actual Sale" disabled>

						
						</th>
						<th rowspan="2"  style="width:100px;text-align:center;"><input type="text" style="width:100px;"id="amtactsl" onkeyup="myFunction(this.id,17)"class="form-control2" placeholder="Amount of Actual Sale" disabled> 

						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;"><input type="text" style="width:100px;"id="amtatbtnk" onkeyup="myFunction(this.id,18)"class="form-control2" placeholder="Amount Attributed to bank" disabled>

						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;"><input type="text" style="width:100px;" id="actrvcst" onkeyup="myFunction(this.id,19)"class="form-control2" placeholder="Actual recovery costs" disabled>

						
						</th>
						<th rowspan="2" style="width:100px;text-align:center;"><input type="text" style="width:100px;"id="stasspur" onkeyup="myFunction(this.id,20)"class="form-control2" placeholder="State whether assets were purchased by the bank" disabled>

						
						</th>
						
						<th rowspan="3" style="width:50px;text-align:center;" id="modify">Modify

						
						</th>
					</tr> 
					
				<tr class="filters">
				<th ><input type="text" style="width:100px;text-align:center;" id="lstvaldt" onkeyup="myFunction(this.id,21)"class="form-control2" placeholder="Last Valuation Date" disabled> 
						
						
						</th>
						
						<th ><input type="text" style="width:100px;text-align:center;"  id="valsec" onkeyup="myFunction(this.id,22)"class="form-control2" placeholder="Value of security" disabled>
							
						
						</th>
						
						
						<th ><input type="text" style="width:100px;text-align:center;" id="namvlr" onkeyup="myFunction(this.id,23)"class="form-control2" placeholder="Name of valuer" disabled>
						
						
						</th>
		
	
				
				</tr>
						<tr>
						
						
						<th style="text-align:center;">A
						
						
						</th>
						
						
						<th style="text-align:center;">B
						
						</th>
						
						<th style="text-align:center;">C
						
						</th>
						<th style="text-align:center;">D
						
						</th>
						
						<th style="text-align:center;">E
						
						</th>
						<th style="text-align:center;">F
						
						
						</th>
						
						
						<th style="text-align:center;">G
						
						</th>
						
						<th style="text-align:center;">H
						
						</th>
						<th style="text-align:center;">I
						
						</th>
						
						<th style="text-align:center;">J
						
						</th>
						
						<th style="text-align:center;">K
						
						
						</th>
						
						
						<th style="text-align:center;">L
						
						</th>
						
						<th style="text-align:center;">M
						
						</th>
						<th style="text-align:center;">N
						
						</th>
						
						<th style="text-align:center;">O
						
						</th>
						<th style="text-align:center;">P
						
						
						</th>
						
						
						<th style="text-align:center;">Q
						
						</th>
						
						<th style="text-align:center;">R
						
						</th>
						<th style="text-align:center;">S
						
						</th>
						
						<th style="text-align:center;">T
						
						</th>
						
						<th style="text-align:center;">U
						
						
						</th>
						
						
						<th style="text-align:center;">V
						
						</th>
						
						<th style="text-align:center;">W
						
						</th>
						
											
						
					</tr>  
					
				
					<tbody class="databody" id="pymdets">


              </tbody>
              
             
            				
					
				</table>
				
				</div>
			  </div>	
				
				

				
				<div class="tab-pane" id="tab2" style="width: 2500px;padding-top: 1px;margin-top: -17px;">
<div style=" margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;"> SUP1100 - <b id="sub" style="display: none"></b></b><b>Statement of Sale by Levy<b id="sub"
					Style="display: none"></b></b></font>
			<br><br></div>
					
					 <div id="divLoading"> 
    </div>  <table class="table" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;">
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:right;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
					<table class="table" id="tbcates" border="1" style="margin-top: -21px;">
            
             <thead>
					
          
			<tr>
						<th rowspan="3"  style="width:50px;text-align:center;">Sr.No.</th>
						
				

						
						<th rowspan="2" style="width:250px;text-align:center;">Customer Name
						
						</th>
						
						
						<th rowspan="2" style="width:80px;text-align:center;">Unique identification number of customer
						
						</th>
						
						<th rowspan="2" style="width:70px;text-align:center;">Sanction Date
						
						</th>
						<th rowspan="2" style="width:50px;text-align:center;">Type of Facility
						
						</th>
						
						<th rowspan="2" style="width:150px;text-align:center;"> Amount Sanctioned
						
						</th>
							
							
						<th rowspan="2" style="width:100px;text-align:center;">Purpose

						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;">Details of Security 
						
						</th>
						
						<th colspan="3" style="width:100px;text-align:center;">Security Valuation Report		
						
						
						</th>
						
						<!-- <th >Last Valuation Date 
						
						
						</th>
						
						<th  >Value of security
							
						
						</th>
						
						
						<th >Name of valuer
						
						
						</th>	 -->
						
						
						<th rowspan="2" style="width:70px;text-align:center;">Date Classified as NPA
						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;">Estimated Realisable value of Security 

						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;">Amount of Provision Made

						
						
						</th>
						
						<th rowspan="2" style="width:70px;text-align:center;">Date on which Legal Action was Initiated

						
						</th>
						
						<th rowspan="2" style="width:70px;text-align:center;">Outstanding Balance at foreclosure date

						
						</th>
						
						<th rowspan="2" style="width:70px;text-align:center;">Date of  Sale by Levy
						
						</th>	
							
						<th rowspan="2" style="width:100px;text-align:center;">Levy Sale Reference Number

						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;">Security Enforced

						
						</th>
						
						<th rowspan="2" style="width:70px;text-align:center;"> Date of Actual Sale

						
						</th>
						<th rowspan="2" style="width:100px;text-align:center;" > Amount of Actual Sale

						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;">Amount Attributed to bank

						
						</th>
						
						<th rowspan="2" style="width:100px;text-align:center;">Actual recovery costs

						
						</th>
						<th rowspan="2" style="width:100px;text-align:center;">State whether assets were purchased by the bank

						
						</th>
						
						<th rowspan="3" style="width:50px;text-align:center;">Select

						
						</th>
					</tr> 
					
				<tr>
				<th style="width:70px;text-align:center;">Last Valuation Date 
						
						
						</th>
						
						<th style="width:50px;text-align:center;" >Value of security
							
						
						</th>
						
						
						<th style="width:50px;text-align:center;">Name of valuer
						
						
						</th>
		
	
				
				</tr>
						<tr>
						
						
						<th style="text-align:center;">A
						
						
						</th>
						
						
						<th style="text-align:center;">B
						
						</th>
						
						<th style="text-align:center;">C
						
						</th>
						<th style="text-align:center;">D
						
						</th>
						
						<th style="text-align:center;">E
						
						</th>
						<th style="text-align:center;">F
						
						
						</th>
						
						
						<th style="text-align:center;">G
						
						</th>
						
						<th style="text-align:center;">H
						
						</th>
						<th style="text-align:center;">I
						
						</th>
						
						<th style="text-align:center;">J
						
						</th>
						
						<th style="text-align:center;">K
						
						
						</th>
						
						
						<th style="text-align:center;">L
						
						</th>
						
						<th style="text-align:center;">M
						
						</th>
						<th style="text-align:center;">N
						
						</th>
						
						<th style="text-align:center;">O
						
						</th>
						<th style="text-align:center;">P
						
						
						</th>
						
						
						<th style="text-align:center;">Q
						
						</th>
						
						<th style="text-align:center;">R
						
						</th>
						<th style="text-align:center;">S
						
						</th>
						
						<th style="text-align:center;">T
						
						</th>
						
						<th style="text-align:center;">U
						
						
						</th>
						
						
						<th style="text-align:center;">V
						
						</th>
						
						<th style="text-align:center;">W
						
						</th>
						
											
						
					</tr> 
				
              
              <tbody class="databody" id="test">
	             </tbody>
            				
					
				</table>
				<div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
            <!--     <button type="button" class="btn btn-xs btn-primary" value="Excel" >Generate Excel</button> -->
                 <!-- <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnExcelSum">Gen Sum</button> -->
               <!--   <button type="button" class="btn btn-xs btn-primary" value="Pdf" id="btnPdf">Generate PDF</button> -->
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
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