
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLBLS0106Bean,dao.XBRLBLS0106Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
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
 String refno = request.getParameter("refno");

  String ReporefSeq = request.getParameter("ReporefSeq"); 
  DecimalFormat df = new DecimalFormat("#,###.00");  
  %>
  
    <%
    DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Date date = new Date();	
	String username = session.getAttribute("userName").toString();
    String curdate = dateFormat.format(date);
	%>
 
<%--  <%=rptdate %>
  <%=dt2 %>
    <%=reptype %>
      <%=curr %>
        <%=typo %>
          <%=types %>
          <%=ReporefSeq %> --%>
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

.table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {

    border-top: 1px solid #ddd;
}

.databody td {
    border: 1px solid #ddd;
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
#DCGdets td{
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
 .ui-dialog-titlebar-close {
    visibility: hidden;
} 
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
/* .show {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url('../../images/Loader.gif') 30% 30% no-repeat rgb(249,249,249);
    opacity: .8;
} */
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

 .hidden {
  display: none;
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
	
	.container {
    padding-right: 0px;
    padding-left: 0px;
    margin-right: auto;
    margin-left: auto;
}
	
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 5px;}
</style>




<script>
$(document).ready(function(){

	
	
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
	
	
	
	
	
	
	$("#btnfilter").on("click",function(){
		
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
			 $('#accno,#accname,#custId,#transflg,#schmtyp,#natuofcust,#nreflg,#repdate,#currency,#balancamt').css({
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
			
			 $('#accno,#accname,#custId,#transflg,#schmtyp,#natuofcust,#nreflg,#repdate,#currency,#balancamt').css({
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
	if(b==0 ||b==7  ||b==9){
		
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
function functionli(a){
	 $(".table").hide(); 
	$(".tb"+a).show();
	$("#btnSave").hide();
	$("#btnXML").hide();
if(a==1){
	
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
	
	var det={
			"repdate":'<%=dt2%>',"type":"chckmodified"
		};
		$.ajax({
			url:"BLS0106chckmodified",
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
					        	location.href = "XBRL_CRT_BLS0106_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
					        }
					      }
					    });
					
					
				}else{
					$("#modflg").val("N");
				}
			}
		});
		
		var save=0;
		
		$('#btnSave').on("click",function() {
			
			$("#divLoading").addClass('show'); 
			
			
			if((save==0)&&($("#savecheck").val()==0)){
		 		
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
	
		location.href = "XBRL_REP_BLS0106_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
			
		 });
$("#addrowno").val("0");
	
	fnload('<%=typo%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');

	$(".det").on("click",function(){
		
		<%-- fundetails('<%=repname%>','<%=ReporefSeq%>',0,'<%=dt2%>','<%=dt1%>',"onload");  --%>
		location.href = "XBRL_REP_BLS0106_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( ".btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '.btnback').click(function() {
		 location.href="XBRL_CRT_BLS0106_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	$('#btnExcel').click(function() {
		//alert("srdgihsdukl");//return false;
		bls0106Form.action = "BLS0106EXCELREPORT.action?method=BLS0106EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 bls0106Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 bls0106Form.action = "BLS0106EXCELSum.action?method=BLS0106EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 bls0106Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 bls0106Form.action = "BLS0106PDFREPORT.action?method=BLS0106PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 bls0106Form.submit();
		}
	});
	$('#btnXML').click(function() {
		bls0106Form.action = "XMLDOWNLOADbls106.action?method=blsxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		bls0106Form.submit(); 
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
				
		$("#pymdets").prepend("<tr id='dcgadd"+rowno+"' ><td id='accno_row"+rowno+"' ><input type='text' id='accno_text"+rowno+"' style='width: 90px;'></td><td id='accname_row"+rowno+"'><input type='text' id='accname_text"+rowno+"' style='width: 100px;'></td><td id='custId_row"+rowno+"'><input type='text' id='custId_text"+rowno+"' style='width: 95px;'></td><td id='transflg_row"+rowno+"' ><input type='text' id='transflg_text"+rowno+"' style='width: 66px;'></td><td id='schmtyp_row"+rowno+"' ><input type='text' id='schmtyp_text"+rowno+"' style='width: 66px;'></td><td id='natuofcust_row"+rowno+"'><input type='text' id='natuofcust_text"+rowno+"' style='width: 75px;'></td><td id='nreflg_row"+rowno+"' ><input type='text' id='nreflg_text"+rowno+"' style='width: 45px;'></td><td id='repdate_row"+rowno+"'><input type='text' id='repdate_text"+rowno+"' style='width: 71px;'></td><td id='currency_row"+rowno+"'><input type='text' id='currency_text"+rowno+"' style=' width: 50px;'></td><td id='balancamt_row"+rowno+"' class='sumder alnum'><input type='text'  id='balancamt_text"+rowno+"'  class='decimalPt roundUp'  style='width: 87px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");
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
  

 
 var	balancamt =  document.getElementById("balancamt_row"+no);
 
 var	balancamt_data = balancamt.innerHTML;
 
  
 
 balancamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='balancamt_text"+no+"'  style='width: 83px'; value='"+balancamt_data+"'>";
 

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
		
		if(document.getElementById("balancamt_text"+no).value==""){
			alert("Enter Balance Amount ..");
			error="Y"
			
		}
	}else if (modtyp=="A") {
		
		
		if(document.getElementById("accno_text"+no).value==""){
			alert("Enter Account Number ..");
			error="Y"
		}else if(document.getElementById("accname_text"+no).value==""){
			alert("Enter Account Name ..");	
			error="Y"
		}else if(document.getElementById("custId_text"+no).value==""){
			alert("Enter Customer Id ..");	
			error="Y"
		}else if(document.getElementById("transflg_text"+no).value==""){
			alert("Enter Transferable Flag ..");
			error="Y"
		}else if(document.getElementById("schmtyp_text"+no).value==""){
			alert("Enter Scheme Type ..");
			error="Y"
		}else if(document.getElementById("natuofcust_text"+no).value==""){
			alert("Enter Nature Of Customer..");
			error="Y"
		}else if(document.getElementById("nreflg_text"+no).value==""){
			alert("Enter NRE Flag..");
			error="Y"
		}else if(document.getElementById("repdate_text"+no).value==""){
			alert("Enter Report Date..");
			error="Y"
		}else if(document.getElementById("currency_text"+no).value==""){
			alert("Enter Currency..");
			error="Y"
		}else if(document.getElementById("balancamt_text"+no).value==""){
			alert("Enter Balance Amount ..");
			error="Y"
			
		}
	}
	
	
	
	if (error=="N"){
	
	$("#modflg").val("Y");
	modtyp="M";
	document.getElementById("edit_button"+no).checked = false;

	  
	
	var balancamt_val=document.getElementById("balancamt_text"+no).value;
	
	document.getElementById("balancamt_row"+no).innerHTML=balancamt_val;
	
	
	if($("#addrowno").val()=="1"){
	
		modtyp="A";
	  var accno_val=document.getElementById("accno_text"+no).value;
	   document.getElementById("accno_row"+no).innerHTML=accno_val;
	
	  var accname_val=document.getElementById("accname_text"+no).value;
	  document.getElementById("accname_row"+no).innerHTML=accname_val;
	  
	  var custId_val=document.getElementById("custId_text"+no).value;
	  document.getElementById("custId_row"+no).innerHTML=custId_val;
	  
	  var transflg_val=document.getElementById("transflg_text"+no).value;
	  document.getElementById("transflg_row"+no).innerHTML=transflg_val;
	  	  
	  var schmtyp_val=document.getElementById("schmtyp_text"+no).value;
	  document.getElementById("schmtyp_row"+no).innerHTML=schmtyp_val; 
	  
	  var natuofcust_val=document.getElementById("natuofcust_text"+no).value;
	  document.getElementById("natuofcust_row"+no).innerHTML=natuofcust_val;
	  
	  var nreflg_val=document.getElementById("nreflg_text"+no).value;
	  document.getElementById("nreflg_row"+no).innerHTML=nreflg_val;

	  
	  var repdate_val=document.getElementById("repdate_text"+no).value;
	  document.getElementById("repdate_row"+no).innerHTML=repdate_val;	

	  var currency_val=document.getElementById("currency_text"+no).value;
	  document.getElementById("currency_row"+no).innerHTML=currency_val;
	  
	
	  
	
	}else{
		document.getElementById("Cancel_button"+no).style.display="inline-block";
		document.getElementById("Cancel_btn"+no).style.display="none";
	}

	document.getElementById("edit_button"+no).style.display="inline-block";
	document.getElementById("save_button"+no).style.display="none";

	  
	  var accno=document.getElementById("accno_row"+no).innerHTML;
	  
	  var accname=document.getElementById("accname_row"+no).innerHTML;
	  
	  var custId=document.getElementById("custId_row"+no).innerHTML;
  
	  var transflg=document.getElementById("transflg_row"+no).innerHTML;
	  
	  var schmtyp=document.getElementById("schmtyp_row"+no).innerHTML;
	 
	  var natuofcust=document.getElementById("natuofcust_row"+no).innerHTML;
	  
	  var nreflg=document.getElementById("nreflg_row"+no).innerHTML;
	  
	  var repdate=document.getElementById("repdate_row"+no).innerHTML;	
	  var currency=document.getElementById("currency_row"+no).innerHTML;

	 var balancamt=document.getElementById("balancamt_row"+no).innerHTML;
	
	  
/* 	 var rcrusrid=document.getElementById("rcrusrid_row"+no).innerHTML;
	var rcrtme=document.getElementById("rcrtme_row"+no).innerHTML;
	 var lchusrid=document.getElementById("lchusrid_row"+no).innerHTML;
	 var lchtme=document.getElementById("lchtme_row"+no).innerHTML; */
	// var del=document.getElementById("del_row"+no).innerHTML;  
	 $("#dcgadd"+no).addClass("rowaddedd");
	 $("#pymdets td").attr("padding","8px");

	
	 var refeBLS106=document.getElementById("refDisplay").value;

	  balancamt=balancamt.replace(/\,/g,'')
	  balancamt=Number(balancamt)
		

	  var rptdate1 = {
			     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeBLS106, "accno" : accno,"accname": accname, "custId": custId,"transflg": transflg,"schmtyp": schmtyp,"natuofcust": natuofcust,"nreflg": nreflg,"balancamt": balancamt,"currency": currency,"repdate":repdate,"modtyp":modtyp
			}; 
	

	 $.ajax({
		 url : "BLS0106",
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
								        	
								        	  var accno=document.getElementById("accno_row"+no).innerHTML;
								        	  
								        	  var accname=document.getElementById("accname_row"+no).innerHTML;
								        	  
								        	  var custId=document.getElementById("custId_row"+no).innerHTML;

								        	  
								        	  var transflg=document.getElementById("transflg_row"+no).innerHTML;
								        	  
								        	  var schmtyp=document.getElementById("schmtyp_row"+no).innerHTML;
								        	 
								        	  var natuofcust=document.getElementById("natuofcust_row"+no).innerHTML;
								        	  
								        	  var nreflg=document.getElementById("nreflg_row"+no).innerHTML;
								        	  
								        	  var repdate=document.getElementById("repdate_row"+no).innerHTML;	
								        	  var currency=document.getElementById("currency_row"+no).innerHTML;

								        	 var balancamt=document.getElementById("balancamt_row"+no).innerHTML;
								        	 var refeBLS106=document.getElementById("refDisplay").value;
								        		
								        		//alert("refePYM100==>"+refePYM100+"refePYM100"); 


								        		  balancamt=balancamt.replace(/\,/g,'')
								        		  balancamt=Number(balancamt)
								        		
								        		  var rptdate1 = {
								        				     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeBLS106, "accno" : accno,"accname": accname,"custId": custId,"transflg": transflg,"schmtyp": schmtyp,"natuofcust": natuofcust,"nreflg": nreflg,"balancamt": balancamt,"currency": currency,"repdate":repdate,"modtyp":modtyp
								        				};
								        		 
								        	 $.ajax({
								        	     url : "BLS0106",
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
						 "accno":$("#accno_row"+no).text()
				 	};
				 	
				 	 $.ajax({
				 	     url : "BLS0106cancel",
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

				 var balancamt_val=document.getElementById("balancamt_text"+no).value;
				 document.getElementById("balancamt_row"+no).innerHTML=balancamt_val;

				 
						$("#edit_button"+no).show();
						/* document.getElementById("edit_button"+no).style.display="block"; */
						document.getElementById("save_button"+no).style.display="none";
						document.getElementById("Cancel_btn"+no).style.display="none";
						 location.reload(true); 
						 
						 
						  var balancamt=document.getElementById("balancamt_row"+no).innerHTMLL;
						 
						  if($("#dcgadd"+no).hasClass( "rowaddedd" )){
							  
							  document.getElementById("Cancel_button"+no).style.display="inline-block";


						  }else{
							  document.getElementById("Cancel_button"+no).style.display="none";
						  }
						  
						
				 }

				 
				 function Canadd_row(no){
					 
					  /* document.getElementById("del_button"+no).style.display="inline-block"; */

								;															   

					 if($("#dcgadd"+no).hasClass( "rowaddedd" )){
						var detcancel={
								"accno":$("#accno_row"+no).text(),"date":'<%=dt2%>'
						};
						
						
						
						 $.ajax({
						     url : "BLS0106cancel",
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

function fnload(z,e,b,c,a,f,g){
	
	//alert("inside the fnload");
	
	//alert(z);
	 $("#btnXML").show();
	 $("#btnSave").show();
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
				 var blsd = {
						"repname" : a,"ReporefSeq" : refno,"instno" : ins, "dt2" : e, "curr":g  
					}; 
				 //alert("inside the ajaxxxxxxxxxxxxx");
				$.ajax({
					url : "blsdetails",
					data : blsd,
					dataType : 'json',
					type : 'POST',
					async : true,
					success : function(res) {	
					//	alert("refePYM100"+refePYM100);
						
						  $("#pymdets tr").remove();						 
						
						var b=JSON.parse(res.detBLS0106);
						 console.log(b);
						
									
					
							 	if(f=="onload"){
							 		$("#modify").show();
							 		for(var i=0;i<b.length;i++){
							 			
							 		  $("#pymdets").append(
												 
																							
												 "<tr   id='dcgadd"+srno+"'>"
												  
							                      +"<td  id='accno_row"+srno+"'>"+b[i].accno+"</td>"	
							                      +"<td  id='accname_row"+srno+"'>"+b[i].accname+"</td>"	
							                      +"<td  id='custId_row"+srno+"'>"+b[i].custId+"</td>"
							                      +"<td  id='transflg_row"+srno+"'>"+b[i].transflg+"</td>"
							                      +"<td  id='schmtyp_row"+srno+"'>"+b[i].schmtyp+"</td>"
							                      +"<td  id='natuofcust_row"+srno+"'>"+b[i].natuofcust+"</td>"
							                      +"<td  id='nreflg_row"+srno+"'>"+b[i].nreflg+"</td>"
							                      
							                      +"<td  id='repdate_row"+srno+"'>"+b[i].repdate+"</td>"
							                      +"<td  id='currency_row"+srno+"'>"+b[i].currency+"</td>"	
							                      +"<td class='sumder alnum' id='balancamt_row"+srno+"'>"+b[i].balancamt+"</td>"
 
							                      
							                     /*  +"<td  hidden id='del_row"+srno+"'>"+b[i].delflg+"</td>"	
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
							 	}
								
							 	else if(f=="frmsum"){
							 		$(".add").hide();
							 		/* $("").padStart(6, "0");.padStart(6, "0"); */
							 		$("#modify").hide();
							 		for(var i=0;i<b.length;i++){
							 			
							 		  $("#pymdets").append(
												 
												
												
												 "<tr>"
												
							                      +"<td  id='accno_row"+srno+"'>"+b[i].accno+"</td>"	
							                      +"<td  id='accname_row"+srno+"'>"+b[i].accname+"</td>"	
							                      +"<td  id='custId_row"+srno+"'>"+b[i].custId+"</td>"
							                      +"<td  id='transflg_row"+srno+"'>"+b[i].transflg+"</td>"
							                      +"<td  id='schmtyp_row"+srno+"'>"+b[i].schmtyp+"</td>"
							                      +"<td  id='natuofcust_row"+srno+"'>"+b[i].natuofcust+"</td>"
							                      +"<td  id='nreflg_row"+srno+"'>"+b[i].nreflg+"</td>"
							                      
							                      +"<td  id='repdate_row"+srno+"'>"+b[i].repdate+"</td>"
							                      +"<td  id='currency_row"+srno+"'>"+b[i].currency+"</td>"	
							                      +"<td class='sumder alnum' id='balancamt_row"+srno+"'>"+b[i].balancamt+"</td>"
 
							                      
							                     /*  +"<td  hidden id='del_row"+srno+"'>"+b[i].delflg+"</td>"	
							                      +"<td  hidden id='rcrusrid_row"+srno+"'>"+b[i].rcrusrid+"</td>"	
							                      +"<td  hidden id='rcrtme_row"+srno+"'>"+b[i].rcrtime+"</td>"	
							                      +"<td  hidden id='lchusrid_row"+srno+"'>"+b[i].lchgusrid+"</td>"	
							                      +"<td  hidden id='lchtme_row"+srno+"'>"+b[i].lchgtime+"</td>"	
							                       */
								                    
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
			
				var rptdate1 = {
						"reptype" : a,"dt2":e,"reportrefnos":refno,"curr":g
						}; 
				 
				 $.ajax({
				     url : "BLS0106SUM",
				     data : rptdate1  ,
						dataType : 'json', 
						type : 'POST',
						async : true,
						 success : function(res) {
							 //console.log(res.refnoAB);
					
					console.log(res.summaryBLS0106);
				
					var b=JSON.parse(res.summaryBLS0106);
					
					var k=1;
					var cnt1=1;
					
					
					for (var i = 0; i < b.length; i++) {
					
						
						//$('.alnum').mask("#,##0.00", {reverse: true});
					
					if(b.length==i+1){
						
						$("#test").append('<tr><td id="mt'+cnt1+'">'+b[i].instancname+'</td><td  id="it'+cnt1+'" style="text-align:right">'+b[i].instanccode+'</td><td id="ite'+cnt1+'" class=alnum style="text-align:right">'+b[i].resident+'</td><td id="ited'+cnt1+'" class=alnum style="text-align:right">'+b[i].nonresident+'</td><td id="itedt'+cnt1+'" class=alnum style="text-align:right">'+b[i].total+'</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td></tr>');	
						
					}	  else{
						$("#test").append('<tr><td id="mt'+cnt1+'">'+b[i].instancname+'</td><td  id="it'+cnt1+'" style="text-align:right">'+b[i].instanccode+'</td><td id="ite'+cnt1+'" class=alnum style="text-align:right">'+b[i].resident+'</td><td id="ited'+cnt1+'" class=alnum style="text-align:right" >'+b[i].nonresident+'</td><td id="itedt'+cnt1+'" class=alnum style="text-align:right">'+b[i].total+'</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td></tr>');	
						
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

	 var datasum={
				"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>'
		};
	 

	 $.ajax({
			url:"savecheckbls0106",
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

</script>
<script>

function fnloads(cnt){
	
	<%-- "load","<%=dt1%>","<%=dt2%>","'+refno+'","'+cnt1+'","<%=reptype%>","frmsum" --%>
	location.href = "XBRL_REP_BLS0106_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
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
 
    
    <form class="form-horizontal" method="post" name="bls0106Form"
		enctype="multipart/form-data">
    
    <input type="hidden" id="savecheck">
	               <input type="hidden" id="modflg" >
	               <input type="hidden" id="modtyp" >
	            
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
			<div class="active" id="tab1" style="width: 1025px;padding-top: 1px;margin-top: -17px;" >
			<div style="text-align: left;margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>BLS0106-Statement on Deposits and Loans<b id="sub"
					Style="display: none"></b></b></font>
			</div>
			<div id="divLoading"> 
    </div><br>
           <table class="table" style="width:100%;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> 
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:right;background-color: #bbc3cb;width: 325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary " href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a>
    
    <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a>
    </td> </tr>
          		  
          		
          		  
          		  </table>
       
            
           <div class="panel panel-primary filterable">
            <table class="table" id="tbcate" border="1" style="width:100%;   margin-top: -20px;">
            
             <thead>
					 <tr class="filters">
					 
						
											
						<th ><textarea type="text" style="width: 93px;" onkeyup="myFunction(this.id,0)" class="form-control2" id="accno" placeholder="Account Number" disabled></textarea> </th>				
						<th><textarea type="text" style="width: 100px;" onkeyup="myFunction(this.id,1)" class="form-control2" id="accname"  placeholder="Account Name"disabled></textarea></th>
						<th><textarea type="text" style="width: 60px;" onkeyup="myFunction(this.id,2)" class="form-control2" id="custId"  placeholder="Customer Id"disabled></textarea></th>
						<th><textarea type="text" style="width: 66px;" onkeyup="myFunction(this.id,3)" class="form-control2" id="transflg"  placeholder="Transferable Flag" disabled ></textarea></th>
						<th><textarea type="text" style="width: 66px;" onkeyup="myFunction(this.id,4)" class="form-control2" id="schmtyp"  placeholder="Scheme Type" disabled></textarea></th>
						<th><textarea type="text" style="width: 75px;" onkeyup="myFunction(this.id,5)" class="form-control2" id="natuofcust"  placeholder="Nature Of Customer"disabled></textarea></th>						
						<th><textarea type="text" style="width: 45px;"  onkeyup="myFunction(this.id,6)" class="form-control2" id="nreflg" placeholder="NRE Flag" disabled ></textarea></th>
						<th><textarea type="text" style="width: 71px;"  onkeyup="myFunction(this.id,7)" class="form-control2" id="repdate" placeholder="Report Date" disabled></textarea></th>
						<th><textarea type="text" style="width: 50px;" onkeyup="myFunction(this.id,8)" class="form-control2" id="currency" placeholder="Currency" disabled></textarea></th>
						<th><textarea type="text" style="width: 87px;text-align:center;" onkeyup="myFunction(this.id,9)" class="form-control2" id="balancamt"   placeholder="Balance Amount" disabled></textarea></th>
						<th style="width: 100PX;" id="modify">Modify</th>
						
					</tr>
					
				</thead>
					
					<tbody class="databody" id="pymdets">


              </tbody>
              
     
				</table>
				
				
				</div>
			
				<div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
            <!--     <button type="button" class="btn btn-xs btn-primary" value="Excel" >Generate Excel</button> -->
                 <!-- <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnExcelSum">Gen Sum</button> -->
               <!--   <button type="button" class="btn btn-xs btn-primary" value="Pdf" id="btnPdf">Generate PDF</button> -->
                 
                 
                <button type="button" class="btn btn-xs btn-primary btnback" value="back" id="btnback">Back</button>
            </div>
			  </div>	

				
				<div class="tab-pane" id="tab2" style="width: 968px;padding-top: 1px;margin-top: -17px;">
<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>BLS0106-Statement on Deposits and Loans<b id="sub"
					Style="display: none"></b></b></font>
			</div>
					
					 <div id="divLoading"> 
    </div> 
    <br> <table class="table" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> 
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:right;background-color: #bbc3cb;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
					<table class="table" id="tbcates" border="1" style="margin-top: -21px;">
       
			
					 
						<tr><th rowspan="3" id="instancname" style="width: 400px;"></th>
						<th rowspan="3" id="modez" style="width: 125px;"> </th></tr>
						<tr><th  colspan="1" id="noofitemsz" style="width: 150px;text-align:left;">Resident</th>				
						<th colspan="1"id="amtz" style="width: 150px;text-align:left;">Non-resident</th>
						<th colspan="1" id="amtz" style="width: 150px;text-align:left;">Total</th>
						<th id="rad">Select</th>	
						</tr>
						<tr><th>A</th>
							<th>B</th>	
							<th>C</th>
							<th></th>
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
     
     </form>
    
    
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
 



</body>
</html>