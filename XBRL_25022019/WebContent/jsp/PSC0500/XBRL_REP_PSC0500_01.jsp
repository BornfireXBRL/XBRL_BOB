<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLFIM0100Bean,dao.XBRLFIM0100Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
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

.databody td{
border:1px solid #ddd;
}

.clr{
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
	color: #a9a9a9;
	-webkit-text-fill-color: #333333;
}


.ui-dialog-titlebar-close {
    visibility: hidden;
}	
</style>



<script>
$(document).ready(function(){

	<%-- if('<%=reptype%>'=="PSC0501" || '<%=reptype%>'=="psc0501"){
		
		$(".psc0501").show();
		$(".psc0500").hide();
	}else if('<%=reptype%>'=="PSC0500" || '<%=reptype%>'=="psc0500"){
		
		$(".psc0500").show();
		$(".psc0501").hide();
	}
	 --%>
	
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
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
	$("#sumfirst").on("click",function(){
		
		location.href = "XBRL_REP_PSC0500_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
 	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>'); 
 
	$(".det").on("click",function(){
		/* alert("hiii");
		$(".active ").hide(); */
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_PSC0500_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '#btnback').click(function() {
		 location.href="XBRL_CRT_PSC0500_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
		
	
	$('#btnExcel').click(function() {
		
		 PSC0500Form.action = "PSC0500EXCELREPORT.action?method=PSC0500EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 PSC0500Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 PSC0500Form.action = "PSC0500EXCELSum.action?method=PSC0500EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 PSC0500Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 PSC0500Form.action = "PSC0500PDFREPORT.action?method=PSC0500PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 PSC0500Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  PSC0500Form.action = "XMLDOWNLOADp1.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 PSC0500Form.submit(); 
	});
	
	$("#btnfilter").on("click",function(){
		 
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
			
			

			 $('#accno,#accna,#schmtyp,#schcod,#accopda,#intrra,#balda,#acccurcod,#repdate').css({
				
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
			$(".form-control2").prop("disabled",true);$(".form-control2").val("");
			$(".form-control2").prop("disabled",true);
			
			 $('#cusid,#cusnam,#cusgrp,#natucus,#isiccod,#uniid,#expotyp,#balamt,#currcod,#repodat').css({

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
			  
				 table = document.getElementById("pymdets`");
				 tr = table.getElementsByTagName("tr");
				 for (i = 0; i < tr.length; i++) {
					 
						 
						 tr[i].style.display = ""; 
						 
				 
					 
				 }
			
		}
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
	 					url:"saveSumd1",
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
	 				   			url:"saveSumd1",
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
	$("#pymdets").prepend("<tr id='pscadd"><td id='accno_row"+rowno+"'><input type='text' id='accno_text"+rowno+"' style='width: 135px;'></td><td id='accna_row"+rowno+"'><input type='text'  id='accna_text"+rowno+"' style='    width:372px;'></td><td id='schmtyp_row"+rowno+"'><input type='text' id='schmtyp_text"+rowno+"' style='     width:94px;'></td><td id='schcod_row"+rowno+"'><input type='text' 	id='schcod_text"+rowno+"' style='    width: 88px;'></td><td id='accopda_row"+rowno+"'><input type='text' id='accopda_text"+rowno+"' style='    width: 125px;'></td><td id='intrra_row"+rowno+"' ><input type='text'  id='intrra_text"+rowno+"'    style='    width: 93px;'></td><td class='sumder'  id='balda_row"+rowno+"'><input class='decimalPt roundUp' type='text' id='balda_text"+rowno+"'  style='width:119px;'></td><td id='acccurcod_row"+rowno+"'><input type='text' id='acccurcod_text"+rowno+"' style='width:110px;'></td><td id='repdate_row"+rowno+"'><input type='text' id='repdate_text"+rowno+"' style='width:72px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");


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



function edit_row(no)
{

//alert("hiii 2d AGccccccccc" +  edit_row(no));

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
	  
	 	

	
	  var	balda =  document.getElementById("balda_row"+no);
	  
	  var	balda_data = balda.innerHTML;

	  balda.innerHTML="<input type='text' class='decimalPt roundUp'  id='balda_text"+no+"'  style='width: 83px'; value='"+balda_data+"'>";





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
		
		
		if(document.getElementById("balda_text"+no).value==""){
			alert("Enter nominal amt ..");
			error="Y"
		}
		
	} else if (modtyp=="A") {
		
		
		

		if(document.getElementById("accno_text"+no).value==""){
			alert("Enter srlno ..");
			error="Y"
		}else if(document.getElementById("accna_text"+no).value==""){
			alert("Enter trade ..");	
			error="Y"
		}else if(document.getElementById("schmtyp_text"+no).value==""){
			alert("Enter valdate ..");
			error="Y"
		}
		
		else if(document.getElementById("schcod_text"+no).value==""){
			alert("Enter typtrn ..");
			error="Y"
		}
		else if(document.getElementById("accopda_text"+no).value==""){
			alert("Enter acntno ..");
			error="Y"
		}
		else if(document.getElementById("intrra_text"+no).value==""){
			alert("Enter cntprty ..");
			error="Y"
		}
		else if(document.getElementById("balda_text"+no).value==""){
			alert("Enter ccntprtycode ..");
			error="Y"
		}
		else if(document.getElementById("acccurcod_text"+no).value==""){
			alert("Enter matudat ..");
			error="Y"
		}
		else if(document.getElementById("repdate_text"+no).value==""){
			alert("Enter residudat ..");
			error="Y"
		}
	
		
	}
	
	


	if (error=="N"){
	
	$("#modflg").val("Y");
	modtyp="M";
	document.getElementById("edit_button"+no).checked = false;

var balda_val=document.getElementById("balda_text"+no).value;

document.getElementById("balda_row"+no).innerHTML=balda_val;

if($("#addrowno").val()=="1"){

	modtyp="A";
	
	
	
		
	
var  accno_val=document.getElementById("accno_text"+no).value;	 
document.getElementById("accno_row"+no).innerHTML=accno_val;

var accna_val=document.getElementById("accna_text"+no).value;
document.getElementById("accna_row"+no).innerHTML=accna_val;

var schmtyp_val=document.getElementById("schmtyp_text"+no).value;
document.getElementById("schmtyp_row"+no).innerHTML=schmtyp_val;

var schcod_val=document.getElementById("schcod_text"+no).value;
	document.getElementById("schcod_row"+no).innerHTML=schcod_val;
	

var accopda_val=document.getElementById("accopda_text"+no).value;	
document.getElementById("accopda_row"+no).innerHTML=accopda_val;

var  intrra_val=document.getElementById("intrra_text"+no).value;	 
document.getElementById("intrra_row"+no).innerHTML=intrra_val;

var  acccurcod_val=document.getElementById("acccurcod_text"+no).value;	 
document.getElementById("acccurcod_row"+no).innerHTML=acccurcod_val;

var  repdate_val=document.getElementById("repdate_text"+no).value;	 
document.getElementById("repdate_row"+no).innerHTML=repdate_val;


}

else{
	document.getElementById("Cancel_button"+no).style.display="inline-block";
	document.getElementById("Cancel_btn"+no).style.display="none";
}

document.getElementById("edit_button"+no).style.display="inline-block";
document.getElementById("save_button"+no).style.display="none";


var accno=document.getElementById("accno_row"+no).innerHTML;	 
var accna=document.getElementById("accna_row"+no).innerHTML;
var schmtyp=document.getElementById("schmtyp_row"+no).innerHTML;
var schcod=document.getElementById("schcod_row"+no).innerHTML;
var accopda=document.getElementById("accopda_row"+no).innerHTML;
var intrra=document.getElementById("intrra_row"+no).innerHTML;	
var balda=document.getElementById("balda_row"+no).innerHTML;
var acccurcod=document.getElementById("acccurcod_row"+no).innerHTML;	 
var repdate=document.getElementById("repdate_row"+no).innerHTML;

$("#pscadd"+no).addClass("rowaddedd");


$("#det1 td").attr("padding","8px");
var refePSC500=document.getElementById("refDisplay").val;
balda=balda.replace(/\,/g,'');
balda=Number(balda);



var rptdate1 = {
		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refePSC500,"accno":accno,"accna":accna,"schmtyp":schmtyp,"schcod":schcod,"accopda":accopda,"intrra":intrra,"balda":balda,"acccurcod":acccurcod,"repdate":repdate,"modtyp":modtyp 
		}; 

$.ajax({
   url : "PSC0500",
   data : rptdate1  ,
		dataType : 'json', 
		type : 'POST',
		async : true,
		 success : function(res) {
			 console.log(res.refno);
			//	alert("refePYM100"+refePYM100);
			
			// alert("sfsdf");
			/*  $("#refDisplay").html(res.refno); */
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
	        	
	        	
	        	
	        	var accno=document.getElementById("accno_row"+no).innerHTML;	 
	        	var accna=document.getElementById("accna_row"+no).innerHTML;
	        	var schmtyp=document.getElementById("schmtyp_row"+no).innerHTML;
	        	var schcod=document.getElementById("schcod_row"+no).innerHTML;
	        	var accopda=document.getElementById("accopda_row"+no).innerHTML;
	        	var intrra=document.getElementById("intrra_row"+no).innerHTML;	
	        	var balda=document.getElementById("balda_row"+no).innerHTML;
	        	var acccurcod=document.getElementById("acccurcod_row"+no).innerHTML;	 
	        	var repdate=document.getElementById("repdate_row"+no).innerHTML;

	        	$("#pscadd"+no).addClass("rowaddedd");


	        	$("#det1 td").attr("padding","8px");
	        	var refePSC500=document.getElementById("refDisplay").val;
	        	balda=balda.replace(/\,/g,'');
	        	balda=Number(balda);



	        	var rptdate1 = {
	        			     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refePSC500,"accno":accno,"accna":accna,"schmtyp":schmtyp,"schcod":schcod,"accopda":accopda,"intrra":intrra,"balda":balda,"acccurcod":acccurcod,"repdate":repdate,"modtyp":modtyp 
	        			}; 

	    	 
	    	 $.ajax({
	    	     url : "PSC0500",
	    	     data : rptdate1  ,
	    			dataType : 'json', 
	    			type : 'POST',
	    			async : true,
	    			 success : function(res) {
	    				 console.log(res.refno);
	        				//	alert("refeDCG100"+refeDCG100);
	        				
	        				// alert("sfsdf");
	        				 $("#refDisplay").val(res.refno);
		   
			  
	        				 $("#pscadd"+no).closest("tr").remove();

			   
	        				
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
			 
			"accno":$("#accno_row"+no).text(),"date":'<%=dt2%>'
		};
		
		 $.ajax({
		     url : "PSC0500cancel",
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
	 	
	 var	balda=document.getElementById("balda_row"+no);
	
	 
	document.getElementById("balda_row"+no).innerHTML=balda_val;
			$("#edit_button"+no).show();
			/* document.getElementById("edit_button"+no).style.display="block"; */
			document.getElementById("save_button"+no).style.display="none";
			document.getElementById("Cancel_btn"+no).style.display="none";
			 location.reload(true); 
			 var balda=document.getElementById("balda_row"+no).innerHTML;
			  if($("#pscadd"+no).hasClass( "rowaddedd" )){
				  
				  document.getElementById("Cancel_button"+no).style.display="inline-block";


			  }else{
				  document.getElementById("Cancel_button"+no).style.display="none";
			  }
			  
			
	 }
function Canadd_row(no){
	 
	  /* document.getElementById("del_button"+no).style.display="inline-block"; */

																   

	 if($("#pscadd"+no).hasClass( "rowaddedd" )){
		
		var detcancel={
				"balda":$("#balda_row"+no).text(),"date":'<%=dt2%>'
		};
		

		 $.ajax({
		     url : "PSC0500cancel",
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
	 $("#pscadd"+no).remove();
	 
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
				url : "PSC0500details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#pymdets tr").remove();
					 
					
					var b=JSON.parse(res.detpsc0500);
					 console.log(b);
					
				
				
				
						 	if(f=="onload"){
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 	
						 		  $("#pymdets").append("<tr id="pscadd'+cnt1+'" ><td id='accno_row"+srno+"'>"+b[i].accno+"</td><td id='accna_row"+srno+"'>"+b[i].accna+"</td><td id='schmtyp_row"+srno+"'>"+b[i].schmtyp+"</td><td id='schcod_row"+srno+"'>"+b[i].schcod+"</td><td  id='accopda_row"+srno+"'>"+b[i].accopda+"</td><td  id='intrra_row"+srno+"'>"+b[i].intrra+"</td><td class='sumder' id='balda_row"+srno+"'>"+b[i].balda+"</td><td id='acccurcod_row"+srno+"'>"+b[i].acccurcod+"</td><td id='repdate_row"+srno+"'>"+b[i].repdate+"</td><td><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>") ;  
						 		  
						 		 
								
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 	
						 		$("#modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
						 			$("#pymdets").append("<tr><td id='accno"+srno+"'>"+b[i].accno+"</td><td id='accna"+srno+"'>"+b[i].accna+"</td><td id='schmtyp"+srno+"'>"+b[i].schmtyp+"</td><td id='schcod"+srno+"'>"+b[i].schcod+"</td><td  id='accopda"+srno+"'>"+b[i].accopda+"</td><td  id='intrra"+srno+"'>"+b[i].intrra+"</td><td class='sumder' id='balda"+srno+"'>"+b[i].balda+"</td><td id='acccurcod"+srno+"'>"+b[i].acccurcod+"</td><td id='repdate"+srno+"'>"+b[i].repdate+"</td></tr>") ;  
							 		  
							 		  
								 
								
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
						     url : "PSC0500SUM",
						     data : rptdate1  ,
								dataType : 'json', 
								type : 'POST',
								async : true,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							console.log(res.summarypsc0500);
						
							var b=JSON.parse(res.summarypsc0500);
							
							var k=1;
							var cnt1=1;
							var srno=1;
							
							for (var i = 0;i < b.length; i++) {
							
								$("#sec1").append("<tr><td id='stulon"+cnt1+"'>"+b[i].stulon+"</td><td  class='sumder' id='stulonapp"+cnt1+"'>"+b[i].stulonapp+"</td><td  class='sumder' id='amout"+cnt1+"'>"+b[i].amout+"</td><td style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads("+cnt1+") id='edit"+cnt1+"'></td></tr>");
								
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
						     url : "PSC0500SUM1",
						     data : rptdate2  ,
								dataType : 'json', 
								type : 'POST',
								async : true,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							console.log(res.sumpsc0500);
						
							var b=JSON.parse(res.sumpsc0500);
							
							var k=1;
							var cnt1=1;
							var srno=1;
							
							for (var i = 0; i < b.length; i++) {
							
								$("#sec2").append("<tr><td id='studlon"+cnt1+"'>"+b[i].studlon+"</td><td id='studenaploan"+cnt1+"'>"+b[i].studenaploan+"</td><td  id='amtoutsta"+cnt1+"'>"+b[i].amtoutsta+"</td><td id='min"+cnt1+"'>"+b[i].min+"</td><td id='max"+cnt1+"'>"+b[i].max+"</td><td  style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads("+cnt1+") id='edit"+cnt1+"'></td></tr>");
								
							srno++;
								cnt1++;
								
							} 
							/* for (var i = 3; i < 6; i++) {
								
								$("#sec2").append("<tr><td id='stschm"+cnt1+"'>"+b[i].instname+"</td><td id='instcode"+cnt1+"'>"+b[i].instcode+"</td><td id='stlapp"+cnt1+"'>"+b[i].loanapprvd+"</td><td id='amtout"+cnt1+"'>"+b[i].outstndingamt+"</td><td id='min"+cnt1+"'>"+b[i].minintrate+"</td><td id='max"+cnt1+"'>"+b[i].maxintrate+"</td><td><input type=radio style=width: 15px; onclick=fnloads("+cnt1+") id='edit"+cnt1+"'></td></tr>");
								
							
								cnt1++;
								
							} 
							 */
							  $("#divLoading").removeClass('show'); 
							 $('.alnum').mask("#,##0.00", {reverse: true});
							
								 }
								 }); 
						 
						 
						 
					/*  }else{
						$(".psc0501").show();
						$(".psc0500").hide();
						$("#test tr").children().detach().remove();
						
						var rptdate1 = {
								  "dt1" : d,"dt2":e,"reportrefnos":refno,"curr":g,"reptype":a
								}; 
						 
						 $.ajax({
						     url : "PSC0500SUM",
						     data : rptdate1  ,
								dataType : 'json', 
								type : 'POST',
								async : true,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							console.log(res.summaryPSC0500);
						
							var b=JSON.parse(res.summaryPSC0500);
							
							var k=1;
							var cnt1=1;
							
							
							for (var i = 0; i < b.length; i++) {
							
								
								//$('.alnum').mask("#,##0.00", {reverse: true});
					$("#section1").append('<tr><td>'+cnt1+'</td><td id="applsubon'+cnt1+'">'+b[i].apsubdate+'</td><td id="name'+cnt1+'">'+b[i].name+'</td><td id="reason'+cnt1+'">'+b[i].rejctdreason+'</td><td><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td></tr>');
					
							
								cnt1++;
								
							} 
							
							  $("#divLoading").removeClass('show'); 
							 $('.alnum').mask("#,##0.00", {reverse: true});
							
								 }
								 });
			 	}  */
				 
	 }
	 var datasum={
				"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>'
		};
	 

	 $.ajax({
			url:"savecheckPSC0500",
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
	location.href = "XBRL_REP_PSC0500_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
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

<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="PSC0500Form"
		enctype="multipart/form-data">
		<input type="hidden" id="savecheck">
										
    <div id="nav">
    
    
    <div class="loader"></div>
   <input type="hidden" id="modflg" >
   <input type="hidden" id="modtyp" >
         <div id="tab3" >
	
	 	<div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
    
  	
            
            	<div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
             	<div class="tab-content" >
	 	<div class="active psc0500" id="tab2" style="width: 968px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="  margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;"><%=reptype %> - <b id="sub" style="display: none"></b></b><b>Student Loan Scheme
<b id="sub"
					Style="display: none"></b></b></font>
			<br></div> 
		<ul class="nav nav-tabs navright" id="mytab" style="    width: 100%;
    ">

					<li class=" pull-right list" id="li2" onclick="functionli(2);"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" id="li1" onclick="functionli(1);" ><a href="#tab1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>




				</ul>	<table class="" style="width:968px;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:right;background-color: #bbc3cb;width:325px;"></td><td style="text-align:right;background-color: #bbc3cb;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" id="" data-toggle="tab"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
			
            <table class="table" id="tb1" style="width:968px;display:none;margin-top:-20px;"><tr>
							<th colspan="5"
								style="font-size: 13px; text-align: center"><b>Student
									Loan - Government Guaranteed Scheme </b></th>
						</tr>
						<tr>
							<th rowspan="2" style="text-align: center" id="stulon">Student loan
								Scheme</th>
							
							<th style="text-align: center" id="stulonapp">Student Loan Approved</th>
							<th style="text-align: center" id="amout">Amount Outstanding</th>
							<th style="text-align: center" rowspan="2" >Select</th>
						</tr>
						<tr>
							<th style="text-align: center">A</th>
							<th style="text-align: center">B</th>
						</tr>
          <tbody class="databody" id="sec1"></tbody>
          </table>
          
          <table class="table" id="tb2" style="width:968px;display:none;margin-top:-20px;">
        <tr>
							<th colspan="7"
								style="text-align: center; font-size: 13px; text-align: center"><b>Student
									Loans - Normal Banking Terms And Conditions</b></th>
						</tr>
						<tr>
							<th rowspan="3" style="text-align: center" id="studlon">Student loan</th>
							
							<th style="text-align: center" rowspan="2" id="studenaploan">Student Loan
								Approved</th>
							<th style="text-align: center" rowspan="2" id="amtoutsta">Amount
								Outstanding</th>
							<th colspan="2" style="text-align: center" id="ratofintrest">Range Of Interest
								Rate (%)</th>
							<th style="text-align: center" rowspan="3">Select</th>
						</tr>
						<tr>
							<th style="text-align: center" id="min" >Min</th>
							<th style="text-align: center" id="max" >Max</th>
						</tr>
						<tr>
							<th style="text-align: center">C</th>
							<th style="text-align: center">D</th>
							<th style="text-align: center">E</th>
							<th style="text-align: center">F</th>
						</tr>
          <tbody class="databody" id="sec2"></tbody>  </table>
            <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
      <!-- <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button> -->
    
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
       <!-- <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button> -->
      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div>
          
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
          
          <input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			<div class="active" id="tab1" style="width: 1436px;padding-top: 1px;margin-top: -17px;display:none" >
			<div style=" margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;"><%=reptype %>-<b id="sub" style="display: none"></b></b><b>Student Loan Scheme<b id="sub"
					Style="display: none"></b></b></font>
			<br><br><br></div> 
			<div id="divLoading"> 
    </div>
           <table class="table" style="width: 1436px;height:50px;   ">
          		  <tr >
          		  
          		  
          		  
          		  <td style="background-color: #bbc3cb;    width: 250px;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td>
			 
			 
			 <td style="text-align:right;background-color: #bbc3cb;width: 497px;"></td>
			 
			 <td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a>
                    <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></td>
                    
                    </tr>
          		  </table>
         <div class="panel panel-primary filterable">
            
           
            <table class="table" id="tbcate" border="1" style="width:100%;   margin-top: -20px;">
            
             <thead>
             
              <tr class="filters">

									<th style="width:135px;"><textarea type="text" onkeyup="myFunction(this.id,0)"
										class="form-control2" id="accno"
										placeholder="Account Number" style="width:135px;" disabled></textarea></th>
									<th style="width:372px;"><textarea type="text" id="accna"
										onkeyup="myFunction(this.id,1)" class="form-control2"
										placeholder="Account Name" style="width:372px;"  disabled></textarea></th>
									<th style="width:94px;"><textarea type="text" id="schmtyp"
										onkeyup="myFunction(this.id,2)" class="form-control2"
										placeholder="Scheme Type" style="width:94px;" disabled></textarea></th>
									<th style="width:88px;"><textarea type="text" id="schcod" class="form-control2"
										onkeyup="myFunction(this.id,3)"
										placeholder="Scheme Code" style="width:88px;"  disabled></textarea></th>
									<!-- <th id="valdate">Value Date</th> -->
									<th style="width:125px;"><textarea type="text" id="accopda"
										onkeyup="myFunction(this.id,4)" class="form-control2"
										placeholder="Account Open Date" style="width:125px;" disabled></textarea></th>
									<th style="width:93px;"><textarea type="text" class="form-control2"
										id="intrra" onkeyup="myFunction(this.id,5)"
										placeholder="Interest Rate" style="width:93px;" disabled></textarea></th>
									<th style="width:119px;" ><textarea type="text" class="form-control2"
										id="balda" onkeyup="myFunction(this.id,6)"
										placeholder="Balance Amount" style="width:119px;" disabled></textarea></th>
									<th style="width:110px;" ><textarea type="text" class="form-control2" id="acccurcod"
										onkeyup="myFunction(this.id,7)" style="width:110px;" placeholder="Account Currency Code"
										disabled></textarea></th>
									<th style="width:72px;"><textarea type="text" class="form-control2" id="repdate"
										onkeyup="myFunction(this.id,8)" placeholder="Report Date" style="width:72px;" 
										disabled></textarea></th>
									
									<th id="modify">Modify</th>

								</tr>
            
             </thead>
					
					
					
				
					<tbody class="databody" id="pymdets">


 


              </tbody>
              
   
        
				</table>
			
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