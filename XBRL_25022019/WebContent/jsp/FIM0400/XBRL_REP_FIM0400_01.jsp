<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLFIM0400Bean,dao.XBRLFIM0400Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
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
   
   XBRLFIM0400Dao dmd=new XBRLFIM0400Dao();
   ArrayList<XBRLFIM0400Bean> list=new ArrayList<XBRLFIM0400Bean>();
    
   
  // ArrayList<XBRLFIM0400Bean> listsum=dmd.xbrlpymsum(dt1,dt2,ReporefSeq);
	  
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
padding:1px;
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
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding:5px;}
    
    .ui-dialog-titlebar-close {
    visibility: hidden;
}
.hidden {
  display: none;
}

 
</style>
<script>
$(document).ready(function(){

	
	
	

	
	
	
	
	$("#btnfilter").on("click",function(){
		
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
			 $('#trantype,#cntrptyuid,#cntrptyname,#setr,#curncyiso,#amt,#spotrate,#insbs,#insqu,#duedt,#frdrt').css({
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
		
			/* document
			.getElementById("1","2")
			.setAttribute("style","text-align:center;height:44px;width:70px;white-space:pre-wrap;scroll:none;word-wrap:break-word;resize: none;background-color: white;");
		 */
		}else{
			$(".form-control2").val("");
			$(".form-control2").prop("disabled",true);
			
			 $('#trantype,#cntrptyuid,#cntrptyname,#setr,#curncyiso,#amt,#spotrate,#insbs,#insqu,#duedt,#frdrt').css({
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
	if(b==5){
		
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
		
		var det={
				"repdate":'<%=dt2%>',"type":"chckmodified"
			};
			$.ajax({
				url:"FIM0400chckmodified",
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
						        	location.href = "XBRL_CRT_FIM0400_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
						        }
						      }
						    });
						
						
					}else{
						$("#modflg").val("N");
					}
				}
			});
			
			var hh=0;
			
			$('#btnSave').on("click",function() {
				
				$("#divLoading").addClass('show'); 
				
				
				if((hh==0)&&($("#savecheck").val()==0)){
			 		
		 			if($("#savecheck").val()==0){
		 				
		 			
					  var datasum={
							"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").val()
					};
					$.ajax({
						  

						url:"saveSumbls1",
						data:datasum,
						dataType:'json',
						type:'POST',
						async:true,
						success:function(res){
							
							alert("Saved Successfully");
							save++;
							
								
							 $("#divLoading").removeClass('show');
						}
					});  
					$("#btnXML").prop("disabled",false);
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
		 				   		$.ajax({
		 				   			url:"saveSumbls1",
		 				   			data:datasum,
		 								dataType:'json',
		 								type:'POST',
		 								async:true,
		 								success:function(res){
		 									alert("Saved Successfully");
		 									
		 							
		 							 $("#divLoading").removeClass('show');
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
		
	$("#sumfirst").on("click",function(){ 

		 location.href = "XBRL_REP_FIM0400_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 

	 });
	$("#addrowno").val("0");
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');
	
	<%-- 	fnsummary('<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>');  --%>
			
	
	$(".det").on("click",function(){
		
		<%-- fundetails('<%=repname%>','<%=ReporefSeq%>',0,'<%=dt2%>','<%=dt1%>',"onload");  --%>
		location.href = "XBRL_REP_FIM0400_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( ".btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '.btnback').click(function() {
		 location.href="XBRL_CRT_FIM0400_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	$('#btnExcel').click(function() {
		//alert("srdgihsdukl");//return false;
		 FIM0400Form.action = "FIM0400EXCELREPORT.action?method=FIM0400EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 FIM0400Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 FIM0400Form.action = "FIM0400EXCELSum.action?method=FIM0400EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 FIM0400Form.submit();
			}else if($("#dnloadfrmt").val()=="pdf"){
			FIM0400Form.action = "FIM0400PDFREPORT.action?method=FIM0400PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 FIM0400Form.submit();
		}
	});
	$('#btnXML').click(function() {
		//alert("FIM0400EXCELSum");//return false;
		
		  FIM0400Form.action = "XMLDOWNLOAD.action?method=fim0400&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 FIM0400Form.submit(); 
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
		
		$("#pymdets").prepend("<tr id='dcgadd"+rowno+"' ><td id='trantype_row"+rowno+"'><input type='text' id='trantype_text"+rowno+"' style='     width: 86px;'></td><td id='cntrptyuid_row"+rowno+"'><input type='text' 	id='cntrptyuid_text"+rowno+"' style='    width: 107px;'></td><td id='cntrptyname_row"+rowno+"'><input type='text' id='cntrptyname_text"+rowno+"' style='    width: 107px;'></td><td id='setr_row"+rowno+"' ><input type='text'  id='setr_text"+rowno+"'    style='    width: 40px;'><td id='curncyiso_row"+rowno+"'><input type='text' id='curncyiso_text"+rowno+"' style='width: 90px;'></td><td class='sumder alnum' id='amt_row"+rowno+"'><input type='text'  id='amt_text"+rowno+"' class='decimalPt roundUp' style='    width:50px;'></td><td id='spotrate_row"+rowno+"'><input type='text' id='spotrate_text"+rowno+"' style='width: 51px;'></td><td id='frdrt_row"+rowno+"'><input type='text'  id='frdrt_text"+rowno+"' style='    width:80px;'></td><td id='insbs_row"+rowno+"'><input type='text' id='insbs_text"+rowno+"' style='     width: 100px;'></td><td id='insqu_row"+rowno+"'><input type='text' 	id='insqu_text"+rowno+"' style='    width: 50px;'></td><td id='duedt_row"+rowno+"'><input type='text' id='duedt_text"+rowno+"' style='    width: 50px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");
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
	$("#duedt_text"+a).datepicker({
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
  

  
  var	amt =  document.getElementById("amt_row"+no);
  
 var	amt_data = amt.innerHTML;
 
 

  
  
 
 amt.innerHTML="<input type='text' class='decimalPt roundUp'  id='amt_text"+no+"'  style='width: 83px'; value='"+amt_data+"'>";
 

 
 
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
		
		if(document.getElementById("amt_text"+no).value==""){
			alert("Enter  Amount ..");
			error="Y"
			
		}
	}else if (modtyp=="A") {
		
		
		if(document.getElementById("trantype_text"+no).value==""){
			alert("Enter Transaction Type ..");
			error="Y"
		}else if(document.getElementById("cntrptyuid_text"+no).value==""){
			alert("Enter Counter party Unique Identifier ..");	
			error="Y"
		}else if(document.getElementById("cntrptyname_text"+no).value==""){
			alert("Enter Counter party Name..");	
			error="Y"
		}else if(document.getElementById("setr_text"+no).value==""){
			alert("Enter Sector ..");
			error="Y"
		}else if(document.getElementById("curncyiso_text"+no).value==""){
			alert("Enter Currency ISO Code..");
			error="Y"
		}else if(document.getElementById("amt_text"+no).value==""){
			alert("Enter  Amount ..");
			error="Y"
		}else if(document.getElementById("spotrate_text"+no).value==""){
			alert("Enter Spot Rate ..");
			error="Y"
		}else if(document.getElementById("frdrt_text"+no).value==""){
			alert("Enter Forward Rate...");
			error="Y"
		}else if(document.getElementById("insbs_text"+no).value==""){
			alert("Enter Interest Rate-Base Currency..");
			error="Y"
		}else if(document.getElementById("insqu_text"+no).value==""){
			alert("Enter Interest Rate-Quoted Currency..");
			error="Y"
		}else if(document.getElementById("duedt_text"+no).value==""){
			alert("Enter Due Date..");
			error="Y"
		}
	}
	
	
	
	if (error=="N"){
	
	$("#modflg").val("Y");
	modtyp="M";
	document.getElementById("edit_button"+no).checked = false;
	
	  
	
	var amt_val=document.getElementById("amt_text"+no).value;
	
	

	document.getElementById("amt_row"+no).innerHTML=amt_val;
	

	if($("#addrowno").val()=="1"){
	
		modtyp="A";
	
	
	   
	  var trantype_val=document.getElementById("trantype_text"+no).value;
	   document.getElementById("trantype_row"+no).innerHTML=trantype_val;
	   
	  
	  
	  var cntrptyuid_val=document.getElementById("cntrptyuid_text"+no).value;	
	  document.getElementById("cntrptyuid_row"+no).innerHTML=cntrptyuid_val;
	 
	  var cntrptyname_val=document.getElementById("cntrptyname_text"+no).value;
	  document.getElementById("cntrptyname_row"+no).innerHTML=cntrptyname_val;
	  
	  
	  
	  var setr_val=document.getElementById("setr_text"+no).value;
	 
	  document.getElementById("setr_row"+no).innerHTML=setr_val;
	  
	  var curncyiso_val=document.getElementById("curncyiso_text"+no).value;
		 
	  document.getElementById("curncyiso_row"+no).innerHTML=curncyiso_val;
	
	  var spotrate_val=document.getElementById("spotrate_text"+no).value;
		 
	  document.getElementById("spotrate_row"+no).innerHTML=amt_val;
	

	  var frdrt_val=document.getElementById("frdrt_text"+no).value;
	  document.getElementById("frdrt_row"+no).innerHTML=frdrt_val;
	  
	  
	  
	  var insbs_val=document.getElementById("insbs_text"+no).value;
	 
	  document.getElementById("insbs_row"+no).innerHTML=insbs_val;
	  
	  var insqu_val=document.getElementById("insqu_text"+no).value;
		 
	  document.getElementById("insqu_row"+no).innerHTML=insqu_val;
	
	  var duedt_val=document.getElementById("duedt_text"+no).value;
		 
	  document.getElementById("duedt_row"+no).innerHTML=duedt_val;
	


	
	}else{
		document.getElementById("Cancel_button"+no).style.display="inline-block";
		document.getElementById("Cancel_btn"+no).style.display="none";
	}

	document.getElementById("edit_button"+no).style.display="inline-block";
	document.getElementById("save_button"+no).style.display="none";

	
	 
	  var trantype=document.getElementById("trantype_row"+no).innerHTML;
	  var cntrptyuid=document.getElementById("cntrptyuid_row"+no).innerHTML;
	  var cntrptyname=document.getElementById("cntrptyname_row"+no).innerHTML;	
	  var setr=document.getElementById("setr_row"+no).innerHTML;
	  var curncyiso=document.getElementById("curncyiso_row"+no).innerHTML;	
	  var amt=document.getElementById("amt_row"+no).innerHTML;
	 var spotrate=document.getElementById("spotrate_row"+no).innerHTML;
	 var frdrt=document.getElementById("frdrt_row"+no).innerHTML;	
	  var insbs=document.getElementById("insbs_row"+no).innerHTML;
	  var insqu=document.getElementById("insqu_row"+no).innerHTML;	
	  var duedt=document.getElementById("duedt_row"+no).innerHTML;
	 
	
	
	  $("#dcgadd"+no).addClass("rowaddedd");
		 $("#pymdets td").attr("padding","8px");
		 
		
	var refeFIM0400=document.getElementById("refDisplay").value;
	amt=amt.replace(/\,/g,'')
	  amt=Number(amt)

	 var rptdate1 = {
			     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeFIM0400, "trantype" : trantype,"cntrptyuid":cntrptyuid, "cntrptyname":cntrptyname,"setr":setr,"curncyiso":curncyiso,"amt":amt,"spotrate":spotrate, "frdrt":frdrt,"insbs":insbs,"insqu":insqu,"duedt":duedt,"modtyp":modtyp

			}; 
	 
	 $.ajax({
	     url : "FIM0400",
	     data : rptdate1  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 alert(res.refno);
				 console.log(res.refno);
				//	alert("refePYM100"+refePYM100);
				
				
				/*  $("#refDisplay").html(res.refno); */
				 $(".refDisplay").val(res.refno);
				
				
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
	        	
	        	  
	       	
	       	  var trantype=document.getElementById("trantype_row"+no).innerHTML;
	       	  var cntrptyuid=document.getElementById("cntrptyuid_row"+no).innerHTML;
	       	  var cntrptyname=document.getElementById("cntrptyname_row"+no).innerHTML;	
	       	  var setr=document.getElementById("setr_row"+no).innerHTML;
	       	  var curncyiso=document.getElementById("curncyiso_row"+no).innerHTML;	
	       	  var amt=document.getElementById("amt_row"+no).innerHTML;
	       	 var spotrate=document.getElementById("spotrate_row"+no).innerHTML;
	       	 var frdrt=document.getElementById("frdrt_row"+no).innerHTML;	
	       	  var insbs=document.getElementById("insbs_row"+no).innerHTML;
	       	  var insqu=document.getElementById("insqu_row"+no).innerHTML;	
	       	  var duedt=document.getElementById("duedt_row"+no).innerHTML;
	        	 var refeFIM0400=document.getElementById("refDisplay").value;
	        		
	        		//alert("refePYM100==>"+refePYM100+"refePYM100"); 


	        		 amt=amt.replace(/\,/g,'')
	                   amt=Number(amt)

	        		
	        		  var rptdate1 = {
	    			     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeFIM0400, "trantype" : trantype,"cntrptyuid":cntrptyuid, "cntrptyname":cntrptyname,"setr":setr,"curncyiso":curncyiso,"amt":amt,"spotrate":spotrate, "frdrt":frdrt,"insbs":insbs,"insqu":insqu,"duedt":duedt,"modtyp":modtyp
	        				};
	        		 
	        	 $.ajax({
	        	     url : "FIM0400",
	        	     data : rptdate1  ,
	        			dataType : 'json', 
	        			type : 'POST',
	        			async : true,
	        			 success : function(res) {
	        				 console.log(res.refno);
	        				//	alert("refeDCG100"+refeDCG100);
	        				
	        				// alert("sfsdf");
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
			 "cntrptyuid":$("#cntrptyuid_row"+no).text()
	 	};
	 	
	 	 $.ajax({
	 	     url : "FIM0400cancel",
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
	  

	/* 	  document.getElementById("del_button"+no).style.display="inline-block";
	 */ 

	 var amt_val=document.getElementById("amt_text"+no).value;
	 document.getElementById("amt_row"+no).innerHTML=amt_val;

	 
			$("#edit_button"+no).show();
			/* document.getElementById("edit_button"+no).style.display="block"; */
			document.getElementById("save_button"+no).style.display="none";
			document.getElementById("Cancel_btn"+no).style.display="none";
			 location.reload(true); 
			 
			 
			  var amt=document.getElementById("amt_row"+no).innerHTMLL;
			 
			  if($("#dcgadd"+no).hasClass( "rowaddedd" )){
				  
				  document.getElementById("Cancel_button"+no).style.display="inline-block";


			  }else{
				  document.getElementById("Cancel_button"+no).style.display="none";
			  }
			  
			
	 } function Canadd_row(no){
		 
		  /* document.getElementById("del_button"+no).style.display="inline-block"; */

					;															   

		 if($("#dcgadd"+no).hasClass( "rowaddedd" )){
			var detcancel={
					"cntrptyuid":$("#cntrptyuid_row"+no).text(),"date":'<%=dt2%>'
			};
			
			
			
			 $.ajax({
			     url : "FIM0400cancel",
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

function fnload(z,d,e,b,c,a,f,g){
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
			
			 $(".repdisp").text(refno);
			 var srno=1;
			 $("#divLoading").addClass("show");
			 /*   $(".loader").fadeOut("slow"); */
				 var FIM0400 = {
						 "repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
						}; 
				 //alert("inside the ajaxxxxxxxxxxxxx");
				$.ajax({
					url : "fim0400details",
					data : FIM0400,
					dataType : 'json',
					type : 'POST',
					async : true,
					success : function(res) {	
					//	alert("refePYM100"+refePYM100);
						
						  $("#pymdets tr").remove();						 
						
						var b=JSON.parse(res.detFIM0400);
						 console.log(b);
							
									//alert(f);
					
							 	if(f=="onload"){
							 		$("#modify").show();
							 		for(var i=0;i<b.length;i++){
							 		
							 		  $("#pymdets").append(
												 
																							
												
												 "<tr id='dcgadd"+srno+"'>"

							                      +"<td  id='trantype_row"+srno+"'>"+b[i].trantype+"</td>"	

							                      +"<td  id='cntrptyuid_row"+srno+"'>"+b[i].cntrptyuid+"</td>"
							                      +"<td   id='cntrptyname_row"+srno+"'>"+b[i].cntrptyname+"</td>"
							                      +"<td   id='setr_row"+srno+"'>"+b[i].setr+"</td>"
							                      
							                      +"<td  id='curncyiso_row"+srno+"'>"+b[i].curncyiso+"</td>"
							                      +"<td style=text-align:right; id='amt_row"+srno+"'>"+b[i].amt+"</td>"	
							         
							                      
							                      +"<td  id='spotrate_row"+srno+"'>"+b[i].spotrate+"</td>"
							                      +"<td   id='frdrt_row"+srno+"'>"+b[i].frdrt+"</td>"
							                      +"<td   id='insbs_row"+srno+"'>"+b[i].insbs+"</td>"
							                      
							                      +"<td  id='insqu_row"+srno+"'>"+b[i].insqu+"</td>"
							                      +"<td  id='duedt_row"+srno+"'>"+b[i].duedt+"</td>"
/* 
							                      +"<td  hidden id='del_row"+srno+"'>"+b[i].delflg+"</td>"	
							                      +"<td  hidden id='rcrusrid_row"+srno+"'>"+b[i].rcrusrid+"</td>"	
							                      +"<td  hidden id='rcrtme_row"+srno+"'>"+b[i].rcrtime+"</td>"	
							                      +"<td  hidden id='lchusrid_row"+srno+"'>"+b[i].lchgusrid+"</td>"	
							                      +"<td  hidden id='lchtme_row"+srno+"'>"+b[i].lchgtime+"</td>"	
							                     
							                       */
							                    
							    				  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none; ' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+srno+"')><input type='button'id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')></td>"
							                    
							                     						                     
							                      
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
								 			
								 		  $("#pymdets").append(
													 
													
													
								 				 "<tr>"

							                      +"<td  id='trantype_row"+srno+"'>"+b[i].trantype+"</td>"	

							                      +"<td  id='cntrptyuid_row"+srno+"'>"+b[i].cntrptyuid+"</td>"
							                      +"<td   id='cntrptyname_row"+srno+"'>"+b[i].cntrptyname+"</td>"
							                      +"<td   id='setr_row"+srno+"'>"+b[i].setr+"</td>"
							                      
							                      +"<td  id='curncyiso_row"+srno+"'>"+b[i].curncyiso+"</td>"
							                      +"<td style=text-align:right; id='amt_row"+srno+"'>"+b[i].amt+"</td>"	
							         
							                      
							                      +"<td  id='spotrate_row"+srno+"'>"+b[i].spotrate+"</td>"
							                      +"<td   id='frdrt_row"+srno+"'>"+b[i].frdrt+"</td>"
							                      +"<td   id='insbs_row"+srno+"'>"+b[i].insbs+"</td>"
							                      
							                      +"<td  id='insqu_row"+srno+"'>"+b[i].insqu+"</td>"
							                      +"<td  id='duedt_row"+srno+"'>"+b[i].duedt+"</td>"	
							                     
							                      
							                                     
							                     						                     
							                      
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
				
					 var FIM0400 = {
							 "dt1":d, "dt2":e,"reportrefnos":refno,"curr":g 
							}; 
					 //alert("inside the ajaxxxxxxxxxxxxx");
					$.ajax({
						url : "FIM0400SUM",
						data : FIM0400,
							dataType : 'json', 
							type : 'POST',
							async : true,
							 success : function(res) {
								 //console.log(res.refnoAB);
						
						console.log(res.summaryFIM0400);
					
						var b=JSON.parse(res.summaryFIM0400);
						
						var k=1;
						var cnt1=1;
						
						
						for (var i = 0; i < b.length; i++) {
						

	
							$("#test").append(
							

									"<tr>"

	                      			  +"<td  id='dydo_row"+cnt1+"'>"+b[i].dydo+"</td>"	
				                      +"<td  id='trano_row"+cnt1+"'>"+b[i].trano +"</td>"
				                      +"<td  id='tranty_row"+cnt1+"'>"+b[i].tranty+"</td>"	

				                      +"<td  id='cpui_row"+cnt1+"'>"+b[i].cpui+"</td>"
				                      +"<td   id='cpn_row"+cnt1+"'>"+b[i].cpn+"</td>"
				                      
				                      
				                      +"<td  id='sec_row"+cnt1+"'>"+b[i].sec+"</td>"
				                      +"<td style=text-align:right; id='curr_row"+cnt1+"'>"+b[i].curr+"</td>"	
				         
				                      
				                      +"<td  id='am_row"+cnt1+"'>"+b[i].am+"</td>"
				                      +"<td   id='spora_row"+cnt1+"'>"+b[i].spora+"</td>"
				                      +"<td   id='forra_row"+cnt1+"'>"+b[i].forra+"</td>"
				                      
				                      +"<td  id='inrat_row"+cnt1+"'>"+b[i].inrat+"</td>"
				                      +"<td  id='inratqu_row"+cnt1+"'>"+b[i].inratqu+"</td>"
				                      +"<td  id='due_row"+cnt1+"'>"+b[i].due+"</td>"

	         
/* 
	                      +"<td  hidden id='del_row"+cnt1+"'>"+b[i].delflg+"</td>"	
	                      +"<td  hidden id='rcrusrid_row"+cnt1+"'>"+b[i].rcrusrid+"</td>"	
	                      +"<td  hidden id='rcrtme_row"+cnt1+"'>"+b[i].rcrtime+"</td>"	
	                      +"<td  hidden id='lchusrid_row"+cnt1+"'>"+b[i].lchgusrid+"</td>"	
	                      +"<td  hidden id='lchtme_row"+cnt1+"'>"+b[i].lchgtime+"</td>"	
	                     
	                       */
	                    
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
	 
	 
	 
	 var datasum={
				"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>'
		};
	 

	 $.ajax({
			url:"savecheckfim0400",
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
	
	<%-- "load","<%=dt1%>","<%=dt2%>","'+refno+'","'+cnt1+'","<%=reptype%>","frmsum" --%>
	location.href = "XBRL_REP_FIM0400_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
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



.databody td{
border:1px solid #ddd;
}
</style>




<body>
<div class="container">
   
   
  
    
    <form class="form-horizontal" method="post" name="FIM0400Form"
		enctype="multipart/form-data">
    
    
    <div id="nav">
    <div class="loader"></div>
   
    <input type="hidden" id="savecheck">
										
    <div id="nav">
    <div class="loader"></div>
   <input type="hidden" id="modflg" >
   <input type="hidden" id="modtyp" >
   
         <div id="tab3" >
			  
	
 
		
	 	<div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			<div class="active" id="tab1" style="width: 1021px;padding-top: 1px;margin-top: -17px;" >
			<div style="margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;"> FIM0400 - <b id="sub" style="display: none"></b></b><b>Statement of Swap transactions - Daily<b id="sub"
					Style="display: none"></b></b></font>
			<br><br></div>
			<div id="divLoading"> 
    </div>
           <table class="table" style="width:1021px;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"><!--  <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font> -->
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:right;background-color: #bbc3cb;width: 325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a><a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a>


    </td></tr>
          		  </table>
       
            <div class="panel panel-primary filterable">
           
             <table class="table" id="tbcate" border="1" style="    margin-top: -45px;">
            
         <thead>   
            <tr > <th colspan="14" style="text-align:center;">Statement of Foreign Currency Swap Transactions	</th>
            
			<tr class="filters">
<!-- 						<th  rowspan="2" ><input type="text" style="width:150px;" id="dydm" onkeyup="myFunction(this.id,0)"class="form-control2" placeholder="Dynamic Domain" disabled></th>
 -->							
						
<!-- 						<th colspan="1" ><input type="text" style="width:150px;" id="tranno" onkeyup="myFunction(this.id,1)"class="form-control2" placeholder="Transaction No." disabled></th>
 -->						
						
						<th colspan="1" style=" width:1%;" ><textarea type="text" style="width:61px;"id="trantype" onkeyup="myFunction(this.id,0)"class="form-control2" placeholder="Transaction Type" disabled></textarea></th>

						
						<th  colspan="1" style=" width:1%;"><textarea type="text"  style="width:107px;" id="cntrptyuid" onkeyup="myFunction(this.id,1)"class="form-control2" placeholder="Counter party Unique Identifier" disabled></textarea></th>
							
						
						<th colspan="1" style=" width:1%;" ><textarea type="text" style="width:169px;" id="cntrptyname" onkeyup="myFunction(this.id,2)"class="form-control2" placeholder="Counter party Name" disabled></textarea></th>
						
						
						<th colspan="1" style=" width:1%;"><textarea type="text" style="width:60px;" id="setr" onkeyup="myFunction(this.id,3)"class="form-control2" placeholder="Sector" disabled></textarea></th>
						
						
						<th  colspan="1" style=" width:1%;" ><textarea  type="text"  style="width:49px;" id="curncyiso" onkeyup="myFunction(this.id,4)"class="form-control2" placeholder="Currency ISO Code" disabled></textarea></th>
							
						
						<th colspan="1" style=" text-align:right; width:1%;" ><textarea type="text" style="width:80px;" id="amt" onkeyup="myFunction(this.id,5)"class="form-control2" placeholder="Amount" disabled></textarea></th>
						
						
						<th colspan="1" style=" width:1%;" ><textarea type="text" style="width:51px;"  id="spotrate" onkeyup="myFunction(this.id,6)"class="form-control2" placeholder="Spot Rate" disabled></textarea></th>

						
						<th  colspan="1" style=" width:1%;" ><textarea type="text" style="width:50px;" id="frdrt" onkeyup="myFunction(this.id,7)"class="form-control2" placeholder="Forward Rate" disabled></textarea></th>
							
						
						<th colspan="1" style=" width:1%;" ><textarea type="text"  style="width:100px;" id="insbs" onkeyup="myFunction(this.id,8)"class="form-control2" placeholder="Interest Rate-Base Currency" disabled></textarea></th>
						
						
						<th colspan="1" style=" width:1%;" ><textarea type="text" style="width:75px;" id="insqu" onkeyup="myFunction(this.id,9)"class="form-control2" placeholder="Interest Rate-Quoted Currency" disabled></textarea></th>
						
						
						<th colspan="1" style=" width:1%;" ><textarea type="text" style="width:50px;" id="duedt" onkeyup="myFunction(this.id,10)"class="form-control2" placeholder="Due Date" disabled></textarea></th>
								
<th style="text-align: center; width: 1%;"
										id="modify" class="modify" placeholder="Modify" disabled></th>						
						
						
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
				
				
				
 
				
   
				
				<div class="tab-pane" id="tab2" style="width: 1450px;padding-top: 1px;margin-top: -17px;">
<div style=" margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;"> FIM0400 - <b id="sub" style="display: none"></b></b><b>Statement of Swap transactions - Daily
<b id="sub"
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
					


					
           <tr> <th colspan="14" style="text-align:center;">Statement of Foreign Currency Swap Transactions	</th>
            
			<tr>
						<th id="dydo" rowspan="2" style="width:150px;">Dynamic Domain</th>
							
						
						<th id="trano" colspan="1" style="width:150px;">Transaction No.</th>
						
						
						<th id="tranty" colspan="1" style="width:150px;">Transaction Type</th>

						
						<th id="cpui" colspan="1" style="width:150px;">Counter party Unique Identifier</th>
							
						
						<th id="cpn" colspan="1" style="width:150px;">Counter party Name</th>
						
						
						<th id="sec" colspan="1" style="width:150px;">Sector</th>
						
						
						<th id="curr" colspan="1" style="width:150px;">Currency ISO Code</th>
							
						
						<th id="am" colspan="1" style="width:150px;">Amount</th>
						
						
						<th id="spora" colspan="1" style="width:150px;">Spot Rate</th>

						
						<th id="forra" colspan="1" style="width:150px;">Forward Rate</th>
							
						
						<th id="inrat" colspan="1" style="width:150px;">Interest Rate-Base Currency</th>
						
						
						<th id="inratqu" colspan="1" style="width:150px;">Interest Rate-Quoted Currency</th>
						
						
						<th  id="due" colspan="1" style="width:100px;">Due Date</th>
						
									
						
						<th rowspan="3" style='text-align:center;' id="select">Select</th>
						
					</tr> 

					
				
              
              <tbody class="databody" id="test">
	             </tbody>
            				
					
				</table>
				<div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
            <!--     <button type="button" class="btn btn-xs btn-primary" value="Excel" >Generate Excel</button> -->
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
     
     </form>
    
    
</div>





</body>
</html>