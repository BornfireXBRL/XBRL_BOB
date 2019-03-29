<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLPSC0200Bean,dao.XBRLPSC0200Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
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
 
 XBRLPSC0200Dao dmd=new XBRLPSC0200Dao();
 
 DecimalFormat df = new DecimalFormat("##,#0.00");
	   
	 // ArrayList<XBRLPSC0200Bean> list=dmd.xbrlcrr100();
	  
	
	 
		  
		  
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

.clr{
color: #0c0b0b;
    background-color: #f5f5f5;
    border-color: #f5f5f5;
}


.table>thead>tr>th {
    vertical-align: top;
    border-bottom: 2px solid #ddd;
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



<script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});

/* checking count in PSC0200_MOD_TABLE for  redirecting to XBRL_VER_PSC0200_01.jsp */
var det={
	"repdate":'<%=dt2%>',"type":"chckmodified"
};
$.ajax({
	url:"PSC0200chckmodified",
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
			        	location.href = "XBRL_CRT_PSC0200_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
			        }
			      }
			    });
			
			
		}else{
			$("#modflg").val("N");
		}
	}
});

</script>
<SCRIPT>
/* ajax to load table values  */
var srno=1;
function fnload(z,d,e,b,c,a,f,g){
	//z --->typo(load or summary)
	//d -->date1
	//e -->date2
	//b -->refseqno
	//c -->instance no
	//a -->reptype
	//f -->types of details
	//g -->currency
			$("#btnXML").hide();
			 $("#btnSave").hide();
			 var save=0;
	 if(z=="load"){
		
			
			 

		 $(".det").addClass("clr");
		 $("#tab1").show();
			$("#tab2").hide();
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
		
		 $("#divLoading").addClass("show"); 
		 /* Loading values in Detail section  by  clicking detail button*/
		 var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "psc0200details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
			
			
					
					  
					  $("#det1 tr").remove();
				  
					 

					var b=JSON.parse(res.detPSC0200);
					 console.log(b);
					
			
						 	if(f=="onload"){
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			$("#det1").append(
											 
											
											
						 					 "<tr id='pscadd"+srno+"'>"
 						+"<td  id='accno_row"+srno+"'>"+b[i].accno+"</td>"
					  +"<td  id='custid_row"+srno+"'>"+b[i].custid+"</td>"
					  +"<td  id='custname_row"+srno+"'>"+b[i].custname+"</td>"
					  +"<td  id='nreflg_row"+srno+"'>"+b[i].nreflg+"</td>"
					  +"<td  id='countrcode_row"+srno+"'>"+b[i].countrcode+"</td>"
					  +"<td  id='uniqidenti_row"+srno+"'>"+b[i].uniqidenti+"</td>"
					  +"<td  id='detisiccode_row"+srno+"'>"+b[i].detisiccode+"</td>"
					  +"<td  id='groupcode_row"+srno+"'>"+b[i].groupcode+"</td>"
					  +"<td  class='sumder alnum' id='outstandamt_row"+srno+"'>"+b[i].outstandamt+"</td>"
					  +"<td  class='sumder alnum' id='outstandnfbamt_row"+srno+"'>"+b[i].outstandnfbamt+"</td>"
					  +"<td  id='purpose_row"+srno+"'>"+b[i].purpose+"</td>"
					  +"<td  id='natofcre_row"+srno+"'>"+b[i].natofcre+"</td>"
					  +"<td  id='reportdate_row"+srno+"'>"+b[i].reportdate+"</td>"
					 
					  
					  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
					  
					  /*    +"<td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td>" */	
	                    
	                     
	                     
                      
	                    +"</tr>" ) ; 
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		
						 		 /* Loading values in Detail section - from summary to  detail w*/
						 		$(".add").hide();//add button hide
						 	
						 		$("#modify").hide();//modify in the header hide
						 		
						 		
						 		
								  
						 		for(var i=0;i<b.length;i++){
						 			
						 			$("#det1").append(
											 
											
											
						 					 "<tr id='pscadd"+srno+"'>"

						                 
					  +"<td  id='accno_row"+srno+"'>"+b[i].accno+"</td>"
					  +"<td  id='custid_row"+srno+"'>"+b[i].custid+"</td>"
					  +"<td  id='custname_row"+srno+"'>"+b[i].custname+"</td>"
					  +"<td  id='nreflg_row"+srno+"'>"+b[i].nreflg+"</td>"
					  +"<td  id='countrcode_row"+srno+"'>"+b[i].countrcode+"</td>"
					  +"<td  id='uniqidenti_row"+srno+"'>"+b[i].uniqidenti+"</td>"
					  +"<td  id='detisiccode_row"+srno+"'>"+b[i].detisiccode+"</td>"
					  +"<td  id='groupcode_row"+srno+"'>"+b[i].groupcode+"</td>"
					  +"<td class='sumder alnum' id='outstandamt_row"+srno+"'>"+b[i].outstandamt+"</td>"
					  +"<td class='sumder alnum' id='outstandnfbamt_row"+srno+"'>"+b[i].outstandnfbamt+"</td>"
					  +"<td  id='purpose_row"+srno+"'>"+b[i].purpose+"</td>"
					  +"<td  id='natofcre_row"+srno+"'>"+b[i].natofcre+"</td>"
					  +"<td  id='reportdate_row"+srno+"'>"+b[i].reportdate+"</td>"
					 
					
							 		  
							 		  
								 
	                    
	                     
	                     
                      
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
		//For summary section
		
		
$(".summ").addClass("clr");
		$("#divLoading").addClass('show');
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
				
				  
				 $(".repdisp").val(refno);
			
					
						$("#sec1 tr").children().detach().remove();
						 /* Loading values in Summary  section 1 */
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "psc0200sec1",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								var k=1;
								var cnt1=1;
								  $("#sec1 tr").remove();
								  
									
									 $("#pymdets tr").hide();
									
										$("#pymdets").hide();
										$("#tbcate").hide();
								
								var b=JSON.parse(res.sec1PSC0200);
								 console.log(b);
								
                                 
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec1").append("<tr>"
									 				  
									 		 +" <td id='isicsrlno_row"+cnt1+"'>"+b[i].isicsrlno+"</td>"
									 		 +"<td id='isicnameofcustm_row"+cnt1+"'>"+b[i].isicnameofcustm+"</td>"
									 		 +"<td id='isicresidetstatus_row"+cnt1+"'>"+b[i].isicresidetstatus+"</td>"
									 		 +"<td id='isiccountrofresid_row"+cnt1+"'>"+b[i].isiccountrofresid+"</td>"
									 		 +"<td id='isicuniqidenti_row"+cnt1+"'>"+b[i].isicuniqidenti+"</td>"
									 		+" <td id='isiccode_row"+cnt1+"'>"+b[i].isiccode+"</td>"
									 		+"  <td id='isicaccno_row"+cnt1+"'>"+b[i].isicaccno+"</td>"
									 		+" <td id='isicgroupappli_row"+cnt1+"'>"+b[i].isicgroupappli+"</td>"
									 		+" <td class='sumder alnum' id='isicoutstfunbasfaci_row"+cnt1+"'>"+b[i].isicoutstfunbasfaci+"</td>"
									 		+" <td class='sumder alnum' id='isicoutstnonfunbasfaci_row"+cnt1+"'>"+b[i].isicoutstnonfunbasfaci+"</td>"
									 		
									 		  
									 		  
									 		+"<td style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads("+cnt1+") id='edit"+cnt1+"'></td>"	
						                    
						                     
						                      
						                    +"</tr>" ) ; 	
									
									 		 cnt1++; 
											
												}
											
									 	
										
									
									}
									

						});   	
						
						/* Loading values in Summary  section 2 */
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "psc0200sec2",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								 var k=1;
									var cnt1=1;
									
								  $("#sec2 tr").remove();
								  
								
								
								var b=JSON.parse(res.sec1PSC0200s2);
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec2").append("<tr>"
									 				  
									 				 +" <td id='houssrlno_row"+cnt1+"'>"+b[i].houssrlno+"</td>"
											 		 +"<td id='housnameofcustm_row"+cnt1+"'>"+b[i].housnameofcustm+"</td>"
											 		 +"<td id='housresidetstatus_row"+cnt1+"'>"+b[i].housresidetstatus+"</td>"
											 		 +"<td id='houscountrofresid_row"+cnt1+"'>"+b[i].houscountrofresid+"</td>"
											 		 +"<td id='housuniqidenti_row"+cnt1+"'>"+b[i].housuniqidenti+"</td>"
											 		 
											 		 +" <td id='houspurpose_row"+cnt1+"'>"+b[i].houspurpose+"</td>"
											 		 +"<td id='housaccno_row"+cnt1+"'>"+b[i].housaccno+"</td>"
											 		 +"<td class='sumder alnum'id='housoutstfunbasfaci_row"+cnt1+"'>"+b[i].housoutstfunbasfaci+"</td>"
											 		 +"<td class='sumder alnum' id='housoutstnonfunbasfaci_row"+cnt1+"'>"+b[i].housoutstnonfunbasfaci+"</td>"
											 		
									 		  
											 		+"<td style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads("+cnt1+") id='edit"+cnt1+"'></td>"	
								                    
        						                     
								                      
								                    +"</tr>" ) ; 	
									 		 cnt1++;
											
												}
										
									
							}
						

						});   
						/* Loading values in Summary  section 3 */
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "psc0200sec3",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
								var k=1;
								var cnt1=1;
								
								  $("#sec3 tr").remove();
								 
								$("#pymdets tr").hide();
								$("#pymdets").hide();
								$("#tbcate").hide();
								var b=JSON.parse(res.sec1PSC0200s3);
								 console.log(b);
								
									//alert("res.sec1PSC0200s3"+res.sec1PSC0200s3);
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec3").append("<tr>"
									 				  
									 				  
									 				 +" <td id='nfcsrlno_row"+cnt1+"'>"+b[i].nfcsrlno+"</td>"
											 		 +"<td id='nfcnameofcustm_row"+cnt1+"'>"+b[i].nfcnameofcustm+"</td>"
											 		 +"<td id='nfcresidetstatus_row"+cnt1+"'>"+b[i].nfcresidetstatus+"</td>"
											 		 +"<td id='nfccountrofresid_row"+cnt1+"'>"+b[i].nfccountrofresid+"</td>"
											 		 +"<td id='nfcuniqidenti_row"+cnt1+"'>"+b[i].nfcuniqidenti+"</td>"

											 		 +" <td id='nfcinstitusect_row"+cnt1+"'>"+b[i].nfcinstitusect+"</td>"
											 		 +"<td id='nfcgroupappli_row"+cnt1+"'>"+b[i].nfcgroupappli+"</td>"
											 		 +"<td class='sumder alnum' id='nfcoutstfunbasfaci_row"+cnt1+"'>"+b[i].nfcoutstfunbasfaci+"</td>"
											 		 +"<td class='sumder alnum' id='nfcoutstnonfunbasfaci_row"+cnt1+"'>"+b[i].nfcoutstnonfunbasfaci+"</td>"
											 		
									 		  
									 		  
											 		+"<td style='text-align:center'><input type=radio style=width: 15px; onclick=fnloads("+cnt1+") id='edit"+cnt1+"'></td>"	
								                    
        						                     
								                      
								                    +"</tr>" ) ; 	
									 		 cnt1++;
											
												}
											
									 
									}
									

						});   
						
						  
							
							
					}
	 /* Hide & show of GEN Xml button */
	 var datasum={
				"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>'
		};
	$.ajax({
			url:"savecheckpsc0200",
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
	 
function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_PSC0200_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>
<%-- <script>
$(document).ready(function(){
	
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');

	
});   
</script> --%>

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
	 $( '#btnback').click(function() {
		 location.href="XBRL_CRT_PSC0200_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
		
		});
		
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
	$(window).load(function() {
		 
	    $(".loader").fadeOut("slow");
	});
	
	

	
});	

