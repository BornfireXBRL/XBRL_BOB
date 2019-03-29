<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLFIM0100Bean,dao.XBRLFIM0100Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
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


/* 
tr:hover td{
    background: #bebfb0 !important;
}

 */
 
 
 
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
	url:"CRR0100chckmodified",
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
			        	location.href = "XBRL_CRT_CRR0100_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
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
	
		var save=0;
		$("#btnXML").hide();
		 $("#btnSave").hide();
		 
		
	 if(z=="load"){
		
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
		
		 $(".repdisp").val(refno);
		
		
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
		 
			$.ajax({
				url : "CRR0100details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#det1 tr").remove();
					 
					
					var b=JSON.parse(res.detCRR0100);
					 console.log(b);
					
			
						 	if(f=="onload"){
						 		$("#detb1").show();
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#det1").append(
						 				  "<tr id='crradd"+srno+"'>"

				                   	  +"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
				                      +"<td id='accname_row"+srno+"' >"+b[i].accnam+"</td>"
				                      +"<td  id='cusid_row"+srno+"' >"+b[i].cusid+"</td>"
				                      +"<td class='sumder alnum' id='accbalamtac_row"+srno+"' >"+b[i].accbalamtac+"</td>"
				                      +"<td class='sumder alnum' id='accrcode_row"+srno+"' >"+b[i].accrcode+"</td>"
				                      +"<td class='sumder alnum' id='natofcus_row"+srno+"'>"+b[i].natofcus+"</td>"
				                      +"<td class='sumder alnum' id='reportdate_row"+srno+"' >"+b[i].reportdate+"</td>"
				                      
				                      
				                    
									  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
				                     
				                      
				                    +"</tr>" ) ; 
						 		  
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		
						 
						 		$(".add").hide();//add button hide
						 		$("#detb1").show();
						 		$("#modify").hide();//modify in the header hide
						 
						 		for(var i=0;i<b.length;i++){
						 		
						 			$("#det1").append(
						 					 "<tr id='crradd"+srno+"'>"
						 		  +"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
				                      +"<td id='accname_row"+srno+"' >"+b[i].accnam+"</td>"
				                      +"<td  id='cusid_row"+srno+"' >"+b[i].cusid+"</td>"
				                      +"<td class='sumder alnum' id='accbalamtac_row"+srno+"' >"+b[i].accbalamtac+"</td>"
				                      +"<td class='sumder alnum' id='accrcode_row"+srno+"' >"+b[i].accrcode+"</td>"
				                      +"<td class='sumder alnum' id='natofcus_row"+srno+"'>"+b[i].natofcus+"</td>"
				                      +"<td class='sumder alnum' id='reportdate_row"+srno+"' >"+b[i].reportdate+"</td>"
				                      
						 			
						 			+"</tr>") ;  
							 		  
								
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
$("#tb1").show();
		
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
				 
					var cnt=1;
				
						$("#sec1 tr").children().detach().remove();
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
				
						
						
						
						$.ajax({
							url : "CRR0100sec1",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							//	alert("refePYM100"+refePYM100);
								
								  $("#sec1 tr").remove();
								
								  var b=JSON.parse(res.sec1CRR0100);
								 console.log(b);
						
								
                                 
								 //alert(sec1CRR0100);
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 			
								 				var c=1;
								 				
									 			
									 			if(b[i].secid=="SEC1")
									 			{
									 				c=1;
									 				$("#fnloadval").val(c);
									 		  $("#sec1").append("<tr>"
									 				  
									 				
									 				 +"<td id='isicinstname_row"+cnt+"'>"+b[i].slno+"</td>"
								                      +"<td id='isicinstcode_row"+cnt+"' >"+b[i].repday+"</td>"
								                    
								                      +"<td  id='isicforebilpuranddisc_row"+cnt+"' >"+b[i].repdateval+"</td>"
								                      +"<td  class='sumder alnum' id='isicinveincorshare_row"+cnt+"' >"+b[i].mur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvesindebentu_row"+cnt+"' >"+b[i].eur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvescorpbond_row"+cnt+"'>"+b[i].gbp+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvsothedebsecur_row"+cnt+"' >"+b[i].usd+"</td>"
								                      +"<td  class='sumder alnum' id='isicoverdraftoutsidmur_row"+cnt+"' >"+b[i].others+"</td>"
								                      
								                     
									 		  
									 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads('"+b[i].secid+"+"+b[i].slno+"') id='edit"+cnt+"'></td></tr>") ;  
									 		  
									 		 cnt++;
									 			}
									 			
									 			
									 			if(b[i].secid=="SEC2")
									 			{
									 				
									 				c=2;
									 				$("#fnloadval").val(c);
									 		  $("#sec2").append("<tr>"
									 				  
									 				
									 				 +"<td id='isicinstname_row"+cnt+"'>"+b[i].slno+"</td>"
								                      +"<td id='isicinstcode_row"+cnt+"' >"+b[i].repday+"</td>"
								                    //  +"<td id='srno_row"+srno+"'>"+srno+"</td>"
								                      +"<td  id='isicforebilpuranddisc_row"+cnt+"' >"+b[i].repdateval+"</td>"
								                      +"<td  class='sumder alnum' id='isicinveincorshare_row"+cnt+"' >"+b[i].mur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvesindebentu_row"+cnt+"' >"+b[i].eur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvescorpbond_row"+cnt+"'>"+b[i].gbp+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvsothedebsecur_row"+cnt+"' >"+b[i].usd+"</td>"
								                      +"<td  class='sumder alnum' id='isicoverdraftoutsidmur_row"+cnt+"' >"+b[i].others+"</td>"
								                      
								                     
									 		  
									 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads('"+b[i].secid+"+"+b[i].slno+"') id='edit"+cnt+"'></td></tr>") ;  
									 		  
									 		 
									 		 cnt++;
									 			}
									 			
									 			if(b[i].secid=="SEC3")
									 			{
									 				c=3;
									 				$("#fnloadval").val(c);
									 		  $("#sec3").append("<tr>"
									 				  
									 			
									 				 +"<td id='isicinstname_row"+cnt+"'>"+b[i].slno+"</td>"
								                      +"<td id='isicinstcode_row"+cnt+"' >"+b[i].repday+"</td>"
								                    //  +"<td id='srno_row"+srno+"'>"+srno+"</td>"
								                      +"<td  id='isicforebilpuranddisc_row"+cnt+"' >"+b[i].repdateval+"</td>"
								                      +"<td  class='sumder alnum' id='isicinveincorshare_row"+cnt+"' >"+b[i].mur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvesindebentu_row"+cnt+"' >"+b[i].eur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvescorpbond_row"+cnt+"'>"+b[i].gbp+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvsothedebsecur_row"+cnt+"' >"+b[i].usd+"</td>"
								                      +"<td  class='sumder alnum' id='isicoverdraftoutsidmur_row"+cnt+"' >"+b[i].others+"</td>"
								                      
								                     
									 		  
									 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads('"+b[i].secid+"+"+b[i].slno+"') id='edit"+cnt+"'></td></tr>") ;  
									 		  
									 		 
									 		 cnt++;
									 			}
									 			
									 			if(b[i].secid=="SEC4")
									 			{
									 				c=4;
									 				$("#fnloadval").val(c);
									 		  $("#sec4").append("<tr>"
									 				  
									 				
									 				 +"<td id='isicinstname_row"+cnt+"'>"+b[i].slno+"</td>"
								                      +"<td id='isicinstcode_row"+cnt+"' >"+b[i].repday+"</td>"
								                    //  +"<td id='srno_row"+srno+"'>"+srno+"</td>"
								                      +"<td  id='isicforebilpuranddisc_row"+cnt+"' >"+b[i].repdateval+"</td>"
								                      +"<td  class='sumder alnum' id='isicinveincorshare_row"+cnt+"' >"+b[i].mur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvesindebentu_row"+cnt+"' >"+b[i].eur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvescorpbond_row"+cnt+"'>"+b[i].gbp+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvsothedebsecur_row"+cnt+"' >"+b[i].usd+"</td>"
								                      +"<td  class='sumder alnum' id='isicoverdraftoutsidmur_row"+cnt+"' >"+b[i].others+"</td>"
								                      
								                     
									 		  
									 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads('"+b[i].secid+"+"+b[i].slno+"') id='edit"+cnt+"'></td></tr>") ;  
									 		  
									 		 
									 		 cnt++;
									 			}
									 			
									 			
									 			if(b[i].secid=="SEC5")
									 			{
									 				c=5;
									 				$("#fnloadval").val(c);
									 		  $("#sec5").append("<tr>"
									 				  
									 				
									 				 +"<td id='isicinstname_row"+cnt+"'>"+b[i].slno+"</td>"
								                      +"<td id='isicinstcode_row"+cnt+"' >"+b[i].repday+"</td>"
								                    //  +"<td id='srno_row"+srno+"'>"+srno+"</td>"
								                      +"<td  id='isicforebilpuranddisc_row"+cnt+"' >"+b[i].repdateval+"</td>"
								                      +"<td  class='sumder alnum' id='isicinveincorshare_row"+cnt+"' >"+b[i].mur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvesindebentu_row"+cnt+"' >"+b[i].eur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvescorpbond_row"+cnt+"'>"+b[i].gbp+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvsothedebsecur_row"+cnt+"' >"+b[i].usd+"</td>"
								                      +"<td  class='sumder alnum' id='isicoverdraftoutsidmur_row"+cnt+"' >"+b[i].others+"</td>"
								                      
								                     
									 		  
									 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads('"+b[i].secid+"+"+b[i].slno+"') id='edit"+cnt+"'></td></tr>") ;  
									 		  
									 		 
									 		 cnt++;
									 			}
									 			
									 			
									 			
									 			if(b[i].secid=="SEC6")
									 			{
									 				c=6;
									 				$("#fnloadval").val(c);
									 		  $("#sec6").append("<tr>"
									 				  
									 				
									 				 +"<td id='isicinstname_row"+cnt+"'>"+b[i].slno+"</td>"
								                      +"<td id='isicinstcode_row"+cnt+"' >"+b[i].repday+"</td>"
								                    //  +"<td id='srno_row"+srno+"'>"+srno+"</td>"
								                      +"<td  id='isicforebilpuranddisc_row"+cnt+"' >"+b[i].repdateval+"</td>"
								                      +"<td  class='sumder alnum' id='isicinveincorshare_row"+cnt+"' >"+b[i].mur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvesindebentu_row"+cnt+"' >"+b[i].eur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvescorpbond_row"+cnt+"'>"+b[i].gbp+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvsothedebsecur_row"+cnt+"' >"+b[i].usd+"</td>"
								                      +"<td  class='sumder alnum' id='isicoverdraftoutsidmur_row"+cnt+"' >"+b[i].others+"</td>"
								                      
								                     
									 		  
									 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads('"+b[i].secid+"+"+b[i].slno+"') id='edit"+cnt+"'></td></tr>") ;  
									 		  
									 		 
									 		 cnt++;
									 			}
									 			
									 			
									 			if(b[i].secid=="SEC7")
									 			{
									 				c=7;
									 				$("#fnloadval").val(c);
									 		  $("#sec7").append("<tr>"
									 				  
									 				
									 				 +"<td id='isicinstname_row"+cnt+"'>"+b[i].slno+"</td>"
								                      +"<td id='isicinstcode_row"+cnt+"' >"+b[i].repday+"</td>"
								                    //  +"<td id='srno_row"+srno+"'>"+srno+"</td>"
								                      +"<td  id='isicforebilpuranddisc_row"+cnt+"' >"+b[i].repdateval+"</td>"
								                      +"<td  class='sumder alnum' id='isicinveincorshare_row"+cnt+"' >"+b[i].mur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvesindebentu_row"+cnt+"' >"+b[i].eur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvescorpbond_row"+cnt+"'>"+b[i].gbp+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvsothedebsecur_row"+cnt+"' >"+b[i].usd+"</td>"
								                      +"<td  class='sumder alnum' id='isicoverdraftoutsidmur_row"+cnt+"' >"+b[i].others+"</td>"
								                      
								                     
									 		  
									 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads('"+b[i].secid+"+"+b[i].slno+"') id='edit"+cnt+"'></td></tr>") ;  
									 		  
									 		 
									 		 cnt++;
									 			}
									 			
									 			if(b[i].secid=="SEC8")
									 			{
									 				c=8;
									 				$("#fnloadval").val(c);
									 		  $("#sec8").append("<tr>"
									 				  
									 				
									 				 +"<td id='isicinstname_row"+cnt+"'>"+b[i].slno+"</td>"
								                      +"<td id='isicinstcode_row"+cnt+"' >"+b[i].repday+"</td>"
								                    //  +"<td id='srno_row"+srno+"'>"+srno+"</td>"
								                      +"<td  id='isicforebilpuranddisc_row"+cnt+"' >"+b[i].repdateval+"</td>"
								                      +"<td  class='sumder alnum' id='isicinveincorshare_row"+cnt+"' >"+b[i].mur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvesindebentu_row"+cnt+"' >"+b[i].eur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvescorpbond_row"+cnt+"'>"+b[i].gbp+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvsothedebsecur_row"+cnt+"' >"+b[i].usd+"</td>"
								                      +"<td  class='sumder alnum' id='isicoverdraftoutsidmur_row"+cnt+"' >"+b[i].others+"</td>"
								                      
								                     
									 		  
									 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads('"+b[i].secid+"+"+b[i].slno+"') id='edit"+cnt+"'></td></tr>") ;  
									 		  
									 		 
									 		 cnt++;
									 			}
									 			
									 			if(b[i].secid=="SEC9")
									 			{
									 				c=9;
									 				$("#fnloadval").val(c);
									 		  $("#sec9").append("<tr>"
									 				  
									 				
									 				 +"<td id='isicinstname_row"+cnt+"'>"+b[i].slno+"</td>"
								                      +"<td id='isicinstcode_row"+cnt+"' >"+b[i].repday+"</td>"
								                    //  +"<td id='srno_row"+srno+"'>"+srno+"</td>"
								                      +"<td  id='isicforebilpuranddisc_row"+cnt+"' >"+b[i].repdateval+"</td>"
								                      +"<td  class='sumder alnum' id='isicinveincorshare_row"+cnt+"' >"+b[i].mur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvesindebentu_row"+cnt+"' >"+b[i].eur+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvescorpbond_row"+cnt+"'>"+b[i].gbp+"</td>"
								                      +"<td  class='sumder alnum' id='isicinvsothedebsecur_row"+cnt+"' >"+b[i].usd+"</td>"
								                      +"<td  class='sumder alnum' id='isicoverdraftoutsidmur_row"+cnt+"' >"+b[i].others+"</td>"
								                      
								                     
									 		  
											 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads('"+b[i].secid+"+"+b[i].slno+"') id='edit"+cnt+"'></td></tr>") ;  
									 		  
									 		 
									 		 cnt++;
									 			}
									 			
												}/* for loop */
											
									 	
									}
									

						});   	
					
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "CRR0100sec10",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec10 tr").remove();
								 
								
								var b=JSON.parse(res.sec1CRR0100s10);
								 console.log(b);
								
									
									 		for(var i=0;i<b.length;i++){
									 			
									 		
									 			
									 		  $("#sec10").append("<tr>"
									 				  
									 				 +"<td id='sec10srlno_row"+cnt+"'>"+b[i].sec10srlno+"</td>"
									 				+"<td  id='sec10rptday_row"+cnt+"' >"+b[i].sec10rptday+"</td>"
									 				+"<td  id='sec10rptdate_row"+cnt+"' >"+b[i].sec10rptdate+"</td>"
									 				+"<td  class='sumder alnum' id='sec10tresubilbank_row"+cnt+"' >"+b[i].sec10tresubilbank+"</td>"
									 				+"<td  class='sumder alnum' id='sec10tresubiltrade_row"+cnt+"' >"+b[i].sec10tresubiltrade+"</td>"
	 		  
											 		  +"<td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads('SEC10+"+b[i].sec10srlno+"') id='edit"+cnt+"'></td></tr>") ;  
									 			
									 			
									 		 cnt++;
											 
											
									 			}                   
									
									
									}
									

						});   
						
					
						
							
					
						}
	 var datasum={
				"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>'
		};
	$.ajax({
			url:"savecheckcrr0100",
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
$(document).ready(function(){
	
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');

	
});   
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
	

	$( ".btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
	$( '.btnback').click(function() {
		 location.href="XBRL_CRT_CRR0100_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

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
	 $("#btnXML").hide();
	 $("#btnSave").hide();
 if(a==10){
	 $("#btnXML").show();
	 $("#btnSave").show();
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
		 $("#li2,#li3,#li4,#li5,#li6,#li7,#li8,#li9,#li10").removeClass("active");
		  document.getElementById("tab1").style.width = "1025px"; 
		  document.getElementById("ad").style.width = "1025px"; 
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : '<%=reptype%>',"ReporefSeq" : '<%=ReporefSeq%>',"instno" :"SEC1" ,"dt2" :'<%=dt2%>' ,"dt1" :'<%=dt1%>',"curr": '<%=curr%>' 
				}; 
				
			$.ajax({
				url : "CRR0100details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#det1 tr").remove();
					 
					
					var b=JSON.parse(res.detCRR0100);
					 console.log(b);
					
			
						 	
						 		$("#detb1").show();
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#det1").append(
						 				 "<tr id='crradd"+srno+"'>"
  +"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
				                      +"<td id='accname_row"+srno+"' >"+b[i].accnam+"</td>"
				                      +"<td  id='cusid_row"+srno+"' >"+b[i].cusid+"</td>"
				                      +"<td class='sumder alnum' id='accbalamtac_row"+srno+"' >"+b[i].accbalamtac+"</td>"
				                      +"<td class='sumder alnum' id='accrcode_row"+srno+"' >"+b[i].accrcode+"</td>"
				                      +"<td class='sumder alnum' id='natofcus_row"+srno+"'>"+b[i].natofcus+"</td>"
				                      +"<td class='sumder alnum' id='reportdate_row"+srno+"' >"+b[i].reportdate+"</td>"
				                      
				                    
									  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
				                     
				                      
				                    +"</tr>" ) ; 
						 		  
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
				}
			});
	}else if(a==2){
		$("#btnpre").prop("disabled",false);
		 $("#btnnext").prop("disabled",true);
		 $("#li2").addClass("active");
		 $("#li1,#li3,#li4,#li5,#li6,#li7,#li8,#li9,#li10").removeClass("active");
		 document.getElementById("ad").style.width = "1025px"; 
		 document.getElementById("tab1").style.width = "1025px"; 	
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : '<%=reptype%>',"ReporefSeq" : '<%=ReporefSeq%>',"instno" :"SEC2" ,"dt2" :'<%=dt2%>' ,"dt1" :'<%=dt1%>',"curr": '<%=curr%>' 
				}; 
				
			$.ajax({
				url : "CRR0100details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#det1 tr").remove();
					 
					
					var b=JSON.parse(res.detCRR0100);
					 console.log(b);
					
			
						 	
						 		$("#detb2").show();
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#det2").append(
						 				 "<tr id='crradd"+srno+"'>"
+"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
				                      +"<td id='accname_row"+srno+"' >"+b[i].accnam+"</td>"
				                      +"<td  id='cusid_row"+srno+"' >"+b[i].cusid+"</td>"
				                      +"<td class='sumder alnum' id='accbalamtac_row"+srno+"' >"+b[i].accbalamtac+"</td>"
				                      +"<td class='sumder alnum' id='accrcode_row"+srno+"' >"+b[i].accrcode+"</td>"
				                      +"<td class='sumder alnum' id='natofcus_row"+srno+"'>"+b[i].natofcus+"</td>"
				                      +"<td class='sumder alnum' id='reportdate_row"+srno+"' >"+b[i].reportdate+"</td>"
				                      
				                    
									  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
				                     
				                      
				                    +"</tr>" ) ; 
						 		  
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
				}
			});
	}

	else if(a==3){
		$("#btnpre").prop("disabled",false);
		 $("#btnnext").prop("disabled",true);
		 $("#li3").addClass("active");
		 $("#li1,#li2,#li4,#li5,#li6,#li7,#li8,#li9,#li10").removeClass("active");
		 document.getElementById("tab1").style.width = "1025px"; 
		 document.getElementById("ad").style.width = "1025px"; 	
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : '<%=reptype%>',"ReporefSeq" : '<%=ReporefSeq%>',"instno" :"SEC3" ,"dt2" :'<%=dt2%>' ,"dt1" :'<%=dt1%>',"curr": '<%=curr%>' 
				}; 
				
			$.ajax({
				url : "CRR0100details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#det1 tr").remove();
					 
					
					var b=JSON.parse(res.detCRR0100);
					 console.log(b);
					
			
						 	
						 		$("#detb3").show();
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#det3").append(
						 				 "<tr id='crradd"+srno+"'>"
+"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
				                      +"<td id='accname_row"+srno+"' >"+b[i].accnam+"</td>"
				                      +"<td  id='cusid_row"+srno+"' >"+b[i].cusid+"</td>"
				                      +"<td class='sumder alnum' id='accbalamtac_row"+srno+"' >"+b[i].accbalamtac+"</td>"
				                      +"<td class='sumder alnum' id='accrcode_row"+srno+"' >"+b[i].accrcode+"</td>"
				                      +"<td class='sumder alnum' id='natofcus_row"+srno+"'>"+b[i].natofcus+"</td>"
				                      +"<td class='sumder alnum' id='reportdate_row"+srno+"' >"+b[i].reportdate+"</td>"
				                      
				                    
									  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
				                     
				                      
				                    +"</tr>" ) ; 
						 		  
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
				}
			});
	}else if(a==4){
		$("#btnpre").prop("disabled",false);
		 $("#btnnext").prop("disabled",true);
		 $("#li4").addClass("active");
		 $("#li1,#li2,#li3,#li5,#li6,#li7,#li8,#li9,#li10").removeClass("active");
		 document.getElementById("tab1").style.width = "1025px"; 
		 document.getElementById("ad").style.width = "1025px"; 
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : '<%=reptype%>',"ReporefSeq" : '<%=ReporefSeq%>',"instno" :"SEC4" ,"dt2" :'<%=dt2%>' ,"dt1" :'<%=dt1%>',"curr": '<%=curr%>' 
				}; 
				
			$.ajax({
				url : "CRR0100details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#det1 tr").remove();
					 
					
					var b=JSON.parse(res.detCRR0100);
					 console.log(b);
					
			
						 	
						 		$("#detb4").show();
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#det4").append(
						 				 "<tr id='crradd"+srno+"'>"

				                   	  +"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
				                      +"<td id='accname_row"+srno+"' >"+b[i].accnam+"</td>"
				                      +"<td  id='cusid_row"+srno+"' >"+b[i].cusid+"</td>"
				                      +"<td class='sumder alnum' id='accbalamtac_row"+srno+"' >"+b[i].accbalamtac+"</td>"
				                      +"<td class='sumder alnum' id='accrcode_row"+srno+"' >"+b[i].accrcode+"</td>"
				                      +"<td class='sumder alnum' id='natofcus_row"+srno+"'>"+b[i].natofcus+"</td>"
				                      +"<td class='sumder alnum' id='reportdate_row"+srno+"' >"+b[i].reportdate+"</td>"
				                    
									  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
				                     
				                      
				                    +"</tr>" ) ; 
						 		  
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
				}
			});
	}else if(a==5){
		$("#btnpre").prop("disabled",false);
		 $("#btnnext").prop("disabled",true);
		 $("#li5").addClass("active");
		 $("#li1,#li2,#li3,#li4,#li6,#li7,#li8,#li9,#li10").removeClass("active");
		 document.getElementById("tab1").style.width = "1025px"; 
		 document.getElementById("ad").style.width = "1025px"; 
			
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : '<%=reptype%>',"ReporefSeq" : '<%=ReporefSeq%>',"instno" :"SEC5" ,"dt2" :'<%=dt2%>' ,"dt1" :'<%=dt1%>',"curr": '<%=curr%>' 
				}; 
				
			$.ajax({
				url : "CRR0100details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#det1 tr").remove();
					 
					
					var b=JSON.parse(res.detCRR0100);
					 console.log(b);
					
			
						 		$("#detb5").show();
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#det5").append(
						 				 "<tr id='crradd"+srno+"'>"

				                   	+"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
				                      +"<td id='accname_row"+srno+"' >"+b[i].accnam+"</td>"
				                      +"<td  id='cusid_row"+srno+"' >"+b[i].cusid+"</td>"
				                      +"<td class='sumder alnum' id='accbalamtac_row"+srno+"' >"+b[i].accbalamtac+"</td>"
				                      +"<td class='sumder alnum' id='accrcode_row"+srno+"' >"+b[i].accrcode+"</td>"
				                      +"<td class='sumder alnum' id='natofcus_row"+srno+"'>"+b[i].natofcus+"</td>"
				                      +"<td class='sumder alnum' id='reportdate_row"+srno+"' >"+b[i].reportdate+"</td>"
				                    
									  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
				                     
				                      
				                    +"</tr>" ) ; 
						 		  
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
				}
			});
	}else if(a==6){
		$("#btnpre").prop("disabled",false);
		 $("#btnnext").prop("disabled",true);
		 $("#li6").addClass("active");
		 $("#li1,#li2,#li3,#li4,#li5,#li7,#li8,#li9,#li10").removeClass("active");
		 document.getElementById("tab1").style.width = "1025px"; 
		 document.getElementById("ad").style.width = "1025px"; 	
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : '<%=reptype%>',"ReporefSeq" : '<%=ReporefSeq%>',"instno" :"SEC6" ,"dt2" :'<%=dt2%>' ,"dt1" :'<%=dt1%>',"curr": '<%=curr%>' 
				}; 
				
			$.ajax({
				url : "CRR0100details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#det1 tr").remove();
					 
					
					var b=JSON.parse(res.detCRR0100);
					 console.log(b);
					
			
						 	
						 		$("#detb6").show();
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#det6").append(
						 				 "<tr id='crradd"+srno+"'>"

				                   	+"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
				                      +"<td id='accname_row"+srno+"' >"+b[i].accnam+"</td>"
				                      +"<td  id='cusid_row"+srno+"' >"+b[i].cusid+"</td>"
				                      +"<td class='sumder alnum' id='accbalamtac_row"+srno+"' >"+b[i].accbalamtac+"</td>"
				                      +"<td class='sumder alnum' id='accrcode_row"+srno+"' >"+b[i].accrcode+"</td>"
				                      +"<td class='sumder alnum' id='natofcus_row"+srno+"'>"+b[i].natofcus+"</td>"
				                      +"<td class='sumder alnum' id='reportdate_row"+srno+"' >"+b[i].reportdate+"</td>"
				                      
				                    
									  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
				                     
				                      
				                    +"</tr>" ) ; 
						 		  
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
				}
			});
	}else if(a==7){
		$("#btnpre").prop("disabled",false);
		 $("#btnnext").prop("disabled",true);
		 $("#li7").addClass("active");
		 $("#li1,#li2,#li3#li4,#li5,#li6,#li8,#li9,#li10").removeClass("active");
		 document.getElementById("tab1").style.width = "1025px"; 
		 document.getElementById("ad").style.width = "1025px"; 	
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : '<%=reptype%>',"ReporefSeq" : '<%=ReporefSeq%>',"instno" :"SEC7" ,"dt2" :'<%=dt2%>' ,"dt1" :'<%=dt1%>',"curr": '<%=curr%>' 
				}; 
				
			$.ajax({
				url : "CRR0100details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#det1 tr").remove();
					 
					
					var b=JSON.parse(res.detCRR0100);
					 console.log(b);
					
			
						 	
						 		$("#detb7").show();
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#det7").append(
						 				  "<tr id='crradd"+srno+"'>"

				                   	 +"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
				                      +"<td id='accname_row"+srno+"' >"+b[i].accnam+"</td>"
				                      +"<td  id='cusid_row"+srno+"' >"+b[i].cusid+"</td>"
				                      +"<td class='sumder alnum' id='accbalamtac_row"+srno+"' >"+b[i].accbalamtac+"</td>"
				                      +"<td class='sumder alnum' id='accrcode_row"+srno+"' >"+b[i].accrcode+"</td>"
				                      +"<td class='sumder alnum' id='natofcus_row"+srno+"'>"+b[i].natofcus+"</td>"
				                      +"<td class='sumder alnum' id='reportdate_row"+srno+"' >"+b[i].reportdate+"</td>"
				                      
				                    
									  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
				                     
				                      
				                    +"</tr>" ) ; 
						 		  
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
				}
			});
	}else if(a==8){
		$("#btnpre").prop("disabled",false);
		 $("#btnnext").prop("disabled",true);
		 $("#li8").addClass("active");
		 $("#li1,#li2,#li3,#li4,#li5,#li6,#li7,#li9,#li10").removeClass("active");
		 document.getElementById("tab1").style.width = "1025px"; 
		 document.getElementById("ad").style.width = "1025px"; 
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : '<%=reptype%>',"ReporefSeq" : '<%=ReporefSeq%>',"instno" :"SEC8" ,"dt2" :'<%=dt2%>' ,"dt1" :'<%=dt1%>',"curr": '<%=curr%>' 
				}; 
				
			$.ajax({
				url : "CRR0100details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#det1 tr").remove();
					 
					
					var b=JSON.parse(res.detCRR0100);
					 console.log(b);
					
			
						 	
						 		$("#detb8").show();
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#det8").append(
						 				 "<tr id='crradd"+srno+"'>"
+"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
				                      +"<td id='accname_row"+srno+"' >"+b[i].accnam+"</td>"
				                      +"<td  id='cusid_row"+srno+"' >"+b[i].cusid+"</td>"
				                      +"<td class='sumder alnum' id='accbalamtac_row"+srno+"' >"+b[i].accbalamtac+"</td>"
				                      +"<td class='sumder alnum' id='accrcode_row"+srno+"' >"+b[i].accrcode+"</td>"
				                      +"<td class='sumder alnum' id='natofcus_row"+srno+"'>"+b[i].natofcus+"</td>"
				                      +"<td class='sumder alnum' id='reportdate_row"+srno+"' >"+b[i].reportdate+"</td>"
				                      
				                    
									  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
				                     
				                      
				                    +"</tr>" ) ; 
						 		  
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
				}
			});
			
	}else if(a==9){
		$("#btnpre").prop("disabled",false);
		 $("#btnnext").prop("disabled",true);
		 $("#li9").addClass("active");
		 $("#li1,#li2,#li3,#li4,#li5,#li6,#li7,#li8,#li10").removeClass("active");
		 document.getElementById("tab1").style.width = "1025px"; 
		 document.getElementById("ad").style.width = "1025px"; 
			
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : '<%=reptype%>',"ReporefSeq" : '<%=ReporefSeq%>',"instno" :"SEC9" ,"dt2" :'<%=dt2%>' ,"dt1" :'<%=dt1%>',"curr": '<%=curr%>' 
				}; 
				
			$.ajax({
				url : "CRR0100details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#det1 tr").remove();
					 
					
					var b=JSON.parse(res.detCRR0100);
					 console.log(b);
					
			
						 	
						 		$("#detb9").show();
						 		$("#modify").show();
						 		if(b.length==0){
						 			$("#det9").append("<tr><td colspan=8 style='text-align:center'>No Record Found</td></tr>");
						 		}else{
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#det9").append(
						 				 "<tr id='crradd"+srno+"'>"
+"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
				                      +"<td id='accname_row"+srno+"' >"+b[i].accnam+"</td>"
				                      +"<td  id='cusid_row"+srno+"' >"+b[i].cusid+"</td>"
				                      +"<td class='sumder alnum' id='accbalamtac_row"+srno+"' >"+b[i].accbalamtac+"</td>"
				                      +"<td class='sumder alnum' id='accrcode_row"+srno+"' >"+b[i].accrcode+"</td>"
				                      +"<td class='sumder alnum' id='natofcus_row"+srno+"'>"+b[i].natofcus+"</td>"
				                      +"<td class='sumder alnum' id='reportdate_row"+srno+"' >"+b[i].reportdate+"</td>"
				                      
				                    
									  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
				                     
				                      
				                    +"</tr>" ) ; 
						 		  
								 srno++;
								 
								
									}
						 		}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
				}
			});
	}else if(a==10){
		$("#btnpre").prop("disabled",false);
		 $("#btnnext").prop("disabled",true);
		 $("#li10").addClass("active");
		 $("#li1,#li2,#li3#li4,#li5,#li6,#li7,#li8,#li9").removeClass("active");
		 document.getElementById("tab1").style.width = "925px"; 
		 document.getElementById("ad").style.width = "925px"; 
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : '<%=reptype%>',"ReporefSeq" : '<%=ReporefSeq%>',"instno" :"0" ,"dt2" :'<%=dt2%>' ,"dt1" :'<%=dt1%>',"curr": '<%=curr%>' 
				}; 
				
			$.ajax({
				url : "CRR0100details10",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#det1 tr").remove();
					 
					
					var b=JSON.parse(res.det10CRR0100); 
					 console.log(b);
					
			
						 	
						 		$("#detb10").show();
						 		$("#modify").show();
						 		if(b.length==0){
						 			$("#det1").append("<tr><td colspan=8 style='text-align:center'>No Record Found</td></tr>");
						 		}else{
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#det10").append(
						 				 "<tr id='crradd"+srno+"'>"

				                   	  +"<td id='trsbillstrade_row"+srno+"'>"+b[i].trsbillstrade+"</td>"
				                      +"<td id='trbilsbank_row"+srno+"' >"+b[i].trbilsbank+"</td>"
				                      +"<td  id='rdate_row"+srno+"' >"+b[i].rdate+"</td>"
				                      
				                      
				                      
				                    
									  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none;' onclick=Cancel_row('"+srno+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none;' onclick=Canedit_row('"+srno+"')><input type='button' id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+srno+"')> </td>"
				                     
				                      
				                    +"</tr>" ) ; 
						 		  
								 srno++;
								 
								
									}
						 		}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
				}
			});
			
			
			
	
	}

	 	   

}

