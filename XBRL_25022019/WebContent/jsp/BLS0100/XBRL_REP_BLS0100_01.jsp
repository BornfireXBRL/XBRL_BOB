<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLBLS0100Bean,dao.XBRLBLS0100Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
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
 
/*  XBRLbls0100Dao dmd=new XBRLbls0100Dao(); */
 
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
    
   
 <%--  <%=rptdate %>
    <%=dt1 %>
      <%=dt2 %>
        <%=curr %>
          <%=typo %>
          <%=types %>
              <%=instno %>
              <%=ReporefSeq %>

     --%>
  
    
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
-webkit-text-fill-color: #333333;
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
	background: url('../../images/Loader.gif') 30% 30% no-repeat
		rgb(249, 249, 249);
	opacity: .8;
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
.databody td{
border:1px solid #ddd;
}

.ui-dialog-titlebar-close {
    visibility: hidden;
}	
/* 
tr:hover td{
    background: #bebfb0 !important;
}

 */

</style>
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
		 $("#tab1").show();
			$("#tab2").hide();
			$(".det").addClass("clr");
			funli(<%=request.getParameter("secid")%>);
		/* $("#tbcate").hide();
		$("#details").hide();
		 $("#pymdets tr").hide();
			$("#pymdets").hide(); */
		
		
	/* 	$(".psc0500,.psc0501").hide(); */
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
		 var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "bls0100details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
				  
					  $("#det1 tr").remove();
				  
					 
					//alert("inside the details ajax");
					var b=JSON.parse(res.detBLS0100);
					 console.log(b);
					
						 	if(f=="onload"){
						 		$("#modify").show();
						 		$("#modify1").show();	
						 		$("#modify2").show();	
						 		$("#modify3").show();
						 	$("#rmks").hide();
						 		
						 		for(var i=0;i<b.length;i++){
						 			$("#det1").append(
											 											
											
							 				 "<tr id='blsadd"+srno+"'>"
 						+"<td  id='accno_row"+srno+"'>"+b[i].accno+"</td>"
					  +"<td  id='acc_row"+srno+"'>"+b[i].accname+"</td>"
					  +"<td  id='custid_row"+srno+"'>"+b[i].custid+"</td>"
					  +"<td  id='glsh_row"+srno+"'>"+b[i].glshcode+"</td>"
					  +"<td  id='schmc_row"+srno+"'>"+b[i].schmcode+"</td>"
					  +"<td  id='schmt_row"+srno+"'>"+b[i].schmtyp+"</td>"
					  +"<td  id='accrycd_row"+srno+"'>"+b[i].accrycde+"</td>"
					  +"<td  id='baldt_row"+srno+"'>"+b[i].baldte+"</td>"
					  +"<td class='sumder alnum' id='bal_row"+srno+"'>"+b[i].balamt+"</td>"
					  
					  
					  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
					  
					 
	                     
                      
	                    +"</tr>" ) ; 
								 srno++;
								 cnt1++;
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 	
						 		$("#modify").hide();//modify in the header hide
						 		$("#modify1").hide();
						 		$("#modify2").hide();
						 		$("#modify3").hide();
						 		$("#rmks").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 			$("#det1").append(											
											
							 				 "<tr  id='blsadd"+srno+"'>"
				 +"<td  '"+srno+"'>"+b[i].rmks+"</td>" 
					+"<td  id='accno_row"+srno+"'>"+b[i].accno+"</td>"
					  +"<td  id='acc_row"+srno+"'>"+b[i].accname+"</td>"
					  +"<td  id='custid_row"+srno+"'>"+b[i].custid+"</td>"
					  +"<td  id='glsh_row"+srno+"'>"+b[i].glshcode+"</td>"
					  +"<td  id='schmc_row"+srno+"'>"+b[i].schmcode+"</td>"
					  +"<td  id='schmt_row"+srno+"'>"+b[i].schmtyp+"</td>"
					  +"<td  id='accrycd_row"+srno+"'>"+b[i].accrycde+"</td>"
					  +"<td  id='baldt_row"+srno+"'>"+b[i].baldte+"</td>"
					  +"<td class='sumder alnum' id='bal_row"+srno+"'>"+b[i].balamt+"</td>"
							 
					  //+"<td><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td>"	
	                    
	                     
                      
	                    +"</tr>" ) ; 
								
						 			srno++;
						 			cnt1++;
									}
						 		
						 		
						 		 $("#divLoading").removeClass('show');
						 	}
							
							
						 $("#divLoading").removeClass('show'); 
						$('.alnum').mask("#,##0.00", {reverse: true}); 
					
						}
						
				
			});  
			var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "bls01002details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
				  
					  //$("#det1 tr").remove();
				    $("#det2 tr").remove();
					 
					//alert("inside the details ajax");
					var b=JSON.parse(res.det2BLS0100);
					 console.log(b);
					
						 	if(f=="onload"){
						 		$("#modify").show();
						 		$("#rmks1").hide();
						 		for(var i=0;i<b.length;i++){
						 			$("#det2").append(
											 											
											
							 				 "<tr  id='blsadd"+srno+"'>"
							 				 
 						+"<td  id='accno_row"+srno+"'>"+b[i].accno+"</td>"
					  +"<td  id='acc_row"+srno+"'>"+b[i].accname+"</td>"
					  +"<td  id='custid_row"+srno+"'>"+b[i].custid+"</td>"
					  +"<td  id='glsh_row"+srno+"'>"+b[i].glshcode+"</td>"
					  +"<td  id='schmc_row"+srno+"'>"+b[i].schmcode+"</td>"
					  +"<td  id='schmt_row"+srno+"'>"+b[i].schmtyp+"</td>"
					  +"<td  id='accrycd_row"+srno+"'>"+b[i].accrycde+"</td>"
					  +"<td  id='baldt_row"+srno+"'>"+b[i].baldte+"</td>"
					  +"<td class='sumder alnum' id='bal_row"+srno+"'>"+b[i].balamt+"</td>"
					  
					  
					  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
					  
					  /*    +"<td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td>" */	
	                    
	                     
	                     
                      
	                    +"</tr>" ) ; 
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 	
						 		$("#modify").hide();//modify in the header hide
						 		$("#rmks1").show();
						 		
						 		
								  
						 		for(var i=0;i<b.length;i++){
						 			
						 			$("#det2").append(											
											
							 				 "<tr>"
						                  +"<td  '"+srno+"'>"+b[i].rmks+"</td>"
					+"<td  id='accno_row"+srno+"'>"+b[i].accno+"</td>"
					  +"<td  id='acc_row"+srno+"'>"+b[i].accname+"</td>"
					  +"<td  id='custid_row"+srno+"'>"+b[i].custid+"</td>"
					  +"<td  id='glsh_row"+srno+"'>"+b[i].glshcode+"</td>"
					  +"<td  id='schmc_row"+srno+"'>"+b[i].schmcode+"</td>"
					  +"<td  id='schmt_row"+srno+"'>"+b[i].schmtyp+"</td>"
					  +"<td  id='accrycd_row"+srno+"'>"+b[i].accrycde+"</td>"
					  +"<td  id='baldt_row"+srno+"'>"+b[i].baldte+"</td>"
					  +"<td class='sumder alnum' id='bal_row"+srno+"'>"+b[i].balamt+"</td>"
							 
					  //+"<td><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td>"	
	                    
	                     
                      
	                    +"</tr>" ) ; 
								
						 			srno++;
									}
						 		
						 		
						 		 $("#divLoading").removeClass('show');
						 	}
							
							
						 $("#divLoading").removeClass('show'); 
						$('.alnum').mask("#,##0.00", {reverse: true}); 
					
						}
						
				
			});  var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
			}; 
			
		$.ajax({
			url : "bls01003details",
			data : pymd,
			dataType : 'json',
			type : 'POST',
			async : false,
			success : function(res) {	
			//	alert("refePYM100"+refePYM100);
				
			  
				  $("#det3 tr").remove();
			  
				 
				//alert("inside the details ajax");
				var b=JSON.parse(res.det3BLS0100);
				 console.log(b);
				
					 	if(f=="onload"){
					 		$("#modify").show();
					 		$("#rmks2").hide();
					 		for(var i=0;i<b.length;i++){
					 			$("#det3").append(
										 											
										
						 				 "<tr  id='blsadd"+srno+"'>"
						+"<td  id='accno_row"+srno+"'>"+b[i].accno+"</td>"
				  +"<td  id='acc_row"+srno+"'>"+b[i].accname+"</td>"
				  +"<td  id='custid_row"+srno+"'>"+b[i].custid+"</td>"
				  +"<td  id='glsh_row"+srno+"'>"+b[i].glshcode+"</td>"
				  +"<td  id='schmc_row"+srno+"'>"+b[i].schmcode+"</td>"
				  +"<td  id='schmt_row"+srno+"'>"+b[i].schmtyp+"</td>"
				  +"<td  id='accrycd_row"+srno+"'>"+b[i].accrycde+"</td>"
				  +"<td  id='baldt_row"+srno+"'>"+b[i].baldte+"</td>"
				  +"<td class='sumder alnum' id='bal_row"+srno+"'>"+b[i].balamt+"</td>"
				  
				  
				  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
				  
				  /*    +"<td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td>" */	
                    
                     
                     
                  
                    +"</tr>" ) ; 
							 srno++;
							 
							
								}
							 $("#divLoading").removeClass('show');
							$("#rowno").val(srno);
					 	}else if(f=="frmsum"){
					 		$(".add").hide();//add button hide
					 	
					 		$("#modify").hide();//modify in the header hide
					 		
					 		$("#rmks2").show();
					 		
							  
					 		for(var i=0;i<b.length;i++){
					 			
					 			$("#det3").append(											
										
						 				 "<tr>"
					          +"<td  '"+srno+"'>"+b[i].rmks+"</td>"        
				+"<td  id='accno_row"+srno+"'>"+b[i].accno+"</td>"
				  +"<td  id='acc_row"+srno+"'>"+b[i].accname+"</td>"
				  +"<td  id='custid_row"+srno+"'>"+b[i].custid+"</td>"
				  +"<td  id='glsh_row"+srno+"'>"+b[i].glshcode+"</td>"
				  +"<td  id='schmc_row"+srno+"'>"+b[i].schmcode+"</td>"
				  +"<td  id='schmt_row"+srno+"'>"+b[i].schmtyp+"</td>"
				  +"<td  id='accrycd_row"+srno+"'>"+b[i].accrycde+"</td>"
				  +"<td  id='baldt_row"+srno+"'>"+b[i].baldte+"</td>"
				  +"<td class='sumder alnum' id='bal_row"+srno+"'>"+b[i].balamt+"</td>"
						 
				  //+"<td><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td>"	
                    
                     
                  
                    +"</tr>" ) ; 
							
					 			srno++;
								}
					 		
					 		
					 		 $("#divLoading").removeClass('show');
					 	}
						
						
					 $("#divLoading").removeClass('show'); 
					$('.alnum').mask("#,##0.00", {reverse: true}); 
				
					}
					
			
		});  var pymd = {
				"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
		}; 
		
	$.ajax({
		url : "bls01004details",
		data : pymd,
		dataType : 'json',
		type : 'POST',
		async : false,
		success : function(res) {	
		//	alert("refePYM100"+refePYM100);
			
		  
			  $("#det4 tr").remove();
		  
			 
			//alert("inside the details ajax");
			var b=JSON.parse(res.det4BLS0100);
			 console.log(b);
			
				 	if(f=="onload"){
				 		$("#modify").show();
				 		$("#rmks3").hide();
				 		for(var i=0;i<b.length;i++){
				 			$("#det4").append(
									 											
									
					 				 "<tr  id='blsadd"+srno+"'>"
					+"<td  id='accno_row"+srno+"'>"+b[i].accno+"</td>"
			  +"<td  id='acc_row"+srno+"'>"+b[i].accname+"</td>"
			  +"<td  id='custid_row"+srno+"'>"+b[i].custid+"</td>"
			  +"<td  id='glsh_row"+srno+"'>"+b[i].glshcode+"</td>"
			  +"<td  id='schmc_row"+srno+"'>"+b[i].schmcode+"</td>"
			  +"<td  id='schmt_row"+srno+"'>"+b[i].schmtyp+"</td>"
			  +"<td  id='accrycd_row"+srno+"'>"+b[i].accrycde+"</td>"
			  +"<td  id='baldt_row"+srno+"'>"+b[i].baldte+"</td>"
			  +"<td class='sumder alnum' id='bal_row"+srno+"'>"+b[i].balamt+"</td>"
			  
			  
			  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
			  
			  /*    +"<td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td>" */	
                
                 
                 
              
                +"</tr>" ) ; 
						 srno++;
						 
						
							}
						 $("#divLoading").removeClass('show');
						$("#rowno").val(srno);
				 	}else if(f=="frmsum"){
				 		$(".add").hide();//add button hide
				 	
				 		$("#modify").hide();//modify in the header hide
				 		
				 		$("#rmks3").show();
				 		
						  
				 		for(var i=0;i<b.length;i++){
				 			
				 			$("#det4").append(											
									
					 				 "<tr>"
				                  +"<td  '"+srno+"'>"+b[i].rmks+"</td>"
			+"<td  id='accno_row"+srno+"'>"+b[i].accno+"</td>"
			  +"<td  id='acc_row"+srno+"'>"+b[i].accname+"</td>"
			  +"<td  id='custid_row"+srno+"'>"+b[i].custid+"</td>"
			  +"<td  id='glsh_row"+srno+"'>"+b[i].glshcode+"</td>"
			  +"<td  id='schmc_row"+srno+"'>"+b[i].schmcode+"</td>"
			  +"<td  id='schmt_row"+srno+"'>"+b[i].schmtyp+"</td>"
			  +"<td  id='accrycd_row"+srno+"'>"+b[i].accrycde+"</td>"
			  +"<td  id='baldt_row"+srno+"'>"+b[i].baldte+"</td>"
			  +"<td class='sumder alnum' id='bal_row"+srno+"'>"+b[i].balamt+"</td>"
					 
			  //+"<td><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td>"	
                
                 
              
                +"</tr>" ) ; 
						
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
		
			
			//alert("inside the summary ajax");
			var refno=b;
			var ins=c;
				if(ins=="" || ins=="null" || ins==null ){
					ins=0;
				}else{
					ins=c;
				} 
				if(refno=="null" || refno==null || refno==""){
					refno=0;
				}
				
			 $("#divLoading").addClass("show"); 
				
				  
				 $(".repdisp").val(refno);
			
					
						$("#sec1 tr").children().detach().remove();
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "BLS0100sec1",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								var k=1;
								var cnt1=1;
								  $("#sec1 tr").remove();
								  
									
									 $("#det1 tr").hide();
									
										$("#det1").hide();
										$("#tbcate").hide();
								
								var b=JSON.parse(res.sec1BLS0100);
								 console.log(b);
								
								 
									 		for(var i=0;i<b.length;i++){
									 			
									 			if(i==0 ){
									 				$("#sec1").append('<tr ><td colspan=50 style="text-align:left;" id="mt'+cnt1+'"><B>ASSETS</B></td><tr>');
									 				$("#sec1").append('<tr><td  id="instaname_row'+cnt1+'"><b>'+b[i].instaname+'</b></td><td  id="instcode_row'+cnt1+'" colspan=49>'+b[i].instcode+'</td><tr>');
									 				
									 			}else if( i==6 || i==12 || i==18 || i==24  || i==30 || i==36 || i==42 || i==48 || i==54 || i==60  || i==66 || i==72 || i==78|| i==84|| i==90 || i==96 || i==102 || i==108 || i==114 || i==120 || i==126 ){
													$("#sec1").append('<tr><td  id="instaname_row'+cnt1+'"><b>'+b[i].instaname+'</b></td><td  id="instcode_row'+cnt1+'" colspan=49>'+b[i].instcode+'</td><tr>');
												} else{  
									 			 
									 		  $("#sec1").append("<tr>"
									 				  
									 				 +"<td  id='instaname_row"+cnt1+"'>"+b[i].instaname+"</td>"
									 				+"<td  id='instcode_row"+cnt1+"'>"+b[i].instcode+"</td>"
									 				+"<td class='sumder alnum' id='innccentlbank_row"+cnt1+"'>"+b[i].innccentlbank+"</td>"
									 				+"<td class='sumder alnum' id='inncbank_row"+cnt1+"'>"+b[i].inncbank+"</td>"
									 				+"<td class='sumder alnum' id='inncnobnkdeptakins_row"+cnt1+"'>"+b[i].inncnobnkdeptakins+"</td>"
									 				+"<td class='sumder alnum' id='innccredunio_row"+cnt1+"'>"+b[i].innccredunio+"</td>"
									 				+"<td class='sumder alnum' id='inncfingbc1s_row"+cnt1+"'>"+b[i].inncfingbc1s+"</td>"
									 				+"<td class='sumder alnum' id='innctrusnonsetnbeni_row"+cnt1+"'>"+b[i].innctrusnonsetnbeni+"</td>"
									 				+"<td class='sumder alnum' id='inncinsucorp_row"+cnt1+"'>"+b[i].inncinsucorp+"</td>"
									 				+"<td class='sumder alnum' id='inncpensifnd_row"+cnt1+"'>"+b[i].inncpensifnd+"</td>"
									 				+"<td class='sumder alnum' id='inncinvtfund_row"+cnt1+"'>"+b[i].inncinvtfund+"</td>"
									 				+"<td class='sumder alnum' id='inncholdcompan_row"+cnt1+"'>"+b[i].inncholdcompan+"</td>"
									 				+"<td class='sumder alnum' id='inncfinauxintme_row"+cnt1+"'>"+b[i].inncfinauxintme+"</td>"
									 				+"<td class='sumder alnum' id='innccntragovt_row"+cnt1+"'>"+b[i].innccntragovt+"</td>"
									 				+"<td class='sumder alnum' id='inncstatnlocgovt_row"+cnt1+"'>"+b[i].inncstatnlocgovt+"</td>"
									 				+"<td class='sumder alnum' id='inncnonfingbc1s_row"+cnt1+"'>"+b[i].inncnonfingbc1s+"</td>"
									 				+"<td class='sumder alnum' id='inncgbc2s_row"+cnt1+"'>"+b[i].inncgbc2s+"</td>"
									 				+"<td class='sumder alnum' id='inncpubnonfincorp_row"+cnt1+"'>"+b[i].inncpubnonfincorp+"</td>"
									 				+"<td class='sumder alnum' id='inncothrnonfincorp_row"+cnt1+"'>"+b[i].inncothrnonfincorp+"</td>"
									 				+"<td class='sumder alnum' id='innchoushold_row"+cnt1+"'>"+b[i].innchoushold+"</td>"
									 				+"<td class='sumder alnum' id='inncnonproinsereshouhld_row"+cnt1+"'>"+b[i].inncnonproinsereshouhld+"</td>"
									 				+"<td class='sumder alnum' id='inncaffilinonresi_row"+cnt1+"'>"+b[i].inncaffilinonresi+"</td>"
									 				+"<td class='sumder alnum' id='inncothrnonresi_row"+cnt1+"'>"+b[i].inncothrnonresi+"</td>"
									 				+"<td class='sumder alnum' id='innctotnaticrncy_row"+cnt1+"'>"+b[i].innctotnaticrncy+"</td>"
									 				+"<td class='sumder alnum' id='infccentlbank_row"+cnt1+"'>"+b[i].infccentlbank+"</td>"
									 				+"<td class='sumder alnum' id='infcbank_row"+cnt1+"'>"+b[i].infcbank+"</td>"
									 				+"<td class='sumder alnum' id='infcnobnkdeptakins_row"+cnt1+"'>"+b[i].infcnobnkdeptakins+"</td>"
									 				+"<td class='sumder alnum' id='infccredunio_row"+cnt1+"'>"+b[i].infccredunio+"</td>"
									 				+"<td class='sumder alnum' id='infcfingbc1s_row"+cnt1+"'>"+b[i].infcfingbc1s+"</td>"
									 				+"<td class='sumder alnum' id='infctrusnonsetnbeni_row"+cnt1+"'>"+b[i].infctrusnonsetnbeni+"</td>"
									 				+"<td class='sumder alnum' id='infcinsucorp_row"+cnt1+"'>"+b[i].infcinsucorp+"</td>"
									 				+"<td class='sumder alnum' id='infcpensifnd_row"+cnt1+"'>"+b[i].infcpensifnd+"</td>"
									 				+"<td class='sumder alnum' id='infcinvtfund_row"+cnt1+"'>"+b[i].infcinvtfund+"</td>"
									 				+"<td class='sumder alnum' id='infcholdcompan_row"+cnt1+"'>"+b[i].infcholdcompan+"</td>"
									 				+"<td class='sumder alnum' id='infcfinauxintme_row"+cnt1+"'>"+b[i].infcfinauxintme+"</td>"
									 				+"<td class='sumder alnum' id='infccntragovt_row"+cnt1+"'>"+b[i].infccntragovt+"</td>"
									 				+"<td class='sumder alnum' id='infcstatnlocgovt_row"+cnt1+"'>"+b[i].infcstatnlocgovt+"</td>"
									 				+"<td class='sumder alnum' id='infcnonfingbc1s_row"+cnt1+"'>"+b[i].infcnonfingbc1s+"</td>"
									 				+"<td class='sumder alnum' id='infcgbc2s_row"+cnt1+"'>"+b[i].infcgbc2s+"</td>"
									 				+"<td class='sumder alnum' id='infcpubnonfincorp_row"+cnt1+"'>"+b[i].infcpubnonfincorp+"</td>"
									 				+"<td class='sumder alnum' id='infcothrnonfincorp_row"+cnt1+"'>"+b[i].infcothrnonfincorp+"</td>"
									 				+"<td class='sumder alnum' id='infchoushold_row"+cnt1+"'>"+b[i].infchoushold+"</td>"
									 				+"<td class='sumder alnum' id='infcnonproinsereshouhld_row"+cnt1+"'>"+b[i].infcnonproinsereshouhld+"</td>"
									 				+"<td class='sumder alnum' id='infcaffilinonresibnk_row"+cnt1+"'>"+b[i].infcaffilinonresibnk+"</td>"
									 				+"<td class='sumder alnum' id='infcaffilinonresioth_row"+cnt1+"'>"+b[i].infcaffilinonresioth+"</td>"
									 				+"<td class='sumder alnum' id='infcothrnonresibnk_row"+cnt1+"'>"+b[i].infcothrnonresibnk+"</td>"
									 				+"<td class='sumder alnum' id='infcothrnonresioth_row"+cnt1+"'>"+b[i].infcothrnonresioth+"</td>"
									 				+"<td class='sumder alnum' id='infctotforeicrncy_row"+cnt1+"'>"+b[i].infctotforeicrncy+"</td>"
									 				+"<td class='sumder alnum' id='grandtotal_row"+cnt1+"'>"+b[i].grandtotal+"</td>"
									 				+"<td style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads("+b[i].instcode+") id='edit"+cnt1+"'></td>"	
									 	
						                    +"</tr>" ) ; 	
									
									 		 cnt1++; 
											
												}
									 			
									 		}
									 		  $("#divLoading").removeClass('show'); 
												 $('.alnum').mask("#,##0.00", {reverse: true});
												
									}
									

						});   	
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "BLS0100sec2",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								 var k=1;
									var cnt1=1;
									
								  $("#sec2 tr").remove();
								  
								
								
								var b=JSON.parse(res.sec1BLS0100s2);
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){

									 			if(i==0 ){
									 				$("#sec2").append('<tr ><td colspan=50 style="text-align:left;" id="mt'+cnt1+'"><B>LIABILITIES</B></td><tr>');
									 				$("#sec2").append('<tr><td  id="instaname_row'+cnt1+'"><b>'+b[i].instaname+'</b></td><td  id="instcode_row'+cnt1+'" colspan=49>'+b[i].instcode+'</td><tr>');
									 				
									 			}else if( i==6 || i==12 || i==18 || i==24  || i==30 || i==36 || i==42 || i==48 || i==54 || i==60  || i==66 || i==72 || i==78|| i==84|| i==90 || i==96 || i==102 || i==108 || i==114 || i==120 || i==126 || i==132 || i==138 || i==144 || i==150 || i==156  || i==162 || i==168 || i==174 || i==180 || i==186  ){
													$("#sec2").append('<tr><td  id="instaname_row'+cnt1+'"><b>'+b[i].instaname+'</b></td><td  id="instcode_row'+cnt1+'" colspan=49>'+b[i].instcode+'</td><tr>');
												} else{  
									 			
									 			
									 			
									 		  $("#sec2").append("<tr>"
									 				  
									 			    +"<td  id='instaname_row"+cnt1+"'>"+b[i].instaname+"</td>"
									 				+"<td  id='instcode_row"+cnt1+"'>"+b[i].instcode+"</td>"
									 				+"<td class='sumder alnum' id='innccentlbank_row"+cnt1+"'>"+b[i].innccentlbank+"</td>"
									 				+"<td class='sumder alnum' id='inncbank_row"+cnt1+"'>"+b[i].inncbank+"</td>"
									 				+"<td class='sumder alnum' id='inncnobnkdeptakins_row"+cnt1+"'>"+b[i].inncnobnkdeptakins+"</td>"
									 				+"<td class='sumder alnum' id='innccredunio_row"+cnt1+"'>"+b[i].innccredunio+"</td>"
									 				+"<td class='sumder alnum' id='inncfingbc1s_row"+cnt1+"'>"+b[i].inncfingbc1s+"</td>"
									 				+"<td class='sumder alnum' id='innctrusnonsetnbeni_row"+cnt1+"'>"+b[i].innctrusnonsetnbeni+"</td>"
									 				+"<td class='sumder alnum' id='inncinsucorp_row"+cnt1+"'>"+b[i].inncinsucorp+"</td>"
									 				+"<td class='sumder alnum' id='inncpensifnd_row"+cnt1+"'>"+b[i].inncpensifnd+"</td>"
									 				+"<td class='sumder alnum' id='inncinvtfund_row"+cnt1+"'>"+b[i].inncinvtfund+"</td>"
									 				+"<td class='sumder alnum' id='inncholdcompan_row"+cnt1+"'>"+b[i].inncholdcompan+"</td>"
									 				+"<td class='sumder alnum' id='inncfinauxintme_row"+cnt1+"'>"+b[i].inncfinauxintme+"</td>"
									 				+"<td class='sumder alnum' id='innccntragovt_row"+cnt1+"'>"+b[i].innccntragovt+"</td>"
									 				+"<td class='sumder alnum' id='inncstatnlocgovt_row"+cnt1+"'>"+b[i].inncstatnlocgovt+"</td>"
									 				+"<td class='sumder alnum' id='inncnonfingbc1s_row"+cnt1+"'>"+b[i].inncnonfingbc1s+"</td>"
									 				+"<td class='sumder alnum' id='inncgbc2s_row"+cnt1+"'>"+b[i].inncgbc2s+"</td>"
									 				+"<td class='sumder alnum' id='inncpubnonfincorp_row"+cnt1+"'>"+b[i].inncpubnonfincorp+"</td>"
									 				+"<td class='sumder alnum' id='inncothrnonfincorp_row"+cnt1+"'>"+b[i].inncothrnonfincorp+"</td>"
									 				+"<td class='sumder alnum' id='innchoushold_row"+cnt1+"'>"+b[i].innchoushold+"</td>"
									 				+"<td class='sumder alnum' id='inncnonproinsereshouhld_row"+cnt1+"'>"+b[i].inncnonproinsereshouhld+"</td>"
									 				+"<td class='sumder alnum' id='inncaffilinonresi_row"+cnt1+"'>"+b[i].inncaffilinonresi+"</td>"
									 				+"<td class='sumder alnum' id='inncothrnonresi_row"+cnt1+"'>"+b[i].inncothrnonresi+"</td>"
									 				+"<td class='sumder alnum' id='innctotnaticrncy_row"+cnt1+"'>"+b[i].innctotnaticrncy+"</td>"
									 				+"<td class='sumder alnum' id='infccentlbank_row"+cnt1+"'>"+b[i].infccentlbank+"</td>"
									 				+"<td class='sumder alnum' id='infcbank_row"+cnt1+"'>"+b[i].infcbank+"</td>"
									 				+"<td class='sumder alnum' id='infcnobnkdeptakins_row"+cnt1+"'>"+b[i].infcnobnkdeptakins+"</td>"
									 				+"<td class='sumder alnum' id='infccredunio_row"+cnt1+"'>"+b[i].infccredunio+"</td>"
									 				+"<td class='sumder alnum' id='infcfingbc1s_row"+cnt1+"'>"+b[i].infcfingbc1s+"</td>"
									 				+"<td class='sumder alnum' id='infctrusnonsetnbeni_row"+cnt1+"'>"+b[i].infctrusnonsetnbeni+"</td>"
									 				+"<td class='sumder alnum' id='infcinsucorp_row"+cnt1+"'>"+b[i].infcinsucorp+"</td>"
									 				+"<td class='sumder alnum' id='infcpensifnd_row"+cnt1+"'>"+b[i].infcpensifnd+"</td>"
									 				+"<td class='sumder alnum' id='infcinvtfund_row"+cnt1+"'>"+b[i].infcinvtfund+"</td>"
									 				+"<td class='sumder alnum' id='infcholdcompan_row"+cnt1+"'>"+b[i].infcholdcompan+"</td>"
									 				+"<td class='sumder alnum' id='infcfinauxintme_row"+cnt1+"'>"+b[i].infcfinauxintme+"</td>"
									 				+"<td class='sumder alnum' id='infccntragovt_row"+cnt1+"'>"+b[i].infccntragovt+"</td>"
									 				+"<td class='sumder alnum' id='infcstatnlocgovt_row"+cnt1+"'>"+b[i].infcstatnlocgovt+"</td>"
									 				+"<td class='sumder alnum' id='infcnonfingbc1s_row"+cnt1+"'>"+b[i].infcnonfingbc1s+"</td>"
									 				+"<td class='sumder alnum' id='infcgbc2s_row"+cnt1+"'>"+b[i].infcgbc2s+"</td>"
									 				+"<td class='sumder alnum' id='infcpubnonfincorp_row"+cnt1+"'>"+b[i].infcpubnonfincorp+"</td>"
									 				+"<td class='sumder alnum' id='infcothrnonfincorp_row"+cnt1+"'>"+b[i].infcothrnonfincorp+"</td>"
									 				+"<td class='sumder alnum' id='infchoushold_row"+cnt1+"'>"+b[i].infchoushold+"</td>"
									 				+"<td class='sumder alnum' id='infcnonproinsereshouhld_row"+cnt1+"'>"+b[i].infcnonproinsereshouhld+"</td>"
									 				+"<td class='sumder alnum' id='infcaffilinonresibnk_row"+cnt1+"'>"+b[i].infcaffilinonresibnk+"</td>"
									 				+"<td class='sumder alnum' id='infcaffilinonresioth_row"+cnt1+"'>"+b[i].infcaffilinonresioth+"</td>"
									 				+"<td class='sumder alnum' id='infcothrnonresibnk_row"+cnt1+"'>"+b[i].infcothrnonresibnk+"</td>"
									 				+"<td class='sumder alnum' id='infcothrnonresioth_row"+cnt1+"'>"+b[i].infcothrnonresioth+"</td>"
									 				+"<td class='sumder alnum' id='infctotforeicrncy_row"+cnt1+"'>"+b[i].infctotforeicrncy+"</td>"
									 				+"<td class='sumder alnum' id='grandtotal_row"+cnt1+"'>"+b[i].grandtotal+"</td>"
									 				+"<td style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads("+b[i].instcode+") id='edit"+cnt1+"'></td>"	
									 		  
        						                     
								                      
								                    +"</tr>" ) ; 	
									 		 cnt1++;
											
												}
										
									 		}
									 		
							
							}
						
									

						});   
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "BLS0100sec3",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
								var k=1;
								var cnt1=1;
								
								  $("#sec3 tr").remove();
								 
								$("#det1 tr").hide();
								$("#det1").hide();
								$("#tbcate").hide();
								var b=JSON.parse(res.sec1BLS0100s3);
								 console.log(b);
								
									//alert("res.sec1bls0100s3"+res.sec1bls0100s3);
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 			if(i==0 ){
									 				$("#sec3").append('<tr ><td colspan=50 style="text-align:left;" id="mt'+cnt1+'"><B>ASSETS</B></td><tr>');
									 				$("#sec3").append('<tr><td  id="instaname_row'+cnt1+'"><b>'+b[i].instaname+'</b></td><td  id="instcode_row'+cnt1+'" colspan=49>'+b[i].instcode+'</td><tr>');
									 				
									 			}else if( i==6 || i==12 || i==18 || i==24  || i==30 || i==36 || i==42 || i==48 || i==61 || i==66 || i==68 || i==74 || i==81 ){
													$("#sec3").append('<tr><td  id="instaname_row'+cnt1+'"><b>'+b[i].instaname+'</b></td><td  id="instcode_row'+cnt1+'" colspan=49>'+b[i].instcode+'</td><tr>');
												} else{
									 			
									 			
									 			
									 		  $("#sec3").append("<tr>"
									 				  
									 				 +"<td  id='instaname_row"+cnt1+"'>"+b[i].instaname+"</td>"
									 				+"<td  id='instcode_row"+cnt1+"'>"+b[i].instcode+"</td>"
									 				+"<td class='sumder alnum' id='innccentlbank_row"+cnt1+"'>"+b[i].innccentlbank+"</td>"
									 				+"<td class='sumder alnum' id='inncbank_row"+cnt1+"'>"+b[i].inncbank+"</td>"
									 				+"<td class='sumder alnum' id='inncnobnkdeptakins_row"+cnt1+"'>"+b[i].inncnobnkdeptakins+"</td>"
									 				+"<td class='sumder alnum' id='innccredunio_row"+cnt1+"'>"+b[i].innccredunio+"</td>"
									 				+"<td class='sumder alnum' id='inncfingbc1s_row"+cnt1+"'>"+b[i].inncfingbc1s+"</td>"
									 				+"<td class='sumder alnum' id='innctrusnonsetnbeni_row"+cnt1+"'>"+b[i].innctrusnonsetnbeni+"</td>"
									 				+"<td class='sumder alnum' id='inncinsucorp_row"+cnt1+"'>"+b[i].inncinsucorp+"</td>"
									 				+"<td class='sumder alnum' id='inncpensifnd_row"+cnt1+"'>"+b[i].inncpensifnd+"</td>"
									 				+"<td class='sumder alnum' id='inncinvtfund_row"+cnt1+"'>"+b[i].inncinvtfund+"</td>"
									 				+"<td class='sumder alnum' id='inncholdcompan_row"+cnt1+"'>"+b[i].inncholdcompan+"</td>"
									 				+"<td class='sumder alnum' id='inncfinauxintme_row"+cnt1+"'>"+b[i].inncfinauxintme+"</td>"
									 				+"<td class='sumder alnum' id='innccntragovt_row"+cnt1+"'>"+b[i].innccntragovt+"</td>"
									 				+"<td class='sumder alnum' id='inncstatnlocgovt_row"+cnt1+"'>"+b[i].inncstatnlocgovt+"</td>"
									 				+"<td class='sumder alnum' id='inncnonfingbc1s_row"+cnt1+"'>"+b[i].inncnonfingbc1s+"</td>"
									 				+"<td class='sumder alnum' id='inncgbc2s_row"+cnt1+"'>"+b[i].inncgbc2s+"</td>"
									 				+"<td class='sumder alnum' id='inncpubnonfincorp_row"+cnt1+"'>"+b[i].inncpubnonfincorp+"</td>"
									 				+"<td class='sumder alnum' id='inncothrnonfincorp_row"+cnt1+"'>"+b[i].inncothrnonfincorp+"</td>"
									 				+"<td class='sumder alnum' id='innchoushold_row"+cnt1+"'>"+b[i].innchoushold+"</td>"
									 				+"<td class='sumder alnum' id='inncnonproinsereshouhld_row"+cnt1+"'>"+b[i].inncnonproinsereshouhld+"</td>"
									 				+"<td class='sumder alnum' id='inncaffilinonresi_row"+cnt1+"'>"+b[i].inncaffilinonresi+"</td>"
									 				+"<td class='sumder alnum' id='inncothrnonresi_row"+cnt1+"'>"+b[i].inncothrnonresi+"</td>"
									 				+"<td class='sumder alnum' id='innctotnaticrncy_row"+cnt1+"'>"+b[i].innctotnaticrncy+"</td>"
									 				+"<td class='sumder alnum' id='infccentlbank_row"+cnt1+"'>"+b[i].infccentlbank+"</td>"
									 				+"<td class='sumder alnum' id='infcbank_row"+cnt1+"'>"+b[i].infcbank+"</td>"
									 				+"<td class='sumder alnum' id='infcnobnkdeptakins_row"+cnt1+"'>"+b[i].infcnobnkdeptakins+"</td>"
									 				+"<td class='sumder alnum' id='infccredunio_row"+cnt1+"'>"+b[i].infccredunio+"</td>"
									 				+"<td class='sumder alnum' id='infcfingbc1s_row"+cnt1+"'>"+b[i].infcfingbc1s+"</td>"
									 				+"<td class='sumder alnum' id='infctrusnonsetnbeni_row"+cnt1+"'>"+b[i].infctrusnonsetnbeni+"</td>"
									 				+"<td class='sumder alnum' id='infcinsucorp_row"+cnt1+"'>"+b[i].infcinsucorp+"</td>"
									 				+"<td class='sumder alnum' id='infcpensifnd_row"+cnt1+"'>"+b[i].infcpensifnd+"</td>"
									 				+"<td class='sumder alnum' id='infcinvtfund_row"+cnt1+"'>"+b[i].infcinvtfund+"</td>"
									 				+"<td class='sumder alnum' id='infcholdcompan_row"+cnt1+"'>"+b[i].infcholdcompan+"</td>"
									 				+"<td class='sumder alnum' id='infcfinauxintme_row"+cnt1+"'>"+b[i].infcfinauxintme+"</td>"
									 				+"<td class='sumder alnum' id='infccntragovt_row"+cnt1+"'>"+b[i].infccntragovt+"</td>"
									 				+"<td class='sumder alnum' id='infcstatnlocgovt_row"+cnt1+"'>"+b[i].infcstatnlocgovt+"</td>"
									 				+"<td class='sumder alnum' id='infcnonfingbc1s_row"+cnt1+"'>"+b[i].infcnonfingbc1s+"</td>"
									 				+"<td class='sumder alnum' id='infcgbc2s_row"+cnt1+"'>"+b[i].infcgbc2s+"</td>"
									 				+"<td class='sumder alnum' id='infcpubnonfincorp_row"+cnt1+"'>"+b[i].infcpubnonfincorp+"</td>"
									 				+"<td class='sumder alnum' id='infcothrnonfincorp_row"+cnt1+"'>"+b[i].infcothrnonfincorp+"</td>"
									 				+"<td class='sumder alnum' id='infchoushold_row"+cnt1+"'>"+b[i].infchoushold+"</td>"
									 				+"<td class='sumder alnum' id='infcnonproinsereshouhld_row"+cnt1+"'>"+b[i].infcnonproinsereshouhld+"</td>"
									 				+"<td class='sumder alnum' id='infcaffilinonresibnk_row"+cnt1+"'>"+b[i].infcaffilinonresibnk+"</td>"
									 				+"<td class='sumder alnum' id='infcaffilinonresioth_row"+cnt1+"'>"+b[i].infcaffilinonresioth+"</td>"
									 				+"<td class='sumder alnum' id='infcothrnonresibnk_row"+cnt1+"'>"+b[i].infcothrnonresibnk+"</td>"
									 				+"<td class='sumder alnum' id='infcothrnonresioth_row"+cnt1+"'>"+b[i].infcothrnonresioth+"</td>"
									 				+"<td class='sumder alnum' id='infctotforeicrncy_row"+cnt1+"'>"+b[i].infctotforeicrncy+"</td>"
									 				+"<td class='sumder alnum' id='grandtotal_row"+cnt1+"'>"+b[i].grandtotal+"</td>"
									 				+"<td style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads("+b[i].instcode+") id='edit"+cnt1+"'></td>"	

										
								                      
								                    +"</tr>" ) ; 	
									 		 cnt1++;
											
												}
											
									 		}
									}
									

						});   
						
												
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "BLS0100sec4",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
								var k=1;
								var cnt1=1;
								
								  $("#sec4 tr").remove();
								 
								$("#det1 tr").hide();
								$("#det1").hide();
								$("#tbcate").hide();
								var b=JSON.parse(res.sec1BLS0100s4);
								 console.log(b);
								
									//alert("res.sec1bls0100s3"+res.sec1bls0100s3);
									 
									 		for(var i=0;i<b.length;i++){
									 			if(i==0 ){
									 				$("#sec4").append('<tr ><td colspan=50 style="text-align:left;" id="mt'+cnt1+'"><B>Liabilities</B></td><tr>');
									 				$("#sec4").append('<tr><td  id="instaname_row'+cnt1+'"><b>'+b[i].instaname+'</b></td><td  id="instcode_row'+cnt1+'" colspan=49>'+b[i].instcode+'</td><tr>');
									 				
									 			}else if( i==6 || i==12 || i==18 || i==24  || i==30 || i==36 || i==42 || i==48 || i==58 || i==61 || i==65 || i==74  ){
													$("#sec4").append('<tr><td  id="instaname_row'+cnt1+'"><b>'+b[i].instaname+'</b></td><td  id="instcode_row'+cnt1+'" colspan=49>'+b[i].instcode+'</td><tr>');
												} else{
									 			
									 		  $("#sec4").append("<tr>"
									 				  
									 				 +"<td  id='instaname_row"+cnt1+"'>"+b[i].instaname+"</td>"
									 				+"<td  id='instcode_row"+cnt1+"'>"+b[i].instcode+"</td>"
									 				+"<td class='sumder alnum' id='innccentlbank_row"+cnt1+"'>"+b[i].innccentlbank+"</td>"
									 				+"<td class='sumder alnum' id='inncbank_row"+cnt1+"'>"+b[i].inncbank+"</td>"
									 				+"<td class='sumder alnum' id='inncnobnkdeptakins_row"+cnt1+"'>"+b[i].inncnobnkdeptakins+"</td>"
									 				+"<td class='sumder alnum' id='innccredunio_row"+cnt1+"'>"+b[i].innccredunio+"</td>"
									 				+"<td class='sumder alnum' id='inncfingbc1s_row"+cnt1+"'>"+b[i].inncfingbc1s+"</td>"
									 				+"<td class='sumder alnum' id='innctrusnonsetnbeni_row"+cnt1+"'>"+b[i].innctrusnonsetnbeni+"</td>"
									 				+"<td class='sumder alnum' id='inncinsucorp_row"+cnt1+"'>"+b[i].inncinsucorp+"</td>"
									 				+"<td class='sumder alnum' id='inncpensifnd_row"+cnt1+"'>"+b[i].inncpensifnd+"</td>"
									 				+"<td class='sumder alnum' id='inncinvtfund_row"+cnt1+"'>"+b[i].inncinvtfund+"</td>"
									 				+"<td class='sumder alnum' id='inncholdcompan_row"+cnt1+"'>"+b[i].inncholdcompan+"</td>"
									 				+"<td class='sumder alnum' id='inncfinauxintme_row"+cnt1+"'>"+b[i].inncfinauxintme+"</td>"
									 				+"<td class='sumder alnum' id='innccntragovt_row"+cnt1+"'>"+b[i].innccntragovt+"</td>"
									 				+"<td class='sumder alnum' id='inncstatnlocgovt_row"+cnt1+"'>"+b[i].inncstatnlocgovt+"</td>"
									 				+"<td class='sumder alnum' id='inncnonfingbc1s_row"+cnt1+"'>"+b[i].inncnonfingbc1s+"</td>"
									 				+"<td class='sumder alnum' id='inncgbc2s_row"+cnt1+"'>"+b[i].inncgbc2s+"</td>"
									 				+"<td class='sumder alnum' id='inncpubnonfincorp_row"+cnt1+"'>"+b[i].inncpubnonfincorp+"</td>"
									 				+"<td class='sumder alnum' id='inncothrnonfincorp_row"+cnt1+"'>"+b[i].inncothrnonfincorp+"</td>"
									 				+"<td class='sumder alnum' id='innchoushold_row"+cnt1+"'>"+b[i].innchoushold+"</td>"
									 				+"<td class='sumder alnum' id='inncnonproinsereshouhld_row"+cnt1+"'>"+b[i].inncnonproinsereshouhld+"</td>"
									 				+"<td class='sumder alnum' id='inncaffilinonresi_row"+cnt1+"'>"+b[i].inncaffilinonresi+"</td>"
									 				+"<td class='sumder alnum' id='inncothrnonresi_row"+cnt1+"'>"+b[i].inncothrnonresi+"</td>"
									 				+"<td class='sumder alnum' id='innctotnaticrncy_row"+cnt1+"'>"+b[i].innctotnaticrncy+"</td>"
									 				+"<td class='sumder alnum' id='infccentlbank_row"+cnt1+"'>"+b[i].infccentlbank+"</td>"
									 				+"<td class='sumder alnum' id='infcbank_row"+cnt1+"'>"+b[i].infcbank+"</td>"
									 				+"<td class='sumder alnum' id='infcnobnkdeptakins_row"+cnt1+"'>"+b[i].infcnobnkdeptakins+"</td>"
									 				+"<td class='sumder alnum' id='infccredunio_row"+cnt1+"'>"+b[i].infccredunio+"</td>"
									 				+"<td class='sumder alnum' id='infcfingbc1s_row"+cnt1+"'>"+b[i].infcfingbc1s+"</td>"
									 				+"<td class='sumder alnum' id='infctrusnonsetnbeni_row"+cnt1+"'>"+b[i].infctrusnonsetnbeni+"</td>"
									 				+"<td class='sumder alnum' id='infcinsucorp_row"+cnt1+"'>"+b[i].infcinsucorp+"</td>"
									 				+"<td class='sumder alnum' id='infcpensifnd_row"+cnt1+"'>"+b[i].infcpensifnd+"</td>"
									 				+"<td class='sumder alnum' id='infcinvtfund_row"+cnt1+"'>"+b[i].infcinvtfund+"</td>"
									 				+"<td class='sumder alnum' id='infcholdcompan_row"+cnt1+"'>"+b[i].infcholdcompan+"</td>"
									 				+"<td class='sumder alnum' id='infcfinauxintme_row"+cnt1+"'>"+b[i].infcfinauxintme+"</td>"
									 				+"<td class='sumder alnum' id='infccntragovt_row"+cnt1+"'>"+b[i].infccntragovt+"</td>"
									 				+"<td class='sumder alnum' id='infcstatnlocgovt_row"+cnt1+"'>"+b[i].infcstatnlocgovt+"</td>"
									 				+"<td class='sumder alnum' id='infcnonfingbc1s_row"+cnt1+"'>"+b[i].infcnonfingbc1s+"</td>"
									 				+"<td class='sumder alnum' id='infcgbc2s_row"+cnt1+"'>"+b[i].infcgbc2s+"</td>"
									 				+"<td class='sumder alnum' id='infcpubnonfincorp_row"+cnt1+"'>"+b[i].infcpubnonfincorp+"</td>"
									 				+"<td class='sumder alnum' id='infcothrnonfincorp_row"+cnt1+"'>"+b[i].infcothrnonfincorp+"</td>"
									 				+"<td class='sumder alnum' id='infchoushold_row"+cnt1+"'>"+b[i].infchoushold+"</td>"
									 				+"<td class='sumder alnum' id='infcnonproinsereshouhld_row"+cnt1+"'>"+b[i].infcnonproinsereshouhld+"</td>"
									 				+"<td class='sumder alnum' id='infcaffilinonresibnk_row"+cnt1+"'>"+b[i].infcaffilinonresibnk+"</td>"
									 				+"<td class='sumder alnum' id='infcaffilinonresioth_row"+cnt1+"'>"+b[i].infcaffilinonresioth+"</td>"
									 				+"<td class='sumder alnum' id='infcothrnonresibnk_row"+cnt1+"'>"+b[i].infcothrnonresibnk+"</td>"
									 				+"<td class='sumder alnum' id='infcothrnonresioth_row"+cnt1+"'>"+b[i].infcothrnonresioth+"</td>"
									 				+"<td class='sumder alnum' id='infctotforeicrncy_row"+cnt1+"'>"+b[i].infctotforeicrncy+"</td>"
									 				+"<td class='sumder alnum' id='grandtotal_row"+cnt1+"'>"+b[i].grandtotal+"</td>"
									 				+"<td style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads("+b[i].instcode+") id='edit"+cnt1+"'></td>"	

								                      
								                    +"</tr>" ) ; 	
									 		 cnt1++;
											
												}
									 			
									 		}
									 		 
											
								 			
									
									}
									

						});   
						
						
						
						
						
					}
	 

	 
 var datasum={
			"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>'
	};
