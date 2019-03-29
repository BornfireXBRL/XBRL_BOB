<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLFIM0600Bean,dao.XBRLFIM0600Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
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
 
/*  XBRLFIM0600Dao dmd=new XBRLFIM0600Dao(); */
 
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
	
	 if(z=="load"){
		 $("#tab1").show();
			$("#tab2").hide();
			$(".det").addClass("clr");
			<%-- funli(<%=request.getParameter("secid")%>); --%>
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
		
		 $(".repdisp").text(refno);
		 var srno=1;
			
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "fim0600details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#pymdets1 tr").remove();
					 
					
					var b=JSON.parse(res.detFIM0600);
					 console.log(b);
					
			       
						 	if(f=="onload"){
						 		$(".table").hide();
						 		$("#detb1").show();
						 	

						 		$(".modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#pymdets1").append("<tr><td id='reportDate_row"+srno+"'>"+b[i].reportDate+"</td><td id='crncyCode_row"+srno+"'>"+b[i].crncyCode+"</td><td id='rate_row"+srno+"' class='sumder'>"+b[i].rate+"</td><td id='crncynotesBal_row"+srno+"' class='sumder'>"+b[i].crncynotesBal+"</td><td id='nostroacctBal_row"+srno+"' class='sumder'>"+b[i].nostroacctBal+"</td><td id='frwdSalesBal_row"+srno+"' class='sumder'>"+b[i].frwdSalesBal+"</td><td id='fcrncyAbroadBal_row"+srno+"' class='sumder'>"+b[i].fcrncyAbroadBal+"</td><td id='fcrncyobsastBal_row"+srno+"' class='sumder'>"+b[i].fcrncyobsastBal+"</td><td id='obsastBal_row"+srno+"' class='sumder'>"+b[i].obsastBal+"</td><td id='undlrspotpurBal_row"+srno+"' class='sumder'>"+b[i].undlrspotpurBal+"</td><td id='frwdPurBal_row"+srno+"' class='sumder'>"+b[i].frwdPurBal+"</td><td id='oobsastBal_row"+srno+"' class='sumder'>"+b[i].oobsastBal+"</td><td id='shrtTermLiabBal_row"+srno+"' class='sumder'>"+b[i].shrtTermLiabBal+"</td><td id='fcrncyDepositBal_row"+srno+"' class='sumder'>"+b[i].fcrncyDepositBal+"</td><td id='obsliabBal_row"+srno+"' class='sumder'>"+b[i].obsliabBal+"</td><td id='ubdlrspotsalesBal_row"+srno+"' class='sumder'>"+b[i].ubdlrspotsalesBal+"</td><td id='frwdSales_row"+srno+"' class='sumder'>"+b[i].frwdSales+"</td><td id='oobsliabBal_row"+srno+"' class='sumder'>"+b[i].oobsliabBal+"</td><td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row1('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row1('"+srno+"')></td></tr>") ;  
						 		  
						 		 
								
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 		

						 		$(".modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
						 			$("#pymdets1").append("<tr><td id='reportDate_row"+srno+"'>"+b[i].reportDate+"</td><td id='crncyCode_row"+srno+"'>"+b[i].crncyCode+"</td><td id='rate_row"+srno+"' class='sumder'>"+b[i].rate+"</td><td id='crncynotesBal_row"+srno+"' class='sumder'>"+b[i].crncynotesBal+"</td><td id='nostroacctBal_row"+srno+"' class='sumder'>"+b[i].nostroacctBal+"</td><td id='frwdSalesBal_row"+srno+"' class='sumder'>"+b[i].frwdSalesBal+"</td><td id='fcrncyAbroadBal_row"+srno+"' class='sumder'>"+b[i].fcrncyAbroadBal+"</td><td id='fcrncyobsastBal_row"+srno+"' class='sumder'>"+b[i].fcrncyobsastBal+"</td><td id='obsastBal_row"+srno+"' class='sumder'>"+b[i].obsastBal+"</td><td id='undlrspotpurBal_row"+srno+"' class='sumder'>"+b[i].undlrspotpurBal+"</td><td id='frwdPurBal_row"+srno+"' class='sumder'>"+b[i].frwdPurBal+"</td><td id='oobsastBal_row"+srno+"' class='sumder'>"+b[i].oobsastBal+"</td><td id='shrtTermLiabBal_row"+srno+"' class='sumder'>"+b[i].shrtTermLiabBal+"</td><td id='fcrncyDepositBal_row"+srno+"' class='sumder'>"+b[i].fcrncyDepositBal+"</td><td id='obsliabBal_row"+srno+"' class='sumder'>"+b[i].obsliabBal+"</td><td id='ubdlrspotsalesBal_row"+srno+"' class='sumder'>"+b[i].ubdlrspotsalesBal+"</td><td id='frwdSales_row"+srno+"' class='sumder'>"+b[i].frwdSales+"</td><td id='oobsliabBal_row"+srno+"' class='sumder'>"+b[i].oobsliabBal+"</td></tr>") ;  
							 		  
							 		  
								 
								
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
					url : "fim0600details2",
					data : pymd1,
					dataType : 'json',
					type : 'POST',
					async : false,
					success : function(res) {	
					//	alert("refePYM100"+refePYM100);
						
						  $("#pymdets2 tr").remove();
						 
						
						var b=JSON.parse(res.det2FIM0600);
						 console.log(b);
						
				       
							 	if(f=="onload"){
							 		$(".modify").show();
							 		$("#detb2").show();

							 		for(var i=0;i<b.length;i++){
							 			
							 		  $("#pymdets2").append("<tr><td id='reportDate_row"+srno+"'>"+b[i].reportDate+"</td><td id='crncyCode_row"+srno+"'>"+b[i].crncyCode+"</td><td id='rate_row"+srno+"' class='sumder'>"+b[i].rate+"</td><td id='crncynotesBal_row"+srno+"' class='sumder'>"+b[i].crncynotesBal+"</td><td id='nostroacctBal_row"+srno+"' class='sumder'>"+b[i].nostroacctBal+"</td><td id='frwdSalesBal_row"+srno+"' class='sumder'>"+b[i].frwdSalesBal+"</td><td id='fcrncyAbroadBal_row"+srno+"' class='sumder'>"+b[i].fcrncyAbroadBal+"</td><td id='fcrncyobsastBal_row"+srno+"' class='sumder'>"+b[i].fcrncyobsastBal+"</td><td id='obsastBal_row"+srno+"' class='sumder'>"+b[i].obsastBal+"</td><td id='undlrspotpurBal_row"+srno+"' class='sumder'>"+b[i].undlrspotpurBal+"</td><td id='frwdPurBal_row"+srno+"' class='sumder'>"+b[i].frwdPurBal+"</td><td id='oobsastBal_row"+srno+"' class='sumder'>"+b[i].oobsastBal+"</td><td id='shrtTermLiabBal_row"+srno+"' class='sumder'>"+b[i].shrtTermLiabBal+"</td><td id='fcrncyDepositBal_row"+srno+"' class='sumder'>"+b[i].fcrncyDepositBal+"</td><td id='obsliabBal_row"+srno+"' class='sumder'>"+b[i].obsliabBal+"</td><td id='ubdlrspotsalesBal_row"+srno+"' class='sumder'>"+b[i].ubdlrspotsalesBal+"</td><td id='frwdSales_row"+srno+"' class='sumder'>"+b[i].frwdSales+"</td><td id='oobsliabBal_row"+srno+"' class='sumder'>"+b[i].oobsliabBal+"</td><td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row1('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row1('"+srno+"')></td></tr>") ;  
							 		  
							 		 
									
									 srno++;
									 
									
										}
									 $("#divLoading").removeClass('show');
									$("#rowno").val(srno);
							 	}else if(f=="frmsum"){
							 		$(".add").hide();//add button hide
							 	
							 		$(".modify").hide();//modify in the header hide
							 		for(var i=0;i<b.length;i++){
							 			
							 			$("#pymdets2").append("<tr><td id='reportDate_row"+srno+"'>"+b[i].reportDate+"</td><td id='crncyCode_row"+srno+"'>"+b[i].crncyCode+"</td><td id='rate_row"+srno+"' class='sumder'>"+b[i].rate+"</td><td id='crncynotesBal_row"+srno+"' class='sumder'>"+b[i].crncynotesBal+"</td><td id='nostroacctBal_row"+srno+"' class='sumder'>"+b[i].nostroacctBal+"</td><td id='frwdSalesBal_row"+srno+"' class='sumder'>"+b[i].frwdSalesBal+"</td><td id='fcrncyAbroadBal_row"+srno+"' class='sumder'>"+b[i].fcrncyAbroadBal+"</td><td id='fcrncyobsastBal_row"+srno+"' class='sumder'>"+b[i].fcrncyobsastBal+"</td><td id='obsastBal_row"+srno+"' class='sumder'>"+b[i].obsastBal+"</td><td id='undlrspotpurBal_row"+srno+"' class='sumder'>"+b[i].undlrspotpurBal+"</td><td id='frwdPurBal_row"+srno+"' class='sumder'>"+b[i].frwdPurBal+"</td><td id='oobsastBal_row"+srno+"' class='sumder'>"+b[i].oobsastBal+"</td><td id='shrtTermLiabBal_row"+srno+"' class='sumder'>"+b[i].shrtTermLiabBal+"</td><td id='fcrncyDepositBal_row"+srno+"' class='sumder'>"+b[i].fcrncyDepositBal+"</td><td id='obsliabBal_row"+srno+"' class='sumder'>"+b[i].obsliabBal+"</td><td id='ubdlrspotsalesBal_row"+srno+"' class='sumder'>"+b[i].ubdlrspotsalesBal+"</td><td id='frwdSales_row"+srno+"' class='sumder'>"+b[i].frwdSales+"</td><td id='oobsliabBal_row"+srno+"' class='sumder'>"+b[i].oobsliabBal+"</td></tr>") ;  
								 		  
								 		  
									 
									
									 srno++;
									
									
										}
							 		 $("#divLoading").removeClass('show');
							 	}
								
								
							 $("#divLoading").removeClass('show'); 
							$('.alnum').mask("#,##0.00", {reverse: true}); 
						
							}
							

							
					
				}); 
				
				 var pymd2 = {
							"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
						}; 
						
					$.ajax({
						url : "fim0600details3",
						data : pymd2,
						dataType : 'json',
						type : 'POST',
						async : false,
						success : function(res) {	
						//	alert("refePYM100"+refePYM100);
							
							  $("#pymdets3 tr").remove();
							 
							
							var b=JSON.parse(res.det3FIM0600);
							 console.log(b);
							
					       
								 	if(f=="onload"){
								 		$(".modify").show();
								 		for(var i=0;i<b.length;i++){
								 			
								 		  $("#pymdets3").append("<tr><td id='instype"+srno+"'>"+b[i].instype+"</td><td id='trnnat"+srno+"'>"+b[i].trnnat+"</td><td id='prps"+srno+"'>"+b[i].prps+"</td><td id='orgcrncy"+srno+"'>"+b[i].orgcrncy+"</td><td id='amt"+srno+"' class='sumder'>"+b[i].amt+"</td><td id='exchgrt"+srno+"' >"+b[i].exchgrtd+"</td><td id='repdt"+srno+"'>"+b[i].repdt+"</td><td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>") ;  
								 		  
								 		 
										
										 srno++;
										 
										
											}
										 $("#divLoading3").removeClass('show');
										$("#rowno").val(srno);
								 	}else if(f=="frmsum"){
								 		$(".add").hide();//add button hide
								 	
								 		$(".modify").hide();//modify in the header hide
								 		for(var i=0;i<b.length;i++){
								 			
								 			$("#pymdets3").append("<tr><td id='instype"+srno+"'>"+b[i].instype+"</td><td id='trnnat"+srno+"'>"+b[i].trnnat+"</td><td id='prps"+srno+"' >"+b[i].prps+"</td><td id='orgcrncy"+srno+"' >"+b[i].orgcrncy+"</td><td id='amt"+srno+"' class='sumder'>"+b[i].amt+"</td><td id='exchgrtd"+srno+"' >"+b[i].exchgrt+"</td><td id='repdt"+srno+"' >"+b[i].repdt+"</td></tr>") ;  
									 		  
									 		  
										 
										
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
				
				  
				 $(".repdisp").text(refno);
			
					
						$("#sec1 tr").children().detach().remove();
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "fim0600sec1",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec1 tr").remove();
								 
								
								var b=JSON.parse(res.sec1FIM0600);
								 console.log(b);
								
                                 
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec1").append("<tr><td id='applno"+srno+"'>"+b[i].instanceName+"</td><td id='applname"+srno+"'>"+b[i].instanceCode+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].value+"</td><td style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads(1) id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   	
						
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
						
						$.ajax({
							url : "fim0600sec2",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec2 tr").remove();
								 
								
								var b=JSON.parse(res.sec2FIM0600);
								 console.log(b);
								
                                 
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec2").append("<tr><td id='applno"+srno+"'>"+b[i].instanceName+"</td><td id='applname"+srno+"'>"+b[i].instanceCode+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].midExchRate+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].notesCoins+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].liquidBalance+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].balanceSales+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].balanceAbroadbnk+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].otherBalanceSales+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].otherAsset+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].spotPurchase+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].forwardPurchase+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].offOtherAsset+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].totalAsset+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].shortTermLiab+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].depFC+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].otherLiab+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].spotSale+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].forwardSale+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].offOtherLiab+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].totalLiab+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].openPosition+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].openPositionPercent+"</td><td><input type=radio style=width: 15px; onclick=fnloads(1) id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   	
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "fim0600sec3",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec3 tr").remove();
								 
								
								var b=JSON.parse(res.sec3FIM0600);
								 console.log(b);
								
                                 
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec3").append("<tr><td id='applno"+srno+"'>"+b[i].slNo+"</td><td id='applname"+srno+"'>"+b[i].instituteType+"</td><td id='schmtyp"+srno+"'>"+b[i].natureofTran+"</td><td id='schmtyp"+srno+"'>"+b[i].purpose+"</td><td id='schmtyp"+srno+"'>"+b[i].acctCurrency+"</td><td id='schmtyp"+srno+"' class='sumder'>"+b[i].outAmt+"</td><td id='schmtyp"+srno+"' class='sumder' >"+b[i].exchgRate+"</td><td id='schmtyp"+srno+"' class='alnum sumder'>"+b[i].outamtBC+"</td><td style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads(1) id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   	
						
						
						
						
						
						
					}
				 
	 }
	 
function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_FIM0600.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno=0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>'+"&cnt="+cnt;

 

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

	<%-- if('<%=reptype%>'=="PSC0106" || '<%=reptype%>'=="psc0106"){
		
		$(".psc0106,#tb").show();
		
		$(".psc0105").hide();
	}else if('<%=reptype%>'=="PSC0105" || '<%=reptype%>'=="psc0105"){
		
		$(".psc0105").show();
		$(".psc0106").hide();
	}
	 --%>
	
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	

	
	$( '#btnback').click(function() {
		 location.href="XBRL_CRT_FIM0600.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	
 	
	$("#btnfilter").on("click",function(){
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
		}else{
			$(".form-control2").val("");
			$(".form-control2").prop("disabled",true);
		}
		
	});
	
	$(window).load(function() {
		 
	    $(".loader").fadeOut("slow");
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
	if(b==0 ||b==2 || b==3 ||b==4 ||b==5 || b==6 || b==7 ||b==8 || b==9 ||b==10 ||b==11 || b==12  ||b==13 || b==14 ||b==15 ||b==16 || b==17 ){
		
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
function myFunctio(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("pymdets2");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==0 ||b==2 || b==3 ||b==4 ||b==5 || b==6 || b==7 ||b==8 || b==9 ||b==10 ||b==11 || b==12  ||b==13 || b==14 ||b==15 ||b==16 || b==17 ){
		
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
  table = document.getElementById("pymdets3");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
	 
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==4 || b==5|| b==6){
		
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

function functionli(a){
	$(".table").hide();
	$("#tb"+a).show();
	
	
/* $("#btnXML").attr("disabled",true); */
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

else {
	$("#btnSave").show();
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li2").addClass("active");
	 $("#li1").removeClass("active");
}

} 

var tabid=1;
function funli(a){
	
	$("#rownoadd").val(a);
	$(".table").hide();
	$("#detb"+a).show();
	tabid=a;
	//alert("#detb"+a);
	if(a==1){
		
		$("#btnpre").prop("disabled",true);
		 $("#btnnext").prop("disabled",false);
		 $("#li1").addClass("active");
		 $("#li2,#li3").removeClass("active");
	}else if(a==2){
		$("#btnpre").prop("disabled",false);
		 $("#btnnext").prop("disabled",true);
		 $("#li2").addClass("active");
		 $("#li1,#li3").removeClass("active");
	}

	else {
		$("#btnpre").prop("disabled",false);
		 $("#btnnext").prop("disabled",true);
		 $("#li3").addClass("active");
		 $("#li1,#li2").removeClass("active");
	}
	
}

</script>

<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	
	
	
 	
$("#sumfirst").on("click",function(){
		
		location.href = "XBRL_REP_FIM0600.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	
$(".det").on("click",function(){
		$("#tb1").show();
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_FIM0600.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	
	$("#sumfrst").click(function(){
		 
    	
		  location.href = "XBRL_REP_FIM0600.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		
});
	$("#addrowno").val("0");
	
	
	
	$('#btnExcel').click(function() {
		
		 FIM0600Form.action = "FIM0600EXCELREPORT.action?method=FIM0600EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 FIM0600Form.submit();
	});
	$("#btndwnld").on("click",function(){
		
		if($("#dnloadfrmt").val()=="excel"){
 		 FIM0600Form.action = "FIM0600EXCELSum.action?method=FIM0600EXCELSums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 FIM0600Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 FIM0600Form.action = "FIM0600PDFREPORT.action?method=FIM0600PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 FIM0600Form.submit();
		} 
	});
	$('#btnXML').click(function() {
		  FIM0600Form.action = "XMLDOWNLOADf6.action?method=blsxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 FIM0600Form.submit(); 
	});
	var save=0;

	$('#btnSave').on("click",function() {
		  $("#divLoading").addClass('show'); 
		  var datasum={
				"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").text()
		};
		$.ajax({
			url:"saveSumfim",
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
				 $("#divLoading").removeClass('show');
			}
		});  
	
			 
		 
	});

	$("#addrow").on("click",function(){
		
	//function funadd(a){
		var rowno=$("#rowno").val();
		$("#addrowno").val("1"); 
		
		if(tabid==1){
			$("#pymdets"+tabid).prepend("<tr><td id='reportDate_row"+rowno+"'><input type='text'  id='reportDate_text"+rowno+"' style='    width:117px;'></td><td id='crncyCode_row"+rowno+"'><input type='text' id='crncyCode_text"+rowno+"' style='     width: 121px;'></td><td class='sumder alnum' id='rate_row"+rowno+"'><input type='text' 	id='rate_text"+rowno+"' class='decimalPt roundUp' style='    width:106px;'></td><td class='sumder alnum' id='crncynotesBal_row"+rowno+"'><input type='text'  id='crncynotesBal_text"+rowno+"' class='decimalPt roundUp' style='    width:106px;'></td><td class='sumder alnum' id='nostroacctBal_row"+rowno+"'><input type='text' id='nostroacctBal_text"+rowno+"' class='decimalPt roundUp' style='     width: 106px;'></td><td class='sumder alnum' id='frwdSalesBal_row"+rowno+"'><input type='text' 	id='frwdSalesBal_text"+rowno+"' class='decimalPt roundUp' style='    width: 106px;'></td><td class='sumder alnum' id='fcrncyAbroadBal_row"+rowno+"'><input type='text'  id='fcrncyAbroadBal_text"+rowno+"' class='decimalPt roundUp' style='    width:106px;'></td><td class='sumder alnum' id='fcrncyobsastBal_row"+rowno+"'><input type='text' id='fcrncyobsastBal_text"+rowno+"' class='decimalPt roundUp'style='     width: 106px;'></td><td class='sumder alnum' id='obsastBal_row"+rowno+"'><input type='text' 	id='obsastBal_text"+rowno+"' class='decimalPt roundUp' style='    width: 106px;'></td><td class='sumder alnum' id='undlrspotpurBal_row"+rowno+"'><input type='text' id='undlrspotpurBal_text"+rowno+"' class='decimalPt roundUp' style='width: 106px;'></td><td class='sumder alnum' id='frwdPurBal_row"+rowno+"'><input type='text'  id='frwdPurBal_text"+rowno+"' class='decimalPt roundUp' style='    width:117px;'></td><td class='sumder alnum' id='oobsastBal_row"+rowno+"'><input type='text' id='oobsastBal_text"+rowno+"' class='decimalPt roundUp' style='     width: 106px;'></td><td class='sumder alnum' id='shrtTermLiabBal_row"+rowno+"'><input type='text' 	id='shrtTermLiabBal_text"+rowno+"' class='decimalPt roundUp' style='    width: 106px;'></td><td class='sumder alnum' id='fcrncyDepositBal_row"+rowno+"'><input type='text' id='fcrncyDepositBal_text"+rowno+"' class='decimalPt roundUp' style='    width: 106px;'></td><td class='sumder alnum' id='obsliabBal_row"+rowno+"'><input type='text' id='obsliabBal_text"+rowno+"' class='decimalPt roundUp' style='    width: 106px;'></td><td class='sumder alnum' id='ubdlrspotsalesBal_row"+rowno+"'><input type='text' id='ubdlrspotsalesBal_text"+rowno+"' class='decimalPt roundUp' style='width: 106px;'></td><td class='sumder alnum' id='frwdSales_row"+rowno+"'><input type='text'  id='frwdSales_text"+rowno+"' class='decimalPt roundUp' style='    width:106px;'></td><td class='sumder alnum' id='oobsliabBal_row"+rowno+"'><input type='text' id='oobsliabBal_text"+rowno+"' class='decimalPt roundUp' style='     width: 106px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row1('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row1('"+rowno+"')></td></tr>");
			}else if(tabid==2){
				$("#pymdets"+tabid).prepend("<tr><td id='reportDate_row"+rowno+"'><input type='text'  id='reportDate_text"+rowno+"' style='    width:117px;'></td><td id='crncyCode_row"+rowno+"'><input type='text' id='crncyCode_text"+rowno+"' style='     width: 121px;'></td><td class='sumder alnum' id='rate_row"+rowno+"'><input type='text' 	id='rate_text"+rowno+"' class='decimalPt roundUp' style='    width:106px;'></td><td class='sumder alnum' id='crncynotesBal_row"+rowno+"'><input type='text'  id='crncynotesBal_text"+rowno+"' class='decimalPt roundUp' style='    width:106px;'></td><td class='sumder alnum' id='nostroacctBal_row"+rowno+"'><input type='text' id='nostroacctBal_text"+rowno+"' class='decimalPt roundUp' style='     width: 106px;'></td><td class='sumder alnum' id='frwdSalesBal_row"+rowno+"'><input type='text' 	id='frwdSalesBal_text"+rowno+"' class='decimalPt roundUp' style='    width: 106px;'></td><td class='sumder alnum' id='fcrncyAbroadBal_row"+rowno+"'><input type='text'  id='fcrncyAbroadBal_text"+rowno+"' class='decimalPt roundUp' style='    width:106px;'></td><td class='sumder alnum' id='fcrncyobsastBal_row"+rowno+"'><input type='text' id='fcrncyobsastBal_text"+rowno+"' class='decimalPt roundUp'style='     width: 106px;'></td><td class='sumder alnum' id='obsastBal_row"+rowno+"'><input type='text' 	id='obsastBal_text"+rowno+"' class='decimalPt roundUp' style='    width: 106px;'></td><td class='sumder alnum' id='undlrspotpurBal_row"+rowno+"'><input type='text' id='undlrspotpurBal_text"+rowno+"' class='decimalPt roundUp' style='width: 106px;'></td><td class='sumder alnum' id='frwdPurBal_row"+rowno+"'><input type='text'  id='frwdPurBal_text"+rowno+"' class='decimalPt roundUp' style='    width:117px;'></td><td class='sumder alnum' id='oobsastBal_row"+rowno+"'><input type='text' id='oobsastBal_text"+rowno+"' class='decimalPt roundUp' style='     width: 106px;'></td><td class='sumder alnum' id='shrtTermLiabBal_row"+rowno+"'><input type='text' 	id='shrtTermLiabBal_text"+rowno+"' class='decimalPt roundUp' style='    width: 106px;'></td><td class='sumder alnum' id='fcrncyDepositBal_row"+rowno+"'><input type='text' id='fcrncyDepositBal_text"+rowno+"' class='decimalPt roundUp' style='    width: 106px;'></td><td class='sumder alnum' id='obsliabBal_row"+rowno+"'><input type='text' id='obsliabBal_text"+rowno+"' class='decimalPt roundUp' style='    width: 106px;'></td><td class='sumder alnum' id='ubdlrspotsalesBal_row"+rowno+"'><input type='text' id='ubdlrspotsalesBal_text"+rowno+"' class='decimalPt roundUp' style='width: 106px;'></td><td class='sumder alnum' id='frwdSales_row"+rowno+"'><input type='text'  id='frwdSales_text"+rowno+"' class='decimalPt roundUp' style='    width:106px;'></td><td class='sumder alnum' id='oobsliabBal_row"+rowno+"'><input type='text' id='oobsliabBal_text"+rowno+"' class='decimalPt roundUp' style='     width: 106px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row1('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row1('"+rowno+"')></td></tr>");

			}else{
				$("#pymdets"+tabid).prepend("<tr><td id='instype_row"+rowno+"'><input type='text'  id='instype_text"+rowno+"' style='    width:117px;'></td><td id='trnnat_row"+rowno+"'><input type='text' id='trnnat_text"+rowno+"' style='     width: 121px;'></td><td id='prps_row"+rowno+"'><input type='text' 	id='prps_text"+rowno+"' style='    width: 242px;'></td><td id='orgcrncy_row"+rowno+"'><input type='text'  id='orgcrncy_text"+rowno+"' style='    width:117px;'></td><td class='sumder alnum' id='amt_row"+rowno+"'><input type='text' id='amt_text"+rowno+"' class='decimalPt roundUp' style='     width: 121px;'></td><td id='exchgrt_row"+rowno+"'><input type='text' 	id='exchgrt_text"+rowno+"' style='    width: 242px;'></td><td id='repdt_row"+rowno+"'><input type='text' 	id='repdt_text"+rowno+"' style='    width: 242px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");
			}
			

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
			$( "#reportDate_text"+rowno ).datepicker({
				
		    	
				dateFormat: "dd-mm-yy",
		        changeMonth: true,//this option for allowing user to select month
				      changeYear: true,
				      yearRange: "-100:+0",
				      maxDate: "today"
			   }); 
			   
			   $( "#repdt_text"+rowno ).datepicker({
					
			    	
					dateFormat: "dd-mm-yy",
			        changeMonth: true,//this option for allowing user to select month
					      changeYear: true,
					      yearRange: "-100:+0",
					      maxDate: "today"
				   }); 
		});


		
});	


</script>

<script>
 
   
function edit_row1(no)
{
	//alert("happyyyyyyyyyyyyy");
//alert("hiii 2d AGccccccccc" +  edit_row(no));
$(".add").attr("disabled",true);
$("#addrowno").val("0");
 	
 	document.getElementById("edit_button"+no).style.display="none";
 	  document.getElementById("save_button"+no).style.display="block";
 	 	
 
 	  
 	 
  
  var	oobsliabBal =  document.getElementById("oobsliabBal_row"+no);
  
 var	oobsliabBal_data = oobsliabBal.innerHTML;
 
 

  
  
 
 oobsliabBal.innerHTML="<input type='text' class='decimalPt roundUp'  id='oobsliabBal_text"+no+"'  style='width: 83px'; value='"+oobsliabBal_data+"'>";
 

 
 
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

function save_row1(no)
{



	$(".add").attr("disabled",false);
	document.getElementById("edit_button"+no).checked = false;
	
	  
	
	var oobsliabBal_val=document.getElementById("oobsliabBal_text"+no).value;
	
	

	document.getElementById("oobsliabBal_row"+no).innerHTML=oobsliabBal_val;
	
	
	if($("#addrowno").val()=="1"){
	var  reportDate_val=document.getElementById("reportDate_text"+no).value;	 
	document.getElementById("reportDate_row"+no).innerHTML=reportDate_val;
	
	   var crncyCode_val=document.getElementById("crncyCode_text"+no).value;
	   document.getElementById("crncyCode_row"+no).innerHTML=crncyCode_val;
	   
	  var rate_val=document.getElementById("rate_text"+no).value;
	   document.getElementById("rate_row"+no).innerHTML=rate_val;
	   
	  
	  
	  var crncynotesBal_val=document.getElementById("crncynotesBal_text"+no).value;	
	  document.getElementById("crncynotesBal_row"+no).innerHTML=crncynotesBal_val;
	 
	  var nostroacctBal_val=document.getElementById("nostroacctBal_text"+no).value;
	  document.getElementById("nostroacctBal_row"+no).innerHTML=nostroacctBal_val;
	  
	
	  var frwdSalesBal_val=document.getElementById("frwdSalesBal_text"+no).value;
		 
	  document.getElementById("frwdSalesBal_row"+no).innerHTML=frwdSalesBal_val;
	
	
	  var fcrncyAbroadBal_val=document.getElementById("fcrncyAbroadBal_text"+no).value;
		 
	  document.getElementById("fcrncyAbroadBal_row"+no).innerHTML=fcrncyAbroadBal_val;
	  
	  var fcrncyobsastBal_val=document.getElementById("fcrncyobsastBal_text"+no).value;
		 
	  document.getElementById("fcrncyobsastBal_row"+no).innerHTML=fcrncyobsastBal_val;
	  
	  var obsastBal_val=document.getElementById("obsastBal_text"+no).value;	 
		document.getElementById("obsastBal_row"+no).innerHTML=obsastBal_val;
		
		   var undlrspotpurBal_val=document.getElementById("undlrspotpurBal_text"+no).value;
		   document.getElementById("undlrspotpurBal_row"+no).innerHTML=undlrspotpurBal_val;
		   
		  var frwdPurBal_val=document.getElementById("frwdPurBal_text"+no).value;
		   document.getElementById("frwdPurBal_row"+no).innerHTML=frwdPurBal_val;
		   
		  

		   var oobsastBal_val=document.getElementById("oobsastBal_text"+no).value;
		   document.getElementById("oobsastBal_row"+no).innerHTML=oobsastBal_val;
		   
		
		   var  shrtTermLiabBal_val=document.getElementById("shrtTermLiabBal_text"+no).value;	 
			document.getElementById("shrtTermLiabBal_row"+no).innerHTML=shrtTermLiabBal_val;
			
    var obsliabBal_val=document.getElementById("obsliabBal_text"+no).value;
		   document.getElementById("obsliabBal_row"+no).innerHTML=obsliabBal_val;
		   

		   var fcrncyDepositBal_val=document.getElementById("fcrncyDepositBal_text"+no).value;
		   document.getElementById("fcrncyDepositBal_row"+no).innerHTML=fcrncyDepositBal_val;
		   
		  
			
		   var  ubdlrspotsalesBal_val=document.getElementById("ubdlrspotsalesBal_text"+no).value;	 
			document.getElementById("ubdlrspotsalesBal_row"+no).innerHTML=ubdlrspotsalesBal_val;
			
   

		   var frwdSales_val=document.getElementById("frwdSales_text"+no).value;
		   document.getElementById("frwdSales_row"+no).innerHTML=frwdSales_val;
		   
		  
			
	  
	  
	}
	
	document.getElementById("edit_button"+no).style.display="block";
	document.getElementById("save_button"+no).style.display="none";
	 var  reportDate=document.getElementById("reportDate_row"+no).innerHTML;	 
	   var crncyCode=document.getElementById("crncyCode_row"+no).innerHTML;
	  var rate=document.getElementById("rate_row"+no).innerHTML;
	  var crncynotesBal=document.getElementById("crncynotesBal_row"+no).innerHTML;
	  var nostroacctBal=document.getElementById("nostroacctBal_row"+no).innerHTML;	
	  var frwdSalesBal=document.getElementById("frwdSalesBal_row"+no).innerHTML;	
	  var fcrncyAbroadBal=document.getElementById("fcrncyAbroadBal_row"+no).innerHTML;
	  var fcrncyobsastBal=document.getElementById("fcrncyobsastBal_row"+no).innerHTML;
	 var  obsastBal=document.getElementById("obsastBal_row"+no).innerHTML;	 
	 var undlrspotpurBal=document.getElementById("undlrspotpurBal_row"+no).innerHTML;
	  var frwdPurBal=document.getElementById("frwdPurBal_row"+no).innerHTML;
	 var oobsastBal=document.getElementById("oobsastBal_row"+no).innerHTML;
	 var  shrtTermLiabBal=document.getElementById("shrtTermLiabBal_row"+no).innerHTML;	 
    var fcrncyDepositBal=document.getElementById("fcrncyDepositBal_row"+no).innerHTML;
	var obsliabBal=document.getElementById("obsliabBal_row"+no).innerHTML;
	var  ubdlrspotsalesBal=document.getElementById("ubdlrspotsalesBal_row"+no).innerHTML;	 
	  var frwdSales=document.getElementById("frwdSales_row"+no).innerHTML;
	 var oobsliabBal=document.getElementById("oobsliabBal_row"+no).innerHTML;
			
	
	 $("#det1 td").attr("padding","8px");
	var refeFIM0600=document.getElementById("refDisplay").innerHTML;
	oobsliabBal=oobsliabBal.replace(/\,/g,'')
	  oobsliabBal=Number(oobsliabBal)
	  
	  rate=rate.replace(/\,/g,'')
	  rate=Number(rate)
	  
	  crncynotesBal=crncynotesBal.replace(/\,/g,'')
	  crncynotesBal=Number(crncynotesBal)
	  
	  nostroacctBal=nostroacctBal.replace(/\,/g,'')
	  nostroacctBal=Number(nostroacctBal)
	  
	  frwdSalesBal=frwdSalesBal.replace(/\,/g,'')
	  frwdSalesBal=Number(frwdSalesBal)
	  
	  fcrncyAbroadBal=fcrncyAbroadBal.replace(/\,/g,'')
	  fcrncyAbroadBal=Number(fcrncyAbroadBal)
	  
	  fcrncyobsastBal=fcrncyobsastBal.replace(/\,/g,'')
	  fcrncyobsastBal=Number(fcrncyobsastBal)
	  
         obsastBal=obsastBal.replace(/\,/g,'')
	  obsastBal=Number(obsastBal)
	  
	  undlrspotpurBal=undlrspotpurBal.replace(/\,/g,'')
	  undlrspotpurBal=Number(undlrspotpurBal)
	  
	  frwdPurBal=frwdPurBal.replace(/\,/g,'')
	  frwdPurBal=Number(frwdPurBal)
	  
	  oobsastBal=oobsastBal.replace(/\,/g,'')
	  oobsastBal=Number(oobsastBal)
	  
	  shrtTermLiabBal=shrtTermLiabBal.replace(/\,/g,'')
	  shrtTermLiabBal=Number(shrtTermLiabBal)
	  
	  fcrncyDepositBal=fcrncyDepositBal.replace(/\,/g,'')
	  fcrncyDepositBal=Number(fcrncyDepositBal)
	  
	  obsliabBal=obsliabBal.replace(/\,/g,'')
	  obsliabBal=Number(obsliabBal)
	  
	  ubdlrspotsalesBal=ubdlrspotsalesBal.replace(/\,/g,'')
	  ubdlrspotsalesBal=Number(ubdlrspotsalesBal)
	  
	  frwdSales=frwdSales.replace(/\,/g,'')
	  frwdSales=Number(frwdSales)
	  
	 
	 var rptdate1 = {
			     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeFIM0600, "reportDate":reportDate,"crncyCode":crncyCode,"rate" : rate,"crncynotesBal":crncynotesBal, "nostroacctBal":nostroacctBal,"frwdSalesBal":frwdSalesBal,"fcrncyAbroadBal":fcrncyAbroadBal,"fcrncyobsastBal":fcrncyobsastBal, "obsastBal":obsastBal,"undlrspotpurBal":undlrspotpurBal,"frwdPurBal" : frwdPurBal, "oobsastBal":oobsastBal,"shrtTermLiabBal":shrtTermLiabBal,"fcrncyDepositBal":fcrncyDepositBal,"obsliabBal" : obsliabBal,"ubdlrspotsalesBal":ubdlrspotsalesBal,"frwdSales":frwdSales,"oobsliabBal" : oobsliabBal
			}; 
	 
	 $.ajax({
	     url : "FIM06001",
	     data : rptdate1  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 console.log(res.refno);
				//	alert("refePYM100"+refePYM100);
				
				// alert("sfsdf");
				/*  $("#refDisplay").html(res.refno); */
				 $(".repdisp").html(res.refno);
				
				 
			}
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


   var instype_val=document.getElementById("instype_text"+no).value;
   document.getElementById("instype_row"+no).innerHTML=instype_val;
   
  var trnnat_val=document.getElementById("trnnat_text"+no).value;
   document.getElementById("trnnat_row"+no).innerHTML=trnnat_val;
 

   var prps_val=document.getElementById("prps_text"+no).value;
   document.getElementById("prps_row"+no).innerHTML=prps_val;
   
  var orgcrncy_val=document.getElementById("orgcrncy_text"+no).value;
   document.getElementById("orgcrncy_row"+no).innerHTML=orgcrncy_val;
 
   var exchgrt_val=document.getElementById("exchgrt_text"+no).value;
   document.getElementById("exchgrt_row"+no).innerHTML=exchgrt_val;
   
  var repdt_val=document.getElementById("repdt_text"+no).value;
   document.getElementById("repdt_row"+no).innerHTML=repdt_val;
 
   
   
}

document.getElementById("edit_button"+no).style.display="block";
document.getElementById("save_button"+no).style.display="none";
 var instype=document.getElementById("instype_row"+no).innerHTML;
  var trnnat=document.getElementById("trnnat_row"+no).innerHTML;
  var prps=document.getElementById("prps_row"+no).innerHTML;
  var orgcrncy=document.getElementById("orgcrncy_row"+no).innerHTML;
  var exchgrt=document.getElementById("exchgrt_row"+no).innerHTML;
  var repdt=document.getElementById("repdt_row"+no).innerHTML;

  var amt=document.getElementById("amt_row"+no).innerHTML;
 


 $("#det2 td").attr("padding","8px");
var refeBLS600=document.getElementById("refDisplay").innerHTML;
amt=amt.replace(/\,/g,'')
  amt=Number(amt)

 var rptdate1 = {
		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeBLS600, "instype":instype,"trnnat" : trnnat,"prps":prps,"orgcrncy" : orgcrncy,"amt":amt ,"exchgrt":exchgrt,"repdt" : repdt
		}; 
 
 $.ajax({
     url : "FIM0600",
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
 
   
    <form class="form-horizontal" method="post" name="FIM0600Form"
		enctype="multipart/form-data">
 		
	
			<div id="nav">
				<div class="loader"></div>
		
             	
	 	<div class="active"  id="tab2" style="width: 1968px;padding-top: 1px;margin-top: -17px;" >
	 	<div   id="tab2"  style="margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b><%=reptype %> - Foreign Exchange Exposure<b id="sub"
					Style="display: none"></b></b></font>
			</div>  
	<input type="hidden" id="rownoadd">
		<ul class="nav nav-tabs navright"  id="mytab" style="width: 100%;">

		
             <li class=" pull-right list" onclick="functionli(3);"><a href="#btntab3" data-toggle="tab"><span
							class="headingtab">3</span></a></li>
					<li class=" pull-right list" onclick="functionli(2);"><a href="#btntab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>	
							
						<li class=" pull-right active list" onclick="functionli(1);"><a href="#btntab1" data-toggle="tab"><span
							class="headingtab">1</span></a></li>	

				</ul>
				 
					<table class=""  id="mytab" style="width:1968px;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
          		  </table>
			
          
				   <table class="table" id="tb1" style="width:100%;display:none;margin-top:-20px;">
            <tr>
          <th rowspan="2"></th>
          <th rowspan="2"></th>
          <th colspan="1" style="text-align:center">A</th>
          <th rowspan="3" style="text-align:center">Select</th>
          </tr>
          
          
           <tbody class="databody" id="sec1"></tbody>
          
          
          </table>
				
		
				   <table class="table" id="tb2" style="width:100%;display:none;margin-top:-20px;">
            <tr><th rowspan="5" style="text-align:center">Foreign Currency</th>
                 <th rowspan="5" style="text-align:center"></th>
                <th colspan="1" rowspan="4" style="text-align:center" >Mid Exchange Rate</th>
           
             
         <th colspan="10" style="text-align:center" >Foreign Currency Assets</th>
         
         <th colspan="7" style="text-align:center" >Foreign Currency Liabilities</th>
               
                <th colspan="1" rowspan="4" style="text-align:center" >Net Open Position (+ or -)</th>
                <th colspan="1" rowspan="4" style="text-align:center" >Net Open Position as % of Tier 1</th>
                <th rowspan="5" style="text-align:center">Select</th>
          
          </tr>
          
          
          
          
          <tr>
          <th   colspan="6" style="text-align:center">BALANCE SHEET ITEMS	</th>
          <th  colspan="3" style="text-align:center">OFF BALANCE SHEET ITEMS</th>
          <th   colspan="1" rowspan="3" style="text-align:center">Total assets on and off balance sheet items</th> 
          
          <th colspan="3"  style="text-align:center">BALANCE SHEET ITEMS	</th>
          <th colspan="3"  style="text-align:center">OFF BALANCE SHEET ITEMS	</th>  
          <th colspan="1"  rowspan="3" style="text-align:center">Total liabilities on and off balance sheet items </th>
                 
          </tr>
          
            <tr>
          <th rowspan="1"  colspan="3" style="text-align:center">Liquid Assets</th>
          <th rowspan="1" colspan="2" style="text-align:center">Balances held against forward sales</th>
          <th rowspan="2"  style="text-align:center">Other Balance Sheet Assets</th>
          
             <th  rowspan="2" style="text-align:center">Undelivered Spot Purchases	</th>
          <th  rowspan="2" style="text-align:center">Forward Purchases	</th>  
          <th  rowspan="2" style="text-align:center">Other Off Balance Sheet Assets </th>
          <th colspan="1" rowspan="2"  style="text-align:center" >Short Term Liabilities</th>
           <th colspan="1" rowspan="2"  style="text-align:center" >Deposits in foreign currency</th>
            <th colspan="1" rowspan="2"  style="text-align:center" >Other Balance Sheet Liabilities</th>
           <th colspan="1" rowspan="2"  style="text-align:center">Undelivered Spot Sales	</th>
          <th colspan="1" rowspan="2"   style="text-align:center">Forward Sales	</th>  
          <th colspan="1" rowspan="2"  style="text-align:center">Other Off Balance Sheet Liablities </th>
          </tr>
          
            <tr>
           <th colspan="1"   style="text-align:center" >Notes and Coins</th>
                <th colspan="1"  style="text-align:center" >Liquid Balances(Nostro)</th>
                <th colspan="1"  style="text-align:center" >Balances Held Against Forward Sales</th>
                 <th colspan="1"  style="text-align:center" >Balances with Banks Abroad</th>
                 
                 <th   style="text-align:center" >Other Balance Sheet Assets loans and Overdraft balances</th> 
        
          
       
         
         
                
          </tr> 
          
        
             <tr>
                
               <th style="text-align:center">B</th>
                 <th style="text-align:center">C</th>
                  <th style="text-align:center">D</th>
                   <th style="text-align:center">E</th>
                    <th style="text-align:center">F</th>
                     <th style="text-align:center">G</th>
                      <th style="text-align:center">H</th>
                       <th style="text-align:center">I</th>
                        <th style="text-align:center">J</th>
                         <th style="text-align:center">K</th>
                          <th style="text-align:center">L</th>
                           <th style="text-align:center">M</th>
                            <th style="text-align:center">N</th>
                             <th style="text-align:center">O</th>
                              <th style="text-align:center">P</th>
                               <th style="text-align:center">Q</th>
                                <th style="text-align:center">R</th>
                                 <th style="text-align:center">S</th>
                                  <th style="text-align:center">T</th>
                                   <th style="text-align:center">U</th>
          
          </tr>
          
             <tbody class="databody" id="sec2"></tbody>
          </table>
				
			
            <table class="table" id="tb3" style="width:100%;display:none;margin-top:-20px;">
            <tr><th colspan="9" style="text-align:center">Details of Structural Positions</th>
            
            </tr>
            <tr>
            <th rowspan="5" style="text-align:center">Institution Sr.No.</th>
             
          </tr>
        
    
          <tr>
          <th colspan="1" style="text-align:center">Type of Institution</th>
          <th colspan="1" style="text-align:center">Nature of Transactions</th>
          
          <th colspan="1"  style="text-align:center">Purpose</th>
          <th colspan="1"  style="text-align:center">Original Currency</th>
          <th colspan="1"   style="text-align:center">Amount outstanding in original currency</th>
          <th colspan="1"  style="text-align:center">Exchange rate</th>
          <th colspan="1"  style="text-align:center">MUR equivalent</th>
          <th rowspan="5" style="text-align:center">Select</th>
          </tr>
           
         
           <tr>
           <th  style="text-align:center">V</th>
          <th style="text-align:center">W</th> 
          <th style="text-align:center">X</th>
          <th style="text-align:center">Y</th>
           <th style="text-align:center">Z</th>
           <th style="text-align:center">AA</th>
           <th style="text-align:center">AB</th>
          
     </tr>
             <tbody class="databody" id="sec3"></tbody>
          </table>
          
              
	
	
	
			
		 <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
      <!-- <button type="button" class="btn btn-xs btn-primary"   value="back" id="btnpre">Previous</button> -->
    
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
       <!-- <button type="button" class="btn btn-xs btn-primary"   value="back" id="btnnext">Next</button> -->
      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div>
          
            </div>
			<!-- DETAILS -->
   <div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			<div class="active" id="tab1" style="width: 2504px;padding-top: 1px;margin-top: -17px;" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>Foreign Exchange Exposure
			
			<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;">FIM0600 <b id="sub" style="display: none"></b></b></div>
			
			<div id="divLoading"> 
			
    </div>
       <ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">
       
       <li class=" pull-right  list" onclick="funli(3);" id="li3" ><a href="#btndetb3"
						data-toggle="tab"><span class="headingtab" >
								3 </span></a></li>


					<li class=" pull-right list" onclick="funli(2);" id="li2"><a href="#btndetb2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" onclick="funli(1);"id="li1" ><a href="#btndetb1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>



				</ul>
				
    
          <table class="" style="width:2504px;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width: 325px;"></td><td style="background-color: #bbc3cb;text-align:right;">
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
					 <tr class="filters">
					 
						<th ><input type="text" style="width: 57px;" onkeyup="myFunction(this.id,0)" class="form-control2" id="repdt" placeholder="Report Date" disabled></th>
						<!-- <th id="chalpha">Cheque Alpha</th>					 -->	
						<th ><input style="width: 72px;" type="text" id="curncycode" onkeyup="myFunction(this.id,1)" class="form-control2" placeholder="Currency Code" disabled></th>						
						<th ><input style="width: 55px;" type="text" id="exchgrt" onkeyup="myFunction(this.id,2)" class="form-control2" placeholder="Exchg Rate" disabled> </th>						
						<th  style=""><input style="width: 116px;" type="text" id="curr" onkeyup="myFunction(this.id,3)" class="form-control2" placeholder="Currency Notes Balance" disabled></th>
						<th ><input style="width: 116px;" type="text" id="nosaccbal" class="form-control2" onkeyup="myFunction(this.id,4)" placeholder="Nostro Account Balance" disabled></th>
						<!-- <th id="valdate">Value Date</th> -->
						<th  style=""><input style="width: 116px;" type="text" id="frwdsalbal"  onkeyup="myFunction(this.id,5)" class="form-control2" placeholder="Forward Sales Balance" disabled></th>						
						<th ><input style="width: 163px;" type="text" class="form-control2" id="frcurncyabal" onkeyup="myFunction(this.id,6)" placeholder="Foreign Currency Abroad Balance" disabled></th>
						<th ><input style="width: 172px;" type="text" class="form-control2" id="frcurncyobsbal" onkeyup="myFunction(this.id,7)" placeholder="Foreign Currency OBS AST Balance" disabled></th>
						<th ><input style="width: 82px;" type="text" class="form-control2" id="obsastbal" onkeyup="myFunction(this.id,8)" placeholder="OBS Ast Balance" disabled></th>
						<th ><input style="width: 127px;" type="text" class="form-control2" id="undelpurespotbal" onkeyup="myFunction(this.id,9)" placeholder="Undelivered Pure Spot Bal" disabled></th>
						<th ><input style="width: 83px;" type="text" class="form-control2" id="frwdpurebal" onkeyup="myFunction(this.id,10)" placeholder="Forward Pure Bal" disabled></th>
						<th ><input style="width: 71px;" type="text" class="form-control2" id="oobsbal" onkeyup="myFunction(this.id,11)" placeholder="OOBS AST Bal" disabled></th>
						<th ><input style="width: 94px;" type="text" class="form-control2" id="shtlbal" onkeyup="myFunction(this.id,12)" placeholder="Short Term Liab Bal" disabled></th>
						<th ><input style="width: 110px;" type="text" class="form-control2" id="fcurrdbal" onkeyup="myFunction(this.id,13)" placeholder="F Currency Deposit Bal" disabled></th>
						<th ><input style="width: 64px;" type="text" class="form-control2" id="obslbal" onkeyup="myFunction(this.id,14)" placeholder="OBS Liab Bal" disabled></th>
						<th ><input style="width: 125px;" type="text" class="form-control2" id="ubdlsptbal" onkeyup="myFunction(this.id,15)" placeholder="Ubdelivered Spot Sale Bal" disabled></th>
						<th ><input style="width: 82px;" type="text" class="form-control2" id="frwdslbal" onkeyup="myFunction(this.id,16)" placeholder="Forward Sale Bal" disabled></th>
						<th ><input style="width: 73px;" type="text" class="form-control2" id="oobslbal" onkeyup="myFunction(this.id,17)" placeholder="OOBS Liab Bal" disabled></th>
						<th class="modify">Modify</th>
						
					</tr>
					
				</thead>
					
					

             <tbody class="databody" id="pymdets1">
 


              </tbody>
              
   
        
				</table> 
				
				
				<table class="table" id="detb2" style="width:100%;display:none;margin-top:-20px;"><thead>
            
        
					 <tr class="filters">
					 
						<th ><input type="text" style="width: 57px;" onkeyup="myFunctio(this.id,0)" class="form-control2" id="repdt1" placeholder="Report Date" disabled></th>
						<!-- <th id="chalpha">Cheque Alpha</th>					 -->	
						<th ><input style="width: 72px;" type="text" id="curncycode1" onkeyup="myFunctio(this.id,1)" class="form-control2" placeholder="Currency Code" disabled></th>						
						<th ><input style="width: 55px;" type="text" id="exchgrt1" onkeyup="myFunctio(this.id,2)" class="form-control2" placeholder="Exchg Rate" disabled> </th>						
						<th  style=""><input style="width: 116px;" type="text" id="curr1" onkeyup="myFunctio(this.id,3)" class="form-control2" placeholder="Currency Notes Balance" disabled></th>
						<th ><input style="width: 116px;" type="text" id="nosaccbal1" class="form-control2" onkeyup="myFunctio(this.id,4)" placeholder="Nostro Account Balance" disabled></th>
						<!-- <th id="valdate">Value Date</th> -->
						<th  style=""><input style="width: 116px;" type="text" id="frwdsalbal1"  onkeyup="myFunctio(this.id,5)" class="form-control2" placeholder="Forward Sales Balance" disabled></th>						
						<th ><input style="width: 163px;" type="text" class="form-control2" id="frcurncyabal1" onkeyup="myFunctio(this.id,6)" placeholder="Foreign Currency Abroad Balance" disabled></th>
						<th ><input style="width: 172px;" type="text" class="form-control2" id="frcurncyobsbal1" onkeyup="myFunctio(this.id,7)" placeholder="Foreign Currency OBS AST Balance" disabled></th>
						<th ><input style="width: 82px;" type="text" class="form-control2" id="obsastbal1" onkeyup="myFunctio(this.id,8)" placeholder="OBS Ast Balance" disabled></th>
						<th ><input style="width: 127px;" type="text" class="form-control2" id="undelpurespotbal1" onkeyup="myFunctio(this.id,9)" placeholder="Undelivered Pure Spot Bal" disabled></th>
						<th ><input style="width: 83px;" type="text" class="form-control2" id="frwdpurebal1" onkeyup="myFunctio(this.id,10)" placeholder="Forward Pure Bal" disabled></th>
						<th ><input style="width: 71px;" type="text" class="form-control2" id="oobsbal1" onkeyup="myFunctio(this.id,11)" placeholder="OOBS AST Bal" disabled></th>
						<th ><input style="width: 94px;" type="text" class="form-control2" id="shtlbal1" onkeyup="myFunctio(this.id,12)" placeholder="Short Term Liab Bal" disabled></th>
						<th ><input style="width: 110px;" type="text" class="form-control2" id="fcurrdbal1" onkeyup="myFunctio(this.id,13)" placeholder="F Currency Deposit Bal" disabled></th>
						<th ><input style="width: 64px;" type="text" class="form-control2" id="obslbal1" onkeyup="myFunctio(this.id,14)" placeholder="OBS Liab Bal" disabled></th>
						<th ><input style="width: 125px;" type="text" class="form-control2" id="ubdlsptbal1" onkeyup="myFunctio(this.id,15)" placeholder="Ubdelivered Spot Sale Bal" disabled></th>
						<th ><input style="width: 82px;" type="text" class="form-control2" id="frwdslbal1" onkeyup="myFunctio(this.id,16)" placeholder="Forward Sale Bal" disabled></th>
						<th ><input style="width: 73px;" type="text" class="form-control2" id="oobslbal1" onkeyup="myFunctio(this.id,17)" placeholder="OOBS Liab Bal" disabled></th>
						<th class="modify">Modify</th>
						
					</tr>
					
				</thead>
					
					

             <tbody class="databody" id="pymdets2">
 


              </tbody>
              
   
        
				</table> 
				
				
				<table class="table" id="detb3" style="width:100%;display:none;margin-top:-20px;"><thead>
            
               
					 
 				<tr class="filters">
 			
					 <th style="text-align:center;"><input type="text"  onkeyup="myFunction1(this.id,0)" class="form-control2" id="instype" style="width: 87px;text-align:center;"placeholder="Institute Type"disabled> </th>				
						<th style="text-align:center;" ><input type="text" onkeyup="myFunction1(this.id,1)" class="form-control2" id="trnnat" style="width: 100px;text-align:center;" placeholder="Transaction Nature"disabled></th>
						<th style="text-align:center;"><input type="text" onkeyup="myFunction1(this.id,2)" class="form-control2" id="prps" style="width: 100px;text-align:center;" placeholder="Purpose"disabled></th>
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction1(this.id,3)" class="form-control2" id="orgcrncy"  style="width: 50px;text-align:center;" placeholder="ORG Currency" disabled></th>
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction1(this.id,4)" class="form-control2" id="amt" style="width: 100px;text-align:center;" placeholder="Amount" disabled></th>
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction1(this.id,5)" class="form-control2" id="exchgrtd" style="width: 100px;text-align:center;" placeholder="Exchange Rate"disabled></th>
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction1(this.id,6)" class="form-control2" id="repdt" style="width: 100px;text-align:center;" placeholder="Report Date"disabled></th>
						<th class="modify">Modify</th>
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="pymdets3">


 


              </tbody>
              
              
				</table>
				
				
				</div>
			
            
      <!--     <div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
           
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
                <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button>
            </div>
          
        
         </div>  -->
        
			</div>	         
  
    </div>
     </form>
    
    
</div>


</body>
</html>