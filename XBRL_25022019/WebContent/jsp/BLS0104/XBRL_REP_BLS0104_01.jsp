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

.databody td{
border:1px solid #ddd;
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



.filterable .filters input[disabled] {
    background-color: transparent;
    border: none;
    cursor: auto;
    box-shadow: none;
    padding: 0;
    height: auto;
}
 .ui-dialog-titlebar-close {
    visibility: hidden;
} 
</style>



<script>
$(document).ready(function(){

	var det={
			"repdate":'<%=dt2%>',"type":"chckmodified"
		};
		$.ajax({
			url:"BLS0104chckmodified",
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
					        	location.href = "XBRL_CRT_BLS0104_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
					        }
					      }
					    });
					
					
				}else{
					$("#modflg").val("N");
				}
			}
		});
		
		
	
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
	
	


	
	 $('#btnExcel').click(function() {

		 BLS0104Form.action = "BLS0104EXCELREPORT.action?method=BLS0104EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 BLS0104Form.submit();
		});

	$("#btnfilter").on("click",function(){
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
		}else{
			$(".form-control2").val("");
			$(".form-control2").prop("disabled",true);
			
			 
			  var   table, tr, td, i;
			 table = document.getElementById("det1");
			 tr = table.getElementsByTagName("tr");
			 for (i = 0; i < tr.length; i++) {
					 tr[i].style.display = ""; 
			 }
			
		}
		
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
function functionli(a){
	 $(".table").hide(); 
	$(".tb"+a).show();
	$("#btnSave").hide()
	$("#btnXML").hide();
if(a==1){
	
	 $("#btnnext").prop("disabled",false);
	 $("#li1").addClass("active");
	 $("#li2,#li3,#li4,#li5,#li6,#li7,#li8").removeClass("active");
}else if(a==2){
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li2").addClass("active");
	 $("#li1,#li3,#li4,#li5,#li6,#li7,#li8").removeClass("active");

}else if(a==3){
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li3").addClass("active");
	 $("#li1,#li2,#li4,#li5,#li6,#li7,#li8").removeClass("active");

}else if(a==4){
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li4").addClass("active");
	 $("#li1,#li3,#li2,#li5,#li6,#li7,#li8").removeClass("active");

}else if(a==5){
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li5").addClass("active");
	 $("#li1,#li3,#li4,#li2,#li6,#li7,#li8").removeClass("active");

}else if(a==6){
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li6").addClass("active");
	 $("#li1,#li3,#li4,#li5,#li2,#li7,#li8").removeClass("active");

}else if(a==7){
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li7").addClass("active");
	 $("#li1,#li3,#li4,#li5,#li6,#li2,#li8").removeClass("active");

}else {
	$("#btnSave").show()
	$("#btnXML").show();
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li8").addClass("active");
	 $("#li1,#li3,#li4,#li5,#li6,#li7,#li2").removeClass("active");
}

}
</script>

<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	$("#sumfirst").on("click",function(){
		
		location.href = "XBRL_REP_BLS0104_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
 	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>'); 
 
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_BLS0104_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( ".btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '.btnback').click(function() {
		 location.href="XBRL_CRT_BLS0104_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	$('#btnExcel').click(function() {
		if($("#modflg").val()=="N"){
		 BLS0104Form.action = "BLS0104EXCELREPORT.action?method=BLS0104EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 BLS0104Form.submit();
		}else{
			alert("Some Records are Modified");
		}
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 BLS0104Form.action = "BLS0104EXCELSum.action?method=BLS0104EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 BLS0104Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 BLS0104Form.action = "BLS0104PDFREPORT.action?method=BLS0104PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 BLS0104Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  BLS0104Form.action = "XMLDOWNLOAD104.action?method=bls5xml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 BLS0104Form.submit(); 
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
		url:"saveSumbls1",
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
				   			url:"saveSumbls1",
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
	$("#det1").prepend("<tr  id='bls4add"+rowno+"'><td id='actnum_row"+rowno+"'><input type='text' id='actnum_text"+rowno+"' style='width: 97px;'></td><td id='cusid_row"+rowno+"'><input type='text'  id='cusid_text"+rowno+"' style='    width:117px;'></td><td id='cusnam_row"+rowno+"'><input type='text' id='cusnam_text"+rowno+"' style='     width: 281px;'></td><td id='cusnrflg_row"+rowno+"'><input type='text' 	id='cusnrflg_text"+rowno+"' style='    width: 42px;'></td><td id='accurcode_row"+rowno+"'><input type='text' id='accurcode_text"+rowno+"' style='    width: 100px;'></td><td id='balastmon_row"+rowno+"'><input type='text' id='balastmon_text"+rowno+"' class='decimalPt roundUp' style='width: 87px;'></td><td id='balcurmon_row"+rowno+"'><input type='text'  id='balcurmon_text"+rowno+"' class='decimalPt roundUp' style='    width:117px;'></td><td id='accrint_row"+rowno+"'><input type='text' id='accrint_text"+rowno+"' class='decimalPt roundUp' style='     width: 121px;'></td><td id='accrtyp_row"+rowno+"'><input type='text' 	id='accrtyp_text"+rowno+"' style='    width: 142px;'></td><td id='reportdate_row"+rowno+"'><input type='text' id='reportdate_text"+rowno+"' style='    width: 100px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");
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
	$("#reportdate_text"+a).datepicker({
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

	 
	 

var	balastmon =  document.getElementById("balastmon_row"+no);
var	balastmon_data = balastmon.innerHTML;

var	balcurmon =  document.getElementById("balcurmon_row"+no);
var	balcurmon_data = balcurmon.innerHTML;


var	accrint =  document.getElementById("accrint_row"+no);
var	accrint_data = accrint.innerHTML;


balastmon.innerHTML="<input type='text' class='decimalPt roundUp'  id='balastmon_text"+no+"'  style='width: 83px'; value='"+balastmon_data+"'>";
balcurmon.innerHTML="<input type='text' class='decimalPt roundUp'  id='balcurmon_text"+no+"'  style='width: 83px'; value='"+balcurmon_data+"'>";
accrint.innerHTML="<input type='text' class='decimalPt roundUp'  id='accrint_text"+no+"'  style='width: 83px'; value='"+accrint_data+"'>";




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
var error="N";

if (modtyp=="M"){
	
	
	if(document.getElementById("balastmon_text"+no).value==""){
		alert("Enter Balance On Last Month ..");
		error="Y"
	}else if(document.getElementById("balcurmon_text"+no).value==""){
		alert("Enter Balance On Current Month ..");
		error="Y"
	}else if(document.getElementById("accrint_text"+no).value==""){
		alert("Enter Accured Interest ..");
		error="Y"
	}
	
} else if (modtyp=="A") {
	
	
	

	if(document.getElementById("actnum_text"+no).value==""){
		alert("Enter Account Number ..");
		error="Y"
	}else if(document.getElementById("cusid_text"+no).value==""){
		alert("Enter Customer ID ..");	
		error="Y"
	}else if(document.getElementById("cusnam_text"+no).value==""){
		alert("Enter Customer Name ..");
		error="Y"
	}else if(document.getElementById("cusnrflg_text"+no).value==""){
		alert("Enter Non Resident Flag ..");
		error="Y"
	}else if(document.getElementById("accurcode_text"+no).value==""){
		alert("Enter Account Currency Code..");	
		error="Y"
	}else if(document.getElementById("accrtyp_text"+no).value==""){
		alert("Enter Account Type..");
		error="Y"
	}else if(document.getElementById("reportdate_text"+no).value==""){
		alert("Enter Reportdate ..");
		error="Y"
	}
}



if (error=="N"){

$("#modflg").val("Y");
modtyp="M";
document.getElementById("edit_button"+no).checked = false;

var balastmon_val=document.getElementById("balastmon_text"+no).value;

document.getElementById("balastmon_row"+no).innerHTML=balastmon_val;

var balcurmon_val=document.getElementById("balcurmon_text"+no).value;
document.getElementById("balcurmon_row"+no).innerHTML=balcurmon_val;

var accrint_val=document.getElementById("accrint_text"+no).value;
document.getElementById("accrint_row"+no).innerHTML=accrint_val;

if($("#addrowno").val()=="1"){
	modtyp="A";
var  actnum_val=document.getElementById("actnum_text"+no).value;	 
document.getElementById("actnum_row"+no).innerHTML=actnum_val;

   var cusid_val=document.getElementById("cusid_text"+no).value;
   document.getElementById("cusid_row"+no).innerHTML=cusid_val;
   
  var cusnam_val=document.getElementById("cusnam_text"+no).value;
   document.getElementById("cusnam_row"+no).innerHTML=cusnam_val;

   var cusnrflg_val=document.getElementById("cusnrflg_text"+no).value;
	document.getElementById("cusnrflg_row"+no).innerHTML=cusnrflg_val;
	
  
  var accurcode_val=document.getElementById("accurcode_text"+no).value;	
  document.getElementById("accurcode_row"+no).innerHTML=accurcode_val;
 
  var  accrtyp_val=document.getElementById("accrtyp_text"+no).value;	 
  document.getElementById("accrtyp_row"+no).innerHTML=accrtyp_val;

  var reportdate_val=document.getElementById("reportdate_text"+no).value;	 
  document.getElementById("reportdate_row"+no).innerHTML=reportdate_val;
}

else{
	document.getElementById("Cancel_button"+no).style.display="inline-block";
	document.getElementById("Cancel_btn"+no).style.display="none";
}

document.getElementById("edit_button"+no).style.display="inline-block";
document.getElementById("save_button"+no).style.display="none";


 var actnum=document.getElementById("actnum_row"+no).innerHTML;	 
   var cusid=document.getElementById("cusid_row"+no).innerHTML;
  var cusnam=document.getElementById("cusnam_row"+no).innerHTML;
  var cusnrflg=document.getElementById("cusnrflg_row"+no).innerHTML;
  var accurcode=document.getElementById("accurcode_row"+no).innerHTML;
  var balastmon=document.getElementById("balastmon_row"+no).innerHTML;	
  var balcurmon=document.getElementById("balcurmon_row"+no).innerHTML;	 
  var accrint=document.getElementById("accrint_row"+no).innerHTML;
  var accrtyp=document.getElementById("accrtyp_row"+no).innerHTML;	 
  var reportdate=document.getElementById("reportdate_row"+no).innerHTML;
  var changetyp =document.getElementById("changetyp_row"+no).innerHTML;
  var secid=document.getElementById("secid_row"+no).innerHTML;	 
  var cusrank=document.getElementById("cusrank_row"+no).innerHTML;
  $("#bls4add"+no).addClass("rowaddedd");
 $("#det1 td").attr("padding","8px");
var refeBLS104=document.getElementById("refDisplay").value;
balastmon=balastmon.replace(/\,/g,'');
balastmon=Number(balastmon);

balcurmon=balcurmon.replace(/\,/g,'');
  balcurmon=Number(balcurmon);

accrint=accrint.replace(/\,/g,'');
accrint=Number(accrint);



 var rptdate1 = {
		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeBLS104, "actnum":actnum,"cusid":cusid,"cusnam" : cusnam,"cusnrflg":cusnrflg, "accurcode":accurcode,"balastmon":balastmon,"balcurmon":balcurmon,"accrint":accrint,"accrtyp":accrtyp,"changetyp":changetyp ,"secid":secid,"cusrank":cusrank,"reportdate":reportdate,"modtyp":modtyp 
		}; 

 $.ajax({
     url : "BLS0104",
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
	        	
	        	
	        	 var actnum=document.getElementById("actnum_row"+no).innerHTML;	 
	        	   var cusid=document.getElementById("cusid_row"+no).innerHTML;
	        	  var cusnam=document.getElementById("cusnam_row"+no).innerHTML;
	        	  var cusnrflg=document.getElementById("cusnrflg_row"+no).innerHTML;
	        	  var accurcode=document.getElementById("accurcode_row"+no).innerHTML;
	        	  var balastmon=document.getElementById("balastmon_row"+no).innerHTML;	
	        	  var balcurmon=document.getElementById("balcurmon_row"+no).innerHTML;	 
	        	  var accrint=document.getElementById("accrint_row"+no).innerHTML;
	        	  var accrtyp=document.getElementById("accrtyp_row"+no).innerHTML;	 
	        	  var reportdate=document.getElementById("reportdate_row"+no).innerHTML;
	        	  var changetyp =document.getElementById("changetyp_row"+no).innerHTML;
	        	  var secid=document.getElementById("secid_row"+no).innerHTML;	 
	        	  var cusrank=document.getElementById("cusrank_row"+no).innerHTML;
	        	  var refeBLS104=document.getElementById("refDisplay").value;
	        	  balastmon=balastmon.replace(/\,/g,'');
	        	  balastmon=Number(balastmon);

	        	  balcurmon=balcurmon.replace(/\,/g,'');
	        	    balcurmon=Number(balcurmon);

	        	  accrint=accrint.replace(/\,/g,'');
	        	  accrint=Number(accrint);



	        	   var rptdate1 = {
	        	  		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeBLS104, "actnum":actnum,"cusid":cusid,"cusnam" : cusnam,"cusnrflg":cusnrflg, "accurcode":accurcode,"balastmon":balastmon,"balcurmon":balcurmon,"accrint":accrint,"accrtyp":accrtyp, "changetyp":changetyp ,"secid":secid,"cusrank":cusrank,"reportdate":reportdate,"modtyp":modtyp 
	        	  		}; 

	        	   $.ajax({
	        	       url : "BLS0104",
	        	       data : rptdate1  ,
	        	  		dataType : 'json', 
	        	  		type : 'POST',
	        	  		async : true,
	        	  		 success : function(res) {
	        	  			 console.log(res.refno);
	        				// alert("sfsdf");
	        				 $("#refDisplay").val(res.refno);
		   
			  
	        				 $("#bls4add"+no).closest("tr").remove();

			   
	        				
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
				"actnum":$("#actnum_row"+no).text(),"date":'<%=dt2%>'
		};
		
		 $.ajax({
		     url : "BLS0104cancel",
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
	 	
	 var	balastmon =  document.getElementById("balastmon_row"+no);
	 var	balastmon_data = balastmon.innerHTML;

	 var	balcurmon =  document.getElementById("balcurmon_row"+no);
	 var	balcurmon_data = balcurmon.innerHTML;


	 var	accrint =  document.getElementById("accrint_row"+no);
	 var	accrint_data = accrint.innerHTML;
			$("#edit_button"+no).show();
			/* document.getElementById("edit_button"+no).style.display="block"; */
			document.getElementById("save_button"+no).style.display="none";
			document.getElementById("Cancel_btn"+no).style.display="none";
			 location.reload(true); 
			 var balastmon=document.getElementById("balastmon_row"+no).innerHTML;	
       	  var balcurmon=document.getElementById("balcurmon_row"+no).innerHTML;	 
       	  var accrint=document.getElementById("accrint_row"+no).innerHTML;		
       	  if($("#bls4add"+no).hasClass( "rowaddedd" )){
				  
				  document.getElementById("Cancel_button"+no).style.display="inline-block";


			  }else{
				  document.getElementById("Cancel_button"+no).style.display="none";
			  }
			  
			
	 }
function Canadd_row(no){
	 
	  /* document.getElementById("del_button"+no).style.display="inline-block"; */

																   

	 if($("#bls4add"+no).hasClass( "rowaddedd" )){
		
		var detcancel={
				"actnum":$("#actnum_row"+no).text(),"date":'<%=dt2%>'
		};
		

		 $.ajax({
		     url : "BLS0104cancel",
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
	 $("#bls4add"+no).remove();
	 
}
</script> 
<script>

function fnload(z,d,e,b,c,a,f,g){
	var save=0;
	$("#btnSave").hide()
	$("#btnXML").hide();
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
			$(".tab-pane,#tbcates").hide();
			$(".active,#tbcate").show(); 
		$("#tab1").show();
		$("#tab2").hide();
		
		<%-- funli(<%=request.getParameter("secid")%>); --%>
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
			 var cnt1=1;
			 $("#divLoading").addClass("show");
			 /*   $(".loader").fadeOut("slow"); */
				 var pymd = {
						"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
					};
			
				 $.ajax({
						url : "BLS0104det1",
						data : pymd,
						dataType : 'json',
						type : 'POST',
						async : false,
						success : function(res) {	
						//	alert("refePYM100"+refePYM100);
							
							  $("#pymdets tr").remove();
							 
							
							var b=JSON.parse(res.det1BLS0104);
							 console.log(b);
							
								 	if(f=="onload"){
								 		$("#modify").show();
								 		$("#modify1").show();
								 		for(var i=0;i<b.length;i++){
								 			
								 		 // $("#pymdets").append("<tr><td id='applno"+srno+"'>"+b[i].applno+"</td><td id='applname"+srno+"'>"+b[i].aplcantname+"</td><td id='schmtyp"+srno+"'>"+b[i].schmtyp+"</td><td id='curr"+b[i].curr+"'></td><td id='outbal"+srno+"'>"+b[i].outstndingamt+"</td><td id='intrate"+srno+"'>"+b[i].intrate+"</td><td id='accopndate"+srno+"'>"+b[i].actopndate+"</td><td id='recvddate"+srno+"'>"+b[i].rcvddate+"</td><td id='appdate"+srno+"'>"+b[i].apprvddate+"</td><td id='rejctddate"+srno+"'>"+b[i].rejctdate+"</td><td id='rejreason"+srno+"'>"+b[i].rejctdreason+"</td><td><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>") ;  
								 		  $("#det1").append("<tr id='bls4add"+cnt1+"'><td  id='actnum_row"+cnt1+"'>"+b[i].actnum+"</td><td  id='cusid_row"+cnt1+"'>"+b[i].cusid+"</td><td  id='cusnam_row"+cnt1+"'>"+b[i].cusnam+"</td><td  id='cusnrflg_row"+cnt1+"'>"+b[i].cusnrflg+"</td><td  id='accurcode_row"+cnt1+"'>"+b[i].accurcode+"</td><td class='sumder' id='balastmon_row"+cnt1+"'>"+b[i].balastmon+"</td><td class='sumder' id='balcurmon_row"+cnt1+"'>"+b[i].balcurmon+"</td><td class='sumder' id='accrint_row"+cnt1+"'>"+b[i].accrint+"</td><td  id='accrtyp_row"+cnt1+"'>"+b[i].accrtyp+"</td><td  id='reportdate_row"+cnt1+"'>"+b[i].reportdate+"</td><td hidden id='changetyp_row"+cnt1+"' >"+b[i].changetyp+"</td><td hidden id='secid_row"+cnt1+"' >"+b[i].secid+"</td><td hidden id='cusrank_row"+cnt1+"' >"+b[i].cusrank+"</td><td style='text-align:center' ><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;text-align:center' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; text-align:center;display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none; ' onclick=Cancel_row('"+cnt1+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+cnt1+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+cnt1+"')></td></tr>");
									
								 		  
										cnt1++;
										 srno++;
										 
										
											}
										 $("#divLoading").removeClass('show');
										$("#rowno").val(srno);
								 	}else if(f=="frmsum"){
								 		
								 		$(".add").hide();//add button hide
								 		alert("frmsum");
										 $(".tb1").show(); 
										
								 		$("#modify").hide();//modify in the header hide
								 		$("#modify1").hide();  
									 		  
										 for (var i = 0; i <b.length; i++) {
											 
									 		  $("#det1").append("<tr ><td  id='actnum_row"+cnt1+"'>"+b[i].actnum+"</td><td  id='cusid_row"+cnt1+"'>"+b[i].cusid+"</td><td  id='cusnam_row"+cnt1+"'>"+b[i].cusnam+"</td><td  id='cusnrflg_row"+cnt1+"'>"+b[i].cusnrflg+"</td><td  id='accurcode_row"+cnt1+"'>"+b[i].accurcode+"</td><td class='sumder' id='balastmon_row"+cnt1+"'>"+b[i].balastmon+"</td><td class='sumder' id='balcurmon_row"+cnt1+"'>"+b[i].balcurmon+"</td><td class='sumder' id='accrint_row"+cnt1+"'>"+b[i].accrint+"</td><td  id='"+cnt1+"'>"+b[i].accrtyp+"</td><td  id='reportdate_row"+cnt1+"'>"+b[i].reportdate+"</td></tr>");
										
									
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
					
					 $(".repdisp").val(refno);
					 
							
							$("#test tr").children().detach().remove();
							
							 var rptdate1 = {
									 "dt1" : d,"dt2":e,"ReporefSeq" : refno,"curr":g,"reptype":a,"instno" : ins
									 
									}; 
							
							 $.ajax({
							     url : "BLS0104sec1",
							     data : rptdate1  ,
									dataType : 'json', 
									type : 'POST',
									async :false,
									 success : function(res) {
										 
							// console.log(res.s1BLS0104);
							
								var b=JSON.parse(res.s1BLS0104);
						console.log(b);
								
								var k=1;
								
								var cnt1=1;
								for (var i = 0; i < b.length; i++) {
									
								
									$("#sec1").append("<tr><td id='srno"+cnt1+"'>"+b[i].srno+"</td><td id='namcou"+cnt1+"'>"+b[i].namcou+"</td><td class='sumder' id='amt"+cnt1+"'>"+b[i].amtinc+"</td><td class='sumder' id='amtaccintr"+cnt1+"'>"+b[i].amtacrint+"</td><td  style='text-align:center' ><input type=radio style=width: 15px; onclick=fnloads('1"+cnt1+"') id='edit"+cnt1+"'></td></tr>");
									
								srno++;
									cnt1++;
									
								}  
								
								
								  $("#divLoading").removeClass('show'); 
								 $('.alnum').mask("#,##0.00", {reverse: true});
								
									 }
									 }); 

							 	
							 var rptdate2 = {
									  "dt1" : d,"dt2":e,"ReporefSeq" : refno,"curr":g,"reptype":a,"instno" : ins
									}; 
							 
							 $.ajax({
							     url : "BLS0104sec2",
							     data : rptdate2  ,
									dataType : 'json', 
									type : 'POST',
									async : false,
									 success : function(res) {
										 //console.log(res.refnoAB);
								
								//console.log(res.s2BLS0104);
							
								var b=JSON.parse(res.s2BLS0104);
								 console.log(b);
								var k=1;
								var cnt1=1;
								for (var i = 0; i < b.length; i++) {
								
									$("#sec2").append("<tr><td id='srno"+cnt1+"'>"+b[i].srno+"</td><td id='namcou"+cnt1+"'>"+b[i].namcou+"</td><td class='sumder' id='amt"+cnt1+"'>"+b[i].amtinc+"</td><td class='sumder' id='amtaccintr"+cnt1+"'>"+b[i].amtacrint+"</td><td  style='text-align:center' ><input type=radio style=width: 15px; onclick=fnloads('2"+cnt1+"') id='edit"+cnt1+"'></td></tr>");
									
								srno++;
									cnt1++;
									
								} 
								
								  $("#divLoading").removeClass('show'); 
								 $('.alnum').mask("#,##0.00", {reverse: true});
								
									 }
									 });  
					 
							 
							 	
							 var rptdate2 = {
									  "dt1" : d,"dt2":e,"ReporefSeq" : refno,"curr":g,"reptype":a,"instno" : ins
									}; 
							 
							 $.ajax({
							     url : "BLS0104sec3",
							     data : rptdate2  ,
									dataType : 'json', 
									type : 'POST',
									async : false,
									 success : function(res) {
										 //console.log(res.refnoAB);
								
								//console.log(res.s3BLS0104);
							
								var b=JSON.parse(res.s3BLS0104);
								 console.log(b);
								var k=1;
								var cnt1=1;
								for (var i = 0; i < b.length; i++) {
								
									$("#sec3").append("<tr><td id='srno"+cnt1+"'>"+b[i].srno+"</td><td id='namcou"+cnt1+"'>"+b[i].namcou+"</td><td class='sumder' id='amt"+cnt1+"'>"+b[i].amtinc+"</td><td class='sumder' id='amtaccintr"+cnt1+"'>"+b[i].amtacrint+"</td><td  style='text-align:center' ><input type=radio style=width: 15px; onclick=fnloads('3"+cnt1+"') id='edit"+cnt1+"'></td></tr>");
									
								srno++;
									cnt1++;
									
								} 
								
								  $("#divLoading").removeClass('show'); 
								 $('.alnum').mask("#,##0.00", {reverse: true});
								
									 }
									 }); 
							 	
							 var rptdate2 = {
									  "dt1" : d,"dt2":e,"ReporefSeq" : refno,"curr":g,"reptype":a,"instno" : ins
									}; 
							 
							 $.ajax({
							     url : "BLS0104sec4",
							     data : rptdate2  ,
									dataType : 'json', 
									type : 'POST',
									async : false,
									 success : function(res) {
										 //console.log(res.refnoAB);
								
								//console.log(res.s4BLS0104);
							
								var b=JSON.parse(res.s4BLS0104);
								 console.log(b);
								var k=1;
								var cnt1=1;
								for (var i = 0; i < b.length; i++) {
								
									$("#sec4").append("<tr><td id='srno"+cnt1+"'>"+b[i].srno+"</td><td id='namcou"+cnt1+"'>"+b[i].namcou+"</td><td class='sumder' id='amt"+cnt1+"'>"+b[i].amtinc+"</td><td class='sumder' id='amtaccintr"+cnt1+"'>"+b[i].amtacrint+"</td><td  style='text-align:center' ><input type=radio style=width: 15px; onclick=fnloads('4"+cnt1+"') id='edit"+cnt1+"'></td></tr>");
									
								srno++;
									cnt1++;
									
								} 
								
								  $("#divLoading").removeClass('show'); 
								 $('.alnum').mask("#,##0.00", {reverse: true});
								
									 }
									 }); 
							 	
							 var rptdate2 = {
									  "dt1" : d,"dt2":e,"ReporefSeq" : refno,"curr":g,"reptype":a,"instno" : ins
									}; 
							 
							 $.ajax({
							     url : "BLS0104sec5",
							     data : rptdate2  ,
									dataType : 'json', 
									type : 'POST',
									async : false,
									 success : function(res) {
										 //console.log(res.refnoAB);
								
								//console.log(res.s5BLS0104);
							
								var b=JSON.parse(res.s5BLS0104);
								 console.log(b);
								var k=1;
								var cnt1=1;
								for (var i = 0; i < b.length; i++) {
								
									$("#sec5").append("<tr><td id='srno"+cnt1+"'>"+b[i].srno+"</td><td id='namcou"+cnt1+"'>"+b[i].namcou+"</td><td class='sumder' id='amt"+cnt1+"'>"+b[i].amtinc+"</td><td class='sumder' id='amtaccintr"+cnt1+"'>"+b[i].amtacrint+"</td><td  style='text-align:center' ><input type=radio style=width: 15px; onclick=fnloads('5"+cnt1+"') id='edit"+cnt1+"'></td></tr>");
									
								srno++;
									cnt1++;
									
								} 
								
								  $("#divLoading").removeClass('show'); 
								 $('.alnum').mask("#,##0.00", {reverse: true});
								
									 }
									 }); 
							 	
							 var rptdate2 = {
									  "dt1" : d,"dt2":e,"ReporefSeq" : refno,"curr":g,"reptype":a,"instno" : ins
									}; 
							 
							 $.ajax({
							     url : "BLS0104sec6",
							     data : rptdate2  ,
									dataType : 'json', 
									type : 'POST',
									async : false,
									 success : function(res) {
										 //console.log(res.refnoAB);
								
								//console.log(res.s6BLS0104);
							
								var b=JSON.parse(res.s6BLS0104);
								 console.log(b);
								 
								var k=1;
								var cnt1=1;
								for (var i = 0; i < b.length; i++) {
								
									$("#sec6").append("<tr><td id='srno"+cnt1+"'>"+b[i].srno+"</td><td id='namcou"+cnt1+"'>"+b[i].namcou+"</td><td class='sumder' id='amt"+cnt1+"'>"+b[i].amtinc+"</td><td class='sumder' id='amtaccintr"+cnt1+"'>"+b[i].amtacrint+"</td><td  style='text-align:center' ><input type=radio style=width: 15px; onclick=fnloads('6"+cnt1+"') id='edit"+cnt1+"'></td></tr>");
									
								srno++;
									cnt1++;
									
								} 
								
								  $("#divLoading").removeClass('show'); 
								 $('.alnum').mask("#,##0.00", {reverse: true});
								
									 }
									 }); 
							 	
							 var rptdate2 = {
									  "dt1" : d,"dt2":e,"ReporefSeq" : refno,"curr":g,"reptype":a,"instno" : ins
									}; 
							 
							 $.ajax({
							     url : "BLS0104sec7",
							     data : rptdate2  ,
									dataType : 'json', 
									type : 'POST',
									async : false,
									 success : function(res) {
										 //console.log(res.refnoAB);
								
								//console.log(res.s7BLS0104);
							
								var b=JSON.parse(res.s7BLS0104);
								 console.log(b);
								 
								var k=1;
								var cnt1=1;
								for (var i = 0; i < b.length; i++) {
								
									$("#sec7").append("<tr><td id='srno"+cnt1+"'>"+b[i].srno+"</td><td id='namcou"+cnt1+"'>"+b[i].namcou+"</td><td class='sumder' id='amt"+cnt1+"'>"+b[i].amtinc+"</td><td class='sumder' id='amtaccintr"+cnt1+"'>"+b[i].amtacrint+"</td><td  style='text-align:center' ><input type=radio style=width: 15px; onclick=fnloads('7"+cnt1+"') id='edit"+cnt1+"'></td></tr>");
									
								srno++;
									cnt1++;
									
								} 
								
								  $("#divLoading").removeClass('show'); 
								 $('.alnum').mask("#,##0.00", {reverse: true});
								
									 }
									 }); 
							 	
							 var rptdate2 = {
									  "dt1" : d,"dt2":e,"ReporefSeq" : refno,"curr":g,"reptype":a,"instno" : ins
									}; 
							 
							 $.ajax({
							     url : "BLS0104sec8",
							     data : rptdate2  ,
									dataType : 'json', 
									type : 'POST',
									async : false,
									 success : function(res) {
										 //console.log(res.refnoAB);
								
								//console.log(res.s8BLS0104);
							
								var b=JSON.parse(res.s8BLS0104);
								 console.log(b);
								 
								var k=1;
								var cnt1=1;
								for (var i = 0; i < b.length; i++) {
								
									$("#sec8").append("<tr><td id='srno"+cnt1+"'>"+b[i].srno+"</td><td id='namcou"+cnt1+"'>"+b[i].namcou+"</td><td class='sumder' id='amt"+cnt1+"'>"+b[i].amtinc+"</td><td class='sumder' id='amtaccintr"+cnt1+"'>"+b[i].amtacrint+"</td><td  style='text-align:center' ><input type=radio style=width: 15px; onclick=fnloads('8"+cnt1+"') id='edit"+cnt1+"'></td></tr>");
									
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
			url:"savecheckbls4",
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

	</SCRIPT>
	
	
	<script>
function myFunction(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("det1");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==5 ||b==6 || b==7||b==0||b==9){
		
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

function fnloads(cnt){
	alert("jhdfh"+cnt);
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_BLS0104_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>'+"&cnt="+cnt;
	
}
</script>
<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="BLS0104Form"
		enctype="multipart/form-data">
             	
            
            
            <div class="tab-content" >
            <input type="hidden" id="modflg" >
   <input type="hidden" id="modtyp" >
   <input type="hidden" id="savecheck" >
	 	<div class="activetab2 BLS0104" id="tab2" style="width: 968px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" id="equinvesh"><b><%=reptype %>-Amount Due To/From Subsidiaries,Associates And Companies Forming Part Of The Same  Group<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"> <b id="sub" style="display: none"></b></b></div> 
		<ul class="nav nav-tabs navright" id="mytab" style="    width: 100%;">
		
		  <li class=" pull-right list" id="li8" onclick="functionli(8);"><a href="#tab8" data-toggle="tab"><span
							class="headingtab">8</span></a></li>
		
		
		
		  <li class=" pull-right list" id="li7" onclick="functionli(7);"><a href="#tab7" data-toggle="tab"><span
							class="headingtab">7</span></a></li>
		
		  <li class=" pull-right list" id="li6" onclick="functionli(6);"><a href="#tab6" data-toggle="tab"><span
							class="headingtab">6</span></a></li>
		
		
		
		  <li class=" pull-right list" id="li5" onclick="functionli(5);"><a href="#tab5" data-toggle="tab"><span
							class="headingtab">5</span></a></li>
		
		
		
		  <li class=" pull-right list" id="li4" onclick="functionli(4);"><a href="#tab4" data-toggle="tab"><span
							class="headingtab">4</span></a></li>
		
		
		  <li class=" pull-right list" id="li3" onclick="functionli(3);"><a href="#tab3" data-toggle="tab"><span
							class="headingtab">3</span></a></li>
		

					<li class=" pull-right list" id="li2" onclick="functionli(2);"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" id="li1" onclick="functionli(1);" ><a href="#tab1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>


				</ul>	<table class="" id="tab2" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;">
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"/></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select>&nbsp;&nbsp;&nbsp;</td></tr>
          		  </table>
           	
            <table class="table tb1" id="tb1" style="width:100%;display:none;margin-top:-20px;">
          	<tr><th colspan="5" style="text-align:center;width: 100%" id="topposdeporesi"> Top five or more +ve changes in deposit held by residents</th>
                <tr><th rowspan="2"style="text-align:center;" id="srno"> Sr.No</th>
          		<th style="text-align:center;width: 100px;" id="namcou">Name of Customer</th>
          		<th style="text-align:center;width: 88px;"id="amt">Amount (Inclusive of accrued interest)</th>
          		<th style="text-align:center;width: 88px;"id="amtaccintr">Amount of Accrued interest</th>
          		<th rowspan="0"style="text-align:center">Select</th></tr>
          	
          	<tr>
          	<th  style="text-align:center;" id="a"> A</th>
          	<th  style="text-align:center;" id="b"> B</th>
          	<th style="text-align:center;" id="c"> C</th>	
          	</tr>
          <tbody id="sec1" class="databody"></tbody>
          </table>
          
          
            <table class="table tb2" id="tb2" style="width:100%;display:none;margin-top:-20px;">
          	<tr><th colspan="5" style="text-align:center;width: 100%" id="topnegdeporesi"> Top five or more -ve changes in deposit held by residents </th>
                <tr><th rowspan="2"style="text-align:center;" id="srno2"> Sr.No</th>
          		<th style="text-align:center;width: 100px;" id="namcou2">Name of Customer</th>
          		<th style="text-align:center;width: 88px;"id="amt2">Amount (Inclusive of accrued interest)</th>
          		<th style="text-align:center;width: 88px;"id="amtaccintr2">Amount of Accrued interest</th>
          		<th rowspan="0"style="text-align:center">Select</th></tr>
          	
          	<tr>
          	<th  style="text-align:center;" id="d"> D</th>
          	<th  style="text-align:center;" id="e"> E</th>
          	<th style="text-align:center;" id="f"> F</th>	
          	</tr>
          <tbody class="databody" id="sec2"></tbody>
          </table>
          
                            
            <table class="table tb3" id="tb3" style="width:100%;display:none;margin-top:-20px;">
          	<tr><th colspan="5" style="text-align:center;width: 100%" id=""> Top five or more +ve changes in credit extended to residents </th>
                <tr><th rowspan="2"style="text-align:center;" id="srno3"> Sr.No</th>
          		<th style="text-align:center;width: 100px;" id="namcou3">Name of Customer</th>
          		<th style="text-align:center;width: 88px;"id="amt3">Amount (Inclusive of accrued interest)</th>
          		<th style="text-align:center;width: 88px;"id="amtaccintr3">Amount of Accrued interest</th>
          		<th rowspan="0"style="text-align:center">Select</th></tr>
          	
          	<tr>
          	<th  style="text-align:center;" id="g"> G</th>
          	<th  style="text-align:center;" id="h"> H</th>
          	<th style="text-align:center;" id="i"> I</th>	
          	</tr>
          <tbody class="databody"id="sec3"></tbody>
          </table>
          
          
            <table class="table tb4" id="tb4" style="width:100%;display:none;margin-top:-20px;">
          	<tr><th colspan="5" style="text-align:center;width: 100%" id="">  Top five or more -ve changes in credit extended to residents </th>
                <tr><th rowspan="2"style="text-align:center;" id="srno4"> Sr.No</th>
          		<th style="text-align:center;width: 100px;" id="namcou4">Name of Customer</th>
          		<th style="text-align:center;width: 88px;"id="amt4">Amount (Inclusive of accrued interest)</th>
          		<th style="text-align:center;width: 88px;"id="amtaccintr4">Amount of Accrued interest</th>
          		<th rowspan="0"style="text-align:center">Select</th></tr>
          	
          	<tr>
          	<th  style="text-align:center;" id="j"> J</th>
          	<th  style="text-align:center;" id="k"> K</th>
          	<th style="text-align:center;" id="l"> L</th>	
          	</tr>
          <tbody class="databody"id="sec4"></tbody>
          </table>
          
           <table class="table tb5" id="tb5" style="width:100%;display:none;margin-top:-20px;">
          	<tr><th colspan="5" style="text-align:center;width: 100%" id=""> Top five or more +ve changes in deposit held by non-residents </th>
                <tr><th rowspan="2"style="text-align:center;" id="srno5"> Sr.No</th>
          		<th style="text-align:center;width: 100px;" id="namcou5">Name of Customer</th>
          		<th style="text-align:center;width: 88px;"id="amt5">Amount (Inclusive of accrued interest)</th>
          		<th style="text-align:center;width: 88px;"id="amtaccintr5">Amount of Accrued interest</th>
          		<th rowspan="0"style="text-align:center">Select</th></tr>
          	
          	<tr>
          	<th  style="text-align:center;" id="m"> M</th>
          	<th  style="text-align:center;" id="n"> N</th>
          	<th style="text-align:center;" id="o"> O</th>	
          	</tr>
          <tbody class="databody"id="sec5"></tbody>
          </table>
          
          <table class="table tb6" id="tb6" style="width:100%;display:none;margin-top:-20px;">
          	<tr><th colspan="5" style="text-align:center;width: 100%" id=""> Top five or more -ve changes in deposit held by non-residents </th>
                <tr><th rowspan="2"style="text-align:center;" id="srno6"> Sr.No</th>
          		<th style="text-align:center;width: 100px;" id="namcou6">Name of Customer</th>
          		<th style="text-align:center;width: 88px;"id="amt6">Amount (Inclusive of accrued interest)</th>
          		<th style="text-align:center;width: 88px;"id="amtaccintr6">Amount of Accrued interest</th>
          		<th rowspan="0"style="text-align:center">Select</th></tr>
          	
          	<tr>
          	<th  style="text-align:center;" id="p"> P</th>
          	<th  style="text-align:center;" id="q"> Q</th>
          	<th style="text-align:center;" id="r"> R</th>	
          	</tr>
          <tbody class="databody"id="sec6"></tbody>
          </table>
          
           
          <table class="table tb7" id="tb7" style="width:100%;display:none;margin-top:-20px;">
          	<tr><th colspan="5" style="text-align:center;width: 100%" id=""> Top five or more +ve changes in credit extended to non-residents </th>
                <tr><th rowspan="2"style="text-align:center;" id="srno7"> Sr.No</th>
          		<th style="text-align:center;width: 100px;" id="namcou7">Name of Customer</th>
          		<th style="text-align:center;width: 88px;"id="amt7">Amount (Inclusive of accrued interest)</th>
          		<th style="text-align:center;width: 88px;"id="amtaccintr7">Amount of Accrued interest</th>
          		<th rowspan="0"style="text-align:center">Select</th></tr>
          	
          	<tr>
          	<th  style="text-align:center;" id="s"> S </th>
          	<th  style="text-align:center;" id="t"> T</th>
          	<th style="text-align:center;" id="u"> U</th>	
          	</tr>
          <tbody class="databody"id="sec7"></tbody>
          </table>
          
          <table class="table tb8" id="tb8" style="width:100%;display:none;margin-top:-20px;">
          	<tr><th colspan="5" style="text-align:center;width: 100%" id="">  Top five or more -ve changes in credit extended to non-residents</th>
                <tr><th rowspan="2"style="text-align:center;" id="srno8"> Sr.No</th>
          		<th style="text-align:center;width: 100px;" id="namcou8">Name of Customer</th>
          		<th style="text-align:center;width: 88px;"id="amt8">Amount (Inclusive of accrued interest)</th>
          		<th style="text-align:center;width: 88px;"id="amtaccintr8">Amount of Accrued interest</th>
          		<th rowspan="0"style="text-align:center">Select</th></tr>
          	<tr>
          	<th  style="text-align:center;" id="s"> V </th>
          	<th  style="text-align:center;" id="t"> W</th>
          	<th style="text-align:center;" id="u"> X</th>	
          	</tr>
          <tbody class="databody"id="sec8"></tbody>
          </table>
          
      <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
<!--       <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button>
 -->    
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary"  value="Excel" id="btnXML">Gen XML Sum</button>
                 
<!--        <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button>
 -->      <button type="button" class="btn btn-xs btn-primary btnback" value="back" id="btnback">Back</button></div>
          
            </div>
          
          <!-- DETAIL TABLE -->
          
          <input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			 <div class="activetab1" id="tab1" style="width: 1500px;padding-top: 1px;margin-top: -17px;display:none" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b><%=reptype %>-Amount Due To/From Subsidiaries,Associates And Companies Forming Part Of The Same  Group		
<b id="sub"
					Style="display: none"></b></b></font>
			<br><br><b style="font-size: 13px;"> <b id="sub" style="display: none"></b></b></div> 
			<div id="divLoading"> 
    </div>
   
           <table class=""style="width: 100%;height:50px; 
           ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 530px;"> 
			 <font size="1"><input type="hidden"  style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"/></font></td><td style="text-align:center;background-color: #bbc3cb;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><!-- <a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a> -->
                    <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a>&nbsp;&nbsp;&nbsp;</td></tr>
          		  </table>
 
					 <div class="panel panel-primary filterable">
					 
					   <table class="table tb1" id="tb1" style="width:100%;display:none;margin-top:-20px;"><tr>			
         	 
 				<tr class="filters">
				    	 <th style="text-align:center;"><input type="text"  onkeyup="myFunction(this.id,0)" class="form-control2" id="cusid" style="width: 87px;text-align:center;"placeholder="Account Number"disabled> </th>				
						<th style="text-align:center;"><input type="text" onkeyup="myFunction(this.id,1)" class="form-control2" id="cusnam" style="width: 100px;text-align:center;" placeholder="Customer Id"disabled></th>
						<th style="text-align:center;"><input type="text" onkeyup="myFunction(this.id,2)" class="form-control2" id="cusgrp" style="width: 100px;text-align:center;" placeholder="Customer Name"disabled></th>
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction(this.id,3)" class="form-control2" id="cussugrp"  style="width: 50px;text-align:center;" placeholder="Non Resident Flag" disabled></th>
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction(this.id,4)" class="form-control2" id="isiccod" style="width: 120px;text-align:center;" placeholder="Account Currency Code" disabled></th>
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction(this.id,5)" class="form-control2" id="unicod" style="width: 120px;text-align:center;" placeholder="Balance On Last Month"disabled></th>
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction(this.id,6)" class="form-control2" id="exsutyp" style="width: 125px;text-align:center;" placeholder="Balance On Current Month"disabled></th>
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction(this.id,7)" class="form-control2" id="balamtac" style="width: 100px;text-align:center;" placeholder="Accured Interest"disabled></th>
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction(this.id,8)" class="form-control2" id="curcod" style="width: 100px;text-align:center;" placeholder="Account Type"disabled></th>	
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction(this.id,9)" class="form-control2" id="repdat" style="width: 100px;text-align:center;" placeholder="Report Date"disabled></th>

						<th style="text-align:center;width: 105px;" id="modify1">Modify</th>
											
					
					</tr>
					
				
				
					<tbody class="databody" id="det1">


 


              </tbody>
              
              
				</table>
				
				</div>
				
				
          
               <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
<!--       <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button>

      <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                
       <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button> -->
      <button type="button" class="btn btn-xs btn-primary btnback" value="back" id="btnback">Back</button></div>
          
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