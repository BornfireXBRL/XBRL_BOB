<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLPSC0105Bean,dao.XBRLPSC0105Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
    <%@ page import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat"%>
   <%--  
    
     <%
    DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Date date = new Date();
	
	String username = session.getAttribute("userName").toString();
    String curdate = dateFormat.format(date);
%> --%>

	 
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
 
 XBRLPSC0105Dao dmd=new XBRLPSC0105Dao();
 
 DecimalFormat df = new DecimalFormat("##,#0.00");
	   
	 // ArrayList<XBRLPSC0105Bean> list=dmd.xbrlcrr100();
	  
	
		  
		  
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
.databody td{
border:1px solid #ddd;
}
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
	//alert(f);
	 if(z=="load"){
		 $("#detb1").show();
	 		 
		//FOR DETAILS
		$(".det").addClass("clr");
		$("#tab1").show();
		$("#tab2").hide();
		/* $(".psc0500,.psc0501").hide(); */
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
					"repname" : '<%=reptype%>',"ReporefSeq" : '<%=ReporefSeq%>',"instno" :ins ,"dt2" :'<%=dt2%>' ,"dt1" :'<%=dt1%>',"curr": '<%=curr%>' 
				}; 

			$.ajax({
				url : "PSC0105details1",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				
					
					  $("#det1 tr").remove();
					 
					 
					 
					var b=JSON.parse(res.sec1PSC0105d1);
					
					 /* console.log(b); */
				
			
					 if(f=="onload"){
						 		
						
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#det1").append(
						 				  "<tr>"

						 				  
						 				  
						 				 
				                   	  +"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
				                      +"<td id='acnam_row"+srno+"' >"+b[i].acnam+"</td>"
				                      +"<td id='scode_row"+srno+"' >"+b[i].scode+"</td>"
				                      +"<td  id='stype_row"+srno+"' >"+b[i].stype+"</td>"
				                      +"<td id='iscode_row"+srno+"' >"+b[i].iscode+"</td>"
				                      +"<td id='sflag_row"+srno+"'>"+b[i].sflag+"</td>"
				                      +"<td class='sumder alnum' id='outamt_row"+srno+"' >"+b[i].outamt+"</td>"
				                      +"<td id='impflg_row"+srno+"' >"+b[i].impflg+"</td>"
				                      +"<td id='accopndat_row"+srno+"' >"+b[i].accopndat+"</td>"
				                      +"<td   id='rendat_row"+srno+"' >"+b[i].rendat+"</td>"
				                      +"<td id='secflg_row"+srno+"' >"+b[i].secflg+"</td>"
				                      				                     				                     	
				                      
				                      +"<td  id='reflg_row"+srno+"'>"+b[i].reflg+"</td>"	
				                      +"<td  id='resdat_row"+srno+"'>"+b[i].resdat+"</td>"	
				                      +"<td  class='sumder alnum' id='sanamt_row"+srno+"'>"+b[i].sanamt+"</td>"	
				                      +"<td id='acccrcode_row"+srno+"'>"+b[i].acccrcode+"</td>"	
				                      +"<td id='repdat_row"+srno+"'>"+b[i].repdat+"</td>"		
				                     
				                      
				                    
				                      +"<td style='text-align:center;'><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td>"	
				                     
				                      
				                    +"</tr>" ) ; 
						 		  
								 srno++;
								 
								
									}
						 		 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
							 		
							 		$(".add").hide();//add button hide
							 		
									 $(".tb1").show(); 
									
							 		$("#modify").hide();//modify in the header hide
							 		$("#modify1,#modify2").hide();  
								 		  //alert('fvf'+b.length);
									 for (var i = 0; i <b.length; i++) {
										 
										 $("#det1").append(
								 				  "<tr>"
								 				  
								 				  
 									+"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
				                      +"<td id='acnam_row"+srno+"' >"+b[i].acnam+"</td>"
				                      +"<td id='scode_row"+srno+"' >"+b[i].scode+"</td>"
				                      +"<td  id='stype_row"+srno+"' >"+b[i].stype+"</td>"
				                      +"<td id='iscode_row"+srno+"' >"+b[i].iscode+"</td>"
				                      +"<td id='sflag_row"+srno+"'>"+b[i].sflag+"</td>"
				                      +"<td class='sumder alnum' id='outamt_row"+srno+"' >"+b[i].outamt+"</td>"
				                      +"<td id='impflg_row"+srno+"' >"+b[i].impflg+"</td>"
				                      +"<td id='accopndat_row"+srno+"' >"+b[i].accopndat+"</td>"
				                      +"<td   id='rendat_row"+srno+"' >"+b[i].rendat+"</td>"
				                      +"<td id='secflg_row"+srno+"' >"+b[i].secflg+"</td>"
				                      				                     				                     	
				                      
				                      +"<td  id='reflg_row"+srno+"'>"+b[i].reflg+"</td>"	
				                      +"<td  id='resdat_row"+srno+"'>"+b[i].resdat+"</td>"	
				                      +"<td  class='sumder alnum' id='sanamt_row"+srno+"'>"+b[i].sanamt+"</td>"	
				                      +"<td id='acccrcode_row"+srno+"'>"+b[i].acccrcode+"</td>"	
				                      +"<td id='repdat_row"+srno+"'>"+b[i].repdat+"</td>"		
				                     
						                      
						                    
						                      
						                     
						                      
						                    +"</tr>" ) ; 
								 		  									
								
									 srno++;
									
									
										}
							 		 $("#divLoading").removeClass('show');
							 	}
								
								
							 $("#divLoading").removeClass('show'); 
							$('.alnum').mask("#,##0.00", {reverse: true}); 
						
							}
							

							
					
				});   
			
			 var pymd = {
						"repname" : '<%=reptype%>',"ReporefSeq" : '<%=ReporefSeq%>',"instno" :ins ,"dt2" :'<%=dt2%>' ,"dt1" :'<%=dt1%>',"curr": '<%=curr%>' 
					}; 
					
				$.ajax({
					url : "PSC0105details2",
					data : pymd,
					dataType : 'json',
					type : 'POST',
					async : false,
					success : function(res) {	
						
							//	alert("refePYM100"+refePYM100);
								
								  $("#det2 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC0105d2);
								 console.log(b);
								
									 	if(f=="onload"){
									 		$("#modify").show();
									 		$("#modify1").show();
									 		for(var i=0;i<b.length;i++){
									 			
									 			 $("#det2").append(
										 				 "<tr>"

									                   	  +"<td id='appno_row"+srno+"'>"+b[i].appno+"</td>"
									                      +"<td id='entnam_row"+srno+"' >"+b[i].entnam+"</td>"
									                      +"<td  id='entflg_row"+srno+"' >"+b[i].entflg+"</td>"
									                      +"<td  id='factyp_row"+srno+"' >"+b[i].factyp+"</td>"
									                      +"<td class='sumder alnum' id='facamt_row"+srno+"' >"+b[i].facamt+"</td>"
									                      +"<td id='rejreason_row"+srno+"'>"+b[i].rejreason+"</td>"
									                      +"<td id='aprecdate_row"+srno+"' >"+b[i].aprecdate+"</td>"
									                      +"<td id='aprejdat_row"+srno+"' >"+b[i].aprejdat+"</td>"
									                      +"<td id='repdat_row"+srno+"' >"+b[i].repdat+"</td>"
									                     
									                      
									                    
									                      +"<td style='text-align:center;'><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td>"	
									                     
									                      
									                    +"</tr>" ) ; 
									 		  
									 		  
									 		  
									 		  
											
											 srno++;
											 
											
												}
											 $("#divLoading").removeClass('show');
											$("#rowno").val(srno);
									 	}else if(f=="frmsum"){
									 		
									 		$(".add").hide();//add button hide
									 		
											 $(".tb1").show(); 
											

										 		$("#modify").hide();//modify in the header hide
										 		$("#modify1,#modify2").hide();  
										 		  
											 for (var i = 0; i <b.length; i++) {
												 $("#det2").append(
										 				 "<tr>"
 +"<td id='appno_row"+srno+"'>"+b[i].appno+"</td>"
									                      +"<td id='entnam_row"+srno+"' >"+b[i].entnam+"</td>"
									                      +"<td  id='entflg_row"+srno+"' >"+b[i].entflg+"</td>"
									                      +"<td  id='factyp_row"+srno+"' >"+b[i].factyp+"</td>"
									                      +"<td class='sumder alnum' id='facamt_row"+srno+"' >"+b[i].facamt+"</td>"
									                      +"<td id='rejreason_row"+srno+"'>"+b[i].rejreason+"</td>"
									                      +"<td id='aprecdate_row"+srno+"' >"+b[i].aprecdate+"</td>"
									                      +"<td id='aprejdat_row"+srno+"' >"+b[i].aprejdat+"</td>"
									                      +"<td id='repdat_row"+srno+"' >"+b[i].repdat+"</td>"
									                    
									                     
									                      
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
				
				  /* $("#divLoading").addClass("show");  */
				
				 $(".repdisp").text(refno);
				 
					var cnt=1;
				
						$("#sec1 tr").children().detach().remove();
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "PSC0105sec1",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec1 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC0105);
								 console.log(b);
								
                                 
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec1").append("<tr>"
									 				  
									 				  
									 				 +"<td id='instnam_row"+cnt+"'>"+b[i].instnam+"</td>"
								                      +"<td  id='instno_row"+cnt+"' >"+b[i].instno+"</td>"
								                    //  +"<td id='srno_row"+srno+"'>"+srno+"</td>"
								                      +"<td  id='noofaprec_row"+cnt+"' >"+b[i].noofaprec+"</td>"
								                      +"<td  class='sumder alnum' id='amtofaprec_row"+cnt+"' >"+b[i].amtofaprec+"</td>"
								                      +"<td   id='noofaprej_row"+cnt+"' >"+b[i].noofaprej+"</td>"
								                      +"<td  class='sumder alnum' id='amtofaprej_row"+cnt+"'>"+b[i].amtofaprej+"</td>"
								                      +"<td  class='sumder alnum' id='resamt_row"+cnt+"' >"+b[i].resamt+"</td>"
								                      +"<td  class='sumder alnum' id='smamt_row"+cnt+"' >"+b[i].smamt+"</td>"
								                      +"<td  class='sumder alnum' id='odamt_row"+cnt+"' >"+b[i].odamt+"</td>"
								                      
								                      +"<td  class='sumder alnum' id='flamt_row"+cnt+"' >"+b[i].flamt+"</td>"
								                      +"<td  class='sumder alnum' id='othersamt_row"+cnt+"'>"+b[i].othersamt+"</td>"
								                      +"<td  class='sumder alnum'id='totamt_row"+cnt+"' >"+b[i].totamt+"</td>"
								                     
									 		  
									 		  +"<td  style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+cnt+") id='edit"+cnt+"'></td></tr>") ;  
									 		  
									 		 
											
									 		 cnt++;
											 
											
												}
											
									 	
									}
									

						});   	
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "PSC0105sec2",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec2 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC0105s2);
								
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 			
									 			
									 				
									 				  $("#sec2").append(
												 				 "<tr>"
												 				  
									 				 +"<td id='instnam_row"+cnt+"'>"+b[i].instnam+"</td>"
								                      +"<td  id='instno_row"+cnt+"' >"+b[i].instno+"</td>"
								                    //  +"<td id='srno_row"+srno+"'>"+srno+"</td>"
								                      +"<td  id='noofaprec_row"+cnt+"' >"+b[i].noofaprec+"</td>"
								                      +"<td  class='sumder alnum' id='amtofaprec_row"+cnt+"' >"+b[i].amtofaprec+"</td>"
								                      +"<td   id='noofaprej_row"+cnt+"' >"+b[i].noofaprej+"</td>"
								                      +"<td  class='sumder alnum' id='amtofaprej_row"+cnt+"'>"+b[i].amtofaprej+"</td>"
								                      +"<td  class='sumder alnum' id='resamt_row"+cnt+"' >"+b[i].resamt+"</td>"
								                      +"<td  class='sumder alnum' id='smamt_row"+cnt+"' >"+b[i].smamt+"</td>"
								                      +"<td  class='sumder alnum' id='odamt_row"+cnt+"' >"+b[i].odamt+"</td>"
								                      
								                      +"<td  class='sumder alnum' id='flamt_row"+cnt+"' >"+b[i].flamt+"</td>"
								                      +"<td  class='sumder alnum' id='othersamt_row"+cnt+"'>"+b[i].othersamt+"</td>"
								                      +"<td  class='sumder alnum'id='totamt_row"+cnt+"' >"+b[i].totamt+"</td>"
								                      
												 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+cnt+") id='edit"+cnt+"'></td></tr>") ;  	
														
													
									 		 cnt++;
											 
											
												}
										
									
									}
									

						});   
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "PSC0105sec3",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec3 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC0105s3);
								 console.log(b);
								
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 			
									 			
									 			
									 		  $("#sec3").append("<tr>"
									 				  
									 				  
										 				 +"<td id='instnam_row"+cnt+"'>"+b[i].instnam+"</td>"
									                      +"<td  id='instno_row"+cnt+"' >"+b[i].instno+"</td>"
									                     // +"<td id='srno_row"+srno+"'>"+srno+"</td>"
									                      +"<td class='sumder alnum' id='amtper_row"+cnt+"' >"+b[i].amtper+"</td>"
									                      +"<td  class='sumder alnum' id='amtimp_row"+cnt+"' >"+b[i].amtimp+"</td>"
									                      +"<td   id='noofaprec_row"+cnt+"' >"+b[i].noofaprec+"</td>"
									                      +"<td  class='sumder alnum' id='amtofaprec_row"+cnt+"'>"+b[i].amtofaprec+"</td>"
									                      +"<td   id='noofaprej_row"+cnt+"' >"+b[i].noofaprej+"</td>"
									                      +"<td  class='sumder alnum' id='amtofaprej_row"+cnt+"' >"+b[i].amtofaprej+"</td>"
									                      +"<td  class='sumder alnum' id='resamt_row"+cnt+"' >"+b[i].resamt+"</td>"
									                      
									                      +"<td  class='sumder alnum' id='smamt_row"+cnt+"' >"+b[i].smamt+"</td>"
									                      +"<td  class='sumder alnum' id='odamt_row"+cnt+"'>"+b[i].odamt+"</td>"
									                      +"<td  class='sumder alnum'id='flamt_row"+cnt+"' >"+b[i].flamt+"</td>"
									                      +"<td  class='sumder alnum' id='othersamt_row"+cnt+"' >"+b[i].othersamt+"</td>"
									                      +"<td  class='sumder alnum' id='totamt_row"+cnt+"'>"+b[i].totamt+"</td>"
									                      +"<td  class='sumder alnum' id='smamt3_row"+cnt+"' >"+b[i].smamt3+"</td>"
									                      +"<td  class='sumder alnum' id='odamt3_row"+cnt+"'>"+b[i].odamt3+"</td>"
									                      +"<td  class='sumder alnum'id='flamt3_row"+cnt+"' >"+b[i].flamt3+"</td>"
									                      +"<td  class='sumder alnum' id='othersamt3_row"+cnt+"' >"+b[i].othersamt3+"</td>"
									                      +"<td  class='sumder alnum' id='totamt3_row"+cnt+"'>"+b[i].totamt3+"</td>"
									                     
										 		  
										 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+cnt+") id='edit"+cnt+"'></td></tr>") ;  
									 			
									 				
											
									 		 cnt++;
											 
											
												}
									
									
									}
									

						});   
						

						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "PSC0105sec4",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec4 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC0105s4);
								 console.log(b);
								
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 			
									 			
									 			
									 		  $("#sec4").append("<tr>"
									 				  
									 				  
										 				 +"<td id='instnam_row"+cnt+"'>"+b[i].instnam+"</td>"
									                      +"<td  id='instno_row"+cnt+"' >"+b[i].instno+"</td>"
									                     // +"<td id='srno_row"+srno+"'>"+srno+"</td>"
									                      +"<td class='sumder alnum' id='smamt_row"+cnt+"' >"+b[i].smamt+"</td>"
									                      +"<td  class='sumder alnum' id='msmeamt4_row"+cnt+"' >"+b[i].msmeamt4+"</td>"
									                     
										 		  
										 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+cnt+") id='edit"+cnt+"'></td></tr>") ;  
									 			
									 				
											
									 		 cnt++;
											 
											
												}
									
									
									}
									

						});   
						
						
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "PSC0105sec5",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec5 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC0105s5);
								 console.log(b);
								
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 			
									 			
									 			
									 		  $("#sec5").append("<tr>"
									 				  
									 				  
										 				 +"<td id='slno5_row"+cnt+"'>"+b[i].slno5+"</td>"
									                      +"<td  id='accnam5_row"+cnt+"' >"+b[i].accnam5+"</td>"
									                     // +"<td id='srno_row"+srno+"'>"+srno+"</td>"
									                      +"<td  id='typofentity5_row"+cnt+"' >"+b[i].typofentity5+"</td>"
									                      +"<td   id='typoffacility5_row"+cnt+"' >"+b[i].typoffacility5+"</td>"
									                      +"<td  class='sumder alnum' id='rejamt5_row"+cnt+"' >"+b[i].rejamt5+"</td>"
									                      +"<td   id='rejreason5_row"+cnt+"'>"+b[i].rejreason5+"</td>"
									                     
										 		  
										 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+cnt+") id='edit"+cnt+"'></td></tr>") ;  
									 			
									 				
											
									 		 cnt++;
											 
											
												}
									
									
									}
									

						});   
						
							
					}
				 
	 }
	 
