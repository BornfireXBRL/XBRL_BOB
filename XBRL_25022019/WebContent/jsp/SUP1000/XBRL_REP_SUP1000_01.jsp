<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLSUP1000Bean,dao.XBRLSUP1000Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
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
 
XBRLSUP1000Dao dmd=new XBRLSUP1000Dao();
 
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


.databody td{
border:1px solid #ddd;
}


/* 
tr:hover td{
    background: #bebfb0 !important;
}

 */

</style>
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
		if(b==2||b==3 || b==6 ||b==10|| b==11){
			  if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
			    	
			        tr[i].style.display = "";
			       
			      } else {
			        tr[i].style.display = "none";
			      }
			 
		    } else{
		    	

				 if(td.innerHTML.replace(/,/g,"").substring(0,input.value.length)==input.value){
					 tr[i].style.display = "";
				}else {
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
		if(b==1||b==5 || b==6 ){
			  if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
			    	
			        tr[i].style.display = "";
			       
			      } else {
			        tr[i].style.display = "none";
			      }
			 
		    } else{
		    	

				 if(td.innerHTML.replace(/,/g,"").substring(0,input.value.length)==input.value){
					 tr[i].style.display = "";
				}else {
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
		if(b==2||b==5 || b==7 ||b==8 || b==13){
			  if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
			    	
			        tr[i].style.display = "";
			       
			      } else {
			        tr[i].style.display = "none";
			      }
			 
		    } else{
		    	

				 if(td.innerHTML.replace(/,/g,"").substring(0,input.value.length)==input.value){
					 tr[i].style.display = "";
				}else {
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
		if(b==2||b==5 || b==7 ||b==8 || b==13){
			  if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
			    	
			        tr[i].style.display = "";
			       
			      } else {
			        tr[i].style.display = "none";
			      }
			 
		    } else{
		    	

				 if(td.innerHTML.replace(/,/g,"").substring(0,input.value.length)==input.value){
					 tr[i].style.display = "";
				}else {
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
					"reptype" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "SUP1000det1",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#det1 tr").remove();
					 
					
					var b=JSON.parse(res.sec1SUP1000d1);
					 console.log(b);
					
					
						 	if(f=="onload"){
						 		$("#detb1").show();
						 		$("#detb2,#detb3,#detb4").hide();
						 		
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#det1").append("<tr><td id='s1dettyp_row"+srno+"'>"+b[i].s1dettyp+"</td><td id='unqid_row"+srno+"'>"+b[i].unqid+"</td><td id='acno_row"+srno+"'>"+b[i].acno+"</td><td id='name_row"+srno+"'>"+b[i].name+"</td><td id='adrs_row"+srno+"'>"+b[i].adrs+"</td><td id='s3dtddchq_row"+srno+"'>"+b[i].s3dtddchq+"</td><td id='accurncy_row"+srno+"'>"+b[i].accurncy+"</td><td id='outbal_row"+srno+"'  class='sumder alnum'>"+b[i].outbal+"</td><td id='dttran_row"+srno+"'>"+b[i].dttran+"</td><td id='rmrk_row"+srno+"'>"+b[i].rmrk+"</td><td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>") ;  
						 		  
						 		 
								
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 		$("#detb1").show();
						 		$("#detb2,#detb3,#detb4").hide();
						 		$("#modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
							 		  $("#det1").append("<tr><td id='s1dettyp_row"+srno+"'>"+b[i].s1dettyp+"</td><td id='unqid_row"+srno+"'>"+b[i].unqid+"</td><td id='acno_row"+srno+"'>"+b[i].acno+"</td><td id='name_row"+srno+"'>"+b[i].name+"</td><td id='adrs_row"+srno+"'>"+b[i].adrs+"</td><td id='s3dtddchq_row"+srno+"'>"+b[i].s3dtddchq+"</td><td id='accurncy_row"+srno+"'>"+b[i].accurncy+"</td><td id='outbal_row"+srno+"'  class='sumder alnum'>"+b[i].outbal+"</td><td id='dttran_row"+srno+"'>"+b[i].dttran+"</td><td id='rmrk_row"+srno+"'>"+b[i].rmrk+"</td></tr>") ;  
							 		  
							 		  
								 
								
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
				url : "SUP1000det2",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
				  
					  //$("#det1 tr").remove();
				    $("#det2 tr").remove();
					 
					//alert("inside the details ajax");
					var b=JSON.parse(res.sec1SUP1000d2);
					 console.log(b);
					
						 	if(f=="onload"){
						 		$(".modify").show();
						 		
						 		for(var i=0;i<b.length;i++){
						 			$("#det2").append(
											 											
											
							 				 "<tr>"
							 				 
 						
					  +"<td  id='unqid_row"+srno+"'>"+b[i].unqid+"</td>"
					  +"<td  id='acno_row"+srno+"'>"+b[i].acno+"</td>"
					  +"<td  id='name_row"+srno+"'>"+b[i].name+"</td>"
					  +"<td  id='adrs_row"+srno+"'>"+b[i].adrs+"</td>"
					  +"<td  id='accurncy_row"+srno+"'>"+b[i].accurncy+"</td>"
					  +"<td   class='sumder alnum' id='outbal_row"+srno+"'>"+b[i].outbal+"</td>"
					  +"<td  id='dttran_row"+srno+"'>"+b[i].dttran+"</td>"
					  +"<td id='s1dettyp_row"+srno+"'>"+b[i].s1dettyp+"</td>"
					  +"<td  id='rmrk_row"+srno+"'>"+b[i].rmrk+"</td>"
					  
					  +"<td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td>"
					  
					  /*    +"<td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td>" */	
	                    
	                     
	                     
                      
	                    +"</tr>" ) ; 
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 		
						 		$(".modify").hide();//modify in the header hide
						 		
						 		
						 		
								  
						 		for(var i=0;i<b.length;i++){
						 			
						 			$("#det2").append(											
											
							 				 "<tr>"
							 				 
 						
					  +"<td  id='unqid_row"+srno+"'>"+b[i].unqid+"</td>"
					  +"<td  id='acno_row"+srno+"'>"+b[i].acno+"</td>"
					  +"<td  id='name_row"+srno+"'>"+b[i].name+"</td>"
					  +"<td  id='adrs_row"+srno+"'>"+b[i].adrs+"</td>"
					  +"<td  id='accurncy_row"+srno+"'>"+b[i].accurncy+"</td>"
					  +"<td   class='sumder alnum' id='outbal_row"+srno+"'>"+b[i].outbal+"</td>"
					  +"<td  id='dttran_row"+srno+"'>"+b[i].dttran+"</td>"
					  +"<td id='s1dettyp_row"+srno+"'>"+b[i].s1dettyp+"</td>"
					  +"<td  id='rmrk_row"+srno+"'>"+b[i].rmrk+"</td>"
					
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
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
			}; 
			
		$.ajax({
			url : "SUP1000det3",
			data : pymd,
			dataType : 'json',
			type : 'POST',
			async : false,
			success : function(res) {	
			//	alert("refePYM100"+refePYM100);
				
			  
				  $("#det3 tr").remove();
			  
				 
				//alert("inside the details ajax");
				var b=JSON.parse(res.sec1SUP1000d3);
				 console.log(b);
				
					 	if(f=="onload"){
					 		$(".modify").show();
					 	
					 		for(var i=0;i<b.length;i++){
					 			$("#det3").append("<tr><td id='s1dettyp_row"+srno+"'>"+b[i].s1dettyp+"</td><td id='unqid_row"+srno+"'>"+b[i].unqid+"</td><td id='s3dtddchq_row"+srno+"'>"+b[i].s3dtddchq+"</td><td id='s3ddchqno_row"+srno+"'>"+b[i].s3ddchqno+"</td><td id='name_row"+srno+"'>"+b[i].name+"</td><td id='adrs_row"+srno+"'>"+b[i].adrs+"</td><td id='acno_row"+srno+"'>"+b[i].acno+"</td><td id='bfryname_row"+srno+"'>"+b[i].bfryname+"</td><td id='bfryadrs_row"+srno+"'>"+b[i].bfryadrs+"</td><td id='accurncy_row"+srno+"'>"+b[i].accurncy+"</td><td class='sumder alnum' id='outbal_row"+srno+"'>"+b[i].outbal+"</td><td id='dttran_row"+srno+"'>"+b[i].dttran+"</td><td id='rmrk_row"+srno+"'>"+b[i].rmrk+"</td><td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>" ) ; 
							 srno++;
							 
							
								}
							 $("#divLoading").removeClass('show');
							$("#rowno").val(srno);
					 	}else if(f=="frmsum"){
					 		$(".add").hide();//add button hide
					 	
					 		$(".modify").hide();//modify in the header hide
					 		
					 		$("#rmks2").show();
					 		
							  
					 		for(var i=0;i<b.length;i++){
					 			
					 			$("#det3").append("<tr><td id='s1dettyp_row"+srno+"'>"+b[i].s1dettyp+"</td><td id='unqid_row"+srno+"'>"+b[i].unqid+"</td><td id='s3dtddchq_row"+srno+"'>"+b[i].s3dtddchq+"</td><td id='s3ddchqno_row"+srno+"'>"+b[i].s3ddchqno+"</td><td id='name_row"+srno+"'>"+b[i].name+"</td><td id='adrs_row"+srno+"'>"+b[i].adrs+"</td><td id='acno_row"+srno+"'>"+b[i].acno+"</td><td id='bfryname_row"+srno+"'>"+b[i].bfryname+"</td><td id='bfryadrs_row"+srno+"'>"+b[i].bfryadrs+"</td><td id='accurncy_row"+srno+"'>"+b[i].accurncy+"</td><td class='sumder alnum' class='sumder alnum' id='outbal_row"+srno+"'>"+b[i].outbal+"</td><td id='dttran_row"+srno+"'>"+b[i].dttran+"</td><td id='rmrk_row"+srno+"'>"+b[i].rmrk+"</td></tr>") ; 
							
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
		url : "SUP1000det4",
		data : pymd,
		dataType : 'json',
		type : 'POST',
		async : false,
		success : function(res) {	
		//	alert("refePYM100"+refePYM100);
			
		  
			  $("#det4 tr").remove();
		  
			 
			//alert("inside the details ajax");
			var b=JSON.parse(res.sec1SUP1000d4);
			 console.log(b);
			
				 	if(f=="onload"){
				 		$(".modify").show();
				 		$("#rmks3").hide();
				 		for(var i=0;i<b.length;i++){
				 			$("#det4").append("<tr><td id='unqid_row"+srno+"'>"+b[i].unqid+"</td><td id='s3dtddchq_row"+srno+"'>"+b[i].s3dtddchq+"</td><td id='s3ddchqno_row"+srno+"'>"+b[i].s3ddchqno+"</td><td id='name_row"+srno+"'>"+b[i].name+"</td><td id='adrs_row"+srno+"'>"+b[i].adrs+"</td><td id='acno_row"+srno+"'>"+b[i].acno+"</td><td id='bfryname_row"+srno+"'>"+b[i].bfryname+"</td><td id='bfryadrs_row"+srno+"'>"+b[i].bfryadrs+"</td><td id='accurncy_row"+srno+"'>"+b[i].accurncy+"</td><td class='sumder alnum'  id='outbal_row"+srno+"'>"+b[i].outbal+"</td><td id='dttran_row"+srno+"'>"+b[i].dttran+"</td><td id='s1dettyp_row"+srno+"'>"+b[i].s1dettyp+"</td><td id='rmrk_row"+srno+"'>"+b[i].rmrk+"</td><td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>" ) ; 
						 srno++;
						 
						
							}
						 $("#divLoading").removeClass('show');
						$("#rowno").val(srno);
				 	}else if(f=="frmsum"){
				 		$(".add").hide();//add button hide
				 	
				 		$(".modify").hide();//modify in the header hide
				 		
				 		$("#rmks3").show();
				 		
						  
				 		for(var i=0;i<b.length;i++){
				 			
				 			$("#det4").append("<tr><td id='unqid_row"+srno+"'>"+b[i].unqid+"</td><td id='s3dtddchq_row"+srno+"'>"+b[i].s3dtddchq+"</td><td id='s3ddchqno_row"+srno+"'>"+b[i].s3ddchqno+"</td><td id='name_row"+srno+"'>"+b[i].name+"</td><td id='adrs_row"+srno+"'>"+b[i].adrs+"</td><td id='acno_row"+srno+"'>"+b[i].acno+"</td><td id='bfryname_row"+srno+"'>"+b[i].bfryname+"</td><td id='bfryadrs_row"+srno+"'>"+b[i].bfryadrs+"</td><td id='accurncy_row"+srno+"'>"+b[i].accurncy+"</td><td id='outbal_row"+srno+"'>"+b[i].outbal+"</td><td id='dttran_row"+srno+"'>"+b[i].dttran+"</td><td id='s1dettyp_row"+srno+"'>"+b[i].s1dettyp+"</td><td id='rmrk_row"+srno+"'>"+b[i].rmrk+"</td></tr>" ) ; 

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
							url : "SUP1000sec1",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec1 tr").remove();
								 
								
								var b=JSON.parse(res.sec1SUP1000);
								 console.log(b);
								
                                 
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec1").append("<tr><td id='slno"+srno+"'>"+b[i].slno+"</td><td id='s1dettyp"+srno+"'>"+b[i].s1dettyp+"</td><td id='unqid"+srno+"'>"+b[i].unqid+"</td><td id='acno"+srno+"'>"+b[i].acno+"</td><td id='name"+srno+"'>"+b[i].name+"</td><td id='adrs"+srno+"'>"+b[i].adrs+"</td><td id='lstrandt"+srno+"'>"+b[i].lstrandt+"</td><td id='accurncy"+srno+"'>"+b[i].accurncy+"</td><td id='outbal"+srno+"'>"+b[i].outbal+"</td><td id='dttran"+srno+"'>"+b[i].dttran+"</td><td id='s1dettyp"+srno+"'>"+b[i].s1dettyp+"</td><td id='rmrk"+srno+"'>"+b[i].rmrk+"</td><td><input type=radio style=width: 15px; onclick=fnloads("+srno+") id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   	
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "SUP1000sec2",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec2 tr").remove();
								 
								
								var b=JSON.parse(res.sec1SUP1000s2);
								
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec2").append("<tr><td id='slno"+srno+"'>"+b[i].slno+"</td><td id='"+srno+"'>"+b[i].unqid+"</td><td id='"+srno+"'>"+b[i].acno+"</td><td id='"+srno+"'>"+b[i].name+"</td><td id='"+srno+"'>"+b[i].adrs+"</td><td id='"+srno+"'>"+b[i].accurncy+"</td><td id='"+srno+"'>"+b[i].outbal+"</td><td id='"+srno+"'>"+b[i].dttran+"</td><td id='"+srno+"'>"+b[i].s1dettyp+"</td><td id='"+srno+"'>"+b[i].rmrk+"</td><td><input type=radio style=width: 15px; onclick=fnloads("+srno+") id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "SUP1000sec3",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec3 tr").remove();
								 
								
								var b=JSON.parse(res.sec1SUP1000s3);
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec3").append("<tr><td id='slno"+srno+"'>"+b[i].slno+"</td><td id='s1dettyp"+srno+"'>"+b[i].s1dettyp+"</td><td id='unqid"+srno+"'>"+b[i].unqid+"</td><td id='s3dtddchq"+srno+"'>"+b[i].s3dtddchq+"</td><td id='s3ddchqno"+srno+"'>"+b[i].s3ddchqno+"</td><td id='name"+srno+"'>"+b[i].name+"</td><td id='adrs"+srno+"'>"+b[i].adrs+"</td><td id='acno"+srno+"'>"+b[i].acno+"</td><td id='bfryname"+srno+"'>"+b[i].bfryname+"</td><td id='bfryadrs"+srno+"'>"+b[i].bfryadrs+"</td><td id='accurncy"+srno+"'>"+b[i].accurncy+"</td><td id='outbal"+srno+"'>"+b[i].outbal+"</td><td id='dttran"+srno+"'>"+b[i].dttran+"</td><td id='rmrk"+srno+"'>"+b[i].rmrk+"</td><td><input type=radio style=width: 15px; onclick=fnloads("+srno+") id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
											 srno++;
											 
											
												}
											
									 	
										
									
									}
									

						});   
						
						
						var pymd = {
								"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
							}; 
							
						$.ajax({
							url : "SUP1000sec4",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec4 tr").remove();
								 
								
								var b=JSON.parse(res.sec1SUP1000s4);
								 console.log(b);
								

									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec4").append("<tr><td id='slno"+srno+"'>"+b[i].slno+"</td><td id='unqid"+srno+"'>"+b[i].unqid+"</td><td id='s3dtddchq"+srno+"'>"+b[i].s3dtddchq+"</td><td id='s3ddchqno"+srno+"'>"+b[i].s3ddchqno+"</td><td id='name"+srno+"'>"+b[i].name+"</td><td id='adrs"+srno+"'>"+b[i].adrs+"</td><td id='acno"+srno+"'>"+b[i].acno+"</td><td id='bfryname"+srno+"'>"+b[i].bfryname+"</td><td id='bfryadrs"+srno+"'>"+b[i].bfryadrs+"</td><td id='accurncy"+srno+"'>"+b[i].accurncy+"</td><td id='outbal"+srno+"'>"+b[i].outbal+"</td><td id='dttran"+srno+"'>"+b[i].dttran+"</td><td id='s1dettyp"+srno+"'>"+b[i].s1dettyp+"</td><td id='rmrk"+srno+"'>"+b[i].rmrk+"</td><td><input type=radio style=width: 15px; onclick=fnloads("+srno+") id='edit"+srno+"'></td></tr>") ;  
									 		  
									 		 
											
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
	location.href = "XBRL_REP_SUP1000_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>
<script>
$(document).ready(function(){
	
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');

	
});   
</script>

<script>
$(document).ready(function(){

	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
	
	
	
	$('#btnback').on('click', function(e){
	    e.preventDefault();
	    window.history.back();
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

/* function funli(a){

	$("#rownoadd").val(a);
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
} */


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
		
		location.href = "XBRL_REP_SUP1000_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_SUP1000_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	
	
	$('#btnExcel').click(function() {
		if(tabid<=10){
		 SUP1000Form.action = "SUP1000EXCELREPORT.action?method=SUP1000EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 SUP1000Form.submit();
		}
		
		
		
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 SUP1000Form.action = "SUP1000EXCELSum.action?method=SUP1000EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 SUP1000Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 SUP1000Form.action = "SUP1000PDFREPORT.action?method=SUP1000PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 SUP1000Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  SUP1000Form.action = "XMLDOWNLOAD.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 SUP1000Form.submit(); 
	});
	$("#btnfilter").on("click",function(){
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
		}else{
			$(".form-control2").val("");
			$(".form-control2").prop("disabled",true);
		}
		
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
	$("#det"+tabid).prepend("<tr><td  id='s1dettyp_row"+rowno+"'><input type='text'  id='s1dettyp_text"+rowno+"' style='    width:80px;'></td><td  id='unqid_row"+rowno+"'><input type='text' id='unqid_text"+rowno+"' style='     width: 80px;'></td><td  id='acno_row"+rowno+"'><input type='text' 	id='acno_text"+rowno+"'  style='    width: 80px;'></td><td   id='name_row"+rowno+"'><input type='text' id='name_text"+rowno+"' style='    width: 80px;'></td><td  id='adrs_row"+rowno+"' ><input type='text'  id='adrs_text"+rowno+"'    style='    width: 80px;'><td  id='s3dtddchq_row"+rowno+"'><input type='text' id='s3dtddchq_text"+rowno+"'  class='date' style='    width: 80px;'></td><td  id='accurncy_row"+rowno+"'><input type='text'  id='accurncy_text"+rowno+"' style='width: 80px;'></td><td class='sumder alnum'  id='outbal_row"+rowno+"'><input type='text' id='outbal_text"+rowno+"' style='width:284px;' class='decimalPt roundUp' ></td><td  id='dttran_row"+rowno+"'><input type='text' id='dttran_text"+rowno+"' style='width: 80px;'></td><td  id='rmrk_row"+rowno+"'><input type='text' id='rmrk_text"+rowno+"' style='width: 80px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");
	}
	
	else if(tabid==2){
		$("#det"+tabid).prepend("<tr><td   id='unqid_row"+rowno+"'><input type='text' id='unqid_text"+rowno+"' style='     width: 80px;'></td><td  id='acno_row"+rowno+"'><input type='text' 	id='acno_text"+rowno+"'  style='    width: 80px;'></td><td  id='name_row"+rowno+"'><input type='text' id='name_text"+rowno+"' style='    width: 80px;'></td><td  id='adrs_row"+rowno+"' ><input type='text'  id='adrs_text"+rowno+"'    style='    width: 80px;'><td  id='accurncy_row"+rowno+"'><input type='text' id='accurncy_text"+rowno+"' style='width: 100px;'></td><td  class='sumder alnum' id='outbal_row"+rowno+"'><input type='text' id='outbal_text"+rowno+"' class='decimalPt roundUp' style='width:284px;'></td><td  id='dttran_row"+rowno+"'><input type='text' id='dttran_text"+rowno+"' style='width: 80px;'></td><td  id='s1dettyp_row"+rowno+"'><input type='text'  id='s1dettyp_text"+rowno+"' style='    width:80px;'></td><td  id='rmrk_row"+rowno+"'><input type='text' id='rmrk_text"+rowno+"' style='width: 80px;'></td><td  ><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 80px;display:none;text-align:center;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 30px; ' onclick=save_row('"+rowno+"')></td></tr>");
	}
	else if(tabid==3){
		$("#det"+tabid).prepend("<tr><td id='s1dettyp_row"+rowno+"'><input type='text'  id='s1dettyp_text"+rowno+"' style='    width:80px;'></td><td id='unqid_row"+rowno+"'><input type='text' id='unqid_text"+rowno+"' style='     width: 80px;'></td><td id='s3dtddchq_row"+rowno+"'><input type='text' 	id='s3dtddchq_text"+rowno+"'  style='    width: 80px;'></td><td id='s3ddchqno_row"+rowno+"'><input type='text' id='s3ddchqno_text"+rowno+"' style='    width: 80px;'></td><td id='name_row"+rowno+"' ><input type='text'  id='name_text"+rowno+"'    style='    width: 80px;'><td id='adrs_row"+rowno+"'><input type='text' id='adrs_text"+rowno+"' style='    width: 80px;'></td><td id='acno_row"+rowno+"'><input type='text' id='acno_text"+rowno+"' style='width: 80px;'></td><td  id='bfryname_row"+rowno+"'><input type='text' id='bfryname_text"+rowno+"' style='width: 80px;'></td><td id='bfryadrs_row"+rowno+"'><input type='text' id='bfryadrs_text"+rowno+"' style='width: 80px;'></td><td id='accurncy_row"+rowno+"'><input type='text' id='accurncy_text"+rowno+"' style='width: 80px;'></td><td class='sumder alnum' id='outbal_row"+rowno+"'><input type='text' class='decimalPt roundUp' id='outbal_text"+rowno+"' style='width: 80px;'></td><td id='dttran_row"+rowno+"'><input type='text' id='dttran_text"+rowno+"' style='width: 80px;'></td><td id='rmrk_row"+rowno+"'><input type='text' id='rmrk_text"+rowno+"' style='width: 80px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");
	}
	else {
		$("#det"+tabid).prepend("<tr><td id='unqid_row"+rowno+"'><input type='text' id='unqid_text"+rowno+"' style='     width: 80px;'></td><td id='s3dtddchq_row"+rowno+"'><input type='text' 	id='s3dtddchq_text"+rowno+"'  style='    width: 80px;'></td><td id='s3ddchqno_row"+rowno+"'><input type='text' id='s3ddchqno_text"+rowno+"' style='    width: 80px;'></td><td id='name_row"+rowno+"' ><input type='text'  id='name_text"+rowno+"'    style='    width: 80px;'><td id='adrs_row"+rowno+"'><input type='text' id='adrs_text"+rowno+"' style='    width: 80px;'></td><td id='acno_row"+rowno+"'><input type='text' id='acno_text"+rowno+"' style='width: 80px;'></td><td  id='bfryname_row"+rowno+"'><input type='text' id='bfryname_text"+rowno+"' style='width: 80px;'></td><td id='bfryadrs_row"+rowno+"'><input type='text' id='bfryadrs_text"+rowno+"' style='width: 80px;'></td><td id='accurncy_row"+rowno+"'><input type='text' id='accurncy_text"+rowno+"' style='width: 80px;'></td><td class='sumder alnum' id='outbal_row"+rowno+"'><input type='text' class='decimalPt roundUp' id='outbal_text"+rowno+"' style='width: 80px;'></td><td id='dttran_row"+rowno+"'><input type='text' id='dttran_text"+rowno+"' style='width: 80px;'></td><td id='s1dettyp_row"+rowno+"'><input type='text'  id='s1dettyp_text"+rowno+"' style='    width:80px;'></td><td id='rmrk_row"+rowno+"'><input type='text' id='rmrk_text"+rowno+"' style='width: 80px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");
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
		  if (!isNaN(value)) {
		    $(this).val(parseFloat(value).toFixed(2));
		  }
		});


	}); 

		
});	


</script>
<script>


function fnkeyup(a){
	$("#s3dtddchq_text"+a).datepicker({
	dateFormat: "dd-mm-yy",
	        changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: "today"
	});


	$("#dttran_text"+a).datepicker({
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
	
	
	

//alert("happyyyyyyyyyyyyy");
//alert("hiii 2d AGccccccccc" +  edit_row(no));
$(".add").attr("disabled",true);
$("#addrowno").val("0");
	
	document.getElementById("edit_button"+no).style.display="none";
	  document.getElementById("save_button"+no).style.display="block";
	 	


var	outbal =  document.getElementById("outbal_row"+no);
var outbal_data = outbal.innerHTML;



outbal.innerHTML="<input type='text' class='decimalPt roundUp'  id='outbal_text"+no+"'  style='width: 83px'; value='"+outbal_data+"'>";




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
  if (!isNaN(value)) {
    $(this).val(parseFloat(value).toFixed(2));
  }
});


}


function save_row(no)
{
$(".add").attr("disabled",false);
document.getElementById("edit_button"+no).checked = false;

var outbal_val=document.getElementById("outbal_text"+no).value;

document.getElementById("outbal_row"+no).innerHTML=outbal_val;

if(tabid<=2){
if($("#addrowno").val()=="1"){
	
	
/* var  slno_val=document.getElementById("slno_text"+no).value;	 
document.getElementById("slno_row"+no).innerHTML=slno_val;
 */
 
 
   var s1dettyp_val=document.getElementById("s1dettyp_text"+no).value;
   document.getElementById("s1dettyp_row"+no).innerHTML=s1dettyp_val;

  var unqid_val=document.getElementById("unqid_text"+no).value;
   document.getElementById("unqid_row"+no).innerHTML=unqid_val;
  
   var acno_val=document.getElementById("acno_text"+no).value;
	document.getElementById("acno_row"+no).innerHTML=acno_val;
	
  var  name_val=document.getElementById("name_text"+no).value;	 
  document.getElementById("name_row"+no).innerHTML=name_val;
  
  var adrs_val=document.getElementById("adrs_text"+no).value;	 
  document.getElementById("adrs_row"+no).innerHTML=adrs_val;
  
  if(tabid==1){
	 
  var s3dtddchq_val=document.getElementById("s3dtddchq_text"+no).value;
  document.getElementById("s3dtddchq_row"+no).innerHTML=s3dtddchq_val;
  }
  var accurncy_val=document.getElementById("accurncy_text"+no).value;
	document.getElementById("accurncy_row"+no).innerHTML=accurncy_val;
	
 var  dttran_val=document.getElementById("dttran_text"+no).value;	 
 document.getElementById("dttran_row"+no).innerHTML=dttran_val;
 
 var rmrk_val=document.getElementById("rmrk_text"+no).value;	 
 document.getElementById("rmrk_row"+no).innerHTML=rmrk_val;
}

document.getElementById("edit_button"+no).style.display="block";
document.getElementById("save_button"+no).style.display="none";


 //var slno=document.getElementById("slno_row"+no).innerHTML;	 
   var s1dettyp=document.getElementById("s1dettyp_row"+no).innerHTML;
  
  var unqid=document.getElementById("unqid_row"+no).innerHTML;
  
  
  var acno=document.getElementById("acno_row"+no).innerHTML;
 
  var name=document.getElementById("name_row"+no).innerHTML;
 
  var adrs=document.getElementById("adrs_row"+no).innerHTML;
  if(tabid==1){
  var s3dtddchq=document.getElementById("s3dtddchq_row"+no).innerHTML;	 
  }
  var accurncy=document.getElementById("accurncy_row"+no).innerHTML;
  var outbal=document.getElementById("outbal_row"+no).innerHTML;
  var dttran=document.getElementById("dttran_row"+no).innerHTML;	
  var rmrk=document.getElementById("rmrk_row"+no).innerHTML;	 
  

 $("#det1 td").attr("padding","8px");
var refeSUP1000=document.getElementById("refDisplay").innerHTML;
outbal=outbal.replace(/\,/g,'');
outbal=Number(outbal);


if(tabid==1){
var rptdate1 = {
		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeSUP1000,"s1dettyp":s1dettyp,"unqid" : unqid,"acno":acno, "name":name,"adrs":adrs,"s3dtddchq":s3dtddchq,"accurncy":accurncy,"outbal":outbal,"dttran":dttran,"rmrk":rmrk,"tabid":tabid
		}; 
}

if(tabid==2){
var rptdate1 = {
		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeSUP1000,"s1dettyp":s1dettyp,"unqid" : unqid,"acno":acno, "name":name,"adrs":adrs,"accurncy":accurncy,"outbal":outbal,"dttran":dttran,"rmrk":rmrk,"tabid":tabid
		}; 
}

$.ajax({
    url : "SUP1000",
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

else{
	
	

	if($("#addrowno").val()=="1"){
	/* var  slno_val=document.getElementById("slno_text"+no).value;	 
	document.getElementById("slno_row"+no).innerHTML=slno_val; */
	
	var  s1dettyp_val=document.getElementById("s1dettyp_text"+no).value;	 
	document.getElementById("s1dettyp_row"+no).innerHTML=s1dettyp_val;
	var  unqid_val=document.getElementById("unqid_text"+no).value;	 
	document.getElementById("unqid_row"+no).innerHTML=unqid_val;
	var  s3dtddchq_val=document.getElementById("s3dtddchq_text"+no).value;	 
	document.getElementById("s3dtddchq_row"+no).innerHTML=s3dtddchq_val;
	var  s3ddchqno_val=document.getElementById("s3ddchqno_text"+no).value;	 
	document.getElementById("s3ddchqno_row"+no).innerHTML=s3ddchqno_val;
	var  name_val=document.getElementById("name_text"+no).value;	 
	document.getElementById("name_row"+no).innerHTML=name_val;
	var  adrs_val=document.getElementById("adrs_text"+no).value;	 
	document.getElementById("adrs_row"+no).innerHTML=adrs_val;
	var  acno_val=document.getElementById("acno_text"+no).value;	 
	document.getElementById("acno_row"+no).innerHTML=acno_val;
	var  bfryname_val=document.getElementById("bfryname_text"+no).value;	 
	document.getElementById("bfryname_row"+no).innerHTML=bfryname_val;
	var  bfryadrs_val=document.getElementById("bfryadrs_text"+no).value;	 
	document.getElementById("bfryadrs_row"+no).innerHTML=bfryadrs_val;
	var  accurncy_val=document.getElementById("accurncy_text"+no).value;	 
	document.getElementById("accurncy_row"+no).innerHTML=accurncy_val;
	
	var  dttran_val=document.getElementById("dttran_text"+no).value;	 
	document.getElementById("dttran_row"+no).innerHTML=dttran_val;
	var  rmrk_val=document.getElementById("rmrk_text"+no).value;	 
	document.getElementById("rmrk_row"+no).innerHTML=rmrk_val;

	}

	document.getElementById("edit_button"+no).style.display="block";
	document.getElementById("save_button"+no).style.display="none";


	// var slno=document.getElementById("slno_row"+no).innerHTML;	 
	   var s1dettyp=document.getElementById("s1dettyp_row"+no).innerHTML;
	  var unqid=document.getElementById("unqid_row"+no).innerHTML;
		 var s3dtddchq=document.getElementById("s3dtddchq_row"+no).innerHTML;	 
		   var s3ddchqno=document.getElementById("s3ddchqno_row"+no).innerHTML;
		  var name=document.getElementById("name_row"+no).innerHTML;
		 var adrs=document.getElementById("adrs_row"+no).innerHTML;	 
		   var acno=document.getElementById("acno_row"+no).innerHTML;
		  var bfryname=document.getElementById("bfryname_row"+no).innerHTML;
			 var bfryadrs=document.getElementById("bfryadrs_row"+no).innerHTML;	 
			   var accurncy=document.getElementById("accurncy_row"+no).innerHTML;
			  var outbal=document.getElementById("outbal_row"+no).innerHTML;
			  var dttran=document.getElementById("dttran_row"+no).innerHTML;
			  var rmrk=document.getElementById("rmrk_row"+no).innerHTML;
	  

	 $("#det1 td").attr("padding","8px");
	var refeSUP1000=document.getElementById("refDisplay").innerHTML;
	outbal=outbal.replace(/\,/g,'');
	outbal=Number(outbal);

	


 var rptdate1 = {
		     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeSUP1000, "s1dettyp":s1dettyp,"unqid" : unqid, "s3dtddchq":s3dtddchq,"s3ddchqno":s3ddchqno,"name" : name, "adrs":adrs,"acno":acno,"bfryname" : bfryname, "bfryadrs":bfryadrs,"accurncy":accurncy,"outbal" : outbal,"dttran":dttran,"rmrk" : rmrk,"tabid":tabid
		}; 

 $.ajax({
     url : "SUP1000d34",
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

}


 

</script> 

<SCRIPT>

function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_SUP1000_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>

<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="SUP1000Form"
		enctype="multipart/form-data">
             	<div class="tab-content" >
	 	<div class="active psc0105" id="tab2" style="width: 968px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="  margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>SUP1000 - Abandoned_Funds_Abandoned Funds and Unclaimed demand drafts and/or cheques
<b id="sub"
					Style="display: none"></b></b></font>
			<br></div> 
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
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:right;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
			
				
				
			 <!--******************SUMMARY SECTION 4********************************-->   		
				
				
				   <table class="table" id="tb4" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="15" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>List of refund of unclaimed demand drafts and cheques for complete and incomplete details													
</b>  </td></tr>
            <tr>
          <th style="text-align:center" ROWSPAN="2">Sr.No.</th>
           <th rowspan="1" style="text-align:center">Unique identifier of account holder</th>									
<th rowspan="1" style="text-align:center">Date of issue of demand draft / cheque</th>									
<th rowspan="1" style="text-align:center">Draft / Cheque number</th>									
<th rowspan="1" style="text-align:center">Name of ordering customer</th>									
<th rowspan="1" style="text-align:center">Address of ordering customer</th>									
<th rowspan="1" style="text-align:center">Account number of ordering customer</th>									
<th rowspan="1" style="text-align:center">Name of beneficiary</th>									
<th rowspan="1" style="text-align:center">Address of beneficiary</th>									
<th rowspan="1" style="text-align:center">Currency in which demand draft and/or cheque was issued</th>									
<th rowspan="1" style="text-align:center">Amount of demand draft and/or cheque (to be reported in currency in which it was issued)</th>									
<th rowspan="1" style="text-align:center;width: 100px;">Exact date of transfer of amount to BOM</th>									
<th rowspan="1" style="text-align:center"> Original details sent to BOM was with complete /  incomplete details</th>									
<th rowspan="1" style="text-align:center">Remarks</th>									

            <th  rowspan="2"  style="text-align:center" id="">Select</th>
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
              <th style="text-align:center">L</th>
            <th style="text-align:center">M</th>
          </tr>
          
           <tbody class="databody" id="sec4"></tbody>
          
          
          </table>
          
			 <!--******************SUMMARY SECTION 3********************************-->   		
		
				   <table class="table" id="tb3" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="15" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>List of unclaimed demand drafts and/or cheques for complete and incomplete details													
</b>  </td></tr>
            <tr>
            <th rowspan="2" style="text-align:center">Sr.No</th>
           <th rowspan="1" style="text-align:center" >Complete / Incomplete Details</th>										
<th rowspan="1" style="text-align:center">Unique identifier of account holder</th>										
<th rowspan="1" style="text-align:center">Date of issue of demand draft / cheque</th>										
<th rowspan="1" style="text-align:center">Draft / Cheque number</th>										
<th rowspan="1" style="text-align:center">Name of ordering customer</th>										
<th rowspan="1" style="text-align:center">Address of ordering customer</th>										
<th rowspan="1" style="text-align:center">Account number of ordering customer</th>										
<th rowspan="1" style="text-align:center">Name of beneficiary</th>										
<th rowspan="1" style="text-align:center">Address of beneficiary</th>										
<th rowspan="1" style="text-align:center">Currency in which demand draft and/or cheque was issued</th>										
<th rowspan="1" style="text-align:center">Amount of demand draft and/or cheque (to be reported in currency in which it was issued)</th>										
<th rowspan="1" style="text-align:center;width: 100px;">Exact date of transfer of amount to BOM</th>										
<th rowspan="1" style="text-align:center">Remarks</th>										
<th rowspan="2" id="" style="text-align:center">Select</th>
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
              <th style="text-align:center">L</th>
            <th style="text-align:center">M</th>
            </tr>
         
          </tr>
             <tbody class="databody" id="sec3"></tbody>
          </table>
	 <!--******************SUMMARY SECTION2********************************-->   			
			
            <table class="table" id="tb2" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="13" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>List of abandoned funds for complete and incomplete details										
</b>  </td></tr>
            <tr>
            <th rowspan="3" style="text-align:center">Sr.No</th>
          								
<th rowspan="1" style="text-align:center">Unique identifier of account holder</th>								
<th rowspan="1" style="text-align:center">Account number of account holder</th>								
<th rowspan="1" style="text-align:center">Full name of account holder</th>								
<th rowspan="1" style="text-align:center">Last known address of account holder</th>								
<th rowspan="1" style="text-align:center">Currency in which account is held</th>								
<th rowspan="1" style="text-align:center">Amount  of outstanding balance  in account (to be reported in currency in which account is held)</th>								
<th rowspan="1" style="text-align:center;width: 100px;">Exact date of transfer of amount to BOM</th>								
<th rowspan="1" style="text-align:center"> Original details sent to BOM was with complete / incomplete details</th>								
<th rowspan="1" style="text-align:center">Remarks</th>								


          <th rowspan="3" id="modify"  style="text-align:center">Select</th>
          </tr>
          
         
          <tr>
                    <tr><th style="text-align:center">A</th><th style="text-align:center">B</th> <th style="text-align:center">C</th><th style="text-align:center">D</th><th style="text-align:center">E</th> <th style="text-align:center">F</th><th style="text-align:center">G</th><th style="text-align:center">H</th> <th style="text-align:center">I</th>

          </tr>
             <tbody class="databody" id="sec2"></tbody>
          </table>
          
  <!--******************SUMMARY SECTION1********************************-->   
               
               <table class="table" id="tb1" style="width:100%;display:none;margin-top:-20px;"><tr ><td colspan="13" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>List of abandoned funds for complete and incomplete details										
          </b>  </td></tr>
          
          <tr>
          <th rowspan="2" style="text-align:center">Sr.No</th>
         <th rowspan="1"  style="text-align:center">Complete / Incomplete Details</th>						
<th rowspan="1"  style="text-align:center">Unique identifier of account holder</th>						
<th rowspan="1"  style="text-align:center">Account number of account holder</th>						
<th rowspan="1"  style="text-align:center">Full name of account holder</th>						
<th rowspan="1"  style="text-align:center">Last known address of account holder</th>						
<th rowspan="1"  style="text-align:center">Last transaction date</th>						
<th rowspan="1"  style="text-align:center">Currency in which account is held</th>						
<th rowspan="1"  style="text-align:center">Amount of outstanding balance in  account (to be reported in currency in which account is held)</th>						
<th rowspan="1"  style="text-align:center">Exact date of transfer of amount to BOM</th>						
<th rowspan="1"  style="text-align:center">Remarks</th>						

          <th rowspan="2" id=""  style="text-align:center">Select</th>
          </tr>
          
          <tr><th style="text-align:center">A</th><th style="text-align:center">B</th> <th style="text-align:center">C</th><th style="text-align:center">D</th><th style="text-align:center">E</th> <th style="text-align:center">F</th><th style="text-align:center">G</th><th style="text-align:center">H</th> <th style="text-align:center">I</th><th style="text-align:center">J</th>
          <tr>
         
   
    
          </tr>   <tbody class="databody" id="sec1"></tbody>
          </table>
          
          
          
            <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
      <!-- <button type="button" class="btn btn-xs btn-primary"   value="back" id="btnpre">Previous</button> -->
    
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
      <!--  <button type="button" class="btn btn-xs btn-primary"   value="back" id="btnnext">Next</button> -->
      <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div>
          
            </div>
            
            
            
            
            
            
<div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			<div class="active" id="tab1" style="width: 1317px;padding-top: 1px;margin-top: -17px;" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;">SUP1000 - <b id="sub" style="display: none"></b></b><b>List of Abandoned Funds
			
			<b id="sub"
					Style="display: none"></b></b></font>
			<br><br></div>
			<div id="divLoading"> </div>
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
				
           <table class="" style="width:1317px;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:right;background-color: #bbc3cb;width: 325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab" id="sumfirst"><span class="headingtab"  >Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a><a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a>
    </td></tr>
          		  </table>
       
            <div class="panel panel-primary filterable"  style="margin-top:-20px">
           
				   <table class="table" id="detb1" style="width:100%;margin-top:-2px;">   <thead><tr ><td colspan="15" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>List of Abandoned Funds
</b>  </td></tr>
            
            
					 <tr class="filters">
					 
<!-- 						<th  style="text-align:center;width:100px;"><input style="text-align:center;width:100px;" type="text" id="accno1" onkeyup="myFunction(this.id,0)"class="form-control2" placeholder="Serial Number" disabled></th>
 -->						<th style="text-align:center;width:80px;"> <input style="text-align:center;width:80px;" type="text" id="accname1" onkeyup="myFunction(this.id,0)"class="form-control2" placeholder="Detail Type" disabled></th>						
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="uqid1" onkeyup="myFunction(this.id,1)"class="form-control2" placeholder="Unique ID" disabled></th>
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="adrs1" onkeyup="myFunction(this.id,2)"class="form-control2" placeholder="Account Number" disabled></th>
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="lstrandt1" onkeyup="myFunction(this.id,3)"class="form-control2" placeholder="Name" disabled></th>						
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="accurncy1" onkeyup="myFunction(this.id,4)"class="form-control2" placeholder="Address" disabled></th>		
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:100px;"  type="text" id="outbal1" onkeyup="myFunction(this.id,5)"class="form-control2" placeholder="Last Transaction Date" disabled></th>	
						<th style="text-align:center;width:100px;"><input style="text-align:center;width:100px;" type="text" id="dttfr1" onkeyup="myFunction(this.id,6)"class="form-control2" placeholder="Account Currency" disabled></th>
						<th style="text-align:center;width:284px;"><input style="text-align:center;width:284px;" type="text" id="rmrk1" onkeyup="myFunction(this.id,7)"class="form-control2" placeholder="Out Balance" disabled></th>						
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="dtddchq1" onkeyup="myFunction(this.id,8)"class="form-control2" placeholder="Date of Transfer" disabled></th>
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="ddchqno1" onkeyup="myFunction(this.id,9)"class="form-control2" placeholder="Remarks" disabled></th>
						<th style="text-align:center;width:50px;" id="modify"  class="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
				


 					<tbody class="databody" id="det1">
 


              </tbody>
              
				</table>
				<table class="table" id="detb2" style="width:100%;margin-top:-2px;">   <thead><tr ><td colspan="15" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>List of Abandoned Funds
</b>  </td></tr>
            
            
					 <tr class="filters">
					 
<!-- 						<th  style="text-align:center;width:100px;"><input type="text" id="srno2" onkeyup="myFunction(this.id,0)" style="text-align:center;width:100px;"class="form-control2" placeholder="Serial Number" disabled></th>
 -->						<th style="text-align:center;width:80px;"><input type="text" id="uqid2" onkeyup="myFunction2(this.id,0)" style="text-align:center;width:80px;"class="form-control2" placeholder="Unique ID" disabled></th>
						<th style="text-align:center;width:80px;"><input type="text" id="adrs2" onkeyup="myFunction2(this.id,1)"class="form-control2" style="text-align:center;width:80px;"  placeholder="Account Number" disabled></th>
						<th style="text-align:center;width:80px;"><input type="text" id="lstrandt2" onkeyup="myFunction2(this.id,2)"class="form-control2" style="text-align:center;width:80px;"  placeholder="Name" disabled></th>						
						<th style="text-align:center;width:80px;"><input type="text" id="accurncy2" onkeyup="myFunction2(this.id,3)"class="form-control2" style="text-align:center;width:80px;" placeholder="Address" disabled></th>		
						<th style="text-align:center;width:100px;"><input type="text" id="dttfr2" onkeyup="myFunction2(this.id,4)"class="form-control2" style="text-align:center;width:100px;" placeholder="Account Currency" disabled></th>
						<th style="text-align:center;width:284px;"><input type="text" id="rmrk2" onkeyup="myFunction2(this.id,5)"class="form-control2" style="text-align:center;width:284px;" placeholder="Out Balance" disabled></th>						
						<th style="text-align:center;width:80px;"><input type="text" id="dtddchq2" onkeyup="myFunction2(this.id,6)"class="form-control2" style="text-align:center;width:80px;" placeholder="Date of Transfer" disabled></th>
						<th style="text-align:center;width:80px;"> <input type="text" id="accname2" onkeyup="myFunction2(this.id,7)"class="form-control2" style="text-align:center;width:80px;" placeholder="Detail Type" disabled></th>						
						<th style="text-align:center;width:80px;"><input type="text" id="ddchqno2" onkeyup="myFunction2(this.id,8)"class="form-control2" style="text-align:center;width:80px;" placeholder="Remarks" disabled></th>
						<th style="text-align:center;width:50px;" id="modify"  class="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
			<tbody class="databody" id="det2"> 


 					


              </tbody>
              
				</table>
				<table class="table" id="detb3" style="width:100%;margin-top:-2px;">   <thead><tr ><td colspan="15" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>List of Abandoned Funds
</b>  </td></tr>
            
            
					 <tr class="filters">
					 
<!-- 						<th  style="text-align:center;width:100px;"><input style="text-align:center;width:100px;" type="text" id="accno3" onkeyup="myFunction(this.id,0)"class="form-control2" placeholder="Serial Number" disabled></th>
 -->						<th style="text-align:center;width:80px;"> <input style="text-align:center;width:80px;" type="text" id="accname3" onkeyup="myFunction3(this.id,0)"class="form-control2" placeholder="Detail Type" disabled></th>						
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="uqid3" onkeyup="myFunction3(this.id,1)"class="form-control2" placeholder="Unique ID" disabled></th>
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="adrs3" onkeyup="myFunction3(this.id,2)"class="form-control2" placeholder="Date of DD Cheque" disabled></th>
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="lstrandt3" onkeyup="myFunction3(this.id,3)"class="form-control2" placeholder="DD Cheque Number" disabled></th>						
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="accurncy3" onkeyup="myFunction3(this.id,4)"class="form-control2" placeholder="Account Name" disabled></th>		
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="outbal3" onkeyup="myFunction3(this.id,5)"class="form-control2" placeholder="Address" disabled></th>	
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="dttfr3" onkeyup="myFunction3(this.id,6)"class="form-control2" placeholder="Account Number" disabled></th>
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="rmrk3" onkeyup="myFunction3(this.id,7)"class="form-control2" placeholder="Beneficiary Name" disabled></th>						
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="dtddchq3" onkeyup="myFunction3(this.id,8)"class="form-control2" placeholder="Beneficiary Address" disabled></th>
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="df3" onkeyup="myFunction3(this.id,9)"class="form-control2" placeholder="Account Currency" disabled></th>
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="fd3" onkeyup="myFunction3(this.id,10)"class="form-control2" placeholder="Out Balance" disabled></th>
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="gdr3" onkeyup="myFunction3(this.id,11)"class="form-control2" placeholder="Date of Transfer" disabled></th>
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="gcf3" onkeyup="myFunction3(this.id,12)"class="form-control2" placeholder="Remarks" disabled></th>
						<th style="text-align:center;width:50px;" id="modify"  class="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det3"> 


 					
 


              </tbody>
              
				</table> 
				  <table class="table" id="detb4" style="width:100%;margin-top:-2px;">   <thead><tr ><td colspan="15" style="text-align:center;background-color: #bbc3cb;font-size: 13px;text-align:center"><b>List of Abandoned Funds
</b>  </td></tr>
            
            
					 <tr class="filters">
<!-- 					 <th  style="text-align:center;width:100px;"><input style="text-align:center;width:100px;" type="text" id="accno" onkeyup="myFunction(this.id,0)"class="form-control2" placeholder="Serial Number" disabled></th>
 -->						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="uqid4" onkeyup="myFunction4(this.id,0)"class="form-control2" placeholder="Unique ID" disabled></th>
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="adrs4" onkeyup="myFunction4(this.id,1)"class="form-control2" placeholder="Date of DD Cheque" disabled></th>
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="lstrandt4" onkeyup="myFunction4(this.id,2)"class="form-control2" placeholder="DD Cheque Number" disabled></th>						
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="accurncy4" onkeyup="myFunction4(this.id,3)"class="form-control2" placeholder="Account Name" disabled></th>		
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="outbal4" onkeyup="myFunction4(this.id,4)"class="form-control2" placeholder="Address" disabled></th>	
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="dttfr4" onkeyup="myFunction4(this.id,5)"class="form-control2" placeholder="Account Number" disabled></th>
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="rmrk4" onkeyup="myFunction4(this.id,6)"class="form-control2" placeholder="Beneficiary Name" disabled></th>						
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="dtddchq4" onkeyup="myFunction4(this.id,7)"class="form-control2" placeholder="Beneficiary Address" disabled></th>
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="ddchqno4" onkeyup="myFunction4(this.id,8)"class="form-control2" placeholder="Account Currency" disabled></th>
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="ddchqdgno4" onkeyup="myFunction4(this.id,9)"class="form-control2" placeholder="Out Balance" disabled></th>
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="ddchqnogf4" onkeyup="myFunction4(this.id,10)"class="form-control2" placeholder="Date of Transfer" disabled></th>
						<th style="text-align:center;width:80px;"> <input style="text-align:center;width:80px;" type="text" id="accnameg4" onkeyup="myFunction4(this.id,11)"class="form-control2" placeholder="Detail Type" disabled></th>						
						<th style="text-align:center;width:80px;"><input style="text-align:center;width:80px;" type="text" id="ddchqnofg4" onkeyup="myFunction4(this.id,12)"class="form-control2" placeholder="Remarks" disabled></th>
						<th style="text-align:center;width:50px;" id="modify" class="modify">Modify</th>	
											
					
					</tr>
					
				</thead>
				
	         <tbody class="databody" id="det4"> 


 					

              </tbody>
              
				</table>
				
			</div>
		
 <br>
 <!-- <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button> -->
      <!-- <button type="button" class="btn btn-xs btn-primary" onclick="funli(1);"  value="back" id="btnpre1">Previous</button>
    
                
       <button type="button" class="btn btn-xs btn-primary" onclick="funli(2);"  value="back" id="btnnext1">Next</button> -->
  <!--     <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button></div> -->
       
			  </div>	
            
            
				
				
				 

				
				
            </div>


     </form>
    
    
</div>





</body>
</html>