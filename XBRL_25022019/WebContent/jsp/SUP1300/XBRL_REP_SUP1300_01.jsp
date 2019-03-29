<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLSUP1300Bean,dao.XBRLSUP1300Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
    <%@ page import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat"%>
    
    
    
     
    
    

	 
  <%//String RRID = request.getParameter("RRID");
 
 
 String rptdate = request.getParameter("rptdate");
 

 String dt2 = request.getParameter("dt2");
 String dt3 = request.getParameter("asonDate");
 String dt1 = request.getParameter("dt1");
 String reptype=request.getParameter("reptype");
 String curr=request.getParameter("curr");
 String instno=request.getParameter("instno");
 String typo=request.getParameter("typo");
 String types=request.getParameter("types");
 String ReporefSeq=request.getParameter("ReporefSeq");

 

  
 
 
 	
    %>
    
   
   <%
    DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Date date = new Date();
	
	String username = session.getAttribute("userName").toString();
    String curdate = dateFormat.format(date);
%>

    
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;url=../XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" /> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>XBRL REPORT</title>

<!-- Tell the browser to be responsive to screen width -->
 <link rel="stylesheet" href="../../css/bootstrap.min.css"> <!-- style page -->
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

  	<link rel="stylesheet" href="../../CSS/bootstrap-datepicker.css" />
