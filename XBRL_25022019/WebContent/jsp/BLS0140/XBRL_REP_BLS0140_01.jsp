<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLFIM0100Bean,dao.XBRLFIM0100Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
    <%@ page import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat"%>
    
    
    
     
    
  <%--    <%
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
  	
  	<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="../Bootstrap/css/bootstrap.min.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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

.databody td{
border:1px solid #ddd;
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
	color:#a9a9a9;
	-webkit-text-fill-color: #333333;
	}
/* 
tr:hover td{
    background: #bebfb0 !important;
}

 */
.ui-dialog-titlebar-close {
    visibility: hidden;
}	
</style>


<%-- <script>
$(document).ready(function(){
	$("#sumfrst").click(function(){
		
		 location.href = "XBRL_REP_BLS0140_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		 });	
	
	$("#summaryfirst").click(function(){
		
		 location.href = "XBRL_REP_BLS0140_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
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
		 BLS0140Form.action = "fim0100EXCELREPORT.action?method=fim0100EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+document.getElementById("refdisplayFIM").innerHTML;
		 BLS0140Form.submit();
});
	
	
	
});	

</script>




<script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});


</script> --%>









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

 .ui-dialog-titlebar-close {
    visibility: hidden;
}
</style>



<script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});


var det={
	"repdate":'<%=dt2%>',"type":"chckmodified"
};
$.ajax({
	url:"BLS0140chckmodified",
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
			        	location.href = "XBRL_CRT_BLS0140_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
			        }
			      }
			    });
			
			
		}else{
			$("#modflg").val("N");
		}
	}
});

</script>

