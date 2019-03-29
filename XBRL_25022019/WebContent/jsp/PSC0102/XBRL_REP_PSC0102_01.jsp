<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="bean.XBRLPSC0102Bean,dao.XBRLPSC0102Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>


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
 
 XBRLPSC0102Dao dmd=new XBRLPSC0102Dao();
 
 DecimalFormat df = new DecimalFormat("##,#0.00");
	   
	 // ArrayList<XBRLCRR0100Bean> list=dmd.xbrlcrr100();
	  
	
		  
		  
		 /*  
		  ArrayList<XBRLPSC0102Bean> list=new ArrayList<XBRLPSC0102Bean>();
		 
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
		  
		ArrayList<XBRLPSC0102Bean> list1=new ArrayList<XBRLPSC0102Bean>();
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
	  
		  
		  ArrayList<XBRLPSC0102Bean> list2=new ArrayList<XBRLPSC0102Bean>();
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
.databody td {
	border: 1px solid #ddd;
}

.clr {
	color: #0c0b0b;
	background-color: #f5f5f5;
	border-color: #f5f5f5;
}

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

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	padding: 6px;
}


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
			 $('#acno ,#acname,#crncy,#sncamt,#otstndamt,#npaflg,#acopendt,#nfbfacamt,#resflg,#insrt,#secflg ,#shmcd,#shmty,#isiccd,#repdt').css({
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
			
			 $('#acno ,#acname,#crncy,#sncamt,#otstndamt,#npaflg,#acopendt,#nfbfacamt,#resflg,#insrt,#secflg ,#shmcd,#shmty,#isiccd,#repdt').css({
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
	if(b==0 ||b==1 ||b==3 ||b==4 ||b==7 ||b==9|| b==11){
		
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
		if(btn==2){
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
}else if(a==2){
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
				url:"PSC0102chckmodified",
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
						        	location.href = "XBRL_CRT_PSC0102_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
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
						  

						url:"saveSumbls2",
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
		 				   			url:"saveSumbls2",
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
		
		location.href = "XBRL_REP_PSC0102_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
 	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>'); 
 
	$(".det").on("click",function(){
		/* alert("hiii");
		$(".active ").hide(); */
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_PSC0102_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '#btnback').click(function() {
		 location.href="XBRL_CRT_PSC0102_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
		
	$('#btnExcel').click(function() {
		
		 PSC0102Form.action = "PSC0102EXCELREPORT.action?method=PSC0102EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 PSC0102Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 PSC0102Form.action = "PSC0102EXCELSum.action?method=PSC0102EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 PSC0102Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 PSC0102Form.action = "PSC0102PDFREPORT.action?method=PSC0102PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 PSC0102Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  PSC0102Form.action = "XMLDOWNLOADp1.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 PSC0102Form.submit(); 
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
$("#pymdets").prepend("<tr  id='dcgadd"+rowno+"' ><td id='acno_row"+rowno+"'><input type='text' id='acno_text"+rowno+"' style='width: 50px;'></td><td id='acname_row"+rowno+"'><input type='text'  id='acname_text"+rowno+"' style='    width:141px;'></td><td id='crncy_row"+rowno+"'><input type='text' id='crncy_text"+rowno+"' style='     width: 48px;'></td><td class='sumder alnum' id='sncamt_row"+rowno+"'><input type='text' 	id='sncamt_text"+rowno+"' class='decimalPt roundUp' style='    width: 80px;'></td><td class='sumder alnum' id='otstndamt_row"+rowno+"'><input type='text' id='otstndamt_text"+rowno+"' class='decimalPt roundUp' style='    width: 80px;'></td><td id='npaflg_row"+rowno+"'><input type='text' id='npaflg_text"+rowno+"' style='width: 60px;'></td><td id='acopendt_row"+rowno+"'><input type='text'  id='acopendt_text"+rowno+"' style='    width:80px;'></td><td class='sumder alnum' id='nfbfacamt_row"+rowno+"'><input type='text' id='nfbfacamt_text"+rowno+"' class='decimalPt roundUp' style='width: 80px;'></td><td id='resflg_row"+rowno+"'><input type='text'  id='resflg_text"+rowno+"' style='    width:100px;'></td><td class='sumder alnum' id='insrt_row"+rowno+"'><input type='text' id='insrt_text"+rowno+"' class='decimalPt roundUp' style='width: 68px;'></td><td id='secflg_row"+rowno+"'><input type='text'  id='secflg_text"+rowno+"' style='    width:50px;'></td><td id='shmcd_row"+rowno+"'><input type='text' id='shmcd_text"+rowno+"' style='width: 50px;'></td><td id='shmty_row"+rowno+"'><input type='text'  id='shmty_text"+rowno+"' style='    width:40px;'></td><td id='isiccd_row"+rowno+"'><input type='text' id='isiccd_text"+rowno+"' style='width: 47px;'></td><td id='repdt_row"+rowno+"'><input type='text' id='repdt_text"+rowno+"' style='width:66px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");
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
$("#acopendt_text"+a).datepicker({
	dateFormat: "dd-mm-yy",
    changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: "today"
});
$("#repdt_text"+a).datepicker({
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

 

var	insrt =  document.getElementById("insrt_row"+no);

var	insrt_data = insrt.innerHTML;

var	sncamt =  document.getElementById("sncamt_row"+no);

var	sncamt_data = sncamt.innerHTML;

var	otstndamt =  document.getElementById("otstndamt_row"+no);

var	otstndamt_data = otstndamt.innerHTML;

var	nfbfacamt =  document.getElementById("nfbfacamt_row"+no);

var	nfbfacamt_data = nfbfacamt.innerHTML;



insrt.innerHTML="<input type='text' class='decimalPt roundUp'  id='insrt_text"+no+"'  style='width: 83px'; value='"+insrt_data+"'>";

sncamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='sncamt_text"+no+"'  style='width: 83px'; value='"+sncamt_data+"'>";
otstndamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='otstndamt_text"+no+"'  style='width: 83px'; value='"+otstndamt_data+"'>";
nfbfacamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='nfbfacamt_text"+no+"'  style='width: 83px'; value='"+nfbfacamt_data+"'>";


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
		
		if(document.getElementById("insrt_text"+no).value==""){
			alert("Enter Interest Rate ..");
			error="Y"
		}else if(document.getElementById("sncamt_text"+no).value==""){
			alert("Enter Sanction Amount ..");
			error="Y"
		}else if(document.getElementById("otstndamt_text"+no).value==""){
			alert("Enter Outstanding Amount..");
			error="Y"
		}else if(document.getElementById("nfbfacamt_text"+no).value==""){
			alert("Enter Outstanding Amount...");
			error="Y"
		}
	}else if (modtyp=="A") {
		
		
		if(document.getElementById("acno_text"+no).value==""){
			alert("Enter Account No ..");
			error="Y"
		}else if(document.getElementById("acname_text"+no).value==""){
			alert("Enter Account Name ..");	
			error="Y"
		}else if(document.getElementById("crncy_text"+no).value==""){
			alert("Enter Currency..");	
			error="Y"
		}else if(document.getElementById("sncamt_text"+no).value==""){
			alert("Enter Sanction Amount..");
			error="Y"
		}else if(document.getElementById("otstndamt_text"+no).value==""){
			alert("Enter Outstanding Amount..");
			error="Y"
		}else if(document.getElementById("npaflg_text"+no).value==""){
			alert("Enter  NPA Flag ..");
			error="Y"
		}else if(document.getElementById("acopendt_text"+no).value==""){
			alert("Enter Account Opening Date ..");
			error="Y"
		}else if(document.getElementById("nfbfacamt_text"+no).value==""){
			alert("Enter NPA Facility Amount...");
			error="Y"
		}else if(document.getElementById("resflg_text"+no).value==""){
			alert("Enter Restructured Flag..");
			error="Y"
		}else if(document.getElementById("insrt_text"+no).value==""){
			alert("Enter Interest Rate..");
			error="Y"
		}else if(document.getElementById("secflg_text"+no).value==""){
			alert("Enter Secured Flag..");
			error="Y"
		}else if(document.getElementById("shmcd_text"+no).value==""){
			alert("Enter Scheme Code..");
			error="Y"
		}else if(document.getElementById("shmty_text"+no).value==""){
			alert("Enter  Scheme Type ..");
			error="Y"
		}else if(document.getElementById("isiccd_text"+no).value==""){
			alert("Enter ISIC Code ..");
			error="Y"
		}else if(document.getElementById("repdt_text"+no).value==""){
			alert("Enter Report Date...");
			error="Y"
		}
	}
	
	
	
	if (error=="N"){
	
	$("#modflg").val("Y");
	modtyp="M";
	document.getElementById("edit_button"+no).checked = false;
	
	  


var insrt_val=document.getElementById("insrt_text"+no).value;
var sncamt_val=document.getElementById("sncamt_text"+no).value;

var otstndamt_val=document.getElementById("otstndamt_text"+no).value;

var nfbfacamt_val=document.getElementById("nfbfacamt_text"+no).value;




document.getElementById("insrt_row"+no).innerHTML=insrt_val;
document.getElementById("sncamt_row"+no).innerHTML=sncamt_val;
document.getElementById("otstndamt_row"+no).innerHTML=otstndamt_val;
document.getElementById("nfbfacamt_row"+no).innerHTML=nfbfacamt_val;


if($("#addrowno").val()=="1"){

var acno_val=document.getElementById("acno_text"+no).value;
document.getElementById("acno_row"+no).innerHTML=acno_val;

var acname_val=document.getElementById("acname_text"+no).value;
document.getElementById("acname_row"+no).innerHTML=acname_val;

var crncy_val=document.getElementById("crncy_text"+no).value;
document.getElementById("crncy_row"+no).innerHTML=crncy_val;



var npaflg_val=document.getElementById("npaflg_text"+no).value;
document.getElementById("npaflg_row"+no).innerHTML=npaflg_val;


var acopendt_val=document.getElementById("acopendt_text"+no).value;
document.getElementById("acopendt_row"+no).innerHTML=acopendt_val;


var resflg_val=document.getElementById("resflg_text"+no).value;
document.getElementById("resflg_row"+no).innerHTML=resflg_val;


var secflg_val=document.getElementById("secflg_text"+no).value;
document.getElementById("secflg_row"+no).innerHTML=secflg_val;

var shmcd_val=document.getElementById("shmcd_text"+no).value;
document.getElementById("shmcd_row"+no).innerHTML=shmcd_val;

var shmty_val=document.getElementById("shmty_text"+no).value;
document.getElementById("shmty_row"+no).innerHTML=shmty_val;

var isiccd_val=document.getElementById("isiccd_text"+no).value;
document.getElementById("isiccd_row"+no).innerHTML=isiccd_val;


var repdt_val=document.getElementById("repdt_text"+no).value;
document.getElementById("repdt_row"+no).innerHTML=repdt_val;


}else{
document.getElementById("Cancel_button"+no).style.display="inline-block";
document.getElementById("Cancel_btn"+no).style.display="none";
}

document.getElementById("edit_button"+no).style.display="inline-block";
document.getElementById("save_button"+no).style.display="none";

var acno=document.getElementById("acno_row"+no).innerHTML;
var acname=document.getElementById("acname_row"+no).innerHTML;
var crncy=document.getElementById("crncy_row"+no).innerHTML;
var sncamt=document.getElementById("sncamt_row"+no).innerHTML;
var otstndamt=document.getElementById("otstndamt_row"+no).innerHTML;
var npaflg=document.getElementById("npaflg_row"+no).innerHTML;
var acopendt=document.getElementById("acopendt_row"+no).innerHTML;
var nfbfacamt=document.getElementById("nfbfacamt_row"+no).innerHTML;
var resflg=document.getElementById("resflg_row"+no).innerHTML;
var insrt=document.getElementById("insrt_row"+no).innerHTML;
var secflg=document.getElementById("secflg_row"+no).innerHTML;
var shmcd=document.getElementById("shmcd_row"+no).innerHTML;
var shmty=document.getElementById("shmty_row"+no).innerHTML;
var isiccd=document.getElementById("isiccd_row"+no).innerHTML;
var repdt=document.getElementById("repdt_row"+no).innerHTML;


$("#dcgadd"+no).addClass("rowaddedd");
 $("#pymdets td").attr("padding","8px");
 
var refepsc0102=document.getElementById("refDisplay").value;
insrt=insrt.replace(/\,/g,'')
insrt=Number(insrt)
sncamt=sncamt.replace(/\,/g,'')
sncamt=Number(sncamt)
otstndamt=otstndamt.replace(/\,/g,'')
otstndamt=Number(otstndamt)

nfbfacamt=nfbfacamt.replace(/\,/g,'')
nfbfacamt=Number(nfbfacamt)


var rptdate1 = {
 "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refepsc0102,"acno":acno,"acname" : acname,"crncy":crncy,"sncamt" : sncamt,"otstndamt":otstndamt,"npaflg" : npaflg,"acopendt":acopendt,"nfbfacamt" : nfbfacamt,"resflg":resflg,"insrt":insrt,"secflg":secflg,"shmcd" : shmcd,"shmty":shmty,"isiccd" : isiccd,"repdt":repdt,"modtyp":modtyp
}; 

$.ajax({
url : "PSC0102",
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
        	
        	  
       	
        	 var acno=document.getElementById("acno_row"+no).innerHTML;
        	  var acname=document.getElementById("acname_row"+no).innerHTML;
        	  var crncy=document.getElementById("crncy_row"+no).innerHTML;
        	  var sncamt=document.getElementById("sncamt_row"+no).innerHTML;
        	  var otstndamt=document.getElementById("otstndamt_row"+no).innerHTML;
        	  var npaflg=document.getElementById("npaflg_row"+no).innerHTML;
        	  var acopendt=document.getElementById("acopendt_row"+no).innerHTML;
        	  var nfbfacamt=document.getElementById("nfbfacamt_row"+no).innerHTML;
        	  var resflg=document.getElementById("resflg_row"+no).innerHTML;
        	  var insrt=document.getElementById("insrt_row"+no).innerHTML;
        	  var secflg=document.getElementById("secflg_row"+no).innerHTML;
        	  var shmcd=document.getElementById("shmcd_row"+no).innerHTML;
        	  var shmty=document.getElementById("shmty_row"+no).innerHTML;
        	  var isiccd=document.getElementById("isiccd_row"+no).innerHTML;
        	  var repdt=document.getElementById("repdt_row"+no).innerHTML;
        		
	        	var refepsc0102=document.getElementById("refDisplay").value;


       insrt=insrt.replace(/\,/g,'')
       insrt=Number(insrt)
       sncamt=sncamt.replace(/\,/g,'')
       sncamt=Number(sncamt)
      otstndamt=otstndamt.replace(/\,/g,'')
      otstndamt=Number(otstndamt)
       nfbfacamt=nfbfacamt.replace(/\,/g,'')
      nfbfacamt=Number(nfbfacamt)
        		
      
      
     
        		  var rptdate1 = {
    	     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refepsc0102,"acno":acno,"acname" : acname,"crncy":crncy,"sncamt" : sncamt,"otstndamt":otstndamt,"npaflg" : npaflg,"acopendt":acopendt,"nfbfacamt" : nfbfacamt,"resflg":resflg,"insrt":insrt,"secflg":secflg,"shmcd" : shmcd,"shmty":shmty,"isiccd" : isiccd,"repdt":repdt,"modtyp":modtyp
        				};
        		 		 
        	 $.ajax({
        	     url : "PSC0102",
        	     data : rptdate1  ,
        			dataType : 'json', 
        			type : 'POST',
        			async : true,
        			 success : function(res) {
        				 console.log(res.refno);
        				//	alert("refeDCG100"+refeDCG100);
        				
        				
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
		 "acno":$("#acno_row"+no).text()
 	};
 	
 	 $.ajax({
 	     url : "PSC0102cancel",
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

 var insrt_val=document.getElementById("insrt_text"+no).value;
 document.getElementById("insrt_row"+no).innerHTML=insrt_val;

 var sncamt_val=document.getElementById("sncamt_text"+no).value;
 document.getElementById("sncamt_row"+no).innerHTML=sncamt_val;

 var otstndamt_val=document.getElementById("otstndamt_text"+no).value;
 document.getElementById("otstndamt_row"+no).innerHTML=otstndamt_val;

 var nfbfacamt_val=document.getElementById("nfbfacamt_text"+no).value;
 document.getElementById("nfbfacamt_row"+no).innerHTML=nfbfacamt_val;

 
		$("#edit_button"+no).show();
		/* document.getElementById("edit_button"+no).style.display="block"; */
		document.getElementById("save_button"+no).style.display="none";
		document.getElementById("Cancel_btn"+no).style.display="none";
		 location.reload(true); 
		 
		 
		  var insrt=document.getElementById("insrt_row"+no).innerHTMLL;
		  var isncamt_val=document.getElementById("sncamt_text"+no).innerHTMLL;

		  var otstndamt_val=document.getElementById("otstndamt_text"+no).innerHTMLL;

		  var nfbfacamt_val=document.getElementById("nfbfacamt_text"+no).innerHTMLL;

		 
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
				"acno":$("#acno_row"+no).text(),"date":'<%=dt2%>'
		};
		
		
		
		 $.ajax({
		     url : "PSC0102cancel",
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
		$("#tab2").hide();
		$("#btnXML").hide();

		/* $(".psc0500,.psc0501").hide(); */
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
		 var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "PSC0102details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#pymdets tr").remove();
					 
					
					var b=JSON.parse(res.detpsc0102);
					 console.log(b);
					
				
				
				
						 	if(f=="onload"){
						 		$(".modify").show();
						 		for(var i=0;i<b.length;i++){
						 	
						 		  $("#pymdets").append("<tr  id='dcgadd"+srno+"' ><td id='acno_row"+srno+"'>"+b[i].acno+"</td><td id='acname_row"+srno+"'>"+b[i].acname+"</td><td id='crncy_row"+srno+"'>"+b[i].crncy+"</td><td class='sumder alnum' id='sncamt_row"+srno+"'>"+b[i].sncamt+"</td><td class='sumder alnum' id='otstndamt_row"+srno+"'>"+b[i].otstndamt+"</td><td id='npaflg_row"+srno+"'>"+b[i].npaflg+"</td><td id='acopendt_row"+srno+"'>"+b[i].acopendt+"</td><td class='sumder alnum'id='nfbfacamt_row"+srno+"'>"+b[i].nfbfacamt+"</td><td id='resflg_row"+srno+"'>"+b[i].resflg+"</td><td class='sumder alnum' id='insrt_row"+srno+"'>"+b[i].insrt+"</td><td id='secflg_row"+srno+"'>"+b[i].secflg+"</td><td id='shmcd_row"+srno+"'>"+b[i].shmcd+"</td><td id='shmty_row"+srno+"'>"+b[i].shmty+"</td><td id='isiccd_row"+srno+"'>"+b[i].isiccd+"</td><td id='repdt_row"+srno+"'>"+b[i].repdt+"</td><td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none; ' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+srno+"')><input type='button'id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')></td>"
				                    
				                     
			                      
				                    +"</tr>" ) ;  
						 		  
						 		 
								
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 	
						 		$(".modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
						 			$("#pymdets").append("<tr><td id='acno_row"+srno+"'>"+b[i].acno+"</td><td id='acname_row"+srno+"'>"+b[i].acname+"</td><td id='crncy_row"+srno+"'>"+b[i].crncy+"</td><td class='sumder alnum' id='sncamt_row"+srno+"'>"+b[i].sncamt+"</td><td class='sumder alnum' id='otstndamt_row"+srno+"'>"+b[i].otstndamt+"</td><td id='npaflg_row"+srno+"'>"+b[i].npaflg+"</td><td id='acopendt_row"+srno+"'>"+b[i].acopendt+"</td><td class='sumder alnum' id='nfbfacamt_row"+srno+"'>"+b[i].nfbfacamt+"</td><td id='resflg_row"+srno+"'>"+b[i].resflg+"</td><td class='sumder alnum' id='insrt_row"+srno+"'>"+b[i].insrt+"</td><td id='secflg_row"+srno+"'>"+b[i].secflg+"</td><td id='shmcd_row"+srno+"'>"+b[i].shmcd+"</td><td id='shmty_row"+srno+"'>"+b[i].shmty+"</td><td id='isiccd_row"+srno+"'>"+b[i].isiccd+"</td><td id='repdt_row"+srno+"'>"+b[i].repdt+"</td></tr>") ;  
							 		  
							 		  
								 
								
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
				
				  /* $("#divLoading").addClass("show");  */
				
				 $(".repdisp").val(refno);
				/*  if(a=="PSC0500" || a=="psc0500"){
						$(".psc0500").show();
						$(".psc0501").hide(); */
						
						$("#test tr").children().detach().remove();
						
						 var rptdate1 = {
								  "dt1" : d,"dt2":e,"reportrefnos":refno,"curr":g,"reptype":a
								}; 
						 
						 $.ajax({
						     url : "PSC0102SUM",
						     data : rptdate1  ,
								dataType : 'json', 
								type : 'POST',
								async : true,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							console.log(res.summarypsc0102);
						
							var b=JSON.parse(res.summarypsc0102);
							
							var k=1;
							var cnt1=1;
							var srno=1;
							
							for (var i = 0;i < b.length; i++) {
							
								$("#sec1").append("<tr><td id='"+cnt1+"'>"+b[i].insname+"</td><td id='inscode"+cnt1+"'>"+b[i].inscode+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].amtperform+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].amtimp+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].monodamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].monflamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].monothamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].montotamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].monnfbamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].monresamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].outodamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].outflamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].outothamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].outtotamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].outnfbamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].tdmin+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].tdmax+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].odmin+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].odmax+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].flmin+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].flmax+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].othmin+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].othmax+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].wetavgtl+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].wetavgod+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].wetavgfl+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].wetavgoth+"</td><td style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads("+cnt1+") id='edit"+cnt1+"'></td></tr>");
								
							srno++;
								cnt1++;
								
							} 
							/* for (var i = 3; i < 6; i++) {
								
								$("#sec2").append("<tr><td id='stschm"+cnt1+"'>"+b[i].instname+"</td><td id='instcode"+cnt1+"'>"+b[i].instcode+"</td><td id='stlapp"+cnt1+"'>"+b[i].loanapprvd+"</td><td id='amtout"+cnt1+"'>"+b[i].outstndingamt+"</td><td id='min"+cnt1+"'>"+b[i].minintrate+"</td><td id='max"+cnt1+"'>"+b[i].maxintrate+"</td><td><input type=radio style=width: 15px; onclick=fnloads("+cnt1+") id='edit"+cnt1+"'></td></tr>");
								
							
								cnt1++;
								
							}  */
							
							  $("#divLoading").removeClass('show'); 
							 $('.alnum').mask("#,##0.00", {reverse: true});
							
								 }
								 }); 
						 
						 
						 var rptdate2= {
								  "dt1" : d,"dt2":e,"reportrefnos":refno,"curr":g,"reptype":a
								}; 
						 
						 $.ajax({
						     url : "PSC0102SUM1",
						     data : rptdate2  ,
								dataType : 'json', 
								type : 'POST',
								async : true,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							console.log(res.sumpsc0102);
						
							var b=JSON.parse(res.sumpsc0102);
							
							var k=1;
							var cnt1=1;
							var srno=1;
							
							for (var i = 0; i < b.length; i++) {
							
								$("#sec2").append("<tr><td id='"+cnt1+"'>"+b[i].insname+"</td><td id='inscode"+cnt1+"'>"+b[i].inscode+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].amtperform+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].amtimp+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].monodamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].monflamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].monothamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].montotamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].monnfbamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].monresamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].outodamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].outflamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].outothamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].outtotamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].outnfbamt+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].tdmin+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].tdmax+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].odmin+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].odmax+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].flmin+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].flmax+"</td><td class='sumder alnum'id='"+cnt1+"'>"+b[i].othmin+"</td><td class='sumder alnum'id='"+cnt1+"'>"+b[i].othmax+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].wetavgtl+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].wetavgod+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].wetavgfl+"</td><td class='sumder alnum' id='"+cnt1+"'>"+b[i].wetavgoth+"</td><td  style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads("+cnt1+") id='edit"+cnt1+"'></td></tr>");
								
							srno++;
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
			url:"savecheckpsc0102",
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
	location.href = "XBRL_REP_PSC0102_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>
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