function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_PSC0105_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno=0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>
<script>
$(document).ready(function(){
	
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');

	
});   
</script>



<script>
function myFunction1(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("det1");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==0 ||b==2 || b==6 || b==8 ||b==9||b==12 || b==13 || b==15){
		
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


function myFunction2(a,b) {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById(a);
	  filter = input.value.toUpperCase();
	  table = document.getElementById("det2");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[b];
	 
	if (td) {
		if(b==0 || b==4 ||b==6 || b==7 || b==8){
			
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
<%-- $("#tb1").show();

	if('<%=reptype%>'=="PSC0106" || '<%=reptype%>'=="psc0106"){
		
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
		 location.href="XBRL_CRT_PSC0105_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
		
		});
	
	$('#btnExcel').click(function() {
		
		
		if(tabid==1){
			
		
		  PSC0105Form.action = "PSC0105EXCELREPORT.action?method=PSC0105EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 PSC0105Form.submit(); 
		}
		else if(tabid==2)
			{
			
			
				  PSC0105Form.action = "PSC0105EXCELREPORT2.action?method=PSC0105EXCEL2&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
				 PSC0105Form.submit(); 
				} 
		
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
		
		functionli(btn);
		if(btn==1){
			 $("#btnpre").prop("disabled",true);
			 $("#btnnext").prop("disabled",false);
			 $("#li1").addClass("active");
			 $("#li2").removeClass("active");
		}else if(btn==4){
			 $("#btnpre").prop("disabled",false);
			 $("#btnnext").prop("disabled",true);
			 $("#li2").addClass("active");
			 $("#li1").removeClass("active");
		}else{
			
				 $("#btnpre").prop("disabled",false);
				 $("#btnnext").prop("disabled",false);
				 $("#li1").addClass("active");
				 $("#li2").removeClass("active");
		}
  });
  $("#btnnext").on("click",function(){
		btn++;
		functionli(btn);
		if(btn==4){
			 $("#btnnext").prop("disabled",true);
			 $("#btnpre").prop("disabled",false);
			 $("#li2").addClass("active");
			 $("#li1").removeClass("active");
			 
		}else if(btn==1){
			 $("#btnpre").prop("disabled",false);
			 $("#btnnext").prop("disabled",true);
			 $("#li2").addClass("active");
			 $("#li1").removeClass("active");
		}else{

			 $("#btnpre").prop("disabled",false);
			 $("#btnnext").prop("disabled",false);
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
if(a==1){
	
	$("#btnpre").prop("disabled",true);
	 $("#btnnext").prop("disabled",false);
	 $("#li1").addClass("active");
	 $("#li2").removeClass("active");
}else if(a==4){
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li2").addClass("active");
	 $("#li1").removeClass("active");
}
}

function funli(a){
	
	$("#rownoadd").val(a);
	$(".table").hide();
	$("#detb"+a).show();
	tabid=a;
	if(a==1){
		
		$("#btnpre").prop("disabled",true);
		 $("#btnnext").prop("disabled",false);
		 $("#li1").addClass("active");
		 $("#li2").removeClass("active");
		 
			
		// $("#divLoading").addClass("show"); 
		
	 		
	}else if(a==2){
		$("#btnpre").prop("disabled",false);
		 $("#btnnext").prop("disabled",true);
		 $("#li2").addClass("active");
		 $("#li1,#li3").removeClass("active");
		
			
		 //$("#divLoading").addClass("show"); 
		
	 		
	}

	else if(a==3){
		$("#btnpre").prop("disabled",false);
		 $("#btnnext").prop("disabled",true);
		 $("#li3").addClass("active");
		 $("#li1,#li2").removeClass("active");
		
			
		 //$("#divLoading").addClass("show"); 
		
	 		
	}
}
</script>



<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	
	
	
 	
$("#sumfirst").on("click",function(){
		
		location.href = "XBRL_REP_PSC0105_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
 

	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_PSC0105_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	
	
	
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 PSC0105Form.action = "PSC0105EXCELSum.action?method=SUP0500EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 PSC0105Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 PSC0105Form.action = "PSC0105PDFREPORT.action?method=SUP0500PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 PSC0105Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  PSC0105Form.action = "XMLDOWNLOAD.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 PSC0105Form.submit(); 
	});
	var save=0;

$('#btnSave').on("click",function() {
	
	  var datasum={
			"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>'
	};
	$.ajax({
		url:"saveSum",
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
		if(tabid==1){
		$("#det1").prepend("<tr><td id='accno_row"+rowno+"'><input type='text' id='accno_text"+rowno+"' style='width: 136px;'></td><td id='acnam_row"+rowno+"'><input type='text'  id='acnam_text"+rowno+"' style='    width:142px;'></td><td id='scode_row"+rowno+"'><input type='text' id='scode_text"+rowno+"' style='     width: 73px;'></td><td id='stype_row"+rowno+"'><input type='text' 	id='stype_text"+rowno+"' style='    width: 100px;'></td><td id='iscode_row"+rowno+"'><input type='text' id='iscode_text"+rowno+"' style='    width: 137px;'></td><td id='sflag_row"+rowno+"' ><input type='text'  id='sflag_text"+rowno+"'   style='    width: 75px;'></td><td id='outamt_row"+rowno+"' class='sumder alnum'><input type='text'  id='outamt_text"+rowno+"'  class='decimalPt roundUp'  style='    width: 100px;'></td><td id='impflg_row"+rowno+"'><input type='text' id='impflg_text"+rowno+"' style='    width: 100px;'></td><td id='accopndat_row"+rowno+"'><input type='text' id='accopndat_text"+rowno+"' style='    width: 137px;'></td><td id='rendat_row"+rowno+"'><input type='text' id='rendat_text"+rowno+"' style='    width: 97px;'></td><td id='secflg_row"+rowno+"'><input type='text' id='secflg_text"+rowno+"' style='    width: 98px;'></td><td id='reflg_row"+rowno+"'><input type='text' id='reflg_text"+rowno+"' style='    width: 135px;'></td><td id='resdat_row"+rowno+"'><input type='text' id='resdat_text"+rowno+"' style='    width: 136px;'></td><td class='sumder alnum' id='sanamt_row"+rowno+"'><input type='text' class='decimalPt roundUp' id='sanamt_text"+rowno+"' style='    width: 100px;'></td><td id='acccrcode_row"+rowno+"'><input type='text' id='acccrcode_text"+rowno+"' style='    width: 136px;'></td><td id='repdat_row"+rowno+"'><input type='text' id='repdat_text"+rowno+"' style='    width: 100px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");
		}
		else if
		(tabid==2){
			$("#det2").prepend("<tr><td id='appno_row"+rowno+"'><input type='text' id='appno_text"+rowno+"' style='width: 153px;'></td><td id='entnam_row"+rowno+"'><input type='text'  id='entnam_text"+rowno+"' style='    width:472px;'></td><td id='entflg_row"+rowno+"'><input type='text' id='entflg_text"+rowno+"' style='     width: 153px;'></td><td id='factyp_row"+rowno+"'><input type='text' 	id='factyp_text"+rowno+"' style='    width: 140px;'></td><td class='sumder alnum' id='facamt_row"+rowno+"'><input type='text' class='decimalPt roundUp' id='facamt_text"+rowno+"' style='    width: 180px;'></td><td id='rejreason_row"+rowno+"' ><input type='text'  id='rejreason_text"+rowno+"'   style='    width: 339px;'></td><td id='aprecdate_row"+rowno+"' ><input type='text'  id='aprecdate_text"+rowno+"'    style='    width: 151px;'></td><td id='aprejdat_row"+rowno+"'><input type='text' id='aprejdat_text"+rowno+"' style='    width: 140px;'></td><td id='repdat_row"+rowno+"'><input type='text' id='repdat_text"+rowno+"' style='width: 100px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;text-align:center;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");
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


	$("#repdat_text"+a).datepicker({
	dateFormat: "dd-mm-yy",
	       changeMonth: true,//this option for allowing user to select month
	     changeYear: true,
	     yearRange: "-100:+0",
	     maxDate: "today"
	});

	$("#aprecdate_text"+a).datepicker({
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

//alert("hiii 2d AGccccccccc" +  edit_row(no));
$(".add").attr("disabled",true);
$("#addrowno").val("0");
	
	document.getElementById("edit_button"+no).style.display="none";
	  document.getElementById("save_button"+no).style.display="block";
	 	

	  
	if(tabid==1)
{
var	outamt =  document.getElementById("outamt_row"+no);
var	outamt_data = outamt.innerHTML;
var	sanamt =  document.getElementById("sanamt_row"+no);
var	sanamt_data = sanamt.innerHTML;

outamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='outamt_text"+no+"'  style='width: 83px'; value='"+outamt_data+"'>";
sanamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='sanamt_text"+no+"'  style='width: 83px'; value='"+sanamt_data+"'>";


}
	else (tabid==2)
	{
		var	facamt =  document.getElementById("facamt_row"+no);
		var	facamt_data = facamt.innerHTML;


		facamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='facamt_text"+no+"'  style='width: 83px'; value='"+facamt_data+"'>";


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
$(".add").attr("disabled",false);
document.getElementById("edit_button"+no).checked = false;


if (tabid==1){


var outamt_val=document.getElementById("outamt_text"+no).value;

document.getElementById("outamt_row"+no).innerHTML=outamt_val;

var sanamt_val=document.getElementById("sanamt_text"+no).value;

document.getElementById("sanamt_row"+no).innerHTML=sanamt_val;
}
if (tabid==2){
	//alert('1');
	var facamt_val=document.getElementById("facamt_text"+no).value;

	document.getElementById("facamt_row"+no).innerHTML=facamt_val;
	}



if($("#addrowno").val()=="1"){
	
	
	if (tabid==1){
		
	
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
  
  var  sflag_val=document.getElementById("sflag_text"+no).value;	 
  document.getElementById("sflag_row"+no).innerHTML=sflag_val;
  
  var  impflg_val=document.getElementById("impflg_text"+no).value;	 
  document.getElementById("impflg_row"+no).innerHTML=impflg_val;
 
  var  accopndat_val=document.getElementById("accopndat_text"+no).value;	 
  document.getElementById("accopndat_row"+no).innerHTML=accopndat_val;
  
  var  rendat_val=document.getElementById("rendat_text"+no).value;	 
  document.getElementById("rendat_row"+no).innerHTML=rendat_val;

  

  var secflg_val=document.getElementById("secflg_text"+no).value;	
  document.getElementById("secflg_row"+no).innerHTML=secflg_val;
 
  var  reflg_val=document.getElementById("reflg_text"+no).value;	 
  document.getElementById("reflg_row"+no).innerHTML=reflg_val;
  
  var  resdat_val=document.getElementById("resdat_text"+no).value;	 
  document.getElementById("resdat_row"+no).innerHTML=resdat_val;
 
  var  acccrcode_val=document.getElementById("acccrcode_text"+no).value;	 
  document.getElementById("acccrcode_row"+no).innerHTML=acccrcode_val;
  
  var  repdat_val=document.getElementById("repdat_text"+no).value;	 
  document.getElementById("repdat_row"+no).innerHTML=repdat_val;
  

  
	}
	
	
	if (tabid==2){
		//alert('2');
		var  appno_val=document.getElementById("appno_text"+no).value;	 
		document.getElementById("appno_row"+no).innerHTML=appno_val;
		//alert('3');
		   var entnam_val=document.getElementById("entnam_text"+no).value;
		   document.getElementById("entnam_row"+no).innerHTML=entnam_val;
		   //alert('4');
		  var entflg_val=document.getElementById("entflg_text"+no).value;
		   document.getElementById("entflg_row"+no).innerHTML=entflg_val;
		   //alert('5');
		   var factyp_val=document.getElementById("factyp_text"+no).value;
			document.getElementById("factyp_row"+no).innerHTML=factyp_val;
			//alert('6');
		  
		  var rejreason_val=document.getElementById("rejreason_text"+no).value;	
		  document.getElementById("rejreason_row"+no).innerHTML=rejreason_val;
		  //alert('7');
		  var  aprecdate_val=document.getElementById("aprecdate_text"+no).value;	 
		  document.getElementById("aprecdate_row"+no).innerHTML=aprecdate_val;
		  //alert('8');
		  var  aprejdat_val=document.getElementById("aprejdat_text"+no).value;	 
		  document.getElementById("aprejdat_row"+no).innerHTML=aprejdat_val;
		  //alert('9');
		  var  repdat_val=document.getElementById("repdat_text"+no).value;	 
		  document.getElementById("repdat_row"+no).innerHTML=repdat_val;
		  
			}

	

		
}

document.getElementById("edit_button"+no).style.display="block";
document.getElementById("save_button"+no).style.display="none";
if(tabid==1)
{
	
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

  $("#det1 td").attr("padding","8px");
  var refePSC105=document.getElementById("refDisplay").innerHTML;
  outamt=outamt.replace(/\,/g,'');
  outamt=Number(outamt);
  
  sanamt=sanamt.replace(/\,/g,'');
  sanamt=Number(sanamt);
 


  var rptdate1 = {
 		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refePSC105,"accno":accno,"acnam":acnam,"scode":scode,"stype":stype,"iscode":iscode,"sflag":sflag,"outamt":outamt,"impflg":impflg,"accopndat":accopndat,"rendat":rendat,"secflg":secflg,"reflg":reflg,"resdat":resdat,"sanamt":sanamt,"acccrcode":acccrcode,"repdat":repdat  
 		}; 
  
  $.ajax({
      url : "PSC0105s1",
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

if(tabid==2)
{
	//alert('11');
 var appno=document.getElementById("appno_row"+no).innerHTML;	 
   var entnam=document.getElementById("entnam_row"+no).innerHTML;
  var entflg=document.getElementById("entflg_row"+no).innerHTML;
  var factyp=document.getElementById("factyp_row"+no).innerHTML;
  var facamt=document.getElementById("facamt_row"+no).innerHTML;
  var rejreason=document.getElementById("rejreason_row"+no).innerHTML;
  var aprecdate=document.getElementById("aprecdate_row"+no).innerHTML;	
  var aprejdat=document.getElementById("aprejdat_row"+no).innerHTML;	 
  var repdat=document.getElementById("repdat_row"+no).innerHTML;	

  $("#det2 td").attr("padding","8px");
  var refePSC105=document.getElementById("refDisplay").innerHTML;
  //alert('12');
  facamt=facamt.replace(/\,/g,'');
  facamt=Number(facamt);
  
  var rptdate2 = {
		  "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refePSC105, "appno":appno,"entnam":entnam,"entflg":entflg,"factyp":factyp,"facamt":facamt,"rejreason":rejreason,"aprecdate":aprecdate,"aprejdat":aprejdat,"repdat":repdat  
		}; 
  //alert('13');
$.ajax({
   url : "PSC0105s2",
   data : rptdate2  ,
		dataType : 'json', 
		type : 'POST',
		async : true,
		 success : function(res) {
			 console.log(res.refno);
			
			
			// alert("sfsdf");
			/*  $("#refDisplay").html(res.refno); */
			 $(".repdisp").html(res.refno);
			
			
			
		}
	});
}

 




}


 

</script> 


<%-- 
<SCRIPT>

function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_PSC0105_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT> --%>

<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="PSC0105Form"
		enctype="multipart/form-data">
             	<div class="tab-content" >
	 	<div class="active psc0105" id="tab2" style="width: 1500px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="   margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;"><%=reptype %> - <b id="sub" style="display: none"></b></b><b>Opening Cumulative Data On Credit Extended under the SME Financing Scheme to SMEs and to Micro and Small Enterprises<b id="sub"
					Style="display: none"></b></b></font>
			<br></div> 
		<ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">


 <li class=" pull-right list" onclick="functionli(5);"><a href="#tab5" data-toggle="tab"><span
							class="headingtab">5</span></a></li>
							
							
							 <li class=" pull-right list" onclick="functionli(4);"><a href="#tab4" data-toggle="tab"><span
							class="headingtab">4</span></a></li>

 
             <li class=" pull-right list" onclick="functionli(3);"><a href="#tab3" data-toggle="tab"><span
							class="headingtab">3</span></a></li>
					<li class=" pull-right list" onclick="functionli(2);"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" onclick="functionli(1);" ><a href="#tab1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>



				</ul>
					
			
            <table class="" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:right;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align:right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2"  data-toggle="tab"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
			
		 
		  <!--******************SUMMARY SECTION 5********************************-->   		
		
				   <table class="table" id="tb5" style="width:100%;display:none;margin-top:-20px;">
          
          
          
           
            <tr><th  style="text-align:center" colspan="6">Details of Rejection</th>
            <th rowspan="3" id="" style="text-align:center">Select</th>
             </tr>											
             <tr>
               <th rowspan="2">Sr.No.</th>
               <th >Name of Entity Rejected</th>
               <th  style="text-align:center">Type of Entity</th>
               <th  style="text-align:center">Type of Facility Rejected</th>
               <th  style="text-align:center"> Amount of Facility Rejected</th>
               <th  style="text-align:center">Reasons</th>
               </tr>
               
                
                
                 <tr>
          <th style="text-align:center">AN</th>
          <th style="text-align:center">AO</th>
           <th style="text-align:center">AP</th>
          <th style="text-align:center">AQ</th>
           <th style="text-align:center">AR</th>
          
          </tr> 
            
          
             <tbody class="databody" id="sec5"></tbody>
          </table>
          
		 
		 
		 
		 
		 
		 
		  <!--******************SUMMARY SECTION 4********************************-->   		
		
				   <table class="table" id="tb4" style="width:100%;display:none;margin-top:-20px;">
          
          
          
           
            <tr><th  style="text-align:center" colspan="4">Memorandum items</th>
            <th rowspan="3" id="" style="text-align:center">Select</th>
             </tr>											
             <tr>
               <th rowspan="2"></th>
               <th rowspan="2"></th>
               <th  style="text-align:center">SMEs</th>
               <th  style="text-align:center">Micro & Small Enterprises</th>
               
               </tr>
               
                
                
                 <tr>
          <th style="text-align:center">AL</th>
          <th style="text-align:center">AM</th>
          </tr> 
            
          
             <tbody class="databody" id="sec4"></tbody>
          </table>
          
          
			 <!--******************SUMMARY SECTION 3********************************-->   		
		
				   <table class="table" id="tb3" style="width:100%;display:none;margin-top:-20px;">
          
          
          
           
            <tr><th  style="text-align:center" colspan="19">Closing Cumulative Data On Credit Extended under the SME Financing Scheme to SMEs and to Micro and Small Enterprises till date																		
</th><th rowspan="4" id="" style="text-align:center">Select</th>
             </tr>											
             <tr>
               <th rowspan="3" style="text-align:center;width:213px">Closing Cumulative Data On Credit Extended under the SME Financing Scheme to SMEs and to Micro and Small Enterprises Till date
</th>
               <th rowspan="3"></th>
               <th  colspan="2" style="text-align:center">Status of Outstanding Credit Facilities as at end of month</th>
               <th colspan="2" style="text-align:center">Applications Received</th>
               <th colspan="2"  style="text-align:center" >Applications Rejected	</th>
               <th rowspan="2" style="text-align:center">Restructured Credit Facilities</th>
              <th colspan="5" style="text-align:center" >Credit Facilities approved</th> 
               <th colspan="5" style="text-align:center" >Amount Outstanding as at end of month</th> 				
              
               				
               
               
               </tr>
               
                <tr>
                 <th style="text-align:center">Amount Performing</th>
                 <th style="text-align:center">Amount Impaired</th>
                <th style="text-align:center">Number</th>
                 <th style="text-align:center">Amount</th>
                 <th style="text-align:center">Number</th>
                 <th style="text-align:center">Amount</th>
                 <th style="text-align:center">SME Loans</th>
                <th  style="text-align:center">Overdrafts</th>
                 <th style="text-align:center">Finance Lease</th>
                 <th style="text-align:center">Others</th>
                 <th style="text-align:center">Total</th>
                   <th style="text-align:center">SME Loans</th>
                <th  style="text-align:center">Overdrafts</th>
                 <th style="text-align:center">Finance Lease</th>
                 <th style="text-align:center">Others</th>
                 <th style="text-align:center">Total</th>
                </tr>
                
                 <tr>
          <th style="text-align:center">U</th>
          <th style="text-align:center">V</th>
          <th style="text-align:center">W</th> 
          <th style="text-align:center">X</th>
          <th style="text-align:center">Y</th>
          <th style="text-align:center">Z</th> 
          <th style="text-align:center">AA</th>
          <th style="text-align:center">AB</th>
          <th style="text-align:center">AC</th> 
          <th style="text-align:center">AD</th> 
           <th style="text-align:center">AE</th> 
            <th style="text-align:center">AF</th> 
             <th style="text-align:center">AG</th> 
              <th style="text-align:center">AH</th> 
               <th style="text-align:center">AI</th> 
                <th style="text-align:center">AJ</th> 
                 <th style="text-align:center">AK</th> 
                 
          </tr> 
            
          
             <tbody class="databody" id="sec3"></tbody>
          </table>
          
          
	 <!--******************SUMMARY SECTION2********************************-->   			
			
            <table class="table" id="tb2" style="width:100%;display:none;margin-top:-20px;">
            
            <tr><th  style="text-align:center" colspan="12">Data On Credit Extended under the SME Financing Scheme to SMEs and to Micro and Small Enterprises during the month											
         </th><th rowspan="4" id="" style="text-align:center">Select</th>
             </tr>											
             <tr>
               <th rowspan="3" style="text-align:center;width:213px">Aggregate Data On Credit extended under the SME Financing Scheme to SMEs and to Micro and Small Enterprises
               </th>
               <th rowspan="3"></th>
               <th  colspan="2" style="text-align:center">Applications Received</th>
               <th colspan="2" style="text-align:center">Applications Rejected</th>
               <th rowspan="2" style="text-align:center" >Restructured Credit Facilities</th>
               <th colspan="5" style="text-align:center">Credit Facilities approved</th>
               
               </tr>
               
                <tr>
                <th style="text-align:center">Number</th>
                 <th style="text-align:center">Amount</th>
                 <th style="text-align:center">Number</th>
                 <th style="text-align:center">Amount</th>
                 <th style="text-align:center">SME Loans</th>
                <th  style="text-align:center">Overdrafts</th>
                 <th style="text-align:center">Finance Lease</th>
                 <th style="text-align:center">Others</th>
                 <th style="text-align:center">Total</th>
                </tr>
                
                 <tr>
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
          </tr> 
            
            
            
            
            
            
            
          
         
             <tbody class="databody" id="sec2"></tbody>
          </table>
          
  <!--******************SUMMARY SECTION1********************************-->   
               
               <table class="table" id="tb1" style="width:100%;display:none;margin-top:-20px;">
               
             <tr><th  style="text-align:center" colspan="12">Opening Cumulative Data On Credit Extended under the SME Financing Scheme to SMEs and to Micro and Small Enterprises till date</th>
              <th rowspan="4" id="" style="text-align:center">Select</th>
             
             </tr>											
             <tr>
               <th rowspan="3" style="text-align:center;width:213px">Opening Cumulative Data On Credit Extended under the SME Financing Scheme to SMEs and to Micro and Small Enterprises Till Date</th>
               <th rowspan="3"></th>
               <th  colspan="2" style="text-align:center">Applications Received</th>
               <th colspan="2" style="text-align:center">Applications Rejected</th>
               <th rowspan="2" style="text-align:center" >Restructured Credit Facilities</th>
               <th colspan="5" style="text-align:center">Credit Facilities approved</th>
              
               </tr>
               
                <tr>
                <th style="text-align:center">Number</th>
                 <th style="text-align:center">Amount</th>
                 <th style="text-align:center">Number</th>
                 <th style="text-align:center">Amount</th>
                 <th style="text-align:center">SME Loans</th>
                <th  style="text-align:center">Overdrafts</th>
                 <th style="text-align:center">Finance Lease</th>
                 <th style="text-align:center">Others</th>
                 <th style="text-align:center">Total</th>
                </tr>
                
                 <tr>
          <th style="text-align:center">A</th>
          <th style="text-align:center">B</th> 
          <th style="text-align:center">C</th>
          <th style="text-align:center">D</th>
          <th style="text-align:center">E</th> 
          <th style="text-align:center">F</th>
          <th style="text-align:center">G</th>
          <th style="text-align:center">H</th> 
          <th style="text-align:center">I</th>
          <th style="text-align:center">J</th>
          
          </tr> 
                
         <!--  <tr>
          <th  rowspan="3" style="width: 400px;,text-align:center ">ISIC Code</th>
          <th  rowspan="2" colspan="1" style="width: 50px;"> Sr. No.</th>
           <th rowspan="2"  colspan="1" style="text-align:center">Foreign Bills purchased and discounted</th>
           <th rowspan="2" colspan="1" style="text-align:center">Investment in Corporate Shares</th>
           <th rowspan="2" colspan="1" style="text-align:center">Investment in Debentures</th>
           <th rowspan="2" colspan="1" style="text-align:center">Investment in Corporate bonds</th>
           <th rowspan="2" colspan="1" style="text-align:center">Investment in Other Debt Securities</th>
           <th  colspan="2"  style="text-align:center"> Total Outstanding Loans Outside Mauritius</th>
           <th rowspan="2" colspan="1"  style="text-align:center"> Bills Receivable</th>
           <th rowspan="2" colspan="1"  style="text-align:center"> Total Fund-Based Facilities</th>
           <th rowspan="2" colspan="1"  style="text-align:center">Non-fund Based Facilities</th>
           
          <th rowspan="3" id="" style="text-align:center">Select</th>
          </tr>
          
           <tr>
          
          
          <th colspan="1" id="" style="text-align:center">of which Overdrafts Outside Mauritius</th>
          <th colspan="1" id="" style="width: 150px;,text-align:center"></th>	
          </tr>-->
          
         
           <tbody class="databody" id="sec1"></tbody>
          </table>
          
          
          
            <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
     <!--  <button type="button" class="btn btn-xs btn-primary"   value="back" id="btnpre">Previous</button> -->
    
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
       <!-- <button type="button" class="btn btn-xs btn-primary"   value="back" id="btnnext">Next</button> -->
      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div>
          
            </div>
            
         
             	<div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			<div class="active" id="tab1" style="width: 2213px;padding-top: 1px;margin-top: -17px;" >
			<div style="  margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>
			<b id="sub"
					Style="display: none"></b></b></font>
			<b style="font-size: 13px;"><b style="font-size: 13px;">PSC0105 - <b id="sub" style="display: none"></b></b>Opening Cumulative Data On Credit Extended under the SME Financing Scheme to SMEs and to Micro and Small Enterprises
			 <b id="sub" style="display: none"></b></b>
			
			 
			</div>
			<div id="divLoading"> 
    </div>
    <ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">

					

					<li class=" pull-right list" onclick="funli(2);" id="li2"><a href="#btndetb2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" onclick="funli(1);"id="li1" ><a href="#btndetb1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>



				</ul>
           <table class="" style="width:2213px;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:right;background-color: #bbc3cb;width: 325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab" id="sumfirst"><span class="headingtab"  >Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a><a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></td></tr>
          		  </table>
       
            
           <div class="panel panel-primary filterable">
				   <table class="table" id="detb1" style="width:100%;display:none;margin-top:-20px;">   <thead>
            
            
					 <tr class="filters">
					 
						<th style="width:100px;text-align:center;"><input type="text"  style="text-align:center;" id="cat1" onkeyup="myFunction1(this.id,0)"  class="form-control2" placeholder="Account Number" disabled></th>
						<th  style="width:100px;text-align:center;"><input type="text" style="text-align:center;"  id="fpd1" onkeyup="myFunction1(this.id,1)"  class="form-control2" placeholder="Account Name" disabled></th>						
						<th  style="width:100px;text-align:center;"><input type="text" style="text-align:center;width:72px;"         id="incosh1" onkeyup="myFunction1(this.id,2)"  class="form-control2" placeholder="Scheme Code" disabled></th>
						<th  style="width:100px;text-align:center;"><input type="text"  style="text-align:center;width:80px;"  id="indeb1" onkeyup="myFunction1(this.id,3)"  class="form-control2" placeholder="Scheme Type" disabled></th>
						<th  style="width:100px;text-align:center;"><input type="text" style="text-align:center;width:100px;"  id="invcorbo1" style="width:80px;" onkeyup="myFunction1(this.id,4)"  class="form-control2" placeholder="ISIC Code" disabled></th>
						<th  style="width:100px;text-align:center;"><input type="text" style="text-align:center;width:50px;"  id="invotdeb1" onkeyup="myFunction1(this.id,5)"  class="form-control2" placeholder="SME Flag" disabled></th>
						<th  style="width:100px;text-align:center;"><input type="text" style="width:100px;" id="osloan1" onkeyup="myFunction1(this.id,6)"  class="form-control2" placeholder="Outstanding Amount" disabled></th>
						<th  style="width:100px;text-align:center;"><input type="text" style="text-align:center;width:80px;"  id="osods1" onkeyup="myFunction1(this.id,7)"  class="form-control2" placeholder="Impaired Flag" disabled></th>
						<th  style="width:100px;text-align:center;"><input type="text" style="text-align:center;"  id="billre1" style="width:100px;" onkeyup="myFunction1(this.id,8)"  class="form-control2" placeholder="Account Open Date" disabled></th>						
												<th  style="width:100px;text-align:center;"><input type="text" id="nebfac1" style="width:100px;"style="text-align:center;"   onkeyup="myFunction1(this.id,9)"  class="form-control2" placeholder="Renewal Date" disabled></th>						
												<th  style="width:100px;text-align:center;"><input type="text" id="redate1" style="width:100px;" style="text-align:center;"   onkeyup="myFunction1(this.id,10)"  class="form-control2" placeholder="Security Flag" disabled></th>	
												
												
												<th  style="width:100px;text-align:center;"><input type="text"  style="text-align:center;width:100px;"  id="rsflg"  onkeyup="myFunction1(this.id,11)"  class="form-control2" placeholder="Restructured Flag" disabled></th>
						<th  style="width:100px;text-align:center;"><input type="text" id="resda" onkeyup="myFunction1(this.id,12)"  style="text-align:center;width:100px;"  class="form-control2" placeholder="Restructured Date" disabled></th>
						<th  style="width:100px;text-align:center;"><input type="text" style="width:100px;" style="text-align:center;"  id="samt" onkeyup="myFunction1(this.id,13)"  class="form-control2" placeholder="Sanction Amount" disabled></th>
						<th  style="width:100px;text-align:center;"><input type="text"  style="text-align:center;"   id="acr" onkeyup="myFunction1(this.id,14)"  class="form-control2" placeholder="Account Currency Code" disabled></th>
						<th  style="width:100px;text-align:center;"><input type="text" style="text-align:center;width:80px;"  id="rda"  onkeyup="myFunction1(this.id,15)"  class="form-control2" placeholder="Report Date" disabled></th>		
						<th style="width:50px;text-align:center;" id="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det1">



              </tbody>
              
				</table>
				
				
				   <table class="table" id="detb2" style="width:100%;display:none;margin-top:-20px;">   <thead>
            
            
					 <tr class="filters">
					 	<th style="width:100px;text-align:center;"><input type="text" style="text-align:center;width:153px;"  id="cat2" onkeyup="myFunction2(this.id,0)"  class="form-control2" placeholder="Application Number" disabled></th>
						<th style="width:497px;text-align:center;"><input type="text" style="text-align:center;width:472px;"  id="fpd2" onkeyup="myFunction2(this.id,1)"  class="form-control2" placeholder="Entity Name" disabled></th>						
						<th style="width:100px;text-align:center;"><input type="text" style="text-align:center;"  id="incosh2" onkeyup="myFunction2(this.id,2)"  class="form-control2" placeholder="Entity Type" disabled></th>
						<th style="width:100px;text-align:center;"><input type="text" style="text-align:center;" id="indeb2" onkeyup="myFunction2(this.id,3)"  class="form-control2" placeholder="Facility Type" disabled></th>
						<th style="width:196px;text-align:center;"><input type="text" style="text-align:center;"  id="invcorbo2" style="width:196px;" onkeyup="myFunction2(this.id,4)"  class="form-control2" placeholder="Facility Amount" disabled></th>
						<th style="width:353px;text-align:center;"><input type="text" style="text-align:center;width:339px;"  id="invotdeb2" onkeyup="myFunction2(this.id,5)"  class="form-control2" placeholder="Rejected Reason" disabled></th>
						<th style="width:100px;text-align:center;"><input type="text" style="width:100px;text-align:center;" id="osloan2" onkeyup="myFunction2(this.id,6)"  class="form-control2" placeholder="Application Received Date" disabled></th>
						<th style="width:100px;text-align:center;"><input type="text" style="text-align:center;"  id="osods2" onkeyup="myFunction2(this.id,7)"  class="form-control2" placeholder="Application Rejected Date" disabled></th>
											
												<th style="width:100px;text-align:center;"><input type="text" id="redate2" style="width:100px;text-align:center;" onkeyup="myFunction2(this.id,8)"  class="form-control2" placeholder="Report Date" disabled></th>						
						
						
										
						
						<th style="width:50px;text-align:center;" id="modify1">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det2">



              </tbody>
              
				</table>
				
				
				
		</div>
 <br>
 <!-- <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
      <button type="button" class="btn btn-xs btn-primary" onclick="funli(1);"  value="back" id="btnpre1">Previous</button>
    
                
       <button type="button" class="btn btn-xs btn-primary" onclick="funli(1);"  value="back" id="btnnext1">Next</button>
      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button>
      
      
      </div> -->
       
			  </div>	
            
        
      </div>      
            
      			
				
				
            </div>


     </form>
    
    
</div>





</body>
</html>