</head>
<style>
.clr{
color: #0c0b0b;
    background-color: #f5f5f5;
    border-color: #f5f5f5;
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
	padding-right: 208px;
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
    padding: 1px 1px;
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
 .databody td{
border:1px solid #ddd;
}
.modal-footer {
	text-align: center;
	border-top: 0;
	padding: 25px;
	padding-right: 208px;
}
</style>


<script>
$(document).ready(function(){
	
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";

		
		});
	
	
	
	
	
	$( '#btnback').click(function() {
		 location.href="XBRL_CRT_SUP1300_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	
	
	<%--  $("#btnExcel").click(function(){ 
    	alert("HAOOO");
    	alert('<%=ReporefSeq%>');
    	alert('<%=dt1%>');
    	alert('<%=dt2%>');
		 //return false;
		 fim0100Form.action = "fim0100EXCELREPORT.action?method=fim0100EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+'<%=ReporefSeq%>';
		 fim0100Form.submit();
}); --%>
	
	
});	

</script>








<script>
 
 

 
 
function edit_row(no)

{
	
	//alert("srgklhsklgjshkghsldkghlskghlsdkgh");


  document.getElementById("edit_button"+no).style.display="none";
 document.getElementById("save_button"+no).style.display="block";
 
 
	
 var nadd	 =  document.getElementById("nadd_row"+no);
 var comnat	 =  document.getElementById("comnat_row"+no);	 
 var rsdet	 =  document.getElementById("rsdet_row"+no);
 var unrsdt	 =  document.getElementById("unrsdt_row"+no);

 
 
 var	nadd_data = nadd.innerHTML;
 var	comnat_data = comnat.innerHTML; 
 var	rsdet_data = rsdet.innerHTML;
 var	unrsdt_data = unrsdt.innerHTML;
 
 
  
 
 
 nadd.innerHTML="<input type='text'   id='nadd_text"+no+"'  style='width: 83px'; value='"+nadd_data+"'>";  
 comnat.innerHTML="<input type='text'   id='comnat_text"+no+"'  style='width: 83px'; value='"+comnat_data+"'>"; 
 rsdet.innerHTML="<input type='text'   id='rsdet_text"+no+"'  style='width: 83px'; value='"+rsdet_data+"'>"; 
 unrsdt.innerHTML="<input type='text'   id='unrsdt_text"+no+"'  style='width: 83px'; value='"+unrsdt_data+"'>";
 
 
 
 
	
 

 
 
}

function save_row(no)
{

	
	 //alert("dfh");
	
 var nadd_val=document.getElementById("nadd_text"+no).value;
 var comnat_val=document.getElementById("comnat_text"+no).value;	 
var rsdet_val=document.getElementById("rsdet_text"+no).value;
var unrsdt_val=document.getElementById("unrsdt_text"+no).value;


document.getElementById("nadd_row"+no).innerHTML=nadd_val;
document.getElementById("comnat_row"+no).innerHTML=comnat_val;
document.getElementById("rsdet_row"+no).innerHTML=rsdet_val;
document.getElementById("unrsdt_row"+no).innerHTML=unrsdt_val;



document.getElementById("edit_button"+no).style.display="block";
document.getElementById("save_button"+no).style.display="none";



	

var  sno =document.getElementById("sno_row"+no).innerHTML;
var  compdt =document.getElementById("compdt_row"+no).innerHTML;  
var  nadd =document.getElementById("nadd_row"+no).innerHTML;
var  comnat =document.getElementById("comnat_row"+no).innerHTML;
var  rsdet =document.getElementById("rsdet_row"+no).innerHTML;  
var  unrsdt =document.getElementById("unrsdt_row"+no).innerHTML;
var  del =document.getElementById("del_row"+no).innerHTML;
var  rcrid =document.getElementById("rcrid_row"+no).innerHTML;
var  rcttime =document.getElementById("rcttime_row"+no).innerHTML;
var  lchguid =document.getElementById("lchguid_row"+no).innerHTML;
var  lchtime =document.getElementById("lchtime_row"+no).innerHTML;
var  refe =document.getElementById("refdispSUP1300").innerHTML;

//alert("sno" + sno);
//alert("compdt" + compdt);
//alert("nadd" + nadd);
//alert("comnat" + comnat);
//alert("rsdet" + rsdet);
//alert("unrsdt" + unrsdt);
//alert("del" + del);
//alert("rcrid" + rcrid);
//alert("rcttime" + rcttime);
//alert("lchguid" + lchguid);
//alert("lchtime" + lchtime);
//alert("refe" + refe);




 var rptdate1 = {
	  "dt1" : '<%=dt1%>',"sno":sno, "reportrefno":refe,"compdt" : compdt,"nadd" : nadd,"comnat":comnat,"rsdet" : rsdet,"unrsdt" : unrsdt,"del" : del,"rcrid" : rcrid,"rcttime" : rcttime,"lchguid" : '<%=username%>',"lchtime" : lchtime
		}; 
 
 $.ajax({
     url : "SUP1300m",
     data : rptdate1,
		dataType : 'json', 
		type : 'POST',
		async : true,
		 success : function(res) {
			 console.log(res.reporefeno);
	//alert(res.reporefeno);
			
			 
		$("#refdispSUP1300").html(res.reporefeno) ;
		//alert("dgf"+$("#refdisplayFIM").html());
		
		
		if(refe == 0)
			{
			
			
			
			 $("#notification").fadeIn("slow").append("<strong>"+res.reporefeno+"</strong>"+" "+"Created Successfully");
			 $("#notification").fadeOut(2000);
			
			
			}
		else{
			
			$("#notification").empty();
			 $("#notification").fadeIn("slow").append("<strong>"+res.reporefeno+"</strong>"+" "+"Updated Successfully");
			 $("#notification").slideUp(2000);
			
		}
		
		
			
		}
	});


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
</style>

<%-- <script>
$(document).ready(function(){
		
	
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
		 fim0100Form.action = "fim0100EXCELREPORT.action?method=fim0100EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+document.getElementById("refdisplayFIM").innerHTML;
		 fim0100Form.submit();
});
	
	
	
});	

</script>

 --%>
