<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLPSC0104Bean,dao.XBRLPSC0104Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
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
 
 XBRLPSC0104Dao dmd=new XBRLPSC0104Dao();
 
 DecimalFormat df = new DecimalFormat("##,#0.00");
	   
	 // ArrayList<XBRLPSC0104Bean> list=dmd.xbrlcrr100();
	  
	
		  
		  
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
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "PSC0104details1",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#det1 tr").remove();
					 
					
					var b=JSON.parse(res.det1PSC0104);
					 console.log(b);
					
			
						 	if(f=="onload"){
						 		
						 		
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#det1").append(
						 				  "<tr>"

				                   	  +"<td id='cat1_row"+srno+"'>"+b[i].cat1+"</td>"
				                      +"<td id='fpd1_row"+srno+"' >"+b[i].fpd1+"</td>"
				                      +"<td id='incosh1_row"+srno+"' >"+b[i].incosh1+"</td>"
				                      +"<td  id='indeb1_row"+srno+"' >"+b[i].indeb1+"</td>"
				                      +"<td id='invcorbo1_row"+srno+"' >"+b[i].invcorbo1+"</td>"
				                      +"<td id='invotdeb1_row"+srno+"'>"+b[i].invotdeb1+"</td>"
				                      +"<td id='osloan1_row"+srno+"' >"+b[i].osloan1+"</td>"
				                      +"<td id='osods1_row"+srno+"' >"+b[i].osods1+"</td>"
				                      +"<td id='billre1_row"+srno+"' >"+b[i].billre1+"</td>"
				                      +"<td  class='sumder alnum' id='nebfac1_row"+srno+"' >"+b[i].nebfac1+"</td>"
				                      +"<td id='redate1_row"+srno+"' >"+b[i].redate1+"</td>"
				                      				                     				                     	
				                      
				                      +"<td  hidden id='del_row"+srno+"'>"+b[i].delflg+"</td>"	
				                      +"<td  hidden id='rcrusrid_row"+srno+"'>"+b[i].rcrusrid+"</td>"	
				                      +"<td  hidden id='rcrtme_row"+srno+"'>"+b[i].rcrtime+"</td>"	
				                      +"<td  hidden id='lchusrid_row"+srno+"'>"+b[i].lchgusrid+"</td>"	
				                      +"<td  hidden id='lchtme_row"+srno+"'>"+b[i].lchgtime+"</td>"		
				                     
				                      
				                    
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
										 
										 $("#det1").append(
								 				  "<tr>"

						                   	  +"<td id='cat1_row"+srno+"'>"+b[i].cat1+"</td>"
						                      +"<td id='fpd1_row"+srno+"' >"+b[i].fpd1+"</td>"
						                      +"<td  id='incosh1_row"+srno+"' >"+b[i].incosh1+"</td>"
						                      +"<td  id='indeb1_row"+srno+"' >"+b[i].indeb1+"</td>"
						                      +"<td id='invcorbo1_row"+srno+"' >"+b[i].invcorbo1+"</td>"
						                      +"<td id='invotdeb1_row"+srno+"'>"+b[i].invotdeb1+"</td>"
						                      +"<td id='osloan1_row"+srno+"' >"+b[i].osloan1+"</td>"
						                      +"<td id='osods1_row"+srno+"' >"+b[i].osods1+"</td>"
						                      +"<td id='billre1_row"+srno+"' >"+b[i].billre1+"</td>"
						                      +"<td class='sumder alnum' id='nebfac1_row"+srno+"' >"+b[i].nebfac1+"</td>"
						                      +"<td id='redate1_row"+srno+"' >"+b[i].redate1+"</td>"
						                      				                     				                     	
						                      
						                      +"<td  hidden id='del_row"+srno+"'>"+b[i].delflg+"</td>"	
						                      +"<td  hidden id='rcrusrid_row"+srno+"'>"+b[i].rcrusrid+"</td>"	
						                      +"<td  hidden id='rcrtme_row"+srno+"'>"+b[i].rcrtime+"</td>"	
						                      +"<td  hidden id='lchusrid_row"+srno+"'>"+b[i].lchgusrid+"</td>"	
						                      +"<td  hidden id='lchtme_row"+srno+"'>"+b[i].lchgtime+"</td>"		
						                     
						                      
						                    
						                      
						                     
						                      
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
					url : "PSC0104details2",
					data : pymd,
					dataType : 'json',
					type : 'POST',
					async : false,
					success : function(res) {	
						
							//	alert("refePYM100"+refePYM100);
								
								  $("#det2 tr").remove();
								 
								
								var b=JSON.parse(res.det2PSC0104);
								 console.log(b);
								
									 	if(f=="onload"){
									 		$("#modify").show();
									 		$("#modify1").show();
									 		for(var i=0;i<b.length;i++){
									 			
									 			 $("#det2").append(
										 				 "<tr>"

									                   	  +"<td id='cat2_row"+srno+"'>"+b[i].cat2+"</td>"
									                      +"<td id='fpd2_row"+srno+"' >"+b[i].fpd2+"</td>"
									                      +"<td  id='incosh2_row"+srno+"' >"+b[i].incosh2+"</td>"
									                      +"<td  id='indeb2_row"+srno+"' >"+b[i].indeb2+"</td>"
									                      +"<td id='invcorbo2_row"+srno+"' >"+b[i].invcorbo2+"</td>"
									                      +"<td id='invotdeb2_row"+srno+"'>"+b[i].invotdeb2+"</td>"
									                      +"<td id='osloan2_row"+srno+"' >"+b[i].osloan2+"</td>"
									                      +"<td id='osods2_row"+srno+"' >"+b[i].osods2+"</td>"
									                      +"<td id='billre2_row"+srno+"' >"+b[i].billre2+"</td>"
									                      +"<td class='sumder alnum' id='nebfac2_row"+srno+"' >"+b[i].nebfac2+"</td>"
									                      +"<td id='redate2_row"+srno+"' >"+b[i].redate2+"</td>"
									                      				                     				                     	
									                      
									                      +"<td  hidden id='del_row"+srno+"'>"+b[i].delflg+"</td>"	
									                      +"<td  hidden id='rcrusrid_row"+srno+"'>"+b[i].rcrusrid+"</td>"	
									                      +"<td  hidden id='rcrtme_row"+srno+"'>"+b[i].rcrtime+"</td>"	
									                      +"<td  hidden id='lchusrid_row"+srno+"'>"+b[i].lchgusrid+"</td>"	
									                      +"<td  hidden id='lchtme_row"+srno+"'>"+b[i].lchgtime+"</td>"		
									                     
	
									                      
									                    
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

									                   	  +"<td id='cat2_row"+srno+"'>"+b[i].cat2+"</td>"
									                      +"<td id='fpd2_row"+srno+"' >"+b[i].fpd2+"</td>"
									                      +"<td  id='incosh2_row"+srno+"' >"+b[i].incosh2+"</td>"
									                      +"<td  id='indeb2_row"+srno+"' >"+b[i].indeb2+"</td>"
									                      +"<td id='invcorbo2_row"+srno+"' >"+b[i].invcorbo2+"</td>"
									                      +"<td id='invotdeb2_row"+srno+"'>"+b[i].invotdeb2+"</td>"
									                      +"<td id='osloan2_row"+srno+"' >"+b[i].osloan2+"</td>"
									                      +"<td id='osods2_row"+srno+"' >"+b[i].osods2+"</td>"
									                      +"<td id='billre2_row"+srno+"' >"+b[i].billre2+"</td>"
									                      +"<td  class='sumder alnum' id='nebfac2_row"+srno+"' >"+b[i].nebfac2+"</td>"
									                      +"<td id='redate2_row"+srno+"' >"+b[i].redate2+"</td>"
									                      				                     				                     	
									                      
									                      +"<td  hidden id='del_row"+srno+"'>"+b[i].delflg+"</td>"	
									                      +"<td  hidden id='rcrusrid_row"+srno+"'>"+b[i].rcrusrid+"</td>"	
									                      +"<td  hidden id='rcrtme_row"+srno+"'>"+b[i].rcrtime+"</td>"	
									                      +"<td  hidden id='lchusrid_row"+srno+"'>"+b[i].lchgusrid+"</td>"	
									                      +"<td  hidden id='lchtme_row"+srno+"'>"+b[i].lchgtime+"</td>"		
									                     
									                      
									                    
									                     
									                      
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
						"repname" : '<%=reptype%>',"ReporefSeq" : '<%=ReporefSeq%>',"instno" :ins,"dt2" :'<%=dt2%>' ,"dt1" :'<%=dt1%>',"curr": '<%=curr%>' 
					}; 
					
				$.ajax({
					url : "PSC0104details3",
					data : pymd,
					dataType : 'json',
					type : 'POST',
					async : false,		
				success : function(res) {	
					//	alert("refePYM100"+refePYM100);
						
						$("#det3 tr").remove();
						 
						
						var b=JSON.parse(res.det3PSC0104);
						 console.log(b);
						
							 	if(f=="onload"){
							 		$("#modify").show();
							 		$("#modify1").show();
							 		for(var i=0;i<b.length;i++){
							 			
							 			
								 		  $("#det3").append(
								 				 "<tr>"

							                   	  +"<td id='cat3_row"+srno+"'>"+b[i].cat3+"</td>"
							                      +"<td id='fpd3_row"+srno+"' >"+b[i].fpd3+"</td>"
							                      +"<td  id='incosh3_row"+srno+"' >"+b[i].incosh3+"</td>"
							                      +"<td  id='indeb3_row"+srno+"' >"+b[i].indeb3+"</td>"
							                      +"<td id='invcorbo3_row"+srno+"' >"+b[i].invcorbo3+"</td>"
							                      +"<td id='invotdeb3_row"+srno+"'>"+b[i].invotdeb3+"</td>"
							                      +"<td id='osloan3_row"+srno+"' >"+b[i].osloan3+"</td>"
							                      +"<td id='osods3_row"+srno+"' >"+b[i].osods3+"</td>"
							                      +"<td id='billre3_row"+srno+"' >"+b[i].billre3+"</td>"
							                      +"<td class='sumder alnum' id='nebfac3_row"+srno+"' >"+b[i].nebfac3+"</td>"
							                      +"<td id='redate3_row"+srno+"' >"+b[i].redate3+"</td>"
							                      				                     				                     	
							                      
							                      +"<td  hidden id='del_row"+srno+"'>"+b[i].delflg+"</td>"	
							                      +"<td  hidden id='rcrusrid_row"+srno+"'>"+b[i].rcrusrid+"</td>"	
							                      +"<td  hidden id='rcrtme_row"+srno+"'>"+b[i].rcrtime+"</td>"	
							                      +"<td  hidden id='lchusrid_row"+srno+"'>"+b[i].lchgusrid+"</td>"	
							                      +"<td  hidden id='lchtme_row"+srno+"'>"+b[i].lchgtime+"</td>"		
							                     
							                      
							                    
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
										 
											
								 		  $("#det3").append(
								 				 "<tr>"

							                   	  +"<td id='cat3_row"+srno+"'>"+b[i].cat3+"</td>"
							                      +"<td id='fpd3_row"+srno+"' >"+b[i].fpd3+"</td>"
							                      +"<td  id='incosh3_row"+srno+"' >"+b[i].incosh3+"</td>"
							                      +"<td  id='indeb3_row"+srno+"' >"+b[i].indeb3+"</td>"
							                      +"<td id='invcorbo3_row"+srno+"' >"+b[i].invcorbo3+"</td>"
							                      +"<td id='invotdeb3_row"+srno+"'>"+b[i].invotdeb3+"</td>"
							                      +"<td id='osloan3_row"+srno+"' >"+b[i].osloan3+"</td>"
							                      +"<td id='osods3_row"+srno+"' >"+b[i].osods3+"</td>"
							                      +"<td id='billre3_row"+srno+"' >"+b[i].billre3+"</td>"
							                      +"<td class='sumder alnum' id='nebfac3_row"+srno+"' >"+b[i].nebfac3+"</td>"
							                      +"<td id='redate3_row"+srno+"' >"+b[i].redate3+"</td>"
							                      				                     				                     	
							                      
							                      +"<td  hidden id='del3_row"+srno+"'>"+b[i].delflg+"</td>"	
							                      +"<td  hidden id='rcrusrid3_row"+srno+"'>"+b[i].rcrusrid+"</td>"	
							                      +"<td  hidden id='rcrtme3_row"+srno+"'>"+b[i].rcrtime+"</td>"	
							                      +"<td  hidden id='lchusrid3_row"+srno+"'>"+b[i].lchgusrid+"</td>"	
							                      +"<td  hidden id='lchtme3_row"+srno+"'>"+b[i].lchgtime+"</td>"		
							                     
							                      
							                    
							                     
							                      
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
							url : "PSC0104sec1",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec1 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC0104);
								 console.log(b);
								
                                 
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec1").append("<tr>"
									 				  
									 				  
									 				 +"<td id='isicinstname_row"+cnt+"'>"+b[i].isicinstname+"</td>"
								                      +"<td class='sumder alnum' id='isicinstcode_row"+cnt+"' >"+b[i].isicinstcode+"</td>"
								                    //  +"<td id='srno_row"+srno+"'>"+srno+"</td>"
								                      +"<td class='sumder alnum' id='isicforebilpuranddisc_row"+cnt+"' >"+b[i].isicforebilpuranddisc+"</td>"
								                      +"<td  class='sumder alnum' id='isicinveincorshare_row"+cnt+"' >"+b[i].isicinveincorshare+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvesindebentu_row"+cnt+"' >"+b[i].isicinvesindebentu+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvescorpbond_row"+cnt+"'>"+b[i].isicinvescorpbond+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvsothedebsecur_row"+cnt+"' >"+b[i].isicinvsothedebsecur+"</td>"
								                      +"<td  class='sumder alnum' id='isicoverdraftoutsidmur_row"+cnt+"' >"+b[i].isicoverdraftoutsidmur+"</td>"
								                      +"<td  class='sumder alnum' id='isictotoutstloanandoutmur_row"+cnt+"' >"+b[i].isictotoutstloanandoutmur+"</td>"
								                      
								                      +"<td  class='sumder alnum' id='isicbillsreceiv_row"+cnt+"' >"+b[i].isicbillsreceiv+"</td>"
								                      +"<td  class='sumder alnum' id='isictotfunbasfaci_row"+cnt+"'>"+b[i].isictotfunbasfaci+"</td>"
								                      +"<td  class='sumder alnum'id='isicnonfunbasfaci_row"+cnt+"' >"+b[i].isicnonfunbasfaci+"</td>"
								                     
									 		  
									 		  +"<td  style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+cnt+") id='edit"+cnt+"'></td></tr>") ;  
									 		  
									 		 
											
									 		 cnt++;
											 
											
												}
											
									 	
									}
									

						});   	
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "PSC0104sec2",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec2 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC0104s2);
								
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 			
									 			
									 			 //if(i==0 || i==11 || i==2 || i==3 || i==4 || i==5 || i==6 || i==7 || i==8 || i==9 || i==10  || i==12 || i==13 || i==14){
									 				if(i==0 || i==10 ){
									 				  $("#sec2").append(
												 				 "<tr>"
												 				 +"<td id='memoitmanual1instname_row"+cnt+"'>"+b[i].memoitmanual1instname+"</td>"
											                      +"<td class='sumder alnum' id='memoitmanual1instcode_row"+cnt+"' >"+b[i].memoitmanual1instcode+"</td>"
											                     // +"<td id='srno_row"+srno+"'>"+srno+"</td>"
											                      +"<td class='sumder alnum' id='memoitmanual1forebilpuranddisc_row"+cnt+"' >"+b[i].memoitmanual1forebilpuranddisc+"</td>"
											                      +"<td  class='sumder alnum' id='memoitmanual1inveincorshare_row"+cnt+"' >"+b[i].memoitmanual1inveincorshare+"</td>"
											                      +"<td  class='sumder alnum' id='memoitmanual1invesindebentu_row"+cnt+"' >"+b[i].memoitmanual1invesindebentu+"</td>"
											                      +"<td  class='sumder alnum' id='memoitmanual1invescorpbond_row"+cnt+"'>"+b[i].memoitmanual1invescorpbond+"</td>"
											                      +"<td  class='sumder alnum' id='memoitmanual1invsothedebsecur_row"+cnt+"' >"+b[i].memoitmanual1invsothedebsecur+"</td>"
											                      +"<td  class='sumder alnum' id='isicoverdraftoutsidmur_row"+cnt+"' >"+b[i].memoitmanual1overdraftoutsidmur+"</td>"
											                      +"<td  class='sumder alnum' id='memoitmanual1totoutstloanandoutmur_row"+srno+"' >"+b[i].memoitmanual1totoutstloanandoutmur+"</td>"
											                      
											                      +"<td  class='sumder alnum' id='memoitmanual1billsreceiv_row"+cnt+"' >"+b[i].memoitmanual1billsreceiv+"</td>"
											                      +"<td  class='sumder alnum' id='memoitmanual1totfunbasfaci_row"+cnt+"'>"+b[i].memoitmanual1totfunbasfaci+"</td>"
											                      +"<td  class='sumder alnum'id='memoitmanual1nonfunbasfaci_row"+cnt+"' >"+b[i].memoitmanual1nonfunbasfaci+"</td>"
											                     
			 		  										 		  
												 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+cnt+") id='edit"+cnt+"'></td></tr>") ;  	
														
													}else{
														/* $("#sec2").append('<tr><td id="itn'+cnt+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+b[i].instname+'</td><td  id="itc'+cnt1+'" >'+b[i].instcode+'</td><td id="daa'+cnt1+'" class=alnum>'+b[i].dailyavgamt+'</td><td id="wai'+cnt1+'" class=alnum>'+b[i].wgtavgrate+'</td><td id="iie'+cnt1+'" class=alnum>'+b[i].intincexp+'</td><td style="text-align: center;"><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td><tr>');
													} */
									 		  $("#sec2").append(
										 				 "<tr>"
										 				 +"<td id='memoitmanual1instname_row"+cnt+"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+b[i].memoitmanual1instname+"</td>"
									                      +"<td class='sumder alnum' id='memoitmanual1instcode_row"+cnt+"' >"+b[i].memoitmanual1instcode+"</td>"
									                     // +"<td id='srno_row"+srno+"'>"+srno+"</td>"
									                      +"<td class='sumder alnum' id='memoitmanual1forebilpuranddisc_row"+cnt+"' >"+b[i].memoitmanual1forebilpuranddisc+"</td>"
									                      +"<td  class='sumder alnum' id='memoitmanual1inveincorshare_row"+cnt+"' >"+b[i].memoitmanual1inveincorshare+"</td>"
									                      +"<td  class='sumder alnum' id='memoitmanual1invesindebentu_row"+cnt+"' >"+b[i].memoitmanual1invesindebentu+"</td>"
									                      +"<td  class='sumder alnum' id='memoitmanual1invescorpbond_row"+cnt+"'>"+b[i].memoitmanual1invescorpbond+"</td>"
									                      +"<td  class='sumder alnum' id='memoitmanual1invsothedebsecur_row"+cnt+"' >"+b[i].memoitmanual1invsothedebsecur+"</td>"
									                      +"<td  class='sumder alnum' id='isicoverdraftoutsidmur_row"+cnt+"' >"+b[i].memoitmanual1overdraftoutsidmur+"</td>"
									                      +"<td  class='sumder alnum' id='memoitmanual1totoutstloanandoutmur_row"+srno+"' >"+b[i].memoitmanual1totoutstloanandoutmur+"</td>"
									                      
									                      +"<td  class='sumder alnum' id='memoitmanual1billsreceiv_row"+cnt+"' >"+b[i].memoitmanual1billsreceiv+"</td>"
									                      +"<td  class='sumder alnum' id='memoitmanual1totfunbasfaci_row"+cnt+"'>"+b[i].memoitmanual1totfunbasfaci+"</td>"
									                      +"<td  class='sumder alnum'id='memoitmanual1nonfunbasfaci_row"+cnt+"' >"+b[i].memoitmanual1nonfunbasfaci+"</td>"
									                     
	 		  										 		  
										 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+cnt+") id='edit"+cnt+"'></td></tr>") ;  
										 		  
									 		}
									 		 cnt++;
											 
											
												}
										
									
									}
									

						});   
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "PSC0104sec3",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec3 tr").remove();
								 
								
								var b=JSON.parse(res.sec1PSC0104s3);
								 console.log(b);
								
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 			if(i==0 || i==1 || i==2 || i==3 || i==4 || i==12 || i==13 || i==14 || i==15 || i==16 || i==17){
									 			
									 			
									 		  $("#sec3").append("<tr>"
									 				  
									 				  
										 				 +"<td id='memoitmanual2instname_row"+cnt+"'>"+b[i].memoitmanual2instname+"</td>"
									                      +"<td class='sumder alnum' id='memoitmanual2instcode_row"+cnt+"' >"+b[i].memoitmanual2instcode+"</td>"
									                     // +"<td id='srno_row"+srno+"'>"+srno+"</td>"
									                      +"<td class='sumder alnum' id='memoitmanual2forebilpuranddisc_row"+cnt+"' >"+b[i].memoitmanual2forebilpuranddisc+"</td>"
									                      +"<td  class='sumder alnum' id='memoitmanual2inveincorshare_row"+cnt+"' >"+b[i].memoitmanual2inveincorshare+"</td>"
									                      +"<td  class='sumder alnum' id='memoitmanual2invesindebentu_row"+cnt+"' >"+b[i].memoitmanual2invesindebentu+"</td>"
									                      +"<td  class='sumder alnum' id='memoitmanual2invescorpbond_row"+cnt+"'>"+b[i].memoitmanual2invescorpbond+"</td>"
									                      +"<td  class='sumder alnum' id='memoitmanual2invsothedebsecur_row"+cnt+"' >"+b[i].memoitmanual2invsothedebsecur+"</td>"
									                      +"<td  class='sumder alnum' id='memoitmanual2overdraftoutsidmur_row"+cnt+"' >"+b[i].memoitmanual2overdraftoutsidmur+"</td>"
									                      +"<td  class='sumder alnum' id='memoitmanual2totoutstloanandoutmur_row"+cnt+"' >"+b[i].memoitmanual2totoutstloanandoutmur+"</td>"
									                      
									                      +"<td  class='sumder alnum' id='memoitmanual2billsreceiv_row"+cnt+"' >"+b[i].memoitmanual2billsreceiv+"</td>"
									                      +"<td  class='sumder alnum' id='memoitmanual2totfunbasfaci_row"+cnt+"'>"+b[i].memoitmanual2totfunbasfaci+"</td>"
									                      +"<td  class='sumder alnum'id='memoitmanual2nonfunbasfaci_row"+cnt+"' >"+b[i].memoitmanual2nonfunbasfaci+"</td>"
									                     
										 		  
										 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+cnt+") id='edit"+cnt+"'></td></tr>") ;  
									 			}
									 			else{
									 				
									 				  $("#sec3").append("<tr>"
									 				+"<td id='memoitmanual2instname_row"+cnt+"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+b[i].memoitmanual2instname+"</td>"
								                      +"<td class='sumder alnum' id='memoitmanual2instcode_row"+cnt+"' >"+b[i].memoitmanual2instcode+"</td>"
								                     // +"<td id='srno_row"+srno+"'>"+srno+"</td>"
								                      +"<td class='sumder alnum' id='memoitmanual2forebilpuranddisc_row"+cnt+"' >"+b[i].memoitmanual2forebilpuranddisc+"</td>"
								                      +"<td  class='sumder alnum' id='memoitmanual2inveincorshare_row"+cnt+"' >"+b[i].memoitmanual2inveincorshare+"</td>"
								                      +"<td  class='sumder alnum' id='memoitmanual2invesindebentu_row"+cnt+"' >"+b[i].memoitmanual2invesindebentu+"</td>"
								                      +"<td  class='sumder alnum' id='memoitmanual2invescorpbond_row"+cnt+"'>"+b[i].memoitmanual2invescorpbond+"</td>"
								                      +"<td  class='sumder alnum' id='memoitmanual2invsothedebsecur_row"+cnt+"' >"+b[i].memoitmanual2invsothedebsecur+"</td>"
								                      +"<td  class='sumder alnum' id='memoitmanual2overdraftoutsidmur_row"+cnt+"' >"+b[i].memoitmanual2overdraftoutsidmur+"</td>"
								                      +"<td  class='sumder alnum' id='memoitmanual2totoutstloanandoutmur_row"+cnt+"' >"+b[i].memoitmanual2totoutstloanandoutmur+"</td>"
								                      
								                      +"<td  class='sumder alnum' id='memoitmanual2billsreceiv_row"+cnt+"' >"+b[i].memoitmanual2billsreceiv+"</td>"
								                      +"<td  class='sumder alnum' id='memoitmanual2totfunbasfaci_row"+cnt+"'>"+b[i].memoitmanual2totfunbasfaci+"</td>"
								                      +"<td  class='sumder alnum'id='memoitmanual2nonfunbasfaci_row"+cnt+"' >"+b[i].memoitmanual2nonfunbasfaci+"</td>"
								                     
									 		  
									 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+cnt+") id='edit"+cnt+"'></td></tr>") ; 
									 			}
											
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
	location.href = "XBRL_REP_PSC0104_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
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
	if(b==1 ||b==2 || b==3 || b==4 ||b==5||b==6 || b==7 || b==8 || b==9  || b==10){
		
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
		if(b==1 ||b==2 || b==3 || b==4 ||b==5||b==6 || b==7 || b==8 || b==9 || b==10){
			
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
	
function myFunction3(a,b) {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById(a);
	  filter = input.value.toUpperCase();
	  table = document.getElementById("det3");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[b];
	 
	if (td) {
		if(b==1 ||b==2 || b==3 || b==4 ||b==5||b==6 || b==7 || b==8 || b==9 || b==10){
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
		 location.href="XBRL_CRT_PSC0104_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
		
	
	
	$('#btnExcel').click(function() {
		
		
		if(tabid==1){
			
		
		  PSC0104Form.action = "PSC0104EXCELREPORT1.action?method=PSC0104EXCEL1&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+"SEC"+tabid+"+&curr="+'<%=curr%>';
		 PSC0104Form.submit(); 
		}
		else if(tabid==2)
			{
			
			
				  PSC0104Form.action = "PSC0104EXCELREPORT2.action?method=PSC0104EXCEL2&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+"SEC"+tabid+"+&curr="+'<%=curr%>';
				 PSC0104Form.submit(); 
				} 
		else if(tabid==3)
		{
		
		
			  PSC0104Form.action = "PSC0104EXCELREPORT3.action?method=PSC0104EXCEL3&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+"SEC"+tabid+"+&curr="+'<%=curr%>';
			 PSC0104Form.submit(); 
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
		
		location.href = "XBRL_REP_PSC0104_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
 

	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_PSC0104_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	
	
	
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 PSC0104Form.action = "PSC0104EXCELSum.action?method=SUP0500EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 PSC0104Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 PSC0104Form.action = "PSC0104PDFREPORT.action?method=SUP0500PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 PSC0104Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  PSC0104Form.action = "XMLDOWNLOAD.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 PSC0104Form.submit(); 
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
		$("#det1").prepend("<tr><td id='cat1_row"+rowno+"'><input type='text' id='cat1_text"+rowno+"' style='width: 139px;'></td><td id='fpd1_row"+rowno+"'><input type='text'  id='fpd1_text"+rowno+"' style='    width:138px;'></td><td id='incosh1_row"+rowno+"'><input type='text' id='incosh1_text"+rowno+"' style='     width: 121px;'></td><td id='indeb1_row"+rowno+"'><input type='text' 	id='indeb1_text"+rowno+"' style='    width: 140px;'></td><td id='invcorbo1_row"+rowno+"'><input type='text' id='invcorbo1_text"+rowno+"' style='    width: 100px;'></td><td id='invotdeb1_row"+rowno+"' class='sumder alnum'><input type='text'  id='invotdeb1_text"+rowno+"'  class='decimalPt roundUp'  style='    width: 115px;'></td><td id='osloan1_row"+rowno+"' class='sumder alnum'><input type='text'  id='osloan1_text"+rowno+"'  class='decimalPt roundUp'  style='    width: 115px;'></td><td id='osods1_row"+rowno+"'><input type='text' id='osods1_text"+rowno+"' style='    width: 140px;'></td><td id='billre1_row"+rowno+"'><input type='text' id='billre1_text"+rowno+"' style='    width: 98px;'></td><td id='nebfac1_row"+rowno+"'><input type='text' id='nebfac1_text"+rowno+"'class='decimalPt roundUp' style='    width: 96px;'></td><td id='redate1_row"+rowno+"'><input type='text' id='redate1_text"+rowno+"' style='    width: 98px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");
		}
		else if
		(tabid==2){
			$("#det2").prepend("<tr><td id='cat2_row"+rowno+"'><input type='text' id='cat2_text"+rowno+"' style='width: 139px;'></td><td id='fpd2_row"+rowno+"'><input type='text'  id='fpd2_text"+rowno+"' style='    width:138px;'></td><td id='incosh2_row"+rowno+"'><input type='text' id='incosh2_text"+rowno+"' style='     width: 121px;'></td><td id='indeb2_row"+rowno+"'><input type='text' 	id='indeb2_text"+rowno+"' style='    width: 140px;'></td><td id='invcorbo2_row"+rowno+"'><input type='text' id='invcorbo2_text"+rowno+"' style='    width: 100px;'></td><td id='invotdeb2_row"+rowno+"' class='sumder alnum'><input type='text'  id='invotdeb2_text"+rowno+"'  class='decimalPt roundUp'  style='    width: 115px;'></td><td id='osloan2_row"+rowno+"' class='sumder alnum'><input type='text'  id='osloan2_text"+rowno+"'  class='decimalPt roundUp'  style='    width: 115px;'></td><td id='osods2_row"+rowno+"'><input type='text' id='osods2_text"+rowno+"' style='    width: 140px;'></td><td id='billre2_row"+rowno+"'><input type='text' id='billre2_text"+rowno+"' style='    width: 98px;'></td><td id='nebfac2_row"+rowno+"'><input type='text' id='nebfac2_text"+rowno+"' class='decimalPt roundUp' style='    width: 96px;'></td><td id='redate2_row"+rowno+"'><input type='text' id='redate2_text"+rowno+"' style='    width: 98px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");
			}
		else if(tabid==3){
			$("#det3").prepend("<tr><td id='cat3_row"+rowno+"'><input type='text' id='cat3_text"+rowno+"' style='width:139px;'></td><td id='fpd3_row"+rowno+"'><input type='text'  id='fpd3_text"+rowno+"' style='    width:138px;'></td><td id='incosh3_row"+rowno+"'><input type='text' id='incosh3_text"+rowno+"' style='     width: 121px;'></td><td id='indeb3_row"+rowno+"'><input type='text' 	id='indeb3_text"+rowno+"' style='    width: 140px;'></td><td id='invcorbo3_row"+rowno+"'><input type='text' id='invcorbo3_text"+rowno+"' style='    width: 100px;'></td><td id='invotdeb3_row"+rowno+"' class='sumder alnum'><input type='text'  id='invotdeb3_text"+rowno+"'  class='decimalPt roundUp'  style='    width: 115px;'></td><td id='osloan3_row"+rowno+"' class='sumder alnum'><input type='text'  id='osloan3_text"+rowno+"'  class='decimalPt roundUp'  style='    width: 115px;'></td><td id='osods3_row"+rowno+"'><input type='text' id='osods3_text"+rowno+"' style='    width:140px;'></td><td id='billre3_row"+rowno+"'><input type='text' id='billre3_text"+rowno+"' style='    width: 98px;'></td><td id='nebfac3_row"+rowno+"'><input type='text' id='nebfac3_text"+rowno+"'  class='decimalPt roundUp' style='    width: 96px;'></td><td id='redate3_row"+rowno+"'><input type='text' id='redate3_text"+rowno+"' style='    width: 98px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");

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
	$("#redate1_text"+a).datepicker({
	dateFormat: "dd-mm-yy",
	        changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: "today"
	});




	$("#redate2_text"+a).datepicker({
	dateFormat: "dd-mm-yy",
	       changeMonth: true,//this option for allowing user to select month
	     changeYear: true,
	     yearRange: "-100:+0",
	     maxDate: "today"
	});


	$("#redate3_text"+a).datepicker({
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
var	nebfac1 =  document.getElementById("nebfac1_row"+no);
var	nebfac1_data = nebfac1.innerHTML;


nebfac1.innerHTML="<input type='text' class='decimalPt roundUp'  id='nebfac1_text"+no+"'  style='width: 83px'; value='"+nebfac1_data+"'>";


}
	else if(tabid==2)
	{
		var	nebfac2 =  document.getElementById("nebfac2_row"+no);
		var	nebfac2_data = nebfac2.innerHTML;


		nebfac2.innerHTML="<input type='text' class='decimalPt roundUp'  id='nebfac2_text"+no+"'  style='width: 83px'; value='"+nebfac2_data+"'>";


		}
	else(tabid==3)

		{
		var	nebfac3 =  document.getElementById("nebfac3_row"+no);
		var	nebfac3_data = nebfac3.innerHTML;


		nebfac3.innerHTML="<input type='text' class='decimalPt roundUp'  id='nebfac3_text"+no+"'  style='width: 83px'; value='"+nebfac3_data+"'>";


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
var nebfac1_val=document.getElementById("nebfac1_text"+no).value;

document.getElementById("nebfac1_row"+no).innerHTML=nebfac1_val;
}
if (tabid==2){
	var nebfac2_val=document.getElementById("nebfac2_text"+no).value;

	document.getElementById("nebfac2_row"+no).innerHTML=nebfac2_val;
	}

if (tabid==3){
var nebfac3_val=document.getElementById("nebfac3_text"+no).value;

document.getElementById("nebfac3_row"+no).innerHTML=nebfac3_val;
}


if($("#addrowno").val()=="1"){
	
	
	if (tabid==1){
var  cat1_val=document.getElementById("cat1_text"+no).value;	 
document.getElementById("cat1_row"+no).innerHTML=cat1_val;

   var fpd1_val=document.getElementById("fpd1_text"+no).value;
   document.getElementById("fpd1_row"+no).innerHTML=fpd1_val;
   
  var incosh1_val=document.getElementById("incosh1_text"+no).value;
   document.getElementById("incosh1_row"+no).innerHTML=incosh1_val;

   var indeb1_val=document.getElementById("indeb1_text"+no).value;
	document.getElementById("indeb1_row"+no).innerHTML=indeb1_val;
	
  
  var invcorbo1_val=document.getElementById("invcorbo1_text"+no).value;	
  document.getElementById("invcorbo1_row"+no).innerHTML=invcorbo1_val;
 
  var  invotdeb1_val=document.getElementById("invotdeb1_text"+no).value;	 
  document.getElementById("invotdeb1_row"+no).innerHTML=invotdeb1_val;
  
  var  osloan1_val=document.getElementById("osloan1_text"+no).value;	 
  document.getElementById("osloan1_row"+no).innerHTML=osloan1_val;

  var  osods1_val=document.getElementById("osods1_text"+no).value;	 
  document.getElementById("osods1_row"+no).innerHTML=osods1_val;

  var  billre1_val=document.getElementById("billre1_text"+no).value;	 
  document.getElementById("billre1_row"+no).innerHTML=billre1_val;

 

  

  var redate1_val=document.getElementById("redate1_text"+no).value;	 
  document.getElementById("redate1_row"+no).innerHTML=redate1_val;
  
	}
	
	
	if (tabid==2){
		var  cat2_val=document.getElementById("cat2_text"+no).value;	 
		document.getElementById("cat2_row"+no).innerHTML=cat2_val;

		   var fpd2_val=document.getElementById("fpd2_text"+no).value;
		   document.getElementById("fpd2_row"+no).innerHTML=fpd2_val;
		   
		  var incosh2_val=document.getElementById("incosh2_text"+no).value;
		   document.getElementById("incosh2_row"+no).innerHTML=incosh2_val;

		   var indeb2_val=document.getElementById("indeb2_text"+no).value;
			document.getElementById("indeb2_row"+no).innerHTML=indeb2_val;
			
		  
		  var invcorbo2_val=document.getElementById("invcorbo2_text"+no).value;	
		  document.getElementById("invcorbo2_row"+no).innerHTML=invcorbo2_val;
		 
		  var  invotdeb2_val=document.getElementById("invotdeb2_text"+no).value;	 
		  document.getElementById("invotdeb2_row"+no).innerHTML=invotdeb2_val;
		  
		  var  osloan2_val=document.getElementById("osloan2_text"+no).value;	 
		  document.getElementById("osloan2_row"+no).innerHTML=osloan2_val;

		  var  osods2_val=document.getElementById("osods2_text"+no).value;	 
		  document.getElementById("osods2_row"+no).innerHTML=osods2_val;

		  var  billre2_val=document.getElementById("billre2_text"+no).value;	 
		  document.getElementById("billre2_row"+no).innerHTML=billre2_val;

		 

		  

		  var redate2_val=document.getElementById("redate2_text"+no).value;	 
		  document.getElementById("redate2_row"+no).innerHTML=redate2_val;
		  
			}

	if (tabid==3){
		var  cat3_val=document.getElementById("cat3_text"+no).value;	 
		document.getElementById("cat3_row"+no).innerHTML=cat3_val;

		   var fpd3_val=document.getElementById("fpd3_text"+no).value;
		   document.getElementById("fpd3_row"+no).innerHTML=fpd3_val;
		   
		  var incosh3_val=document.getElementById("incosh3_text"+no).value;
		   document.getElementById("incosh3_row"+no).innerHTML=incosh3_val;

		   var indeb3_val=document.getElementById("indeb3_text"+no).value;
			document.getElementById("indeb3_row"+no).innerHTML=indeb3_val;
			
		  
		  var invcorbo3_val=document.getElementById("invcorbo3_text"+no).value;	
		  document.getElementById("invcorbo3_row"+no).innerHTML=invcorbo3_val;
		 
		  var  invotdeb3_val=document.getElementById("invotdeb3_text"+no).value;	 
		  document.getElementById("invotdeb3_row"+no).innerHTML=invotdeb3_val;
		  
		  var  osloan3_val=document.getElementById("osloan3_text"+no).value;	 
		  document.getElementById("osloan3_row"+no).innerHTML=osloan3_val;

		  var  osods3_val=document.getElementById("osods3_text"+no).value;	 
		  document.getElementById("osods3_row"+no).innerHTML=osods3_val;

		  var  billre3_val=document.getElementById("billre3_text"+no).value;	 
		  document.getElementById("billre3_row"+no).innerHTML=billre3_val;

		 

		  

		  var redate3_val=document.getElementById("redate3_text"+no).value;	 
		  document.getElementById("redate3_row"+no).innerHTML=redate3_val;
		  
			}

		
}

document.getElementById("edit_button"+no).style.display="block";
document.getElementById("save_button"+no).style.display="none";
if(tabid==1)
{
	
 var cat1=document.getElementById("cat1_row"+no).innerHTML;	 
   var fpd1=document.getElementById("fpd1_row"+no).innerHTML;
  var incosh1=document.getElementById("incosh1_row"+no).innerHTML;
  var indeb1=document.getElementById("indeb1_row"+no).innerHTML;
  var invcorbo1=document.getElementById("invcorbo1_row"+no).innerHTML;
  var invotdeb1=document.getElementById("invotdeb1_row"+no).innerHTML;	
  var osloan1=document.getElementById("osloan1_row"+no).innerHTML;	 
  var osods1=document.getElementById("osods1_row"+no).innerHTML;
  var billre1=document.getElementById("billre1_row"+no).innerHTML;	 
  var nebfac1=document.getElementById("nebfac1_row"+no).innerHTML;
  var redate1=document.getElementById("redate1_row"+no).innerHTML;
  
  $("#det1 td").attr("padding","8px");
  var refePSC104=document.getElementById("refDisplay").innerHTML;
  nebfac1=nebfac1.replace(/\,/g,'');
  nebfac1=Number(nebfac1);
  

  var rptdate1 = {
 		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refePSC104, "cat1":cat1,"fpd1":fpd1,"incosh1" : incosh1,"indeb1":indeb1, "invcorbo1":invcorbo1,"invotdeb1":invotdeb1,"osloan1":osloan1,"osods1":osods1,"billre1":billre1, "nebfac1":nebfac1,"redate1":redate1 
 		}; 
  
  $.ajax({
      url : "PSC0104s1",
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
 var cat2=document.getElementById("cat2_row"+no).innerHTML;	 
   var fpd2=document.getElementById("fpd2_row"+no).innerHTML;
  var incosh2=document.getElementById("incosh2_row"+no).innerHTML;
  var indeb2=document.getElementById("indeb2_row"+no).innerHTML;
  var invcorbo2=document.getElementById("invcorbo2_row"+no).innerHTML;
  var invotdeb2=document.getElementById("invotdeb2_row"+no).innerHTML;	
  var osloan2=document.getElementById("osloan2_row"+no).innerHTML;	 
  var osods2=document.getElementById("osods2_row"+no).innerHTML;
  var billre2=document.getElementById("billre2_row"+no).innerHTML;	 
  var nebfac2=document.getElementById("nebfac2_row"+no).innerHTML;
  var redate2=document.getElementById("redate2_row"+no).innerHTML;
  
  $("#det2 td").attr("padding","8px");
  var refePSC104=document.getElementById("refDisplay").innerHTML;
  nebfac2=nebfac2.replace(/\,/g,'');
  nebfac2=Number(nebfac2);
  
  var rptdate2 = {
		  "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refePSC104, "cat2":cat2,"fpd2":fpd2,"incosh2" : incosh2,"indeb2":indeb2, "invcorbo2":invcorbo2,"invotdeb2":invotdeb2,"osloan2":osloan2,"osods2":osods2,"billre2":billre2, "nebfac2":nebfac2,"redate2":redate2 
		}; 

$.ajax({
   url : "PSC0104s2",
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
if(tabid==3)
{
 var cat3=document.getElementById("cat3_row"+no).innerHTML;	 
   var fpd3=document.getElementById("fpd3_row"+no).innerHTML;
  var incosh3=document.getElementById("incosh3_row"+no).innerHTML;
  var indeb3=document.getElementById("indeb3_row"+no).innerHTML;
  var invcorbo3=document.getElementById("invcorbo3_row"+no).innerHTML;
  var invotdeb3=document.getElementById("invotdeb3_row"+no).innerHTML;	
  var osloan3=document.getElementById("osloan3_row"+no).innerHTML;	 
  var osods3=document.getElementById("osods3_row"+no).innerHTML;
  var billre3=document.getElementById("billre3_row"+no).innerHTML;	 
  var nebfac3=document.getElementById("nebfac3_row"+no).innerHTML;
  var redate3=document.getElementById("redate3_row"+no).innerHTML;

  $("#det3 td").attr("padding","8px");
  var refePSC104=document.getElementById("refDisplay").innerHTML;
  nebfac3=nebfac3.replace(/\,/g,'');
  nebfac3=Number(nebfac3);
  
  var rptdate3 = {
		  "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refePSC104, "cat3":cat3,"fpd3":fpd3,"incosh3" : incosh3,"indeb3":indeb3, "invcorbo3":invcorbo3,"invotdeb3":invotdeb3,"osloan3":osloan3,"osods3":osods3,"billre3":billre3, "nebfac3":nebfac3,"redate3":redate3 
		}; 

$.ajax({
   url : "PSC0104s3",
   data : rptdate3  ,
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



<SCRIPT>

function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_PSC0104_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>

<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="PSC0104Form"
		enctype="multipart/form-data">
             	<div class="tab-content" >
	 	<div class="active psc0105" id="tab2" style="width: 1500px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="   margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;"><%=reptype %> - <b id="sub" style="display: none"></b></b><b>Sectorwise Distribution of Credit to Non-residents<b id="sub"
					Style="display: none"></b></b></font>
			<br></div> 
		<ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">




 
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
			
		 
          
			 <!--******************SUMMARY SECTION 3********************************-->   		
		
				   <table class="table" id="tb3" style="width:100%;display:none;margin-top:-20px;">
          <th  colspan="12" style="text-align:center">Memorandum item-Annexure 2</th></tr>
          <tr>
          <th rowspan="3" style="width: 400px;,text-align:center"></th>
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
           
          <th rowspan="4" id="" style="text-align:center">Select</th>
          </tr>
          
          <tr>
          
          	
          <th colspan="1" id="" style="text-align:center">of which Overdrafts Outside Mauritius</th>
          <th colspan="1" id="" style="width: 150px;,text-align:center"></th>	
          </tr>
          
          <tr>
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
          <th style="text-align:center">AG	</th>
          </tr>
         <tr>
         
          </tr>
             <tbody class="databody" id="sec3"></tbody>
          </table>
	 <!--******************SUMMARY SECTION2********************************-->   			
			
            <table class="table" id="tb2" style="width:100%;display:none;margin-top:-20px;">
          <th  colspan="12" style="text-align:center">Memorandum item-Annexure 1	</th>
          </tr>
          
          <tr>
          <th rowspan="3" style="width: 400px;,text-align:center"></th>
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
           
          <th rowspan="4" id="" style="text-align:center">Select</th>
          </tr>
          
          <tr>
          
          
          <th colspan="1" id="" style="text-align:center">of which Overdrafts Outside Mauritius</th>
          <th colspan="1" id="" style="width: 150px;,text-align:center"></th>	
          </tr>
          
          <tr>
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
          <th style="text-align:center">V</th>
          </tr>
         
             <tbody class="databody" id="sec2"></tbody>
          </table>
          
  <!--******************SUMMARY SECTION1********************************-->   
               
               <table class="table" id="tb1" style="width:100%;display:none;margin-top:-20px;">
          <tr>
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
          <th style="text-align:center">K</th>
          </tr>
          <tr>
         
   
    
          </tr>   <tbody class="databody" id="sec1"></tbody>
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
			<div class="active" id="tab1" style="width: 1683px;padding-top: 1px;margin-top: -17px;" >
			<div style="  margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>
			<b id="sub"
					Style="display: none"></b></b></font>
			<br>
			<b style="font-size: 13px;"><b style="font-size: 13px;">PSC0104 - <b id="sub" style="display: none"></b></b>Sectorwise Distribution of Credit to Non-residents
			 <b id="sub" style="display: none"></b></b>
			 <br>
			 <br>
			</div>
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
           <table class="" style="width:1683px;height:50px;   ">
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
					 
						<th style="width:100px;"><input type="text" id="cat1" onkeyup="myFunction1(this.id,0)"  class="form-control2" placeholder="Category" disabled></th>
						<th  style="width:100px;"><input type="text" id="fpd1" onkeyup="myFunction1(this.id,1)"  class="form-control2" placeholder="Fbills pur Disc" disabled></th>						
						<th  style="width:100px;"><input type="text" id="incosh1" onkeyup="myFunction1(this.id,2)"  class="form-control2" placeholder="Investment Corporation Shares" disabled></th>
						<th  style="width:100px;"><input type="text" id="indeb1" onkeyup="myFunction1(this.id,3)"  class="form-control2" placeholder="Investment Depnt Number" disabled></th>
						<th  style="width:100px;"><input type="text" id="invcorbo1" style="width:80px;" onkeyup="myFunction1(this.id,4)"  class="form-control2" placeholder="Investment Corp Bonds" disabled></th>
						<th  style="width:100px;"><input type="text" id="invotdeb1" onkeyup="myFunction1(this.id,5)"  class="form-control2" placeholder="Investment Oth Depts" disabled></th>
						<th  style="width:100px;"><input type="text" style="width:100px;" id="osloan1" onkeyup="myFunction1(this.id,6)"  class="form-control2" placeholder="Os loans out mur" disabled></th>
						<th  style="width:100px;"><input type="text" id="osods1" onkeyup="myFunction1(this.id,7)"  class="form-control2" placeholder="Os Ods Out Mur" disabled></th>
						<th  style="width:100px;"><input type="text" id="billre1" style="width:100px;" onkeyup="myFunction1(this.id,8)"  class="form-control2" placeholder="Bills Receivable" disabled></th>						
												<th  style="width:100px;"><input type="text" id="nebfac1" style="width:100px;" onkeyup="myFunction1(this.id,9)"  class="form-control2" placeholder="Nfb Facility Amount" disabled></th>						
												<th  style="width:100px;"><input type="text" id="redate1" style="width:100px;" onkeyup="myFunction1(this.id,10)"  class="form-control2" placeholder="Report Date" disabled></th>						
						
						<th style="width:50px;" id="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det1">



              </tbody>
              
				</table>
				
				
				   <table class="table" id="detb2" style="width:100%;display:none;margin-top:-20px;">   <thead>
            
            
					 <tr class="filters">
					 	<th style="width:100px;"><input type="text" id="cat2" onkeyup="myFunction2(this.id,0)"  class="form-control2" placeholder="Category" disabled></th>
						<th style="width:100px;"><input type="text" id="fpd2" onkeyup="myFunction2(this.id,1)"  class="form-control2" placeholder="Fbills pur Disc" disabled></th>						
						<th style="width:100px;"><input type="text" id="incosh2" onkeyup="myFunction2(this.id,2)"  class="form-control2" placeholder="Investment Corporation Shares" disabled></th>
						<th style="width:100px;"><input type="text" id="indeb2" onkeyup="myFunction2(this.id,3)"  class="form-control2" placeholder="Investment Depnt Number" disabled></th>
						<th style="width:100px;"><input type="text" id="invcorbo2" style="width:80px;" onkeyup="myFunction2(this.id,4)"  class="form-control2" placeholder="Investment Corp Bonds" disabled></th>
						<th style="width:100px;"><input type="text" id="invotdeb2" onkeyup="myFunction2(this.id,5)"  class="form-control2" placeholder="Investment Oth Depts" disabled></th>
						<th style="width:100px;"><input type="text" style="width:100px;" id="osloan2" onkeyup="myFunction2(this.id,6)"  class="form-control2" placeholder="Os loans out mur" disabled></th>
						<th style="width:100px;"><input type="text" id="osods2" onkeyup="myFunction2(this.id,7)"  class="form-control2" placeholder="Os Ods Out Mur" disabled></th>
						<th style="width:100px;"><input type="text" id="billre2" style="width:100px;" onkeyup="myFunction2(this.id,8)"  class="form-control2" placeholder="Bills Receivable" disabled></th>						
												<th ><input type="text" id="nebfac2" style="width:100px;" onkeyup="myFunction2(this.id,9)"  class="form-control2" placeholder="Nfb Facility Amount" disabled></th>						
												<th ><input type="text" id="redate2" style="width:100px;" onkeyup="myFunction2(this.id,10)"  class="form-control2" placeholder="Report Date" disabled></th>						
						
						
										
						
						<th style="width:50px;" id="modify1">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det2">



              </tbody>
              
				</table>
				
				
				 <table class="table" id="detb3" style="width:100%;display:none;margin-top:-20px;">   <thead>
            
            
					 <tr class="filters">
					 	<th style="width:100px;"><input type="text" id="cat3" onkeyup="myFunction3(this.id,0)"  class="form-control2" placeholder="Category" disabled></th>
						<th style="width:100px;"><input type="text" id="fpd3" onkeyup="myFunction3(this.id,1)"  class="form-control2" placeholder="Fbills pur Disc" disabled></th>						
						<th style="width:100px;"><input type="text" id="incosh3" onkeyup="myFunction3(this.id,2)"  class="form-control2" placeholder="Investment Corporation Shares" disabled></th>
						<th style="width:100px;"><input type="text" id="indeb3" onkeyup="myFunction3(this.id,3)"  class="form-control2" placeholder="Investment Depnt Number" disabled></th>
						<th style="width:100px;"><input type="text" id="invcorbo3" style="width:80px;" onkeyup="myFunction3(this.id,4)"  class="form-control2" placeholder="Investment Corp Bonds" disabled></th>
						<th style="width:100px;"><input type="text" id="invotdeb3" onkeyup="myFunction3(this.id,5)"  class="form-control2" placeholder="Investment Oth Depts" disabled></th>
						<th style="width:100px;"><input type="text" style="width:100px;" id="osloan3" onkeyup="myFunction3(this.id,6)"  class="form-control2" placeholder="Os loans out mur" disabled></th>
						<th style="width:100px;"><input type="text" id="osods3" onkeyup="myFunction3(this.id,7)"  class="form-control2" placeholder="Os Ods Out Mur" disabled></th>
						<th style="width:100px;"><input type="text" id="billre3" style="width:100px;" onkeyup="myFunction3(this.id,8)"  class="form-control2" placeholder="Bills Receivable" disabled></th>						
												<th ><input type="text" id="nebfac3" style="width:100px;" onkeyup="myFunction3(this.id,9)"  class="form-control2" placeholder="Nfb Facility Amount" disabled></th>						
												<th ><input type="text" id="redate3" style="width:100px;" onkeyup="myFunction3(this.id,10)"  class="form-control2" placeholder="Report Date" disabled></th>						
						
						<th style="width:50px;" id="modify2">Modify</th>	
													
						
						
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det3">



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