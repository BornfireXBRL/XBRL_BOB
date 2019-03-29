<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="bean.XBRLFIM0100Bean,dao.XBRLFIM0100Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>


<%@ page
	import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat"%>





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

.clr {
	color: #0c0b0b;
	background-color: #f5f5f5;
	border-color: #f5f5f5;
}

.databody td {
	border: 1px solid #ddd;
}
/* 
tr:hover td{
    background: #bebfb0 !important;
}

 */
 
  .hidden {
  display: none;
}

.ui-dialog-titlebar-close {
    visibility: hidden;
}
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
</style>



<script>
$(document).ready(function(){


	var det={
		"repdate":'<%=dt2%>',"type":"chckmodified"
	};
	$.ajax({
		url:"FIM0200chckmodified",
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
				        	location.href = "XBRL_CRT_FIM0200_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
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
		 $('#instiidd,#tranidd,#instinamed,#insticoded,#purcrncyd,#puramtd,#salecrncyd,#saleamtd,#rated,#valuedated').css({
				'text-align':'center',
				'height':'44px',
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
			
			 $('#instiidd,#tranidd,#instinamed,#insticoded,#purcrncyd,#puramtd,#salecrncyd,#saleamtd,#rated,#valuedated').css({
					'text-align':'center',
					'height':'44px',
					'white-space':'pre-wrap',
					'scroll':'none',
					'word-wrap':'break-word',
					'resize':'none',
					'background-color': '#f5f5f5',
					'border':'none',
					'-webkit-text-fill-color': '#333333'
					}); 
			
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
	if(b==5 || b==7 ||  b==8 || b==9){
		
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
function myFunction1(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();

   table = document.getElementById("modify2");

  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==3 ||b==4){
		
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
	 btn=a;
	 $("#btnXML").hide();
	
if(a==1){
	$("#btnSave").hide();
	$("#btnpre").prop("disabled",true);
	 $("#btnnext").prop("disabled",false);
	 $("#li1").addClass("active");
	 $("#li2").removeClass("active");
	 
	/*  document.getElementById("tab2").style.width = "742px"; */
}else if(a==2){
	$("#btnSave").show();
	$("#btnXML").show();
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li2").addClass("active");
	 $("#li1").removeClass("active");
	/*  document.getElementById("tab2").style.width = "968px"; */
}
}
</script>

<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	
	$("#sumfirst").on("click",function(){
	
		location.href = "XBRL_REP_FIM0200_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
 	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>'); 
 
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_FIM0200_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( ".btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '.btnback').click(function() {
		 location.href="XBRL_CRT_FIM0200_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	$('#btnExcel').click(function() {
		if($("#modflg").val()=="N"){
		 FIM0200Form.action = "FIM0200EXCELREPORT.action?method=FIM0200EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 FIM0200Form.submit();
		}else{
			alert("Some Records are Modified");
		}
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 FIM0200Form.action = "FIM0200EXCELSum.action?method=FIM0200EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 FIM0200Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 FIM0200Form.action = "FIM0200PDFREPORT.action?method=FIM0200PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 FIM0200Form.submit();
		}
	});
	$('#btnXML').click(function() {
		
		  FIM0200Form.action = "XMLDOWNLOADfim200.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 FIM0200Form.submit(); 
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
					url:"saveSumf2",
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
								url:"saveSumf2",
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
	$("#test").prepend("<tr id='dcgadd"+rowno+"'><td><textarea type='text' placeholder='Auto Generated' style='-webkit-text-fill-color: black;width: 56px;word-wrap:break-word;border:1px solid;' disabled></textarea></td><td><textarea type='text' placeholder='Auto Generated' style='width: 56px;word-wrap:break-word;border-color:#a9a9a9;border:1px solid' disabled></textarea></td><td id='instinamed_row"+rowno+"'><input type='text' id='instinamed_text"+rowno+"' style='     width: 179px;'></td><td id='insticoded_row"+rowno+"'><input type='text' 	id='insticoded_text"+rowno+"' style='    width: 55px;'></td><td id='purcrncyd_row"+rowno+"'><input type='text' id='purcrncyd_text"+rowno+"' style='    width:59px;'></td><td class='sumder alnum' id='puramtd_row"+rowno+"'><input type='text' id='puramtd_text"+rowno+"' class='decimalPt roundUp' style='    width: 90px;'></td><td id='salecrncyd_row"+rowno+"'><input type='text' id='salecrncyd_text"+rowno+"' style='    width: 59px;'></td><td class='sumder alnum' id='saleamtd_row"+rowno+"'><input type='text' id='saleamtd_text"+rowno+"' class='decimalPt roundUp' style='    width: 90px;'></td><td class='sumder alnum' id='rated_row"+rowno+"'><input type='text' id='rated_text"+rowno+"' class='decimalPt roundUp' style='    width: 50px;'></td><td id='valuedated_row"+rowno+"'><input type='text' id='valuedated_text"+rowno+"' style='    width:67px;'></td><td style='text-align:center;'><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");
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
	$("#valuedated_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
	});
	
}
function edit_row(no)
{
//alert("happyyyyyyyyyyyyy");
//alert("hiii 2d AGccccccccc" +  edit_row(no));

$(".add").attr("disabled",true);
$("#del_button"+no).addClass('hidden');
$("#addrowno").val("0");
modtyp="M";


	document.getElementById("edit_button"+no).style.display="none";
	  document.getElementById("save_button"+no).style.display="inline-block";
	  document.getElementById("Cancel_btn"+no).style.display="inline-block";
	 	document.getElementById("Cancel_button"+no).style.display="none";

	  var	puramtd =  document.getElementById("puramtd_row"+no);

	  var	puramtd_data = puramtd.innerHTML;

	 

var	saleamtd =  document.getElementById("saleamtd_row"+no);

var	saleamtd_data = saleamtd.innerHTML;




puramtd.innerHTML="<input type='text' class='decimalPt roundUp'  id='puramtd_text"+no+"'  style='width: 83px'; value='"+puramtd_data+"'>";


saleamtd.innerHTML="<input type='text' class='decimalPt roundUp'  id='saleamtd_text"+no+"'  style='width: 83px'; value='"+saleamtd_data+"'>";




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
		
		
		if(document.getElementById("puramtd_text"+no).value==""){
			alert("Enter Purchased Amount ..");
			error="Y"
		}else if(document.getElementById("saleamtd_text"+no).value==""){
			alert("Enter Sale Amount ..");
			error="Y"
		
		}
		
	} else if (modtyp=="A") {
		
		
		

		if(document.getElementById("instinamed_text"+no).value==""){
			alert("Enter Name of Institution ..");
			error="Y"
		}else if(document.getElementById("insticoded_text"+no).value==""){
			alert("Enter Institution code ..");	
			error="Y"
		}else if(document.getElementById("purcrncyd_text"+no).value==""){
			alert("Enter Purchased Currency  ..");
			error="Y"
		}else if(document.getElementById("salecrncyd_text"+no).value==""){
			alert("Enter Sale Currency ..");	
			error="Y"
		}else if(document.getElementById("rated_text"+no).value==""){
			alert("Enter Rate ..");
			error="Y"
		}else if(document.getElementById("valuedated_text"+no).value==""){
			alert("Enter Value date ..");
			error="Y"
		}
	}
	
	
	
	if (error=="N"){
		$("#modflg").val("Y");
		modtyp="M";
$(".add").attr("disabled",false);
document.getElementById("edit_button"+no).checked = false;

  var puramtd_val=document.getElementById("puramtd_text"+no).value;
document.getElementById("puramtd_row"+no).innerHTML=puramtd_val;



var saleamtd_val=document.getElementById("saleamtd_text"+no).value;
document.getElementById("saleamtd_row"+no).innerHTML=saleamtd_val;


if($("#addrowno").val()=="1"){
	
	modtyp="A";
   
  var instinamed_val=document.getElementById("instinamed_text"+no).value;
   document.getElementById("instinamed_row"+no).innerHTML=instinamed_val;

   var insticoded_val=document.getElementById("insticoded_text"+no).value;
	document.getElementById("insticoded_row"+no).innerHTML=insticoded_val;
	 
  
  var purcrncyd_val=document.getElementById("purcrncyd_text"+no).value;	
  document.getElementById("purcrncyd_row"+no).innerHTML=purcrncyd_val;
 
 
  var salecrncyd_val=document.getElementById("salecrncyd_text"+no).value;
	document.getElementById("salecrncyd_row"+no).innerHTML=salecrncyd_val;
	
 
 var rated_val=document.getElementById("rated_text"+no).value;	
 document.getElementById("rated_row"+no).innerHTML=rated_val;

 var valuedated_val=document.getElementById("valuedated_text"+no).value;	
 document.getElementById("valuedated_row"+no).innerHTML=valuedated_val;


}else{
	document.getElementById("Cancel_button"+no).style.display="inline-block";
	document.getElementById("Cancel_btn"+no).style.display="none";
}


document.getElementById("edit_button"+no).style.display="inline-block";
document.getElementById("save_button"+no).style.display="none";

/*  var instiidd=document.getElementById("instiidd_row"+no).innerHTML;	 
   var tranidd=document.getElementById("tranidd_row"+no).innerHTML; */
  var instinamed=document.getElementById("instinamed_row"+no).innerHTML;
  var insticoded=document.getElementById("insticoded_row"+no).innerHTML;	
  var purcrncyd=document.getElementById("purcrncyd_row"+no).innerHTML;	 
  var puramtd=document.getElementById("puramtd_row"+no).innerHTML;
 var salecrncyd=document.getElementById("salecrncyd_row"+no).innerHTML;
 var saleamtd=document.getElementById("saleamtd_row"+no).innerHTML;
 var rated=document.getElementById("rated_row"+no).innerHTML;
 var valuedated=document.getElementById("valuedated_row"+no).innerHTML;	
 $("#dcgadd"+no).addClass("rowaddedd");
 $("#det1 td").attr("padding","8px");

var refefim200=document.getElementById("refDisplay").value;
saleamtd=saleamtd.replace(/\,/g,'')
  saleamtd=Number(saleamtd)
  
  puramtd=puramtd.replace(/\,/g,'')
  puramtd=Number(puramtd)
  var rptdate1 = {
    "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refefim200, "instinamed" : instinamed, "insticoded":insticoded, "purcrncyd":purcrncyd,"puramtd":puramtd,"salecrncyd" : salecrncyd,"saleamtd":saleamtd, "rated":rated,"valuedated":valuedated,"modtyp":modtyp

}; 

$.ajax({
url : "FIM0200",
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
			        	
			        	
			        	 var instinamed=document.getElementById("instinamed_row"+no).innerHTML;
			        	  var insticoded=document.getElementById("insticoded_row"+no).innerHTML;	
			        	  var purcrncyd=document.getElementById("purcrncyd_row"+no).innerHTML;	 
			        	  var puramtd=document.getElementById("puramtd_row"+no).innerHTML;
			        	 var salecrncyd=document.getElementById("salecrncyd_row"+no).innerHTML;
			        	 var saleamtd=document.getElementById("saleamtd_row"+no).innerHTML;
			        	 var rated=document.getElementById("rated_row"+no).innerHTML;
			        	 var valuedated=document.getElementById("valuedated_row"+no).innerHTML;	
			        	 var refefim200=document.getElementById("refDisplay").value;
			        	 saleamtd=saleamtd.replace(/\,/g,'')
			        	  saleamtd=Number(saleamtd)
			        	  
			        	  puramtd=puramtd.replace(/\,/g,'')
			        	  puramtd=Number(puramtd)
			        	 var rptdate1 = {
			        			    "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refefim200, "instinamed" : instinamed, "insticoded":insticoded, "purcrncyd":purcrncyd,"puramtd":puramtd,"salecrncyd" : salecrncyd,"saleamtd":saleamtd, "rated":rated,"valuedated":valuedated,"modtyp":modtyp

			        			}; 

			        			$.ajax({
			        			url : "FIM0200",
			        			data : rptdate1  ,
			        			dataType : 'json', 
			        			type : 'POST',
			        			async : true,
			        			 success : function(res) {
			        				 console.log(res.refno);

			        				 $(".repdisp").val(res.refno);
				   
					  
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
		
		 
		var detcancel={
					"instinamed":$("#instinamed_row"+no).text(),"date":'<%=dt2%>'
			};
			
			 $.ajax({
			     url : "FIM0200cancel",
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
				
		 var puramtd_val=document.getElementById("puramtd_text"+no).value;
		 document.getElementById("puramtd_row"+no).innerHTML=puramtd_val;



		 var saleamtd_val=document.getElementById("saleamtd_text"+no).value;
		 document.getElementById("saleamtd_row"+no).innerHTML=saleamtd_val;

				$("#edit_button"+no).show();
				/* document.getElementById("edit_button"+no).style.display="block"; */
				document.getElementById("save_button"+no).style.display="none";
				document.getElementById("Cancel_btn"+no).style.display="none";
			 	
				var puramtd=document.getElementById("puramtd_row"+no).innerHTML;
				 var saleamtd=document.getElementById("saleamtd_row"+no).innerHTML;
				  if($("#dcgadd"+no).hasClass( "rowaddedd" )){
					  
					  document.getElementById("Cancel_button"+no).style.display="inline-block";


				  }else{
					  document.getElementById("Cancel_button"+no).style.display="none";
				  }
				  
				 /*  location.reload(true); */
		 }
 function Canadd_row(no){
		 
		  /* document.getElementById("del_button"+no).style.display="inline-block"; */

																				   

		 if($("#dcgadd"+no).hasClass( "rowaddedd" )){
			var detcancel={
					"instinamed":$("#instinamed_row"+no).text(),"date":'<%=dt2%>'
			};
			
			 $.ajax({
			     url : "FIM0200cancel",
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
	
	var save=0;
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
		
		 $(".repdisp").val(refno);
		 var srno=1;
		$(".activetab1").show();
		$(".activetab2").hide();
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "fim200details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#test tr").remove();
					 
					
					var b=JSON.parse(res.detailFIM0200);
					 console.log(b);
					
						 	if(f=="onload"){
						 		
						 		$("#modify").show();
						 		var cnt1=1;
						 		for(var i=0;i<b.length;i++){
						 		
						 			$("#test").append('<tr id="dcgadd'+cnt1+'"><td id="instiidd_row'+cnt1+'" >'+b[i].instiidd+'</td><td id="tranidd_row'+cnt1+'" >'+b[i].tranidd+'</td><td id="instinamed_row'+cnt1+'" >'+b[i].instinamed+'</td><td id="insticoded_row'+cnt1+'" >'+b[i].insticoded+'</td><td id="purcrncyd_row'+cnt1+'" >'+b[i].purcrncyd+'</td><td  class="sumder alnum" id="puramtd_row'+cnt1+'" >'+b[i].puramtd+'</td><td id="salecrncyd_row'+cnt1+'" >'+b[i].salecrncyd+'</td><td class="sumder alnum" id="saleamtd_row'+cnt1+'" >'+b[i].saleamtd+'</td><td class="sumder alnum" id="rated_row'+cnt1+'" >'+b[i].rated+'</td><td id="valuedated_row'+cnt1+'" >'+b[i].valuedated+'</td><td style="text-align:center;"><input type="button" id="edit_button'+srno+'" value="Edit" class="btn btn-xs btn-primary edit" style="width: 37px;" onclick=edit_row("'+cnt1+'")>  <input type="button" id="save_button'+srno+'" value="Save" class="btn btn-xs btn-primary save" style="width: 37px; display:none;" onclick=save_row("'+cnt1+'")>&nbsp;<input type="button" id="Cancel_button'+srno+'" value="Cancel" class="btn btn-xs btn-primary Cancel" style="width: 44px; display:none; " onclick=Cancel_row("'+cnt1+'")><input type="button" id="Cancel_btn'+srno+'" value="Cancel" class="btn btn-xs btn-primary Cancel1" style="width: 44px; display:none; " onclick=Canedit_row("'+cnt1+'")><input type="button" id="del_button'+srno+'" value="Delete" class="btn btn-xs btn-primary delete" style="width: 39px;" onclick=savedel_row("'+cnt1+'")></td><tr>');	

						 		 cnt1++; 
								 srno++;
								 
								 
								 
									} $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".tb1").show();

						 		$(".add").hide();//add button hide
						 	
						 		$("#modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
						 	
											 
						 			$("#test").append('<tr><td id="instiidd_row'+cnt1+'" >'+b[i].instiidd+'</td><td id="tranidd_row'+cnt1+'" >'+b[i].tranidd+'</td><td id="instinamed_row'+cnt1+'" >'+b[i].instinamed+'</td><td id="insticoded_row'+cnt1+'" >'+b[i].insticoded+'</td><td id="purcrncyd_row'+cnt1+'" >'+b[i].purcrncyd+'</td><td  class="sumder alnum" id="puramtd_row'+cnt1+'" >'+b[i].puramtd+'</td><td id="salecrncyd_row'+cnt1+'" >'+b[i].salecrncyd+'</td><td class="sumder alnum" id="saleamtd_row'+cnt1+'" >'+b[i].saleamtd+'</td><td class="sumder alnum" id="rated_row'+cnt1+'" >'+b[i].rated+'</td><td id="valuedated_row'+cnt1+'" >'+b[i].valuedated+'</td><tr>');	

						 			
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
				
				 $(".repdisp").val(refno);
				 
						
						$("#test tr").children().detach().remove();
						
						var rptdate1 = {
								  "dt1" : d,"dt2":e,"reportrefnos":refno,"curr":g
								}; 
						 
						 $.ajax({
						     url : "FIM0200SUM1",
						     data : rptdate1  ,
								dataType : 'json', 
								type : 'POST',
								async : true,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							console.log(res.summaryFIM0200);
						
							var b=JSON.parse(res.summaryFIM0200);
						
							var k=1;
							var cnt1=1;
							
							
							for (var i = 0; i < b.length; i++) {
							
								
							
								$("#sec1").append('<tr><td id="ite'+cnt1+'" >'+b[i].instslno+'</td><td id="ite'+cnt1+'" >'+b[i].instnam+'</td><td id="ite'+cnt1+'" >'+b[i].instcd+'</td><td style="text-align: center;"><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td><tr>');	
								
					
								cnt1++;
								srno++;
							} 
							
							  $("#divLoading").removeClass('show'); 
							 $('.alnum').mask("#,##0.00", {reverse: true});
							
								 }
								 });	
						 var rptdate1 = {
								  "dt1" : d,"dt2":e,"reportrefnos":refno,"curr":g
								}; 
						 
						 $.ajax({
						     url : "FIM0200SUM2",
						     data : rptdate1  ,
								dataType : 'json', 
								type : 'POST',
								async : true,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							console.log(res.sumFIM0200);
						
							var b=JSON.parse(res.sumFIM0200);
							
							var k=1;
							var cnt1=1;
							
							
							for (var i = 0; i < b.length; i++) {
							
								
							
								$("#sec2").append('<tr><td id="ite'+cnt1+'" >'+b[i].instiid+'</td><td id="ite'+cnt1+'" >'+b[i].tranid+'</td><td id="ite'+cnt1+'" >'+b[i].instiname+'</td><td id="ite'+cnt1+'" >'+b[i].insticode+'</td><td id="ite'+cnt1+'" >'+b[i].purcrncy+'</td><td class="sumder alnum" id="ite'+cnt1+'" >'+b[i].puramt+'</td><td id="ite'+cnt1+'" >'+b[i].salecrncy+'</td><td class="sumder alnum" id="ite'+cnt1+'" >'+b[i].saleamt+'</td><td class="sumder alnum" id="ite'+cnt1+'" >'+b[i].rate+'</td><td id="ite'+cnt1+'" >'+b[i].valuedate+'</td><td style="text-align: center;"><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td><tr>');	
								
					
								cnt1++;
								srno++;
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
			url:"savecheckFIM2",
		
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

</SCRIPT>
<script>

function fnloads(cnt){
	
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_FIM0200_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>'+"&cnt="+cnt;
	
}
</script>
<body>


	<div class="container">

		<div class="loader"></div>

		<form class="form-horizontal" method="post" name="FIM0200Form"
			enctype="multipart/form-data">
<input type="hidden" id="savecheck">
 <input type="hidden" id="modflg" >
   <input type="hidden" id="modtyp" >

			<div class="tab-content">
				<div class="activetab2 FIM0200" id="tab2"
					style="width: 968px; padding-top: 1px; margin-top: -17px;">
					<div style="text-align: left; margin-top: 40px;">
						<font size="2" style="font-size: 13px;" id="equinvesh"><b><%=reptype %>-Statement of Interbank Foreign Exchange Market<b id="sub" Style="display: none"></b></b></font> <br>
						<b style="font-size: 13px;"> <b id="sub" style="display: none"></b></b>
					</div>
					<ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">

						<li class=" pull-right list" id="li2" onclick="functionli(2);"><a
							href="#tab2" data-toggle="tab"><span class="headingtab">2</span></a></li>


						<li class=" pull-right active list" id="li1"
							onclick="functionli(1);"><a href="#tab1" data-toggle="tab"><span
								class="headingtab"> 1 </span></a></li>




					</ul>
					<table class="" id="" style="width: 100%; height: 50px;">
						<tr>
							<td style="background-color: #bbc3cb;"><!-- <font size="1"><b
									style="color: #0c1190; font-size: 11px;"> Report Ref No : </b></font> -->
								 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></font></td>
							<td
								style="text-align: center; background-color: #bbc3cb; width: 325px;"></td>
							<td style="background-color: #bbc3cb; text-align: right;"><a
								class="btn btn-xs btn-primary det" href="#tab1" id="det"
								data-toggle="tab"><span class="headingtab"> Details
								</span></a> <a class="btn btn-xs btn-primary summ" href="#tab2"
								data-toggle="tab"><span class="headingtab ">Summary
								</span></a> <a id="btndwnld"><i
									class="glyphicon glyphicon-download-alt"
									style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><select
								id="dnloadfrmt" style="border-radius: 4px; margin-left: 10px;"><option
										value="pdf">pdf</option>
									<option value="excel">Excel</option></select>&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table>

					<table class="table tb1" id="tb1"
						style="width: 100%; display: none; margin-top: -20px;">
						<tr>
							<th style="text-align: center;" id="instslno">Institution
								Serial Number</th>
							<th style="text-align: center;" id="instnam">Name of
								Institution</th>
							<th style="text-align: center;" id="instcd">Institution Code</th>

							<th rowspan="2" style="text-align: center">Select</th>
						</tr>
						<tr>
							<th style="text-align: center;">A</th>
							<th style="text-align: center;">B</th>
							<th style="text-align: center;">C</th>

						</tr>
						<tbody id="sec1" class="databody"></tbody>
					</table>

					<table class="table tb2" id="tb2"
						style="width: 100%; display: none; margin-top: -20px;">


						<tr>
							<th rowspan="5" style="text-align: center; width: 48px;"
								id="instiid">Institution Serial Number</th>
							<th rowspan="5" style="text-align: center; width: 48px;"
								id="tranid">Transaction Serial Number</th>

							<th rowspan="5" style="text-align: center; width: 725px;"
								id="instiname">Name of Institution</th>
							<th rowspan="5" style="text-align: center; width: 80px;"
								id="insticode">Institution Code</th>



						</tr>




						<tr>


							<th colspan="2" style="width: 150px; text-align: center;">Amount
								Purchased</th>


							<th colspan="2" style="width: 150px; text-align: center;">Amount
								Sold</th>


							<th rowspan="2" style="width: 50px; text-align: center;"
								id="rate">Rate</th>

							<th rowspan="2" style="width: 100px; text-align: center;"
								id="valuedate">Value date</th>


							<th rowspan="5" style="text-align: center">Select</th>

						</tr>



						<tr>



							<th style="width: 45px; text-align: center;" id="purcrncy">Currency


							</th>


							<th style="width: 90px; text-align: center;" id="puramt">Amount


							</th>

							<th style="width: 45px; text-align: center;" id="salecrncy">Currency

							</th>
							<th style="width: 90px; text-align: center;" id="saleamt">Amount

							</th>




						</tr>


						<tr>


							<th style="width: 150px; text-align: center;">C</th>


							<th style="width: 150px; text-align: center;">D</th>

							<th style="width: 150px; text-align: center;">E</th>
							<th style="width: 150px; text-align: center;">F</th>


							<th style="width: 150px; text-align: center;">G</th>


							<th style="width: 150px; text-align: center;">H</th>

						</tr>




						<tbody class="databody" id="sec2">




						</tbody>
					</table>




					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-primary btnhome"  id="btnhome">Home</button>
						<!--       <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button>
 -->
						<button type="button" class="btn btn-xs btn-primary" value="Excel"
							style="display: none" id="btnSave">Save</button>

						<button type="button" class="btn btn-xs btn-primary"
							style="display: none" value="Excel" id="btnXML">Gen XML
							Sum</button>

						<!--        <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button>
 -->
						<button type="button" class="btn btn-xs btn-primary btnback" value="back"
							id="btnback">Back</button>
					</div>

				</div>



				<!-- DETAIL TABLE -->

				<input type="hidden" id="rowno"> <input type="hidden"
					id="addrowno">
				<div class="activetab1" id="tab1"
					style="width:1100px; padding-top: 1px; margin-top: -17px; display: none">
					<div style="text-align: left; margin-top: 40px;">
						<font size="2" style="font-size: 13px;"><b><%=reptype%>-Statement of Interbank Foreign Exchange Market<b id="sub" Style="display: none"></b></b></font> <br>
						<br>
						<b style="font-size: 13px;"><b id="sub" style="display: none"></b></b>
					</div>
					<div id="divLoading"></div>


					<table class="" style="width: 100%; height: 50px;">
						<tr>
							<td style="background-color: #bbc3cb; width: 530px;">
								<font size="1"><input type="hidden"
									style="color: #0c1190; font-size: 11px;" class="repdisp"
									id="refDisplay"></b></font></td>
							<td style="text-align: center; background-color: #bbc3cb;"></td>
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
									class="glyphicon glyphicon-filter"></span> Filter</a>&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table>

					<div class="panel panel-primary filterable">

						<table class="table tb1" id="tb1"
							style="width: 100%; display: none; margin-top: -20px;">
							<tr>
							<thead>



								<tr class="filters">
									<th rowspan="5"><textarea type="text" id="instiidd"
											style="text-align: center; width: 58px; font-color: balck;"
											onkeyup="myFunction(this.id,0)" class="form-control2"
											placeholder="Institution Serial Number" disabled></textarea></th>
									<th rowspan="5"><textarea type="text" id="tranidd"
											style="text-align: center; width: 63px;"
											onkeyup="myFunction(this.id,1)" class="form-control2"
											placeholder="Transaction Serial Number" disabled></textarea>
									</th>

									<th rowspan="5"><textarea type="text" id="instinamed"
											style="text-align: center; width: 159px;"
											onkeyup="myFunction(this.id,2)" class="form-control2"
											placeholder="Name of Institution" disabled></textarea></th>
									<th rowspan="5"><textarea type="text" id="insticoded"
											style="text-align: center; width: 55px;"
											onkeyup="myFunction(this.id,3)" class="form-control2"
											placeholder="Institution Code" disabled></textarea></th>



								</tr>




								<tr class="filters">


									<th colspan="2"><input type="text" id="amtpur"
										style="width: 150px; text-align: center;" class="form-control"
										placeholder="Amount Purchased" disabled></th>


									<th colspan="2"><input type="text" id="amtsld"
										style="width: 150px; text-align: center;" class="form-control"
										placeholder="Amount Sold" disabled></th>


									<th rowspan="2"><textarea type="text"
											style="width: 50px; text-align: center;" id="rated"
											onkeyup="myFunction(this.id,8)" class="form-control2"
											placeholder="Rate" disabled></textarea></th>

									<th rowspan="2" style="width: 31px; text-align: center;">
										<textarea type="text" style="width: 40px; text-align: center;"
											id="valuedated" onkeyup="myFunction(this.id,9)"
											class="form-control2" placeholder="Value date" disabled></textarea>
									</th>


									<th rowspan="5" style="text-align: center;width:140px;" id="modify">Modify</th>

								</tr>



								<tr class="filters">



									<th><textarea type="text"
											style="width: 59px; text-align: center;" id="purcrncyd"
											onkeyup="myFunction(this.id,4)" class="form-control2"
											placeholder="Currency" disabled></textarea></th>


									<th><textarea type="text"
											style="width: 90px; text-align: center;" id="puramtd"
											onkeyup="myFunction(this.id,5)" class="form-control2"
											placeholder="Amount" disabled></textarea></th>

									<th><textarea type="text"
											style="width: 59px; text-align: center;" id="salecrncyd"
											onkeyup="myFunction(this.id,6)" class="form-control2"
											placeholder="Currency" disabled></textarea></th>
									<th><textarea type="text"
											style="width: 90px; text-align: center;" id="saleamtd"
											onkeyup="myFunction(this.id,7)" class="form-control2"
											placeholder="Amount" disabled></textarea></th>




								</tr>


								<tr>


									<th style="width: 61px; text-align: center;">C</th>


									<th style="width: 118px; text-align: center;">D</th>

									<th style="width: 61px; text-align: center;">E</th>
									<th style="width: 118px; text-align: center;">F</th>


									<th style="width: 64px; text-align: center;">G</th>


									<th style="width: 150px; text-align: center;">H</th>

								</tr>

							</thead>

							<tbody class="databody" id="test">



							</tbody>
						</table>




					</div>
					  <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
      <!-- <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button> -->
      <!-- <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button> -->
                
       <!-- <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button> -->
      <button type="button" class="btn btn-xs btn-primary btnback" value="back" id="btnback">Back</button></div>
           
				</div>




			</div>
			<!--   </div>	
		 -->
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
</body>
</html>