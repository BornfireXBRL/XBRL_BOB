<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLFIM0100Bean,dao.XBRLFIM0100Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
    <%@ page import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat"%>
    
    
    
     
    
 <%--     <%
    DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Date date = new Date();
	
	String username = session.getAttribute("userName").toString();
    String curdate = dateFormat.format(date);
%> --%>

	 
  <%//String RRID = request.getParameter("RRID");
 
 
 String rptdate = request.getParameter("rptdate");
 
 String dt1 = request.getParameter("dt1");
 String dt2 = request.getParameter("dt2");
 String cnt=request.getParameter("cnt");
 String reptype=request.getParameter("reptype");
 String curr = request.getParameter("curr");
 String typo=request.getParameter("typo");
// String ReporefSeq = request.getParameter("ReporefSeq");
String types=request.getParameter("types");

String instno = request.getParameter("instno");
String ReporefSeq = request.getParameter("ReporefSeq");
 
 XBRLFIM0100Dao dmd=new XBRLFIM0100Dao();
 
 DecimalFormat df = new DecimalFormat("##,#0.00");
	   

 	
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
/* 
tr:hover td{
    background: #bebfb0 !important;
}

 */

</style>


<%-- <script>
$(document).ready(function(){
	$("#sumfrst").click(function(){
		
		 location.href = "XBRL_REP_BOP0100_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		 });	
	
	$("#summaryfirst").click(function(){
		
		 location.href = "XBRL_REP_BOP0100_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		 });	
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
	
	
	
	$('#btnback').on('click', function(e){
	    e.preventDefault();
	    window.history.back();
	});
	
	
	$("#btnExcel").click(function(){ 
    	alert("HAOOO");
    	alert(document.getElementById("refdisplayFIM").innerHTML);
    	alert('<%=dt1%>');
    	alert('<%=dt2%>');
		 //return false;
		 BOP0100Form.action = "fim0100EXCELREPORT.action?method=fim0100EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+document.getElementById("refdisplayFIM").innerHTML;
		 BOP0100Form.submit();
});
	
	
	
});	

</script>




<script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});


</script> --%>





<script>

/*
Please consider that the JS part isn't production ready at all, I just code it to show the concept of merging filters and titles together !
*/
$(document).ready(function(){
	var btn=1;
	 $("#btnpre").prop("disabled",true);
  $(".tb1").show();
  
  $("#btnpre").on("click",function(){
		btn--;
		if(btn==1){
			 $("#btnpre").prop("disabled",true);
			 $("#btnnext").prop("disabled",false);
		}else{
			 $("#btnpre").prop("disabled",false);
			 $("#btnnext").prop("disabled",true);
		}
  });
  $("#btnnext").on("click",function(){
		btn++;
		if(btn==2){
			 $("#btnnext").prop("disabled",true);
			 $("#btnpre").prop("disabled",false);
		}else{
			 $("#btnnext").prop("disabled",false);
			 $("#btnpre").prop("disabled",true);
		}
  });
});
</script>


<script>
function functionli(a){
	$(".table").hide(); 
	alert(".tb"+a);
	$(".tb"+a).show();
	

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


.clr{
color: #0c0b0b;
    background-color: #f5f5f5;
    border-color: #f5f5f5;
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

.databody td{
border:1px solid #ddd;
}
</style>



<script>
$(document).ready(function(){

	
	
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
	
	
	
	$('#btnback').on('click', function(e){
	    e.preventDefault();
	    window.history.back();
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
function myFunction(a,b) {
	
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("pymdets1");
  /* table = document.getElementById("pymdets2"); */

  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==4|| b==6){
		
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



<script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});


</script>

<script>

$(document).ready(function(){
	var btn=1;
	 $("#btnpre").prop("disabled",true);
	 $(".table").hide();
	 if('<%=types%>'!="frmsum"){
		 
		 $(".tb1").show();
	 }else{
		
		 $(".tb"+'<%=cnt%>').show();
		 if('<%=cnt%>'==1){
				
				$("#btnpre").prop("disabled",true);
				 $("#btnnext").prop("disabled",false);
				 $("#li1").addClass("active");
				 $("#li2").removeClass("active");
			}else if('<%=cnt%>'==2){
				$("#btnpre").prop("disabled",false);
				 $("#btnnext").prop("disabled",true);
				 $("#li2").addClass("active");
				 $("#li1").removeClass("active");
			}
	 }
 
  
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
	$(".tb"+a).show();
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
		
		location.href = "XBRL_REP_BOP0100_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
 	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>'); 
 
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_BOP0100_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '#btnback').click(function() {
		 location.href="XBRL_CRT_BOP0100_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	$('#btnExcel').click(function() {
	
		 BOP0100Form.action = "BOP0100EXCELREPORT.action?method=BOP0100EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 BOP0100Form.submit();
	});
	$("#btndwnld").on("click",function(){
		
		if($("#dnloadfrmt").val()=="excel"){
		 BOP0100Form.action = "BOP0100EXCELSum.action?method=BOP0100EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 BOP0100Form.submit();
		 }else if($("#dnloadfrmt").val()=="pdf"){
			 BOP0100Form.action = "BOP0100PDFREPORT.action?method=BOP0100PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 BOP0100Form.submit();
		} 
	});
	$('#btnXML').click(function() {
		  BOP0100Form.action = "XMLDOWNLOADb100.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 BOP0100Form.submit(); 
	});
	var save=0;

	$('#btnSave').on("click",function() {
		
		  $("#divLoading").addClass('show'); 
		  var datasum={
				"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").text()
		};
		$.ajax({
		
			url:"saveSumb100",
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


	$("#addrow").on("click",function(){
		var rowno=$("#rowno").val();
		$("#addrowno").val("1"); 
		$("#pymdets1").prepend("<tr><td id='cusid_row"+rowno+"'><input type='text' id='cusid_text"+rowno+"' style='width: 100px;'></td><td id='natofcus_row"+rowno+"'><input type='text'  id='natofcus_text"+rowno+"' style=' width:100px;'></td><td id='nrflg_row"+rowno+"'><input type='text' id='nrflg_text"+rowno+"' style='width: 50px;'></td><td id='porem_row"+rowno+"'><input type='text' 	id='porem_text"+rowno+"' style=' width: 100px;'></td><td class='sumder alnum' id='amt_row"+rowno+"'><input type='text' id='amt_text"+rowno+"' class='decimalPt roundUp'  style='width: 121px;'></td><td id='curre_row"+rowno+"'><input type='text' id='curre_text"+rowno+"' style='width: 42px;'></td><td id='repodat_row"+rowno+"'><input type='text' id='repodat_text"+rowno+"' style='    width: 100px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");
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
	$("#repodat_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
	});
	
}

</script>


<script>
 
 
function edit_row(no)
{
	//alert("happyyyyyyyyyyyyy");
//alert("hiii 2d AGccccccccc" +  edit_row(no));
$(".add").attr("disabled",true);
$("#addrowno").val("0");
 	
 	document.getElementById("edit_button"+no).style.display="none";
 	  document.getElementById("save_button"+no).style.display="block";
 	 	
 
 	  
 	 
  
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
	
	$(".add").attr("disabled",false);
	document.getElementById("edit_button"+no).checked = false;
	
	  
	
	var amt_val=document.getElementById("amt_text"+no).value;
	
	

	document.getElementById("amt_row"+no).innerHTML=amt_val;
	
	
	if($("#addrowno").val()=="1"){
		
	var  cusid_val=document.getElementById("cusid_text"+no).value;	 
	document.getElementById("cusid_row"+no).innerHTML=cusid_val;
	

	   var natofcus_val=document.getElementById("natofcus_text"+no).value;
	   document.getElementById("natofcus_row"+no).innerHTML=natofcus_val;
		

	  var nrflg_val=document.getElementById("nrflg_text"+no).value;
	   document.getElementById("nrflg_row"+no).innerHTML=nrflg_val;
		

	  var porem_val=document.getElementById("porem_text"+no).value;	
	  document.getElementById("porem_row"+no).innerHTML=porem_val;
		

		var curre_val=document.getElementById("curre_text"+no).value;	 
		document.getElementById("curre_row"+no).innerHTML=curre_val;
		

		  
		  var repodat_val=document.getElementById("repodat_text"+no).value;	
		  document.getElementById("repodat_row"+no).innerHTML=repodat_val;
			


			
	}
	
	document.getElementById("edit_button"+no).style.display="block";
	document.getElementById("save_button"+no).style.display="none";
	

	 var cusid=document.getElementById("cusid_row"+no).innerHTML;	 
		

	 var natofcus=document.getElementById("natofcus_row"+no).innerHTML;
		

     var nrflg=document.getElementById("nrflg_row"+no).innerHTML;	


	 var porem=document.getElementById("porem_row"+no).innerHTML;
		

     var curre=document.getElementById("curre_row"+no).innerHTML;

		 var amt=document.getElementById("amt_row"+no).innerHTML;	
			

	 var repodat=document.getElementById("repodat_row"+no).innerHTML;

		
	

	 
	 $("#pymdets1 td").attr("padding","8px");
	
	var refeBOP0100=document.getElementById("refDisplay").innerHTML;
    amt=amt.replace(/\,/g,'')
	  amt=Number(amt)
		

	 var rptdate1 = {
			     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeBOP0100, "cusid":cusid,"natofcus":natofcus,"nrflg" : nrflg, "porem":porem, "amt":amt,"curre":curre,"repodat" : repodat
			}; 
	 $.ajax({
	     url : "BOP0100",
	     data : rptdate1  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 console.log(res.refno);
				 $(".repdisp").html(res.refno);

					
			}
		});
	

	
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
		 
		 $(".det").addClass("clr");
		//FOR DETAILS
		$("#tab1").show();
		var refno=b;
		
		var ins=c;
		
		if(ins==""){
			
			ins=0;
			
		}else{
		
			ins=c;
		} 
		if(refno=="null" || refno==null || refno==""){
			
			refno=0;
		}  var cnt1=1;
		var srno=1;
		
		 $(".repdisp").text(refno);
		 var srno=1;
		$(".activetab1").show();
		$(".activetab2").hide();
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "BOP0100details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#pymdets tr").remove();
					 
					
					var b=JSON.parse(res.det1BOP0100);
					 console.log(b);
					 
						 	if(f=="onload"){
						 		$("#modify").show();
						 		$("#modify1").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		
						 			$("#pymdets1").append("<tr><td  id='cusid_row"+cnt1+"'>"+b[i].cusid+"</td><td  id='natofcus_row"+cnt1+"'>"+b[i].natofcus+"</td><td   id='nrflg_row"+cnt1+"'>"+b[i].nrflg+"</td><td   id='porem_row"+cnt1+"'>"+b[i].porem+"</td><td  class='sumder alnum' id='amt_row"+cnt1+"'>"+b[i].amt+"</td><td   id='curre_row"+cnt1+"'>"+b[i].curre+"</td><td   id='repodat_row"+cnt1+"'>"+b[i].repodat+"</td><td style='text-align:center' ><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;text-align:center' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; text-align:center;display:none;' onclick=save_row('"+srno+"')></td></tr>");

								cnt1++;
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 		$(".tb"+'<%=cnt%>').show();
						 		$("#modify").hide();//modify in the header hide
						 		$("#modify1").hide();
							 		  
								 for (var i = 0; i <b.length; i++) {
							

									 $("#pymdets1").append("<tr><td  id='cusid_row"+cnt1+"'>"+b[i].cusid+"</td><td  id='natofcus_row"+cnt1+"'>"+b[i].natofcus+"</td><td   id='nrflg_row"+cnt1+"'>"+b[i].nrflg+"</td><td   id='porem_row"+cnt1+"'>"+b[i].porem+"</td><td class='sumder alnum'  id='amt_row"+cnt1+"'>"+b[i].amt+"</td><td   id='curre_row"+cnt1+"'>"+b[i].curre+"</td><td   id='repodat_row"+cnt1+"'>"+b[i].repodat+"</td></tr>");

									cnt1++;
								
							 
							
								
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
		
		$(".activetab2,.tb1").show();
		$(".activetab1").hide();
			var refno=b;
			var ins=c;
				if(ins==""){
					ins=0;
				}else{
					ins=c;
				} 
				if(refno=="null" || refno==null || refno==""){
					refno=0;
				}var cnt1=1;
				var srno=1;
				
				  /* $("#divLoading").addClass("show");  */
				
				 $(".repdisp").text(refno);
				 
						
						$("#test tr").children().detach().remove();
						
						 var rptdate1 = {
								 "dt1" : d,"dt2":e,"ReporefSeq" : refno,"curr":g,"reptype":a
								 
								}; 
						
						 $.ajax({
						     url : "BOP0100sec1",
						     data : rptdate1  ,
								dataType : 'json', 
								type : 'POST',
								async : false,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							//console.log(res.s1BOP0100);
						
							var b=JSON.parse(res.s1BOP0100);
							
							var k=1;
							
							
							for (var i = 0; i < b.length; i++) {
							
								$("#sec1").append("<tr><td  id='instname"+cnt1+"'>"+b[i].instname+"</td><td  id='instno"+cnt1+"'>"+b[i].instno+"</td><td  id='fingbc1s"+cnt1+"'>"+b[i].fingbc1s+"</td><td  id='nonfingbc1s"+cnt1+"'>"+b[i].nonfingbc1s+"</td><td  class='sumder alnum' id='gbc2s"+cnt1+"'>"+b[i].gbc2s+"</td><td class='sumder alnum' id='trnrsetben"+cnt1+"'>"+b[i].trnrsetben+"</td><td class='sumder alnum' id='nbdepins"+cnt1+"'>"+b[i].nbdepins+"</td><td class='sumder alnum' id='creduni"+cnt1+"'>"+b[i].creduni+"</td><td class='sumder alnum' id='inscorp"+cnt1+"'>"+b[i].inscorp+"</td><td class='sumder alnum' id='penfun"+cnt1+"'>"+b[i].penfun+"</td><td class='sumder alnum' id='invfun"+cnt1+"'>"+b[i].invfun+"</td><td class='sumder alnum' id='finauxint"+cnt1+"'>"+b[i].finauxint+"</td><td class='sumder alnum' id='cengov"+cnt1+"'>"+b[i].cengov+"</td><td class='sumder alnum' id='stlgov"+cnt1+"'>"+b[i].stlgov+"</td><td class='sumder alnum' id='pubnfcorp"+cnt1+"'>"+b[i].pubnfcorp+"</td><td class='sumder alnum' id='onfcorp"+cnt1+"'>"+b[i].onfcorp+"</td><td class='sumder alnum' id='hhold"+cnt1+"'>"+b[i].hhold+"</td><td class='sumder alnum' id='npinsserhh"+cnt1+"'>"+b[i].npinsserhh+"</td><td class='sumder alnum' id='total"+cnt1+"'>"+b[i].total+"</td><td style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads('1') id='edit"+cnt1+"'></td></tr>");
								
							srno++;
								cnt1++;
								
							} 
							
							  $("#divLoading").removeClass('show'); 
							 $('.alnum').mask("#,##0.00", {reverse: true});
							
								 }
								 }); 


						
	 }
	 }

</SCRIPT>
<script>

function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_BOP0100_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>'+"&cnt="+cnt;
	
}
</script>

<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="BOP0100Form"
		enctype="multipart/form-data">
		
             
            
            
            <div class="tab-content" >
	 	<div class="activetab2 BOP0100" id="" style="width: 1500px;padding-top: 1px;margin-top: -17px;" >
	 	<div rowspan="1" style="text-align:left;margin-top: 40px;"><font size="2" style="font-size: 13px;" id="claicatecom" ><b><%=reptype%>-Cash Settlements between Residents and Non-Residents<b id="sub"
					Style="display: none"></b></b></font>
		
		<br><br>
			<table class="" id="" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align:right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select>&nbsp;&nbsp;&nbsp;</td></tr>
          	 </table>
		
          
           <table class="table tb1" id="tb1" style="width:100%;display:none;margin-top:-20px;">
        
        
         <tr class="filters">
					 
						<th rowspan="3" id="instname" style="width:500px"></th>
						<th rowspan="3" id="instno" style=""></th>
						
						<th colspan="17" style="text-align:center">Residents' Transactions</th>
						<th rowspan="3" id="rad">Select</th>	
						</tr>
						
						<tr>	
						<th id="fingbc1s" style="">Financial GBC1s</th>
						<th id="nonfingbc1s" style="">Non-financial GBC1s</th>
						<th id="gbc2s" style="">GBC2s</th>
						<th id="trnrsetben" style="">Trusts with GBC and Non-resident Settlors and Beneficiaries</th>
						<th id="nbdepins" style="">Non-Bank Deposit Taking Institutions </th>
						<th id="creduni" style="">Credit Unions </th>
						<th id="inscorp" style="">Insurance Corporations</th>
				        <th id="penfun" style="">Pension Funds</th>
					    <th id="invfun" style="">Investment Funds </th>
						<th id="finauxint" style="">Financial Auxiliaries and Other Financial Intermediaries</th>
						<th id="cengov" style="">Central Government</th>
						<th id="stlgov" style="">State & Local Government</th>
						<th id="pubnfcorp" style="">Public Nonfinancial Corporations</th>
					    <th id="onfcorp" style="">Other Nonfinancial Corporations</th>
						
						<th id="hhold" STYLE="">Households</th>		
						<th id="npinsserhh">Non-Profit Institutions Serving Households</th>	
						<th id="total">Total</th>	
						
											
						
					</tr>
					
						 <tr>
					 	
						<th id="a" style="width:100px;text-align:center">A</th>
						<th id="b" style="width:100px;text-align:center">B</th>						
						<th id="c" style="width:100px;text-align:center"> C</th>						
						<th id="d" style="width:100px;text-align:center">D</th>
						<th id="e" style="width:100px;text-align:center">E</th>
						<th id="f" style="width:100px;text-align:center" >F</th>
						
					 	
						<th id="g" style="width:100px;text-align:center">G</th>
						<th id="h" style="width:100px;text-align:center">H</th>						
						<th id="i" style="width:100px;text-align:center">I</th>						
						<th id="j" style="width:100px;text-align:center">J</th>
						<th id="k" style="width:100px;text-align:center">K</th>
						<th id="l" style="width:100px;text-align:center" >L</th>
						
					 	
						<th id="m" style="width:100px;text-align:center">M</th>
						<th id="n" style="width:100px;text-align:center">N</th>						
						<th id="o" style="width:100px;text-align:center">O</th>						
						<th id="p" style="width:100px;text-align:center">P</th>
						<th id="q" style="width:100px;text-align:center">Q</th>
						
						
					</tr>
          
          
          <tbody class="databody" id="sec1"></tbody>  </table>
          
          
          
          
        <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
     <!--  <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button> -->
    
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none;"  value="Excel" id="btnXML">Gen XML Sum</button>
<!--                  <button type="button" class="btn btn-xs btn-primary"  style="display:none;"   value="" id="dwndXML">Download XML </button>
 -->                 
       <!-- <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button> -->
      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div> 
          
            </div>
        
          </div>
          <!-- DETAIL TABLE -->
          
          <input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			 <div class="activetab1" id="tab1" style="width:900px;padding-top: 1px;margin-top: -17px;display:none" >
			<div style="text-align:left; margin-top: 40px;"><font size="2" style="font-size: 13px;" id="unsubdeb"><b><%=reptype %>-Cash Settlements between Residents and Non-Residents
</b></font><br>
			<br><b style="font-size: 13px;"> <b id="sub" style="display: none"></b></b></div> 
			<div id="divLoading"> 
    </div>
 
           <table class=""   style="width: 100%;height:50px;">
          		  <tr ><td style="background-color: #bbc3cb;width: 160px;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;"></td><td style="background-color: #bbc3cb;text-align:right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a>
                    <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a>&nbsp;&nbsp;&nbsp;</td></tr>
          		  </table>
 
					 <div class="panel panel-primary filterable">
					
					
					
           <table class="table tb1" id="tb1" style="width:100%;display:none;margin-top:-20px;">
           	<tr class="filters">
           <th style="text-align:center" rowspan="1"><input  type="text" id="cusid" style="text-align: center;width: 92px;" onkeyup="myFunction(this.id,0)"class="form-control2" placeholder="Customer Id " disabled></th>
         <th style="text-align:center" rowspan="1"><input  type="text" id="natofcus" style="text-align: center;width: 92px;" onkeyup="myFunction(this.id,1)"class="form-control2" placeholder="Nature of customer" disabled></th>
          <th rowspan="1" style="text-align:center"><input  type="text" id="nrflg" style="text-align: center;width: 92px;" onkeyup="myFunction(this.id,2)"class="form-control2" placeholder="Non-Resident Flag" disabled></th>
          <th rowspan="1" style="text-align:center"><input  type="text" id="porem" style="text-align: center;width: 115px;" onkeyup="myFunction(this.id,3)"class="form-control2" placeholder="Purpose of Remittance" disabled></th>
         <th rowspan="1" style="text-align:center"><input  type="text" id="amt" style="text-align: center;width: 92px;" onkeyup="myFunction(this.id,4)"class="form-control2" placeholder="Amount" disabled></th>
         <th rowspan="1" style="text-align:center"><input  type="text" id="curre" style="text-align: center;width: 92px;" onkeyup="myFunction(this.id,5)"class="form-control2" placeholder="Currency" disabled></th>
         <th rowspan="1" style="text-align:center"><input  type="text" id="repodat" style="text-align: center;width: 92px;" onkeyup="myFunction(this.id,6)"class="form-control2" placeholder="Report date" disabled></th>
       
           <th  rowspan="2" id="modify1" style="text-align:center;width: 50px;">Modify</th>
           
           </tr>
     
          <tbody class="databody" id="pymdets1"></tbody>  </table>
					 
					 
					 
					 
				</div>
				</div>
				
				<!-- 
               <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
      <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button>
     <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                
       <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button>
      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div>
          
            </div> -->
   					
			
				
            </div>
            

    <!--  <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnpre">Previous</button>
    
       <button type="button" class="btn btn-xs btn-primary" value="back" id="btnnext">Next</button>
      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div> -->
     </form>
    
    
</div>





</body>
</html>