</script>




<script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});


</script>
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
	if(b==0 ||b==8 || b==9 || b==12){
		
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
	 $("#btnXML").hide();
	 $("#btnSave").hide();
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

else if(a==3){
	 $("#btnXML").show();
	 $("#btnSave").show();
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
		
		location.href = "XBRL_REP_PSC0200_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	
	$("#addrowno").val("0");
 	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>'); 

	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_PSC0200_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	
	
	$('#btnExcel').click(function() {
		
		 PSC0200Form.action = "PSC0200EXCELREPORT.action?method=PSC0200EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 PSC0200Form.submit();

		 
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 PSC0200Form.action = "PSC0200EXCELSum.action?method=PSC0200EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 PSC0200Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 PSC0200Form.action = "PSC0200PDFREPORT.action?method=PSC0200PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 PSC0200Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  PSC0200Form.action = "XMLDOWNLOAD.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 PSC0200Form.submit(); 
	});
	
	

	
	$("#btnfilter").on("click",function(){
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
			$('#accno,#custid,#custname,#nreflg,#cntrycode,#uqid,#isiccode,#grpcode,#outamt,#outnfamt,#prpse,#natofcre,#repdate').css({
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
			$(".form-control2").prop("disabled",true);
			
			$('#accno,#custid,#custname,#nreflg,#cntrycode,#uqid,#isiccode,#grpcode,#outamt,#outnfamt,#prpse,#natofcre,#repdate').css({
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
			  
				 table = document.getElementById("det1");
				 tr = table.getElementsByTagName("tr");
				 for (i = 0; i < tr.length; i++) {
					 
						 
						 tr[i].style.display = ""; 
						 
				 
					 
				 }
		}
		
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
	 					url:"saveSumPSC0200",
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
	 				   		url:"saveSumPSC0200",
	 						data:datasum,
	 								dataType:'json',
	 								type:'POST',
	 								async:true,
	 								success:function(res){
	 									alert("gfg");
	 									$("#divLoading").removeClass('show');
	 									alert("Saved Successfully");
	 									
	 									 $('#btnSave').css({
	 										
	 										'background-color': 'rgba(51, 122, 183, 1)',
	 										
	 										'color':'white'
	 										
	 										}); 
	 							 
	 								}
	 							});  
	 				        			        
	 				  
	 				      },
	 				      Cancel: function() {
	 				          $( this ).dialog( "close" );
	 				          
	 				         alert("Cancelled Successfully");
								 $('#btnSave').css({
									
									'background-color': 'rgba(51, 122, 183, 1)',
									
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
		$("#det1").prepend("<tr id='pscadd"+rowno+"'><td id='accno_row"+rowno+"'><input type='text' id='accno_text"+rowno+"' style='width: 66px;'></td><td id='custid_row"+rowno+"'><input type='text'  id='custid_text"+rowno+"' style='    width:60px;'></td><td id='custname_row"+rowno+"'><input type='text' id='custname_text"+rowno+"' style='     width:264px;'></td><td id='nreflg_row"+rowno+"'><input type='text' 	id='nreflg_text"+rowno+"' style='    width: 48px;'></td><td id='countrcode_row"+rowno+"'><input type='text' id='countrcode_text"+rowno+"' style='    width: 56px;'></td><td id='uniqidenti_row"+rowno+"' class='sumder alnum'><input type='text'  id='uniqidenti_text"+rowno+"'  class='decimalPt roundUp'  style='    width: 80px;'></td><td id='detisiccode_row"+rowno+"' class='sumder alnum'><input type='text'  id='detisiccode_text"+rowno+"'  class='decimalPt roundUp'  style='    width:55px;'></td><td id='groupcode_row"+rowno+"'><input type='text' id='groupcode_text"+rowno+"' style='width:62px;'></td><td id='outstandamt_row"+rowno+"'><input type='text' id='outstandamt_text"+rowno+"' style='width: 100px;'></td><td id='outstandnfbamt_row"+rowno+"'><input type='text' id='outstandnfbamt_text"+rowno+"' style='width: 100px;'></td><td id='purpose_row"+rowno+"'><input type='text' id='purpose_text"+rowno+"' style='width:74px;'></td><td id='natofcre_row"+rowno+"'><input type='text' id='natofcre_text"+rowno+"' style='width:69px;'></td><td id='reportdate_row"+rowno+"'><input type='text' id='reportdate_text"+rowno+"' style='width: 100px;'></td><td style='text-align:center;'><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')>  <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px;display:inline-block; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");


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
			}); });

	
		
		
		
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

 	var	outstandamt =  document.getElementById("outstandamt_row"+no);
 	 var	outstandamt_data = outstandamt.innerHTML;

 	 var	outstandnfbamt =  document.getElementById("outstandnfbamt_row"+no);
 	 var	outstandnfbamt_data = outstandnfbamt.innerHTML;
 	 
 	 

 	 outstandamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='outstandamt_text"+no+"'  style='width: 83px'; value='"+outstandamt_data+"'>";
 	 outstandnfbamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='outstandnfbamt_text"+no+"'  style='width: 83px'; value='"+outstandnfbamt_data+"'>";


 	 
 	 
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
		
		
		if(document.getElementById("outstandamt_text"+no).value==""){
			alert("Enter Outstanding FundBased Amount..");
			error="Y"
		}else if(document.getElementById("outstandnfbamt_text"+no).value==""){
			alert("Enter Outstanding NonFundBased Amount ..");	
			error="Y"
		}
		
	} else if (modtyp=="A") {
		
		


		if(document.getElementById("accno_text"+no).value==""){
			alert("Enter Account Number ..");
			error="Y"
		}else if(document.getElementById("custid_text"+no).value==""){
			alert("Enter Customer Id ..");	
			error="Y"
		}else if(document.getElementById("custname_text"+no).value==""){
			alert("Ente Customer Name ..");
			error="Y"
		}else if(document.getElementById("nreflg_text"+no).value==""){
			alert("Enter NRE Flag ..");
			error="Y"
		}else if(document.getElementById("countrcode_text"+no).value==""){
			alert("Enter Country Code ..");
			error="Y"
		}else if(document.getElementById("uniqidenti_text"+no).value==""){
			alert("Enter Unique Identifier ..");	
			error="Y"
		}else if(document.getElementById("detisiccode_text"+no).value==""){
			alert("Enter ISIC Code..");
			error="Y"
		}else if(document.getElementById("groupcode_text"+no).value==""){
			alert("Enter Group Code..");
			error="Y"
		}else if(document.getElementById("outstandamt_text"+no).value==""){
			alert("Enter Outstanding FundBased Amount..");
			error="Y"
		}else if(document.getElementById("outstandnfbamt_text"+no).value==""){
			alert("Enter Outstanding NonFundBased Amount ..");	
			error="Y"
		}else if(document.getElementById("purpose_text"+no).value==""){
			alert("Enter Purpose Of Credit ..");	
			error="Y"
		}else if(document.getElementById("natofcre_text"+no).value==""){
			alert("Enter Nature of Customer ..");	
			error="Y"
		}else if(document.getElementById("reportdate_text"+no).value==""){
			alert("Enter Report Date ..");	
			error="Y"
		}
	}
	
	
	
	if (error=="N"){
	
	$("#modflg").val("Y");
	modtyp="M";
	document.getElementById("edit_button"+no).checked = false;

	  

	var outstandamt_val=document.getElementById("outstandamt_text"+no).value;

	document.getElementById("outstandamt_row"+no).innerHTML=outstandamt_val;

	var outstandnfbamt_val=document.getElementById("outstandnfbamt_text"+no).value;
	document.getElementById("outstandnfbamt_row"+no).innerHTML=outstandnfbamt_val;

	if($("#addrowno").val()=="1"  ){
		modtyp="A";
		var  accno_val=document.getElementById("accno_text"+no).value;	 
		document.getElementById("accno_row"+no).innerHTML=accno_val;

		   var custid_val=document.getElementById("custid_text"+no).value;
		   document.getElementById("custid_row"+no).innerHTML=custid_val;
		   
		  var custname_val=document.getElementById("custname_text"+no).value;
		   document.getElementById("custname_row"+no).innerHTML=custname_val;

		   var nreflg_val=document.getElementById("nreflg_text"+no).value;
			document.getElementById("nreflg_row"+no).innerHTML=nreflg_val;
			
		  
		  var countrcode_val=document.getElementById("countrcode_text"+no).value;	
		  document.getElementById("countrcode_row"+no).innerHTML=countrcode_val;
		 
		  var  uniqidenti_val=document.getElementById("uniqidenti_text"+no).value;	 
		  document.getElementById("uniqidenti_row"+no).innerHTML=uniqidenti_val;
		  
		  var  detisiccode_val=document.getElementById("detisiccode_text"+no).value;	 
		  document.getElementById("detisiccode_row"+no).innerHTML=detisiccode_val;
		  
		  var  groupcode_val=document.getElementById("groupcode_text"+no).value;	 
		  document.getElementById("groupcode_row"+no).innerHTML=groupcode_val;
		  
		  var  purpose_val=document.getElementById("purpose_text"+no).value;	 
		  document.getElementById("purpose_row"+no).innerHTML=purpose_val;
		  
		  var  natofcre_val=document.getElementById("natofcre_text"+no).value;	 
		  document.getElementById("natofcre_row"+no).innerHTML=natofcre_val;
		  
		  var  reportdate_val=document.getElementById("reportdate_text"+no).value;	 
		  document.getElementById("reportdate_row"+no).innerHTML=reportdate_val;
		  
	
	}else{
		document.getElementById("Cancel_button"+no).style.display="inline-block";
		document.getElementById("Cancel_btn"+no).style.display="none";
	}
	
	document.getElementById("edit_button"+no).style.display="inline-block";
	document.getElementById("save_button"+no).style.display="none";
	
	var accno=document.getElementById("accno_row"+no).innerHTML;	 
	   var custid=document.getElementById("custid_row"+no).innerHTML;
	  var custname=document.getElementById("custname_row"+no).innerHTML;
	  var nreflg=document.getElementById("nreflg_row"+no).innerHTML;
	  var countrcode=document.getElementById("countrcode_row"+no).innerHTML;
	  var uniqidenti=document.getElementById("uniqidenti_row"+no).innerHTML;	
	  var detisiccode=document.getElementById("detisiccode_row"+no).innerHTML;	 
	  var groupcode=document.getElementById("groupcode_row"+no).innerHTML;
	  var outstandamt=document.getElementById("outstandamt_row"+no).innerHTML;	 
	  var outstandnfbamt=document.getElementById("outstandnfbamt_row"+no).innerHTML;
	  var purpose=document.getElementById("purpose_row"+no).innerHTML;	 
	  var natofcre=document.getElementById("natofcre_row"+no).innerHTML;
	  var reportdate=document.getElementById("reportdate_row"+no).innerHTML;	 

	  $("#pscadd"+no).addClass("rowaddedd");
	 //$("#pymdets1 td").attr("padding","8px");
	 var refePSC200=document.getElementById("refDisplay").value;
		outstandamt=outstandamt.replace(/\,/g,'');
    	outstandamt=Number(outstandamt);

    	outstandnfbamt=outstandnfbamt.replace(/\,/g,'');
    	outstandnfbamt=Number(outstandnfbamt);
    	
    	var rptdate1 = {
   		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refePSC200, "accno":accno,"custid":custid,"custname" : custname,"nreflg":nreflg, "countrcode":countrcode,"uniqidenti":uniqidenti,"detisiccode":detisiccode,"groupcode":groupcode,"outstandamt":outstandamt, "outstandnfbamt":outstandnfbamt,"purpose":purpose,"natofcre":natofcre,"reportdate":reportdate,"modtyp":modtyp
   		}; 

	 
	 $.ajax({
	     url : "PSC0200",
	     data : rptdate1  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 console.log(res.refno);
				
				
				
				 $("#refDisplay").val(res.refno);
				
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
	     	   var custid=document.getElementById("custid_row"+no).innerHTML;
	     	  var custname=document.getElementById("custname_row"+no).innerHTML;
	     	  var nreflg=document.getElementById("nreflg_row"+no).innerHTML;
	     	  var countrcode=document.getElementById("countrcode_row"+no).innerHTML;
	     	  var uniqidenti=document.getElementById("uniqidenti_row"+no).innerHTML;	
	     	  var detisiccode=document.getElementById("detisiccode_row"+no).innerHTML;	 
	     	  var groupcode=document.getElementById("groupcode_row"+no).innerHTML;
	     	  var outstandamt=document.getElementById("outstandamt_row"+no).innerHTML;	 
	     	  var outstandnfbamt=document.getElementById("outstandnfbamt_row"+no).innerHTML;
	     	  var purpose=document.getElementById("purpose_row"+no).innerHTML;	 
	     	  var natofcre=document.getElementById("natofcre_row"+no).innerHTML;
	     	  var reportdate=document.getElementById("reportdate_row"+no).innerHTML;	 
	       	
	     	 var refePSC200=document.getElementById("refDisplay").value;
	        	outstandamt=outstandamt.replace(/\,/g,'');
	        	outstandamt=Number(outstandamt);

	        	outstandnfbamt=outstandnfbamt.replace(/\,/g,'');
	        	outstandnfbamt=Number(outstandnfbamt);
	        	var rptdate1 = {
	          		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refePSC200, "accno":accno,"custid":custid,"custname" : custname,"nreflg":nreflg, "countrcode":countrcode,"uniqidenti":uniqidenti,"detisiccode":detisiccode,"groupcode":groupcode,"outstandamt":outstandamt, "outstandnfbamt":outstandnfbamt,"purpose":purpose,"natofcre":natofcre,"reportdate":reportdate,"modtyp":modtyp
	   			}; 
	        	
	        	 $.ajax({
	        	     url : "PSC0200",
	        	     data : rptdate1  ,
	        			dataType : 'json', 
	        			type : 'POST',
	        			async : true,
	        			 success : function(res) {
	        				 console.log(res.refno);
	        				//	alert("refeDCG100"+refeDCG100);
	        				
	        				// alert("sfsdf");
	        				 $("#refDisplay").val(res.refno);
	        				 $("#msg").html("Record Saved successfully");
			  
	        				 $("#pscadd"+no).closest("tr").remove();

			   
	        				
	        			}
	        		});
	        	
	        	 $( this ).dialog( "close" );	        
	  
	      },
	      Cancel: function() {
	          $( this ).dialog( "close" );
	          $("#msg").html("Cancellation successful");
	        }
	      }
	  

	      
	    });
	
}

