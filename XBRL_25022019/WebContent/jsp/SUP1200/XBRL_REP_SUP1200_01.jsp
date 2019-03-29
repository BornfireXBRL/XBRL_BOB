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
	color: rgba(107, 107, 107, 1);
}

.filterable .filters input[disabled]::-webkit-input-placeholder {
	color: #333;
}

.filterable .filters input[disabled]::-moz-placeholder {
	color: #333;
}

.filterable .filters input[disabled]:-ms-input-placeholder {
	color: rgba(107, 107, 107, 1);
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



.panel-primary {
	border-color: rgba(18, 18, 19, 0.22);
}

.modal-footer {
	text-align: center;
	border-top: 0;
	padding: 25px;
	
}
/* 
tr:hover td{
    background: #bebfb0 !important;
}

 */

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


.form-control2{
font-size: 10px;

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

<script>
function myFunction(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("det1");
 // table = document.getElementById("det2");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==6 ){
		
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
function myFunction(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
 // table = document.getElementById("det1");
  table = document.getElementById("det2");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==13 ||b==14 || b==16){
		
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
		$("#tab1").show();
		$("#tab2").hide();
		$(".psc0500,.psc0501").hide();
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
				url : "SUP1200det1",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				
				//	alert("refePYM100"+refePYM100);
					
					  $("#pymdets tr").remove();
					 
					
					  $("#de1 tr").remove();
						 
						
						var b=JSON.parse(res.sec1SUP1200d1);
						 console.log(b);
						
						 	if(f=="onload"){
						 		$("#detb1").show();
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
							 		  $("#det1").append("<tr><td id='d1benownname_row"+srno+"'>"+b[i].d1benownname+"</td><td id='d1citiz_row"+srno+"'>"+b[i].d1citiz+"</td><td id='d1typhold_row"+srno+"'>"+b[i].d1typhold+"</td><td class='sumder' id='d1noofshares_row"+srno+"'>"+b[i].d1noofshares+"</td><td class='sumder'id='d1perofshare_row"+srno+"'>"+b[i].d1perofshare+"</td><td class='sumder' id='d1perofdirind_row"+srno+"'>"+b[i].d1perofdirind+"</td><td id='d1repdate_row"+srno+"'>"+b[i].d1repdate+"</td><td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row1('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row1('"+srno+"')></td></tr>") ;  
						 		  
						 		 
								
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 		$("#detb1").show();
						 		$("#modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
							 		  $("#det1").append("<tr><td id='d1benownname_row"+srno+"'>"+b[i].d1benownname+"</td><td id='d1citiz_row"+srno+"'>"+b[i].d1citiz+"</td><td id='d1typhold_row"+srno+"'>"+b[i].d1typhold+"</td><td class='sumder' id='d1noofshares_row"+srno+"'>"+b[i].d1noofshares+"</td><td class='sumder'id='d1perofshare_row"+srno+"'>"+b[i].d1perofshare+"</td><td class='sumder' id='d1perofdirind_row"+srno+"'>"+b[i].d1perofdirind+"</td><td id='d1repdate_row"+srno+"'>"+b[i].d1repdate+"</td></tr>") ;  
							 		  
							 		  
								 
								
								 srno++;
								
								
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
				url : "SUP1200det2",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				
					
					  $("#de1 tr").remove();
					 
					
					var b=JSON.parse(res.sec1SUP1200d2);
					 console.log(b);
					
					
						 	if(f=="onload"){
						 		$("#modify2").show();
						 		$("#rmks1").hide();
						 		for(var i=0;i<b.length;i++){
							 		  $("#det2").append("<tr><td id='d2namofdir_row"+srno+"'>"+b[i].d2namofdir+"</td><td id='d2uniid_row"+srno+"'>"+b[i].d2uniid+"</td><td id='d2status_row"+srno+"'>"+b[i].d2status+"</td><td id='d2reptyp_row"+srno+"'>"+b[i].d2reptyp+"</td><td id='d2designatn_row"+srno+"'>"+b[i].d2designatn+"</td><td id='d2nameinstitutn_row"+srno+"'>"+b[i].d2nameinstitutn+"</td><td id='d2dateappoinmt_row"+srno+"'>"+b[i].d2dateappoinmt+"</td><td id='d2dateresignatn_row"+srno+"'>"+b[i].d2dateresignatn+"</td><td id='d2citizenship_row"+srno+"'>"+b[i].d2citizenship+"</td><td id='d2repdate_row"+srno+"'>"+b[i].d2repdate+"</td><td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>") ;  

								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 	
						 		$("#modify2").hide();//modify in the header hide
						 		$("#rmks1").show();
						 		
						 		
								  
						 		for(var i=0;i<b.length;i++){
						 			
							 		  $("#det2").append("<tr><td id='d2namofdir_row"+srno+"'>"+b[i].d2namofdir+"</td><td id='d2uniid_row"+srno+"'>"+b[i].d2uniid+"</td><td id='d2status_row"+srno+"'>"+b[i].d2status+"</td><td id='d2reptyp_row"+srno+"'>"+b[i].d2reptyp+"</td><td id='d2designatn_row"+srno+"'>"+b[i].d2designatn+"</td><td id='d2nameinstitutn_row"+srno+"'>"+b[i].d2nameinstitutn+"</td><td id='d2dateappoinmt_row"+srno+"'>"+b[i].d2dateappoinmt+"</td><td id='d2dateresignatn_row"+srno+"'>"+b[i].d2dateresignatn+"</td><td id='d2citizenship_row"+srno+"'>"+b[i].d2citizenship+"</td><td id='d2repdate_row"+srno+"'>"+b[i].d2repdate+"</td></tr>") ;  

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
				 
					var srno=1;
						$("#sec1 tr").children().detach().remove();
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "SUP1200sec1",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec1 tr").remove();
								 
								
								var b=JSON.parse(res.sec1SUP1200);
								 console.log(b);
								
                                 
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec1").append("<tr><td id='s1intname"+srno+"'>"+b[i].s1intname+"</td><td id='s1intcode"+srno+"'>"+b[i].s1intcode+"</td><td class='sumder' id='s1value"+srno+"'>"+b[i].s1value+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+srno+") id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   	
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "SUP1200sec2",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec2 tr").remove();
								 
								
								var b=JSON.parse(res.sec1SUP1200s2);
								
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec2").append("<tr><td id='s2ultbenownno"+srno+"'>"+b[i].s2ultbenownno+"</td><td id='s2ultbenownname"+srno+"'>"+b[i].s2ultbenownname+"</td><td class='sumder' id='s2totpershare"+srno+"'>"+b[i].s2totpershare+"</td><td id='s2citizen"+srno+"'>"+b[i].s2citizen+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+srno+") id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "SUP1200sec3",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec3 tr").remove();
								 
								
								var b=JSON.parse(res.sec1SUP1200s3);
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec3").append("<tr><td id='s3ultibenownno"+srno+"'>"+b[i].s3ultibenownno+"</td><td id='s3tranno"+srno+"'>"+b[i].s3tranno+"</td><td id='s3nameben"+srno+"'>"+b[i].s3nameben+"</td><td id='s3nameshareholder"+srno+"'>"+b[i].s3nameshareholder+"</td><td id='s3citizen"+srno+"'>"+b[i].s3citizen+"</td><td id='s3typofhodng"+b[i].s3typofhodng+"'></td><td class='sumder'id='s3noofshares"+srno+"'>"+b[i].s3noofshares+"</td><td class='sumder' id='s3pershare"+srno+"'>"+b[i].s3pershare+"</td><td class='sumder'id='s3perofdir"+srno+"'>"+b[i].s3perofdir+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+srno+") id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "SUP1200sec4",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec4 tr").remove();
								 
								
								var b=JSON.parse(res.sec1SUP1200s4);
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec4").append("<tr><td id='s4slno"+srno+"'>"+b[i].s4slno+"</td><td id='s4namedir"+srno+"'>"+b[i].s4namedir+"</td><td id='s4uniqid"+srno+"'>"+b[i].s4uniqid+"</td><td id='s4status"+srno+"'>"+b[i].s4status+"</td><td id='s4reporttyp"+srno+"'>"+b[i].s4reporttyp+"</td><td id='s4desgnatn"+srno+"'>"+b[i].s4desgnatn+"</td><td id='s4nameinstitute"+srno+"'>"+b[i].s4nameinstitute+"</td><td id='s4dateappoinmt"+srno+"'>"+b[i].s4dateappoinmt+"</td><td id='s4dateresign"+srno+"'>"+b[i].s4dateresign+"</td><td id='s4citizen"+srno+"'>"+b[i].s4citizen+"</td><td style=text-align:center;><input type=radio style=width: 15px; onclick=fnloads("+srno+") id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
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
	location.href = "XBRL_REP_SUP1200_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
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
	 $("#btnfilter").on("click",function(){
			if($(".form-control2").prop("disabled")==true){
				$(".form-control2").prop("disabled",false);
			}else{
				$(".form-control2").val("");
				$(".form-control2").prop("disabled",true);
			}
			
		});
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
	
	
	
	$( '#btnback').click(function() {
		 location.href="XBRL_CRT_SUP1200_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

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
var tabid=1;
function funli(a){
	
 tabid=1;
	$(".table").hide();
	$("#detb"+a).show();
	tabid=a;
if(a==1){
	
	$("#btnpre1").prop("disabled",true);
	 $("#btnnext1").prop("disabled",false);
	 $("#li1").addClass("active");
	 $("#li2").removeClass("active");
}else {
	$("#btnpre1").prop("disabled",false);
	 $("#btnnext1").prop("disabled",true);
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
		
		location.href = "XBRL_REP_SUP1200_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_SUP1200_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	
	
	$('#btnExcel').click(function() {
		
		 SUP1200Form.action = "SUP1200EXCELREPORT.action?method=SUP1200EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 SUP1200Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 SUP1200Form.action = "SUP1200EXCELSum.action?method=SUP1200EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 SUP1200Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 SUP1200Form.action = "SUP1200PDFREPORT.action?method=SUP1200PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 SUP1200Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  SUP1200Form.action = "XMLDOWNLOADs12.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 SUP1200Form.submit(); 
	});
	var save=0;

$('#btnSave').on("click",function() {
	
	  var datasum={
			"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").text()
	};
	$.ajax({
		url:"saveSums12",
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
	$("#det"+tabid).prepend("<tr><td id='d1benownname_row"+rowno+"'><input type='text'  id='d1benownname_text"+rowno+"' style='    width:117px;'></td><td id='d1citiz_row"+rowno+"'><input type='text' id='d1citiz_text"+rowno+"' style='     width: 110px;'></td><td id='d1typhold_row"+rowno+"'><input type='text' 	id='d1typhold_text"+rowno+"' style='    width: 182px;'></td><td class='sumder alnum' id='d1noofshares_row"+rowno+"'><input type='text'  id='d1noofshares_text"+rowno+"' style='    width:90px;'></td><td class='sumder alnum' id='d1perofshare_row"+rowno+"'><input type='text' id='d1perofshare_text"+rowno+"' style='     width: 100px;'></td><td class='sumder alnum' id='d1perofdirind_row"+rowno+"'><input type='text' 	id='d1perofdirind_text"+rowno+"' style='    width: 100px;'></td><td id='d1repdate_row"+rowno+"'><input type='text'  id='d1repdate_text"+rowno+"' style='    width:88px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row1('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row1('"+rowno+"')></td></tr>");
	}else{
		$("#det"+tabid).prepend("<tr><td id='d2namofdir_row"+rowno+"'><input type='text'  id='d2namofdir_text"+rowno+"' style='    width:100px;'></td><td id='d2uniid_row"+rowno+"'><input type='text' id='d2uniid_text"+rowno+"' style='     width: 100px;'></td><td class='sumder alnum' id='d2status_row"+rowno+"'><input type='text' 	id='d2status_text"+rowno+"' style='    width: 100px;'></td><td id='d2reptyp_row"+rowno+"'><input type='text'  id='d2reptyp_text"+rowno+"' style='    width:117px;'></td><td id='d2designatn_row"+rowno+"'><input type='text' id='d2designatn_text"+rowno+"' style='     width: 169px;'></td><td id='d2nameinstitutn_row"+rowno+"'><input type='text' 	id='d2nameinstitutn_text"+rowno+"' style='    width: 100px;'></td><td id='d2dateappoinmt_row"+rowno+"'><input type='text'  id='d2dateappoinmt_text"+rowno+"' style='    width:90px;'></td><td id='d2dateresignatn_row"+rowno+"'><input type='text' id='d2dateresignatn_text"+rowno+"' style='     width: 100px;'></td><td id='d2citizenship_row"+rowno+"'><input type='text' 	id='d2citizenship_text"+rowno+"' style='    width: 100px;'></td><td id='d2repdate_row"+rowno+"'><input type='text'  id='d2repdate_text"+rowno+"' style='    width:88px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");

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
	$("#d1repdate_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
	});
	$("#d2repdate_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
	});
	$("#d2dateappoinmt_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
	});
	$("#d2dateresignatn_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
	});
	
}
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
	 	

	 
	 

var	d1perofshare =  document.getElementById("d1perofshare_row"+no);

var	d1perofshare_data = d1perofshare.innerHTML;







d1perofshare.innerHTML="<input type='text' class='decimalPt roundUp'  id='d1perofshare_text"+no+"'  style='width: 83px'; value='"+d1perofshare_data+"'>";


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


var d1perofshare_val=document.getElementById("d1perofshare_text"+no).value;



document.getElementById("d1perofshare_row"+no).innerHTML=d1perofshare_val;

if($("#addrowno").val()=="1"){

var  d1benownname_val=document.getElementById("d1benownname_text"+no).value;	 
document.getElementById("d1benownname_row"+no).innerHTML=d1benownname_val;

var  d1citiz_val=document.getElementById("d1citiz_text"+no).value;	 
document.getElementById("d1citiz_row"+no).innerHTML=d1citiz_val;

   var d1typhold_val=document.getElementById("d1typhold_text"+no).value;
   document.getElementById("d1typhold_row"+no).innerHTML=d1typhold_val;
   
  var d1noofshares_val=document.getElementById("d1noofshares_text"+no).value;
   document.getElementById("d1noofshares_row"+no).innerHTML=d1noofshares_val;

   
	   var d1perofdirind_val=document.getElementById("d1perofdirind_text"+no).value;
	   document.getElementById("d1perofdirind_row"+no).innerHTML=d1perofdirind_val;
	   
	  var d1repdate_val=document.getElementById("d1repdate_text"+no).value;
	   document.getElementById("d1repdate_row"+no).innerHTML=d1repdate_val;

	
	  
	 


}

document.getElementById("edit_button"+no).style.display="block";
document.getElementById("save_button"+no).style.display="none";
 var d1benownname=document.getElementById("d1benownname_row"+no).innerHTML;	 
 var d1citiz=document.getElementById("d1citiz_row"+no).innerHTML;	 
 var d1typhold=document.getElementById("d1typhold_row"+no).innerHTML;
 var d1noofshares=document.getElementById("d1noofshares_row"+no).innerHTML;
 var d1perofshare=document.getElementById("d1perofshare_row"+no).innerHTML;
  var d1perofdirind=document.getElementById("d1perofdirind_row"+no).innerHTML;
  var d1repdate=document.getElementById("d1repdate_row"+no).innerHTML;
 
 $("#det1 td").attr("padding","8px");
var refeSUP12001=document.getElementById("refDisplay").innerHTML;
/* d1perofshare=d1perofshare.replace(/\,/g,'')
  d1perofshare=Number(d1perofshare) */

 var rptdate1 = {
		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeSUP12001, "d1benownname":d1benownname,"d1citiz":d1citiz,"d1typhold":d1typhold,"d1noofshares" : d1noofshares,"d1perofshare":d1perofshare, "d1perofdirind":d1perofdirind,"d1repdate":d1repdate
		}; 
 $.ajax({
     url : "SUP1200dt1",
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

<script>


 function edit_row(no)
{
//alert("happyyyyyyyyyyyyy");
//alert("hiii 2d AGccccccccc" +  edit_row(no));
$(".add").attr("disabled",true);
$("#addrowno").val("0");
	
	document.getElementById("edit_button"+no).style.display="none";
	  document.getElementById("save_button"+no).style.display="block";
	 	

	  
	 

var	d2dateresignatn =  document.getElementById("d2dateresignatn_row"+no);

var	d2dateresignatn_data = d2dateresignatn.innerHTML;






d2dateresignatn.innerHTML="<input type='text' class='decimalPt roundUp'  id='d2dateresignatn_text"+no+"'  style='width: 83px'; value='"+d2dateresignatn_data+"'>";




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



var d2dateresignatn_val=document.getElementById("d2dateresignatn_text"+no).value;
document.getElementById("d2dateresignatn_row"+no).innerHTML=d2dateresignatn_val;

if($("#addrowno").val()=="1"){


   var d2namofdir_val=document.getElementById("d2namofdir_text"+no).value;
   document.getElementById("d2namofdir_row"+no).innerHTML=d2namofdir_val;
   
  var d2uniid_val=document.getElementById("d2uniid_text"+no).value;
   document.getElementById("d2uniid_row"+no).innerHTML=d2uniid_val;
 
  
   
   var d2status_val=document.getElementById("d2status_text"+no).value;
  document.getElementById("d2status_row"+no).innerHTML=d2status_val;
  
 var d2reptyp_val=document.getElementById("d2reptyp_text"+no).value;
  document.getElementById("d2reptyp_row"+no).innerHTML=d2reptyp_val;
 
  var d2designatn_val=document.getElementById("d2designatn_text"+no).value;
  document.getElementById("d2designatn_row"+no).innerHTML=d2designatn_val;
  
 var d2nameinstitutn_val=document.getElementById("d2nameinstitutn_text"+no).value;
  document.getElementById("d2nameinstitutn_row"+no).innerHTML=d2nameinstitutn_val;
  
  var d2dateappoinmt_val=document.getElementById("d2dateappoinmt_text"+no).value;
  document.getElementById("d2dateappoinmt_row"+no).innerHTML=d2dateappoinmt_val;
  

  var d2citizenship_val=document.getElementById("d2citizenship_text"+no).value;
  document.getElementById("d2citizenship_row"+no).innerHTML=d2citizenship_val;
  
 var d2repdate_val=document.getElementById("d2repdate_text"+no).value;
  document.getElementById("d2repdate_row"+no).innerHTML=d2repdate_val;
  
 
 
 
 
 


}

document.getElementById("edit_button"+no).style.display="block";
document.getElementById("save_button"+no).style.display="none";
 var d2namofdir=document.getElementById("d2namofdir_row"+no).innerHTML;
  var d2uniid=document.getElementById("d2uniid_row"+no).innerHTML;
  
  var d2status=document.getElementById("d2status_row"+no).innerHTML;
 var d2reptyp=document.getElementById("d2reptyp_row"+no).innerHTML;
 var d2designatn=document.getElementById("d2designatn_row"+no).innerHTML;
 var d2nameinstitutn=document.getElementById("d2nameinstitutn_row"+no).innerHTML;
 var d2dateappoinmt=document.getElementById("d2dateappoinmt_row"+no).innerHTML;
 var d2dateresignatn=document.getElementById("d2dateresignatn_row"+no).innerHTML;
 var d2citizenship=document.getElementById("d2citizenship_row"+no).innerHTML;
 var d2repdate=document.getElementById("d2repdate_row"+no).innerHTML;
 

 


 $("#det2 td").attr("padding","8px");
var refeSUP1200=document.getElementById("refDisplay").innerHTML;
/* amtfc1=amtfc1.replace(/\,/g,'')
  amtfc1=Number(amtfc1) */

 var rptdate1 = {
		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno":  refeSUP1200, "d2namofdir":d2namofdir,"d2uniid" : d2uniid,"d2status":d2status,"d2reptyp" : d2reptyp, "d2designatn":d2designatn,"d2nameinstitutn" : d2nameinstitutn,"d2dateappoinmt":d2dateappoinmt,"d2dateresignatn" : d2dateresignatn,"d2citizenship":d2citizenship,"d2repdate" : d2repdate
		}; 
 
 $.ajax({
     url : "SUP1200dt2",
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
<SCRIPT>

function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_SUP1200_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>

<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="SUP1200Form"
		enctype="multipart/form-data">
             	<div class="tab-content" >
	 	<div class="active psc0105" id="tab2" style="width: 968px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>SUP1200-Shareholders-Particulars of shareholders holding % per cent or more directly or indirectly of the institution's stated capital<b id="sub"
					Style="display: none"></b></b></font>
			</div> 
		<ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">




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
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width:571px;"></td><td style="background-color: #bbc3cb;text-align: right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
			
				
				
			 <!--******************SUMMARY SECTION 4********************************-->   		
				
				
				   <table class="table" id="tb4" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="14" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>Particulars of board of directors/ local advisory board in any institution</b>  </td></tr>
            <tr>
          <th style="text-align:center" ROWSPAN="2">Sr.No.</th>
            <th style="text-align:center">Name of Director</th>
            <th style="text-align:center">Unique Identifier of director</th>
            <th style="text-align:center">Status of Director</th>
            <th style="text-align:center">Reporting type</th>
            <th style="text-align:center">Designation of director in reporting institution</th>
            <th style="text-align:center">Name of financial institituion</th>
            <th style="text-align:center">Date of appointment </th>
            <th style="text-align:center">Date of resignation</th>
            <th style="text-align:center">Citizenship </th>
            <th  rowspan="2" style="text-align:center" id="">Select</th>
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
          </tr>
          
           <tbody class="databody" id="sec4"></tbody>
          
          
          </table>
          
			 <!--******************SUMMARY SECTION 3********************************-->   		
		
				   <table class="table" id="tb3" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="15" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>Details of shares held by shareholders in financial institution share capital where ultimate beneficiary owner holds directly/ indirectly  5% or more</b>  </td></tr>
            <tr>
            <th style="text-align:center"></th>
            <th style="text-align:center"></th>
            <th style="text-align:center">Ordinary share 1</th>
            <th style="text-align:center">Ordinary share 1</th>
            <th style="text-align:center">Ordinary share 1</th>
            <th style="text-align:center">Ordinary share 1</th>
            <th style="text-align:center">Ordinary share 1</th>
            <th style="text-align:center">Ordinary share 1</th>
            <th style="text-align:center">Ordinary share 1</th>
            <th rowspan="3" id="" style="text-align:center">Select</th>
            </tr>
            
         <tr>
            <th style="text-align:center">Ultimate beneficiary owner Sr.No.</th>
            <th style="text-align:center">Transaction Sr.No.</th>
            <th style="text-align:center">Name of ultimate beneficiary owner</th>
            <th style="text-align:center">Name of shareholder as per institution share register</th>
            <th style="text-align:center">Citizenship of shareholder as per institution share register</th>
            <th style="text-align:center">Type of holding</th>
            <th style="text-align:center">Number of shares held by shareholders</th>
            <th style="text-align:center">Percentage of shares held by shareholder</th>
            <th style="text-align:center">Percentage  of shares held by ultimate beneficiary owner directly/ indirectly [equivalent of de-facto and de-jure]</th>
            </tr>
            <tr>
            <th style="text-align:center"></th>
            <th style="text-align:center"></th>
            <th style="text-align:center">E</th>
            <th style="text-align:center">F</th>
            <th style="text-align:center">G</th>
            <th style="text-align:center">H</th>
            <th style="text-align:center">I</th>
            <th style="text-align:center">J</th>
            <th style="text-align:center">K</th>
            </tr>
         
          </tr>
             <tbody class="databody" id="sec3"></tbody>
          </table>
	 <!--******************SUMMARY SECTION2********************************-->   			
			
            <table class="table" id="tb2" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="13" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>Details of ultimate beneficiary ownerk</b>  </td></tr>
            <tr>
            <th  style="text-align:center"></th>
          <th  style="text-align:center">Ordinary share 1</th>
          <th style="text-align:center">Ordinary share 1</th>
          <th  style="text-align:center">Ordinary share 1</th>
          <th rowspan="3" id="" style="text-align:center">Select</th>
          </tr>
          
          <tr>
          <th style="text-align:center">Ultimate beneficiary owner Sr.No.</th>
          <th style="text-align:center">Name of ultimate beneficiary owner</th> 
          <th style="text-align:center">Total percentage  of shares held by ultimate beneficiary owner directly/ indirectly [equivalent of de-facto and de-jure]</th> 
          <th style="text-align:center">Citizenship of ultimate beneficiary</th> 
          </tr>
          <tr>
          <th style="text-align:center"></th>
          <th style="text-align:center">B</th>
          <th style="text-align:center">C</th>
          <th style="text-align:center">D</th>
          </tr>
             <tbody class="databody" id="sec2"></tbody>
          </table>
          
  <!--******************SUMMARY SECTION1********************************-->   
               
               <table class="table" id="tb1" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="13" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>Details of ordinary share		
			
          </b>  </td></tr>
          
          <tr>
          <th colspan="2" style="text-align:center"></th>
          <th  style="text-align:center">Ordinary share 1</th>
          <th rowspan="3" id="" style="text-align:center">Select</th>
          </tr>
          
          <tr><th style="text-align:center;width:719px;">Particulars</th><th style="text-align:center;width:43px;"></th> <th style="text-align:center">A</th>
          <tr>
         
   
    
          </tr>   <tbody class="databody" id="sec1"></tbody>
          </table>
          
          
          
            <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
      <!-- <button type="button" class="btn btn-xs btn-primary"   value="back" id="btnpre">Previous</button>
     -->
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
       <!-- <button type="button" class="btn btn-xs btn-primary"   value="back" id="btnnext">Next</button> -->
      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div>
          
            </div>
            
            
            
            
            
            
             	<div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			<div class="active" id="tab1" style="width: 1310px;padding-top: 1px;margin-top: -17px;" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>
			<b id="sub"
					Style="display: none"></b></b></font><b style="font-size: 13px;">SUP1200-List of Shareholders and Directors
					 <b id="sub" style="display: none"></b>
			<b style="font-size: 13px;"> <b id="sub" style="display: none"></b></b></div>
			<div id="divLoading"> 
    </div>
    <ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">




  
					<li class=" pull-right list" onclick="funli(2);"><a  data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" onclick="funli(1);" ><a
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>




				</ul>
				
				
           <table class="" style="width:100%;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width: 325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab" id="sumfirst"><span class="headingtab"  >Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a><a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></td></tr>
          		  </table>
       
            <div class="panel panel-primary filterable">
            
           
				   <table class="table" id="detb1" style="width:100%;display:none;margin-top:-20px;">   <thead><tr ><td colspan="14" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>Particulars of board of directors/ local advisory board in any institution</b>  </td></tr>
            
            
					
 				<tr class="filters">
					 
						<th ><input type="text" id="benname"  onkeyup="myFunction(this.id,0)" style="width: 150px;" class="form-control2" placeholder="Beneficiary Name Owner" disabled></th>
						<th ><input type="text" id="citizennn"  onkeyup="myFunction(this.id,1)" style="width: 100px;" class="form-control2" placeholder="Citizenship" disabled></th>						
						<th ><input type="text" id="typofholdingg"  onkeyup="myFunction(this.id,2)" style="width: 100px;" class="form-control2" placeholder="Type of Holding" disabled></th>
						<th ><input type="text" id="nofsharess"  onkeyup="myFunction(this.id,3)" style="width: 100px;" class="form-control2" placeholder="No Of Shares" disabled></th>
						<th ><input type="text" id="perofsharee"  onkeyup="myFunction(this.id,4)" style="width: 100px;" class="form-control2" placeholder="Percentage of Share" disabled></th>						
						<th ><input type="text" id="perofdirindirr"  onkeyup="myFunction(this.id,5)" style="width: 100px;" class="form-control2" placeholder="Percentage of Direct Indirect Share" disabled></th>		
						<th ><input type="text" id="repdatee"  onkeyup="myFunction(this.id,6)" style="width: 100px;" class="form-control2" placeholder="Report Date" disabled></th>	
						<th id="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det1">


 


              </tbody>
              
				</table>
				
				
				<table class="table" id="detb2" style="width:100%;display:none;margin-top:-20px;"><thead><tr ><td colspan="14" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>Particulars of board of directors/ local advisory board in any institution</b>  </td></tr>
            
               
					 
 				<tr class="filters">
					 
						<th ><input type="text" id="nameofdirr"  onkeyup="myFunction(this.id,7)" style="width: 100px;" class="form-control2" placeholder="Name Of Director" disabled></th>
						<th ><input type="text" id="uniqidd"  onkeyup="myFunction(this.id,8)" style="width: 100px;" class="form-control2" placeholder="Unique Id" disabled></th>						
						<th ><input type="text" id="statuss"  onkeyup="myFunction(this.id,9)" style="width: 100px;" class="form-control2" placeholder="Status" disabled></th>
						<th ><input type="text" id="reptyppp"  onkeyup="myFunction(this.id,10)" style="width: 100px;" class="form-control2" placeholder="Reporting Type" disabled></th>
						<th ><input type="text" id="designatnn"  onkeyup="myFunction(this.id,11)" style="width: 100px;" class="form-control2" placeholder="Designation" disabled></th>						
						<th ><input type="text" id="nameofinstitnnn"  onkeyup="myFunction(this.id,12)" style="width: 100px;" class="form-control2" placeholder="Name Of Institution" disabled></th>		
						<th ><input type="text" id="dateofappmntt"  onkeyup="myFunction(this.id,13)" style="width: 100px;" class="form-control2" placeholder="Date Of appointment" disabled></th>	
						<th ><input type="text" id="dateofresignatnn"  onkeyup="myFunction(this.id,14)" style="width: 100px;" class="form-control2" placeholder="Date Of Resignation" disabled></th>						
						<th ><input type="text" id="citizennn"  onkeyup="myFunction(this.id,15)" style="width: 100px;" class="form-control2" placeholder="Citizenship" disabled></th>		
						<th ><input type="text" id="repppdatee"  onkeyup="myFunction(this.id,16)" style="width: 100px;" class="form-control2" placeholder="Report Date" disabled></th>	
						<th id="modify2">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det2">


 


              </tbody>
              
              
				</table>
				
			</div>
 <br>
<!--  <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
      <button type="button" class="btn btn-xs btn-primary" onclick="funli(1);"  value="back" id="btnpre1">Previous</button>
    
                
       <button type="button" class="btn btn-xs btn-primary" onclick="funli(2);"  value="back" id="btnnext1">Next</button>
      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div>
       
			  </div>	
            
             -->
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
       <%--      <!-- psc0106  SUMMARY-->
            <div class="active psc0106" id="" style="width: 968px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="text-align:center;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>List of Names of SMEs - SME Financing Scheme and MSME<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"> <%=reptype %><b id="sub" style="display: none"></b></b></div> 
          
          <table class="table" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: center;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab" ><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
          		  
             <table class="table" id="tb" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="16" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>List of Names of SMEs - SME Financing Scheme and MSME											
			
          </b>  </td></tr><tr><th rowspan="2" style="text-align:center">ISIC Code</th>
         <th  rowspan="2" style="text-align:center">Name	</th><th   rowspan="2" style="text-align:center">Type of Entity</th>
          <th colspan="2" style="text-align:center">Status of Outstanding Credit Facilities</th><th colspan="5" style="text-align:center">Credit Facilities approved Under the SME Financing Scheme and MSME-Cumulative Basis</th>
          <th colspan="5" style="text-align:center">Amount Outstanding </th><th rowspan="3" style="text-align:center">Select</th>
          </tr>
          
          <tr><th style="text-align:center">Amount Performing</th><th style="text-align:center">Amount Impaired</th> <th style="text-align:center">SME Loans</th><th style="text-align:center">Overdrafts</th> <th style="text-align:center">Finance Lease</th><th style="text-align:center">Others</th> <th style="text-align:center">Total</th><th style="text-align:center">SME Loans</th><th style="text-align:center">Overdrafts</th> <th style="text-align:center">Finance Lease</th><th style="text-align:center">Others</th> <th style="text-align:center">Total</th></tr>
          <tr> <th style="text-align:center">A</th><th style="text-align:center">B</th> <th style="text-align:center">C</th><th style="text-align:center">D</th> <th style="text-align:center">E</th><th style="text-align:center">F</th><th style="text-align:center">G</th><th style="text-align:center">H</th> <th style="text-align:center">I</th><th style="text-align:center">J</th><th style="text-align:center">K</th><th style="text-align:center">L</th><th style="text-align:center">M</th><th style="text-align:center">N</th><th style="text-align:center">O</th></tr>
          
          <tr>
         
          
          </tr>
         
             <tbody id="section1"></tbody>
          </table>
          <div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
           
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
                <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button>
            </div>
          
          </div>
          
          <!-- DETAIL TABLE -->
          
          <input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			<div class="active" id="tab1" style="width: 1778px;padding-top: 1px;margin-top: -17px;display:none" >
			<div style="text-align:center;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>Student Loan Scheme<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"><%=reptype %> <b id="sub" style="display: none"></b></b></div> 
			<div id="divLoading"> 
    </div>
           <table class="table" style="width: 1778px;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width: 600px;"></td><td style="background-color: #bbc3cb;text-align: center;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a>
                    <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></td></tr>
          		  </table>
         <div class="panel panel-primary filterable">
            
           
            <table class="table" id="tbcate" border="1" style="width:100%;   margin-top: -20px;">
            
             <thead>
					 <tr class="filters">
					 
						<th ><input type="text" onkeyup="myFunction(this.id,0)" class="form-control2" id="applno" placeholder="Application Number" disabled></th>
						<!-- <th id="chalpha">Cheque Alpha</th>					 -->	
						<th ><input type="text" id="applname" onkeyup="myFunction(this.id,1)" class="form-control2" placeholder="Applicant Name" disabled></th>						
						<th ><input type="text" id="schmtyp" onkeyup="myFunction(this.id,2)" class="form-control2" placeholder="Scheme Type" disabled> </th>						
						<th  style=""><input type="text" id="curr" onkeyup="myFunction(this.id,3)" class="form-control2" placeholder="Currency" disabled></th>
						<th ><input type="text" id="outbal" class="form-control2" onkeyup="myFunction(this.id,4)" placeholder="Outstanding Balance" disabled></th>
						<!-- <th id="valdate">Value Date</th> -->
						<th  style=""><input type="text" id="intrate"  onkeyup="myFunction(this.id,5)" class="form-control2" placeholder="Interest Date" disabled></th>						
						<th ><input type="text" class="form-control2" id="accopndate" onkeyup="myFunction(this.id,6)" placeholder="Account Open Date" disabled></th>
						<th ><input type="text" class="form-control2" id="recvddate" onkeyup="myFunction(this.id,7)" placeholder="Received Date" disabled></th>
						<th ><input type="text" class="form-control2" id="appdate" onkeyup="myFunction(this.id,8)" placeholder="Approved Date" disabled></th>
						<th ><input type="text" class="form-control2" id="rejdate" onkeyup="myFunction(this.id,9)" placeholder="Rejected Date" disabled></th>
						<th ><input type="text" class="form-control2" id="rejdate" onkeyup="myFunction(this.id,10)" placeholder="Rejection reason" disabled></th>
						<th id="modify">Modify</th>
						
					</tr>
					
				</thead>
					
					


 


              </tbody>
              
   
        
				</table> 
			
				</div>
			  </div>	 --%>
				
				
				
				
            </div>


     </form>
    
    
</div>





</body>
</html>