<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLFIM0100Bean,dao.XBRLFIM0100Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
    <%@ page import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat"%>
    
    
    
     
    
<%--      <%
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
 String rtime = request.getParameter("rtime");

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


.databody td{
border:1px solid #ddd;
}
/* 
tr:hover td{
    background: #bebfb0 !important;
}

 */

</style>


<!-- <script>
$(document).ready(function(){
	 $( "#repdat" ).datepicker({
	    	
	   	 dateFormat: "dd-mm-yy",
	        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today",
	     
	   });
	
});	

</script> -->




<!-- <script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});


</script> 
 -->




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
</style>



<script>
$(document).ready(function(){

	
	
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
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
  table = document.getElementById("test");
  /* table = document.getElementById("pymdets2"); */

  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==2 || b==6 || b==7 || b==8){
		
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

		location.href = "XBRL_REP_FIM0500_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'+"&rtime="+'<%=rtime%>';
	});
	$("#addrowno").val("0");
 	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>','<%=rtime%>'); 
 
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_FIM0500_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'+"&rtime="+'<%=rtime%>'; 
	});
	 
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '#btnback').click(function() {
		 location.href="XBRL_CRT_FIM0500.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	$('#btnExcel').click(function() {
		
		 FIM0500Form.action = "FIM0500EXCELREPORT.action?method=FIM0500EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>'+"&rtime="+'<%=rtime%>';
		 FIM0500Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 FIM0500Form.action = "FIM0500EXCELSum.action?method=FIM0500EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>'+"&rtime="+'<%=rtime%>';
			 FIM0500Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 FIM0500Form.action = "FIM0500PDFREPORT.action?method=FIM0500PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>'+"&rtime="+'<%=rtime%>';
			 FIM0500Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  FIM0500Form.action = "XMLDOWNLOAD.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>'+"&rtime="+'<%=rtime%>';
		 FIM0500Form.submit(); 
	});
	var save=0;

$('#btnSave').on("click",function() {
	
	  var datasum={
			"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").text(),"rtime":'<%=rtime%>'
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
			/* if(save>0){
				$("#btnXML").show();
				$("#btnSave").hide();
			}else{
				$("#btnXML").hide();
				$("#btnSave").show();
			} */
		
		}
	});  
	  
	 
});

