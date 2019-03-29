<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLSUP0900Bean,dao.XBRLSUP0900Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
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
 String typo=request.getParameter("typo");
 String ReporefSeq = request.getParameter("ReporefSeq");
String types=request.getParameter("types");

String instno = request.getParameter("instno");

XBRLSUP0900Dao dmd=new XBRLSUP0900Dao();
 
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
.databody td{
border:1px solid #ddd;
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

.clr{
color: #0c0b0b;
    background-color: #f5f5f5;
    border-color: #f5f5f5;
}

/* 
tr:hover td{
    background: #bebfb0 !important;
}

 */

</style>

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



<script>
$(document).ready(function(){
	
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');

});   
</script>

<script>
$(document).ready(function(){
$("#tb1").show();

	<%-- if('<%=reptype%>'=="PSC0106" || '<%=reptype%>'=="psc0106"){
		
		$(".psc0106").show();
		
		$(".psc0105").hide();
	}else if('<%=reptype%>'=="PSC0105" || '<%=reptype%>'=="psc0105"){
		
		$(".psc0105").show();
		$(".psc0106").hide();
	} --%>
	
	
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
	
	$( '#btnback').click(function() {
		 location.href="XBRL_CRT_SUP0900_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	
	
});	

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
		if(btn==5){
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
}else {
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
		
		location.href = "XBRL_REP_SUP0900_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_SUP0900_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	
	
	$('#btnExcel').click(function() {
		
		
		SUP0900Form.action = "SUP0900EXCELREPORT.action?method=SUP0900EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		SUP0900Form.submit();
		 
		 
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			SUP0900Form.action = "SUP0900EXCELSum.action?method=SUP0900EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			SUP0900Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			SUP0900Form.action = "SUP0900PDFREPORT.action?method=SUP0900PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			SUP0900Form.submit();
		}
	});
	$('#btnXML').click(function() {
		SUP0900Form.action = "XMLDOWNLOADs9.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		SUP0900Form.submit(); 
	});
	$("#btnfilter").on("click",function(){
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
		}else{
			$(".form-control2").val("");
			$(".form-control2").prop("disabled",true);
		}
		
	});

	var save=0;

$('#btnSave').on("click",function() {
	
	  var datasum={
			"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").text()
	};
	$.ajax({
		url:"saveSums9",
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
	
	$("#supdets").prepend("<tr><td id='tyeve_row"+rowno+"'><input type='text' id='tyeve_text"+rowno+"' style='width: 200px;'></td><td id='inco_row"+rowno+"'><input type='text'  id='inco_text"+rowno+"'style='width: 100px;'></td><td class='sumder alnum' id='cfl_row"+rowno+"'><input type='text' id='cfl_text"+rowno+"' style='     100px;'></td><td class='sumder alnum' id='cfi_row"+rowno+"'><input type='text' 	id='cfi_text"+rowno+"' style='    width: 100px;'></td><td class='sumder alnum' id='cfl1_row"+rowno+"'><input type='text' 	id='cfl1_text"+rowno+"' style='    width: 100px;'></td><td class='sumder alnum' id='cfi1_row"+rowno+"'><input type='text' 	id='cfi1_text"+rowno+"' style='    width: 100px;'></td><td class='sumder alnum' id='cfl2_row"+rowno+"'><input type='text' 	id='cfl2_text"+rowno+"' style='    width: 100px;'></td><td class='sumder alnum' id='cfi2_row"+rowno+"'><input type='text' 	id='cfi2_text"+rowno+"' style='    width: 100px;'></td><td class='sumder alnum' id='cfl3_row"+rowno+"'><input type='text' 	id='cfl3_text"+rowno+"' style='    width: 100px;'></td><td class='sumder alnum' id='cfi3_row"+rowno+"'><input type='text' 	id='cfi3_text"+rowno+"' style='    width: 100px;'></td><td class='sumder alnum' id='cfl4_row"+rowno+"'><input type='text' 	id='cfl4_text"+rowno+"' style='    width: 100px;'></td><td class='sumder alnum' id='cfi4_row"+rowno+"'><input type='text' 	id='cfi4_text"+rowno+"' style='    width: 100px;'></td><td class='sumder alnum' id='cfl5_row"+rowno+"'><input type='text' 	id='cfl5_text"+rowno+"' style='    width: 100px;'></td><td class='sumder alnum' id='cfi5_row"+rowno+"'><input type='text' 	id='cfi5_text"+rowno+"' style='    width: 100px;'></td><td class='sumder alnum' id='cfl6_row"+rowno+"'><input type='text' 	id='cfl6_text"+rowno+"' style='    width: 100px;'></td><td class='sumder alnum' id='cfi6_row"+rowno+"'><input type='text' 	id='cfi6_text"+rowno+"' style='    width: 100px;'></td><td class='sumder alnum' id='cfl7_row"+rowno+"'><input type='text' 	id='cfl7_text"+rowno+"' style='    width: 100px;'></td><td class='sumder alnum' id='cfi7_row"+rowno+"'><input type='text' 	id='cfi7_text"+rowno+"' style='    width: 100px;'></td><td  id='redat_row"+rowno+"'><input type='text' 	id='redat_text"+rowno+"' style='    width: 100px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");
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

</script>
<script>


function fnkeyup(a){

		$("#redat_text"+a).datepicker({
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


	
	document.getElementById("edit_button"+no).style.display="none";
	  document.getElementById("save_button"+no).style.display="block";
	  
	  $("#addrowno").val("0");

		



var	cfl =  document.getElementById("cfl_row"+no);
var	cfl_data = cfl.innerHTML; 

var	cfi =  document.getElementById("cfi_row"+no);
var	cfi_data = cfi.innerHTML; 
	
var	cfl1 =  document.getElementById("cfl1_row"+no);
var	cfl1_data = cfl1.innerHTML;

var	cfi1 =  document.getElementById("cfi1_row"+no);
var	cfi1_data = cfi1.innerHTML;

var	cfl2=  document.getElementById("cfl2_row"+no);
var	cfl2_data = cfl2.innerHTML;

var	cfi2 =  document.getElementById("cfi2_row"+no);
var	cfi2_data = cfi2.innerHTML;


var	cfl3 =  document.getElementById("cfl3_row"+no);
var	cfl3_data = cfl3.innerHTML;


var	cfi3 =  document.getElementById("cfi3_row"+no);
var	cfi3_data = cfi3.innerHTML;

var	cfl4 =  document.getElementById("cfl4_row"+no);
var	cfl4_data = cfl4.innerHTML;

var	cfi4 =  document.getElementById("cfi4_row"+no);
var	cfi4_data = cfi4.innerHTML;

var	cfl5 =  document.getElementById("cfl5_row"+no);
var	cfl5_data = cfl5.innerHTML;

var	cfi5 =  document.getElementById("cfi5_row"+no);
var	cfi5_data = cfi5.innerHTML;

var	cfl6 =  document.getElementById("cfl6_row"+no);
var	cfl6_data = cfl6.innerHTML;

var	cfi6 =  document.getElementById("cfi6_row"+no);
var	cfi6_data = cfi6.innerHTML;

var	cfl7 =  document.getElementById("cfl7_row"+no);
var	cfl7_data = cfl7.innerHTML;

var	cfi7 =  document.getElementById("cfi7_row"+no);
var	cfi7_data = cfi7.innerHTML;

cfl.innerHTML="<input type='text' class='decimalPt roundUp'  id='cfl_text"+no+"'  style='width: 83px'; value='"+cfl_data+"'>";
cfi.innerHTML="<input type='text' class='decimalPt roundUp'  id='cfi_text"+no+"'  style='width: 83px'; value='"+cfi_data+"'>";
cfl1.innerHTML="<input type='text' class='decimalPt roundUp'  id='cfl1_text"+no+"'  style='width: 83px'; value='"+cfl1_data+"'>";
cfi1.innerHTML="<input type='text' class='decimalPt roundUp'  id='cfi1_text"+no+"'  style='width: 83px'; value='"+cfi1_data+"'>";
cfl2.innerHTML="<input type='text' class='decimalPt roundUp'  id='cfl2_text"+no+"'  style='width: 83px'; value='"+cfl2_data+"'>";
cfi2.innerHTML="<input type='text' class='decimalPt roundUp'  id='cfi2_text"+no+"'  style='width: 83px'; value='"+cfi2_data+"'>";
cfl3.innerHTML="<input type='text' class='decimalPt roundUp'  id='cfl3_text"+no+"'  style='width: 83px'; value='"+cfl3_data+"'>";
cfi3.innerHTML="<input type='text' class='decimalPt roundUp'  id='cfi3_text"+no+"'  style='width: 83px'; value='"+cfi3_data+"'>";
cfl4.innerHTML="<input type='text' class='decimalPt roundUp'  id='cfl4_text"+no+"'  style='width: 83px'; value='"+cfl4_data+"'>";
cfi4.innerHTML="<input type='text' class='decimalPt roundUp'  id='cfi4_text"+no+"'  style='width: 83px'; value='"+cfi4_data+"'>";
cfl5.innerHTML="<input type='text' class='decimalPt roundUp'  id='cfl5_text"+no+"'  style='width: 83px'; value='"+cfl5_data+"'>";
cfi5.innerHTML="<input type='text' class='decimalPt roundUp'  id='cfi5_text"+no+"'  style='width: 83px'; value='"+cfi5_data+"'>";
cfl6.innerHTML="<input type='text' class='decimalPt roundUp'  id='cfl6_text"+no+"'  style='width: 83px'; value='"+cfl6_data+"'>";
cfi6.innerHTML="<input type='text' class='decimalPt roundUp'  id='cfi6_text"+no+"'  style='width: 83px'; value='"+cfi6_data+"'>";
cfl7.innerHTML="<input type='text' class='decimalPt roundUp'  id='cfl7_text"+no+"'  style='width: 83px'; value='"+cfl7_data+"'>";
cfi7.innerHTML="<input type='text' class='decimalPt roundUp'  id='cfi7_text"+no+"'  style='width: 83px'; value='"+cfi7_data+"'>";

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



var cfl_val=document.getElementById("cfl_text"+no).value;
document.getElementById("cfl_row"+no).innerHTML=cfl_val;

var cfi_val=document.getElementById("cfi_text"+no).value;
document.getElementById("cfi_row"+no).innerHTML=cfi_val;

var cfl1_val=document.getElementById("cfl1_text"+no).value;
document.getElementById("cfl1_row"+no).innerHTML=cfl1_val;

var cfi1_val=document.getElementById("cfi1_text"+no).value;
document.getElementById("cfi1_row"+no).innerHTML=cfi1_val;

var cfl2_val=document.getElementById("cfl2_text"+no).value;
document.getElementById("cfl2_row"+no).innerHTML=cfl2_val;

var cfi2_val=document.getElementById("cfi2_text"+no).value;
document.getElementById("cfi2_row"+no).innerHTML=cfi2_val;

var cfl3_val=document.getElementById("cfl3_text"+no).value;
document.getElementById("cfl3_row"+no).innerHTML=cfl3_val;

var cfi3_val=document.getElementById("cfi3_text"+no).value;
document.getElementById("cfi3_row"+no).innerHTML=cfi3_val;

var cfl4_val=document.getElementById("cfl4_text"+no).value;
document.getElementById("cfl4_row"+no).innerHTML=cfl4_val;

var cfi4_val=document.getElementById("cfi4_text"+no).value;
document.getElementById("cfi4_row"+no).innerHTML=cfi4_val;

var cfl5_val=document.getElementById("cfl5_text"+no).value;
document.getElementById("cfl5_row"+no).innerHTML=cfl5_val;

var cfi5_val=document.getElementById("cfi5_text"+no).value;
document.getElementById("cfi5_row"+no).innerHTML=cfi5_val;

var cfl6_val=document.getElementById("cfl6_text"+no).value;
document.getElementById("cfl6_row"+no).innerHTML=cfl6_val;

var cfi6_val=document.getElementById("cfi6_text"+no).value;
document.getElementById("cfi6_row"+no).innerHTML=cfi6_val;

var cfl7_val=document.getElementById("cfl7_text"+no).value;
document.getElementById("cfl7_row"+no).innerHTML=cfl7_val;

var cfi7_val=document.getElementById("cfi7_text"+no).value;
document.getElementById("cfi7_row"+no).innerHTML=cfi7_val;

if($("#addrowno").val()=="1"){

	
	
var  tyeve_val=document.getElementById("tyeve_text"+no).value;	 
document.getElementById("tyeve_row"+no).innerHTML=tyeve_val;



var inco_val=document.getElementById("inco_text"+no).value;
document.getElementById("inco_row"+no).innerHTML=inco_val;





 var  redat_val=document.getElementById("redat_text"+no).value;
 document.getElementById("redat_row"+no).innerHTML=redat_val;

}

document.getElementById("edit_button"+no).style.display="block";
document.getElementById("save_button"+no).style.display="none";


var tyeve=document.getElementById("tyeve_row"+no).innerHTML;	 

var inco=document.getElementById("inco_row"+no).innerHTML;

var cfl=document.getElementById("cfl_row"+no).innerHTML;
var cfi=document.getElementById("cfi_row"+no).innerHTML;
var cfl1=document.getElementById("cfl1_row"+no).innerHTML;
var cfi1=document.getElementById("cfi1_row"+no).innerHTML;
var cfl2=document.getElementById("cfl2_row"+no).innerHTML;
var cfi2=document.getElementById("cfi2_row"+no).innerHTML;
var cfl3=document.getElementById("cfl3_row"+no).innerHTML;

var cfi3=document.getElementById("cfi3_row"+no).innerHTML;
var cfl4=document.getElementById("cfl4_row"+no).innerHTML;
var cfi4=document.getElementById("cfi4_row"+no).innerHTML;

var cfl5=document.getElementById("cfl5_row"+no).innerHTML;
var cfi5=document.getElementById("cfi5_row"+no).innerHTML;
var cfl6=document.getElementById("cfl6_row"+no).innerHTML;

var cfi6=document.getElementById("cfi6_row"+no).innerHTML;
var cfl7=document.getElementById("cfl7_row"+no).innerHTML;
var cfi7=document.getElementById("cfi7_row"+no).innerHTML;
var redat=document.getElementById("redat_row"+no).innerHTML;


$("#det1 td").attr("padding","8px");
var refeSUP0900=document.getElementById("refDisplay").innerHTML;

cfl=cfl.replace(/\,/g,'');
cfl=Number(cfl);

cfi=cfi.replace(/\,/g,'');
cfi=Number(cfi);

cfl1=cfl1.replace(/\,/g,'');
cfl1=Number(cfl1);

cfi1=cfi1.replace(/\,/g,'');
cfi1=Number(cfi1);

cfl2=cfl2.replace(/\,/g,'');
cfl2=Number(cfl2);

cfi2=cfi2.replace(/\,/g,'');
cfi2=Number(cfi2);

cfl3=cfl3.replace(/\,/g,'');
cfl3=Number(cfl3);

cfi3=cfi3.replace(/\,/g,'');
cfi3=Number(cfi3);

cfl4=cfl4.replace(/\,/g,'');
cfl4=Number(cfl4);

cfi4=cfi4.replace(/\,/g,'');
cfi4=Number(cfi4);

cfl5=cfl5.replace(/\,/g,'');
cfl5=Number(cfl5);

cfi5=cfi5.replace(/\,/g,'');
cfi5=Number(cfi5);

cfl6=cfl6.replace(/\,/g,'');
cfl6=Number(cfl6);

cfi6=cfi6.replace(/\,/g,'');
cfi6=Number(cfi6);

cfl7=cfl7.replace(/\,/g,'');
cfl7=Number(cfl7);

cfi7=cfi7.replace(/\,/g,'');
cfi7=Number(cfi7);



var rptdate1 = {
		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeSUP0900,"tyeve":tyeve,"inco":inco,"cfl":cfl,"cfi":cfi,"cfl1":cfl1,"cfi1":cfi1,"cfl2":cfl2,"cfi2":cfi2,"cfl3":cfl3,"cfi3":cfi3,"cfl4":cfl4,"cfi4":cfi4,"cfl5":cfl5,"cfi5":cfi5,"cfl6":cfl6,"cfi6":cfi6,"cfl7":cfl7,"cfi7":cfi7,"redat":redat 
		}; 

$.ajax({
   
	url : "SUP0900",
   data : rptdate1  ,
		dataType : 'json', 
		type : 'POST',
		async : true,
		 success : function(res) {
			 console.log(res.refno);
			
			/*  $("#refDisplay").html(res.refno); */
			 $(".repdisp").html(res.refno);
			
			
			
		}
	});



}

</script> 




<script>
function myFunction(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("supdets");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==0 || b==1){
    	
	    
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	    	
	        tr[i].style.display = "";
	       
	      } else {
	        tr[i].style.display = "none";
	      }
		    }
	else{
		
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
					"reptype" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "sup0900details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				
					//alert("refePYM100"+dtlFIM0100);
					
					  $("#test tr").remove();
					 
					 
					var b=JSON.parse(res.dtlSUP0900);
					 console.log(b);
				
				
					 var cnt1=1;
					
						 	if(f=="onload"){
						 		
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 			 $("#supdets").append("<tr><td id='tyeve_row"+srno+"'>"+b[i].tyeve+"</td><td id='inco_row"+srno+"'>"+b[i].inco+"</td><td id='cfl_row"+srno+"' class='sumder' >"+b[i].cfl+"</td><td id='cfi_row"+srno+"' class='sumder' >"+b[i].cfi+"</td><td id='cfl1_row"+srno+"' class='sumder' >"+b[i].cfl1+"</td><td id='cfi1_row"+srno+"' class='sumder' >"+b[i].cfi1+"</td><td id='cfl2_row"+srno+"' class='sumder' >"+b[i].cfl2+"</td><td id='cfi2_row"+srno+"' class='sumder' >"+b[i].cfi2+"</td><td id='cfl3_row"+srno+"' class='sumder' >"+b[i].cfl3+"</td><td id='cfi3_row"+srno+"' class='sumder' >"+b[i].cfi3+"</td><td id='cfl4_row"+srno+"' class='sumder' >"+b[i].cfl4+"</td><td id='cfi4_row"+srno+"' class='sumder' >"+b[i].cfi4+"</td><td id='cfl5_row"+srno+"' class='sumder' >"+b[i].cfl5+"</td><td id='cfi5_row"+srno+"' class='sumder' >"+b[i].cfi5+"</td><td id='cfl6_row"+srno+"' class='sumder' >"+b[i].cfl6+"</td><td id='cfi6_row"+srno+"' class='sumder' >"+b[i].cfi6+"</td><td id='cfl7_row"+srno+"' class='sumder' >"+b[i].cfl7+"</td><td id='cfi7_row"+srno+"' class='sumder' >"+b[i].cfi7+"</td><td id='redat_row"+srno+"'>"+b[i].redat+"</td><td style='text-align:center'><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;text-align:center' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; text-align:center;display:none;' onclick=save_row('"+srno+"')></td></tr>") ;  
							 		  
							 		 
										
									 srno++;
									 
								 
									} $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		
						 		$(".summ").addClass("clr");
						 		$(".add").hide();//add button hide
						 	
						 		$("#modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
						 	
											 
						 			$("#supdets").append("<tr><td id='tyeve_row"+srno+"'>"+b[i].tyeve+"</td><td id='inco_row"+srno+"'>"+b[i].inco+"</td><td id='cfl_row"+srno+"' class='sumder' >"+b[i].cfl+"</td><td id='cfi_row"+srno+"' class='sumder' >"+b[i].cfi+"</td><td id='cfl1_row"+srno+"' class='sumder' >"+b[i].cfl1+"</td><td id='cfi1_row"+srno+"' class='sumder' >"+b[i].cfi1+"</td><td id='cfl2_row"+srno+"' class='sumder' >"+b[i].cfl2+"</td><td id='cfi2_row"+srno+"' class='sumder' >"+b[i].cfi2+"</td><td id='cfl3_row"+srno+"' class='sumder' >"+b[i].cfl3+"</td><td id='cfi3_row"+srno+"' class='sumder' >"+b[i].cfi3+"</td><td id='cfl4_row"+srno+"' class='sumder' >"+b[i].cfl4+"</td><td id='cfi4_row"+srno+"' class='sumder' >"+b[i].cfi4+"</td><td id='cfl5_row"+srno+"' class='sumder' >"+b[i].cfl5+"</td><td id='cfi5_row"+srno+"' class='sumder' >"+b[i].cfi5+"</td><td id='cfl6_row"+srno+"' class='sumder' >"+b[i].cfl6+"</td><td id='cfi6_row"+srno+"' class='sumder' >"+b[i].cfi6+"</td><td id='cfl7_row"+srno+"' class='sumder' >"+b[i].cfl7+"</td><td id='cfi7_row"+srno+"' class='sumder' >"+b[i].cfi7+"</td><td id='redat_row"+srno+"'>"+b[i].redat+"</td></tr>") ;  
							 		  
							 		 
									
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
		//For summary
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
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							};  
								
							$.ajax({
								url : "SUP0900sec1",
								data : pymd,
								dataType : 'json',
								type : 'POST',
								async : false,
								success : function(res) {	
								
									
									  $("#sec1 tr").remove();
									 
									
									var b=JSON.parse(res.sumSUP0900);
									 console.log(b);
									
									 var k=1;
										
										 
										 		for(var i=0;i<b.length;i++){
										 			
										 		  $("#sec1").append("<tr><td id='typev"+srno+"'class='sumder'>"+b[i].typev+"</td><td id='srno"+srno+"'>"+b[i].srno+"</td><td id='amlos"+srno+"' class='sumder'>"+b[i].amlos+"</td><td id='inins"+srno+"' class='sumder'>"+b[i].inins+"</td><td id='amlos1"+srno+"' class='sumder'>"+b[i].amlos1+"</td><td id='inins1"+srno+"' class='sumder'>"+b[i].inins1+"</td><td id='amlos2"+srno+"' class='sumder'>"+b[i].amlos2+"</td><td id='inins2"+srno+"' class='sumder'>"+b[i].inins2+"</td><td id='amlos3"+srno+"' class='sumder'>"+b[i].amlos3+"</td><td id='inins3"+srno+"' class='sumder'>"+b[i].inins3+"</td><td id='amlos4"+srno+"' class='sumder'>"+b[i].amlos4+"</td><td id='inins4"+srno+"' class='sumder'>"+b[i].inins4+"</td><td id='amlos5"+srno+"' class='sumder'>"+b[i].amlos5+"</td><td id='inins5"+srno+"' class='sumder'>"+b[i].inins5+"</td><td id='amlos6"+srno+"' class='sumder'>"+b[i].amlos6+"</td><td id='inins6"+srno+"' class='sumder'>"+b[i].inins6+"</td><td id='amlos7"+srno+"' class='sumder'>"+b[i].amlos7+"</td><td id='inins7"+srno+"' class='sumder'>"+b[i].inins7+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads(0) id='edit"+srno+"'></td></tr>");  
										 		  
										 		 
												
												 srno++;
												 
												
													}
									
										}
										

							});   	
							
							
							

						 	
						 
	 }
	 }

</SCRIPT>
<SCRIPT>

function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_SUP0900_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>
<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="SUP0900Form"
		enctype="multipart/form-data">
             	
            
            
            <div class="tab-content" >
	 	<div class="activetab2 SUP0900" id="" style="width: 1415px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" id="equinvesh"><b><%=reptype%>-Internal Loss Data<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"><b id="sub" style="display: none"></b></b></div> 
		<ul class="nav nav-tabs navright" id="mytab" style="    width: 100%;">

				



				</ul>	<table class="" id="tab2" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align:right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select>&nbsp;&nbsp;&nbsp;</td></tr>
          		  </table>
           	
            <table class="table tb1" id="tb1" style="width:100%;display:none;margin-top:-20px;">
            
            
              <tr>
               <th  rowspan="2" id="typev" style="text-align:center">Type of event</th>
           <th rowspan="2"  id="srno" style="text-align:center">Sr.No.</th>
          	<th colspan="2" style="text-align:center;"> Corporate finance</th>
          	<th colspan="2" style="text-align:center;" >Trading and sales</th>
          	<th colspan="2" style="text-align:center;" >Retail banking</th>
          	<th colspan="2" style="text-align:center;" >Commercial banking	</th>
            <th colspan="2" style="text-align:center;" >Payment and Settlement	</th>
          	<th colspan="2" style="text-align:center;" >Agency services</th>
          	<th colspan="2" style="text-align:center;" >Asset Managemen</th>
         	<th colspan="2" style="text-align:center;" >Retail brokerage</th>
          	
          	
          	
          	</tr>
            
            
            
       <tr> 
          <th  id="amlos" style="text-align:center">Amount of Loss (Before Accounting for Income Derived from Insurance)</th>
          <th id="inins"  idstyle="text-align:center">Income Derived from Insurance</th>
          <th  id="amlos1" style="text-align:center">Amount of Loss (Before Accounting for Income Derived from Insurance)</th>
          <th  id="inins1" style="text-align:center">Income Derived from Insurance</th>
          <th  id="amlos2" style="text-align:center">Amount of Loss (Before Accounting for Income Derived from Insurance)</th>
          <th  id="inins2" style="text-align:center">Income Derived from Insurance</th>
          <th  id="amlos3" style="text-align:center">Amount of Loss (Before Accounting for Income Derived from Insurance)</th>
          <th  id="inins3" style="text-align:center">Income Derived from Insurance</th>
          <th  id="amlos4" style="text-align:center">Amount of Loss (Before Accounting for Income Derived from Insurance)</th>
          <th  id="inins4" style="text-align:center">Income Derived from Insurance</th>
          <th  id="amlos5" style="text-align:center">Amount of Loss (Before Accounting for Income Derived from Insurance)</th>
          <th  id="inins5" style="text-align:center">Income Derived from Insurance</th>
          <th  id="amlos6" style="text-align:center">Amount of Loss (Before Accounting for Income Derived from Insurance)</th>
          <th  id="inins6" style="text-align:center">Income Derived from Insurance</th>
          <th  id="amlos7" style="text-align:center">Amount of Loss (Before Accounting for Income Derived from Insurance)</th>
          <th  id="inins7" style="text-align:center">Income Derived from Insurance</th>
          
            <th  style="text-align:center">Select</th>
         
          </tr>

     <tbody class="databody" id="sec1"></tbody>
          </table>
          
          
          
          
            <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
<!--       <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button>
 -->    
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                  <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                
<!--        <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button>
 -->      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div>
          
            </div>
           
          
          
          <!-- DETAIL TABLE -->
          
          <input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			 <div class="activetab1" id="tab1" style="width: 3670px;padding-top: 1px;margin-top: -17px;display:none" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b><%=reptype %>-Internal Loss Data		
<b id="sub"
					Style="display: none"></b></b></font>
			<br><br><b style="font-size: 13px;"> <b id="sub" style="display: none"></b></b></div> 
			<div id="divLoading"> 
    </div>
  
				
           <table class=""style="width: 3670px;height:50px; 
           ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 530px;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a>
                    <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a>&nbsp;&nbsp;&nbsp;</td></tr>
          		  </table>
 
					 <div class="panel panel-primary filterable">
					 
					   <table class="table tb1" id="tb1" style="width:100%;display:none;margin-top:-20px;"><tr>			
         	 
<tr class="filters">
					 
						
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" id="tyeve"  onkeyup="myFunction(this.id,0)" class="form-control2" placeholder="Type Of Event" disabled></th>						
						<th style="width: 100px;text-align:center;"><input type="text"  style="width: 100px;text-align:center;" class="form-control2" id="inco" onkeyup="myFunction(this.id,1)" placeholder="Instance Code" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="cfl" onkeyup="myFunction(this.id,2)" placeholder="Corporate finance Loss" disabled></th>
						<th style="width: 100px;text-align:center;" ><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="cfi" onkeyup="myFunction(this.id,3)" placeholder="Corporate finance Insurance" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="cfl1" onkeyup="myFunction(this.id,4)" placeholder="Trading and sales Loss" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="cfi1" onkeyup="myFunction(this.id,5)" placeholder="Trading and sales Insurance" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="cfl2" onkeyup="myFunction(this.id,6)" placeholder="Retail banking Loss" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="cfi2" onkeyup="myFunction(this.id,7)" placeholder="Retail banking Insurance" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="cfl3" onkeyup="myFunction(this.id,8)" placeholder="Commercial banking	Loss" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="cfi3" onkeyup="myFunction(this.id,9)" placeholder="Commercial banking Insurance" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="cfl4" onkeyup="myFunction(this.id,10)" placeholder="Payment and Settlement	 Loss" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="cfi4" onkeyup="myFunction(this.id,11)" placeholder="Payment and Settlement Insurance" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="cfl5" onkeyup="myFunction(this.id,12)" placeholder="Agency services Loss" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="cfi5" onkeyup="myFunction(this.id,13)" placeholder="Agency services Insurance" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="cfl6" onkeyup="myFunction(this.id,14)" placeholder="Asset Management Loss" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="cfi6" onkeyup="myFunction(this.id,15)" placeholder="Asset Management Insurance" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="cfl7" onkeyup="myFunction(this.id,16)" placeholder="Retail brokerage Loss" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="cfi7" onkeyup="myFunction(this.id,17)" placeholder="Retail brokerage Insurance" disabled></th>
				        <th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="redat" onkeyup="myFunction(this.id,18)" placeholder="Report Date" disabled></th>
						
						<th style="width: 50px;text-align:center;" id="modify">Modify</th>
						
					</tr>
					
				
					<tbody class="databody" id="supdets">  </tbody>

              
				</table>
			
				
				</div>
               <!-- <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
      <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button>
      <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                
       <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button>
      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div> -->
          
            </div>
   
        
				
			
				</div>
			<!--   </div>	
		 -->		
				
            </div>
            

   
     </form>
    
    
</div>





</body>
</html>