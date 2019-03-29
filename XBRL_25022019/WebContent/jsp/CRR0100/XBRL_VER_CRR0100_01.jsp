<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLCRR0100Bean,dao.XBRLCRR0100Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
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

	String types=request.getParameter("types");

	String instno = request.getParameter("instno");


	String ReporefSeq = request.getParameter("ReporefSeq");

 	DecimalFormat df = new DecimalFormat("##,#0.00");
	
    %>
    
  
   
  
    

<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;url=XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" /> 

</head>
<meta charset="utf-8">

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


.table>thead>tr>th {
    vertical-align: top;
    border-bottom: 2px solid #ddd;
}

.tables {
    width: 109%;
    max-width: 117%;
    margin-bottom: 20px;
}


.glyphicon {
   
    font-weight: 600;
   
}




form {
    margin: 6px 0;
}

 .next,.previous{
 			color: blue;
 			text-decoration: underline;
 
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

/* .sumder{
	
	 text-align: right;

} */


.panel-heading {
    padding: 6px 22px;
    border-bottom: 5px solid transparent;
    height: 41px;
}

.tab-content > .active {
  display: block;
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
	
}

form {
	margin: -7px 0;
}

form input, button {
	padding: 5px;
}

table {
    width: 109%;
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
#BLSdets td{
padding:8px;
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

.modal-footer {
	text-align: center;
	border-top: 0;
	padding: 25px;
	padding-right: 208px;
}



/* 
 .tab-content .tab-pane {
 
   display: block;
}

.tab-content .tab-pane.active {
  display: none;
}
   */
.next, .previous {
  cursor: pointer;
}

.alnum{


    text-align: right;


}
#divLoading{
display:none;
} 
.show {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url('../../images/Loader.gif') 30% 30% no-repeat rgb(249,249,249);
    opacity: .8;
}

 textarea {
	text-align: center;
	overflow: hidden;
	resize: none;
	height: 40px;
	border: none;
	background-color: #f5f5f5;
	white-space: pre-wrap;
	word-wrap: break-word;
	resize: none;
	color: #a9a9a9;
	-webkit-text-fill-color: #333333;
}
</style>




<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){

	$("#btnfilter").on("click",function(){
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
			
			

			$('#accno,#accnam,#cusid,#accbalamtac,#accrcode,#natofcus,#reportdate,#tbb,#tbt,#rd').css({
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
			
			$('#accno,#accnam,#cusid,#accbalamtac,#accrcode,#natofcus,#reportdate,#tbb,#tbt,#rd').css({
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
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '#btnback').click(function() {
		 location.href="XBRL_CRT_CRR0100_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});

	$("#divLoading").removeClass('show');
	 $.ajax({
		
	     url : "CRR0100verify",
	     /* data : detcancel  , */
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 var srno=1;
				 $("#det1 tr").remove();
					var cnt1=1;
				
				var b=JSON.parse(res.det1CRR0100);
				 console.log(b);
				 if(b.length==0){
					 
					 $("#det1").append('<tr ><td colspan="9" style="text-align:center;color:red;">No Records Available</td></tr>');
					 
				 }else{
					 
				 
					 		for(var i=0;i<b.length;i++){
					 			

		                         $("#det1").append(
						 				 "<tr id='crradd"+srno+"'>"
						 				+"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
						 								                      +"<td id='accnam_row"+cnt1+"' >"+b[i].accnam+"</td>"
						 								                      +"<td  id='cusid_row"+cnt1+"' >"+b[i].cusid+"</td>"
						 								                      +"<td class='sumder alnum' id='accbalamtac_row"+cnt1+"' >"+b[i].accbalamtac+"</td>"
						 								                      +"<td class='sumder alnum' id='accrcode_row"+cnt1+"' >"+b[i].accrcode+"</td>"
						 								                      +"<td class='sumder alnum' id='natofcus_row"+cnt1+"'>"+b[i].natofcus+"</td>"
						 								                      +"<td class='sumder alnum' id='reportdate_row"+cnt1+"' >"+b[i].reportdate+"</td>"
						 								                      
						 								                    
						 													  +"<td id='modtyp_row"+cnt1+"' style='width:200px;'>"+b[i].modtyp+"</td>"
						 													  +"<td style='text-align:left' hidden id='repdate_row"+cnt1+"'>"+b[i].repdat+"</td>"
						 													  +"<td style='text-align:center;'><input type='button' id='verify_button"+cnt1+"' value='Verify' class='btn btn-xs btn-primary verify' style='width: 37px;' onclick=verify_row('"+cnt1+"')>  <input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;' onclick=Cancel_row('"+cnt1+"')><input type='hidden' id='entryuser"+cnt1+"'   value="+b[i].entryuser+"></td>"
						 													  +"</tr>");
						 								                     
					 		 
				
							
							 srno++;
							 cnt1++;
							 
							 
								} 
				 }$("#divLoading").removeClass('show');
			}
		});
	 $.ajax({
	     url : "CRR0100verify1",
	     /* data : detcancel  , */
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 var srno=1;
				 $("#det2 tr").remove();
					var cnt1=1;
				
				var b=JSON.parse(res.det2CRR0100);
				 console.log(b);
				 if(b.length==0){
					
					 $("#det2").append('<tr ><td colspan="11" style="text-align:center;color:red;">No Records Available</td></tr>');

				 }else{
					 
				 
					 		for(var i=0;i<b.length;i++){
					 			
					 			$("#det2").append(
						 				 "<tr id='crradd"+srno+"'>"


					                   	  +"<td id='trsbillstrade_row"+cnt1+"'>"+b[i].trsbillstrade+"</td>"
					                      +"<td id='trbilsbank_row"+cnt1+"' >"+b[i].trbilsbank+"</td>"
					                      +"<td  id='rdate_row"+cnt1+"' >"+b[i].rdate+"</td>"
				                    
									  +"<td id='modtyp_row"+cnt1+"' style='width:200px;'>"+b[i].modtyp+"</td>"
									  +"<td style='text-align:left' hidden id='repdate_row"+cnt1+"'>"+b[i].repdat+"</td>"
									  +"<td style='text-align:center;'><input type='button' id='verify_button"+cnt1+"' value='Verify' class='btn btn-xs btn-primary verify' style='width: 37px;' onclick=verify_row('"+cnt1+"')>  <input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;' onclick=Cancel_row('"+cnt1+"')><input type='hidden' id='entryuser"+cnt1+"'   value="+b[i].entryuser+"></td>"
									  +"</tr>");
				                     
				                      
					 			"<tr>"

					 			
      
					                      
					 		
					 		 
				
							
							 srno++;
							 cnt1++;
							 
							 
								} 
				 }$("#divLoading").removeClass('show');
			}
		});

 	

		
});	

function Cancel_row(no){
	 /*  document.getElementById("del_button"+no).style.display="inline-block"; */
	 
	if(tabid==1){
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
			  
					
	         alert("Cancellation Successful");
	       location.href="XBRL_VER_CRR0100_01.jsp";
				}
			});
	
		
		
		
		
	}
	 


function verify_row(no){

	if($("#entryuser"+no).val()=='<%=username%>'){
		alert("Same user cannot Verify");
	}else{
		
	if(tabid==1){
	
		var accbalamtac=document.getElementById("accbalamtac_row"+no).innerHTML;

		accbalamtac=accbalamtac.replace(/\,/g,'')
  	  accbalamtac=Number(accbalamtac)

	var detver={
			"accno":$("#accno_row"+no).text() ,"accnam":$("#accnam_row"+no).text(),"cusid":$("#cusid_row"+no).text(),"accbalamtac":accbalamtac,"accrcode":$("#accrcode_row"+no).text(),"natofcus":$("#natofcus_row"+no).text(),"reportdate":$("#reportdate_row"+no).text(),"tabid":tabid    
	};
	
	 $.ajax({
	     url : "CRR0100vermaster",
	     data : detver  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
		         alert(res.resalert);

         location.href = "XBRL_VER_CRR0100_01.jsp";
			}
		});
		}else
			{
			
			var detver={
				"trsbillstrade":$("#trsbillstrade_row"+no).text() ,"trbilsbank":$("#trbilsbank_row"+no).text(),"tabid":tabid,"rdate":$("#rdate_row"+no).text()
			};
			
			 $.ajax({
			     url : "CRR0100vermaster1",
			     data : detver  ,
					dataType : 'json', 
					type : 'POST',
					async : true,
					 success : function(res) {
				         alert(res.resalert);

		         location.href = "XBRL_VER_CRR0100_01.jsp";
					}
				});
			
			}
	}
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

.clr{
color: #0c0b0b;
    background-color: #f5f5f5;
    border-color: #f5f5f5;
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
	if(b==0 || b==3||b==6){
		
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
function myFunction10(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();

   table = document.getElementById("det2");

  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==0||b==1||b==2 ){
		
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


var tabid=1;
function funli(a){

	
	tabid=a;

	$("#rownoadd").val(a);
	
	
	
	if(a==1){
	
		$("#detb"+a).show();
		$("#detb2").hide();
		$("#btnpre").prop("disabled",true);
		 $("#btnnext").prop("disabled",false);
		 $("#li1").addClass("active");
		 $("#li2").removeClass("active");
		 document.getElementById("tab2").style.width = "1090px";
		 document.getElementById("tbwid1").style.width = "1090px";
		 document.getElementById("detb2").style.width = "1090px";
		
	}else if(a==2){
		$("#detb"+a).show();
		$("#detb1").hide();
		$("#btnpre").prop("disabled",false);
		 $("#btnnext").prop("disabled",true);
		 $("#li2").addClass("active");
		 $("#li1").removeClass("active");
		 document.getElementById("tab2").style.width = "950px";
		 document.getElementById("tbwid1").style.width = "950px";
		 document.getElementById("detb2").style.width = "950px";
		
	}

	
	
}

</SCRIPT>


<body>
<div class="container">
   
   
  
    
    <form class="form-horizontal" method="post" name="CRR0100Form"
		enctype="multipart/form-data">
    
    
    <div id="nav">
    <div class="loader"></div>
   
         <div id="tab3" >
			  
			 
            
            
            
            
            

 
		
	 	<div class="tab-content"  >
	 	
	 	
				
				<div class="tab-pane" id="tab2" style="width: 1090px;padding-top: 1px;margin-top: -17px;display:block;">
				
			
				
<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>CRR0100 -Statement of the Maintenance of Cash Reserve Ratio<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"> 
			 <b id="sub" style="display: none"></b></b></div>
	 
					 <div id="divLoading"> 
    </div> 
    
     
      <ul class="nav nav-tabs navright" id="mytab" style="    width: 100%; ">

					<li class=" pull-right list" id="li2" onclick="funli(2);"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" id="li1" onclick="funli(1);" ><a href="#tab1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>




				</ul>
     
    
     <table class="table" id="tbwid1"style="width:1090px;height:50px; ">
          		  <tr > <td style="background-color: #bbc3cb;"> <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;float:right;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></tr>
          		  
          		  
          		  	</table>	
          		  
          	<div class="panel panel-primary filterable">
   
					<table class="table tb1" id="detb1" border="1" style="margin-top: -20px;width:1090px">
            
          
					

					 <tr class="filters">
					 
							<th style="width:80px;text-align:center;"><textarea type="text" style="width:80px;text-align:center;" onkeyup="myFunction(this.id,0)"class="form-control2" id="accno" placeholder=" Account Number" disabled></textarea></th>
						<th style="width:280px;text-align:center;"><textarea type="text" style="width:280px;text-align:center"onkeyup="myFunction(this.id,1)"class="form-control2" id="accnam"  placeholder=" Account Name" disabled></textarea></th>						
						<th style="width:64px;text-align:center;"><textarea type="text" style="width:64px;text-align:center"onkeyup="myFunction(this.id,2)"class="form-control2" id="cusid"  placeholder="Customer Id " disabled></textarea></th>
						<th style="width:99px;text-align:center;"><textarea type="text" style="width:99px;text-align:center"onkeyup="myFunction(this.id,3)"class="form-control2" id="accbalamtac"  placeholder="Account Balance Amount Ac" disabled></textarea></th>
						<th style="width:53px;text-align:center;"><textarea type="text" style="width:53px;text-align:center"onkeyup="myFunction(this.id,4)"class="form-control2" id="accrcode"  placeholder=" Account Currency Code" disabled></textarea></th>
						<th style="width:150px;text-align:center;"><textarea type="text" style="width:150px;text-align:center" onkeyup="myFunction(this.id,5)"class="form-control2" id="natofcus"  placeholder="Nature Of Customer" disabled></textarea></th>
						<th style="width:63px;text-align:center;"><textarea type="text" style="width:63px;text-align:center" onkeyup="myFunction(this.id,6)"class="form-control2" id="reportdate"  placeholder="Report Date" disabled ></textarea></th>
						
						<th style="text-align:center;width:115px;" id="modtyp">ModType</th>						
					<th style="text-align:center;width:300px;" id="modify">Verify/Cancel</th>	
					</tr>
					
					<tbody class="databody" id="det1">

            
					
              </tbody>
              
</table> 


					<table class="table tb2" id="detb2" style="width:100%;display:none;margin-top:-20px;">
	
	 <tr class="filters">
       	<th style="text-align:center;width:225px;"><textarea type="text" style="text-align:center;width:225px;" onkeyup="myFunction10(this.id,0)"class="form-control2" id="tbb" placeholder=" Treasury Bills Bank" disabled></textarea></th>
						<th style="text-align:center;width:225px;"><textarea type="text" style="text-align:center;width:225px;"onkeyup="myFunction10(this.id,1)"class="form-control2" id="tbt"  placeholder="Treasury Bills Trade" disabled></textarea></th>						
						<th style="text-align:center;width:225px;"><textarea type="text" style="text-align:center;width:225px;"onkeyup="myFunction10(this.id,2)"class="form-control2" id="rd"  placeholder="Report Date " disabled></textarea></th>
				
							<th style="text-align:center;width:115px;" id="modtyp">ModType</th>						
					<th style="text-align:center;width:300px;" id="modify">Verify/Cancel</th>	
       </tr>   
       <tbody class="databody"  id="det2">  
          </tbody> 
           </table>

		</div>		
				
				<div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
           
               
                <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button>
            </div>


			</div>
			
			
         
        </div>
   
   </div>
   
   
    
    
     </div>
     
     </form>
    
    
</div>





</body>
</html>