<script>
function myFunction(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("test");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==1 || b==2){
		
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
			$(".tab-pane,#tbcates").hide();
			$(".active,#tbcate").show(); 
		$("#tab1").show();
		$("#tab2").hide();
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
			
			 $(".repdisp").text(refno);
			 var srno=1;
			
			 $("#divLoading").addClass("show");
			 
			 /*   $(".loader").fadeOut("slow"); */
				 var pymd = {
						"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
					}; 
					
				$.ajax({
					url : "SUP13details",
					data : pymd,
					dataType : 'json',
					type : 'POST',
					async : true,
					success : function(res) {	
					
						//alert("refePYM100"+dtlFIM0100);
						
						  $("#test tr").remove();
						 
						  
						var b=JSON.parse(res.dtlSUP1300);
						 console.log(b);
						
					
						 var cnt1=1;
						
							 	if(f=="onload"){
							 		
							 		$("#modify").show();
							 		for(var i=0;i<b.length;i++){
							 			
							 			if(i==0 ){
											$("#test").append('<tr><td id="mt'+cnt1+'"><B>SERVICES</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
											$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Accounts</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
											$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Savings Account Regular </B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
										}else if(i==15 ){
											$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Current Account Regular </B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
										}else if(i==18 ){
										
											$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Time deposit Account in local currency </B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
										}else if(i==20)	{
										
											$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Account Access Services </B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
											$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Interenet Banking </B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
										
										}else if(i==22){
											$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>ATM</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

									    }else if(i==28){
											$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Accounts Transactions or Services</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
											$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Local Funds Transfer / Internal Transfer</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
											$("#est").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>For credit to an account pertaining to the same customer</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

									    }else if(i==30){
										
										$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>For credit to an account not pertaining to the same customer</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==32){
										
										$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Local Funds Transfer / Domestic Transfer</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
										$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>To another bank on same day (MACCS)</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

									    }else if(i==34){
											$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>To another bank if it takes 2 or more days (MACCS)</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

									    }else if(i==36){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>International Funds Transfer </B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
											$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Telegraphic transfer</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==38){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Standing Instruction </B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
											$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Standing Instructions</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==42){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Direct Debit</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==45){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Debit Card</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==49){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Credit Card (Standard)</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==56){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Interest Rates</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==57){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Fixed deposits rate</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==64){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Reports</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;Fee for testimonial for educational / medical purpose</td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

									    }else if(i==66){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;Fee for testimonial for travel purpose </td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==71){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Financing</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Processing Fee</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==75){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Valuation Survey & Report Fee</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==77){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Site Inspection Fee</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==78){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Legal & Administration Fees</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==85){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Other Services</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==90){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Office Cheque/Bank Draft/Travellers Cheque</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==93){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Copies, photocopies & Duplicate Printouts</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==96){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Twenty year housing loan of Rs. 3 million</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;Interest Rate</td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

									    }else if(i==99){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;Monthly instalment</td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

									    }else if(i==106){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Twenty year housing loan of Rs. 1 million</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

									    }else if(i==106){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Twenty year housing loan of Rs. 1 million</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;Interest Rate</td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

									    }else if(i==109){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;Monthly instalment</td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    }else if(i==116){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Guarantees</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Performance bonds</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

									    }else if(i==118){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Tender bonds</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
										    
									    }else if(i==122){
									    	$("#test").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Shipping guarantees</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
										    
									    }
							 			

							 			
							 			
							 		  $("#test").append("<tr><td id='insname_row"+srno+"'>"+b[i].insname+"</td><td id='inscode_row"+srno+"'>"+b[i].inscode+"</td><td id='individuals_row"+srno+"'>"+b[i].individuals+"</td><td id='corporates_row"+srno+"'>"+b[i].corporates+"</td><td id='others_row"+srno+"'>"+b[i].others+"</td><td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>" ) ;  
							 		 
									
								 srno++;
									 cnt1++;
									 
									 
										} $("#divLoading").removeClass('show');
									$("#rowno").val(srno);
							 	}else if(f=="frmsum"){
							 		$(".add").hide();//add button hide
							 	
							 		$("#modify").hide();//modify in the header hide
							 		for(var i=0;i<b.length;i++){
							 			
							 	
												 
							 			 $("#test").append("<tr><td id='insname_row"+srno+"'>"+b[i].insname+"</td><td id='inscode_row"+srno+"'>"+b[i].inscode+"</td><td id='individuals_row"+srno+"'>"+b[i].individuals+"</td><td id='corporates_row"+srno+"'>"+b[i].corporates+"</td><td id='others_row"+srno+"'>"+b[i].others+"</td>"	
							 					
									 		 // $("#test").append("<tr><td>"+srno+"</td><td>"+b[i].institname+"</td><td>"+b[i].institcode+"</td></td>"	
									                    
									                     
									             
							                     
							                      
							                    +"</tr>" ) ;  
									
									/*  $("#chqamt_row"+srno+"").html(parseFloat(document.getElementById("chqamt_row"+srno+"").innerHTML).toFixed(2)); */
									
									 srno++;
									 
									 
									 
										}
							 		 $("#divLoading").removeClass('show');
							 	}
								
								
							 $("#divLoading").removeClass('show'); 
						/* 	$('.alnum').mask("#,##0.00", {reverse: true});  */
						
							}
							

							
					
				});   
	 }else{
		 //For summary
		 $(".summ").addClass("clr");
		 $("#divLoading").addClass('show');
		 //active,tab-pane for whole div
		 //tbcate,tbcates for table
		 $(".active,#tbcate").hide(); //tab1 or for details
			$(".tab-pane,#tbcates").show(); //tab2 or for summary
			$("#tab2").show();
			$("#tab1").hide();
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
			
			  $("#divLoading").addClass("show"); 
			  var srno=1;
			 $(".repdisp").text(refno);
			
				$("#sumtest tr").children().detach().remove();
			
				var rptdate1 = {
						"reptype" : a,"ReporefSeq" : refno,"dt2" : e,"dt1" :d,"curr":g  

						}; 
				 
				 $.ajax({
				     url : "SUP1300SUM",
				     data : rptdate1  ,
						dataType : 'json', 
						type : 'POST',
						async : true,
						 success : function(res) {
							 //console.log(res.refnoAB);
					
					console.log(res.summarySUP1300);
				
					var b=JSON.parse(res.summarySUP1300);
					
					var k=1;
					var cnt1=1;
					
					
					for (var i = 0; i < b.length; i++) {
					
					
							
							if(i==0 ){
								$("#sumtest").append('<tr><td id="mt'+cnt1+'"><B>SERVICES</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
								$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Accounts</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
								$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Savings Account Regular </B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
							}else if(i==15 ){
								$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Current Account Regular </B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
							}else if(i==18 ){
							
								$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Time deposit Account in local currency </B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
							}else if(i==20)	{
							
								$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Account Access Services </B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
								$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Interenet Banking </B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
							
							}else if(i==22){
								$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>ATM</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

						    }else if(i==28){
								$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Accounts Transactions or Services</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
								$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Local Funds Transfer / Internal Transfer</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
								$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>For credit to an account pertaining to the same customer</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

						    }else if(i==30){
							
							$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>For credit to an account not pertaining to the same customer</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==32){
							
							$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Local Funds Transfer / Domestic Transfer</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
							$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>To another bank on same day (MACCS)</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

						    }else if(i==34){
								$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>To another bank if it takes 2 or more days (MACCS)</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

						    }else if(i==36){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>International Funds Transfer </B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
								$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Telegraphic transfer</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==38){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Standing Instruction </B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
								$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Standing Instructions</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==42){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Direct Debit</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==45){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Debit Card</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==49){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Credit Card (Standard)</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==56){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Interest Rates</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==57){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Fixed deposits rate</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==64){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Reports</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;Fee for testimonial for educational / medical purpose</td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

						    }else if(i==66){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;Fee for testimonial for travel purpose </td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==71){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Financing</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Processing Fee</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==75){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Valuation Survey & Report Fee</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==77){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Site Inspection Fee</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==78){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Legal & Administration Fees</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==85){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Other Services</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==90){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Office Cheque/Bank Draft/Travellers Cheque</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==93){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Copies, photocopies & Duplicate Printouts</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==96){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Twenty year housing loan of Rs. 3 million</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;Interest Rate</td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

						    }else if(i==99){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;Monthly instalment</td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

						    }else if(i==106){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Twenty year housing loan of Rs. 1 million</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

						    }else if(i==106){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Twenty year housing loan of Rs. 1 million</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;Interest Rate</td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

						    }else if(i==109){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;Monthly instalment</td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    }else if(i==116){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;<B>Guarantees</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Performance bonds</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');

						    }else if(i==118){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Tender bonds</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
							    
						    }else if(i==122){
						    	$("#sumtest").append('<tr><td id="mt'+cnt1+'">&nbsp;&nbsp;&nbsp;&nbsp;<B>Shipping guarantees</B></td><td  id="it'+cnt1+'" ></td><td  id="it'+cnt1+'" ></td>><td id="ite'+cnt1+'" ></td><td id="ite'+cnt1+'" ></td><td></td><tr>');
							    
						    }
						
						
						
						
							
							
							
							
						$("#sumtest").append('<tr><td id="mt'+cnt1+'">'+b[i].insname+'</td><td  id="it'+cnt1+'" >'+b[i].inscode+'</td><td  id="it'+cnt1+'" >'+b[i].individuals+'</td>><td id="ite'+cnt1+'" >'+b[i].corporates+'</td><td id="ite'+cnt1+'" >'+b[i].others+'</td><td><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td><tr>');
					
					
				
						cnt1++;
						srno++;
						
					} 
					
					  $("#divLoading").removeClass('show'); 
					 
					
						 }
						 });	
	 }
}
function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_SUP1300_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</script>

<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	
	$("#addrowno").val("0");

	 fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>'); 
	 $("#sumfrst").click(function(){
			
		 location.href = "XBRL_REP_SUP1300_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		 });	
	
	$("#summaryfirst").click(function(){
		
		 location.href = "XBRL_REP_SUP1300_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		 });
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_SUP1300_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
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


$('#btnExcel').click(function() {
	
	 SUP1300Form.action = "SUP1300EXCELREPORT.action?method=SUP1300EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
	 SUP1300Form.submit();
});
$("#btndwnld").on("click",function(){
	if($("#dnloadfrmt").val()=="excel"){
		 SUP1300Form.action = "SUP1300EXCELSum.action?method=SUP1300EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 SUP1300Form.submit();
	}else if($("#dnloadfrmt").val()=="pdf"){
		 SUP1300Form.action = "SUP1300PDFREPORT.action?method=SUP1300PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 SUP1300Form.submit();
	}
});
$('#btnXML').click(function() {

	  SUP1300Form.action = "XMLDOWNLOADs13.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';

	  SUP1300Form.submit(); 
});
var save=0;

$('#btnSave').on("click",function() {

 var datasum={
		"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").text()
};
$.ajax({
	url:"saveSums13",
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
	$("#test").prepend("<tr><td ></td><td id='inscode_row"+rowno+"'><input type='text'  id='inscode_text"+rowno+"' style='    width:117px;'></td><td id='individuals_row"+rowno+"'><input type='text' id='individuals_text"+rowno+"' style='     width: 121px;'></td><td id='corporates_row"+rowno+"'><input type='text' 	id='corporates_text"+rowno+"' style='    width: 242px;'></td><td id='others_row"+rowno+"'><input type='text' id='others_text"+rowno+"' style='    width: 100px;'></td><td id='chqamt_row"+rowno+"' class='sumder alnum'><input type='text'  id='chqamt_text"+rowno+"'  class='decimalPt roundUp'  style='    width: 115px;'><td hidden id='rcrusrid_row"+rowno+"'></td><td hidden id='rcrtme_row"+rowno+"'></td><td hidden id='lchusrid_row"+rowno+"'></td><td hidden id='lchtme_row"+rowno+"'></td><td hidden id='del_row"+rowno+"'></td></td><td id='crncy_row"+rowno+"'><input type='text' id='crncy_text"+rowno+"' style='    width: 52px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");
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
	 	

	 

var	corporates =  document.getElementById("corporates_row"+no);

var	corporates_data = corporates.innerHTML;





corporates.innerHTML="<input type='text' class='decimalPt roundUp'  id='corporates_text"+no+"'  style='width: 83px'; value='"+corporates_data+"'>";




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
  

var corporates_val=document.getElementById("corporates_text"+no).value;
document.getElementById("corporates_row"+no).innerHTML=corporates_val;


if($("#addrowno").val()=="1"){
	
 /* var  insname_val=document.getElementById("insname_text"+no).value;	 
document.getElementById("insname_row"+no).innerHTML=insname_val;  */

   var inscode_val=document.getElementById("inscode_text"+no).value;
   document.getElementById("inscode_row"+no).innerHTML=inscode_val;
   
  var individuals_val=document.getElementById("individuals_text"+no).value;
   document.getElementById("individuals_row"+no).innerHTML=individuals_val;

   var others_val=document.getElementById("others_text"+no).value;
	document.getElementById("others_row"+no).innerHTML=others_val;
	 
  
 


}

document.getElementById("edit_button"+no).style.display="block";
document.getElementById("save_button"+no).style.display="none";

 /* var insname=document.getElementById("insname_row"+no).innerHTML;	 */
   var inscode=document.getElementById("inscode_row"+no).innerHTML;
  var individuals=document.getElementById("individuals_row"+no).innerHTML;
  var others=document.getElementById("others_row"+no).innerHTML;	
  var corporates=document.getElementById("corporates_row"+no).innerHTML;

 $("#det1 td").attr("padding","8px");

var refeSUP1300=document.getElementById("refDisplay").innerHTML;
/* corporates=corporates.replace(/\,/g,'')
  corporates=Number(corporates) */
  var rptdate1 = {
     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeSUP1300,"inscode":inscode,"individuals":individuals,"corporates":corporates,"others":others
}; 
$.ajax({
url : "SUP1300",
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

<body>


<div class="container">
 
   					 <div id="notification" style="display: none;"> 
 					</div>
  



<!--    <div class="loader"></div> -->
    
    <form class="form-horizontal" method="post" name="SUP1300Form"
		enctype="multipart/form-data">
    
   <div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
             
             
             <div class="active" id="tab2" style="width: 968px;padding-top: 1px;margin-top: -17px;" >
			<div style=" margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;"> SUP1300 -
 <b id="sub" style="display: none"></b></b><b>Statement of Complaints

<b id="sub"
					Style="display: none"></b></b></font>
			<br><br></div>
			<div id="divLoading"> 
    </div>
          <table class="table" style="width:968px;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:right;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab2"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab1" data-toggle="tab"><span class="headingtab" id="sumfrst">Summary </span></a><a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
 <!--  <div class="tab-content" >

			<div class="tab-pane active" id="tab1" style="width: 996px;padding-top: 1px;margin-left: -22px;">
			 -->
        
            
            
            <table class="table" id="tbcates" style=" width: 968px;margin-top: -20px;" border="1">
            
             <thead>
					
				 	
				 <tr class="filters">
					 <th id="srlno" rowspan="2" style="width: 373px;text-align: center;">Particulars

</th>
						<th id="rcptdate" rowspan="2" style="width: 59px;text-align: center;">


</th>
						<th id="namecmplnt" rowspan="1" style="width: 200px;text-align: center;">Individuals



</th>					
						<th id="adrscmplnt" rowspan="1" style="width: 200px;text-align: center;">Corporates



</th>		
						<th id="comnature" rowspan="1" style="width: 200px;text-align: center;">Others


</th>
<th rowspan="6" style="text-align: center"> Select</th>

						
						</tr>
			
					
				<tr>
					<th style="text-align: center"> A</th>
					<th style="text-align: center">B</th>
					<th style="text-align: center"> C</th>
					
					
					</tr>
				<!-- 	<tr></tr>
						<tr><th> SERVICES</th><th> </th><th> </th><th> </th><th> </th></tr>
							<tr><th> Accounts</th><th> </th><th> </th><th> </th><th> </th></tr>
							<tr><th> Savings Account Regular</th><th> </th><th> </th><th> </th><th> </th></tr> -->
							
				 
				<thead>
					
					<tbody class="databody" id="sumtest">

<%-- 
 <%
                
 
 
 if(list.isEmpty()){
 
 %>
 
 <td colspan="13" align="center" id="nodata" style="background-color: white;padding-left: 365px;">No
						Data Found</td>
 <%

 }else{
 
 int i = 1;
              
 
 
 Iterator<XBRLFIM0100Bean> itlist=list.iterator();
								while(itlist.hasNext()){
										
									XBRLFIM0100Bean xb=itlist.next();
					
									int k=i++;
									%>
									
				
				
				<tr  class="dta" id="row<%=k%>">
				
					<td  id="srl_row<%=k%>"><%=k%></td>
					<td  id="dyndomain_row<%=k%>"><%=xb.getDyndomain()%></td>
				     <td hidden  id="rptdate_row<%=k%>"><%=xb.getRptdate()%></td> 
					<td  id="institid_row<%=k%>"><%=xb.getInstitid()%></td>
					<td  id="tranid_row<%=k%>"><%=xb.getTranid()%></td>
					<td  id="institname_row<%=k%>"><%=xb.getInstitname()%></td>
					<td  id="trannature_row<%=k%>"><%=xb.getTrannature()%></td>					
					<td  class="institcode" id="institcode_row<%=k%>"><%=xb.getInstitcode()%></td>
					<td  class="trancycncy" id="tracrncy_row<%=k%>"><%=xb.getTrancrcny()%></td>
					<td  class="trantype" id="trantype_row<%=k%>"><%=xb.getTrantype()%></td>
					<td  class="sumder" id="individuals_row<%=k%>"><%=df.format(Integer.parseInt(xb.getindividuals()))%></td>
<td  class="calmny" id="trantype_row<%=k%>"><%=xb.getCalmny()%></td>
	<td  class="mnyshrtntc" id="trantype_row<%=k%>"><%=xb.getMnyshrtntc()%></td>
		<td  class="tmmny" id="trantype_row<%=k%>"><%=xb.getTmmny()%></td>
							<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
					<td  class="inststadate" id="inststadate_row<%=k%>"><%= xb.getIntstadate()%></td>
					<td  class="instenddate" id="instenddate_row<%=k%>"><%=xb.getIntenddate()%></td>
					
					
					<td   class="corporates" id="corporates_row<%=k%>"><%=df.format(Float.parseFloat(xb.getcorporates()))%></td>
					
				    <td hidden class="sumder" id="del_row<%=k%>"><%=xb.getDelflg()%></td>
					<td hidden class="sumder" id="rcrid_row<%=k%>"><%=xb.getRcrusrid()%></td>
					<td hidden class="sumder" id="rcttime_row<%=k%>"><%=xb.getRcrtime()%></td>
					<td hidden class="sumder" id="lchguid_row<%=k%>"><%=xb.getLchgusrid()%></td>
					<td hidden class="sumder" id="lchtime_row<%=k%>"><%=xb.getLchgtime()%></td>
					
					
					
					
				 <td> 
					
					<input type="button" id="edit_button<%=k%>" value="Edit" class="btn btn-xs btn-primary edit" onclick="edit_row('<%=k%>')" style="width: 37px;"> 
						
						
					
					<input type="button" id="save_button<%=k%>" value="Save" class="btn btn-xs btn-primary save"  style="width: 37px; display:none;" onclick="save_row('<%=k%>')">
						
					</td> 
					</tr>	
					
					



					
					 <%
									}
									
									
								}
                

              %>	 --%>
              </tbody>
				</table>
				
				
				
				
				<!-- <div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
                <button type="button" class="btn btn-xs btn-primary" id="btnExcel">Generate Excel</button>
                <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback"  >Back</button>
            </div>
  -->
				
   <!--   </div> -->
				
			
			
         
        <!-- </div> -->
   
				<div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
            <!--     <button type="button" class="btn btn-xs btn-primary" value="Excel" >Generate Excel</button> -->
                 <!-- <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnExcelSum">Gen Sum</button> -->
               <!--   <button type="button" class="btn btn-xs btn-primary" value="Pdf" id="btnPdf">Generate PDF</button> -->
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
                <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button>
            </div>
				
			  </div>	
				
				<div class="tab-pane" id="tab1" style="width:1200px ;padding-top: 1px;margin-top: -17px;">
<div style="  margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;">SUP1300 - <b id="sub" style="display: none"></b></b><b>Statement of Complaints
 <b id="sub"
					Style="display: none"></b></b></font>
			<br><br></div>
					
					 <div id="divLoading"> 
    </div>   <table class="table" style="width:   1200px;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:right;background-color: #bbc3cb;width: 325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab2"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab1" data-toggle="tab"><span class="headingtab" id="summaryfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><!-- <a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a> --><a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></td></tr>
          		  </table>
          		      <div class="panel panel-primary filterable">
          		  
          		  <table class="table" id="tbcate" border="1" style="width:100%;margin-top: -21px;">
            
             <thead>
					


					
				 <tr class="filters">
					  <th id="" rowspan="2" style="width: 373px;text-align: center;"><input  style="text-align:center;width: 373px;" type="text"id="ptclr" onkeyup="myFunction(this.id,0)"class="form-control2" placeholder="Particulars" disabled>

</th>
						<th id="" rowspan="2" style="width: 59px;text-align: center;"><input  style="text-align:center;width: 59px;" type="text"id="code" onkeyup="myFunction(this.id,1)"class="form-control2" placeholder="" disabled>


</th>
						<th id="" rowspan="1" style="width: 100px;text-align: center;"><input  style="text-align:center;width: 200px;" type="text"id="indvls" onkeyup="myFunction(this.id,2)"class="form-control2" placeholder="Individuals" disabled>



</th>					
						<th id="" rowspan="1" style="width: 100px;text-align: center;"><input  style="text-align:center;width: 200px;" type="text"id="crpts" onkeyup="myFunction(this.id,3)"class="form-control2" placeholder="Corporates" disabled>



</th>		
						<th id="" rowspan="1" style="width: 100px;text-align: center;"><input  style="text-align:center;width: 200px;" type="text"id="otrs" onkeyup="myFunction(this.id,4)"class="form-control2" placeholder="Others" disabled>


</th>
<th rowspan="6" style="text-align: center"> Select</th>

						
						</tr>
			
					
				<tr>
					<th style="text-align: center"> A</th>
					<th style="text-align: center">B</th>
					<th style="text-align: center"> C</th>
					
					
					</tr>
				</thead>
					
					<tbody class="databody" id="test">

            
					
              </tbody>
				</table>
				
</div>
		
					<!-- <table class="table" id="tbcates" border="1" style="margin-top: -21px;">
            
             <thead>
					


					 <tr class="filters">
					 
						<th id="modez" style="width: 264px;">Mode</th>
						<th id="noofitemsz" style="width: 322px;">No of Items</th>					
						<th id="amtz">Amount</th>		
						<th id="rad">Select</th>						
						
					</tr>
					
				</thead>
					
					<tbody class="databody" id="test">

            
					
              </tbody>
				</table>
				 -->
				

			</div>
			
            
            </div>
   
     
     </form>
    
    
</div>





</body>
</html>