$.ajax({
		url:"savecheckbls0100",
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

  location.href = "XBRL_REP_BLS0100_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>'+"&secid="+btn;
 
<%--  location.href = "XBRL_REP_BLS0100_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+'<%=instcode%>'+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>'+"&secid="+btn;
 --%>
}
</SCRIPT>
<script>
$(document).ready(function(){
	
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');

	
});   
</script>

<script>
$(document).ready(function(){
$("#tb1").show();

	
	
	$( ".btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
	$( '.btnback').click(function() {
		 location.href="XBRL_CRT_BLS0100_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
 	
	$("#btnfilter").on("click",function(){
	
		
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
	
		 $('#accno,#accname,#custid,#glshcode,#schmcode,#schmtyp,#accrycde,#baldte,#balamt,#accno1,#accname1,#custid1,#glshcode1,#schmcode1,#schmtyp1,#accrycde1,#baldte1,#balamt1,#accno2,#accname2,#custid2,#glshcode2,#schmcode2,#schmtyp2,#accrycde2,#baldte2,#balamt2,#accno3,#accname3,#custid3,#glshcode3,#schmcode3,#schmtyp3,#accrycde3,#baldte3,#balamt3').css({
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
		
			/* document
			.getElementById("1","2")
			.setAttribute("style","text-align:center;height:44px;width:70px;white-space:pre-wrap;scroll:none;word-wrap:break-word;resize: none;background-color: white;");
		 */
		}else{
			$(".form-control2").val("");
			$(".form-control2").prop("disabled",true);
			
			 $('#accno,#accname,#custid,#glshcode,#schmcode,#schmtyp,#accrycde,#baldte,#balamt,#accno1,#accname1,#custid1,#glshcode1,#schmcode1,#schmtyp1,#accrycde1,#baldte1,#balamt1,#accno2,#accname2,#custid2,#glshcode2,#schmcode2,#schmtyp2,#accrycde2,#baldte2,#balamt2,#accno3,#accname3,#custid3,#glshcode3,#schmcode3,#schmtyp3,#accrycde3,#baldte3,#balamt3').css({
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
			  
				 table = document.getElementById("detb"+b);
				 tr = table.getElementsByTagName("tr");
				 for (i = 0; i < tr.length; i++) {
					 
						 
						 tr[i].style.display = ""; 
						 
				 
					 
				 }
			
		}
	
	});
	
	$(window).load(function() {
		 
	    $(".loader").fadeOut("slow");
	});

});	

</script>

<script>
function myFunction(a,b) {
	  var input, filter, table, tr, dt1, dt2, refseqno, instno, reptype, curr;
	  var accno, accname, custid, glshcode, schmcode, schmtyp, accrycde, baldte, balamt;
	  var colname, colvalue;
	  input = document.getElementById(a);
	  filter = input.value.toUpperCase();
	  table = document.getElementById("det1");
	  tr = table.getElementsByTagName("tr");
	  var srno=1;
	  var cnt1=1;
	  dt1 = '<%=dt1%>';
	  dt2 = '<%=dt2%>';
	  refseqno = '<%=ReporefSeq%>';
	  instno = '<%=instno%>';
	  reptype = '<%=reptype%>'
	  curr = '<%=curr%>'
	 
	  switch(b) {
	  case 0:
		  colname="ACCT_NO";
		  colvalue=input.value;
		  break;
	  case 1:
		  colname="ACCT_NAME";
		  colvalue=filter;
		  break;
	  case 2:
		  colname="CUST_ID";
		  colvalue=input.value;
		  break;
	  case 3:
		  colname="GLSH_CODE";
		  colvalue=input.value;
		  break;
	  case 4:
		  colname="SCH_CODE";
		  colvalue=input.value;
		  break;
	  case 5:
		  colname="SCH_TYPE";
		  colvalue=filter;
		  break;
	  case 6:
		  colname="ACCT_CRNCY_CODE";
		  colvalue=filter;
		  break;
	  case 7:
		  colname="EAB_DATE";
		  colvalue=input.value;
		  break;
	  case 8:
		  colname="EAB_BAL";
		  colvalue=input.value;
		  break;
	  
	  }
	  
	  for (i = 0; i < tr.length; i++) {
			 
			 tr[i].style.display ="none"; 
	}
	  alert(colname);
	  alert(colvalue);
	  var det={
			  "dt1":dt1, "dt2":dt2, "refseqno":refseqno, "instno":instno, "reptype":reptype, "curr":curr, 
			  "colname":colname ,"colvalue":colvalue
			};
			$.ajax({
				url:"BLS0100sec1filter",
				data:det,
				dataType:'json',
				type:'POST',
				async:true,
				success:function(res){
					
					var b=JSON.parse(res.bls0100sec1);
					console.log(b);
					
				 for(var i=0;i<b.length;i++){
			 			$("#det1").append(
				 				 "<tr class='filtdata' id='blsadd"+srno+"'>"
				+"<td  id='accno_row"+srno+"'>"+b[i].accno+"</td>"
		  +"<td  id='acc_row"+srno+"'>"+b[i].accname+"</td>"
		  +"<td  id='custid_row"+srno+"'>"+b[i].custid+"</td>"
		  +"<td  id='glsh_row"+srno+"'>"+b[i].glshcode+"</td>"
		  +"<td  id='schmc_row"+srno+"'>"+b[i].schmcode+"</td>"
		  +"<td  id='schmt_row"+srno+"'>"+b[i].schmtyp+"</td>"
		  +"<td  id='accrycd_row"+srno+"'>"+b[i].accrycde+"</td>"
		  +"<td  id='baldt_row"+srno+"'>"+b[i].baldte+"</td>"
		  +"<td class='sumder alnum' id='bal_row"+srno+"'>"+b[i].balamt+"</td>"	  
		  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
	        +"</tr>" ) ; 
					 srno++;
					 cnt1++;
					
						} 
					
				}
			});
	  
	  
	  /* 
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[b];
	 
	if (td) {
		if(b==0||b==2 || b==3 ||b==4 || b==7|| b==8){
			
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
	    
	    
	  } */
	}
	
	
function myFunctionfilter(a,b) {
	  var input, filter, table, tr, dt1, dt2, refseqno, instno, reptype, curr;
	  var accno, accname, custid, glshcode, schmcode, schmtyp, accrycde, baldte, balamt;
	  var colname, colvalue;
	  accno = document.getElementById("accno").value.toUpperCase();
	  accname = document.getElementById("accname").value.toUpperCase();
	  custid = document.getElementById("custid").value.toUpperCase();
	  glshcode = document.getElementById("glshcode").value.toUpperCase();
	  schmcode = document.getElementById("schmcode").value.toUpperCase();
	  schmtyp = document.getElementById("schmtyp").value.toUpperCase();
	  accrycde = document.getElementById("accrycde").value.toUpperCase();
	  baldte = document.getElementById("baldte").value.toUpperCase();
	  balamt = document.getElementById("balamt").value.toUpperCase();
	  
	  filter = input.value.toUpperCase();
	  table = document.getElementById("det1");
	  tr = table.getElementsByTagName("tr");
	  var srno=1;
	  var cnt1=1;
	  dt1 = '<%=dt1%>';
	  dt2 = '<%=dt2%>';
	  refseqno = '<%=ReporefSeq%>';
	  instno = '<%=instno%>';
	  reptype = '<%=reptype%>'
	  curr = '<%=curr%>'
	 
	  switch(b) {
	  case 0:
		  colname="ACCT_NO";
		  colvalue=input.value;
		  break;
	  case 1:
		  colname="ACCT_NAME";
		  colvalue=filter;
		  break;
	  case 2:
		  colname="CUST_ID";
		  colvalue=input.value;
		  break;
	  case 3:
		  colname="GLSH_CODE";
		  colvalue=input.value;
		  break;
	  case 4:
		  colname="SCH_CODE";
		  colvalue=input.value;
		  break;
	  case 5:
		  colname="SCH_TYPE";
		  colvalue=filter;
		  break;
	  case 6:
		  colname="ACCT_CRNCY_CODE";
		  colvalue=filter;
		  break;
	  case 7:
		  colname="EAB_DATE";
		  colvalue=input.value;
		  break;
	  case 8:
		  colname="EAB_BAL";
		  colvalue=input.value;
		  break;
	  
	  }
	  
	  for (i = 0; i < tr.length; i++) {
			 
			 tr[i].style.display ="none"; 
	}
	  alert(colname);
	  alert(colvalue);
	  var det={
			  "dt1":dt1, "dt2":dt2, "refseqno":refseqno, "instno":instno, "reptype":reptype, "curr":curr, 
			  "colname":colname ,"colvalue":colvalue
			};
			$.ajax({
				url:"BLS0100sec1filter",
				data:det,
				dataType:'json',
				type:'POST',
				async:true,
				success:function(res){
					
					var b=JSON.parse(res.bls0100sec1);
					console.log(b);
					
				 for(var i=0;i<b.length;i++){
			 			$("#det1").append(
				 				 "<tr class='filtdata' id='blsadd"+srno+"'>"
				+"<td  id='accno_row"+srno+"'>"+b[i].accno+"</td>"
		  +"<td  id='acc_row"+srno+"'>"+b[i].accname+"</td>"
		  +"<td  id='custid_row"+srno+"'>"+b[i].custid+"</td>"
		  +"<td  id='glsh_row"+srno+"'>"+b[i].glshcode+"</td>"
		  +"<td  id='schmc_row"+srno+"'>"+b[i].schmcode+"</td>"
		  +"<td  id='schmt_row"+srno+"'>"+b[i].schmtyp+"</td>"
		  +"<td  id='accrycd_row"+srno+"'>"+b[i].accrycde+"</td>"
		  +"<td  id='baldt_row"+srno+"'>"+b[i].baldte+"</td>"
		  +"<td class='sumder alnum' id='bal_row"+srno+"'>"+b[i].balamt+"</td>"	  
		  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
	        +"</tr>" ) ; 
					 srno++;
					 cnt1++;
					
						} 
					
				}
			});
	  
	  
	  /* 
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[b];
	 
	if (td) {
		if(b==0||b==2 || b==3 ||b==4 || b==7|| b==8){
			
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
	    
	    
	  } */
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
	if(b==0||b==2 || b==3 ||b==4 || b==7|| b==8){
		
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
function myFunction2(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("det3");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==0||b==2 || b==3 ||b==4 || b==7|| b==8){
		
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
function myFunction3(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("det4");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==0||b==2 || b==3 ||b==4 || b==7|| b==8){
		
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


var det={
	"repdate":'<%=dt2%>',"type":"chckmodified"
};
$.ajax({
	url:"BLS0100chckmodified",
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
			        	location.href = "XBRL_CRT_BLS0100_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
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
var btn=1;
$(document).ready(function(){
	
	
	
$(".det").on("click",function(){

		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_BLS0100_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'+"&secid="+btn;  
	});
	 $("#btnpre").prop("disabled",true);
  $("#tb1").show();
  
 /*  $("#btnpre").on("click",function(){
		kk--;
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
  }); */
  $("#btnXML").attr("disabled",true);
});
</script>


<script>
function functionli(a){
	$(".table").hide();
	$("#tb"+a).show();
	 btn=a;
	 $("#btnXML").hide();

if(a==1){
	$("#btnSave").hide();
	$("#btnpre").prop("disabled",true);
	 $("#btnnext").prop("disabled",false);
	 $("#li1").addClass("active");
	 $("#li2").removeClass("active");
}else if(a==2){
	$("#btnSave").hide();
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li2").addClass("active");
	 $("#li1").removeClass("active");
}

else if(a==3){
	$("#btnSave").hide();
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li2").addClass("active");
	 $("#li1").removeClass("active");
}
if(a==4){
	$("#btnSave").show();
	$("#btnXML").show();
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li2").addClass("active");
	 $("#li1").removeClass("active");

}
} 

var b=0;
function funli(a){

	
	b=a;

	$("#rownoadd").val(a);
	$(".table").hide();
	$("#detb"+a).show();
	
	if(a==1){
		
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

	else if(a==3){
		$("#btnpre").prop("disabled",false);
		 $("#btnnext").prop("disabled",true);
		 $("#li3").addClass("active");
		 $("#li1,#li2,#li4").removeClass("active");
	}else{
		 $("#li4").addClass("active");
		 $("#li1,#li2,#li3").removeClass("active");
	}
	
}

</script>

<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	
	
	
 	
$("#sumfirst").on("click",function(){
		
		location.href = "XBRL_REP_BLS0100_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
	
	
	
	$('#btnExcel').click(function() {
		
		 bls0100Form.action = "bls0100EXCELREPORT.action?method=bls0100EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 bls0100Form.submit();
	});
	$("#btndwnld").on("click",function(){
		
		if($("#dnloadfrmt").val()=="excel"){
 		 bls0100Form.action = "bls0100EXCELSum.action?method=bls0100EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 bls0100Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 bls0100Form.action = "bls0100PDFREPORT.action?method=bls0100PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 bls0100Form.submit();
		} 
	});
	$('#btnXML').click(function() {
		  bls0100Form.action = "XMLDOWNLOADb1.action?method=blsxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 bls0100Form.submit(); 
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
		 					url:"saveSumbls",
		 					data:datasum,
		 					
		 					dataType:'json',
		 					type:'POST',
		 					async:true,
		 					success:function(res){
		 						
		 						 $("#divLoading").removeClass('show');
		 						alert("Saved Successfully");
	/* 	 						 $("#btnXML").prop("disabled",false);
	 */	 				
		 					}
		 				
		 				}); 
		 				
		 			}
		 		
		 	}	else
		 				{
		 		 
	/* 	 				 $("#btnXML").prop("disabled",false);
	 */	 				 $("#msg").html("Report already exist, do you want to replace it?");
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
		 				   		url:"saveSumbls",
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
		  
		  
});

</script>

<script>
 
var modtyp;

$(document).ready(function(){


	$("#addrow").on("click",function(){
		var rowno=$("#rowno").val();
modtyp="A";
		$("#addrowno").val("1"); 
		
	
	$("#det"+$("#rownoadd").val()).prepend("<tr id='blsadd"+rowno+"'><td id='accno_row"+rowno+"'><input type='text' id='accno_text"+rowno+"' style='width: 87px;'></td><td id='acc_row"+rowno+"'><input type='text'  id='acc_text"+rowno+"' style='    width:300px;'></td><td id='custid_row"+rowno+"'><input type='text' id='custid_text"+rowno+"' style='width: 75px;'></td><td id='glsh_row"+rowno+"'><input type='text' 	id='glsh_text"+rowno+"' style='width: 66px;'></td><td id='schmc_row"+rowno+"'><input type='text' id='schmc_text"+rowno+"' style='width: 75px;'></td><td id='schmt_row"+rowno+"' ><input type='text'  id='schmt_text"+rowno+"'    style='width: 75px;'></td><td  id='accrycd_row"+rowno+"'><input type='text' id='accrycd_text"+rowno+"' style='    width: 75px;'></td><td  id='baldt_row"+rowno+"'><input type='text' id='baldt_text"+rowno+"' style='    width: 75px;'></td><td class='sumder alnum' id='bal_row"+rowno+"'><input type='text' id='bal_text"+rowno+"'  class='decimalPt roundUp' style='    width: 88px;'></td><td style='text-align:center;'><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')>  <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px;display:inline-block; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");
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
		});});


	});
$("#info").on("click",function(){
	$("#info").popover('show');
});


	

function fnkeyup(a){
$("#baldt_text"+a).datepicker({
	dateFormat: "dd-mm-yy",
    changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: "today"
});

}
 



	
   
function edit_row(no)
{ $("#del_button"+no).addClass('hidden');
$("#addrowno").val("0");
modtyp="M";
	document.getElementById("edit_button"+no).style.display="none";
	  document.getElementById("save_button"+no).style.display="inline-block";
	 document.getElementById("Cancel_btn"+no).style.display="inline-block";
	document.getElementById("Cancel_button"+no).style.display="none";
  
  var	bal =  document.getElementById("bal_row"+no);
  
 var	bal_data = bal.innerHTML;
 
 

  
  
 
 bal.innerHTML="<input type='text' class='decimalPt roundUp'  id='bal_text"+no+"'  style='width: 83px'; value='"+bal_data+"'>";
 

 
 
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
		
		
		if(document.getElementById("bal_text"+no).value==""){
			alert("Enter Balance Amount ..");
			error="Y"
		}
		
	} else if (modtyp=="A") {
		
		
		

		if(document.getElementById("accno_text"+no).value==""){
			alert("Enter Account Number ..");
			error="Y"
		}else if(document.getElementById("acc_text"+no).value==""){
			alert("Enter Account Name ..");	
			error="Y"
		}else if(document.getElementById("custid_text"+no).value==""){
			alert("Enter Customer Id ..");
			error="Y"
		}else if(document.getElementById("glsh_text"+no).value==""){
			alert("Enter GL Subhead Code ..");
			error="Y"
		}else if(document.getElementById("schmc_text"+no).value==""){
			alert("Enter Scheme Code ..");
			error="Y"
		}else if(document.getElementById("schmt_text"+no).value==""){
			alert("Enter Scheme Type ..");
			error="Y"
		}else if(document.getElementById("accrycd_text"+no).value==""){
			alert("Enter Account Currency Code ..");
			error="Y"
		}else if(document.getElementById("baldt_text"+no).value==""){
			alert("Enter Balance Date ..");
			error="Y"
		}else if(document.getElementById("bal_text"+no).value==""){
			alert("Enter Balance Amount ..");
			error="Y"
		}
	}
	
	
	
	if (error=="N"){
	
	$("#modflg").val("Y");
	modtyp="M";
	
	
	document.getElementById("edit_button"+no).checked = false;
	
	  
	
	var bal_val=document.getElementById("bal_text"+no).value;
	
	

	document.getElementById("bal_row"+no).innerHTML=bal_val;
	
	
	if($("#addrowno").val()=="1"){
		modtyp="A";
	
	var  accno_val=document.getElementById("accno_text"+no).value;	 
	document.getElementById("accno_row"+no).innerHTML=accno_val;
	
	   var acc_val=document.getElementById("acc_text"+no).value;
	   document.getElementById("acc_row"+no).innerHTML=acc_val;
	   
	  var custid_val=document.getElementById("custid_text"+no).value;
	   document.getElementById("custid_row"+no).innerHTML=custid_val;
	   
	  
	  
	  var glsh_val=document.getElementById("glsh_text"+no).value;	
	  document.getElementById("glsh_row"+no).innerHTML=glsh_val;
	 
	  var schmc_val=document.getElementById("schmc_text"+no).value;
	  document.getElementById("schmc_row"+no).innerHTML=schmc_val;
	  
	  
	  
	  var schmt_val=document.getElementById("schmt_text"+no).value;
	 
	  document.getElementById("schmt_row"+no).innerHTML=schmt_val;
	  
	  var accrycd_val=document.getElementById("accrycd_text"+no).value;
		 
	  document.getElementById("accrycd_row"+no).innerHTML=accrycd_val;
	
	  var baldt_val=document.getElementById("baldt_text"+no).value;
		 
	  document.getElementById("baldt_row"+no).innerHTML=baldt_val;
	


	}
	
		else{
			document.getElementById("Cancel_button"+no).style.display="inline-block";
			document.getElementById("Cancel_btn"+no).style.display="none";
		}
	
	document.getElementById("edit_button"+no).style.display="inline-block";
	document.getElementById("save_button"+no).style.display="none";
	 var  accno=document.getElementById("accno_row"+no).innerHTML;	 
	   var acc=document.getElementById("acc_row"+no).innerHTML;
	  var custid=document.getElementById("custid_row"+no).innerHTML;
	  var glsh=document.getElementById("glsh_row"+no).innerHTML;
	  var schmc=document.getElementById("schmc_row"+no).innerHTML;	
	  var schmt=document.getElementById("schmt_row"+no).innerHTML;
	  var accrycd=document.getElementById("accrycd_row"+no).innerHTML;	
	  var baldt=document.getElementById("baldt_row"+no).innerHTML;
	 var bal=document.getElementById("bal_row"+no).innerHTML;
	 
	  $("#blsadd"+no).addClass("rowaddedd");
	
	// $("#det1 td").attr("padding","8px");
	var refeBLS100=document.getElementById("refDisplay").value;
    bal=bal.replace(/\,/g,'')
	  bal=Number(bal)

	 var rptdate1 = {
			     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeBLS100, "accno":accno,"acc":acc,"custid" : custid,"glsh":glsh, "schmc":schmc,"schmt":schmt,"accrycd":accrycd,"baldt":baldt,"bal":bal,"modtyp":modtyp
			}; 
	 
	 $.ajax({
	     url : "BLS0100",
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
		        	
		        	
		        	var  accno=document.getElementById("accno_row"+no).innerHTML;	 
		     	   var acc=document.getElementById("acc_row"+no).innerHTML;
		     	  var custid=document.getElementById("custid_row"+no).innerHTML;
		     	  var glsh=document.getElementById("glsh_row"+no).innerHTML;
		     	  var schmc=document.getElementById("schmc_row"+no).innerHTML;	
		     	  var schmt=document.getElementById("schmt_row"+no).innerHTML;
		     	  var accrycd=document.getElementById("accrycd_row"+no).innerHTML;	
		     	  var baldt=document.getElementById("baldt_row"+no).innerHTML;
		     	 var bal=document.getElementById("bal_row"+no).innerHTML;
		        	var refeBLS100=document.getElementById("refDisplay").value;
		            bal=bal.replace(/\,/g,'')
		        	  bal=Number(bal)
 	
		        	 var rptdate1 = {
		    			     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeBLS100, "accno":accno,"acc":acc,"custid" : custid,"glsh":glsh, "schmc":schmc,"schmt":schmt,"accrycd":accrycd,"baldt":baldt,"bal":bal,"modtyp":modtyp
		    			}; 
		    	 
		    	 $.ajax({
		    	     url : "BLS0100",
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
		     url : "BLS0100cancel",
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
	  

	/* 	  document.getElementById("del_button"+no).style.display="inline-block";
	 */ 
			

		var bal_val=document.getElementById("bal_text"+no).value;
		document.getElementById("bal_row"+no).innerHTML=bal_val;
			$("#edit_button"+no).show();
			/* document.getElementById("edit_button"+no).style.display="block"; */
			document.getElementById("save_button"+no).style.display="none";
			document.getElementById("Cancel_btn"+no).style.display="none";
        	location.reload(true);

			  var bal_val=document.getElementById("bal_row"+no).innerHTML;
				
			  if($("#blsadd"+no).hasClass( "rowaddedd" )){
				  
				  document.getElementById("Cancel_button"+no).style.display="inline-block";


			  }else{
				  document.getElementById("Cancel_button"+no).style.display="none";
			  }
	 }

	 
	 function Canadd_row(no){
		 
		 


		 if($("#blsadd"+no).hasClass( "rowaddedd" )){

			 var detcancel={
						"accno":$("#accno_row"+no).text(),"date":'<%=dt2%>'
				};
				

			 $.ajax({
			     url : "BLS0100cancel",
			     data : detcancel  ,
					dataType : 'json', 
					type : 'POST',
					async : true,
					 success : function(res) {

		         alert("Cancelation Successful");
					}
				});
		 }
		 $("#blsadd"+no).remove();
		 
	 }
 

</script>



<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="bls0100Form"
		enctype="multipart/form-data">
		
		 <input type="hidden" id="savecheck">
		 <input type="hidden" id="modflg">
		 <input type="hidden" id="modtyp">

 		<div id="divLoading"></div>
	
			<div id="nav">
				<div class="loader"></div>
		
             	
	 	<div class="active"  id="tab2" style="width: 4500px;padding-top: 1px;margin-top: -17px;" >
	 	<div   id="tab2"  style="margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b><%=reptype %> - Balance sheet<b id="sub"
					Style="display: none"></b></b></font>
			</div>  
	<input type="hidden" id="rownoadd">
		<ul class="nav nav-tabs navright"  id="mytab" style="width: 100%;">

			<li class=" pull-right list" onclick="functionli(4);"><a  data-toggle="tab"><span
							class="headingtab">4</span></a></li> 		
             <li class=" pull-right list" onclick="functionli(3);"><a href="#btntab3" data-toggle="tab"><span
							class="headingtab">3</span></a></li>
					<li class=" pull-right list" onclick="functionli(2);"><a href="#btntab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>	
							
						<li class=" pull-right active list" onclick="functionli(1);"><a href="#btntab1" data-toggle="tab"><span
							class="headingtab">1</span></a></li>	

				</ul>
				 
					<table class=""  id="mytab" style="width:4500px;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> <!-- <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font> -->
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
          		  </table>
			
            <table class="table" id="tb1" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="50" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:left"><b>Assets-Balance sheet</b>  </td></tr>
           
           
         			  <!-- --------- START    SEC1-------- -->
           
           <tr>
                  		 <th rowspan="6"  style="width:450px;text-align:center;">Instance Name																				
           					
						</th>
           				
           				 <th rowspan="6"  style="width:50px;text-align:center;">Instance Code																					
           					
						</th>	
         			   <th colspan="21" style="width:250px;text-align:center;">In National currency																				
           					
						</th>
												
						<th rowspan="5" colspan="1" style="width:250px;text-align:center;">Total in National Currency																						
						
						</th>
						
						 <th colspan="23" style="width:250px;text-align:center;">In Foreign currency																						
						
						</th>
						
						<th rowspan="5" colspan="1" style="width:250px;text-align:center;">Total in Foreign Currency
																												
						</th>
						
						<th  rowspan="5" colspan="1" style="width:250px;text-align:center;">Grand Total
																												
						</th>	
											
						
						<th rowspan="6" id="rad">Select</th>
						
					</tr>	
		

         <tr>
            				
           				
												
						<th rowspan="4" colspan="1" style="width:150px;text-align:center;">Central bank
						
						</th>
											
						<th rowspan="4" colspan="1" style="width:80px;text-align:center;">Banks
						
						</th>
						
						<th rowspan="4" colspan="1" style="width:70px;text-align:center;">Non-Bank Deposit Taking Institutions
						
						</th>
						<th rowspan="4" colspan="1"  style="width:50px;text-align:center;">Credit Unions
						
						</th>
						
						<th colspan="7"  style="width:150px;text-align:center;">Other Financial Corporations
						
						</th>
							
													
							
						<th rowspan="4" colspan="1" style="width:100px;text-align:center;">Central Government
			
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">State and Local Government
						
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Non-financial GBC1s		
												
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">GBC2s
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Public nonfinancial corporations

						</th>
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Other nonfinancial corporations

						</th>
						
								
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Households

						</th>
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Nonprofit Institutions serving resident households

						</th>
						
                        <th colspan="2"  rowspan="1" style="width:100px;text-align:center;">Nonresidents	
						
						</th>
				
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Central bank

						</th>
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;"> Banks


						<th colspan="1" rowspan="4" style="width:70px;text-align:center;">Non-Bank Deposit Taking Institutions
						
						</th>
						<th colspan="1" rowspan="4" style="width:50px;text-align:center;">Credit Unions
						
						</th>
			
						<th colspan="7"  style="width:100px;text-align:center;">Other nonfinancial corporations

						</th>	
																									
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Central Government

						
						</th>
						
						<th colspan="1	" rowspan="4" style="width:100px;text-align:center;">State and Local Government
						
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Non-financial GBC1s		
												
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">GBC2s
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Public nonfinancial corporations

						</th>
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Other nonfinancial corporations

						</th>					
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Households

						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Nonprofit Institutions serving resident households

						</th>
						
					 <th colspan="4"   rowspan="1" style="width:100px;text-align:center;">Nonresidents	
						
					
						</th>					 
					 						
				</tr>	
		
			<tr>
			
			
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Financial GBC1s	
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Trusts with Nonresident and GBC Settlors and Beneficiaries
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Insurance Corporations	
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Pension Funds	
						
						</th>
						
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Investment Funds	
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Holding companies	
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Financial Auxiliaries  and other financial intermediaries	
						
						</th>	
																	
				
									
							<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Affiliated Nonresidents	
						
						</th>
						
							<th rowspan="3" colspan="1"  style="width:100px;text-align:center;"> Other Nonresidents	
						
						</th>
						
				</tr>
	
				<tr>
					
					<th rowspan="2" colspan="1"style="width:100px;text-align:center;">Financial GBC1s	
						
						</th>
						
						<th rowspan="2" colspan="1"style="width:100px;text-align:center;">Trusts with Nonresident and GBC Settlors and Beneficiaries
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Insurance Corporations	
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Pension Funds	
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Investment Funds	
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Holding companies	
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Financial Auxiliaries  and other financial intermediaries	
						
						</th>	
																					
						
						<th colspan="2" rowspan="1"  style="width:100px;text-align:center;">Affiliated Nonresidents	
						
						</th>
						
					
						<th   colspan="2" rowspan="1"   style="width:100px;text-align:center;"> Other Nonresidents	
						
						</th>
																						
					
				</tr>
				
				
				<tr>
	
				
						<th colspan="1"  style="width:100px;text-align:center;">Banks	
						
						</th>
						
						
						<th colspan="1"  style="width:100px;text-align:center;">Other	
			
						</th>
				
						<th colspan="1" style="width:100px;text-align:center;">Banks	
						
						</th>
						
						<th colspan="1"  style="width:100px;text-align:center;">Other	
						
						</th>
				
				
				</tr>

				<tr>
											
						  <th style="text-align:center;" >A
						   </th>
						   <th style="text-align:center;" >B
						   </th>
						   <th style="text-align:center;" >C
						   </th>
						   <th style="text-align:center;">D
						   </th>
				
						   <th style="text-align:center;">E
						   </th>
						   <th style="text-align:center;">F
						   </th>
						   <th style="text-align:center;">G
						   </th>
						   <th style="text-align:center;">H
						   </th>
						   <th style="text-align:center;">I
						   </th>
						   <th style="text-align:center;">J
						   </th>
						   <th style="text-align:center;">K
						   </th>
			
						   <th style="text-align:center;">L
						   </th>
						   <th style="text-align:center;">M
						   </th>
						   <th style="text-align:center;">N
						   </th>
						   <th style="text-align:center;">O
						   </th>
						   <th style="text-align:center;">P
						   </th>
						   <th style="text-align:center;">Q
						   </th>
						   <th style="text-align:center;">R
						   </th>
						   <th style="text-align:center;">S
						   </th>
						   
				
						   <th style="text-align:center;">T
						   </th>
						   <th style="text-align:center;">U
						   </th>
				
						   <th style="text-align:center;">V
						   </th>
				
						   <th style="text-align:center;">W
						   </th>
						   <th style="text-align:center;">X
						   </th>
						   <th style="text-align:center;">Y
						   </th>
						   <th style="text-align:center;">Z
						   </th>
				  
						   
						   <th style="text-align:center;">AA
						   </th>
						   <th style="text-align:center;">AB
						   </th>
						   <th style="text-align:center;">AC
						   </th>
						   <th style="text-align:center;">AD
						   </th>
						   <th style="text-align:center;">AE
						   </th>
						   <th style="text-align:center;">AF
						   </th>
						   <th style="text-align:center;">AG
						   </th>
						   
						   
						   <th style="text-align:center;">AH
						   </th>
						   <th style="text-align:center;">AI
						   </th>
						   <th style="text-align:center;">AJ
						   </th>
						   <th style="text-align:center;">AK
						   </th>
						   <th style="text-align:center;">AL
						   </th>
						   <th style="text-align:center;">AM
						   </th>
						   <th style="text-align:center;">AN
						   </th>
						   <th style="text-align:center;">AO
						   </th>
						   <th style="text-align:center;">AP
						   </th>
						   <th style="text-align:center;">AQ
						   </th>
						   <th style="text-align:center;">AR
						   </th>
						   <th style="text-align:center;">AS
						   </th>
						   <th style="text-align:center;">AT
						   </th>
						   <th style="text-align:center;">AU
						   </th>
						
						</tr>
						
					
        
          <tbody class="databody" id="sec1"></tbody>
          
          </table>
				
				
						<!-- --------- END OF SEC1-------- -->
						
				
				   <table class="table" id="tb2" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="50" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:left"><b> Liabilities-Balance sheet	</b>  </td></tr>
          
          
            
           
            <!-- --------- START SEC2-------- -->
           
            <tr>
                  		 <th rowspan="6"  style="width:450px;text-align:center;">Instance Name																				
           					
						</th>
           				
           				 <th rowspan="6"  style="width:50px;text-align:center;">Instance Code																					
           					
						</th>	
         			   <th colspan="21" style="width:250px;text-align:center;">In National currency																				
           					
						</th>
												
						<th rowspan="5" colspan="1" style="width:250px;text-align:center;">Total in National Currency																						
						
						</th>
						
						 <th colspan="23" style="width:250px;text-align:center;">In Foreign currency																						
						
						</th>
						
						<th rowspan="5" colspan="1" style="width:250px;text-align:center;">Total in Foreign Currency
																												
						</th>
						
						<th  rowspan="5" colspan="1" style="width:250px;text-align:center;">Grand Total
																												
						</th>	
											
						
						<th rowspan="6" id="rad">Select</th>
						
					</tr>	
		

         <tr>
            				
           				
												
						<th rowspan="4" colspan="1" style="width:150px;text-align:center;">Central bank
						
						</th>
											
						<th rowspan="4" colspan="1" style="width:80px;text-align:center;">Banks
						
						</th>
						
						<th rowspan="4" colspan="1" style="width:70px;text-align:center;">Non-Bank Deposit Taking Institutions
						
						</th>
						<th rowspan="4" colspan="1"  style="width:50px;text-align:center;">Credit Unions
						
						</th>
						
						<th colspan="7"  style="width:150px;text-align:center;">Other Financial Corporations
						
						</th>
							
													
							
						<th rowspan="4" colspan="1" style="width:100px;text-align:center;">Central Government
			
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">State and Local Government
						
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Non-financial GBC1s		
												
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">GBC2s
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Public nonfinancial corporations

						</th>
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Other nonfinancial corporations

						</th>
						
								
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Households

						</th>
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Nonprofit Institutions serving resident households

						</th>
						
                        <th colspan="2"  rowspan="1" style="width:100px;text-align:center;">Nonresidents	
						
						</th>
				
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Central bank

						</th>
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;"> Banks


						<th colspan="1" rowspan="4" style="width:70px;text-align:center;">Non-Bank Deposit Taking Institutions
						
						</th>
						<th colspan="1" rowspan="4" style="width:50px;text-align:center;">Credit Unions
						
						</th>
			
						<th colspan="7"  style="width:100px;text-align:center;">Other nonfinancial corporations

						</th>	
																									
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Central Government

						
						</th>
						
						<th colspan="1	" rowspan="4" style="width:100px;text-align:center;">State and Local Government
						
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Non-financial GBC1s		
												
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">GBC2s
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Public nonfinancial corporations

						</th>
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Other nonfinancial corporations

						</th>					
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Households

						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Nonprofit Institutions serving resident households

						</th>
						
					 <th colspan="4"   rowspan="1" style="width:100px;text-align:center;">Nonresidents	
						
					
						</th>					 
					 						
				</tr>	
		
			<tr>
			
			
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Financial GBC1s	
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Trusts with Nonresident and GBC Settlors and Beneficiaries
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Insurance Corporations	
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Pension Funds	
						
						</th>
						
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Investment Funds	
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Holding companies	
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Financial Auxiliaries  and other financial intermediaries	
						
						</th>	
																	
				
									
							<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Affiliated Nonresidents	
						
						</th>
						
							<th rowspan="3" colspan="1"  style="width:100px;text-align:center;"> Other Nonresidents	
						
						</th>
						
				</tr>
	
				<tr>
					
					<th rowspan="2" colspan="1"style="width:100px;text-align:center;">Financial GBC1s	
						
						</th>
						
						<th rowspan="2" colspan="1"style="width:100px;text-align:center;">Trusts with Nonresident and GBC Settlors and Beneficiaries
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Insurance Corporations	
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Pension Funds	
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Investment Funds	
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Holding companies	
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Financial Auxiliaries  and other financial intermediaries	
						
						</th>	
																					
						
						<th colspan="2" rowspan="1"  style="width:100px;text-align:center;">Affiliated Nonresidents	
						
						</th>
						
					
						<th   colspan="2" rowspan="1"   style="width:100px;text-align:center;"> Other Nonresidents	
						
						</th>
																						
					
				</tr>
				
				
				<tr>
	
				
						<th colspan="1"  style="width:100px;text-align:center;">Banks	
						
						</th>
						
						
						<th colspan="1"  style="width:100px;text-align:center;">Other	
			
						</th>
				
						<th colspan="1" style="width:100px;text-align:center;">Banks	
						
						</th>
						
						<th colspan="1"  style="width:100px;text-align:center;">Other	
						
						</th>
				
				
				</tr>

				<tr>
											
						  <th style="text-align:center;" >A
						   </th>
						   <th style="text-align:center;" >B
						   </th>
						   <th style="text-align:center;" >C
						   </th>
						   <th style="text-align:center;">D
						   </th>
				
						   <th style="text-align:center;">E
						   </th>
						   <th style="text-align:center;">F
						   </th>
						   <th style="text-align:center;">G
						   </th>
						   <th style="text-align:center;">H
						   </th>
						   <th style="text-align:center;">I
						   </th>
						   <th style="text-align:center;">J
						   </th>
						   <th style="text-align:center;">K
						   </th>
			
						   <th style="text-align:center;">L
						   </th>
						   <th style="text-align:center;">M
						   </th>
						   <th style="text-align:center;">N
						   </th>
						   <th style="text-align:center;">O
						   </th>
						   <th style="text-align:center;">P
						   </th>
						   <th style="text-align:center;">Q
						   </th>
						   <th style="text-align:center;">R
						   </th>
						   <th style="text-align:center;">S
						   </th>
						   
				
						   <th style="text-align:center;">T
						   </th>
						   <th style="text-align:center;">U
						   </th>
				
						   <th style="text-align:center;">V
						   </th>
				
						   <th style="text-align:center;">W
						   </th>
						   <th style="text-align:center;">X
						   </th>
						   <th style="text-align:center;">Y
						   </th>
						   <th style="text-align:center;">Z
						   </th>
				  
						   
						   <th style="text-align:center;">AA
						   </th>
						   <th style="text-align:center;">AB
						   </th>
						   <th style="text-align:center;">AC
						   </th>
						   <th style="text-align:center;">AD
						   </th>
						   <th style="text-align:center;">AE
						   </th>
						   <th style="text-align:center;">AF
						   </th>
						   <th style="text-align:center;">AG
						   </th>
						   
						   
						   <th style="text-align:center;">AH
						   </th>
						   <th style="text-align:center;">AI
						   </th>
						   <th style="text-align:center;">AJ
						   </th>
						   <th style="text-align:center;">AK
						   </th>
						   <th style="text-align:center;">AL
						   </th>
						   <th style="text-align:center;">AM
						   </th>
						   <th style="text-align:center;">AN
						   </th>
						   <th style="text-align:center;">AO
						   </th>
						   <th style="text-align:center;">AP
						   </th>
						   <th style="text-align:center;">AQ
						   </th>
						   <th style="text-align:center;">AR
						   </th>
						   <th style="text-align:center;">AS
						   </th>
						   <th style="text-align:center;">AT
						   </th>
						   <th style="text-align:center;">AU
						   </th>
						
						</tr>
         
           <tbody class="databody" id="sec2"></tbody>
          
          
          </table>
				
				
					<!-- ---------   END OF SEC2-------- -->
		
				   <table class="table" id="tb3" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="50" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:left"><b> Memorandum Assets-Balance sheet</b>  </td></tr>
            
            
                    <!-- --------- START SEC3-------- -->
           
        <tr>
                  		 <th rowspan="6"  style="width:450px;text-align:center;">Instance Name																				
           					
						</th>
           				
           				 <th rowspan="6"  style="width:50px;text-align:center;">Instance Code																					
           					
						</th>	
         			   <th colspan="21" style="width:250px;text-align:center;">In National currency																				
           					
						</th>
												
						<th rowspan="5" colspan="1" style="width:250px;text-align:center;">Total in National Currency																						
						
						</th>
						
						 <th colspan="23" style="width:250px;text-align:center;">In Foreign currency																						
						
						</th>
						
						<th rowspan="5" colspan="1" style="width:250px;text-align:center;">Total in Foreign Currency
																												
						</th>
						
						<th  rowspan="5" colspan="1" style="width:250px;text-align:center;">Grand Total
																												
						</th>	
											
						
						<th rowspan="6" id="rad">Select</th>
						
					</tr>	
		

         <tr>
            				
           				
												
						<th rowspan="4" colspan="1" style="width:150px;text-align:center;">Central bank
						
						</th>
											
						<th rowspan="4" colspan="1" style="width:80px;text-align:center;">Banks
						
						</th>
						
						<th rowspan="4" colspan="1" style="width:70px;text-align:center;">Non-Bank Deposit Taking Institutions
						
						</th>
						<th rowspan="4" colspan="1"  style="width:50px;text-align:center;">Credit Unions
						
						</th>
						
						<th colspan="7"  style="width:150px;text-align:center;">Other Financial Corporations
						
						</th>
							
													
							
						<th rowspan="4" colspan="1" style="width:100px;text-align:center;">Central Government
			
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">State and Local Government
						
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Non-financial GBC1s		
												
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">GBC2s
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Public nonfinancial corporations

						</th>
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Other nonfinancial corporations

						</th>
						
								
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Households

						</th>
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Nonprofit Institutions serving resident households

						</th>
						
                        <th colspan="2"  rowspan="1" style="width:100px;text-align:center;">Nonresidents	
						
						</th>
				
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Central bank

						</th>
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;"> Banks


						<th colspan="1" rowspan="4" style="width:70px;text-align:center;">Non-Bank Deposit Taking Institutions
						
						</th>
						<th colspan="1" rowspan="4" style="width:50px;text-align:center;">Credit Unions
						
						</th>
			
						<th colspan="7"  style="width:100px;text-align:center;">Other nonfinancial corporations

						</th>	
																									
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Central Government

						
						</th>
						
						<th colspan="1	" rowspan="4" style="width:100px;text-align:center;">State and Local Government
						
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Non-financial GBC1s		
												
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">GBC2s
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Public nonfinancial corporations

						</th>
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Other nonfinancial corporations

						</th>					
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Households

						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Nonprofit Institutions serving resident households

						</th>
						
					 <th colspan="4"   rowspan="1" style="width:100px;text-align:center;">Nonresidents	
						
					
						</th>					 
					 						
				</tr>	
		
			<tr>
			
			
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Financial GBC1s	
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Trusts with Nonresident and GBC Settlors and Beneficiaries
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Insurance Corporations	
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Pension Funds	
						
						</th>
						
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Investment Funds	
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Holding companies	
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Financial Auxiliaries  and other financial intermediaries	
						
						</th>	
																	
				
									
							<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Affiliated Nonresidents	
						
						</th>
						
							<th rowspan="3" colspan="1"  style="width:100px;text-align:center;"> Other Nonresidents	
						
						</th>
						
				</tr>
	
				<tr>
					
					<th rowspan="2" colspan="1"style="width:100px;text-align:center;">Financial GBC1s	
						
						</th>
						
						<th rowspan="2" colspan="1"style="width:100px;text-align:center;">Trusts with Nonresident and GBC Settlors and Beneficiaries
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Insurance Corporations	
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Pension Funds	
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Investment Funds	
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Holding companies	
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Financial Auxiliaries  and other financial intermediaries	
						
						</th>	
																					
						
						<th colspan="2" rowspan="1"  style="width:100px;text-align:center;">Affiliated Nonresidents	
						
						</th>
						
					
						<th   colspan="2" rowspan="1"   style="width:100px;text-align:center;"> Other Nonresidents	
						
						</th>
																						
					
				</tr>
				
				
				<tr>
	
				
						<th colspan="1"  style="width:100px;text-align:center;">Banks	
						
						</th>
						
						
						<th colspan="1"  style="width:100px;text-align:center;">Other	
			
						</th>
				
						<th colspan="1" style="width:100px;text-align:center;">Banks	
						
						</th>
						
						<th colspan="1"  style="width:100px;text-align:center;">Other	
						
						</th>
				
				
				</tr>

				<tr>
											
						  <th style="text-align:center;" >A
						   </th>
						   <th style="text-align:center;" >B
						   </th>
						   <th style="text-align:center;" >C
						   </th>
						   <th style="text-align:center;">D
						   </th>
				
						   <th style="text-align:center;">E
						   </th>
						   <th style="text-align:center;">F
						   </th>
						   <th style="text-align:center;">G
						   </th>
						   <th style="text-align:center;">H
						   </th>
						   <th style="text-align:center;">I
						   </th>
						   <th style="text-align:center;">J
						   </th>
						   <th style="text-align:center;">K
						   </th>
			
						   <th style="text-align:center;">L
						   </th>
						   <th style="text-align:center;">M
						   </th>
						   <th style="text-align:center;">N
						   </th>
						   <th style="text-align:center;">O
						   </th>
						   <th style="text-align:center;">P
						   </th>
						   <th style="text-align:center;">Q
						   </th>
						   <th style="text-align:center;">R
						   </th>
						   <th style="text-align:center;">S
						   </th>
						   
				
						   <th style="text-align:center;">T
						   </th>
						   <th style="text-align:center;">U
						   </th>
				
						   <th style="text-align:center;">V
						   </th>
				
						   <th style="text-align:center;">W
						   </th>
						   <th style="text-align:center;">X
						   </th>
						   <th style="text-align:center;">Y
						   </th>
						   <th style="text-align:center;">Z
						   </th>
				  
						   
						   <th style="text-align:center;">AA
						   </th>
						   <th style="text-align:center;">AB
						   </th>
						   <th style="text-align:center;">AC
						   </th>
						   <th style="text-align:center;">AD
						   </th>
						   <th style="text-align:center;">AE
						   </th>
						   <th style="text-align:center;">AF
						   </th>
						   <th style="text-align:center;">AG
						   </th>
						   
						   
						   <th style="text-align:center;">AH
						   </th>
						   <th style="text-align:center;">AI
						   </th>
						   <th style="text-align:center;">AJ
						   </th>
						   <th style="text-align:center;">AK
						   </th>
						   <th style="text-align:center;">AL
						   </th>
						   <th style="text-align:center;">AM
						   </th>
						   <th style="text-align:center;">AN
						   </th>
						   <th style="text-align:center;">AO
						   </th>
						   <th style="text-align:center;">AP
						   </th>
						   <th style="text-align:center;">AQ
						   </th>
						   <th style="text-align:center;">AR
						   </th>
						   <th style="text-align:center;">AS
						   </th>
						   <th style="text-align:center;">AT
						   </th>
						   <th style="text-align:center;">AU
						   </th>
						
						</tr>
          
						
             <tbody class="databody" id="sec3"></tbody>
          </table>
				
	
						<!-- ---------   END OF SEC3-------- -->
	
	
	
	  <table class="table" id="tb4" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="50" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:left"><b> Memorandum Liabilities - Balance sheet</b>  </td></tr>
            
            
                    <!-- --------- START SEC4-------- -->
           
            <tr>
                  		 <th rowspan="6"  style="width:450px;text-align:center;">Instance Name																				
           					
						</th>
           				
           				 <th rowspan="6"  style="width:50px;text-align:center;">Instance Code																					
           					
						</th>	
         			   <th colspan="21" style="width:250px;text-align:center;">In National currency																				
           					
						</th>
												
						<th rowspan="5" colspan="1" style="width:250px;text-align:center;">Total in National Currency																						
						
						</th>
						
						 <th colspan="23" style="width:250px;text-align:center;">In Foreign currency																						
						
						</th>
						
						<th rowspan="5" colspan="1" style="width:250px;text-align:center;">Total in Foreign Currency
																												
						</th>
						
						<th  rowspan="5" colspan="1" style="width:250px;text-align:center;">Grand Total
																												
						</th>	
											
						
						<th rowspan="6" id="rad">Select</th>
						
					</tr>	
		

         <tr>
            				
           				
												
						<th rowspan="4" colspan="1" style="width:150px;text-align:center;">Central bank
						
						</th>
											
						<th rowspan="4" colspan="1" style="width:80px;text-align:center;">Banks
						
						</th>
						
						<th rowspan="4" colspan="1" style="width:70px;text-align:center;">Non-Bank Deposit Taking Institutions
						
						</th>
						<th rowspan="4" colspan="1"  style="width:50px;text-align:center;">Credit Unions
						
						</th>
						
						<th colspan="7"  style="width:150px;text-align:center;">Other Financial Corporations
						
						</th>
							
													
							
						<th rowspan="4" colspan="1" style="width:100px;text-align:center;">Central Government
			
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">State and Local Government
						
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Non-financial GBC1s		
												
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">GBC2s
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Public nonfinancial corporations

						</th>
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Other nonfinancial corporations

						</th>
						
								
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Households

						</th>
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Nonprofit Institutions serving resident households

						</th>
						
                        <th colspan="2"  rowspan="1" style="width:100px;text-align:center;">Nonresidents	
						
						</th>
				
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Central bank

						</th>
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;"> Banks


						<th colspan="1" rowspan="4" style="width:70px;text-align:center;">Non-Bank Deposit Taking Institutions
						
						</th>
						<th colspan="1" rowspan="4" style="width:50px;text-align:center;">Credit Unions
						
						</th>
			
						<th colspan="7"  style="width:100px;text-align:center;">Other nonfinancial corporations

						</th>	
																									
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Central Government

						
						</th>
						
						<th colspan="1	" rowspan="4" style="width:100px;text-align:center;">State and Local Government
						
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Non-financial GBC1s		
												
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">GBC2s
						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Public nonfinancial corporations

						</th>
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Other nonfinancial corporations

						</th>					
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Households

						</th>
						
						<th colspan="1" rowspan="4" style="width:100px;text-align:center;">Nonprofit Institutions serving resident households

						</th>
						
					 <th colspan="4"   rowspan="1" style="width:100px;text-align:center;">Nonresidents	
						
					
						</th>					 
					 						
				</tr>	
		
			<tr>
			
			
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Financial GBC1s	
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Trusts with Nonresident and GBC Settlors and Beneficiaries
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Insurance Corporations	
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Pension Funds	
						
						</th>
						
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Investment Funds	
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Holding companies	
						
						</th>
						
						<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Financial Auxiliaries  and other financial intermediaries	
						
						</th>	
																	
				
									
							<th rowspan="3" colspan="1" style="width:100px;text-align:center;">Affiliated Nonresidents	
						
						</th>
						
							<th rowspan="3" colspan="1"  style="width:100px;text-align:center;"> Other Nonresidents	
						
						</th>
						
				</tr>
	
				<tr>
					
					<th rowspan="2" colspan="1"style="width:100px;text-align:center;">Financial GBC1s	
						
						</th>
						
						<th rowspan="2" colspan="1"style="width:100px;text-align:center;">Trusts with Nonresident and GBC Settlors and Beneficiaries
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Insurance Corporations	
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Pension Funds	
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Investment Funds	
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Holding companies	
						
						</th>
						
						<th rowspan="2" colspan="1" style="width:100px;text-align:center;">Financial Auxiliaries  and other financial intermediaries	
						
						</th>	
																					
						
						<th colspan="2" rowspan="1"  style="width:100px;text-align:center;">Affiliated Nonresidents	
						
						</th>
						
					
						<th   colspan="2" rowspan="1"   style="width:100px;text-align:center;"> Other Nonresidents	
						
						</th>
																						
					
				</tr>
				
				
				<tr>
	
				
						<th colspan="1"  style="width:100px;text-align:center;">Banks	
						
						</th>
						
						
						<th colspan="1"  style="width:100px;text-align:center;">Other	
			
						</th>
				
						<th colspan="1" style="width:100px;text-align:center;">Banks	
						
						</th>
						
						<th colspan="1"  style="width:100px;text-align:center;">Other	
						
						</th>
				
				
				</tr>

				<tr>
											
						  <th style="text-align:center;" >A
						   </th>
						   <th style="text-align:center;" >B
						   </th>
						   <th style="text-align:center;" >C
						   </th>
						   <th style="text-align:center;">D
						   </th>
				
						   <th style="text-align:center;">E
						   </th>
						   <th style="text-align:center;">F
						   </th>
						   <th style="text-align:center;">G
						   </th>
						   <th style="text-align:center;">H
						   </th>
						   <th style="text-align:center;">I
						   </th>
						   <th style="text-align:center;">J
						   </th>
						   <th style="text-align:center;">K
						   </th>
			
						   <th style="text-align:center;">L
						   </th>
						   <th style="text-align:center;">M
						   </th>
						   <th style="text-align:center;">N
						   </th>
						   <th style="text-align:center;">O
						   </th>
						   <th style="text-align:center;">P
						   </th>
						   <th style="text-align:center;">Q
						   </th>
						   <th style="text-align:center;">R
						   </th>
						   <th style="text-align:center;">S
						   </th>
						   
				
						   <th style="text-align:center;">T
						   </th>
						   <th style="text-align:center;">U
						   </th>
				
						   <th style="text-align:center;">V
						   </th>
				
						   <th style="text-align:center;">W
						   </th>
						   <th style="text-align:center;">X
						   </th>
						   <th style="text-align:center;">Y
						   </th>
						   <th style="text-align:center;">Z
						   </th>
				  
						   
						   <th style="text-align:center;">AA
						   </th>
						   <th style="text-align:center;">AB
						   </th>
						   <th style="text-align:center;">AC
						   </th>
						   <th style="text-align:center;">AD
						   </th>
						   <th style="text-align:center;">AE
						   </th>
						   <th style="text-align:center;">AF
						   </th>
						   <th style="text-align:center;">AG
						   </th>
						   
						   
						   <th style="text-align:center;">AH
						   </th>
						   <th style="text-align:center;">AI
						   </th>
						   <th style="text-align:center;">AJ
						   </th>
						   <th style="text-align:center;">AK
						   </th>
						   <th style="text-align:center;">AL
						   </th>
						   <th style="text-align:center;">AM
						   </th>
						   <th style="text-align:center;">AN
						   </th>
						   <th style="text-align:center;">AO
						   </th>
						   <th style="text-align:center;">AP
						   </th>
						   <th style="text-align:center;">AQ
						   </th>
						   <th style="text-align:center;">AR
						   </th>
						   <th style="text-align:center;">AS
						   </th>
						   <th style="text-align:center;">AT
						   </th>
						   <th style="text-align:center;">AU
						   </th>
						
						</tr>
          
						
             <tbody class="databody" id="sec4"></tbody>
          </table>
				
	
						<!-- ---------   END OF SEC4-------- -->
	
	
	
	
			
		 <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
      <!-- <button type="button" class="btn btn-xs btn-primary"   value="back" id="btnpre">Previous</button> -->
    
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
       <!-- <button type="button" class="btn btn-xs btn-primary"   value="back" id="btnnext">Next</button> -->
      <button type="button" class="btn btn-xs btn-primary btnback" value="back" id="btnback">Back</button></div>
          
            </div>
			
   <div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			<div class="active" id="tab1" style="width: 1179px;padding-top: 1px;margin-top: -17px;" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b><%=reptype%>-Balance sheet
			</b></font>
			</div>
			<br>
			<div id="divLoading"> 
			
    </div>
       <ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">




  
					<li class=" pull-right list" onclick="funli(4);" id="li4"><a href="#btndetb4" data-toggle="tab"><span
							class="headingtab">4</span></a></li>
					
					
					<li class=" pull-right  list" onclick="funli(3);" id="li3" ><a href="#btndetb3"
						data-toggle="tab"><span class="headingtab" >
								3 </span></a></li>


					<li class=" pull-right list" onclick="funli(2);" id="li2"><a href="#btndetb2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" onclick="funli(1);"id="li1" ><a href="#btndetb1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>



				</ul>
				
    
          <table class="" style="width:1179px;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> 
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></input></font></td><td style="text-align:center;background-color: #bbc3cb;width: 325px;"></td><td style="background-color: #bbc3cb;text-align:right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" onclick="funadd(a)" id="addrow">Add </span></a>
    
    <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a>
    </td> </tr>
          		  
	  
          		  </table> 
       
                                
           <div class="panel panel-primary filterable">
            <table class="table" id="detb1" border="1" style="width:100%;   margin-top: -20px;">
            <thead>
            <tr ><td colspan="50" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:left"><b>Assets-Balance sheet</b>  </td></tr>
					 <tr class="filters">
					 
						
						<th id="rmks">Remarks</th>					
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,0)" class="form-control2" id="accno" style="width: 87px;text-align:center;"placeholder="Account Number"disabled></textarea> </th>				
						<th style="text-align:center;" ><textarea type="text" onkeyup="myFunction(this.id,1)" class="form-control2" id="accname" style="width: 293px;text-align:center;" placeholder="Account Name"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text" onkeyup="myFunction(this.id,2)" class="form-control2" id="custid" style="width: 75px;text-align:center;" placeholder="Customer Id"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,3)" class="form-control2" id="glshcode"  style="width: 66px;text-align:center;" placeholder="GL SubHead Code" disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,4)" class="form-control2" id="schmcode" style="width: 75px;text-align:center;" placeholder="Scheme code" disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,5)" class="form-control2" id="schmtyp" style="width: 75px;text-align:center;" placeholder="Scheme Type"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,6)" class="form-control2" id="accrycde" style="width: 65px;text-align:center;" placeholder="Account Currency Code"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,7)" class="form-control2" id="baldte" style="width: 75px;text-align:center;" placeholder="Balance Date"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,8)" class="form-control2" id="balamt" style="width: 80px;text-align:center;" placeholder="Balance Amount"disabled></textarea></th>						
						
						
						
						<th style="text-align:center;width:110px;" id="modify">Modify</th>
						
					</tr>
					
				</thead>
					
					<tbody class="databody" id="det1">

              </tbody>
              
     
				</table>
				
					
				<table class="table" id="detb2" style="width:100%;display:none;margin-top:-20px;"><thead>
            
                           <tr ><td colspan="50" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:left"><b>Liabilities-Balance sheet</b>  </td></tr>
               
					 
 				<tr class="filters">
 				<th id="rmks1">Remarks</th>
					<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction1(this.id,0)" class="form-control2" id="accno1" style="width: 87px;text-align:center;"placeholder="Account Number"disabled></textarea> </th>				
						<th style="text-align:center;" ><textarea type="text" onkeyup="myFunction1(this.id,1)" class="form-control2" id="accname1" style="width: 293px;text-align:center;" placeholder="Account Name"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text" onkeyup="myFunction1(this.id,2)" class="form-control2" id="custid1" style="width: 75px;text-align:center;" placeholder="Customer Id"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction1(this.id,3)" class="form-control2" id="glshcode1"  style="width: 66px;text-align:center;" placeholder="GL SubHead Code" disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction1(this.id,4)" class="form-control2" id="schmcode1" style="width: 75px;text-align:center;" placeholder="Scheme code" disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction1(this.id,5)" class="form-control2" id="schmtyp1" style="width: 75px;text-align:center;" placeholder="Scheme Type"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction1(this.id,6)" class="form-control2" id="accrycde1" style="width: 65px;text-align:center;" placeholder="Account Currency Code"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction1(this.id,7)" class="form-control2" id="baldte1" style="width: 75px;text-align:center;" placeholder="Balance Date"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction1(this.id,8)" class="form-control2" id="balamt1" style="width: 80px;text-align:center;" placeholder="Balance Amount"disabled></textarea></th>						
												
						<th style="text-align:center;width:100px;" id="modify1">Modify</th>
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det2">


 


              </tbody>
              
              
				</table>
				
				
					
				<table class="table" id="detb3" style="width:100%;display:none;margin-top:-20px;"><thead>
            
                           <tr ><td colspan="50" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:left"><b>Memorandum Assets-Balance sheet</b>  </td></tr>
               
					 
 				<tr class="filters">
 				<th id="rmks2">Remarks</th>
					<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction2(this.id,0)" class="form-control2" id="accno2" style="width: 87px;text-align:center;"placeholder="Account Number"disabled></textarea> </th>				
						<th style="text-align:center;" ><textarea type="text" onkeyup="myFunction2(this.id,1)" class="form-control2" id="accname2" style="width: 293px;text-align:center;" placeholder="Account Name"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text" onkeyup="myFunction2(this.id,2)" class="form-control2" id="custid2" style="width: 75px;text-align:center;" placeholder="Customer Id"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction2(this.id,3)" class="form-control2" id="glshcode2"  style="width: 66px;text-align:center;" placeholder="GL SubHead Code" disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction2(this.id,4)" class="form-control2" id="schmcode2" style="width: 75px;text-align:center;" placeholder="Scheme code" disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction2(this.id,5)" class="form-control2" id="schmtyp2" style="width: 75px;text-align:center;" placeholder="Scheme Type"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction2(this.id,6)" class="form-control2" id="accrycde2" style="width: 65px;text-align:center;" placeholder="Account Currency Code"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction2(this.id,7)" class="form-control2" id="baldte2" style="width: 75px;text-align:center;" placeholder="Balance Date"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction2(this.id,8)" class="form-control2" id="balamt2" style="width: 80px;text-align:center;" placeholder="Balance Amount"disabled></textarea></th>						
												
						<th id="modify2">Modify</th>
											
					
					</tr>
					
				</thead>
				
					<tbody style="text-align:center;width:100px;" class="databody" id="det3">


 


              </tbody>
              
              
				</table>
				
					
				<table class="table" id="detb4" style="width:100%;display:none;margin-top:-20px;"><thead>
            
                                          <tr ><td colspan="50" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:left"><b>Memorandum Liabilities-Balance sheet</b>  </td></tr>
               
					 
 				<tr class="filters">
 				<th id="rmks3">Remarks</th>
					<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction3(this.id,0)" class="form-control2" id="accno3" style="width: 87px;text-align:center;"placeholder="Account Number"disabled></textarea> </th>				
						<th style="text-align:center;" ><textarea type="text" onkeyup="myFunction3(this.id,1)" class="form-control2" id="accname3" style="width: 293px;text-align:center;" placeholder="Account Name"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text" onkeyup="myFunction3(this.id,2)" class="form-control2" id="custid3" style="width: 75px;text-align:center;" placeholder="Customer Id"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction3(this.id,3)" class="form-control2" id="glshcode3"  style="width: 66px;text-align:center;" placeholder="GL SubHead Code" disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction3(this.id,4)" class="form-control2" id="schmcode3" style="width: 75px;text-align:center;" placeholder="Scheme code" disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction3(this.id,5)" class="form-control2" id="schmtyp3" style="width: 75px;text-align:center;" placeholder="Scheme Type"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction3(this.id,6)" class="form-control2" id="accrycde3" style="width: 65px;text-align:center;" placeholder="Account Currency Code"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction3(this.id,7)" class="form-control2" id="baldte3" style="width: 75px;text-align:center;" placeholder="Balance Date"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction3(this.id,8)" class="form-control2" id="balamt3" style="width: 80px;text-align:center;" placeholder="Balance Amount"disabled></textarea></th>						
												
						<th id="modify3">Modify</th>
											
					
					</tr>
					
				</thead>
				
					<tbody style="text-align:center;width:100px;" class="databody" id="det4">


 


              </tbody>
              
              
				</table>
				
				
				</div>
			
            
         <div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
                 
                <button type="button" class="btn btn-xs btn-primary btnback" value="back" id="btnback">Back</button>
            </div>
          
        
         </div>  
        
			</div>	         
  
    </div>
    <!-- -------------------------------dialog box---------------------->
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


		
	</div>

</body>
</html>