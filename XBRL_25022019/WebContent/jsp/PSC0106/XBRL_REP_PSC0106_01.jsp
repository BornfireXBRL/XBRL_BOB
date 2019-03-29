<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLPSC0106Bean,dao.XBRLPSC0106Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
    <%@ page import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat"%>
    
    
    
     
    
<%--      <%
    DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Date date = new Date();
	
	String username = session.getAttribute("userName").toString();
    String curdate = dateFormat.format(date);
%> --%>

	 
  <%//String RRID = request.getParameter("RRID");
 
 
 String accno = request.getParameter("accno");
 
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
 
 XBRLPSC0106Dao dmd=new XBRLPSC0106Dao();
 
 DecimalFormat df = new DecimalFormat("##,#0.00");
	   
	 // ArrayList<XBRLCRR0100Bean> list=dmd.xbrlcrr100();
	  
	
		  
		  
		 /*  
		  ArrayList<XBRLPSC0106Bean> list=new ArrayList<XBRLPSC0106Bean>();
		 
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
		  
		ArrayList<XBRLPSC0106Bean> list1=new ArrayList<XBRLPSC0106Bean>();
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
	  
		  
		  ArrayList<XBRLPSC0106Bean> list2=new ArrayList<XBRLPSC0106Bean>();
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
	padding: 3px;
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
			 $('#accno ,#acname,#scode,#stype,#iscode,#sflag,#outamt,#impflg,#accopndat,#rendat,#secflg ,#reflg,#resdat,#sanamt,#acccrcode,#repdat').css({
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
			
			 $('#accno ,#acname,#scode,#stype,#iscode,#sflag,#outamt,#impflg,#accopndat,#rendat,#secflg ,#reflg,#resdat,#sanamt,#acccrcode,#repdat').css({
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

.ui-dialog-titlebar-close {
    visibility: hidden;
}
.hidden {
  display: none;
}
show {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url('../../images/Loader.gif') 30% 30% no-repeat rgb(249,249,249);
    opacity: .8;
}

</style>

<script>
$(document).ready(function(){


$("#btnfilter").on("click",function(){
	if($(".form-control2").prop("disabled")==true){
		$(".form-control2").prop("disabled",false);
		 $('#accno ,#acname,#scode,#stype,#iscode,#sflag,#outamt,#impflg,#accopndat,#rendat,#secflg ,#reflg,#resdat,#sanamt,#acccrcode,#repdat').css({
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
		
		 $('#accno ,#acname,#scode,#stype,#iscode,#sflag,#outamt,#impflg,#accopndat,#rendat,#secflg ,#reflg,#resdat,#sanamt,#acccrcode,#repdat').css({
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
	if(b==0 ||b==6 ||b==8 || b==9 ||b==12 || b==13 || b==15){
		
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
	

		var det={
				"repdate":'<%=dt2%>',"type":"chckmodified"
			};
			$.ajax({
				url:"PSC0106chckmodified",
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
						        	location.href = "XBRL_CRT_PSC0106_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
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
		
		location.href = "XBRL_REP_PSC0106_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
 	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>'); 
 
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_PSC0106_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	 $( '#btnback').click(function() {
		 location.href="XBRL_CRT_PSC0106_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
		
		});
	$('#btnExcel').click(function() {
		
		 PSC0106Form.action = "PSC0106EXCELREPORT.action?method=PSC0106EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 PSC0106Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 PSC0106Form.action = "PSC0106EXCELSum.action?method=PSC0106EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 PSC0106Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 PSC0106Form.action = "PSC0106PDFREPORT.action?method=PSC0106PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 PSC0106Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  PSC0106Form.action = "XMLDOWNLOADp6.action?method=p20xml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 PSC0106Form.submit(); 
	});
	
	
	
   });
   </script>
   <script>
   var modtyp;

   $(document).ready(function(){
	var save=0;

$('#btnSave').on("click",function() {
	
	  var datasum={
				"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").val()

	};
	$.ajax({
		url:"saveSump6",
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
modtyp="A";

$("#addrowno").val("1");
	$("#pymdets").prepend("<tr id='dcgadd"+rowno+"' ><td id='accno_row"+rowno+"'><input type='text' id='accno_text"+rowno+"' style='width: 70px;'></td><td id='acnam_row"+rowno+"'><input type='text'  id='acnam_text"+rowno+"' style='    width:70px;'></td><td id='scode_row"+rowno+"'><input type='text' id='scode_text"+rowno+"' style='     width: 70px;'></td><td id='stype_row"+rowno+"'><input type='text' 	id='stype_text"+rowno+"' style='    width: 70px;'></td><td id='iscode_row"+rowno+"'><input type='text' id='iscode_text"+rowno+"' style='    width: 70px;'></td><td id='sflag_row"+rowno+"'><input type='text' id='sflag_text"+rowno+"' style='    width:70px;'></td><td class='sumder alnum' id='outamt_row"+rowno+"'><input type='text' id='outamt_text"+rowno+"' class='decimalPt roundUp' style='    width:70px;'></td><td id='impflg_row"+rowno+"'><input type='text' id='impflg_text"+rowno+"' style='    width: 70px;'></td><td id='accopndat_row"+rowno+"'><input type='text' id='accopndat_text"+rowno+"' style='    width: 70px;'></td><td  id='rendat_row"+rowno+"'><input type='text' id='rendat_text"+rowno+"'  style='    width:70px;'></td><td id='secflg_row"+rowno+"'><input type='text' id='secflg_text"+rowno+"' style='width:70px;'></td><td id='reflg_row"+rowno+"'><input type='text'  id='reflg_text"+rowno+"' style='    width:700px;'></td><td id='resdat_row"+rowno+"'><input type='text' id='resdat_text"+rowno+"' style='     width: 700px;'></td><td class='sumder alnum' id='sanamt_row"+rowno+"'><input type='text' 	id='sanamt_text"+rowno+"' class='decimalPt roundUp' style='    width:70px;'></td><td id='acccrcode_row"+rowno+"'><input type='text' id='acccrcode_text"+rowno+"' style='    width:70px;'></td><td id='repdat_row"+rowno+"'><input type='text' id='repdat_text"+rowno+"' style='    width:70px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");
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
	$("#accopndat_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
	});
	
	$("#rendat_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
	});
	$("#resdat_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
	});
	
	$("#repdat_text"+a).datepicker({
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

	 	


var	outamt =  document.getElementById("outamt_row"+no);
var	outamt_data = outamt.innerHTML;

var	sanamt =  document.getElementById("sanamt_row"+no);
var	sanamt_data = sanamt.innerHTML;

outamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='outamt_text"+no+"'  style='width: 83px'; value='"+outamt_data+"'>";
sanamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='sanamt_text"+no+"'  style='width: 83px'; value='"+sanamt_data+"'>";




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

			if(document.getElementById("outamt_text"+no).value==""){
				alert("Enter  Amount ..");
				error="Y"
			}else if(document.getElementById("sanamt_text"+no).value==""){
				alert("Enter Sector ..");
				error="Y"
			}
			
		} else if (modtyp=="A") {

			
			
			if(document.getElementById("accno_text"+no).value==""){
				alert("Enter Transaction Type ..");
				error="Y"
			}else if(document.getElementById("acnam_text"+no).value==""){
				alert("Enter Counter party Unique Identifier ..");	
				error="Y"
			}else if(document.getElementById("scode_text"+no).value==""){
				alert("Enter Counter party Name..");	
				error="Y"
			}else if(document.getElementById("stype_text"+no).value==""){
				alert("Enter Sector ..");
				error="Y"
			}else if(document.getElementById("iscode_text"+no).value==""){
				alert("Enter Currency ISO Code..");
				error="Y"
			}else if(document.getElementById("sflag_text"+no).value==""){
				alert("Enter  Amount ..");
				error="Y"
			}else if(document.getElementById("outamt_text"+no).value==""){
				alert("Enter Spot Rate ..");
				error="Y"
			}else if(document.getElementById("impflg_text"+no).value==""){
				alert("Enter Forward Rate...");
				error="Y"
			}else if(document.getElementById("accopndat_text"+no).value==""){
				alert("Enter Interest Rate-Base Currency..");
				error="Y"
			}else if(document.getElementById("secflg_text"+no).value==""){
				alert("Enter Interest Rate-Quoted Currency..");
				error="Y"
			}else if(document.getElementById("reflg_text"+no).value==""){
				alert("Enter Due Date..");
				error="Y"
			}else if(document.getElementById("resdat_text"+no).value==""){
				alert("Enter Currency ISO Code..");
				error="Y"
			}else if(document.getElementById("sanamt_text"+no).value==""){
				alert("Enter  Amount ..");
				error="Y"
			}else if(document.getElementById("acccrcode_text"+no).value==""){
				alert("Enter Spot Rate ..");
				error="Y"
			}else if(document.getElementById("repdat_text"+no).value==""){
				alert("Enter Forward Rate...");
				error="Y"
			}
		}
		
	if (error=="N"){
		
		$("#modflg").val("Y");
		modtyp="M";
		document.getElementById("edit_button"+no).checked = false;
		
	
	
	var outamt_val=document.getElementById("outamt_text"+no).value;
	document.getElementById("outamt_row"+no).innerHTML=outamt_val;

	var sanamt_val=document.getElementById("sanamt_text"+no).value;
	document.getElementById("sanamt_row"+no).innerHTML=sanamt_val;
	if($("#addrowno").val()=="1"  ){
		modtyp="A";
	var  accno_val=document.getElementById("accno_text"+no).value;	 
	document.getElementById("accno_row"+no).innerHTML=accno_val;

	   var acnam_val=document.getElementById("acnam_text"+no).value;
	   document.getElementById("acnam_row"+no).innerHTML=acnam_val;
	   
	  var scode_val=document.getElementById("scode_text"+no).value;
	   document.getElementById("scode_row"+no).innerHTML=scode_val;

	   var stype_val=document.getElementById("stype_text"+no).value;
		document.getElementById("stype_row"+no).innerHTML=stype_val;
		 
	  
	  var iscode_val=document.getElementById("iscode_text"+no).value;	
	  document.getElementById("iscode_row"+no).innerHTML=iscode_val;
	 
	  var sflag_val=document.getElementById("sflag_text"+no).value;
	  document.getElementById("sflag_row"+no).innerHTML=sflag_val;
	  

	  var impflg_val=document.getElementById("impflg_text"+no).value;
		document.getElementById("impflg_row"+no).innerHTML=impflg_val;
		
	 
	 var accopndat_val=document.getElementById("accopndat_text"+no).value;	
	 document.getElementById("accopndat_row"+no).innerHTML=accopndat_val;

	 var rendat_val=document.getElementById("rendat_text"+no).value;	
	 document.getElementById("rendat_row"+no).innerHTML=rendat_val;

	 var  secflg_val=document.getElementById("secflg_text"+no).value;	 
	 document.getElementById("secflg_row"+no).innerHTML=secflg_val;

	    var reflg_val=document.getElementById("reflg_text"+no).value;
	    document.getElementById("reflg_row"+no).innerHTML=reflg_val;
	    
	    var resdat_val=document.getElementById("resdat_text"+no).value;
	   document.getElementById("resdat_row"+no).innerHTML=resdat_val;
	   
	   

	    var acccrcode_val=document.getElementById("acccrcode_text"+no).value;
	 	document.getElementById("acccrcode_row"+no).innerHTML=acccrcode_val;
	 	 
	   
	   var repdat_val=document.getElementById("repdat_text"+no).value;	
	   document.getElementById("repdat_row"+no).innerHTML=repdat_val;
	  
	   
	   
	  
	   
	   


	}else{
		document.getElementById("Cancel_button"+no).style.display="inline-block";
		document.getElementById("Cancel_btn"+no).style.display="none";
		}

		document.getElementById("edit_button"+no).style.display="inline-block";
		document.getElementById("save_button"+no).style.display="none";

	 var accno=document.getElementById("accno_row"+no).innerHTML;	 
	   var acnam=document.getElementById("acnam_row"+no).innerHTML;
	  var scode=document.getElementById("scode_row"+no).innerHTML;
	  
	  var stype=document.getElementById("stype_row"+no).innerHTML;
	  var iscode=document.getElementById("iscode_row"+no).innerHTML;	
	  var sflag=document.getElementById("sflag_row"+no).innerHTML;
	 var outamt=document.getElementById("outamt_row"+no).innerHTML;
	 var impflg=document.getElementById("impflg_row"+no).innerHTML;
	 var accopndat=document.getElementById("accopndat_row"+no).innerHTML;
	 var rendat=document.getElementById("rendat_row"+no).innerHTML;	
	 var secflg=document.getElementById("secflg_row"+no).innerHTML;	 
	   var reflg=document.getElementById("reflg_row"+no).innerHTML;
	    var resdat=document.getElementById("resdat_row"+no).innerHTML;
	  var sanamt=document.getElementById("sanamt_row"+no).innerHTML;
	  var acccrcode=document.getElementById("acccrcode_row"+no).innerHTML;
	  
	  var repdat=document.getElementById("repdat_row"+no).innerHTML;	 
	  $("#dcgadd"+no).addClass("rowaddedd");
	  $("#det1 td").attr("padding","8px");

	var refePSC0106=document.getElementById("refDisplay").value;
	outamt=outamt.replace(/\,/g,'')
	  outamt=Number(outamt)
	  sanamt=sanamt.replace(/\,/g,'')
	  sanamt=Number(sanamt)
	  var rptdate1 = {
	    "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refePSC0106, "accno":accno,"acnam":acnam,"scode":scode,"stype":stype,"iscode":iscode,"sflag":sflag,"outamt":outamt,"impflg" : impflg, "accopndat":accopndat,"rendat":rendat,"secflg":secflg,"reflg":reflg,"resdat":resdat,"sanamt":sanamt,"acccrcode":acccrcode,"repdat":repdat,"modtyp":modtyp


	}; 

	$.ajax({
		url : "PSC0106",
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
	        	
	        	  
	        	 var accno=document.getElementById("accno_row"+no).innerHTML;	 
	        	   var acnam=document.getElementById("acnam_row"+no).innerHTML;
	        	  var scode=document.getElementById("scode_row"+no).innerHTML;
	        	  
	        	  var stype=document.getElementById("stype_row"+no).innerHTML;
	        	  var iscode=document.getElementById("iscode_row"+no).innerHTML;	
	        	  var sflag=document.getElementById("sflag_row"+no).innerHTML;
	        	 var outamt=document.getElementById("outamt_row"+no).innerHTML;
	        	 var impflg=document.getElementById("impflg_row"+no).innerHTML;
	        	 var accopndat=document.getElementById("accopndat_row"+no).innerHTML;
	        	 var rendat=document.getElementById("rendat_row"+no).innerHTML;	
	        	 var secflg=document.getElementById("secflg_row"+no).innerHTML;	 
	        	   var reflg=document.getElementById("reflg_row"+no).innerHTML;
	        	    var resdat=document.getElementById("resdat_row"+no).innerHTML;
	        	  var sanamt=document.getElementById("sanamt_row"+no).innerHTML;
	        	  var acccrcode=document.getElementById("acccrcode_row"+no).innerHTML;
	        	  
	        	  var repdat=document.getElementById("repdat_row"+no).innerHTML;	 
	        	 
	        	  $("#dcgadd"+no).addClass("rowaddedd");
	        	  $("#pymdets td").attr("padding","8px");
	        	  
	        	var refePSC0106=document.getElementById("refDisplay").value;
	        	outamt=outamt.replace(/\,/g,'')
	        	  outamt=Number(outamt)
	        	  sanamt=sanamt.replace(/\,/g,'')
	        	  sanamt=Number(sanamt)
	        	  var rptdate1 = {
	        	    "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refePSC0106, "accno":accno,"acnam":acnam,"scode":scode,"stype":stype,"iscode":iscode,"sflag":sflag,"outamt":outamt,"impflg" : impflg, "accopndat":accopndat,"rendat":rendat,"secflg":secflg,"reflg":reflg,"resdat":resdat,"sanamt":sanamt,"acccrcode":acccrcode,"repdat":repdat,"modtyp":modtyp


	        	}; 
	        		 		 
	        	 $.ajax({
	        	     url : "PSC0106",
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

	}function Cancel_row(no){
		  /*  document.getElementById("del_button"+no).style.display="inline-block"; */
		  
		 var detcancel={
				 "accno":$("#accno_row"+no).text()
		 	};
		 	
		 	 $.ajax({
		 	     url : "PSC0106cancel",
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
		 var outamt_val=document.getElementById("outamt_text"+no).value;
		 document.getElementById("outamt_row"+no).innerHTML=outamt_val;

		 var sanamt_val=document.getElementById("sanamt_text"+no).value;
		 document.getElementById("sanamt_row"+no).innerHTML=sanamt_val;

		 
				$("#edit_button"+no).show();
				/* document.getElementById("edit_button"+no).style.display="block"; */
				document.getElementById("save_button"+no).style.display="none";
				document.getElementById("Cancel_btn"+no).style.display="none";
				 location.reload(true); 
				 
				 var outamt_val=document.getElementById("outamt_text"+no).innerHTMLL;

	    		 var sanamt_val=document.getElementById("sanamt_text"+no).innerHTMLL;



				 
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
						"accno":$("#accno_row"+no).text(),"date":'<%=dt2%>'
				};
				
				
				
				 $.ajax({
				     url : "PSC0106cancel",
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
			 
			 
			 

			 var datasum={
						"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>'
				};
			 

			 $.ajax({
					url:"savecheckpsc0106",
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
		 $("#btnXML").show();
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
				url : "psc0106details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				
					
					  $("#pymdets tr").remove();
					 
					
					var b=JSON.parse(res.detailsPSC0106);
					
					 console.log(b);
					
			
						 	if(f=="onload"){
						 		
						 		/* $("#tab2").hide();
						 		
						 		$(".tab2").hide(); */
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#pymdets").append("<tr id='dcgadd"+srno+"'><td id='accno_row"+srno+"'>"+b[i].accno+"</td><td id='acnam_row"+srno+"'>"+b[i].acnam+"</td><td id='scode_row"+srno+"'>"+b[i].scode+"</td><td id='stype_row"+srno+"' >"+b[i].stype+"</td><td id='iscode_row"+srno+"' >"+b[i].iscode+"</td><td id='sflag_row"+srno+"'>"+b[i].sflag+"</td><td class='sumder alnum' id='outamt_row"+srno+"'>"+b[i].outamt+"</td><td id='impflg_row"+srno+"'>"+b[i].impflg+"</td><td id='accopndat_row"+srno+"'>"+b[i].accopndat+"</td><td id='rendat_row"+srno+"'>"+b[i].rendat+"</td><td id='secflg_row"+srno+"' >"+b[i].secflg+"</td><td id='reflg_row"+srno+"'>"+b[i].reflg+"</td><td id='resdat_row"+srno+"'>"+b[i].resdat+"</td><td class='sumder alnum' id='sanamt_row"+srno+"'>"+b[i].sanamt+"</td><td id='acccrcode_row"+srno+"'>"+b[i].acccrcode+"</td><td id='repdat_row"+srno+"'>"+b[i].repdat+"</td><td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none; ' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+srno+"')><input type='button'id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')></td>"
						                    
						                     
					                      
						                    +"</tr>" ) ;   
						 		  
						 		 
								
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 	 /* $("#tab2").hide();
						 		$(".tab2").hide(); */
						 		$(".tb1").show();
						 		$("#modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
						 			$("#pymdets").append("<tr><td id='accno_row"+srno+"'>"+b[i].accno+"</td><td id='acnam_row"+srno+"'>"+b[i].acnam+"</td><td id='scode_row"+srno+"'>"+b[i].scode+"</td><td id='stype_row"+srno+"' >"+b[i].stype+"</td><td id='iscode_row"+srno+"' >"+b[i].iscode+"</td><td id='sflag_row"+srno+"'>"+b[i].sflag+"</td><td class='sumder alnum' id='outamt_row"+srno+"'>"+b[i].outamt+"</td><td id='impflg_row"+srno+"'>"+b[i].impflg+"</td><td id='accopndat_row"+srno+"'>"+b[i].accopndat+"</td><td id='rendat_row"+srno+"'>"+b[i].rendat+"</td><td id='secflg_row"+srno+"' >"+b[i].secflg+"</td><td id='reflg_row"+srno+"'>"+b[i].reflg+"</td><td id='resdat_row"+srno+"'>"+b[i].resdat+"</td><td class='sumder alnum' id='sanamt_row"+srno+"'>"+b[i].sanamt+"</td><td id='acccrcode_row"+srno+"'>"+b[i].acccrcode+"</td><td id='repdat_row"+srno+"'>"+b[i].repdat+"</td></tr>") ;  
							
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
				
				 $(".repdisp").val(refno);
				 
						
						$("#test tr").children().detach().remove();
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "psc0106",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#section1 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC00106);
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#section1").append("<tr><td id='applno"+srno+"'>"+b[i].isicCode+"</td><td id='applname"+srno+"'>"+b[i].acctName+"</td><td id='rejreason"+srno+"'>"+b[i].entityType+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].amtPerforming+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].amtImpaired+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].smeAmt+"</td><td id='rejreason"+srno+"' class='sumder alnum'>"+b[i].outstandingAmt+"</td><td id='rejreason"+srno+"' class='sumder alnum'>"+b[i].flAmt+"</td><td id='rejreason"+srno+"' class='sumder alnum'>"+b[i].otherAmt+"</td><td id='rejreason"+srno+"' class='sumder alnum'>"+b[i].totalAmt+"</td><td id='rejreason"+srno+"' class='sumder alnum'>"+b[i].outsmeAmt+"</td><td id='rejreason"+srno+"' class='sumder alnum'>"+b[i].outOd+"</td><td id='rejreason"+srno+"' class='sumder alnum'>"+b[i].outFlease+"</td><td id='rejreason"+srno+"' class='sumder'>"+b[i].outOthers+"</td><td id='rejreason"+srno+"' class='sumder alnum'>"+b[i].outTotal+"</td><td style=text-align:center;><input type=radio style=width: 15px;text-align:center; onclick=fnloads(0) id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
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
			url:"savecheckpsc0106",
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
	
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_PSC0106_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>'+"&cnt="+cnt;
	
}
</script>
<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="PSC0106Form"
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
	 	<div class="activetab2 PSC0106" id="" style="width: 1163px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" id="equinvesh"><b><%=reptype%>-List of names of SMEs - SME Financing Scheme and MSME<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"><b id="sub" style="display: none"></b></b></div> 
			<table class="" id="tab2" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> 
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></input></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align:right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select>&nbsp;&nbsp;&nbsp;</td></tr>
          		  </table>
           	
            <table class="table tb1" id="tb1" style="width:100%;display:none;margin-top:-20px;">
         <tr>
							<th rowspan="2" style="text-align: center">ISIC Code</th>
							<th rowspan="2" style="text-align: center">Name</th>
							<th rowspan="2" style="text-align: center">Type of Entity</th>
							<th colspan="2" style="text-align: center">Status of
								Outstanding Credit Facilities</th>
							<th colspan="5" style="text-align: center">Credit Facilities
								approved Under the SME Financing Scheme and MSME-Cumulative
								Basis</th>
							<th colspan="5" style="text-align: center">Amount
								Outstanding</th>
							<th rowspan="3" style="text-align: center">Select</th>
						</tr>

						<tr>
							<th style="text-align: center">Amount Performing</th>
							<th style="text-align: center">Amount Impaired</th>
							<th style="text-align: center">SME Loans</th>
							<th style="text-align: center">Overdrafts</th>
							<th style="text-align: center">Finance Lease</th>
							<th style="text-align: center">Others</th>
							<th style="text-align: center">Total</th>
							<th style="text-align: center">SME Loans</th>
							<th style="text-align: center">Overdrafts</th>
							<th style="text-align: center">Finance Lease</th>
							<th style="text-align: center">Others</th>
							<th style="text-align: center">Total</th>
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
						</tr>

						<tr>


						</tr>

						<tbody class="databody" id="section1"></tbody>
					</table>
          
          
          
            <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
<!--       <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button>
 -->    
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                  <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnXML">Gen XML Sum</button>
                
<!--        <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button>
 -->      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div>
          
            </div>
           
          
          
          <!-- DETAIL TABLE -->
          
          <input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			 <div class="activetab1" id="tab1" style="width: 2416px;padding-top: 1px;margin-top: -17px;display:none" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b><%=reptype %>-List of names of SMEs - SME Financing Scheme and MSME	
<b id="sub"
					Style="display: none"></b></b></font>
			<br><br><b style="font-size: 13px;"> <b id="sub" style="display: none"></b></b></div> 
			<div id="divLoading"> 
    </div>
  
				
           <table class=""style="width: 2416px;height:50px; 
           ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 530px;">
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a>
                    <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a>&nbsp;&nbsp;&nbsp;</td></tr>
          		  </table>
 
					 <div class="panel panel-primary filterable">
					 
					   <table class="table tb1" id="tb1" style="width:100%;display:none;margin-top:-20px;"><tr>			
         	 <thead>
			<tr class="filters">
            <th rowspan="2" style="width:1%;"><textarea  style="text-align:center;width:70px;" type="text"id="accno" onkeyup="myFunction(this.id,0)"class="form-control2" placeholder="Account No" disabled></textarea></th>
               <th style="width:2%;"><textarea style="text-align:center;width:80px;" type="text"id="acnam" onkeyup="myFunction(this.id,1)"class="form-control2" placeholder="Account Name" disabled></textarea></th>
                <th style="width:1%;" ><textarea style="text-align:center;width:70px;" type="text"id="scode" onkeyup="myFunction(this.id,2)"class="form-control2" placeholder="Scheme Code" disabled></textarea></th>
               <th style="width:1%;" ><textarea style="text-align:center;width:70px;" type="text"id="stype" onkeyup="myFunction(this.id,3)"class="form-control2" placeholder="Scheme Type" disabled></textarea></th>
               <th style="width:1%;" ><textarea style="text-align:center;width:70px;" type="text"id="iscode" onkeyup="myFunction(this.id,4)"class="form-control2" placeholder="ISIC Code" disabled></textarea></th>
               <th style="width:1%;" ><textarea style="text-align:center;width:70px;" type="text"id="sflag" onkeyup="myFunction(this.id,5)"class="form-control2" placeholder="SME Flag" disabled></textarea></th>
               <th style="width:1%;"><textarea  style="text-align:center;width:70px;" type="text"id="outamt" onkeyup="myFunction(this.id,6)"class="form-control2" placeholder="Outstanding Amount" disabled></textarea></th>
               <th style="width:1%;"><textarea  style="text-align:center;width:70px;" type="text"id="impflg" onkeyup="myFunction(this.id,7)"class="form-control2" placeholder="Impaired Flag" disabled></textarea></th>
               <th style="width:1%;"><textarea style="text-align:center;width:70px;" type="text"id="accopndat" onkeyup="myFunction(this.id,8)"class="form-control2" placeholder="Account Opening Date" disabled></textarea></th>
               <th style="width:1%;"><textarea style="text-align:center;width:70px;" type="text"id="rendat" onkeyup="myFunction(this.id,9)"class="form-control2" placeholder="Renewal Date" disabled></textarea></th>
               <th style="width:1%;"><textarea style="text-align:center;width:70px;" type="text"id="secflg" onkeyup="myFunction(this.id,10)"class="form-control2" placeholder="Secured Flag" disabled></textarea></th>
               <th style="width:1%;"><textarea style="text-align:center;width:70px;" type="text"id="reflg" onkeyup="myFunction(this.id,11)"class="form-control2" placeholder="Restructured Flag" disabled></textarea></th>
             <th style="width:1%;"><textarea style="text-align:center;width:70px;" type="text"id="resdat" onkeyup="myFunction(this.id,12)"class="form-control2" placeholder="Restructured Date" disabled></textarea></th>
               <th style="width:1%;"><textarea style="text-align:center;width:70px;" type="text"id="sanamt" onkeyup="myFunction(this.id,13)"class="form-control2" placeholder="Sanction Amount" disabled></textarea></th>
               <th style="width:1%;"><textarea style="text-align:center;width:70px;" type="text"id="acccrcode" onkeyup="myFunction(this.id,14)"class="form-control2" placeholder="Account Currency Code" disabled></textarea></th>
              
               <th style="width:1%;"><textarea style="text-align:center;width:70px;" type="text"id="repdat" onkeyup="myFunction(this.id,15)"class="form-control2" placeholder="Report Date" disabled></textarea></th>
									<th style="width:1%;" id="modify">Modify</th>

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
   
   </div>
   
   
    </div></div>
    
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