</script>
<script>
 
var modtyp;

$(document).ready(function(){


	$("#addrow").on("click",function(){
		
		var rowno=$("#rowno").val();
modtyp="A";
		$("#addrowno").val("1"); 
	
		if(tabid<=9){
			
			$("#det"+$("#rownoadd").val()).prepend("<tr  id='crradd"+rowno+"'><td id='accno_row"+rowno+"'><input type='text' id='accno_text"+rowno+"' style='width: 80px;'></td><td id='accname_row"+rowno+"'><input type='text'  id='accname_text"+rowno+"' style='    width:280px;'></td><td id='cusid_row"+rowno+"'><input type='text' id='cusid_text"+rowno+"' style='     width: 64px;'></td><td id='accbalamtac_row"+rowno+"'><input type='text' 	id='accbalamtac_text"+rowno+"' class='decimalPt roundUp' style='    width: 99px;'></td><td id='accrcode_row"+rowno+"'><input type='text' id='accrcode_text"+rowno+"' style='    width: 53px;'></td><td id='natofcus_row"+rowno+"' class='sumder alnum'><input type='text'  id='natofcus_text"+rowno+"'    style='    width: 150px;'><td id='reportdate_row"+rowno+"'><input type='text' id='reportdate_text"+rowno+"' style='    width: 63px;'></td><td style='text-align:center;'><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')>  <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px;display:inline-block; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");
			}
			
			else
				$("#det"+$("#rownoadd").val()).prepend("<tr id='crradd"+rowno+"'><td id='trbilsbank_row"+rowno+"'><input type='text'  id='trbilsbank_text"+rowno+"' style='    width:250px;'></td><td id='trsbillstrade_row"+rowno+"'><input type='text' id='trsbillstrade_text"+rowno+"' style='width: 250px;'></td><td id='rdate_row"+rowno+"'><input type='text' id='rdate_text"+rowno+"' style='     width: 250px;'></td><td style='text-align:center;'><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')>  <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px;display:inline-block; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");
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
$("#reportdate_text"+a).datepicker({
	dateFormat: "dd-mm-yy",
    changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: "today"
});
$("#rdate_text"+a).datepicker({
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
  

	if(tabid<=9){ 

	var	accbalamtac =  document.getElementById("accbalamtac_row"+no);
	var accbalamtac_data = accbalamtac.innerHTML;



	accbalamtac.innerHTML="<input type='text' class='decimalPt roundUp'  id='accbalamtac_text"+no+"'  style='width: 83px'; value='"+accbalamtac_data+"'>";


	}

	else
		{
		var	trsbillstrade =  document.getElementById("trsbillstrade_row"+no);
		var trsbillstrade_data = trsbillstrade.innerHTML;

		var	trbilsbank =  document.getElementById("trbilsbank_row"+no);
		var trbilsbank_data = trbilsbank.innerHTML;

		trsbillstrade.innerHTML="<input type='text' class='decimalPt roundUp'  id='trsbillstrade_text"+no+"'  style='width: 83px'; value='"+trsbillstrade_data+"'>";
		trbilsbank.innerHTML="<input type='text' class='decimalPt roundUp'  id='trbilsbank_text"+no+"'  style='width: 83px'; value='"+trbilsbank_data+"'>";

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
	if(tabid<=9){
	var error="N";
	
	if (modtyp=="M"){
		
		
		if(document.getElementById("accbalamtac_text"+no).value==""){
			alert("Enter Account Balance Amount ..");
			error="Y"
		}
		
	} else if (modtyp=="A") {
		
		
		

		if(document.getElementById("accno_text"+no).value==""){
			alert("Enter Account Number ..");
			error="Y"
		}else if(document.getElementById("accname_text"+no).value==""){
			alert("Enter Account Name ..");	
			error="Y"
		}else if(document.getElementById("cusid_text"+no).value==""){
			alert("Enter Customer Id ..");
			error="Y"
		}if(document.getElementById("accbalamtac_text"+no).value==""){
			alert("Enter Account Balance Amount ..");
			error="Y"
		}else if(document.getElementById("accrcode_text"+no).value==""){
			alert("Enter Account Currency Code ..");
			error="Y"
		}else if(document.getElementById("natofcus_text"+no).value==""){
			alert("Enter Nature Of Customer ..");
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
	
	var accbalamtac_val=document.getElementById("accbalamtac_text"+no).value;

	document.getElementById("accbalamtac_row"+no).innerHTML=accbalamtac_val;


	
	
	if($("#addrowno").val()=="1"){
		modtyp="A";
	
		var  accno_val=document.getElementById("accno_text"+no).value;	 
		document.getElementById("accno_row"+no).innerHTML=accno_val;

		   var accname_val=document.getElementById("accname_text"+no).value;
		   document.getElementById("accname_row"+no).innerHTML=accname_val;
		   
		  var cusid_val=document.getElementById("cusid_text"+no).value;
		   document.getElementById("cusid_row"+no).innerHTML=cusid_val;

		   var accrcode_val=document.getElementById("accrcode_text"+no).value;
			document.getElementById("accrcode_row"+no).innerHTML=accrcode_val;
			
		  
		 
		  var  natofcus_val=document.getElementById("natofcus_text"+no).value;	 
		  document.getElementById("natofcus_row"+no).innerHTML=natofcus_val;

		  var reportdate_val=document.getElementById("reportdate_text"+no).value;	 
		  document.getElementById("reportdate_row"+no).innerHTML=reportdate_val;
	


	}
	
		else{
			document.getElementById("Cancel_button"+no).style.display="inline-block";
			document.getElementById("Cancel_btn"+no).style.display="none";
		}
	
	document.getElementById("edit_button"+no).style.display="inline-block";
	document.getElementById("save_button"+no).style.display="none";
	var accno=document.getElementById("accno_row"+no).innerHTML;	 
	   var accname=document.getElementById("accname_row"+no).innerHTML;
	  var cusid=document.getElementById("cusid_row"+no).innerHTML;
	  var accbalamtac=document.getElementById("accbalamtac_row"+no).innerHTML;
	  var accrcode=document.getElementById("accrcode_row"+no).innerHTML;
	  var natofcus=document.getElementById("natofcus_row"+no).innerHTML;	
	  var reportdate=document.getElementById("reportdate_row"+no).innerHTML;	 
	  $("#crradd"+no).addClass("rowaddedd");
	
	// $("#det1 td").attr("padding","8px");
	var refeCRR100=document.getElementById("refDisplay").value;
accbalamtac=accbalamtac.replace(/\,/g,'');
accbalamtac=Number(accbalamtac);
var rptdate1 = {
	     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeCRR100, "accno":accno,"accnam":accname,"cusid" : cusid,"accbalamtac":accbalamtac, "accrcode":accrcode,"natofcus":natofcus,"reportdate":reportdate,"modtyp":modtyp
	}; 
		$.ajax({
				url : "CRR0100",
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



else
	{
	
var error="N";
	
	if (modtyp=="M"){
		
		
		if(document.getElementById("trsbillstrade_text"+no).value==""){
			alert("Enter Treasury Bills bank ..");
			error="Y"
		}else if(document.getElementById("trbilsbank_text"+no).value==""){
			alert("Enter Treasury Bills Trade ..");	
			error="Y"
		}
		
	} else if (modtyp=="A") {
		
		
		if(document.getElementById("trsbillstrade_text"+no).value==""){
			alert("Enter Treasury Bills bank ..");
			error="Y"
		}else if(document.getElementById("trbilsbank_text"+no).value==""){
			alert("Enter Treasury Bills Trade ..");	
			error="Y"
		}else if(document.getElementById("rdate_text"+no).value==""){
			alert("Enter Report Date ..");
			error="Y"
		}
	}
	
	
	
	if (error=="N"){
	
	$("#modflg").val("Y");
	modtyp="M";
	
	
	document.getElementById("edit_button"+no).checked = false;
	
	  
	var trsbillstrade_val=document.getElementById("trsbillstrade_text"+no).value;

	document.getElementById("trsbillstrade_row"+no).innerHTML=trsbillstrade_val;
	var trbilsbank_val=document.getElementById("trbilsbank_text"+no).value;

	document.getElementById("trbilsbank_row"+no).innerHTML=trbilsbank_val;
	
	
	if($("#addrowno").val()=="1"){
		modtyp="A";
	
		var  rdate_val=document.getElementById("rdate_text"+no).value;	 
		document.getElementById("rdate_row"+no).innerHTML=rdate_val;
	}
	
		else{
			document.getElementById("Cancel_button"+no).style.display="inline-block";
			document.getElementById("Cancel_btn"+no).style.display="none";
		}
	
	document.getElementById("edit_button"+no).style.display="inline-block";
	document.getElementById("save_button"+no).style.display="none";
	var trsbillstrade=document.getElementById("trsbillstrade_row"+no).innerHTML;	 
	   var trbilsbank=document.getElementById("trbilsbank_row"+no).innerHTML;
	  var rdate=document.getElementById("rdate_row"+no).innerHTML;
	 
	 
	  $("#crradd"+no).addClass("rowaddedd");
	
	// $("#det1 td").attr("padding","8px");
var refeCRR100=document.getElementById("refDisplay").value;
	trsbillstrade=trsbillstrade.replace(/\,/g,'');
	trsbillstrade=Number(trsbillstrade);
	trbilsbank=trbilsbank.replace(/\,/g,'');
	trbilsbank=Number(trbilsbank);
	var rptdate1 = {
		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeCRR100, "trsbillstrade":trsbillstrade,"trbilsbank":trbilsbank,"rdate" : rdate,"modtyp":modtyp
		}; 

		$.ajax({
    	url : "CRR0100d10",
	
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
		        	if(tabid<=9){
		        	var accno=document.getElementById("accno_row"+no).innerHTML;	 
		     	   var accname=document.getElementById("accname_row"+no).innerHTML;
		     	  var cusid=document.getElementById("cusid_row"+no).innerHTML;
		     	  var accbalamtac=document.getElementById("accbalamtac_row"+no).innerHTML;
		     	  var accrcode=document.getElementById("accrcode_row"+no).innerHTML;
		     	  var natofcus=document.getElementById("natofcus_row"+no).innerHTML;	
		     	  var reportdate=document.getElementById("reportdate_row"+no).innerHTML;
		     	  
		     	  
		     	 var refeCRR100=document.getElementById("refDisplay").value;
		     	accbalamtac=accbalamtac.replace(/\,/g,'');
		     	accbalamtac=Number(accbalamtac);
		     	var rptdate1 = {
		     		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeCRR100, "accno":accno,"accnam":accname,"cusid" : cusid,"accbalamtac":accbalamtac, "accrcode":accrcode,"natofcus":natofcus,"reportdate":reportdate,"modtyp":modtyp
		     		}; 
		     
		     			$.ajax({
		     					url : "CRR0100",
		     					data : rptdate1  ,
		        				dataType : 'json', 
		        				type : 'POST',
		        				async : true,
		        			 	success : function(res) {
		        				 console.log(res.refno);
		        				//	alert("refeDCG100"+refeDCG100);
		        				
		        				// alert("sfsdf");
		        				 $("#refDisplay").val(res.refno);
			  
		        				 $("#crradd"+no).closest("tr").remove();

				   
		        				
		        			}
		        		});
		        }	
		        
		        else{
		        	
		        	var trsbillstrade=document.getElementById("trsbillstrade_row"+no).innerHTML;	 
		     	   var trbilsbank=document.getElementById("trbilsbank_row"+no).innerHTML;
		     	  var rdate=document.getElementById("rdate_row"+no).innerHTML;
		     	  
		     	 var refeCRR100=document.getElementById("refDisplay").value;
		     		trsbillstrade=trsbillstrade.replace(/\,/g,'');
		     		trsbillstrade=Number(trsbillstrade);
		     		trbilsbank=trbilsbank.replace(/\,/g,'');
		     		trbilsbank=Number(trbilsbank);
			     	var rptdate1 = {
			   		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeCRR100, "trsbillstrade":trsbillstrade,"trbilsbank":trbilsbank,"rdate" : rdate,"modtyp":modtyp
					}; 

					$.ajax({
			    					url : "CRR0100d10",
			     					data : rptdate1  ,
			        				dataType : 'json', 
			        				type : 'POST',
			        				async : true,
			        			 	success : function(res) {
			        				 console.log(res.refno);
			        				//	alert("refeDCG100"+refeDCG100);
			        				
			        				// alert("sfsdf");
			        				 $("#refDisplay").val(res.refno);
				  
			        				 $("#crradd"+no).closest("tr").remove();

					   
			        				
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
	
	if(tabid<=9){
		var detcancel={
				"accno":$("#accno_row"+no).text(),"reportdate":$("#reportdate_row"+no).text(),"tabid":tabid
		};
	}else{
		
		var detcancel={
				"rdate":$("#rdate_row"+no).text(),"trsbillstrade":$("#trsbillstrade_row"+no).text(),"tabid":tabid
		};
		
	}
	 
		 $.ajax({
		     url : "CRR0100cancel",
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
			
if(tabid<=9){

	var accbalamtac_val=document.getElementById("accbalamtac_text"+no).value;

	document.getElementById("accbalamtac_row"+no).innerHTML=accbalamtac_val;

			$("#edit_button"+no).show();
			/* document.getElementById("edit_button"+no).style.display="block"; */
			document.getElementById("save_button"+no).style.display="none";
			document.getElementById("Cancel_btn"+no).style.display="none";
        	location.reload(true);

			  var accbalamtac_val=document.getElementById("accbalamtac_row"+no).innerHTML;
}
	 
else{

	var trsbillstrade_val=document.getElementById("trsbillstrade_text"+no).value;

	document.getElementById("trsbillstrade_row"+no).innerHTML=trsbillstrade_val;
	var trbilsbank_val=document.getElementById("trbilsbank_text"+no).value;

	document.getElementById("trbilsbank_row"+no).innerHTML=trbilsbank_val;
		$("#edit_button"+no).show();
		/* document.getElementById("edit_button"+no).style.display="block"; */
		document.getElementById("save_button"+no).style.display="none";
		document.getElementById("Cancel_btn"+no).style.display="none";
    	location.reload(true);

    	 var trsbillstrade=document.getElementById("trsbillstrade_row"+no).innerHTML;	 
  	   var trbilsbank=document.getElementById("trbilsbank_row"+no).innerHTML;
	
	
	
	
}
			  if($("#crradd"+no).hasClass( "rowaddedd" )){
				  
				  document.getElementById("Cancel_button"+no).style.display="inline-block";


			  }else{
				  document.getElementById("Cancel_button"+no).style.display="none";
			  }
	 }

	 
 
 
 function Canadd_row(no){
		 
		 


		 if($("#crradd"+no).hasClass( "rowaddedd" )){
if(tabid<=9){
			 var detcancel={
						"accno":$("#accno_row"+no).text(),"reportdate":$("#reportdate_row"+no).text(),"tabid":tabid
				};
}
else
	{
	 var detcancel={
				"rdate":$("#rdate_row"+no).text(),"trsbillstrade":$("#trsbillstrade_row"+no).text(),"tabid":tabid

		};
	
	}

			 $.ajax({
			     url : "CRR0100cancel",
			     data : detcancel  ,
					dataType : 'json', 
					type : 'POST',
					async : true,
					 success : function(res) {

		         alert("Cancellation Successful");
					}
				});
		 }
		 $("#crradd"+no).remove();
		 
	 }
 

</script>



<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	
	
	
 	
$("#sumfirst").on("click",function(){
		
		location.href = "XBRL_REP_CRR0100_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_CRR0100_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"SEC1"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	
	
	$('#btnExcel').click(function() {
		
	
		if(tabid<=9){
			
		
		  CRR0100Form.action = "CRR0100EXCELREPORT.action?method=CRR0100EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+"SEC"+tabid+"+&curr="+'<%=curr%>';
		 CRR0100Form.submit(); 
		}
		else
			{
			
			
				  CRR0100Form.action = "CRR0100EXCELREPORT10.action?method=CRR0100EXCEL10&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+"SEC"+tabid+"+&curr="+'<%=curr%>';
				 CRR0100Form.submit(); 
				} 
			
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 CRR0100Form.action = "CRR0100EXCELSum.action?method=CRR0100EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 CRR0100Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 CRR0100Form.action = "CRR0100PDFREPORT.action?method=CRR0100PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 CRR0100Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  CRR0100Form.action = "XMLDOWNLOAD.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 CRR0100Form.submit(); 
	});
	
	
	$("#btnfilter").on("click",function(){
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
			
			$('#accno1,#accname1,#cusid1,#accbalamtac1,#accrcode1,#natofcus1,#reportdate1,#accno2,#accname2,#cusid2,#accbalamtac2,#accrcode2,#natofcus2,#reportdate2,#accno3,#accname3,#cusid3,#accbalamtac3,#accrcode3,#natofcus3,#reportdate3,#accno4,#accname4,#cusid4,#accbalamtac4,#accrcode4,#natofcus4,#reportdate4,#accno5,#accname5,#cusid5,#accbalamtac5,#accrcode5,#natofcus5,#reportdate5,#accno6,#accname6,#cusid6,#accbalamtac6,#accrcode6,#natofcus6,#reportdate6,#accno7,#accname7,#cusid7,#accbalamtac7,#accrcode7,#natofcus7,#reportdate7,#accno8,#accname8,#cusid8,#accbalamtac8,#accrcode8,#natofcus8,#reportdate8,#accno9,#accname9,#cusid9,#accbalamtac9,#accrcode9,#natofcus9,#reportdate9,#tbb,#tbt,#rd').css({
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
			
			 $('#accno1,#accname1,#cusid1,#accbalamtac1,#accrcode1,#natofcus1,#reportdate1,#accno2,#accname2,#cusid2,#accbalamtac2,#accrcode2,#natofcus2,#reportdate2,#accno3,#accname3,#cusid3,#accbalamtac3,#accrcode3,#natofcus3,#reportdate3,#accno4,#accname4,#cusid4,#accbalamtac4,#accrcode4,#natofcus4,#reportdate4,#accno5,#accname5,#cusid5,#accbalamtac5,#accrcode5,#natofcus5,#reportdate5,#accno6,#accname6,#cusid6,#accbalamtac6,#accrcode6,#natofcus6,#reportdate6,#accno7,#accname7,#cusid7,#accbalamtac7,#accrcode7,#natofcus7,#reportdate7,#accno8,#accname8,#cusid8,#accbalamtac8,#accrcode8,#natofcus8,#reportdate8,#accno9,#accname9,#cusid9,#accbalamtac9,#accrcode9,#natofcus9,#reportdate9,#tbb,#tbt,#rd').css({
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
			  
				 table = document.getElementById("det"+tabid);
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
	 					url:"saveSumcrr",
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
	 				   		url:"saveSumcrr",
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
function myFunction1(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("det1");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==0 ||b==3|| b==4 || b==5 ||b==6|| b==7 ){
		
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
		if(b==0 ||b==3|| b==4 || b==5 ||b==6|| b==7 ){
			
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
		if(b==0 ||b==3|| b==4 || b==5 ||b==6|| b==7 ){
			
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
	
	
function myFunction4(a,b) {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById(a);
	  filter = input.value.toUpperCase();
	  table = document.getElementById("det4");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[b];
	 
	if (td) {
		if(b==0 ||b==3|| b==4 || b==5 ||b==6|| b==7 ){
			
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
	
function myFunction5(a,b) {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById(a);
	  filter = input.value.toUpperCase();
	  table = document.getElementById("det5");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[b];
	 
	if (td) {
		if(b==0 ||b==3|| b==4 || b==5 ||b==6|| b==7 ){
			
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
	
function myFunction6(a,b) {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById(a);
	  filter = input.value.toUpperCase();
	  table = document.getElementById("det6");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[b];
	 
	if (td) {
		if(b==0 ||b==3|| b==4 || b==5 ||b==6|| b==7 ){
			
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
	
function myFunction7(a,b) {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById(a);
	  filter = input.value.toUpperCase();
	  table = document.getElementById("det7");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[b];
	 
	if (td) {
		if(b==0 ||b==3|| b==4 || b==5 ||b==6|| b==7 ){
			
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
	
	
function myFunction8(a,b) {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById(a);
	  filter = input.value.toUpperCase();
	  table = document.getElementById("det8");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[b];
	 
	if (td) {
		if(b==0 ||b==3|| b==4 || b==5 ||b==6|| b==7 ){
			
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
	
	
function myFunction9(a,b) {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById(a);
	  filter = input.value.toUpperCase();
	  table = document.getElementById("det9");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[b];
	 
	if (td) {
		if(b==0 ||b==3|| b==4 || b==5 ||b==6|| b==7 ){
			
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
	  function myFunction10(a,b) {
		  var input, filter, table, tr, td, i;
		  input = document.getElementById(a);
		  filter = input.value.toUpperCase();
		  table = document.getElementById("det10");
		  tr = table.getElementsByTagName("tr");
		 
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[b];
		 
		if (td) {
			if(b==0 ||b==1 ){
				
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


<SCRIPT>
function fnloads(cnt){
	

		//for details from summary
		//typo=load for details
		//types=frmsum for dteails to load for instance
		location.href = "XBRL_REP_CRR0100_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
		
	}

</SCRIPT>

<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="CRR0100Form"
		enctype="multipart/form-data">
		
		<input type="hidden" id="fnloadval">
		<input type="hidden" id="savecheck">
		 <input type="hidden" id="modflg">
		 <input type="hidden" id="modtyp">
		 <input type="hidden"  value="1" id="rownoadd">
             	<div class="tab-content" >
	 	<div class="active"  id="tab2" style="width: 1000px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;"><%=reptype %> <b id="sub" style="display: none"></b></b><b>-Statement of the Maintenance of Cash Reserve Ratio<b id="sub"
					Style="display: none"></b></b></font>
			</div> 
			
			
		<ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">

	<li class=" pull-right list" onclick="functionli(10);"><a href="#tab10" data-toggle="tab"><span
							class="headingtab">10</span></a></li>


  <li class=" pull-right list" onclick="functionli(9);"><a href="#tab9" data-toggle="tab"><span
							class="headingtab">9</span></a></li>

  <li class=" pull-right list" onclick="functionli(8);"><a href="#tab8" data-toggle="tab"><span
							class="headingtab">8</span></a></li>

  <li class=" pull-right list" onclick="functionli(7);"><a href="#tab7" data-toggle="tab"><span
							class="headingtab">7</span></a></li>

  <li class=" pull-right list" onclick="functionli(6);"><a href="#tab6" data-toggle="tab"><span
							class="headingtab">6</span></a></li>

  <li class=" pull-right list" onclick="functionli(5);"><a href="#tab5" data-toggle="tab"><span
							class="headingtab">5</span></a></li>

  <li class=" pull-right list" onclick="functionli(4);"><a href="#tab4" data-toggle="tab"><span
							class="headingtab">4</span></a></li>
 
             <li class=" pull-right list" onclick="functionli(3);"><a href="#tab3" data-toggle="tab"><span
							class="headingtab">3</span></a></li>
							
					<li class=" pull-right list" onclick="functionli(2);"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" onclick="functionli(1);" ><a href="#tab1" data-toggle="tab"><span 
					class="headingtab" > 1 </span></a></li>


				</ul>
					
			
            <table class="" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> 
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></input></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
			
			
			
			 <!--******************SUMMARY SECTION 10********************************-->   		
		
				   <table class="table" id="tb10" style="width:100%;display:none;margin-top:-20px;">
						<th colspan="5" style="text-align: center;">BB: Treasury Bills in Banking and Trading Books   </th>
						
		<th rowspan="4" id="" style="width:50px;text-align:center;" style="text-align:center;">Select</th>
					</tr> 
             		
				
					<tr>
					
					<th style="width:10px;text-align:center;" rowspan="3">Srl.No</th>
						<th style="width:100px;text-align:center;" rowspan="3">Day</th>
						
						
						<th style="width:200px;text-align:center;" colspan="1">A</th>
						
						
						<th style="width:200px;text-align:center;" colspan="1">B</th>
						
						<th style="width: 200px;text-align:center;" colspan="1">C</th>
						
						<!-- <th style="width:26px" rowspan="3" id="modify">Modify</th> -->
						
					<!-- 	<th rowspan="4" id="" style="text-align:center">Select</th> -->
						
					</tr> 
					
					
					<tr>
						
						<th style="width:150px;text-align:center;" colspan="1">Date</th>
						<th style="width:150px;text-align:center;" colspan="1">Treasury Bills held in Banking Book Rs.</th>
						
						<th style="width: 150px;text-align:center;" colspan="1">Treasury Bills held in Trading Book Rs.</th>
						
												
						
					</tr> 
					
					
					<tr>
						
					
						<th style="width:150px;text-align:center;">G</th>
						
						<th style="width: 150px;text-align:center;">H</th>
						<th style="width:150px;text-align:center;">I</th>
						
						
					</tr> 
					 
					
             <tbody class="databody" id="sec10"></tbody>
          </table>
			
			
			 <!--******************SUMMARY SECTION 9********************************-->   		
		
				   <table class="table" id="tb9" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="15" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b></b>  </td></tr>
           <tr>
         			<!-- <th rowspan="6">Srl.No</th> -->
						<th colspan="2"></th>						
						
						<th></th>
						<th style="text-align: center;">Mauritius, Rupees</th>
						<th style="text-align: center;">Euro Member Countries, Euro</th>
						<th style="text-align: center;">United Kingdom, Pounds</th>
						<th style="text-align: center;">United States of America, Dollars</th>
						<th style="text-align: center;">United States of America, Dollars</th>
					
						
					<th rowspan="6" id="" style="text-align:center">Select</th>

					</tr> 
					<tr>
						<th colspan="8" style="text-align: center;">AI: Deposits from Non resident sectors (only deposits of Non-residents for segment A activities are cash ratio impossible)   </th>
						
					<!-- <th rowspan="4" id="" style="text-align:center">Select</th> -->
					</tr> 
             		
				
					<tr>
						<th style="width:150px;text-align:center;"></th>
						<th style="width: 150px"></th>
						<th style="width: 150px"></th>
						<th style="text-align: center;">Total Rupee deposits(MUR)</th>
						<th style="text-align: center;">Total Deposits denominated in foreign currencies(EURO)</th>
						<th style="text-align: center;">Total Deposits denominated in foreign currencies (GBP)</th>
						<th style="text-align: center;">Total Deposits denominated in foreign currencies (USD)</th>
						<th style="text-align: center;">USD Equivalent of all Other Foreign Currency Deposits</th>
						<!-- <th style="width:50px"></th> -->
					
						

					</tr> 
					
					
					<tr>
						<th rowspan="3">Srl.No</th>
						<th style="width:50px;text-align: center;" rowspan="2">Day</th>
						
						<th style="width:50px;text-align: center;" colspan="1">Date</th>
						<th style="width:150px;text-align: center;"></th>
						
						<th style="width: 150px;text-align: center;"></th>
						<th style="width:150px;text-align: center;"></th>
						
						<th style="width: 150px;text-align: center;"></th>
						<th  style="width:150px;text-align: center;"></th>
						 <!-- <th style="width:50px"></th>
						 -->
						
						
					</tr> 
					
					<tr>
						
						
						<th style="width:150px;text-align: center;">A</th>
						
						
						<th style="width:150px;text-align: center;">B</th>
						
						<th style="width: 150px;text-align: center;">C</th>
						<th style="width:150px;text-align: center;">D</th>
						
						<th style="width: 150px;text-align: center;">E</th>
						<th style="width:150px;text-align: center;">F</th>
						<!-- <th style="width:50px"></th> -->
						
					</tr> 
					
             <tbody class="databody" id="sec9"></tbody>
          </table>
			
			
			 <!--******************SUMMARY SECTION 8********************************-->   		
		
				   <table class="table" id="tb8" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="15" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b></b>  </td></tr>
       <tr>
         			<!-- <th rowspan="6">Srl.No</th> -->
						<th colspan="2"></th>						
						
						<th></th>
						<th style="text-align:center;">Mauritius, Rupees</th>
						<th style="text-align:center;">Euro Member Countries, Euro</th>
						<th style="text-align:center;">United Kingdom, Pounds</th>
						<th style="text-align:center;">United States of America, Dollars</th>
						<th style="text-align:center;">United States of America, Dollars</th>
					
						
					<th rowspan="6" id="" style="text-align:center">Select</th>

					</tr> 
					    <tr>
						<th colspan="8" style="text-align: center;">AH: Deposits from Other resident sectors (household and non profit institutions)    <a href="#"   name="next" class="next" style="float: right;padding-left: 10px;"></a></th>
						
				<!-- <th rowspan="4" id="" style="text-align:center">Select</th> -->
					</tr> 
             		
					
					<tr>
						<th style="width:150px;text-align:center;"></th>
						<th style="width:150px";text-align:center;></th>
						<th style="width: 150px";text-align:center;></th>
						<th style="text-align:center">Total Rupee deposits(MUR)</th>
						<th style="text-align:center">Total Deposits denominated in foreign currencies(EURO)</th>
						<th style="text-align:center">Total Deposits denominated in foreign currencies (GBP)</th>
						<th style="text-align:center">Total Deposits denominated in foreign currencies (USD)</th>
						<th style="text-align:center">USD Equivalent of all Other Foreign Currency Deposits</th>
						<!-- <th style="width:50px"></th> -->
					

					</tr> 
					
					
					<tr>
						<th style="text-align:center" rowspan="3">Srl.No</th>
						<th style="width:50px;text-align:center;" rowspan="2">Day</th>
						
						<th style="width:50px;text-align:center;" colspan="1">Date</th>
						<th style="width:150px;text-align:center;"></th>
						
						<th style="width: 150px;text-align:center;"></th>
						<th style="width:150px;text-align:center;"></th>
						
						<th style="width: 150px;text-align:center;"></th>
						<th  style="width:150px;text-align:center;"></th>
						<!-- <th style="width:50px"></th> -->
						
						
						
					</tr> 
					
					<tr>
						
						
						<th style="width:150px;text-align:center;">A</th>
						
						<th style="width:150px;text-align:center;">B</th>
						
						<th style="width: 150px;text-align:center;">C</th>
						<th style="width:150px;text-align:center;">D</th>
						
						<th style="width: 150px;text-align:center;">E</th>
						<th style="width:150px;text-align:center;">F</th>
						<!-- <th style="width:50px"></th> -->
						
					</tr> 
					
             <tbody class="databody" id="sec8"></tbody>
          </table>
			
		  <!--******************SUMMARY SECTION 7********************************-->   		
		
				   <table class="table" id="tb7" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="15" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b></b>  </td></tr>
         <tr>
         			<!-- <th rowspan="6">Srl.No</th> -->
						<th colspan="2"></th>						
						
						<th></th>
						<th style="text-align:center">Mauritius, Rupees</th>
						<th style="text-align:center">Euro Member Countries, Euro</th>
						<th style="text-align:center">United Kingdom, Pounds</th>
						<th style="text-align:center">United States of America, Dollars</th>
						<th style="text-align:center">United States of America, Dollars</th>
					
						
					<th rowspan="6" id="" style="text-align:center">Select</th>

					</tr> 
					 <tr>
						<th colspan="8" style="text-align: center;">AG: Deposits from other non financial corporations (including deposits from GBC2 involving in segment A activities)   <a href="#"   name="next" class="next" style="float: right;padding-left: 10px;"></a></th>
						<!-- <th rowspan="4" id="" style="text-align:center">Select</th> -->

					</tr> 
             		
					
					<tr>
						<th style="width:150px"></th>
						<th style="width:150px"></th>
						<th style="width: 150px"></th>
						<th style="text-align:center">Total Rupee deposits(MUR)</th>
						<th style="text-align:center">Total Deposits denominated in foreign currencies(EURO)</th>
						<th style="text-align:center">Total Deposits denominated in foreign currencies (GBP)</th>
						<th style="text-align:center">Total Deposits denominated in foreign currencies (USD)</th>
						<th style="text-align:center">USD Equivalent of all Other Foreign Currency Deposits</th>
						<!-- <th style="width:50px"></th> -->
					
						


					</tr> 
					
					
					<tr>
						<th style="text-align:center" rowspan="3">Srl.No</th>
						<th style="width:50px;text-align:center" rowspan="2">Day</th>
						
						<th style="width:50px;text-align:center" colspan="1">Date</th>
						<th style="width:150px"></th>
						
						<th style="width: 150px"></th>
						<th style="width:150px"></th>
						
						<th style="width: 150px"></th>
						<th  style="width:150px"></th>
						<!-- <th style="width:50px"></th> -->
						
						
						
					</tr> 
					
					<tr>
						
						
						<th style="width:150px;text-align:center">A</th>
						
						
						<th style="width:150px;text-align:center">B</th>
						
						<th style="width: 150px;text-align:center">C</th>
						<th style="width:150px;text-align:center">D</th>
						
						<th style="width: 150px;text-align:center">E</th>
						<th style="width:150px;text-align:center">F</th>
						<!-- <th style="width:50px"></th> -->
						
					</tr>
             <tbody class="databody" id="sec7"></tbody>
          </table>
		 
		  <!--******************SUMMARY SECTION 6********************************-->   		
		
				   <table class="table" id="tb6" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="15" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b></b>  </td></tr>
          <tr>
         			<!-- <th rowspan="6">Srl.No</th> -->
						<th colspan="2"></th>						
						
						<th></th>
						<th style="text-align:center;">Mauritius, Rupees</th>
						<th style="text-align:center;">Euro Member Countries, Euro</th>
						<th style="text-align:center;">United Kingdom, Pounds</th>
						<th style="text-align:center;">United States of America, Dollars</th>
						<th style="text-align:center;">United States of America, Dollars</th>
					
						
					<th rowspan="6" id="" style="text-align:center">Select</th>

					</tr> 
					<tr>
<th colspan="8" style="text-align: center;">AF: Deposits from public nonfinancial corporations   <a href="#"   name="next" class="next" style="float: right;padding-left: 10px;"></a> <a href="#"  name="prev" class="previous" style="float: right;"></a></th>
					
					<!-- <th rowspan="4" id="" style="text-align:center">Select</th> -->
					</tr> 
             		
					
					<tr>
						<th style="width:150px"></th>
						<th style="width:150px"></th>
						<th style="width: 150px"></th>
						<th style="text-align:center;">Total Rupee deposits(MUR)</th>
						<th style="text-align:center;">Total Deposits denominated in foreign currencies(EURO)</th>
						<th style="text-align:center;">Total Deposits denominated in foreign currencies (GBP)</th>
						<th style="text-align:center;">Total Deposits denominated in foreign currencies (USD)</th>
						<th style="text-align:center;">USD Equivalent of all Other Foreign Currency Deposits</th>
						<!-- <th style="width:50px"></th> -->
					
						

					</tr> 
					
					
					<tr>
						<th rowspan="3" style="text-align:center;">Srl.No</th>
						<th style="width:50px;text-align:center;" rowspan="2">Day</th>
						
						<th style="width:50px;text-align:center;" colspan="1">Date</th>
						<th style="width:150px"></th>
						
						<th style="width: 150px"></th>
						<th style="width:150px"></th>
						
						<th style="width: 150px"></th>
						<th  style="width:150px"></th>
						<!-- <th style="width:50px"></th> -->
						
						
						
					</tr> 
					
					<tr>
						
						
						<th style="width:150px;text-align:center;">A</th>
								
						<th style="width:150px;text-align:center;">B</th>
						
						<th style="width: 150px;text-align:center;">C</th>
						<th style="width:150px;text-align:center;">D</th>
						
						<th style="width: 150px;text-align:center;">E</th>
						<th style="width:150px;text-align:center;">F</th>
						<!-- <th style="width:50px"></th> -->
						
					</tr> 
					
             <tbody class="databody" id="sec6"></tbody>
          </table>
		  <!--******************SUMMARY SECTION 5********************************-->   		
		
				   <table class="table" id="tb5" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="15" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b></b>  </td></tr>
          <tr>
         			<!-- <th rowspan="6">Srl.No</th> -->
						<th colspan="2"></th>						
						
						<th></th>
						<th style="text-align:center;">Mauritius, Rupees</th>
						<th style="text-align:center;">Euro Member Countries, Euro</th>
						<th style="text-align:center;">United Kingdom, Pounds</th>
						<th style="text-align:center;">United States of America, Dollars</th>
						<th style="text-align:center;">United States of America, Dollars</th>
					
						
					<th rowspan="6" id="" style="text-align:center">Select</th>

					</tr> 
					 <tr>

<th colspan="8" style="text-align: center;">AE: Deposits from State and local government   <a href="#"   name="next" class="next" style="float: right;padding-left: 10px;"></a> <a href="#"  name="prev" class="previous" style="float: right;"></a></th>
											
											<!-- <th rowspan="4" id="" style="text-align:center">Select</th> -->
											</tr> 
             		
					
					<tr>
						<th style="width:150px"></th>
						<th style="width:150px"></th>
						<th style="width: 150px"></th>
						<th style="text-align:center;">Total Rupee deposits(MUR)</th>
						<th style="text-align:center;">Total Deposits denominated in foreign currencies(EURO)</th>
						<th  style="text-align:center;">Total Deposits denominated in foreign currencies (GBP)</th>
						<th style="text-align:center;">Total Deposits denominated in foreign currencies (USD)</th>
						<th style="text-align:center;">USD Equivalent of all Other Foreign Currency Deposits</th>
						<!-- <th style="width:50px"></th> -->
					
					

					</tr> 
					
					
					<tr>
						<th style="text-align:center;" rowspan="3">Srl.No</th>
						<th style="width:50px;text-align:center;" rowspan="2">Day</th>
						
						<th style="width:50px;text-align:center;" colspan="1">Date</th>
						<th style="width:150px"></th>
						
						<th style="width: 150px"></th>
						<th style="width:150px"></th>
						
						<th style="width: 150px"></th>
						<th  style="width:150px"></th>
						<!-- <th style="width:50px"></th> -->
						
						
						
					</tr> 
					
					<tr>
						
						
						<th style="width:150px;text-align:center;">A</th>
						
						
						<th style="width:150px;text-align:center;">B</th>
						
						<th style="width: 150px;text-align:center;">C</th>
						<th style="width:150px;text-align:center;">D</th>
						
						<th style="width: 150px;text-align:center;">E</th>
						<th style="width:150px;text-align:center;">F</th>
						<!-- <th style="width:50px"></th> -->
						
					</tr> 
					
             <tbody class="databody" id="sec5"></tbody>
          </table>
		 
		  <!--******************SUMMARY SECTION 4********************************-->   		
		
				   <table class="table" id="tb4" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="15" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b></b>  </td></tr>
          <tr>
         			<!-- <th rowspan="6">Srl.No</th> -->
						<th colspan="2"></th>						
						
						<th></th>
						<th style="text-align:center;">Mauritius, Rupees</th>
						<th style="text-align:center;">Euro Member Countries, Euro</th>
						<th style="text-align:center;">United Kingdom, Pounds</th>
						<th style="text-align:center;">United States of America, Dollars</th>
						<th style="text-align:center;">United States of America, Dollars</th>
					
						
					<th rowspan="6" id="" style="text-align:center">Select</th>

					</tr> 
					 <tr>

               <th colspan="8" style="text-align: center;">AD: Deposits from Central Government  <a href="#"   name="next" class="next" style="float: right;padding-left: 10px;"></a></th>
					
					<!-- <th rowspan="4" id="" style="text-align:center">Select</th> -->
					</tr> 
             		
					
					<tr>
						<th style="width:150px"></th>
						<th style="width:150px"></th>
						<th style="width: 150px"></th>
						<th style="text-align:center;">Total Rupee deposits(MUR)</th>
						<th style="text-align:center;">Total Deposits denominated in foreign currencies(EURO)</th>
						<th style="text-align:center;">Total Deposits denominated in foreign currencies (GBP)</th>
						<th style="text-align:center;">Total Deposits denominated in foreign currencies (USD)</th>
						<th style="text-align:center;">USD Equivalent of all Other Foreign Currency Deposits</th>
						<!-- <th style="width:50px"></th> -->
					

					</tr> 
					
					
					<tr>
						<th style="text-align:center;" rowspan="3">Srl.No</th>
						<th style="width:50px;text-align:center;" rowspan="2">Day</th>
						
						<th style="width:50px;text-align:center;" colspan="1">Date</th>
						<th style="width:150px"></th>
						
						<th style="width: 150px"></th>
						<th style="width:150px"></th>
						
						<th style="width: 150px"></th>
						<th  style="width:150px"></th>
						<!-- <th style="width:50px"></th> -->
						
						
						
					</tr> 
					
					<tr>
						
						
						<th style="width:150px;text-align:center;">A</th>
						
						
						<th style="width:150px;text-align:center;">B</th>
						
						<th style="width: 150px;text-align:center;">C</th>
						<th style="width:150px;text-align:center;">D</th>
						
						<th style="width: 150px;text-align:center;">E</th>
						<th style="width:150px;text-align:center;">F</th>
						<!-- <th style="width:50px"></th> -->
						
					</tr> 
					
             <tbody class="databody" id="sec4"></tbody>
          </table>
          
			 <!--******************SUMMARY SECTION 3********************************-->   		
		
				   <table class="table" id="tb3" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="15" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b></b>  </td></tr>
        <tr>
         			<!-- <th rowspan="6">Srl.No</th> -->
						<th colspan="2"></th>						
						
						<th></th>
						<th style="text-align:center;">Mauritius, Rupees</th>
						<th style="text-align:center;">Euro Member Countries, Euro</th>
						<th style="text-align:center;">United Kingdom, Pounds</th>
						<th style="text-align:center;">United States of America, Dollars</th>
						<th style="text-align:center;">United States of America, Dollars</th>
					
						
					<th rowspan="6" id="" style="text-align:center">Select</th>

					</tr> 
					   <tr>
	               <th colspan="8" style="text-align: center;">AC: Deposits from other financial corporations(public financial corporations, deposits of GBC1 involved in segment A activities and rest of other financial corporations)    <a href="#"   name="next" class="next" style="float: right;padding-left: 10px;"></a></th>						
	
					<!-- <th rowspan="4" id="" style="text-align:center">Select</th> -->
	
						</tr> 
	             		
						
						<tr>
							<th style="width:150px"></th>
							<th style="width: 150px"></th>
							<th style="width: 150px"></th>
							<th style="text-align:center;">Total Rupee deposits(MUR)</th>
							<th style="text-align:center;">Total Deposits denominated in foreign currencies(EURO)</th>
							<th style="text-align:center;">Total Deposits denominated in foreign currencies (GBP)</th>
							<th style="text-align:center;">Total Deposits denominated in foreign currencies (USD)</th>
							<th style="text-align:center;">USD Equivalent of all Other Foreign Currency Deposits</th>
							<!-- <th style="width:50px"></th> -->
						
	
						</tr> 
						
						
						<tr>
							<th style="text-align:center;" rowspan="3">Srl.No</th>
						<th style="width:50px;text-align:center;" rowspan="2">Day</th>
						
						<th style="width:50px;text-align:center;" colspan="1">Date</th>
							<th style="width:150px"></th>
							
							<th style="width: 150px"></th>
							<th style="width:150px"></th>
							
							<th style="width: 150px"></th>
							<th  style="width:150px"></th>
							<!-- <th style="width:50px"></th> -->
							
							
							
						</tr> 
						
						<tr>
							
							
							<th style="width:150px;text-align:center;">A</th>
							
							
							<th style="width:150px;text-align:center;">B</th>
							
							<th style="width: 150px;text-align:center;">C</th>
							<th style="width:150px;text-align:center;">D</th>
						
						<th style="width: 150px;text-align:center;">E</th>
						<th style="width:150px;text-align:center;">F</th>
						<!-- <th style="width:50px"></th> -->
							
						</tr> 
						
						
             <tbody class="databody" id="sec3"></tbody>
          </table>
	 <!--******************SUMMARY SECTION2********************************-->   			
			
            <table class="table" id="tb2" style="width:100%;display:none;margin-top:-20px;"><tr><td colspan="13" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b></b>  </td></tr>
           
           <tr>
         			<!-- <th rowspan="6">Srl.No</th> -->
						<th colspan="2"></th>						
						
						<th></th>
						<th style="text-align:center;">Mauritius, Rupees</th>
						<th style="text-align:center;">Euro Member Countries, Euro</th>
						<th style="text-align:center;">United Kingdom, Pounds</th>
						<th style="text-align:center;">United States of America, Dollars</th>
						<th style="text-align:center;">United States of America, Dollars</th>
					
						
					<th rowspan="6" id="" style="text-align:center">Select</th>

					</tr> 
          <tr>
						<th colspan="8" style="text-align: center;">AB: Deposits from Other depository corporations(Banks, non-bank deposit taking institutions and credit unions)      <a href="#"   name="next" id="next" class="next" style="float: right;padding-left: 10px;"></a> </th>
						
						<!-- <th rowspan="4" id="" style="text-align:center">Select</th> -->
					</tr> 
             		
					
					<tr>
						<th style="width:150px;text-align: center;"></th>
						
						<th style="width: 150px;text-align: center;"></th>
						<th style="width: 150px;text-align: center;"></th>
						<th style="text-align:center;">Total Rupee deposits(MUR)</th>
						<th style="text-align:center;">Total Deposits denominated in foreign currencies(EURO)</th>
						<th style="text-align:center;">Total Deposits denominated in foreign currencies (GBP)</th>
						<th style="text-align:center;">Total Deposits denominated in foreign currencies (USD)</th>
						<th style="text-align:center;">USD Equivalent of all Other Foreign Currency Deposits</th>
						<!-- <th style="width:50px"></th> -->


					</tr> 
					
					
					<tr>
					<th rowspan="3" style="text-align:center;">Srl.No</th>
						<th style="width:50px;text-align: center;" rowspan="2">Day</th>
						
						<th style="width:50px;text-align: center;" colspan="1">Date</th>
						<th style="width:150px"></th>
						
						<th style="width: 150px"></th>
						<th style="width:150px"></th>
						
						<th style="width: 150px"></th>
						<th  style="width:150px"></th>
						<!-- <th style="width:50px"></th> -->				
						</tr> 
					
					<tr>
						
					
						<th style="width:150px;text-align:center;">A</th>
						
						
						<th style="width:150px;text-align:center;">B</th>
						
						<th style="width: 150px;text-align:center;">C</th>
						<th style="width:150px;text-align:center;">D</th>
						
						<th style="width: 150px;text-align:center;">E</th>
						<th style="width:150px;text-align:center;">F</th>
						<!-- <th style="width:50px"></th> -->
						
					</tr> 
					
					
					
					
             <tbody class="databody" id="sec2"></tbody>
          </table>
          
  <!--******************SUMMARY SECTION1********************************-->   
               
               <table class="table" id="tb1" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="13" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>
          </b>  </td>
          
          
          </tr>
          
         <tr>
         			<!-- <th rowspan="6">Srl.No</th> -->
						<th colspan="2"></th>						
						
						<th></th>
						<th style="text-align:center;">Mauritius, Rupees</th>
						<th style="text-align:center;">Euro Member Countries, Euro</th>
						<th style="text-align:center;">United Kingdom, Pounds</th>
						<th style="text-align:center;">United States of America, Dollars</th>
						<th style="text-align:center;">United States of America, Dollars</th>
					
						
					<th rowspan="6" id="" style="text-align:center">Select</th>

					</tr> 
					
             
             		<tr>
						<th colspan="8" style="text-align: center;">Eligible Deposits for Maintenance of Cash Reserve Ratio (based on sectoral balance sheet)   </th>
						

					</tr> 
					
					
             		<tr>
						<th colspan="8" style="text-align: center;">AA: Deposits Liabilities to be imposable for CRR from all sectors </th>
						

					</tr> 
            		
					
					<tr>
							<th colspan="2" rowspan="2" style="width:150px"></th>
							
							<th rowspan="1" colspan="1" style="width: 150px">Date</th>
							<th style="text-align:center;">Total Rupee deposits(MUR)</th>
							<th style="text-align:center;">Total Deposits denominated in foreign currencies(EURO)</th>
							<th style="text-align:center;">Total Deposits denominated in foreign currencies (GBP)</th>
							<th style="text-align:center;">Total Deposits denominated in foreign currencies (USD)</th>
							<th style="text-align:center;">USD Equivalent of all Other Foreign Currency  </th>
							
	
	
						</tr> 
						
						
						<tr>
														
							
							<!-- <th rowspan="2" style="width:150px">Line No</th>
							<th rowspan="2" style="width:150px">Day </th> -->
							
							<th style="width:150px;text-align:center;"></th>
							<th style="width:150px;text-align:center;">(i+ii+iii+iv+v+vi+vii+viii)</th>
							<th style="width:150px;text-align:center;">(i+ii+iii+iv+v+vi+vii+viii)</th>
							<th style="width:150px;text-align:center;">(i+ii+iii+iv+v+vi+vii+viii)</th>
							<th style="width:150px;text-align:center;">(i+ii+iii+iv+v+vi+vii+viii)</th>
							<th style="width:150px;text-align:center;">(i+ii+iii+iv+v+vi+vii+viii)</th>
							
							
							
						</tr> 
					
				
					
					
				<!-- <thead>
					
					<tbody class="databody">
					 -->
					
					<tr>
					
					<th rowspan="2" style="width:150px;text-align:center;">Line No</th>
							<th rowspan="2" style="width:150px;text-align:center;">Day </th>
							
						<!-- 	<th  style="width:150px">A</th>
							<th style="width:150px" >B </th> -->
							<th  style="width:150px;text-align:center;">A</th>
							<th style="width:150px;text-align:center;" >B </th>
							<th style="width:150px;text-align:center;">C</th>
							<th style="width:150px;text-align:center;">D</th>
							<th style="width:150px;text-align:center;">E</th>
							<th style="width:150px;text-align:center;">F</th>
							<!-- <th style="width:150px"></th> -->
							
 
    
          </tr>  
          
           <tbody class="databody" id="sec1"></tbody>
          </table>
          
          
          
            <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary btnhome" >Home</button>
     <!--  <button type="button" class="btn btn-xs btn-primary"   value="back" id="btnpre">Previous</button> -->
    
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
       <!-- <button type="button" class="btn btn-xs btn-primary"   value="back" id="btnnext">Next</button> -->
      <button type="button" class="btn btn-xs btn-primary btnback" value="back" >Back</button></div>
          
            </div>
            
         
             	<div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			<div class="active" id="tab1" style="width: 1025px;padding-top: 1px;margin-top: -17px;" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>
			<b id="sub"
					Style="display: none"></b></b></font>
			<br>
			<b style="font-size: 13px;">CRR0100 -Statement of the Maintenance of Cash Reserve Ratio
			 <b id="sub" style="display: none"></b></b><br><br>
			</div>
			<div id="divLoading"> 
    </div>
   
    <ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">

					<li class=" pull-right list" onclick="funli(10);" id="li10"><a href="#btndetb10" data-toggle="tab"><span
							class="headingtab">10</span></a></li>
					

					<li class=" pull-right list" onclick="funli(9);" id="li9"><a href="#btndetb9" data-toggle="tab"><span
							class="headingtab">9</span></a></li>
					


					<li class=" pull-right list" onclick="funli(8);" id="li8"><a href="#btndetb8" data-toggle="tab"><span
							class="headingtab">8</span></a></li>
					
					
					<li class=" pull-right  list" onclick="funli(7);" id="li7" ><a href="#btndetb7"
						data-toggle="tab"><span class="headingtab" >
								7 </span></a></li>


					<li class=" pull-right list" onclick="funli(6);" id="li6"><a href="#btndetb6" data-toggle="tab"><span
							class="headingtab">6</span></a></li>
					
					
					<li class=" pull-right list" onclick="funli(5);"id="li5" ><a href="#btndetb5"
						data-toggle="tab"><span class="headingtab" >
								5</span></a></li>

  
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
				
   
   
   
   
           <table class="" id="ad" style="width:1025px;height:50px;  ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;">
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></input></font></td><td style="text-align:center;background-color: #bbc3cb;width:290px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab1" data-toggle="tab" id="sumfirst"><span class="headingtab"  >Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a><a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></td></tr>
          		  </table>
       
            


<div class="panel panel-primary filterable">
           
				   <table class="table" id="detb1" style="width:100%;display:none;margin-top:-20px;">   <thead>
            
            
					 <tr class="filters">
					 	
						<th style="width:80px;text-align:center;"><textarea type="text" style="width:80px;text-align:center;" onkeyup="myFunction1(this.id,0)"class="form-control2" id="accno1" placeholder=" Account Number" disabled></textarea></th>
						<th style="width:280px;text-align:center"><textarea type="text" style="width:280px;text-align:center"onkeyup="myFunction1(this.id,1)"class="form-control2" id="accname1"  placeholder=" Account Name" disabled></textarea></th>						
						<th style="width:64px;text-align:center"><textarea type="text" style="width:64px;text-align:center"onkeyup="myFunction1(this.id,2)"class="form-control2" id="cusid1"  placeholder="Customer Id " disabled></textarea></th>
						<th style="width:99px;text-align:center"><textarea type="text" style="width:99px;text-align:center"onkeyup="myFunction1(this.id,3)"class="form-control2" id="accbalamtac1"  placeholder="Account Balance Amount Ac" disabled></textarea></th>
						<th style="width:53px;text-align:center"><textarea type="text" style="width:53px;text-align:center" onkeyup="myFunction1(this.id,4)"class="form-control2" id="accrcode1"  placeholder=" Account Currency Code" disabled></textarea></th>
						<th style="width:150px;text-align:center"><textarea type="text" style="width:150px;text-align:center" onkeyup="myFunction1(this.id,5)"class="form-control2" id="natofcus1"  placeholder="Nature Of Customer" disabled></textarea></th>
						<th style="width:63px;text-align:center"><textarea type="text" style="width:63px;text-align:center" onkeyup="myFunction1(this.id,6)"class="form-control2" id="reportdate1"  placeholder="Report Date" disabled ></textarea></th>
						
										
						
						<th style="width:100px;text-align:center" id="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det1">



              </tbody>
              
				</table>
				
		
           
				   <table class="table" id="detb2" style="width:100%;display:none;margin-top:-20px;">   <thead>
            
            
					 <tr class="filters">
					 	
						<th style="width:80px;text-align:center;"><textarea type="text" style="width:80px;text-align:center;" onkeyup="myFunction2(this.id,0)"class="form-control2" id="accno2" placeholder=" Account Number" disabled></textarea></th>
						<th style="width:280px;text-align:center"><textarea type="text"   style="width:280px;text-align:center" onkeyup="myFunction2(this.id,1)"class="form-control2" id="accname2"  placeholder=" Account Name" disabled></textarea></th>						
						<th  style="width:64px;text-align:center"><textarea type="text" style="width:64px;text-align:center"onkeyup="myFunction2(this.id,2)"class="form-control2" id="cusid2"  placeholder="Customer Id " disabled></textarea></th>
						<th style="width:99px;text-align:center"><textarea type="text" style="width:99px;text-align:center"onkeyup="myFunction2(this.id,3)"class="form-control2" id="accbalamtac2"  placeholder="Account Balance Amount Ac" disabled></textarea></th>
						<th style="width:53px;text-align:center"><textarea type="text" style="width:53px;text-align:center"onkeyup="myFunction2(this.id,4)"class="form-control2" id="accrcode2"  placeholder=" Account Currency Code" disabled></textarea></th>
						<th style="width:150px;text-align:center"><textarea type="text" style="width:150px;text-align:center" onkeyup="myFunction2(this.id,5)"class="form-control2" id="natofcus2"  placeholder="Nature Of Customer" disabled></textarea></th>
						<th style="width:63px;text-align:center"><textarea type="text" style="width:63px;text-align:center" onkeyup="myFunction2(this.id,6)"class="form-control2" id="reportdate2"  placeholder="Report Date" disabled ></textarea></th>
						
										
						
						<th id="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det2">



              </tbody>
              
				</table>
				
		
				   <table class="table" id="detb3" style="width:100%;display:none;margin-top:-20px;">   <thead>
            
            
					 <tr class="filters">
					 	
						<th  style="width:80px;text-align:center;"><textarea type="text" style="width:80px;text-align:center;" onkeyup="myFunction3(this.id,0)"class="form-control2" id="accno3" placeholder=" Account Number" disabled></textarea></th>
						<th  style="width:280px;text-align:center"><textarea type="text" style="width:280px;text-align:center"onkeyup="myFunction3(this.id,1)"class="form-control2" id="accname3"  placeholder=" Account Name" disabled></textarea></th>						
						<th  style="width:64px;text-align:center" ><textarea type="text" style="width:64px;text-align:center"onkeyup="myFunction3(this.id,2)"class="form-control2" id="cusid3"  placeholder="Customer Id " disabled></textarea></th>
						<th  style="width:99px;text-align:center"><textarea type="text" style="width:99px;text-align:center"onkeyup="myFunction3(this.id,3)"class="form-control2" id="accbalamtac3"  placeholder="Account Balance Amount Ac" disabled></textarea></th>
						<th  style="width:53px;text-align:center"><textarea type="text" style="width:53px;text-align:center"onkeyup="myFunction3(this.id,4)"class="form-control2" id="accrcode3"  placeholder=" Account Currency Code" disabled></textarea></th>
						<th  style="width:150px;text-align:center"><textarea type="text" style="width:150px;text-align:center" onkeyup="myFunction3(this.id,5)"class="form-control2" id="natofcus3"  placeholder="Nature Of Customer" disabled></textarea></th>
						<th  style="width:63px;text-align:center"><textarea type="text" style="width:63px;text-align:center" onkeyup="myFunction3(this.id,6)"class="form-control2" id="reportdate3"  placeholder="Report Date" disabled ></textarea></th>
						
										
						
						<th id="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det3">



              </tbody>
              
				</table>
				
		
           
				   <table class="table" id="detb4" style="width:100%;display:none;margin-top:-20px;">   <thead>
            
            
					 <tr class="filters">
					 	
						<th  style="width:80px;text-align:center"><textarea type="text" style="width:80px;text-align:center;" onkeyup="myFunction4(this.id,0)"class="form-control2" id="accno4" placeholder=" Account Number" disabled></textarea></th>
						<th  style="width:280px;text-align:center"><textarea type="text" style="width:280px;text-align:center"onkeyup="myFunction4(this.id,1)"class="form-control2" id="accname4"  placeholder=" Account Name" disabled></textarea></th>						
						<th  style="width:64px;text-align:center"><textarea type="text" style="width:64px;text-align:center"onkeyup="myFunction4(this.id,2)"class="form-control2" id="cusid4"  placeholder="Customer Id " disabled></textarea></th>
						<th  style="width:99px;text-align:center"><textarea type="text" style="width:99px;text-align:center"onkeyup="myFunction4(this.id,3)"class="form-control2" id="accbalamtac4"  placeholder="Account Balance Amount Ac" disabled></textarea></th>
						<th  style="width:53px;text-align:center"><textarea type="text" style="width:53px;text-align:center"onkeyup="myFunction4(this.id,4)"class="form-control2" id="accrcode4"  placeholder=" Account Currency Code" disabled></textarea></th>
						<th  style="width:150px;text-align:center"><textarea type="text" style="width:150px;text-align:center" onkeyup="myFunction4(this.id,5)"class="form-control2" id="natofcus4"  placeholder="Nature Of Customer" disabled></textarea></th>
						<th  style="width:63px;text-align:center"><textarea type="text" style="width:63px;text-align:center" onkeyup="myFunction4(this.id,6)"class="form-control2" id="reportdate4"  placeholder="Report Date" disabled ></textarea></th>
						
										
						
						<th id="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det4">



              </tbody>
              
				</table>
				
		
				   <table class="table" id="detb5" style="width:100%;display:none;margin-top:-20px;">   <thead>
            
            
					 <tr class="filters">
					 	
						<th style="width:80px;text-align:center;"><textarea type="text" style="width:80px;text-align:center;" onkeyup="myFunction5(this.id,0)"class="form-control2" id="accno5" placeholder=" Account Number" disabled></textarea></th>
						<th style="width:280px;text-align:center;"><textarea type="text" style="width:280px;text-align:center"onkeyup="myFunction5(this.id,1)"class="form-control2" id="accname5"  placeholder=" Account Name" disabled></textarea></th>						
						<th style="width:64px;text-align:center;"><textarea type="text" style="width:64px;text-align:center"onkeyup="myFunction5(this.id,2)"class="form-control2" id="cusid5"  placeholder="Customer Id " disabled></textarea></th>
						<th style="width:99px;text-align:center;"><textarea type="text" style="width:99px;text-align:center"onkeyup="myFunction5(this.id,3)"class="form-control2" id="accbalamtac5"  placeholder="Account Balance Amount Ac" disabled></textarea></th>
						<th style="width:53px;text-align:center;"><textarea type="text" style="width:53px;text-align:center"onkeyup="myFunction5(this.id,4)"class="form-control2" id="accrcode5"  placeholder=" Account Currency Code" disabled></textarea></th>
						<th style="width:150px;text-align:center;"><textarea type="text" style="width:150px;text-align:center" onkeyup="myFunction5(this.id,5)"class="form-control2" id="natofcus5"  placeholder="Nature Of Customer" disabled></textarea></th>
						<th style="width:63px;text-align:center;"><textarea type="text" style="width:63px;text-align:center" onkeyup="myFunction5(this.id,6)"class="form-control2" id="reportdate5"  placeholder="Report Date" disabled ></textarea></th>
						
										
						
						<th id="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det5">



              </tbody>
              
				</table>
	
           
				   <table class="table" id="detb6" style="width:100%;display:none;margin-top:-20px;">   <thead>
            
            
					 <tr class="filters">
					 	
						<th style="width:80px;text-align:center;"><textarea type="text" style="width:80px;text-align:center;" onkeyup="myFunction6(this.id,0)"class="form-control2" id="accno6" placeholder=" Account Number" disabled></textarea></th>
						<th style="width:280px;text-align:center;"><textarea type="text" style="width:280px;text-align:center"onkeyup="myFunction6(this.id,1)"class="form-control2" id="accname6"  placeholder=" Account Name" disabled></textarea></th>						
						<th style="width:64px;text-align:center;"><textarea type="text" style="width:64px;text-align:center"onkeyup="myFunction6(this.id,2)"class="form-control2" id="cusid6"  placeholder="Customer Id " disabled></textarea></th>
						<th style="width:99px;text-align:center;"><textarea type="text" style="width:99px;text-align:center"onkeyup="myFunction6(this.id,3)"class="form-control2" id="accbalamtac6"  placeholder="Account Balance Amount Ac" disabled></textarea></th>
						<th style="width:53px;text-align:center;"><textarea type="text" style="width:53px;text-align:center"onkeyup="myFunction6(this.id,4)"class="form-control2" id="accrcode6"  placeholder=" Account Currency Code" disabled></textarea></th>
						<th style="width:150px;text-align:center;"><textarea type="text" style="width:150px;text-align:center" onkeyup="myFunction6(this.id,5)"class="form-control2" id="natofcus6"  placeholder="Nature Of Customer" disabled></textarea></th>
						<th style="width:63px;text-align:center;"><textarea type="text" style="width:63px;text-align:center" onkeyup="myFunction6(this.id,6)"class="form-control2" id="reportdate6"  placeholder="Report Date" disabled ></textarea></th>
						
										
						
						<th id="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det6">



              </tbody>
              
				</table>
	
				   <table class="table" id="detb7" style="width:100%;display:none;margin-top:-20px;">   <thead>
            
            
					 <tr class="filters">
					 	
						<th style="width:80px;text-align:center;"><textarea type="text" style="width:80px;text-align:center;" onkeyup="myFunction7(this.id,0)"class="form-control2" id="accno7" placeholder=" Account Number" disabled></textarea></th>
						<th style="width:280px;text-align:center;"><textarea type="text" style="width:280px;text-align:center"onkeyup="myFunction7(this.id,1)"class="form-control2" id="accname7"  placeholder=" Account Name" disabled></textarea></th>						
						<th style="width:64px;text-align:center;"><textarea type="text" style="width:64px;text-align:center"onkeyup="myFunction7(this.id,2)"class="form-control2" id="cusid7"  placeholder="Customer Id " disabled></textarea></th>
						<th style="width:99px;text-align:center;"><textarea type="text" style="width:99px;text-align:center"onkeyup="myFunction7(this.id,3)"class="form-control2" id="accbalamtac7"  placeholder="Account Balance Amount Ac" disabled></textarea></th>
						<th style="width:53px;text-align:center;"><textarea type="text" style="width:53px;text-align:center"onkeyup="myFunction7(this.id,4)"class="form-control2" id="accrcode7"  placeholder=" Account Currency Code" disabled></textarea></th>
						<th style="width:150px;text-align:center;"><textarea type="text" style="width:150px;text-align:center" onkeyup="myFunction7(this.id,5)"class="form-control2" id="natofcus7"  placeholder="Nature Of Customer" disabled></textarea></th>
						<th style="width:63px;text-align:center;"><textarea type="text" style="width:63px;text-align:center" onkeyup="myFunction7(this.id,6)"class="form-control2" id="reportdate7"  placeholder="Report Date" disabled ></textarea></th>
						
										
						
						<th id="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det7">



              </tbody>
              
				</table>
	
				   <table class="table" id="detb8" style="width:100%;display:none;margin-top:-20px;">   <thead>
            
            
					 <tr class="filters">
					 	
						<th style="width:80px;text-align:center;"><textarea type="text" style="width:80px;text-align:center;" onkeyup="myFunction8(this.id,0)"class="form-control2" id="accno8" placeholder=" Account Number" disabled></textarea></th>
						<th style="width:280px;text-align:center;"><textarea type="text" style="width:280px;text-align:center"onkeyup="myFunction8(this.id,1)"class="form-control2" id="accname8"  placeholder=" Account Name" disabled></textarea></th>						
						<th style="width:64px;text-align:center;"><textarea type="text" style="width:64px;text-align:center"onkeyup="myFunction8(this.id,2)"class="form-control2" id="cusid8"  placeholder="Customer Id " disabled></textarea></th>
						<th style="width:99px;text-align:center;"><textarea type="text" style="width:99px;text-align:center"onkeyup="myFunction8(this.id,3)"class="form-control2" id="accbalamtac8"  placeholder="Account Balance Amount Ac" disabled></textarea></th>
						<th style="width:53px;text-align:center;"><textarea type="text" style="width:53px;text-align:center"onkeyup="myFunction8(this.id,4)"class="form-control2" id="accrcode8"  placeholder=" Account Currency Code" disabled></textarea></th>
						<th style="width:150px;text-align:center;"><textarea type="text" style="width:150px;text-align:center" onkeyup="myFunction8(this.id,5)"class="form-control2" id="natofcus8"  placeholder="Nature Of Customer" disabled></textarea></th>
						<th style="width:63px;text-align:center;"><textarea type="text" style="width:63px;text-align:center" onkeyup="myFunction8(this.id,6)"class="form-control2" id="reportdate8"  placeholder="Report Date" disabled ></textarea></th>
						
										
						
						<th id="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det8">



              </tbody>
              
				</table>
		
				   <table class="table" id="detb9" style="width:100%;display:none;margin-top:-20px;">   <thead>
            
            
					 <tr class="filters">
					 	
						<th style="width:80px;text-align:center;"><textarea type="text" style="width:80px;text-align:center;" onkeyup="myFunction9(this.id,0)"class="form-control2" id="accno9" placeholder=" Account Number" disabled></textarea></th>
						<th style="width:280px;text-align:center;"><textarea type="text" style="width:280px;text-align:center"onkeyup="myFunction9(this.id,1)"class="form-control2" id="accname9"  placeholder=" Account Name" disabled></textarea></th>						
						<th style="width:64px;text-align:center;"><textarea type="text" style="width:64px;text-align:center"onkeyup="myFunction9(this.id,2)"class="form-control2" id="cusid9"  placeholder="Customer Id " disabled></textarea></th>
						<th style="width:99px;text-align:center;"><textarea type="text" style="width:99px;text-align:center"onkeyup="myFunction9(this.id,3)"class="form-control2" id="accbalamtac9"  placeholder="Account Balance Amount Ac" disabled></textarea></th>
						<th style="width:53px;text-align:center;"><textarea type="text" style="width:53px;text-align:center"onkeyup="myFunction9(this.id,4)"class="form-control2" id="accrcode9"  placeholder=" Account Currency Code" disabled></textarea></th>
						<th style="width:150px;text-align:center;"><textarea type="text" style="width:150px;text-align:center" onkeyup="myFunction9(this.id,5)"class="form-control2" id="natofcus9"  placeholder="Nature Of Customer" disabled></textarea></th>
						<th style="width:63px;text-align:center;"><textarea type="text" style="width:63px;text-align:center" onkeyup="myFunction9(this.id,6)"class="form-control2" id="reportdate9"  placeholder="Report Date" disabled ></textarea></th>
									
						
						<th id="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det9">



              </tbody>
              
				</table>
				
				
				
				
				<table class="table" id="detb10" style="width:100%;display:none;margin-top:-20px;">   <thead>
            
            
					 <tr class="filters">
					 	
						<th style="text-align:center;width:250px;"><textarea type="text" style="text-align:center;width:250px;" onkeyup="myFunction10(this.id,0)"class="form-control2" id="tbb" placeholder=" Treasury Bills Bank" disabled></textarea></th>
						<th style="text-align:center;width:250px;"><textarea type="text" style="text-align:center;width:250px;"onkeyup="myFunction10(this.id,1)"class="form-control2" id="tbt"  placeholder="Treasury Bills Trade" disabled></textarea></th>						
						<th style="text-align:center;width:250px;"><textarea type="text" style="text-align:center;width:250px;"onkeyup="myFunction10(this.id,2)"class="form-control2" id="rd"  placeholder="Report Date " disabled></textarea></th>
				
									
						
						<th style="width:117px;text-align:center;" id="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det10">



              </tbody>
              
				</table>
				
		</div>
 <br>
  <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary btnhome" >Home</button>
      <!--<button type="button" class="btn btn-xs btn-primary" onclick="funli(1);"  value="back" id="btnpre1">Previous</button>
    
                
       <button type="button" class="btn btn-xs btn-primary" onclick="funli(1);"  value="back" id="btnnext1">Next</button>-->
      <button type="button" class="btn btn-xs btn-primary btnback" value="back" >Back</button>
      
      
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

		
	


</body>
</html>