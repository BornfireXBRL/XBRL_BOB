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
		
		 location.href = "XBRL_REP_SUP1400_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		 });	
	
	$("#summaryfirst").click(function(){
		
		 location.href = "XBRL_REP_SUP1400_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
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
		 SUP1400Form.action = "fim0100EXCELREPORT.action?method=fim0100EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+document.getElementById("refdisplayFIM").innerHTML;
		 SUP1400Form.submit();
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
	
	
	
	
	$( '#btnback').click(function() {
		 location.href="XBRL_CRT_SUP1400_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

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
	if(b==1|| b==6){
		
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
		
		location.href = "XBRL_REP_SUP1400_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
 	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>'); 
 
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_SUP1400_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$('#btnback').on('click', function(e){
	    e.preventDefault();
	    window.history.back();
	});
	$('#btnExcel').click(function() {
	
		 SUP1400Form.action = "SUP1400EXCELREPORT.action?method=SUP1400EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 SUP1400Form.submit();
	});
	$("#btndwnld").on("click",function(){
		
		if($("#dnloadfrmt").val()=="excel"){
		 SUP1400Form.action = "SUP1400EXCELSum.action?method=SUP1400EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 SUP1400Form.submit();
		 }else if($("#dnloadfrmt").val()=="pdf"){
			 SUP1400Form.action = "SUP1400PDFREPORT.action?method=SUP1400PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 SUP1400Form.submit();
		} 
	});
	
	

	$('#btnXML').click(function() {
		  SUP1400Form.action = "XMLDOWNLOADb14.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 SUP1400Form.submit(); 
	});
	var save=0;

	$('#btnSave').on("click",function() {

	var datasum={
			"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").text()
	};
	$.ajax({
		url:"saveSum14",
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
		$("#pymdets1").prepend("<tr><td id='srlno1_row"+rowno+"'><input type='text' id='srlno1_text"+rowno+"' style='width: 67px;'></td><td id='rcptdate1_row"+rowno+"'><input type='text'  id='rcptdate1_text"+rowno+"' style=' width:182px;'></td><td id='namecmplnt1_row"+rowno+"'><input type='text' id='namecmplnt1_text"+rowno+"' style=' width: 121px;'></td><td id='adrscmplnt1_row"+rowno+"'><input type='text'id='adrscmplnt1_text"+rowno+"' style=' width: 100px;'></td><td id='comnature1_row"+rowno+"'><input type='text' id='comnature1_text"+rowno+"' style='    width: 100px;'></td><td id='comnaturedel1_row"+rowno+"'><input type='text' id='comnaturedel1_text"+rowno+"' style='width: 67px;'></td><td id='dtcmplntrsld1_row"+rowno+"'><input type='text' id='dtcmplntrsld1_text"+rowno+"'  style='width: 121px;'></td><td id='reslnature1_row"+rowno+"'><input type='text'id='reslnature1_text"+rowno+"' style='width: 42px;'></td><td id='durescmplnt1_row"+rowno+"'><input type='text'  id='durescmplnt1_text"+rowno+"' style='    width:117px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");
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
	alert(a);
	$("#rcptdate1_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
	});
	$("#dtcmplntrsld1_text"+a).datepicker({
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
/* fnkeyup(rowno);

var rownum= parseInt($("#cnt1").val());
rownum++;
$("#cnt1").val(rownum);
 	 */
 	document.getElementById("edit_button"+no).style.display="none";
 	  document.getElementById("save_button"+no).style.display="block";
 	 	
 
 	  
 	 
  
   var	dtcmplntrsld1 =  document.getElementById("dtcmplntrsld1_row"+no);
  
 var	dtcmplntrsld1_data = dtcmplntrsld1.innerHTML;
  
 

  
  
 
 dtcmplntrsld1.innerHTML="<input type='text'   id='dtcmplntrsld1_text"+no+"'   style='width: 83px'; value='"+dtcmplntrsld1_data+"'>";
  

 
 
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
	
	  
	 var dtcmplntrsld1_val=document.getElementById("dtcmplntrsld1_text"+no).value;	
	  document.getElementById("dtcmplntrsld1_row"+no).innerHTML=dtcmplntrsld1_val;
	
	   
	if($("#addrowno").val()=="1"){
	var  srlno1_val=document.getElementById("srlno1_text"+no).value;	 
	document.getElementById("srlno1_row"+no).innerHTML=srlno1_val;
	
	   var rcptdate1_val=document.getElementById("rcptdate1_text"+no).value;
	   document.getElementById("rcptdate1_row"+no).innerHTML=rcptdate1_val;
	   
	   
	   var namecmplnt1_val=document.getElementById("namecmplnt1_text"+no).value;
	   document.getElementById("namecmplnt1_row"+no).innerHTML=namecmplnt1_val;
	
	 
	   
	 
	  var adrscmplnt1_val=document.getElementById("adrscmplnt1_text"+no).value;	
	  document.getElementById("adrscmplnt1_row"+no).innerHTML=adrscmplnt1_val;
	 
		var  comnature1_val=document.getElementById("comnature1_text"+no).value;	 
		document.getElementById("comnature1_row"+no).innerHTML=comnature1_val;
		
		   var comnaturedel1_val=document.getElementById("comnaturedel1_text"+no).value;
		   document.getElementById("comnaturedel1_row"+no).innerHTML=comnaturedel1_val;
		   
		 
		
		  var reslnature1_val=document.getElementById("reslnature1_text"+no).value;	
		  document.getElementById("reslnature1_row"+no).innerHTML=reslnature1_val;

		  var durescmplnt1_val=document.getElementById("durescmplnt1_text"+no).value;
		   document.getElementById("durescmplnt1_row"+no).innerHTML=durescmplnt1_val;
			
	}
	
	document.getElementById("edit_button"+no).style.display="block";
	document.getElementById("save_button"+no).style.display="none";
	 
	 var srlno1=document.getElementById("srlno1_row"+no).innerHTML;	 
	
	   var rcptdate1=document.getElementById("rcptdate1_row"+no).innerHTML;
	  var namecmplnt1=document.getElementById("namecmplnt1_row"+no).innerHTML;	
	  var adrscmplnt1=document.getElementById("adrscmplnt1_row"+no).innerHTML;	 
	   var comnature1=document.getElementById("comnature1_row"+no).innerHTML;
	  var comnaturedel1=document.getElementById("comnaturedel1_row"+no).innerHTML;
	  var dtcmplntrsld1=document.getElementById("dtcmplntrsld1_row"+no).innerHTML;	
	  var reslnature1=document.getElementById("reslnature1_row"+no).innerHTML;	
	  var durescmplnt1=document.getElementById("durescmplnt1_row"+no).innerHTML;	

	 
	 $("#pymdets1 td").attr("padding","8px");
	
	var refeSUP1400=document.getElementById("refDisplay").innerHTML;
   /*  balamt=balamt.replace(/\,/g,'')
	  balamt=Number(balamt) */

	 var rptdate1 = {
			     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeSUP1400, "srlno1":srlno1,"rcptdate1":rcptdate1,"namecmplnt1" : namecmplnt1, "adrscmplnt1":adrscmplnt1,"comnature1":comnature1,"comnaturedel1":comnaturedel1, "dtcmplntrsld1":dtcmplntrsld1,"reslnature1":reslnature1,"durescmplnt1" : durescmplnt1
			}; 
	 $.ajax({
	     url : "SUP1400",
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
				url : "SUP1400details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#pymdets tr").remove();
					 
					
					var b=JSON.parse(res.det1SUP1400);
					 console.log(b);
					 
						 	if(f=="onload"){
						 		$("#modify").show();
						 		$("#modify1").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		
						 			$("#pymdets1").append("<tr><td  id='srlno1_row"+cnt1+"'>"+b[i].srlno1+"</td><td id='rcptdate1_row"+cnt1+"'>"+b[i].rcptdate1+"</td><td  id='namecmplnt1_row"+cnt1+"'>"+b[i].namecmplnt1+"</td><td  id='adrscmplnt1_row"+cnt1+"'>"+b[i].adrscmplnt1+"</td><td id='comnature1_row"+cnt1+"'>"+b[i].comnature1+"</td><td id='comnaturedel1_row"+cnt1+"'>"+b[i].comnaturedel1+"</td><td  id='dtcmplntrsld1_row"+cnt1+"'>"+b[i].dtcmplntrsld1+"</td><td id='reslnature1_row"+cnt1+"'>"+b[i].reslnature1+"</td><td id='durescmplnt1_row"+cnt1+"'>"+b[i].durescmplnt1+"</td><td style='text-align:center' ><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;text-align:center' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; text-align:center;display:none;' onclick=save_row('"+srno+"')></td></tr>");

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
							

									 $("#pymdets1").append("<tr><td  id='srlno1_row"+cnt1+"'>"+b[i].srlno1+"</td><td id='rcptdate1_row"+cnt1+"'>"+b[i].rcptdate1+"</td><td  id='namecmplnt1_row"+cnt1+"'>"+b[i].namecmplnt1+"</td><td  id='adrscmplnt1_row"+cnt1+"'>"+b[i].adrscmplnt1+"</td><td id='comnature1_row"+cnt1+"'>"+b[i].comnature1+"</td><td id='comnaturedel1_row"+cnt1+"'>"+b[i].comnaturedel1+"</td><td id='dtcmplntrsld1_row"+cnt1+"'>"+b[i].dtcmplntrsld1+"</td><td id='reslnature1_row"+cnt1+"'>"+b[i].reslnature1+"</td><td id='durescmplnt1_row"+cnt1+"'>"+b[i].durescmplnt1+"</td></tr>");

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
						     url : "SUP1400sec1",
						     data : rptdate1  ,
								dataType : 'json', 
								type : 'POST',
								async : false,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							console.log(res.s1SUP1400);
						
							var b=JSON.parse(res.s1SUP1400);
							
							var k=1;
							
							
							for (var i = 0; i < b.length; i++) {
							
								$("#sec1").append("<tr><td  id='srlno"+cnt1+"'>"+b[i].srlno+"</td><td id='rcptdate"+cnt1+"'>"+b[i].rcptdate+"</td><td  id='namecmplnt"+cnt1+"'>"+b[i].namecmplnt+"</td><td  id='adrscmplnt"+cnt1+"'>"+b[i].adrscmplnt+"</td><td id='comnature"+cnt1+"'>"+b[i].comnature+"</td><td id='comnaturedel"+cnt1+"'>"+b[i].comnaturedel+"</td><td id='dtcmplntrsld"+cnt1+"'>"+b[i].dtcmplntrsld+"</td><td id='reslnature"+cnt1+"'>"+b[i].reslnature+"</td><td id='durescmplnt"+cnt1+"'>"+b[i].durescmplnt+"</td><td style='text-align:center'><input type=radio  style=width: 15px; onclick=fnloads('1') id='edit"+cnt1+"'></td></tr>");
								
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
	location.href = "XBRL_REP_SUP1400_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>'+"&cnt="+cnt;
	
}
</script>

<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="SUP1400Form"
		enctype="multipart/form-data">
             
            
            
            <div class="tab-content" >
	 	<div class="activetab2 SUP1400" id="" style="width: 1200px;padding-top: 1px;margin-top: -17px;" >
	 	<div rowspan="1" style="text-align:left;margin-top: 40px;"><font size="2" style="font-size: 13px;" id="claicatecom" ><b><%=reptype%>-Statement of Complaints<b id="sub"
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
		
          
           <table class="table tb1" id="tb1" style="width:100%;display:none;margin-top:-20px;"> <!-- <tr><th rowspan="3"style="text-align:center;"id="srno">Sr.no</th> -->
        
        
         <!--   <th rowspan="1"style="text-align:center;"id="nameofcus">Name of customer</th><th style="text-align:center" rowspan="1"id="uniiden">Unique identifier</th>
          <th rowspan="1" style="text-align:center;" id="catgbc">Category of GBC</th> <th rowspan="1" style="text-align:center";id="amtfubas">Amount - Fund Based</th>  
         <th rowspan="1"  style="text-align:center;"id="amtnonfunbas">Amount - Non Fund Based</th><th rowspan="4"style="text-align:center">Select</th></tr>
          <tr><th style="text-align:center">Min</th><th style="text-align:center">Max</th></tr>
        <tr><th colspan="1"style="text-align:center">A</th><th style="text-align:center">B</th><th style="text-align:center">C</th>
        <th style="text-align:center">D</th><th style="text-align:center">E</th></tr> -->
          
          
           <tr class="filters">
					 <th id="srlno" rowspan="3" style="text-align:center;">Serial No</th>
					 
						<th id="rcptdate" rowspan="2" style="width:160px;text-align:center;">Date of receipt of complaint</th>
						<th id="namecmplnt" rowspan="2" style="width:175px;text-align:center;">Name  of complainant</th>					
						<th id="adrscmplnt" rowspan="2"style="text-align:center;">Address of complainant</th>		
						<th id="comnature" rowspan="2"style="text-align:center;">Nature of complaint</th>

						<th id="comnaturedel" rowspan="2"style="text-align:center;">Details on nature of complaint</th>
						
						<th colspan="2" rowspan="1" style="width:500px;text-align:center;" >Resolved</th>
						
						<th id="durescmplnt" rowspan="2"style="text-align:center;">Details of unresolved complaints</th>
						
						
						<th rowspan="3" id="rad"style="text-align:center;">Select</th>
						
						</tr>
						
					<tr class="filters">
					<th id="dtcmplntrsld" rowspan="1" style="text-align:center;witdth:300px"> Date on which complaint was resolved</th>
					<th id="reslnature" rowspan="1" style="text-align:center;"> Nature of resolution</th>
					
					</tr>
					
					<tr class="filters">
					<th style="text-align:center;">A</th>
					<th style="text-align:center;">B</th>
					<th style="text-align:center;">C</th>
					<th style="text-align:center;">D</th>
					<th style="text-align:center;">E</th>
					<th style="text-align:center;">F</th>
					<th style="text-align:center;">G</th>
					<th style="text-align:center;">H</th>
					
					</tr>
          
          <tbody class="databody" id="sec1"></tbody>  </table>
          
          
          
          
        <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
     <!--  <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button> -->
    
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
<!--                  <button type="button" class="btn btn-xs btn-primary"  style="display:none;"   value="" id="dwndXML">Download XML </button>
 -->                 
       <!-- <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button> -->
      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div> 
          
            </div>
        
          </div>
          <!-- DETAIL TABLE -->
          
          <input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			 <div class="activetab1" id="tab1" style="width: 157%;padding-top: 1px;margin-top: -17px;display:none" >
			<div style="text-align:left; margin-top: 40px;"><font size="2" style="font-size: 13px;" id="unsubdeb"><b><%=reptype %>-Statement of Complaints
</b></font><br>
			<br><b style="font-size: 13px;"> <b id="sub" style="display: none"></b></b></div> 
			<div id="divLoading"> 
    </div>
   <!--  <ul class="nav nav-tabs navright" id="mytab" style="    width: 100%; ">

					<li class=" pull-right list" id="li2" onclick="functionli(2);"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" id="li1" onclick="functionli(1);" ><a href="#tab1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>




				</ul> -->
           <table class=""   style="width: 100%;height:50px;">
          		  <tr ><td style="background-color: #bbc3cb;width: 100px;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;"></td><td style="background-color: #bbc3cb;text-align:right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a>
                    <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a>&nbsp;&nbsp;&nbsp;</td></tr>
          		  </table>
 
					 <div class="panel panel-primary filterable">
					
					
					
           <table class="table tb1" id="tb1" style="width:100%;display:none;margin-top:-20px;">
           <!-- 	<tr class="filters">
           <th style="text-align:center" rowspan="1"><input  type="text" id="cusid" style="text-align: center;width: 92px;" onkeyup="myFunction(this.id,0)"class="form-control2" placeholder="Customer Id " disabled></th>
         <th style="text-align:center" rowspan="1"><input  type="text" id="cusnam" style="text-align: center;width: 92px;" onkeyup="myFunction(this.id,1)"class="form-control2" placeholder="Customer Name" disabled></th>
          <th rowspan="1" style="text-align:center"><input  type="text" id="cusgrp" style="text-align: center;width: 92px;" onkeyup="myFunction(this.id,2)"class="form-control2" placeholder="Customer Group" disabled></th>
          <th rowspan="1" style="text-align:center"><input  type="text" id="natucus" style="text-align: center;width: 92px;" onkeyup="myFunction(this.id,3)"class="form-control2" placeholder="Nature Of Customer" disabled></th>
         <th rowspan="1" style="text-align:center"><input  type="text" id="isiccod" style="text-align: center;width: 92px;" onkeyup="myFunction(this.id,4)"class="form-control2" placeholder="ISIC code" disabled></th>
         <th rowspan="1" style="text-align:center"><input  type="text" id="uniid" style="text-align: center;width: 92px;" onkeyup="myFunction(this.id,5)"class="form-control2" placeholder="Unique Id" disabled></th>
         <th rowspan="1" style="text-align:center"><input  type="text" id="expotyp" style="text-align: center;width: 92px;" onkeyup="myFunction(this.id,6)"class="form-control2" placeholder="Exposure Type" disabled></th>
         <th rowspan="1" style="text-align:center"><input  type="text" id="balamt" style="text-align: center;width: 92px;" onkeyup="myFunction(this.id,7)"class="form-control2" placeholder="Balance Amount Account" disabled></th>
         <th rowspan="1" style="text-align:center"><input  type="text" id="currcod" style="text-align: center;width: 92px;" onkeyup="myFunction(this.id,8)"class="form-control2" placeholder="Currency Code" disabled></th>
         <th rowspan="1" style="text-align:center"><input  type="text" id="repodat" style="text-align: center;width: 92px;" onkeyup="myFunction(this.id,9)"class="form-control2" placeholder="Report Date" disabled></th>
           <th  rowspan="2" id="modify1" style="text-align:center;">Modify</th>
           
           </tr> -->
     
     
      <tr class="filters">
					 
					    <th rowspan="3"><input type=text id="srlno1" style="text-align:center;width: 92px" onkeyup="myFunction(this.id,0)"class="form-control2" placeholder="Serial No"disabled></th>					 
						<th rowspan="2"><input type="text" id="rcptdate1"  style="width:160px;text-align:center;" onkeyup="myFunction(this.id,1)"class="form-control2" placeholder="Date of receipt of complaint " disabled></th>
						<th rowspan="2"><input type="text" id="namecmplnt1"  style="width:130px;text-align:center;" onkeyup="myFunction(this.id,2)"class="form-control2" placeholder="Name  of complainant " disabled></th>					
						<th rowspan="2"><input type="text" id="adrscmplnt1" style="text-align:center;width: 120px" onkeyup="myFunction(this.id,3)"class="form-control2" placeholder="Address of complainant " disabled></th>		
						<th rowspan="2"><input type="text" id="comnature1" style="text-align:center;width: 110px" onkeyup="myFunction(this.id,4)"class="form-control2" placeholder="Nature of complaint " disabled></th>

						<th rowspan="2"><input type="text" id="comnaturedel1" style="text-align:center;width: 150px" onkeyup="myFunction(this.id,5)"class="form-control2" placeholder="Details on nature of complaint " disabled></th>
						<th colspan="2" rowspan="1" style="width:500px;text-align:center;" >Resolved</th>
						<th rowspan="2"><input type="text" id="durescmplnt1"style="text-align:center;width: 158px" onkeyup="myFunction(this.id,8)"class="form-control2" placeholder="Details of unresolved complaints" disabled></th>
						
						
						<th rowspan="3" id="modify1"style="text-align:center;">Modify</th>
						
						</tr>
						
					 <tr class="filters">
					<th rowspan="1"><input type="text" id="dtcmplntrsld1"  style="text-align:center;width: 200px" onkeyup="myFunction(this.id,6)"class="form-control2" placeholder="Date on which complaint was resolved" disabled> </th>
					<th rowspan="1"><input type="text" id="reslnature1"  style="text-align:center;" onkeyup="myFunction(this.id,7)"class="form-control2" placeholder="Nature of resolution" disabled> </th>
					
					</tr>
					
					<tr class="filters">
					<th style="text-align:center;">A</th>
					<th style="text-align:center;">B</th>
					<th style="text-align:center;">C</th>
					<th style="text-align:center;">D</th>
					<th style="text-align:center;">E</th>
					<th style="text-align:center;">F</th>
					<th style="text-align:center;">G</th>
					<th style="text-align:center;">H</th>
					
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