<script>
$(document).ready(function(){

	
	
	
	
	
	$("#btnfilter").on("click",function(){
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
			
			

			 $('#acnum,#acid,#deptyp,#depamt,#actcurcod,#cusnreflg,#repdat,#senum,#naminst,#accur,#fcamt').css({
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
			
			 $('#acnum,#acid,#deptyp,#depamt,#actcurcod,#cusnreflg,#repdat,#senum,#naminst,#accur,#fcamt').css({
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
			  
				 table = document.getElementById("det"+b);
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
  table = document.getElementById("det1");
  /* table = document.getElementById("pymdets2"); */

  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==0||b==1 ||b==3 || b==6){
		
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

   table = document.getElementById("det2");

  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==3 ){
		
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
var tabid=1;
function functionli(a){
	 $(".table").hide(); 
	$("#tb"+a).show();
	tabid=a;
	 btn=a;
	 $("#btnXML").hide();
if(a==1){
	$("#btnSave").hide();
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




var b=1;
function funli(a){

	
	b=a;

	$("#rownoadd").val(a);
	$(".table").hide();
	$("#detb"+a).show();
	
	if(a==1){
	
		$("#detb"+a).show();
		$("#btnpre").prop("disabled",true);
		 $("#btnnext").prop("disabled",false);
		 $("#li1").addClass("active");
		 $("#li2,#li3,#li4").removeClass("active");
	}else if(a==2){
		$("#btnpre").prop("disabled",false);
		 $("#btnnext").prop("disabled",true);
		 $("#li2").addClass("active");
		 $("#li1,#li3,#li4").removeClass("active");
	}

	
	
}

</script>

<script>

 $(window).load(function() {
	 
	    $(".loader").fadeOut("slow");
	});

$(document).ready(function(){
	$("#sumfirst").on("click",function(){
		
		location.href = "XBRL_REP_BLS0140_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
 	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>'); 
 
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_BLS0140_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( ".btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '.btnback').click(function() {
		 location.href="XBRL_CRT_BLS0140_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	$('#btnExcel').click(function() {
		
		 BLS0140Form.action = "BLS0140EXCELREPORT.action?method=BLS0140EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 BLS0140Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 BLS0140Form.action = "BLS0140EXCELSum.action?method=BLS0140EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 BLS0140Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 BLS0140Form.action = "BLS0140PDFREPORT.action?method=BLS0140PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 BLS0140Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  BLS0140Form.action = "XMLDOWNLOADb140.action?method=bls2xml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 BLS0140Form.submit(); 
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
	 					url:"saveSum140",
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
	 		 
				 $("#btnXML").prop("disabled",false);
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
	 				   		url:"saveSum140",
	 						data:datasum,
	 								dataType:'json',
	 								type:'POST',
	 								async:true,
	 								success:function(res){
	 									$("#divLoading").removeClass('show');
	 									alert("Saved Successfully");
	 									
	 									 $('#btnSave').css({
	 										
	 										'background-color': '#337ab7',
	 										
	 										'color':'white'
	 										
	 										}); 
	 							 
	 								}
	 							});  
	 				        			        
	 				  
	 				      },
	 				      Cancel: function() {
	 				          $( this ).dialog( "close" );
	 				          
	 				     	
								 $('#btnSave').css({
									
									'background-color': '#337ab7',
									
									'color':'white'
									
									}); 
						 
	 				        }
	 				      }
	 				
	 				    });
	 				
	 			}
	 	
	 	hh++;	
	  
	 });
	

	
	 $('#btnXML').click(function() {
		  bls0140Form.action = "XMLDOWNLOAD1.action?method=blsxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 bls0140Form.submit(); 
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
		

	if(b==1){
		
	
	$("#det"+b).prepend("<tr id='blsadd"+rowno+"'><td id='acnum_row"+rowno+"'><input type='text' id='acnum_text"+rowno+"' style='width: 100px;'></td><td id='acid_row"+rowno+"'><input type='text'  id='acid_text"+rowno+"' style='    width:107px;'></td><td id='deptyp_row"+rowno+"'><input type='text' id='deptyp_text"+rowno+"' style='     width: 80px;'></td><td class='sumder alnum' id='depamt_row"+rowno+"'><input type='text' 	id='depamt_text"+rowno+"' class='decimalPt roundUp'  style='    width: 142px;'></td><td id='actcurcod_row"+rowno+"'><input type='text' id='actcurcod_text"+rowno+"' style='    width: 100px;'></td><td id='cusnreflg_row"+rowno+"' ><input type='text'  id='cusnreflg_text"+rowno+"'   style='    width: 80px;'><td id='repdat_row"+rowno+"'><input type='text' id='repdat_text"+rowno+"' style='    width: 100px;'></td><td style='text-align:center;'><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')>  <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px;display:inline-block; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");
	}else{
		
		$("#det"+b).prepend("<tr id='blsadd"+rowno+"'><td><textarea type='text' placeholder='Auto Generated' style='-webkit-text-fill-color: black;width: 56px;word-wrap:break-word;border:1px solid;color: rgb(169, 169, 169);' disabled></textarea></td><td id='naminst_row"+rowno+"'><input type='text'  id='naminst_text"+rowno+"' style='    width:227px;'></td><td id='accur_row"+rowno+"'><input type='text' id='accur_text"+rowno+"' style='     width: 100px;'></td><td class='sumder alnum'  id='fcamt_row"+rowno+"'><input type='text' 	id='fcamt_text"+rowno+"' class='decimalPt roundUp' style='    width: 400px;'></td><td style='text-align:center;width:100px;'><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')>  <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px;display:inline-block; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");

	}
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
	$("#info").on("click",function(){
		$("#info").popover('show');
	});
	
function fnkeyup(a){
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
	$("#del_button"+no).addClass('hidden');
$(".add").attr("disabled",true);
$("#addrowno").val("0");
modtyp="M";	
document.getElementById("edit_button"+no).style.display="none";
document.getElementById("save_button"+no).style.display="inline-block";
document.getElementById("Cancel_btn"+no).style.display="inline-block";
document.getElementById("Cancel_button"+no).style.display="none";
	if(b==1){
var	depamt =  document.getElementById("depamt_row"+no);
var	depamt_data =depamt.innerHTML;
depamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='depamt_text"+no+"'  style='width: 83px'; value='"+depamt_data+"'>";

	}
	else
		{
		var	fcamt =  document.getElementById("fcamt_row"+no);
		var	fcamt_data = fcamt.innerHTML;
fcamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='fcamt_text"+no+"'  style='width: 83px'; value='"+fcamt_data+"'>";


		
		
		}




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
		
	if(b==1){
		if(document.getElementById("depamt_text"+no).value==""){
			alert("Deposit Amount ..");
			error="Y"
		}
	}
	else{
		
		if(document.getElementById("fcamt_text"+no).value==""){
			alert(" Amount of Foreign Currency..");
			error="Y"
		}
	}
		
	} else if (modtyp=="A") {
		
		
		if(b==1){

		if(document.getElementById("acnum_text"+no).value==""){
			alert("Enter Account Number ..");
			error="Y"
		}else if(document.getElementById("acid_text"+no).value==""){
			alert("Enter Account Id..");	
			error="Y"
		}else if(document.getElementById("deptyp_text"+no).value==""){
			alert("Enter Deposit Type ..");
			error="Y"
		}else if(document.getElementById("depamt_text"+no).value==""){
			alert("Enter Deposit Amount ..");
			error="Y"
		}
		else if(document.getElementById("actcurcod_text"+no).value==""){
			alert("Enter Account Currency Code ..");
			error="Y"
		}else if(document.getElementById("cusnreflg_text"+no).value==""){
			alert("Enter Customer NRE Flag ..");
			error="Y"
		}else if(document.getElementById("repdat_text"+no).value==""){
			alert("Enter Report Date ..");
			error="Y"
		}
		
		       }
		else{

			if(document.getElementById("naminst_text"+no).value==""){
				alert("Enter Name Of Instrument ..");
				error="Y"
			}else if(document.getElementById("accur_text"+no).value==""){
				alert("Enter Account Currency..");	
				error="Y"
			}else if(document.getElementById("fcamt_text"+no).value==""){
				alert("Enter Amount Of Foreign Currency ..");
				error="Y"
			}
		}
	}
	

if (error=="N"){

$("#modflg").val("Y");
modtyp="M";

if(b==1){
	document.getElementById("edit_button"+no).checked = false;
	var depamt_val=document.getElementById("depamt_text"+no).value;
	document.getElementById("depamt_row"+no).innerHTML=depamt_val;
}
else{
	document.getElementById("edit_button"+no).checked = false;
	var fcamt_val=document.getElementById("fcamt_text"+no).value;
	document.getElementById("fcamt_row"+no).innerHTML=fcamt_val;
	
}

if($("#addrowno").val()=="1"){
	modtyp="A";
	if(b==1){
	var  acnum_val=document.getElementById("acnum_text"+no).value;	 
	document.getElementById("acnum_row"+no).innerHTML=acnum_val;

	   var acid_val=document.getElementById("acid_text"+no).value;
	   document.getElementById("acid_row"+no).innerHTML=acid_val;
	   
	  var deptyp_val=document.getElementById("deptyp_text"+no).value;
	   document.getElementById("deptyp_row"+no).innerHTML=deptyp_val;
	  
	  
	  var actcurcod_val=document.getElementById("actcurcod_text"+no).value;	
	  document.getElementById("actcurcod_row"+no).innerHTML=actcurcod_val;
	 
	  var cusnreflg_val=document.getElementById("cusnreflg_text"+no).value;	
	  document.getElementById("cusnreflg_row"+no).innerHTML=cusnreflg_val;
	 
	  var repdat_val=document.getElementById("repdat_text"+no).value;	
	  document.getElementById("repdat_row"+no).innerHTML=repdat_val;
	}
	else{

		   var naminst_val=document.getElementById("naminst_text"+no).value;
		   document.getElementById("naminst_row"+no).innerHTML=naminst_val;
		   
		  var accur_val=document.getElementById("accur_text"+no).value;
		   document.getElementById("accur_row"+no).innerHTML=accur_val;
	}
}

	else{
		document.getElementById("Cancel_button"+no).style.display="inline-block";
		document.getElementById("Cancel_btn"+no).style.display="none";
	}

document.getElementById("edit_button"+no).style.display="inline-block";
document.getElementById("save_button"+no).style.display="none";
if(b==1){
var  acnum=document.getElementById("acnum_row"+no).innerHTML;
var  acid=document.getElementById("acid_row"+no).innerHTML;
var deptyp=document.getElementById("deptyp_row"+no).innerHTML;
var actcurcod=document.getElementById("actcurcod_row"+no).innerHTML;
var cusnreflg=document.getElementById("cusnreflg_row"+no).innerHTML;
var repdat=document.getElementById("repdat_row"+no).innerHTML;
var depamt=document.getElementById("depamt_row"+no).innerHTML;
}

else{
	
	 var naminst=document.getElementById("naminst_row"+no).innerHTML;
	  var accur=document.getElementById("accur_row"+no).innerHTML;
	  var fcamt=document.getElementById("fcamt_row"+no).innerHTML;
	
}
 
  $("#blsadd"+no).addClass("rowaddedd");

if(b==1){
var refeBLS140=document.getElementById("refDisplay").value;

depamt=depamt.replace(/\,/g,'')
depamt=Number(depamt)


	  var rptdate1 = {
	     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>',"reportrefno": refeBLS140, "acnum":acnum,"acid":acid,"deptyp" : deptyp,"depamt":depamt, "actcurcod":actcurcod,"cusnreflg":cusnreflg,"repdat":repdat,"modtyp":modtyp,"b":b
	};

$.ajax({
     url : "BLS0140",
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

else{
	
	var refeBLS140=document.getElementById("refDisplay").value;
	fcamt=fcamt.replace(/\,/g,'')
	  fcamt=Number(fcamt)

	 var rptdate1 = {
			    "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>' ,"reportrefno": refeBLS140,"astyp":"MISC_LIAB", "naminst":naminst,"accur" : accur,"fcamt":fcamt,"modtyp":modtyp,"b":b

					}; 
			 
			 $.ajax({
			     url : "BLS0140dt2",
			     data : rptdate1  ,
					dataType : 'json', 
					type : 'POST',
					async : true,
					 success : function(res) {
						 console.log(res.refno);
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

}

function savedel_row(no){
	
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
	        	if(b==1){
	        	var  acnum=document.getElementById("acnum_row"+no).innerHTML;
	        	var  acid=document.getElementById("acid_row"+no).innerHTML;
	        	var deptyp=document.getElementById("deptyp_row"+no).innerHTML;
	        	var actcurcod=document.getElementById("actcurcod_row"+no).innerHTML;
	        	var cusnreflg=document.getElementById("cusnreflg_row"+no).innerHTML;
	        	var repdat=document.getElementById("repdat_row"+no).innerHTML;
	        	var depamt=document.getElementById("depamt_row"+no).innerHTML;

	        	var refeBLS140=document.getElementById("refDisplay").value;
	        	depamt=depamt.replace(/\,/g,'')
	        	  depamt=Number(depamt)
	
	        	 var rptdate1 = {
	    						 "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>',"reportrefno": refeBLS140, "acnum":acnum,"acid":acid,"deptyp" : deptyp,"depamt":depamt, "actcurcod":actcurcod,"cusnreflg":cusnreflg,"repdat":repdat,"modtyp":modtyp
								}; 
	        	
	        	
			$.ajax({
					url : "BLS0140",
	    	     data : rptdate1  ,
	        			dataType : 'json', 
	        			type : 'POST',
	        			async : true,
	        			 success : function(res) {
	        				 console.log(res.refno);
	        				//	alert("refeDCG100"+refeDCG100);
	        				
	        				// alert("sfsdf");
	        				 $("#refDisplay").val(res.refno);
		  
	        				 $("#blsadd"+no).closest("tr").remove();

			   
	        				
	        			}
	        		});
	        	}
	        	
	        	
	        	else{
	        		
	        		 var naminst=document.getElementById("naminst_row"+no).innerHTML;
	        		  var accur=document.getElementById("accur_row"+no).innerHTML;
	        		  var fcamt=document.getElementById("fcamt_row"+no).innerHTML;

	        		  var refeBLS140=document.getElementById("refDisplay").value;
	        			fcamt=fcamt.replace(/\,/g,'')
	        			  fcamt=Number(fcamt)

	        			
		 var rptdate1 = {
			    "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>',"reportrefno": refeBLS140,"astyp":"MISC_LIAB", "naminst":naminst,"accur" : accur,"fcamt":fcamt,"modtyp":modtyp

					}; 
			 
			 $.ajax({
			     url : "BLS0140dt2",
			     data : rptdate1  ,
		        			dataType : 'json', 
		        			type : 'POST',
		        			async : true,
		        			 success : function(res) {
		        				 console.log(res.refno);
		        				//	alert("refeDCG100"+refeDCG100);
		        				
		        				// alert("sfsdf");
		        				 $("#refDisplay").val(res.refno);
			  
		        				 $("#blsadd"+no).closest("tr").remove();

				   
		        				
		        			}
		        		});
	        		
	        		
	        		
	        	}
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
	 
	
	 if(b==1){
		var detcancel={
				"acnum":$("#acnum_row"+no).text(),"tabid":b
		};
	 }
	 else
		 {
		
		 var detcancel={
					"naminst":$("#naminst_row"+no).text(),"tabid":b
			};
		 
		 }
		
		
		 $.ajax({
		     url : "BLS0140cancel",
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
		  
if(b==1){
			var depamt_val=document.getElementById("depamt_text"+no).value;
			document.getElementById("depamt_row"+no).innerHTML=depamt_val;
			
}
else{

	var fcamt_val=document.getElementById("fcamt_text"+no).value;
	document.getElementById("fcamt_row"+no).innerHTML=fcamt_val;
	
}
				$("#edit_button"+no).show();
				
				document.getElementById("save_button"+no).style.display="none";
				document.getElementById("Cancel_btn"+no).style.display="none";
	        	location.reload(true);
if(b==1){
				  var depamt_val=document.getElementById("depamt_row"+no).innerHTML;
}
else{
	var fcamt_val=document.getElementById("fcamt_row"+no).innerHTML;
	
}
				  if($("#blsadd"+no).hasClass( "rowaddedd" )){
					  
					  document.getElementById("Cancel_button"+no).style.display="inline-block";


				  }else{
					  document.getElementById("Cancel_button"+no).style.display="none";
				  }
		 }
		 
		 
function Canadd_row(no){
	 
	 


	 if($("#blsadd"+no).hasClass( "rowaddedd" )){
if(b==1){
		 var detcancel={
					"acnum":$("#acnum_row"+no).text(),"tabid":b
			};
}
else{
	
	 var detcancel={
			 	"naminst":$("#naminst_row"+no).text(),"tabid":b
		};
}

		 $.ajax({
		     url : "BLS0140cancel",
		     data : detcancel  ,
				dataType : 'json', 
				type : 'POST',
				async : true,
				 success : function(res) {

	         alert("Cancellation Successful");
				}
			});
	 }
	 $("#blsadd"+no).remove();
	 
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
	 $("#btnXML").hide();
	 $("#btnSave").hide();
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
				url : "BLS0140details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#pymdets tr").remove();
					 
					
					var b=JSON.parse(res.det1BLS0140);
					 console.log(b);
					 
						 	if(f=="onload"){
						 		$("#modify").show();
						 		$("#modify1").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		 // $("#pymdets").append("<tr><td id='applno"+srno+"'>"+b[i].applno+"</td><td id='applname"+srno+"'>"+b[i].aplcantname+"</td><td id='schmtyp"+srno+"'>"+b[i].schmtyp+"</td><td id='curr"+b[i].curr+"'></td><td id='outbal"+srno+"'>"+b[i].outstndingamt+"</td><td id='intrate"+srno+"'>"+b[i].intrate+"</td><td id='accopndate"+srno+"'>"+b[i].actopndate+"</td><td id='recvddate"+srno+"'>"+b[i].rcvddate+"</td><td id='appdate"+srno+"'>"+b[i].apprvddate+"</td><td id='rejctddate"+srno+"'>"+b[i].rejctdate+"</td><td id='rejreason"+srno+"'>"+b[i].rejctdreason+"</td><td><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>") ;  
						 		  
							
		                         $("#det1").append("<tr  id='blsadd"+cnt1+"'><td id='acnum_row"+cnt1+"'>"+b[i].acnum+"</td><td id='acid_row"+cnt1+"'>"+b[i].acid+"</td><td id='deptyp_row"+cnt1+"'>"+b[i].deptyp+"</td><td class='sumder alnum' id='depamt_row"+cnt1+"'>"+b[i].depamt+"</td><td id='actcurcod_row"+cnt1+"'>"+b[i].actcurcod+"</td><td id='cusnreflg_row"+cnt1+"'>"+b[i].cusnreflg+"</td><td id='repdat_row"+cnt1+"'>"+b[i].repdat+"</td><td style='text-align:center;'><input type='button' id='edit_button"+cnt1+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+cnt1+"')>  <input type='button' id='save_button"+cnt1+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+cnt1+"')><input type='button' id='Cancel_button"+cnt1+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+cnt1+"')><input type='button' id='Cancel_btn"+cnt1+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+cnt1+"')><input type='button' id='del_button"+cnt1+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+cnt1+"')> </td></tr>");
							
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
							
										$("#det1").append("<tr><td id='acnum_row"+cnt1+"'>"+b[i].acnum+"</td><td id='acid_row"+cnt1+"'>"+b[i].acid+"</td><td id='deptyp_row"+cnt1+"'>"+b[i].deptyp+"</td><td class='sumder alnum' id='depamt_row"+cnt1+"'>"+b[i].depamt+"</td><td id='actcurcod_row"+cnt1+"'>"+b[i].actcurcod+"</td><td id='cusnreflg_row"+cnt1+"'>"+b[i].cusnreflg+"</td><td id='repdat_row"+cnt1+"'>"+b[i].repdat+"</td></tr>");
								
							
								cnt1++;
								
							 
							
								
								 srno++;
								
								
									}
						 		 $("#divLoading").removeClass('show');
						 	}
							
							
						 $("#divLoading").removeClass('show'); 
						$('.alnum').mask("#,##0.00", {reverse: true}); 
					
						}
						

						
				
			});   
		
			 var pymd1 = {
						"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
					}; 
					
				$.ajax({
					url : "BLS0140details2",
					data : pymd1,
					dataType : 'json',
					type : 'POST',
					async : false,
					success : function(res) {	
					//	alert("refePYM100"+refePYM100);
						
						  $("#pymdets tr").remove();
						 
						
						var b=JSON.parse(res.det2BLS0140);
						 console.log(b);
						
							 	if(f=="onload"){
							 		$("#modify").show();
							 		$("#modify1").show();
							 		for(var i=0;i<b.length;i++){
							 			
							 		 // $("#pymdets").append("<tr><td id='applno"+srno+"'>"+b[i].applno+"</td><td id='applname"+srno+"'>"+b[i].aplcantname+"</td><td id='schmtyp"+srno+"'>"+b[i].schmtyp+"</td><td id='curr"+b[i].curr+"'></td><td id='outbal"+srno+"'>"+b[i].outstndingamt+"</td><td id='intrate"+srno+"'>"+b[i].intrate+"</td><td id='accopndate"+srno+"'>"+b[i].actopndate+"</td><td id='recvddate"+srno+"'>"+b[i].rcvddate+"</td><td id='appdate"+srno+"'>"+b[i].apprvddate+"</td><td id='rejctddate"+srno+"'>"+b[i].rejctdate+"</td><td id='rejreason"+srno+"'>"+b[i].rejctdreason+"</td><td><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>") ;  
							 		  $("#det2").append("<tr  id='blsadd"+cnt1+"'><td id='senum_row"+cnt1+"'>"+b[i].senum+"</td><td id='naminst_row"+cnt1+"'>"+b[i].naminst+"</td><td id='accur_row"+cnt1+"'>"+b[i].accur+"</td><td class='sumder alnum' id='fcamt_row"+cnt1+"'>"+b[i].fcamt+"</td><td style='text-align:center;'><input type='button' id='edit_button"+cnt1+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+cnt1+"')>  <input type='button' id='save_button"+cnt1+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+cnt1+"')><input type='button' id='Cancel_button"+cnt1+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+cnt1+"')><input type='button' id='Cancel_btn"+cnt1+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+cnt1+"')><input type='button' id='del_button"+cnt1+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+cnt1+"')> </td></tr>");
								
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
								
								 		  $("#det2").append("<tr><td id='senum"+cnt1+"'>"+b[i].senum+"</td><td id='naminst"+cnt1+"'>"+b[i].naminst+"</td><td id='"+cnt1+"accur'>"+b[i].accur+"</td><td class='sumder alnum' id='fcamt"+cnt1+"'>"+b[i].fcamt+"</td></tr>");
									
								
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
								  "dt1" : d,"dt2":e,"ReporefSeq":refno,"curr":g,"reptype":a
								}; 
						 
						 $.ajax({
						     url : "BLS0140SUM",
						     data : rptdate1  ,
								dataType : 'json', 
								type : 'POST',
								async : false,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							console.log(res.s1BLS0140);
						
							var b=JSON.parse(res.s1BLS0140);
							
							var k=1;
							
							
							for (var i = 0; i < b.length; i++) {
							
								$("#sec1").append("<tr><td id='instname"+cnt1+"'>"+b[i].instname+"</td><td id='instcode"+cnt1+"'>"+b[i].instcode+"</td><td class='sumder alnum' id='natcur"+cnt1+"'>"+b[i].natcur+"</td><td class='sumder alnum' id='frecur"+cnt1+"'>"+b[i].frecur+"</td><td class='sumder alnum' id='naticur"+cnt1+"'>"+b[i].naticur+"</td><td class='sumder alnum' id='freicur"+cnt1+"'>"+b[i].freicur+"</td><td style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads('1') id='edit"+cnt1+"'></td></tr>");
								
							srno++;
								cnt1++;
								
							} 
							
							
							  $("#divLoading").removeClass('show'); 
							 $('.alnum').mask("#,##0.00", {reverse: true});
							
								 }
								 }); 
						 var rptdate2 = {
								  "dt1" : d,"dt2":e,"ReporefSeq":refno,"curr":g,"reptype":a
								}; 
						 
						 $.ajax({
						     url : "BLS0140SUM1",
						     data : rptdate2  ,
								dataType : 'json', 
								type : 'POST',
								async : false,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							console.log(res.s2BLS0140);
						
							var b=JSON.parse(res.s2BLS0140);
							
							var k=1;
							
							for (var i = 0; i < b.length; i++) {
							
								$("#sec2").append("<tr><td >"+b[i].srno+"</td><td id='naminst"+cnt1+"'>"+b[i].naminst+"</td><td id='currency"+cnt1+"'>"+b[i].currency+"</td><td class='sumder alnum' id='frecuramt"+cnt1+"'>"+b[i].frecuramt+"</td><td class='sumder alnum' id='othacpaymcs"+cnt1+"'>"+b[i].othacpaymcs+"</td><td style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads('2') id='edit"+cnt1+"'></td></tr>");
								
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
			url:"savecheckbls0140",
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
	location.href = "XBRL_REP_BLS0140_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>'+"&cnt="+cnt;
	
}
</SCRIPT>
<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="BLS0140Form"
		enctype="multipart/form-data">
             
              <input type="hidden" id="savecheck">
		 <input type="hidden" id="modflg">
		 <input type="hidden" id="modtyp">
         <input type="hidden" id="rownoadd">   
            
            
            <div class="tab-content" >
	 	<div class="activetab2 BLS0140" id="" style="width: 968px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b><%=reptype%>-Other Accounts Payable Other-Miscellaneous Liability Items<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"> <b id="sub" style="display: none"></b></b></div> 
		 <ul class="nav nav-tabs navright" id="mytab" style="    width: 100%;">

					<li class=" pull-right list" id="li2" onclick="functionli(2);"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" id="li1" onclick="functionli(1);" ><a href="#tab1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>




				</ul>	 <table class="" id="tab2" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"><!--  <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font> -->
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select>&nbsp;&nbsp;&nbsp;</td></tr>
          		  </table>
			
            <table class="table tb1" id="tb1" style="width:100%;display:none;margin-top:-20px;"></th>		
          
        <tr><th rowspan="3" style="text-align:center; width: 92px;font" id="instname">Instance Name</th>
          	<th rowspan="3" style="text-align:center;width: 42px;" id="instcode">Instance Code</th>
          
         <th colspan="2"style="text-align:center;width: 92px;" id="res"><b>Resident	</b></th>
    	 <th colspan="2" style="text-align:center;width: 80px;"id="nonres"><b>Non Resident	</b></th>
    	 <th rowspan="3"style="text-align:center;width: 92px;">Select</th></tr>
          	
          <tr><th style="text-align:center; width: 80px;font" id="natcur"><b> In National Currency </b></th>
          <th style="text-align:center;width: 92px;" id="frecur"><b>In Foreign Currency (MUR equivalent)</b></th>
    	  <th style="text-align:center;width: 80px;""id="naticur"><b>In National Currency	</b></th>
    	 	<th style="text-align:center;width: 92px;" id="freicur"><b>In Foreign Currency (MUR equivalent)</b></th> 	</tr>
    	 	
       <tr><th rowspan="1"style="text-align:center; width:92px;font"><b> A </b></th>
           <th style="text-align:center;width: 92px;" ><b>B</b></th>
    	   <th style="text-align:center;width: 80px;"><b>C</b></th>
    	   <th style="text-align:center;width: 92px;"><b>D</b></th>
          	</tr>
          
          <tbody id="sec1" class="databody"></tbody>
          </table>
               
          
          
          <table class="table tb2" id="tb2" style="width:100%;display:none;margin-top:-20px;">
          <tr><th rowspan="2" style="text-align:center"id="srno">Sr.no</th>
          <th style="text-align:center" rowspan="1"id="naminst">Name Of Instruments</th>
          <th style="text-align:center" rowspan="1"id="currency">Currency</th>
          <th rowspan="1" style="text-align:center"id="frecuramt">Foreign Currency Amount</th> 
          <th rowspan="1" style="text-align:center"id="othacpaymcs">Other Accounts Payable Other-Miscellaneous liability Items -MUR Equivalent</th>
           <th rowspan="2"style="text-align:center;width: 88px;">Select</th> </tr>
       <!--    <tr><th style="text-align:center">Min</th><th style="text-align:center">Max</th></tr> -->
          <tr><th style="text-align:center">E</th><th style="text-align:center">F</th><th style="text-align:center">G</th><th style="text-align:center">H</th></tr>
          <tbody class="databody" id="sec2">  
          </tbody>  </table>
          
            <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
<!--       <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button>
 -->    
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary"  value="Excel"  id="btnXML">Gen XML Sum</button>
<!--                                   <button type="button" class="btn btn-xs btn-primary"  style="display:none;"   value="" id="dwndXML">Download XML </button>
 -->                 
<!--        <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button>
 -->      <button type="button" class="btn btn-xs btn-primary btnback" value="back" id="btnback">Back</button></div>
          
            </div>
          
          <!-- DETAIL TABLE -->
          
          <input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			 <div class="activetab1" id="tab1" style="width: 970px;padding-top: 1px;margin-top: -17px;display:none" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b><%=reptype%>-Other Accounts Payable Other-Miscellaneous liability Items		
<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"> <b id="sub" style="display: none"></b></b></div> 
			<div id="divLoading"> 
    </div>
    <ul class="nav nav-tabs navright" id="mytab" style="    width: 100%; ">

					<li class=" pull-right list" id="li2" onclick="funli(2);"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" id="li1" onclick="funli(1);" ><a href="#tab1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>




				</ul>
           <table class=""   style="width: 970px;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 579px;"> <!-- <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font> -->
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></font></td><td style="text-align:center;background-color: #bbc3cb;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a>
                    <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a>&nbsp;&nbsp;&nbsp;</td></tr>
          		  </table>
 
					 <div class="panel panel-primary filterable">
	
					   <table class="table tb1" id="detb1" style="width:100%;display:none;margin-top:-20px;">
	<tr class="filters">
<!-- 	<th style="text-align:center;font-size: 13px;text-align:center"id="senum"><b>Serial Number </b></th>
 -->	<th style="text-align:center;" ><textarea type="text"  style="text-align:center;width:100px" id="acnum"onkeyup="myFunction(this.id,0)" class="form-control2" placeholder="Account Number " disabled ></textarea></th>		
         <th style="text-align:center;" ><textarea type="text"  style="text-align:center;width:100px" id="acid"onkeyup="myFunction(this.id,1)" class="form-control2" placeholder="Account Id" disabled ></textarea></th>
         <th style="text-align:center;" ><textarea type="text"  style="text-align:center;width:100px"id="deptyp"onkeyup="myFunction(this.id,2)" class="form-control2" placeholder="Deposit Type" disabled></textarea></th>
         <th style="text-align:center;" ><textarea type="text"  style="text-align:center;width:100px" id="depamt"onkeyup="myFunction(this.id,3)" class="form-control2" placeholder="Deposit Amount" disabled></textarea></th>
          <th style="text-align:center;" ><textarea type="text"  style="text-align:center;width:100px"id="actcurcod"onkeyup="myFunction(this.id,4)" class="form-control2" placeholder="Account Currency Code" disabled></textarea></th>
          <th style="text-align:center;" ><textarea type="text"  style="text-align:center;width:100px" id="cusnreflg"onkeyup="myFunction(this.id,5)" class="form-control2" placeholder="Customer Nre Flag" disabled></textarea></th>
          <th style="text-align:center;" ><textarea type="text"  style="text-align:center;width:100px" id="repdat"onkeyup="myFunction(this.id,6)" class="form-control2" placeholder="Report Date" disabled></textarea></th>
  	<th style="text-align:center;"  id="modify">Select</th>
   </tr>  
   <tbody class="databody" id="det1">  
          </tbody>
           </table>
	
	
	 
          <table class="table tb2" id="detb2" style="width:100%;display:none;margin-top:-20px;">
	
	 <tr class="filters">
	 <th style="text-align:center;width:67px" ><textarea type="text"  style="text-align:center;width:67px" id="senum"onkeyup="myFunction1(this.id,0)" class="form-control2" placeholder="Srno" disabled></textarea></th>		
        <th style="text-align:center;width:100px" ><textarea type="text"  style="text-align:center;width:227px" id="naminst"onkeyup="myFunction1(this.id,1)" class="form-control2" placeholder="Name Of Instrument" disabled></textarea></th>
        <th style="text-align:center;width:100px" ><textarea type="text"   style="text-align:center;width:100px" id="accur"onkeyup="myFunction1(this.id,2)" class="form-control2" placeholder="Account Currency" disabled></textarea></th>
        <th style="text-align:center;width:400px" ><textarea type="text"   style="width: 400px;text-align:center;" id="fcamt"onkeyup="myFunction1(this.id,3)" class="form-control2" placeholder="Amount Of Foreign Currency" disabled></textarea></th>
   	<th style="text-align:center;width:100px;"  id="modify1">Select</th>
       
       </tr>   
       <tbody class="databody"  id="det2">  
          </tbody> 
           </table>
				
	
	
	
	</div>
	
	
	
	
         
                 <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
    <!--   <button type="button" class="btn btn-xs btn-primary" value="back" id="btnpre">Previous</button>
    
       <button type="button" class="btn btn-xs btn-primary" value="back" id="btnnext">Next</button> -->
      <button type="button" class="btn btn-xs btn-primary btnback" value="back" id="btnback">Back</button></div> 
            </div>
   
        
				
			
				</div>
			<!--   </div>	
		 -->		
				
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