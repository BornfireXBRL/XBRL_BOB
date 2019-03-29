<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLFIM0300Bean,dao.XBRLFIM0300Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
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
   
   XBRLFIM0300Dao dmd=new XBRLFIM0300Dao();
   ArrayList<XBRLFIM0300Bean> list=new ArrayList<XBRLFIM0300Bean>();
    
   
  // ArrayList<XBRLFIM0300Bean> listsum=dmd.xbrlpymsum(dt1,dt2,ReporefSeq);
	  
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

.clr{
color: #0c0b0b;
    background-color: #f5f5f5;
    border-color: #f5f5f5;
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
#fimdets td{
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
.databody td{
border:1px solid #ddd;
}
 
.ui-dialog-titlebar-close {
    visibility: hidden;
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
</style>



<script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});

/* checking count in FIM0300_MOD_TABLE for  redirecting to XBRL_VER_FIM0300_01.jsp */
var det={
	"repdate":'<%=dt2%>',"type":"chckmodified"
};
$.ajax({
	url:"FIM0300chckmodified",
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
			        	location.href = "XBRL_CRT_FIM0300_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
			        }
			      }
			    });
			
			
		}else{
			$("#modflg").val("N");
		}
	}
});

</script>
<script>
function myFunction(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("fimdets");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==2 ||b==3 || b==4 ||b==5||b==6|| b==7){
		
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
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	
	$("#addrowno").val("0");
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');
	$("#sumfirst").on("click",function(){ 
	
		 location.href = "XBRL_REP_FIM0300_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
	<%-- 	fnsummary('<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>');  --%>
			
		 });
	$(".det").on("click",function(){
		
		<%-- fundetails('<%=repname%>','<%=ReporefSeq%>',0,'<%=dt2%>','<%=dt1%>',"onload");  --%>
		location.href = "XBRL_REP_FIM0300_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '#btnback').click(function() {
		 location.href="XBRL_CRT_FIM0300_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	$('#btnExcel').click(function() {
		//alert("srdgihsdukl");//return false;
		 FIM0300Form.action = "FIM0300EXCELREPORT.action?method=FIM0300EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 FIM0300Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 FIM0300Form.action = "FIM0300EXCELSum.action?method=FIM0300EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 FIM0300Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 FIM0300Form.action = "FIM0300PDFREPORT.action?method=FIM0300PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 FIM0300Form.submit();
		}
	});
	$('#btnXML').click(function() {
		//alert("FIM0300EXCELSum");//return false;
		
		  FIM0300Form.action = "XMLDOWNLOAD.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 FIM0300Form.submit(); 
	});


	var hh=0;

	 $('#btnSave').on("click",function() {
		 alert("bgvfj");	
	 	if((hh==0)&&($("#savecheck").val()==0)){
	 		
	 			if($("#savecheck").val()==0){
	 				 alert("bgvfj");

	 				var datasum={
	 						 						"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").val()
	 						 				};
	 				$("#divLoading").addClass('show'); 
	 			 
	 				$.ajax({
	 					url:"saveSumFIM0300",
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
	 				        	alert("bgvfj");	
	 				   		$.ajax({
	 				   		url:"saveSumFIM0300",
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
		$("#fimdets").prepend("<tr  id='fimadd"+rowno+"'><td id='country_row"+rowno+"'><input type='text' id='country_text"+rowno+"' style='width: 80px;'></td><td id='currencycode_row"+rowno+"'><input type='text'  id='currencycode_text"+rowno+"' style='    width:80px;'></td><td id='units_row"+rowno+"'><input type='text' id='units_text"+rowno+"' style='     width: 80px;'></td><td id='ttbrate_row"+rowno+"'><input type='text' 	id='ttbrate_text"+rowno+"' style='    width: 80px;'></td><td id='tcbrate_row"+rowno+"'><input type='text' id='tcbrate_text"+rowno+"' style='    width: 80px;'></td><td id='ntbrate_row"+rowno+"'><input type='text' id='ntbrate_text"+rowno+"' style='width: 80px;'></td><td id='ttsrate_row"+rowno+"'><input type='text' id='ttsrate_text"+rowno+"' style='width:80px;'></td><td id='ntcrate_row"+rowno+"'><input type='text' id='ntcrate_text"+rowno+"' style='width:80px;'></td><td style='text-align:center;'><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')>  <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px;display:inline-block; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");


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
 	
 	var	units =  document.getElementById("units_row"+no);
 	var	units_data = units.innerHTML;

 	var	ttbrate =  document.getElementById("ttbrate_row"+no);
 	var ttbrate_data = ttbrate.innerHTML;
 	
 	var	tcbrate =  document.getElementById("tcbrate_row"+no);
 	var	tcbrate_data = tcbrate.innerHTML;

 	var	ntbrate =  document.getElementById("ntbrate_row"+no);
 	var	ntbrate_data = ntbrate.innerHTML;

 	var	ttsrate =  document.getElementById("ttsrate_row"+no);
 	var	ttsrate_data = ttsrate.innerHTML;

 	var	ntcrate =  document.getElementById("ntcrate_row"+no);
 	var	ntcrate_data = ntcrate.innerHTML;



 	units.innerHTML="<input type='text' class='decimalPt roundUp'  id='units_text"+no+"'  style='width: 83px'; value='"+units_data+"'>";
 	ttbrate.innerHTML="<input type='text' class='decimalPt roundUp'  id='ttbrate_text"+no+"'  style='width: 83px'; value='"+ttbrate_data+"'>";
 	tcbrate.innerHTML="<input type='text' class='decimalPt roundUp'  id='tcbrate_text"+no+"'  style='width: 83px'; value='"+tcbrate_data+"'>";
 	ntbrate.innerHTML="<input type='text' class='decimalPt roundUp'  id='ntbrate_text"+no+"'  style='width: 83px'; value='"+ntbrate_data+"'>";
 	ttsrate.innerHTML="<input type='text' class='decimalPt roundUp'  id='ttsrate_text"+no+"'  style='width: 83px'; value='"+ttsrate_data+"'>";
 	ntcrate.innerHTML="<input type='text' class='decimalPt roundUp'  id='ntcrate_text"+no+"'  style='width: 83px'; value='"+ntcrate_data+"'>";

 	 
 	 
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
	
		
		if(document.getElementById("units_text"+no).value==""){
			alert("Enter Units ..");
			error="Y"
		}else if(document.getElementById("ttbrate_text"+no).value==""){
			alert("Enter Unique Id ..");
			error="Y"
		}else if(document.getElementById("tcbrate_text"+no).value==""){
			alert("Enter Type Of Party ..");
			error="Y"
		}else if(document.getElementById("ntbrate_text"+no).value==""){
			alert("Enter Relationship ..");	
			error="Y"
		}else if(document.getElementById("ttsrate_text"+no).value==""){
			alert("Enter Approval Date..");
			error="Y"
		}else if(document.getElementById("ntcrate_text"+no).value==""){
			alert("Enter Original Currency..");
			error="Y"
		}
	} else if (modtyp=="A") {
		
	

	



		if(document.getElementById("country_text"+no).value==""){
			alert("Enter Group name ..");
			error="Y"
		}else if(document.getElementById("currencycode_text"+no).value==""){
			alert("Enter Group Id ..");	
			error="Y"
		}else if(document.getElementById("units_text"+no).value==""){
			alert("Enter Party Name ..");
			error="Y"
		}else if(document.getElementById("ttbrate_text"+no).value==""){
			alert("Enter Unique Id ..");
			error="Y"
		}else if(document.getElementById("tcbrate_text"+no).value==""){
			alert("Enter Type Of Party ..");
			error="Y"
		}else if(document.getElementById("ntbrate_text"+no).value==""){
			alert("Enter Relationship ..");	
			error="Y"
		}else if(document.getElementById("ttsrate_text"+no).value==""){
			alert("Enter Approval Date..");
			error="Y"
		}else if(document.getElementById("ntcrate_text"+no).value==""){
			alert("Enter Original Currency..");
			error="Y"
		}
		alert("gu");
	}

	if (error=="N"){
	$("#modflg").val("Y");
	modtyp="M";
	document.getElementById("edit_button"+no).checked = false;



	var units_val=document.getElementById("units_text"+no).value;

	document.getElementById("units_row"+no).innerHTML=units_val;

	var ttbrate_val=document.getElementById("ttbrate_text"+no).value;
	document.getElementById("ttbrate_row"+no).innerHTML=ttbrate_val;
	
	
	alert("dbgj");
	
var tcbrate_val=document.getElementById("tcbrate_text"+no).value;	
document.getElementById("tcbrate_row"+no).innerHTML=tcbrate_val;



var  ntbrate_val=document.getElementById("ntbrate_text"+no).value;	 
document.getElementById("ntbrate_row"+no).innerHTML=ntbrate_val;



var ttsrate_val=document.getElementById("ttsrate_text"+no).value;	
document.getElementById("ttsrate_row"+no).innerHTML=ttsrate_val;

var  ntcrate_val=document.getElementById("ntcrate_text"+no).value;	 
document.getElementById("ntcrate_row"+no).innerHTML=ntcrate_val;
alert("hjki");
	if($("#addrowno").val()=="1"  ){
		modtyp="A";
	
		alert("hjkfsdi");
		
		var  country_val=document.getElementById("country_text"+no).value;	 
		document.getElementById("country_row"+no).innerHTML=country_val;


		alert("hjkfsdi4");
		var currencycode_val=document.getElementById("currencycode_text"+no).value;
		document.getElementById("currencycode_row"+no).innerHTML=currencycode_val;

		alert("hjkfsdi234");

		


		

		alert("hjki1");
		  
	
	}else{
		alert("hjfdki");
		document.getElementById("Cancel_button"+no).style.display="inline-block";
		document.getElementById("Cancel_btn"+no).style.display="none";
	}
	
	document.getElementById("edit_button"+no).style.display="inline-block";
	document.getElementById("save_button"+no).style.display="none";


	var country=document.getElementById("country_row"+no).innerHTML;	 

	var currencycode=document.getElementById("currencycode_row"+no).innerHTML;
	var units=document.getElementById("units_row"+no).innerHTML;

	var ttbrate=document.getElementById("ttbrate_row"+no).innerHTML;

	var tcbrate=document.getElementById("tcbrate_row"+no).innerHTML;

	var ntbrate=document.getElementById("ntbrate_row"+no).innerHTML;
	
	var ttsrate=document.getElementById("ttsrate_row"+no).innerHTML;
	var ntcrate=document.getElementById("ntcrate_row"+no).innerHTML;
	 

	  $("#fimadd"+no).addClass("rowaddedd");
	
	var refeFIM0300=document.getElementById("refDisplay").value;
	



	
	alert("hjkeqwri");
	 var rptdate1 = {
	 		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeFIM0300,"country":country,"currencycode":currencycode,"units":units,"ttbrate":ttbrate,"tcbrate":tcbrate,"ntbrate":ntbrate,"ttsrate":ttsrate,"ntcrate":ntcrate,"modtyp":modtyp  
	 		}; 
	 alert("dsdasgfhjki");
	 $.ajax({
	    url : "FIM0300",
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

	        	var country=document.getElementById("country_row"+no).innerHTML;	 

	        	var currencycode=document.getElementById("currencycode_row"+no).innerHTML;
	        	var units=document.getElementById("units_row"+no).innerHTML;

	        	var ttbrate=document.getElementById("ttbrate_row"+no).innerHTML;

	        	var tcbrate=document.getElementById("tcbrate_row"+no).innerHTML;

	        	var ntbrate=document.getElementById("ntbrate_row"+no).innerHTML;
	        	
	        	var ttsrate=document.getElementById("ttsrate_row"+no).innerHTML;
	        	var ntcrate=document.getElementById("ntcrate_row"+no).innerHTML;
	        	
	        	var refeFIM0300=document.getElementById("refDisplay").value;
	        	




	        	var rptdate1 = {
	   	 		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeFIM0300,"country":country,"currencycode":currencycode,"units":units,"ttbrate":ttbrate,"tcbrate":tcbrate,"ntbrate":ntbrate,"ttsrate":ttsrate,"ntcrate":ntcrate,"modtyp":modtyp  
	   			}; 
	        	
	        	 $.ajax({
	        	     url : "FIM0300",
	        	     data : rptdate1  ,
	        			dataType : 'json', 
	        			type : 'POST',
	        			async : true,
	        			 success : function(res) {
	        				 console.log(res.refno);
	        				//	alert("refeDCG100"+refeDCG100);
	        				
	        				// alert("sfsdf");
	        				 $("#refDisplay").val(res.refno);
	        				
			  alert("cgg");
	        				 $("#fimadd"+no).closest("tr").remove();

			   
	        				
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
			"country":$("#country_row"+no).text(),"reportDate":'<%=dt2%>'
	};

	 $.ajax({
	     url : "FIM0300cancel",
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

 var units_val=document.getElementById("units_text"+no).value;

 document.getElementById("units_row"+no).innerHTML=units_val;

 var ttbrate_val=document.getElementById("ttbrate_text"+no).value;
	document.getElementById("ttbrate_row"+no).innerHTML=ttbrate_val;
	
	
	alert("dbgj");
	
var tcbrate_val=document.getElementById("tcbrate_text"+no).value;	
document.getElementById("tcbrate_row"+no).innerHTML=tcbrate_val;



var  ntbrate_val=document.getElementById("ntbrate_text"+no).value;	 
document.getElementById("ntbrate_row"+no).innerHTML=ntbrate_val;



var ttsrate_val=document.getElementById("ttsrate_text"+no).value;	
document.getElementById("ttsrate_row"+no).innerHTML=ttsrate_val;

var  ntcrate_val=document.getElementById("ntcrate_text"+no).value;	 
document.getElementById("ntcrate_row"+no).innerHTML=ntcrate_val;
 
		$("#edit_button"+no).show();
		/* document.getElementById("edit_button"+no).style.display="block"; */
		document.getElementById("save_button"+no).style.display="none";
		document.getElementById("Cancel_btn"+no).style.display="none";
		 location.reload(true);
		 
		  var units=document.getElementById("units_row"+no).innerHTML;
		
		  var ttbrate=document.getElementById("ttbrate_row"+no).innerHTML;

      	var tcbrate=document.getElementById("tcbrate_row"+no).innerHTML;

      	var ntbrate=document.getElementById("ntbrate_row"+no).innerHTML;
      	
      	var ttsrate=document.getElementById("ttsrate_row"+no).innerHTML;
      	var ntcrate=document.getElementById("ntcrate_row"+no).innerHTML;
		  
		  if($("#fimadd"+no).hasClass( "rowaddedd" )){
			  
			  document.getElementById("Cancel_button"+no).style.display="inline-block";


		  }else{
			  document.getElementById("Cancel_button"+no).style.display="none";
		  }
		  
		
 }

 
 function Canadd_row(no){
	 
	  /* document.getElementById("del_button"+no).style.display="inline-block"; */

																   

	 if($("#fimadd"+no).hasClass( "rowaddedd" )){
		
		var detcancel={
				"country":$("#country_row"+no).text(),"reportDate":'<%=dt2%>'
		};
		

		 $.ajax({
		     url : "FIM0300cancel",
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
	 $("#fimadd"+no).remove();
	 
 }
</script> 




<script>
$(document).ready(function(){
	
	
	$("#btnfilter").on("click",function(){
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
			$('#country,#currencycode,#units,#ttbrate,#tcbrate,#ntbrate,#ttsrate,#ntcrate').css({
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
			
			$('#country,#currencycode,#units,#ttbrate,#tcbrate,#ntbrate,#ttsrate,#ntcrate').css({
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
			  
				 table = document.getElementById("fimdets");
				 tr = table.getElementsByTagName("tr");
				 for (i = 0; i < tr.length; i++) {
					 
						 
						 tr[i].style.display = ""; 
						 
				 
					 
				 }
		}
		
	});
	
	
});

</script>


<script>
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
	$("#btnXML").show();
	 $("#btnSave").show();
	 var save=0;
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
			 $("#divLoading").addClass("show");
			 /*   $(".loader").fadeOut("slow"); */
				 var fim0300 = {
							"repname" : a,"ReporefSeq" : refno,"instno" : ins, "dt2" : e, "curr":g  
						}; 
				 //alert("inside the ajaxxxxxxxxxxxxx");
				$.ajax({
					url : "fim0300details",
					data : fim0300,
					dataType : 'json',
					type : 'POST',
					async : true,
					success : function(res) {	
					//	alert("refePYM100"+refePYM100);
						
						  $("#fimdets tr").remove();						 
						
						var b=JSON.parse(res.detFIM0300);
						 console.log(b);
							
									//alert(f);
					
							 	if(f=="onload"){
							 		$("#modify").show();
							 		for(var i=0;i<b.length;i++){
							 		
							 		  $("#fimdets").append(
												 
																							
							 				  "<tr id='fimadd"+srno+"'>"

							                      +"<td  id='country_row"+srno+"'>"+b[i].country+"</td>"	
							                      +"<td  id='currencycode_row"+srno+"'>"+b[i].currencycode+"</td>"	
							                      +"<td  id='units_row"+srno+"'>"+b[i].units+"</td>"
							                      
							                      +"<td style=text-align:right; id='ttbrate_row"+srno+"'>"+b[i].ttbrate+"</td>"
							                      +"<td  style=text-align:right; id='tcbrate_row"+srno+"'>"+b[i].tcbrate+"</td>"
							                      +"<td  style=text-align:right; id='ntbrate_row"+srno+"'>"+b[i].ntbrate+"</td>"
							                      
							                      +"<td style=text-align:right; id='ttsrate_row"+srno+"'>"+b[i].ttsrate+"</td>"
							                      +"<td style=text-align:right; id='ntcrate_row"+srno+"'>"+b[i].ntcrate+"</td>"	
							         

							                      +"<td  hidden id='del_row"+srno+"'>"+b[i].delflg+"</td>"	
							                      +"<td  hidden id='rcrusrid_row"+srno+"'>"+b[i].rcrusrid+"</td>"	
							                      +"<td  hidden id='rcrtme_row"+srno+"'>"+b[i].rcrtime+"</td>"	
							                      +"<td  hidden id='lchusrid_row"+srno+"'>"+b[i].lchgusrid+"</td>"	
							                      +"<td  hidden id='lchtme_row"+srno+"'>"+b[i].lchgtime+"</td>"	
							                     
							                      
							                    
												  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
							                    
							                     						                     
							                      
							                    +"</tr>" ) ;  
							 		 
									/*  $("#chqamt_row"+srno+"").html(parseFloat(document.getElementById("chqamt_row"+srno+"").innerHTML).toFixed(2)); */
									
									 srno++;
									 
									 
									 
										} $("#divLoading").removeClass('show');
									$("#rowno").val(srno);
							 	 	}else if(f=="frmsum"){
							 	 		$(".add").hide();
								 		/* $("").padStart(6, "0");.padStart(6, "0"); */
								 		$("#modify").hide();
								 		for(var i=0;i<b.length;i++){
								 			
								 		  $("#fimdets").append(
													 
													
													
								 				 "<tr>"

							                      +"<td  id='country_row"+srno+"'>"+b[i].country+"</td>"	
							                      +"<td  id='currencycode_row"+srno+"'>"+b[i].currencycode+"</td>"	
							                      +"<td  id='units_row"+srno+"'>"+b[i].units+"</td>"
							                      
							                      +"<td style=text-align:right; id='ttbrate_row"+srno+"'>"+b[i].ttbrate+"</td>"
							                      +"<td  style=text-align:right; id='tcbrate_row"+srno+"'>"+b[i].tcbrate+"</td>"
							                      +"<td  style=text-align:right; id='ntbrate_row"+srno+"'>"+b[i].ntbrate+"</td>"
							                      
							                      +"<td style=text-align:right; id='ttsrate_row"+srno+"'>"+b[i].ttsrate+"</td>"
							                      +"<td style=text-align:right; id='ntcrate_row"+srno+"'>"+b[i].ntcrate+"</td>"	
							         
							         

							                      +"<td  hidden id='del_row"+srno+"'>"+b[i].delflg+"</td>"	
							                      +"<td  hidden id='rcrusrid_row"+srno+"'>"+b[i].rcrusrid+"</td>"	
							                      +"<td  hidden id='rcrtme_row"+srno+"'>"+b[i].rcrtime+"</td>"	
							                      +"<td  hidden id='lchusrid_row"+srno+"'>"+b[i].lchgusrid+"</td>"	
							                      +"<td  hidden id='lchtme_row"+srno+"'>"+b[i].lchgtime+"</td>"	
							                     
							                      
							                    
							                     						                     
							                      
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
				$("#tab2").show();
				$("#tab1").hide();
				 $(".summ").addClass("clr");
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
				
					 var fim0300 = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins, "dt2" : e, "curr":g  
							}; 
					 //alert("inside the ajaxxxxxxxxxxxxx");
					$.ajax({
						url : "fim0300details",
						data : fim0300,
							dataType : 'json', 
							type : 'POST',
							async : true,
							 success : function(res) {
								 //console.log(res.refnoAB);
						
						console.log(res.detFIM0300);
					
						var b=JSON.parse(res.detFIM0300);
						
						var k=1;
						var cnt1=1;
						
						
						for (var i = 0; i < b.length; i++) {
						

	
							$("#test").append(
							
							"<tr>"

				                      +"<td  id='country_row"+srno+"'>"+b[i].country+"</td>"	
				                      +"<td  id='currencycode_row"+srno+"'>"+b[i].currencycode+"</td>"	
				                      +"<td  id='units_row"+srno+"'>"+b[i].units+"</td>"
				                      
				                      
				                      +"<td style=text-align:right; id='ttbrate_row"+srno+"'>"+b[i].ttbrate+"</td>"
				                      +"<td  style=text-align:right; id='tcbrate_row"+srno+"'>"+b[i].tcbrate+"</td>"
				                      +"<td  style=text-align:right; id='ntbrate_row"+srno+"'>"+b[i].ntbrate+"</td>"
				                      
				                      +"<td style=text-align:right; id='ttsrate_row"+srno+"'>"+b[i].ttsrate+"</td>"
				                      +"<td style=text-align:right; id='ntcrate_row"+srno+"'>"+b[i].ntcrate+"</td>"	
				         

				                      +"<td  hidden id='del_row"+srno+"'>"+b[i].delflg+"</td>"	
				                      +"<td  hidden id='rcrusrid_row"+srno+"'>"+b[i].rcrusrid+"</td>"	
				                      +"<td  hidden id='rcrtme_row"+srno+"'>"+b[i].rcrtime+"</td>"	
				                      +"<td  hidden id='lchusrid_row"+srno+"'>"+b[i].lchgusrid+"</td>"	
				                      +"<td  hidden id='lchtme_row"+srno+"'>"+b[i].lchgtime+"</td>"	
				                     
				                      
				                    
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
	 /* Hide & show of GEN Xml button */
	 var datasum={
	 			"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>'
	 	};
	 $.ajax({
	 		url:"savecheckFIM0300",
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
	
	<%-- "load","<%=dt1%>","<%=dt2%>","'+refno+'","'+cnt1+'","<%=reptype%>","frmsum" --%>
	location.href = "XBRL_REP_FIM0300_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</script>


<style>
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
   
   
  
    
    <form class="form-horizontal" method="post" name="FIM0300Form"
		enctype="multipart/form-data">
    
    <input type="hidden" id="fnloadval">
		<input type="hidden" id="savecheck">
		 <input type="hidden" id="modflg">
		 <input type="hidden" id="modtyp">
		 <input type="hidden"  value="1" id="rownoadd">
    <div id="nav">
    <div class="loader"></div>
   
         <div id="tab3" >
			  
			  <%--  <div class="panel-heading text-center" style="width: 103%;margin-left: 0px;margin-right: 0px;m;margin-top: 26px;argin-bottom: 0px;background-color: #bbc3cb;padding-bottom: 50px;">
			
			
			
			<div class="pull-left" style="width: 200px;text-align: left;">
			 <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" id="refDisplay"><%if(ReporefSeq != null){%><%=ReporefSeq%><%}
			else{%>0<%}%></b></font>
			</div>
			
			
		
            
			<div>
			<font size="2" style="font-size: 13px;" ><b>Statistics for Interbank Clearing Cheques<b id="sub"
					Style="display: none"></b></b></font>
			
			</div> 
			
			<div>
			<b style="font-size: 13px;"> PYM 0100 <b id="sub" style="display: none"></b></b> 
			</div> 
			
			
			
                <div class="pull-right" style="margin-top: -36px;">
               
					
				<a  class="btn btn-xs btn-primary" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a>
          		 
          		  	
						
				
               
                </div>
			
              
            </div> --%>
            
            
            
            
            
            

 
		
	 	<div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			<div class="active" id="tab1" style="width: 956px;padding-top: 1px;margin-top: -17px;" >
			<div style=" margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;"> FIM0300 - <b id="sub" style="display: none"></b></b><b>Indicative Exchange Rates<b id="sub"
					Style="display: none"></b></b></font>
			<br><br></div>
			<div id="divLoading"> 
    </div>
           <table class="table" style="width:956px;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> <!-- <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font> -->
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></input></font></td><td style="text-align:right;background-color: #bbc3cb;width: 325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a><a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a>



    </td></tr>
          		  </table>
       
            <div class="panel panel-primary filterable">
            
           
             <table class="table" id="tbcate" border="1" style="    margin-top: -20px;">
            
			<tr class="filters">
						<th  rowspan="5" style="width:80px;text-align:center;"><textarea type="text" id="country" style="width:80px;text-align:center;" onkeyup="myFunction(this.id,0)" class="form-control2" placeholder="Country" disabled></textarea></th>
						
						<th rowspan="5" style="width:80px;text-align:center;"><textarea type="text"  style="width:80px;text-align:center;" id="currencycode" onkeyup="myFunction(this.id,1)" class="form-control2" placeholder="Currency ISO Code" disabled></textarea></th>
						<th rowspan="5" style="width:80px;text-align:center;"><textarea type="text" style="width:80px;text-align:center;" id="units" onkeyup="myFunction(this.id,2)" class="form-control2" placeholder="Units" disabled></textarea></th>
						
						

					</tr> 
					
					
					<tr>
	
						<th colspan="3" style="width:150px;text-align:center;">BUYING</th>
						
						
						<th colspan="2" style="width:150px;text-align:center;">SELLING</th>
						
						<th style='text-align:center;width:100px;' rowspan="5" id="modify">Modify</th>
						
					</tr> 
					
					
					
					<tr class="filters">
						
						
						<th  style="width:80px;,text-align:center;"><textarea  style="width:80px;,text-align:center;" type="text" id="ttbrate" onkeyup="myFunction(this.id,3)" class="form-control2" placeholder="T.T" disabled></textarea>
						
						</th>
						
						
						<th  style="width:80px;,text-align:center;"><textarea  style="width:80px;,text-align:center;" type="text" id="tcbrate" onkeyup="myFunction(this.id,4)" class="form-control2" placeholder="T.C/D.D" disabled></textarea>
						
						</th>
						
						<th  style="width:80px;,text-align:center;"><textarea  style="width:80px;,text-align:center;" type="text" id="ntbrate" onkeyup="myFunction(this.id,5)" class="form-control2" placeholder="NOTES" disabled></textarea>
						
						</th>
						<th  style="width:80px;,text-align:center;"><textarea  style="width:80px;,text-align:center;" type="text" id="ttsrate" onkeyup="myFunction(this.id,6)" class="form-control2" placeholder="T.T./D.D/T.C" disabled></textarea>
						
						</th>
						
						<th  style="width:80px;,text-align:center;"><textarea  style="width:80px;,text-align:center;" type="text" id="ntcrate" onkeyup="myFunction(this.id,7)" class="form-control2" placeholder="NOTES" disabled></textarea>
						
						</th>
							
						
					</tr> 
					
				
						<tr>
						
						
						<th >A
						
						
						</th>
						
						
						<th >B
						
						</th>
						
						<th >C
						
						</th>
						<th >D
						
						</th>
						
						<th >E
						
						</th>
											
						
					</tr> 
					
				
					<tbody class="databody" id="fimdets">


              </tbody>
              
             
            				
					
				</table>
				
				</div>
				
			  </div>	
				
				
				
 
				
   
				
				<div class="tab-pane" id="tab2" style="width: 943px;padding-top: 1px;margin-top: -17px;">
<div style=" margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;"> FIM0300 - <b id="sub" style="display: none"></b></b><b>Indicative Exchange Rates<b id="sub"
					Style="display: none"></b></b></font>
			<br><br></div>
					
					 <div id="divLoading"> 
    </div>  <table class="table" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <!-- <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font> -->
			 <font size="1"><input type="hidden"  style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></input></font></td><td style="text-align:right;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
					<table class="table" id="tbcates" border="1" style="margin-top: -21px;">
            
             <thead>
					


					
            
			<tr>
						<th  rowspan="5" style="width:150px;">Country</th>
						
							<th rowspan="5" style="width:70px;">Currency ISO Code</th>
						<th rowspan="5" style="width:100px;">Units</th>
						

					</tr> 
					
					
					<tr>
						
						
						<th colspan="3" style="text-align:center;" >BUYING</th>
						
						
						<th colspan="2" style="text-align:center;">SELLING</th>
						
						<th  style='text-align:center;' rowspan="5">Select</th>
						
					</tr> 
					
					
					
					<tr>
						
						
						<th >T.T
						
						</th>
						
						
						<th >T.C/D.D
						
						</th>
						
						<th >NOTES
						
						</th>
						<th >T.T./D.D/T.C
						
						</th>
						
						<th >NOTES
						
						</th>
							
						
					</tr> 
					
				
						<tr>
						
						
						<th style="width:100px;">A
						
						
						</th>
						
						
						<th style="width:100px;">B
						
						</th>
						
						<th style="width: 100px;">C
						
						</th>
						<th style="width:100px;">D
						
						</th>
						
						<th style="width: 100px;">E
						
						</th>
											
						
					</tr> 
					
				
              
              <tbody class="databody" id="test">
	             </tbody>
            				
					
				</table>
				<div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
            <!--     <button type="button" class="btn btn-xs btn-primary" value="Excel" >Generate Excel</button> -->
                 <!-- <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnExcelSum">Gen Sum</button> -->
               <!--   <button type="button" class="btn btn-xs btn-primary" value="Pdf" id="btnPdf">Generate PDF</button> -->
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
                <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button>
            </div>


			</div>
			
			
         
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