function Cancel_row(no){
 /*  document.getElementById("del_button"+no).style.display="inline-block"; */
 
var detcancel={
			"custid":$("#custid_row"+no).text(),"accno":$("#accno_row"+no).text(),"date":$("#reportdate_row"+no).text()
	};
	
	 $.ajax({
	     url : "PSC0200cancel",
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

	var outstandamt_val=document.getElementById("outstandamt_text"+no).value;

	document.getElementById("outstandamt_row"+no).innerHTML=outstandamt_val;

	var outstandnfbamt_val=document.getElementById("outstandnfbamt_text"+no).value;
	document.getElementById("outstandnfbamt_row"+no).innerHTML=outstandnfbamt_val;
	
		$("#edit_button"+no).show();
		/* document.getElementById("edit_button"+no).style.display="block"; */
		document.getElementById("save_button"+no).style.display="none";
		document.getElementById("Cancel_btn"+no).style.display="none";
		 location.reload(true);
		 
		  var outstandamt=document.getElementById("outstandamt_row"+no).innerHTML;
		  var outstandnfbamt=document.getElementById("outstandnfbamt_row"+no).innerHTML;
		  
		  if($("#pscadd"+no).hasClass( "rowaddedd" )){
			  
			  document.getElementById("Cancel_button"+no).style.display="inline-block";


		  }else{
			  document.getElementById("Cancel_button"+no).style.display="none";
		  }
		  
		
 }

 
 function Canadd_row(no){
	 
	  /* document.getElementById("del_button"+no).style.display="inline-block"; */

																   

	 if($("#pscadd"+no).hasClass( "rowaddedd" )){
		
		var detcancel={
				"custid":$("#custid_row"+no).text(),"accno":$("#accno_row"+no).text(),"date":$("#reportdate_row"+no).text()
		};
		

		 $.ajax({
		     url : "PSC0200cancel",
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
	 $("#pscadd"+no).remove();
	 
 }
</script> 







<SCRIPT>

function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_PSC0200_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>

<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="PSC0200Form"
		enctype="multipart/form-data">
		
		
		<input type="hidden" id="fnloadval">
		<input type="hidden" id="savecheck">
		 <input type="hidden" id="modflg">
		 <input type="hidden" id="modtyp">
		 <input type="hidden"  value="1" id="rownoadd">
             	<div class="tab-content" >
	 	<div class="active"  id="tab2" style="width: 1000px;padding-top: 1px;margin-top: -17px;" >
	 	<div   id="tab2"  style="text-align:left;margin-top: 40px;"><font size="2" style="font-size: 15px;" ><b>PSC0200-Breakdown of Credit<b id="sub"
					Style="display: none"></b></b></font>
			</div>  
	
		<ul class="nav nav-tabs navright"  id="mytab" style="width: 100%;">

						
             <li class=" pull-right list" onclick="functionli(3);"><a href="#btntab3" data-toggle="tab"><span
							class="headingtab">3</span></a></li>
					<li class=" pull-right list" onclick="functionli(2);"><a href="#btntab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>	
							
						<li class=" pull-right list active" onclick="functionli(1);"><a href="#btntab1" data-toggle="tab"><span
							class="headingtab">1</span></a></li>	
								
					

				</ul>
				 
					<table class=""  id="mytab" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <!-- <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font> -->
			 <font size="1"><input type="hidden"style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></input></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
			
            <table class="table" id="tb1" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="14" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>Break down of credit by ISIC	</b>  </td></tr>
           
           
         			  <!-- --------- START  SEC1-------- -->
           
           
            <tr>
						<th rowspan="3"  style="width:50px;">Sr.No.</th>
						
				

						
						<th colspan="1" style="width:250px;">Name of Customer
						
						</th>
						
						
						<th colspan="1" style="width:80px;">Residential Status
						
						</th>
						
						<th colspan="1" style="width:70px;">Country of residence
						
						</th>
						<th colspan="1" style="width:50px;">Unique identifier
						
						</th>
						
						<th colspan="1" style="width:150px;">ISIC Code
						
						</th>
							
							
						<th colspan="1" style="width:100px;">Account number

						
						</th>
						
						<th colspan="1	" style="width:100px;">Group (where applicable)
						
						</th>
						
						<th colspan="1" style="width:100px;">Outstanding fund-based facilities (>Rs1.0 mn)		
						
						
						</th>
						
						<th colspan="1" style="width:100;px">Outstanding non-fund based Facilities (>Rs1.0 mn)
						</th>
						
						
						<th rowspan="2" id="rad">Select</th>
						
						<tr>
						
						
						<th >A
						
						
						</th>
						
						
						<th >B
						
						</th>
						
						<th >C
						
						</th>
						<th >D
						
						</th>
						
						<th >E
						
						</th>
						<th >F
						
						
						</th>
						
						
						<th >G
						
						</th>
						
						<th >H
						
						</th>
						
						<th >I
						
						</th>
						</tr>
						
						<!-- --------- END OF SEC1-------- -->
						
						
						
        
          <tbody class="databody" id="sec1"></tbody>
          
          </table>
				
		
				
				   <table class="table" id="tb2" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="14" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>Break down of credit for household	</b>  </td></tr>
            
            
            
            
            <!-- --------- START SEC2-------- -->
           
           
            <tr>
						<th rowspan="3"  style="width:50px;">Sr.No.</th>
						
				

						
						<th colspan="1" style="width:250px;">Name of Customer
						
						</th>
						
						
						<th colspan="1" style="width:80px;">Residential Status
						
						</th>
						
						<th colspan="1" style="width:70px;">Country of residence
						
						</th>
						<th colspan="1" style="width:50px;">Unique identifier
						
						</th>
						
						<th colspan="1" style="width:150px;">Purpose
						
						</th>
							
							
						<th colspan="1" style="width:100px;">Account number

						
						</th>
						
						<th colspan="1	" style="width:100px;">Outstanding Fund-based facilities (>Rs1.0 mn)
						
						</th>
						
						<th colspan="1" style="width:100px;">Outstanding Non-fund based facilities (>Rs1.0 mn)		
						
						
						</th>
						
						<th rowspan="2" id="rad">Select</th>	
						
				<tr>
						
						
						<th >J
						
						
						</th>
						
						
						<th >K
						
						</th>
						
						<th >L
						
						</th>
						<th >M
						
						</th>
						
						<th >N
						
						</th>
						<th >O
						
						
						</th>
						
						
						<th >P
						
						</th>
						
						<th >Q
						
						</th>
				</tr>
						
						<!-- ---------   END OF SEC2-------- -->
						
						
            
        		
          
          
           <tbody class="databody" id="sec2"></tbody>
          
          
          </table>
				
		
				   <table class="table" id="tb3" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="15" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b> Break down of credit other than non-financial corporation and household </b>  </td></tr>
            
            
                    <!-- --------- START SEC3-------- -->
           
           
            <tr>
						<th rowspan="3"  style="width:50px;">Sr.No.</th>
						
				

						
						<th colspan="1" style="width:250px;">Name of Customer
						
						</th>
						
						
						<th colspan="1" style="width:80px;">Residential Status
						
						</th>
						
						<th colspan="1" style="width:70px;">Country of residence
						
						</th>
						<th colspan="1" style="width:50px;">Unique identifier
						
						</th>
						
						<th colspan="1" style="width:150px;">Institutional sectors
						
						</th>
							
							
						<th colspan="1" style="width:100px;">Group (where applicable)

						
						</th>
						
						<th colspan="1	" style="width:100px;">Outstanding fund-based Facilities (>Rs1.0 mn)
						
						</th>
						
						<th colspan="1" style="width:100px;">Outstanding Non-fund based facilities (>Rs1.0 mn)	
						
						
						</th>
						
						<th rowspan="2" id="rad">Select</th>	
						
				<tr>
						
						
						<th >R
						
						
						</th>
						
						
						<th >S
						
						</th>
						
						<th >T
						
						</th>
						<th >U
						
						</th>
						
						<th >V
						
						</th>
						<th >W
						
						
						</th>
						
						
						<th >X
						
						</th>
						
						<th >Y
						
						</th>
						
						
						
					</tr>
						
						<!-- ---------   END OF SEC3-------- -->
          
						
             <tbody class="databody" id="sec3"></tbody>
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
			<div class="active" id="tab1" style="width: 1487px;padding-top: 1px;margin-top: -17px;" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 15px;" ><b>PSC0200-Breakdown of Credit
			
			<b id="sub"
					Style="display: none"></b></b></font>
			</div><br>
			<div id="divLoading"> 
			
    </div>
    
    
          <table class="" style="width:1487px;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> <!-- <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font> -->
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></input></font></td><td style="text-align:center;background-color: #bbc3cb;width: 325px;"></td><td style="background-color: #bbc3cb;text-align: right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a>
    
    <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a>
    </td> </tr>
          		  
	  
          		  </table> 
       
                                
           <div class="panel panel-primary filterable">
            <table class="table" id="detb1" border="1" style="width:100%;   margin-top: -20px;">
            
             <thead>
					 <tr id="fss" class="filters">
					 
						
						<!-- <th id="chalpha">Cheque Alpha</th>					 -->						
						<th style="text-align:center;width: 66px;"><textarea type="text"  onkeyup="myFunction(this.id,0)" class="form-control2" id="accno" style="text-align:center;width:66px;" placeholder="Account Number" disabled></textarea> </th>				
						<th style="text-align:center;width: 60px;"><textarea type="text" onkeyup="myFunction(this.id,1)" class="form-control2" id="custid" style="width: 60px;" placeholder="Customer Id" disabled></textarea></th>
						<th style="text-align:center;width: 264px;"><textarea type="text" onkeyup="myFunction(this.id,2)" class="form-control2" id="custname" style="width: 264px;" placeholder="Customer Name" disabled></textarea></th>
						<th style="text-align:center;width: 48px;"><textarea type="text"  onkeyup="myFunction(this.id,3)" class="form-control2" id="nreflg"  style="width: 48px;" placeholder="NRE Flag" disabled></textarea></th>
						<th style="text-align:center;width: 56px;"><textarea type="text" onkeyup="myFunction(this.id,4)" class="form-control2" id="countrcode" style="width: 56px;" placeholder="Country Code" disabled></textarea></th>
						<th style="text-align:center;width: 80px;"><textarea type="text" onkeyup="myFunction(this.id,5)" class="form-control2" id="uniqidenti" style="width:80px;" placeholder="Unique Identifier" disabled></textarea></th>
						<th style="text-align:center;width:55px;"><textarea type="text" onkeyup="myFunction(this.id,6)" class="form-control2" id="detisiccode" style="width: 55px;" placeholder="ISIC Code" disabled></textarea></th>						
						<th style="text-align:center;width: 62px;"><textarea type="text" onkeyup="myFunction(this.id,7)" class="form-control2" id="groupcode" style="width: 62px;"placeholder="Group Code" disabled></textarea></th>
						<th style="text-align:center;width: 100px;"><textarea type="text" onkeyup="myFunction(this.id,8)" class="form-control2" id="outstandamt" style="width:100px;" placeholder="Outstanding  FundBased Amount" disabled></textarea></th>
						<th style="text-align:center;width: 100px;"><textarea type="text" onkeyup="myFunction(this.id,9)" class="form-control2" id="outstandnfbamt" style="width: 100px;" placeholder="OutStanding NonFundBased Amount" disabled></textarea></th>
						<th style="text-align:center;width: 74px;"><textarea type="text" onkeyup="myFunction(this.id,10)" class="form-control2" id="purpose" style="width:74px;" placeholder="Purpose of Credit" disabled></textarea></th>
						<th style="text-align:center;width: 69px;"><textarea type="text" onkeyup="myFunction(this.id,11)" class="form-control2" id="natofcre"   style="width: 69px;" placeholder="Nature Of Customer" disabled></textarea></th>
						<th style="text-align:center;width: 100px;"><textarea type="text" onkeyup="myFunction(this.id,12)" class="form-control2" id="reportdate" style="width:100px;" placeholder="Report Date" disabled></textarea></th>
						
						
						<th style="text-align:center;" id="modify">Modify</th>
						
					</tr>
					
				</thead>
					
					<tbody class="databody" id="det1">


              </tbody>
              
     
				</table>
				</div>
			
				
			  

            
             
          <div class="modal-footer">
               
                 <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
           
                <!-- <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button> -->
                 
                <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button>
            </div>
          
        
         </div> 
        
				
				
          
  
    </div>
    
    
    
       <!-- -------------------------------dialog box start---------------------->
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

<!-- -------------------------------dialog box end ---------------------->
    
     </form>
    
    
</div>


</body>
</html>