<body>


	<div class="container">

		<div class="loader"></div>

		<form class="form-horizontal" method="post" name="PSC0102Form"
			enctype="multipart/form-data">
			<div class="tab-content">
			 <div id="nav">
    <div class="loader"></div>
   <input type="hidden" id="modflg" >
   <input type="hidden" id="modtyp" >
   
    <input type="hidden" id="savecheck">
     	<div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
				<div class="active psc0102" id="tab2"
					style="width: 2020px; padding-top: 1px; margin-top: -17px;">
					<div style="margin-top: 40px;">
						<font size="2" style="font-size: 13px;"><b
							style="font-size: 13px;"><%=reptype%> - <b id="sub"
								style="display: none"></b></b><b>Sectorwise Distribution of
								Credit to the Small and Medium Enterprises (SMEs) <b id="sub"
								Style="display: none"></b>
						</b></font> <br>
					</div>
					<ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">

						<li class=" pull-right list" id="li2" onclick="functionli(2);"><a
							href="#tab2" data-toggle="tab"><span class="headingtab">2</span></a></li>


						<li class=" pull-right active list" id="li1"
							onclick="functionli(1);"><a href="#tab1" data-toggle="tab"><span
								class="headingtab"> 1 </span></a></li>




					</ul>
					<table class="" style="width: 2020px; height: 50px;">
						<tr>
							<td style="background-color: #bbc3cb;">
								<font size="1"><input type="hidden"
									style="color: #0c1190; font-size: 11px;" class="repdisp"
									id="refDisplay"></input></font></td>
							<td
								style="text-align: right; background-color: #bbc3cb; width: 325px;"></td>
							<td style="text-align: right; background-color: #bbc3cb;"><a
								class="btn btn-xs btn-primary det" href="#tab1" id="det"
								data-toggle="tab"><span class="headingtab"> Details
								</span></a> <a class="btn btn-xs btn-primary summ" href="#tab2" id=""
								data-toggle="tab"><span class="headingtab ">Summary
								</span></a> <a id="btndwnld"><i
									class="glyphicon glyphicon-download-alt"
									style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><select
								id="dnloadfrmt" style="border-radius: 4px; margin-left: 10px;"><option
										value="pdf">pdf</option>
									<option value="excel">Excel</option></select></td>
						</tr>
					</table>

					<table class="table" id="tb1"
						style="width: 2020px; display: none; margin-top: -20px;">
						<tr>
							<th rowspan="5" style="text-align: center">Sectors</th>
							<th rowspan="3">Sr.No</th>
							<th style="text-align: center" colspan="2">Status of
								Outstanding Credit Facilities</th>
							<th style="text-align: center" colspan="4">Loans Approved
								during the month</th>
							<th style="text-align: center" rowspan="3">Non-fund based</th>
							<th style="text-align: center; width: 106px;" rowspan="3">Restructured
								Credit Facilities during the month</th>
							<th style="text-align: center" colspan="4">Loans
								outstanding as at end of month</th>
							<th style="text-align: center" rowspan="3">Non-fund based
							</th>
							<th style="text-align: center" colspan="12">Interest Rate
								(on rupee facilities) (%)</th>
							<th rowspan="4">Select</th>
						</tr>
						<tr>
							<th rowspan="2" style="text-align: center">Amount
								Performing</th>
							<th rowspan="2" style="text-align: center">Amount Impaired</th>
							<th rowspan="2" style="text-align: center">Overdrafts</th>
							<th rowspan="2" style="text-align: center">Finance Lease</th>
							<th rowspan="2" style="text-align: center">Other
								fund-based credit</th>
							<th rowspan="2" style="text-align: center">Total</th>
							<th rowspan="2" style="text-align: center">Overdrafts</th>
							<th rowspan="2" style="text-align: center">Finance Lease</th>
							<th rowspan="2" style="text-align: center">Other fund-based
								credit</th>
							<th rowspan="2" style="text-align: center">Total</th>
							<th colspan="2" style="text-align: center">Term Loan</th>
							<th colspan="2" style="text-align: center">Overdrafts</th>
							<th colspan="2" style="text-align: center">Finance Lease</th>
							<th colspan="2" style="text-align: center">Others</th>
							<th colspan="4" style="text-align: center">Weighted Average
							</th>
						</tr>
						<tr>
							<th>Min</th>
							<th>Max</th>
							<th>Min</th>
							<th>Max</th>
							<th>Min</th>
							<th>Max</th>
							<th>Min</th>
							<th>Max</th>
							<th>Term Loans</th>
							<th>Overdrafts</th>
							<th>Finance Lease</th>
							<th>Others</th>
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
							<th style="text-align: center">P</th>
							<th style="text-align: center">Q</th>
							<th style="text-align: center">R</th>
							<th style="text-align: center">S</th>
							<th style="text-align: center">T</th>
							<th style="text-align: center">U</th>
							<th style="text-align: center">V</th>
							<th style="text-align: center">W</th>
							<th style="text-align: center">X</th>
							<th style="text-align: center">Y</th>
							<th style="text-align: center">Z</th>
						</tr>
						<tbody class="databody" id="sec1"></tbody>
					</table>

					<table class="table" id="tb2"
						style="width: 2020px; display: none; margin-top: -20px;">
						<tr>
							<th rowspan="5" style="text-align: center">Memorandum Item</th>
							<th rowspan="3">Sr.No</th>
							<th style="text-align: center" colspan="2">Status of
								Outstanding Credit Facilities</th>
							<th style="text-align: center" colspan="4">Loans Approved
								during the month</th>
							<th style="text-align: center; width: 106px;" rowspan="3">Non-fund
								based</th>
							<th style="text-align: center; width: 106px;" rowspan="3">Restructured
								Credit Facilities during the month</th>
							<th style="text-align: center" colspan="4">Loans
								outstanding as at end of month</th>
							<th style="text-align: center" rowspan="3">Non-fund based
							</th>
							<th style="text-align: center" colspan="12">Interest Rate
								(on rupee facilities) (%)</th>
							<th rowspan="4">Select</th>
						</tr>
						<tr>
							<th rowspan="2" style="text-align: center">Amount
								Performing</th>
							<th rowspan="2" style="text-align: center">Amount Impaired</th>
							<th rowspan="2" style="text-align: center">Overdrafts</th>
							<th rowspan="2" style="text-align: center">Finance Lease</th>
							<th rowspan="2" style="text-align: center">Other
								fund-based credit</th>
							<th rowspan="2" style="text-align: center">Total</th>
							<th rowspan="2" style="text-align: center">Overdrafts</th>
							<th rowspan="2" style="text-align: center">Finance Lease</th>
							<th rowspan="2" style="text-align: center">Other fund-based
								credit</th>
							<th rowspan="2" style="text-align: center">Total</th>
							<th colspan="2" style="text-align: center">Term Loan</th>
							<th colspan="2" style="text-align: center">Overdrafts</th>
							<th colspan="2" style="text-align: center">Finance Lease</th>
							<th colspan="2" style="text-align: center">Others</th>
							<th colspan="4" style="text-align: center">Weighted Average
							</th>
						</tr>
						<tr>
							<th>Min</th>
							<th>Max</th>
							<th>Min</th>
							<th>Max</th>
							<th>Min</th>
							<th>Max</th>
							<th>Min</th>
							<th>Max</th>
							<th>Term Loans</th>
							<th>Overdrafts</th>
							<th>Finance Lease</th>
							<th>Others</th>
						</tr>
						<tr>
							<th style="text-align: center">AA</th>
							<th style="text-align: center">AB</th>
							<th style="text-align: center">AC</th>
							<th style="text-align: center">AD</th>
							<th style="text-align: center">AE</th>
							<th style="text-align: center">AF</th>
							<th style="text-align: center">AG</th>
							<th style="text-align: center">AH</th>
							<th style="text-align: center">AI</th>
							<th style="text-align: center">AJ</th>
							<th style="text-align: center">AK</th>
							<th style="text-align: center">AL</th>
							<th style="text-align: center">AM</th>
							<th style="text-align: center">AN</th>
							<th style="text-align: center">AO</th>
							<th style="text-align: center">AP</th>
							<th style="text-align: center">AQ</th>
							<th style="text-align: center">AR</th>
							<th style="text-align: center">AS</th>
							<th style="text-align: center">AT</th>
							<th style="text-align: center">AU</th>
							<th style="text-align: center">AV</th>
							<th style="text-align: center">AW</th>
							<th style="text-align: center">AX</th>
							<th style="text-align: center">AY</th>
							<th style="text-align: center">AZ</th>
						</tr>
						<tbody class="databody" id="sec2"></tbody>
					</table>
					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
						<!-- <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button> -->

						<button type="button" class="btn btn-xs btn-primary" value="Excel"
							id="btnSave">Save</button>

						<button type="button" class="btn btn-xs btn-primary"
							 value="Excel" id="btnXML">Gen XML
							Sum</button>

						<!-- <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button> -->
						<button type="button" class="btn btn-xs btn-primary" value="back"
							id="btnback">Back</button>
					</div>

				</div>


				<!-- psc0501 -->
				<%-- <div class="active psc0501" id="" style="width:100%;padding-top: 1px;margin-top: -17px;" >
	 	<div style="text-align:center;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>Names of the applicant for the Student Loan Under the Government Scheme whose applications have been rejected<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"> <%=reptype %><b id="sub" style="display: none"></b></b></div> 
          
          <table class="table" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width:100%;"></td><td style="background-color: #bbc3cb;text-align: center;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab" ><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
             <table class="table" id="tb" style="width:100%;    margin-top: -20px;">
             <tr><th rowspan="2" style="text-align:center">Sr.no</th><th style="text-align:center">Application submitted on</th><th style="text-align:center">Name</th><th style="text-align:center">Reason for rejection</th><th style="text-align:center" rowspan="2">Select</th></tr>
             <tr><th style="text-align:center">A</th><th style="text-align:center">B</th><th style="text-align:center">C</th></tr>
             
             <tbody id="section1"></tbody>
          </table>
          <div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
           
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
                <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button>
            </div>
          
          </div> --%>

				<!-- DETAIL TABLE -->

				<input type="hidden" id="rowno"> <input type="hidden"
					id="addrowno">
				<div class="active" id="tab1"
					style="width: 2015px; padding-top: 1px; margin-top: -17px; display: none">
					<div style="margin-top: 40px;">
						<font size="2" style="font-size: 13px;"><b
							style="font-size: 13px;"><%=reptype%> - <b id="sub"
								style="display: none"></b></b><b>Sectorwise Distribution of
								Credit to the Small and Medium Enterprises (SMEs)<b id="sub"
								Style="display: none"></b>
						</b></font> <br>
						<br>
						<br>
					</div>
					<div id="divLoading"></div>
					<table class="table" style="width: 2015px; height: 50px;">
						<tr>
							<td style="background-color: #bbc3cb; width: 250px;"> <font size="1"><input
									type="hidden" style="color: #0c1190; font-size: 11px;" class="repdisp"
									id="refDisplay"></input></font></td>
							<td
								style="text-align: right; background-color: #bbc3cb; width: 497px;"></td>
							<td style="background-color: #bbc3cb; text-align: right;"><a
								class="btn btn-xs btn-primary det" href="#tab1" id="det"
								data-toggle="tab"><span class="headingtab"> Details
								</span></a> <a class="btn btn-xs btn-primary" href="#tab2"
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
									<th rowspan="2" style="width:1%;"><textarea
										style="text-align: center; width: 70px;" type="text"
										id="acno" onkeyup="myFunction(this.id,0)"
										class="form-control2" placeholder="Account No" disabled></textarea></th>
									<th style="width:3%;" ><textarea style="text-align: center ;width:141px;" type="text"
										id="acname" onkeyup="myFunction(this.id,1)"
										class="form-control2" placeholder="Account Name" disabled></textarea></th>
									<th style="width:1%;"><textarea style="text-align: center; width:48px;"
										type="text" id="crncy" onkeyup="myFunction(this.id,2)"
										class="form-control2" placeholder="Currency" disabled></textarea></th>
									<th style="width:1%;" ><textarea style="text-align: center; width: 80px;"
										type="text" id="sncamt" onkeyup="myFunction(this.id,4)"
										class="form-control2" placeholder="Sanction Amount" disabled></textarea></th>
									<th style="width:1%;" ><textarea style="text-align: center; width: 80px;"
										type="text" id="otstndamt" onkeyup="myFunction(this.id,3)"
										class="form-control2" placeholder="Outstanding Amount"
										disabled></textarea></th>
									<th style="width:1%;" ><textarea style="text-align: center; width: 60px;"
										type="text" id="npaflg" onkeyup="myFunction(this.id,5)"
										class="form-control2" placeholder="NPA Flag" disabled></textarea></th>
									<th style="width:1%;" ><textarea style="text-align: center; width: 80px;"
										type="text" id="acopendt" onkeyup="myFunction(this.id,6)"
										class="form-control2" placeholder="Account Opening Date"
										disabled></textarea></th>
									<th  style="width:1%;" ><textarea style="text-align: center; width: 62px;"
										type="text" id="nfbfacamt" onkeyup="myFunction(this.id,7)"
										class="form-control2" placeholder="NPA Facility Amount"
										disabled></textarea></th>
									<th style="width:1%;" ><textarea style="text-align: center; width: 68px;"
										type="text" id="resflg" onkeyup="myFunction(this.id,8)"
										class="form-control2" placeholder="Restructured Flag" disabled></textarea></th>
									<th style="width:1%;" ><textarea style="text-align: center; width: 50px;"
										type="text" id="'insrt" onkeyup="myFunction(this.id,9)"
										class="form-control2" placeholder="Interest Rate" disabled></textarea></th>
									<th style="width:1%;" ><textarea style="text-align: center; width: 50px;"
										type="text" id="secflg" onkeyup="myFunction(this.id,10)"
										class="form-control2" placeholder="Secured Flag" disabled></textarea></th>
									<th style="width:1%;" ><textarea style="text-align: center; width: 50px;"
										type="text" id="shmcd" onkeyup="myFunction(this.id,11)"
										class="form-control2" placeholder="Scheme Code" disabled></textarea></th>
									<th style="width:1%;" ><textarea style="text-align: center; width:43px;"
										type="text" id="shmty" onkeyup="myFunction(this.id,12)"
										class="form-control2" placeholder="Scheme Type" disabled></textarea></th>
									<th style="width:1%;"><textarea style="text-align: center; width: 43px;"
										type="text" id="isiccd" onkeyup="myFunction(this.id,13)"
										class="form-control2" placeholder="ISIC Code" disabled></textarea></th>
									<th style="width:1%;" ><textarea style="text-align: center; width:41px;"
										type="text" id="repdt" onkeyup="myFunction(this.id,14)"
										class="form-control2" placeholder="Report Date" disabled></textarea></th>
										<th style="text-align: center; width: 1%;"
										id="modify" class="modify" placeholder="Modify" disabled></th>
								</tr>

							</thead>

			


							<tbody class="databody" id="pymdets">





							</tbody>



						</table>
						<div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
           
                <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button>
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
							<span class="ui-button-icon ui-icon ui-icon-closethick"> </span>
							<span class="ui-button-icon-space"> </span>Close
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