$("#addrow").on("click",function(){
	var rowno=$("#rowno").val();
	$("#addrowno").val("1"); 
	$("#test").prepend("<tr><td id='trantype_row"+rowno+"'><input type='text' id='trantype_text"+rowno+"' style='width: 84px;'></td><td id='fcy_row"+rowno+"'><input type='text'  id='fcy_text"+rowno+"' style='    width:47px;'></td><td class='sumder alnum' id='amt_row"+rowno+"'><input type='text' id='amt_text"+rowno+"' class='decimalPt roundUp' style='     width:83px;'></td><td class='sumder alnum' id='cntrptyuqid_row"+rowno+"'><input type='text' 	id='cntrptyuqid_text"+rowno+"' style='    width: 100px;'></td><td id='cntrptynme_row"+rowno+"'><input type='text' id='cntrptynme_text"+rowno+"' style='    width: 90px;'></td><td id='sector_row"+rowno+"'><input type='text' id='sector_text"+rowno+"' style='    width:73px;'></td><td class='sumder' id='sptrt_row"+rowno+"'><input type='text' id='sptrt_text"+rowno+"' class='decimalPt roundUp' style='    width: 55px;'></td><td class='sumder alnum' id='fwdrt_row"+rowno+"'><input type='text' id='fwdrt_text"+rowno+"' class='decimalPt roundUp' style='    width: 65px;'></td><td id='fwddt_row"+rowno+"'><input type='text' id='fwddt_text"+rowno+"' style='    width: 90px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");
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
	$("#fwddt_text"+a).datepicker({
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


var	sptrt =  document.getElementById("sptrt_row"+no);

var	sptrt_data = sptrt.innerHTML;

var	fwdrt =  document.getElementById("fwdrt_row"+no);

var	fwdrt_data = fwdrt.innerHTML;

amt.innerHTML="<input type='text' class='decimalPt roundUp'  id='amt_text"+no+"'  style='width: 83px'; value='"+amt_data+"'>";

sptrt.innerHTML="<input type='text' class='decimalPt roundUp'  id='sptrt_text"+no+"'  style='width: 65px'; value='"+sptrt_data+"'>";

fwdrt.innerHTML="<input type='text' class='decimalPt roundUp'  id='fwdrt_text"+no+"'  style='width: 65px'; value='"+fwdrt_data+"'>";


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

var sptrt_val=document.getElementById("sptrt_text"+no).value;
document.getElementById("sptrt_row"+no).innerHTML=sptrt_val;


var fwdrt_val=document.getElementById("fwdrt_text"+no).value;
	document.getElementById("fwdrt_row"+no).innerHTML=fwdrt_val;
	
if($("#addrowno").val()=="1"){
	
var  trantype_val=document.getElementById("trantype_text"+no).value;	 
document.getElementById("trantype_row"+no).innerHTML=trantype_val;

   var fcy_val=document.getElementById("fcy_text"+no).value;
   document.getElementById("fcy_row"+no).innerHTML=fcy_val;
   
  var cntrptyuqid_val=document.getElementById("cntrptyuqid_text"+no).value;
   document.getElementById("cntrptyuqid_row"+no).innerHTML=cntrptyuqid_val;

   var cntrptynme_val=document.getElementById("cntrptynme_text"+no).value;
	document.getElementById("cntrptynme_row"+no).innerHTML=cntrptynme_val;
	 
  
  var sector_val=document.getElementById("sector_text"+no).value;	
  document.getElementById("sector_row"+no).innerHTML=sector_val;
 
 
 
 var fwddt_val=document.getElementById("fwddt_text"+no).value;	
 document.getElementById("fwddt_row"+no).innerHTML=fwddt_val;

 


}

document.getElementById("edit_button"+no).style.display="block";
document.getElementById("save_button"+no).style.display="none";

 var trantype=document.getElementById("trantype_row"+no).innerHTML;	 
   var fcy=document.getElementById("fcy_row"+no).innerHTML;
   var amt=document.getElementById("amt_row"+no).innerHTML;
  var cntrptyuqid=document.getElementById("cntrptyuqid_row"+no).innerHTML;
  var cntrptynme=document.getElementById("cntrptynme_row"+no).innerHTML;	
  var sector=document.getElementById("sector_row"+no).innerHTML;	 
  var sptrt=document.getElementById("sptrt_row"+no).innerHTML;
 var fwdrt=document.getElementById("fwdrt_row"+no).innerHTML;
 var fwddt=document.getElementById("fwddt_row"+no).innerHTML;
 
 
 $("#test td").attr("padding","8px");

var refeFIM0500=document.getElementById("refDisplay").innerHTML;
amt=amt.replace(/\,/g,'')
  amt=Number(amt)
  var rptdate1 = {
    "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "rtime":'<%=rtime%>', "reportrefno": refeFIM0500, "trantype":trantype,"fcy":fcy,"amt":amt,"cntrptyuqid" : cntrptyuqid, "cntrptynme":cntrptynme, "sector":sector,"sptrt":sptrt,"fwdrt" : fwdrt,"fwddt":fwddt
}; 

$.ajax({
url : "FIM0500",
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
function fnload(z,d,e,b,c,a,f,g,t){

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
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g ,"rtime":t
				}; 
				
			$.ajax({
				url : "fim500details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				
					
					  $("#test tr").remove();
					 var cnt1=1;
					
					var b=JSON.parse(res.dtlFIM0500);
					 console.log(b);
					
					
					
				
						if(f=="onload"){
					 		
					 		$("#modify").show();
					 		for(var i=0;i<b.length;i++){
					 	
$("#test").append('<tr><td id="trantype_row'+cnt1+'" >'+b[i].transactiontype+'</td><td id="fcy_row'+cnt1+'" >'+b[i].fcy+'</td><td class="sumder" id="amt_row'+cnt1+'" >'+b[i].amount+'</td><td class="sumder" id="cntrptyuqid_row'+cnt1+'" >'+b[i].counterpartyuniqueidentifier+'</td><td id="cntrptynme_row'+cnt1+'" >'+b[i].counterpartyname+'</td><td id="sector_row'+cnt1+'" >'+b[i].sector+'</td><td class="sumder decimal" id="sptrt_row'+cnt1+'" >'+b[i].spotrate+'</td><td class="sumder" id="fwdrt_row'+cnt1+'" >'+b[i].fwdrate+'</td><td id="fwddt_row'+cnt1+'" >'+b[i].fwddate+'</td> <td><input type="button" id="edit_button'+cnt1+'" value="Edit" class="btn btn-xs btn-primary edit" style="width: 37px;" onclick=edit_row("'+srno+'")>  <input type="button" id="save_button'+srno+'" value="Save" class="btn btn-xs btn-primary save" style="width: 37px; display:none;" onclick=save_row("'+srno+'")></td><tr>');	
 
					                  
					 		 
							
							 srno++;
							 cnt1++;
							 
							 
								} $("#divLoading").removeClass('show');
							$("#rowno").val(srno);
					 	}else if(f=="frmsum"){
					 		$(".add").hide();//add button hide
					 	
					 		$("#modify").hide();//modify in the header hide
					 		for(var i=0;i<b.length;i++){
					 			
					 	
					 		  $("#test").append('<tr><td id="trantype_row'+cnt1+'" >'+b[i].transactiontype+'</td><td id="fcy_row'+cnt1+'" >'+b[i].fcy+'</td><td class="sumder" id="amt_row'+cnt1+'" >'+b[i].amount+'</td><td class="sumder" id="cntrptyuqid_row'+cnt1+'" >'+b[i].counterpartyuniqueidentifier+'</td><td id="cntrptynme_row'+cnt1+'" >'+b[i].counterpartyname+'</td><td id="sector_row'+cnt1+'" >'+b[i].sector+'</td><td class="sumder decimal" id="sptrt_row'+cnt1+'" >'+b[i].spotrate+'</td><td class="sumder" id="fwdrt_row'+cnt1+'" >'+b[i].fwdrate+'</td><td id="fwddt_row'+cnt1+'" >'+b[i].fwddate+'</td><tr>');	
						 			
							 srno++;
							 
							 cnt1++;
							 
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
								 "dt1" : d,"dt2":e,"reportrefnos" : refno,"curr":g,"reptype":a,"rtime":t
								 
								}; 
						
						 $.ajax({
						     url : "FIM0500SUM",
						     data : rptdate1  ,
								dataType : 'json', 
								type : 'POST',
								async :false,
								 success : function(res) {
									 
						
						
							var b=JSON.parse(res.sumFIM0500);
							 console.log(b);
							
							var k=1;
							
							
							for (var i = 0; i < b.length; i++) {
								
							
								$("#sumtest").append("<tr><td id='verno"+cnt1+"'>"+b[i].verno+"</td><td id='t930"+cnt1+"'>"+b[i].t930+"</td><td id='t1230"+cnt1+"'>"+b[i].t1230+"</td><td id='t430"+cnt1+"'>"+b[i].t430+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads('1') id='edit"+cnt1+"'></td></tr>");
								
							
								cnt1++;
								
							}  
							
							
							  $("#divLoading").removeClass('show'); 
							 $('.alnum').mask("#,##0.00", {reverse: true});
							
								 }
								 }); 

						 	
						 var rptdate1 = {
								  "dt1" : d,"dt2":e,"reportrefnos":refno,"curr":g ,"rtime":t
								}; 
						 
						 $.ajax({
						     url : "FIM0500SUM1",
						     data : rptdate1  ,
								dataType : 'json', 
								type : 'POST',
								async : false,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							console.log(res.summaryFIM0500);
						
							var b=JSON.parse(res.summaryFIM0500);
							
							var k=1;
							var cnt1=1;
							
							
							for (var i = 0; i < b.length; i++) {
							
							
								
								
						 		  $("#sumtest1").append('<tr><td id="dynamicdomain'+cnt1+'">'+b[i].dynamicdomain+'</td><td  id="transactionno'+cnt1+'" >'+b[i].transactionno+'</td><td id="transactiontype'+cnt1+'" >'+b[i].transactiontype+'</td><td id="fcy'+cnt1+'" >'+b[i].fcy+'</td><td class="sumder" id="amount'+cnt1+'" >'+b[i].amount+'</td><td class="sumder" id="counterpartyuniqueidentifier'+cnt1+'" >'+b[i].counterpartyuniqueidentifier+'</td><td id="counterpartyname'+cnt1+'" >'+b[i].counterpartyname+'</td><td id="sector'+cnt1+'" >'+b[i].sector+'</td><td class="sumder" id="spotrate'+cnt1+'" >'+b[i].spotrate+'</td><td class="sumder" id="fwdrate'+cnt1+'" >'+b[i].fwdrate+'</td><td class="sumder" id="muramt'+cnt1+'" >'+b[i].muramt+'</td><td id="fwddate'+cnt1+'" >'+b[i].fwddate+'</td><td style="text-align: center;"><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td><tr>');	

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
	location.href = "XBRL_REP_FIM0500_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>'+"&rtime="+'<%=rtime%>'+"&cnt="+cnt;
	
}
</script>
<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="FIM0500Form"
		enctype="multipart/form-data">
             	<!-- <div class="tab-content" >
	 	<div class="active" id="tab1" style="width: 968px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="text-align:center;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>Statement of Bank Structure<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;">FIM0500 <b id="sub" style="display: none"></b></b></div> <ul class="nav nav-tabs navright" id="mytab" style="    width: 100%;">

					<li class=" pull-right list" onclick="functionli(2);"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" onclick="functionli(1);" ><a href="#tab1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>




				</ul>
            <table class="table" id="tb1" style="width:100%;display:none"><tr ><td colspan="4" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>Statement of Bank's Structure		
			
          </b>  </td></tr>
          <tr><th style="text-align:center">A</th></tr>
          </table>
          
          <table class="table" id="tb2" style="width:100%;display:none"><tr><td colspan="6" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>List of branches, counters, representative offices, subsidiaries, banking agents				
</b></td></tr>
          <tr><th rowspan="2" style="text-align:center">Serial Number</th><th style="text-align:center" >Type of Business</th><th style="text-align:center" >Name & Address</th>
          <th  style="text-align:center">Location</th><th style="text-align:center">Name of Officer in Charge</th></tr>
         
          <tr><th style="text-align:center">A</th><th style="text-align:center">B</th><th style="text-align:center">C</th><th style="text-align:center">D</th></tr>
          </table>
          
            </div>
            
            </div> -->
            
            
            <div class="tab-content" >
	 	<div class="activetab2 FIM0500" id="" style="width: 968px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" id="equinvesh"><b><%=reptype %>-Amount Due To/From Subsidiaries,Associates And Companies Forming Part Of The Same  Group<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"> <b id="sub" style="display: none"></b></b></div> 
		<ul class="nav nav-tabs navright" id="mytab" style="    width: 100%;">

					<li class=" pull-right list" id="li2" onclick="functionli(2);"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" id="li1" onclick="functionli(1);" ><a href="#tab1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>




				</ul>	<table class="" id="tab2" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select>&nbsp;&nbsp;&nbsp;</td></tr>
          		  </table>
           	
            <table class="table tb1" id="tb1" style="width:100%;display:none;margin-top:-20px;">
          
            <tr>
                  		 <th id="verno" style="text-align:center;">Reporting of Foreign Currency Position																				
           					
						</th>
           				
           				 <th id="t930" style="text-align:center;">9.30 am																					
           					
						</th>	
         			   <th id="t1230" style="text-align:center;">12.30 pm																			
           					
						</th>
												
						<th  id="t430" style="text-align:center;">4.30 pm																						
						
						</th>
						
								
						
						<th id="rad">Select</th>
						
					</tr>	
		

         
           <tbody class="databody" id="sumtest"></tbody>
          
          
          </table>
          
          <table class="table tb2" id="tb2" style="width:100%;display:none;margin-top:-20px;">
          <thead>
					
					
					 <tr class="filters" >
					 
						<!-- <th id="srl" style="width: 30px">Sl.No</th> -->
						<th rowspan="2" id="dynamicdomain" style="text-align: center;width:115px;" >Dynamic Domain</th>
						<th id="transactionno" style="text-align: center;">Transaction No.</th>
						<th id="transactiontype" style="text-align: center;">Transaction Type</th>
						
						<th id="fcy" style="text-align: center;">Fcy</th>
						
						<th id="amount" style="text-align: center;">Amount</th>
						<th id="counterpartyuniqueidentifier"style="text-align: center;">Counterparty Unique Identifier</th>
						<th id="counterpartyname"style="text-align: center;">Counterparty Name</th>
						<th id="sector" style="text-align: center;">Sector</th>
						<th id="spotrate"style="text-align: center;" >Spot Rate/Spot Rate used as basis</th>
						<th id="fwdrate" style="text-align: center;">Fwd Rate</th>
						<th id="muramt" style="text-align: center;">MUR Amt</th>
						<th  id="fwddate" style="text-align: center;width:70px;">Fwd Date</th> 
						<th rowspan="2" style="text-align: center;" >Select</th> 
					</tr>
				<tr>
				<th style="text-align: center;" id="A">A</th>
				<th style="text-align: center;"  id="B">B</th>
				<th style="text-align: center;" id="C">C</th>
				<th style="text-align: center;" id="D">D</th>
				<th style="text-align: center;" id="E">E</th>
				<th style="text-align: center;" id="F">F</th>
				<th style="text-align: center;" id="G">G</th>
				<th style="text-align: center;" id="H">H</th>
				<th style="text-align: center;" id="I">I</th>
				<th style="text-align: center;" id="J">J</th>
				<th style="text-align: center;" id="K">K</th>
				
				
				 </tr>
				 
				 
				 
				<thead>
					
					<tbody class="databody" id="sumtest1">  </table>
          
          
          
          
            <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
<!--       <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button>
 -->    
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
<!--                  <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
 -->                 
<!--        <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button>
 -->      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div>
          
            </div>
           
          
          
          <!-- DETAIL TABLE -->
          
          <input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			 <div class="activetab1" id="tab1" style="width: 975px;padding-top: 1px;margin-top: -17px;display:none" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b><%=reptype %>-Amount Due To/From Subsidiaries,Associates And Companies Forming Part Of The Same  Group		
<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"> <b id="sub" style="display: none"></b></b></div> 
			<br>
			<div id="divLoading"> 
    </div>
   <!--  <ul class="nav nav-tabs navright" id="mytab" style="    width: 1164px; ">

					<li class=" pull-right list" id="li2" onclick="functionli(2);"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" id="li1" onclick="functionli(1);" ><a href="#tab1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>


				</ul> -->
				
           <table class=""style="width: 100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 530px;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a>
                    <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;text-align:center;" id="btnfilter"><span style="text-align:center;"class="glyphicon glyphicon-filter"></span> Filter</a>&nbsp;&nbsp;&nbsp;</td></tr>
          		  </table>
 
					 <div class="panel panel-primary filterable">
					 
					   <table class="table tb1" id="tb1" style="width:100%;display:none;margin-top:-20px;"><tr>			
         	 
 			
             <thead>
					


					 
					<tr class="filters" >
					 
						<!-- <th id="srl" style="width: 30px">Sl.No</th> -->
						<!-- <th rowspan="2"  style="text-align: center;width:115px;" ><input type="text" id="dyndomain" onkeyup="myFunction(this.id,0)" style="width: 100px;" class="form-control2" placeholder="Dynamic Domain" disabled></th>
						<th  style="text-align: center;"><input type="text" id="transactnno" onkeyup="myFunction(this.id,1)" style="width: 100px;" class="form-control2" placeholder="Transaction No" disabled></th> -->
						<th  style="text-align: center;"><input type="text" id="trantyp" onkeyup="myFunction(this.id,0)" style="width: 86px;" class="form-control2" placeholder="Transaction Type" disabled></th>
						
						<th  style="text-align: center;"><input type="text"id="fcy" onkeyup="myFunction(this.id,1)" style="width: 50px;" class="form-control2" placeholder="Fcy" disabled></th>
						
						<th  style="text-align: center;"><input type="text" id="amount1" onkeyup="myFunction(this.id,2)" style="width: 78px;" class="form-control2" placeholder="Amount" disabled></th>
						<th style="text-align: center;"><input type="text" d="countuniden" onkeyup="myFunction(this.id,3)" style="width: 147px;" class="form-control2" placeholder="Counterparty Unique Identifier" disabled></th>
						<th  style="text-align: center;"><input type="text" id="counname" onkeyup="myFunction(this.id,4)" style="width: 94px;" class="form-control2" placeholder="Counterparty Name" disabled></th>
						<th  style="text-align: center;"><input type="text" id="sector1" onkeyup="myFunction(this.id,5)" style="width: 52px;" class="form-control2" placeholder="Sector" disabled></th>
						<th  style="text-align: center;"><input type="text" id="spotrate1" onkeyup="myFunction(this.id,6)" style="width: 54px;" class="form-control2" placeholder="Spot Rate/Spot Rate used as basis" disabled></th>
						<th  style="text-align: center;"><input type="text" id="fwdrate1" onkeyup="myFunction(this.id,7)" style="width: 86px;" class="form-control2" placeholder="Fwd Rate" disabled></th>
<!-- 						<th  style="text-align: center;"><input type="text" id="muramt" onkeyup="myFunction(this.id,10)" style="width: 100px;" class="form-control2" placeholder="MUR Amt" disabled></th>
 -->						<th  style="width:82px;text-align: center;"  ><input type="text" id="fwddate1" onkeyup="myFunction(this.id,8)" style="width: 93px;" class="form-control2" placeholder="Fwd Date" disabled></th> 
						<th rowspan="2" id="modify"style="text-align: center;" >Select</th> 
					</tr>
				<tr>
				<th id="A" style="text-align: center;">A</th>
				<th id="B" style="text-align: center;">B</th>
				<th id="C" style="text-align: center;">C</th>
				<th id="D" style="text-align: center;">D</th>
				<th id="E" style="text-align: center;">E</th>
				<th id="F" style="text-align: center;">F</th>
				<th id="G" style="text-align: center;">G</th>
				<th id="H" style="text-align: center;">H</th>
				<th id="I" style="text-align: center;">I</th>
				
				
				
				 </tr>
					
				</thead>
					
					<tbody class="databody" id="test">


 


              </tbody>
              
              
				</table>
			
				
				</div>
               <!-- <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
      <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button>
      <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                
       <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button>
      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div>
          
            </div>
    -->
        
				
			
				</div>
			<!--   </div>	
		 -->		
				
            </div>
            

   
     </form>
    
    
</div>





</body>
</html>