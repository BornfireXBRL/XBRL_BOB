
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLSUP0400Bean,dao.XBRLSUP0400Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    <%@ page import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat,utilities.NullCheck"%>
    

   
  
    <%
    DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Date date = new Date();	
	String username = session.getAttribute("userName").toString();
    String curdate = dateFormat.format(date);
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
#det1 td{
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
			
			

			$('#grpname,#grpid,#prtyname,#uqid,#typarty,#retnsp,#prps,#appdte,#orgcurncy,#funba,#nonfunba,#funbaout,#nonfunbaout,#numrtr,#noarrdays,#insdate,#remmturtydays,#cltrltype,#cltrldesc,#lstvldt,#val,#repdate').css({
				
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
			
			$('#grpname,#grpid,#prtyname,#uqid,#typarty,#retnsp,#prps,#appdte,#orgcurncy,#funba,#nonfunba,#funbaout,#nonfunbaout,#numrtr,#noarrdays,#insdate,#remmturtydays,#cltrltype,#cltrldesc,#lstvldt,#val,#repdate').css({

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
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '#btnback').click(function() {
		 location.href="XBRL_CRT_SUP0400.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});


	 $.ajax({
	     url : "SUP0400verify",
	     /* data : detcancel  , */
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 var srno=1;
				 $("#det1 tr").remove();
					var cnt1=1;
				
				var b=JSON.parse(res.ver);
				 console.log(b);
				 
				
				 if(b.length==0){
					 $("#det1").append('<tr ><td colspan="24" style="text-align:center;color:red;">No Records Available</td></tr>');
				 }else{
					 
				 
					 		for(var i=0;i<b.length;i++){
					 			
					 			
						 		 $("#det1").append("<tr id='supadd"+cnt1+"'><td id='groupName_row"+cnt1+"'>"+b[i].groupName+"</td><td id='groupId_row"+cnt1+"'>"+b[i].groupId+"</td><td id='partyName_row"+cnt1+"'>"+b[i].partyName+"</td><td id='uniqueId_row"+cnt1+"'>"+b[i].uniqueId+"</td><td id='typeofParty_row"+cnt1+"'>"+b[i].typeofParty+"</td><td id='relationship_row"+cnt1+"'>"+b[i].relationship+"</td><td id='purpose_row"+cnt1+"'>"+b[i].purpose+"</td><td id='approvalDate_row"+cnt1+"'>"+b[i].approvalDate+"</td><td id='originalCurrency_row"+cnt1+"'>"+b[i].originalCurrency+"</td><td id='sancamtcurfb_row"+cnt1+"' class='sumder'>"+b[i].sancamtcurfb+"</td><td id='sancamtcurnfb_row"+cnt1+"' class='sumder'>"+b[i].sancamtcurnfb+"</td><td id='outamtcurfb_row"+cnt1+"' class='sumder'>"+b[i].outamtcurfb+"</td><td id='outamtcurnfb_row"+cnt1+"' class='sumder'>"+b[i].outamtcurnfb+"</td><td id='numerator_row"+cnt1+"' class='sumder'>"+b[i].numerator+"</td><td id='noofarrears_row"+cnt1+"'>"+b[i].noofarrears+"</td><td id='intRate_row"+cnt1+"' class='sumder'>"+b[i].intRate+"</td><td id='remainingMaturityDays_row"+cnt1+"'>"+b[i].remainingMaturityDays+"</td><td id='collateralType_row"+cnt1+"'>"+b[i].collateralType+"</td><td id='collateralDesc_row"+cnt1+"'>"+b[i].collateralDesc+"</td><td id='lastValuationDate_row"+cnt1+"'>"+b[i].lastValuationDate+"</td><td id='value_row"+cnt1+"' class='sumder'>"+b[i].value+"</td><td id='reportDate_row"+cnt1+"' >"+b[i].reportDate+"</td><td id='modtyp_row"+cnt1+"'>"+b[i].modtyp+"</td><td style='text-align:center;'><input type='button' id='verify_button"+cnt1+"' value='Verify' class='btn btn-xs btn-primary verify' style='width: 37px;' onclick=verify_row('"+cnt1+"')>  <input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;' onclick=Cancel_row('"+cnt1+"')><input type='hidden' id='entryuser"+cnt1+"'  value="+b[i].entryuser+"></td></tr>");

                  
					                     
					                     
					   
							 srno++;
							 cnt1++;
							 
							 
								} 
				 }$("#divLoading").removeClass('show');
			}
		});

 	

		
});	

function Cancel_row(no){
	
	var detcancel={
			"groupName":$("#groupName_row"+no).text(),"groupId":$("#groupId_row"+no).text(),"reportDate":$("#reportDate_row"+no).text()
	};
	
	 $.ajax({
	     url : "SUP0400cancel",
	     data : detcancel  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 
				 alert(res.resalert);
         location.href = "XBRL_VER_SUP0400_01.jsp";
			}
		});
}


function verify_row(no){

	if($("#entryuser"+no).val()=='<%=username%>'){
		alert("Same user cannot Verify");
	}else{

		  var sancamtcurfb=document.getElementById("sancamtcurfb_row"+no).innerHTML;
		  var sancamtcurnfb=document.getElementById("sancamtcurnfb_row"+no).innerHTML;
		  var outamtcurfb=document.getElementById("outamtcurfb_row"+no).innerHTML;
		  var outamtcurnfb=document.getElementById("outamtcurnfb_row"+no).innerHTML;
		  var numerator=document.getElementById("numerator_row"+no).innerHTML;
		  var intRate=document.getElementById("intRate_row"+no).innerHTML;
		  var value=document.getElementById("value_row"+no).innerHTML;
		 
		
	       	 sancamtcurfb=sancamtcurfb.replace(/\,/g,'');
	       	 sancamtcurfb=Number(sancamtcurfb);

	       	 sancamtcurnfb=sancamtcurnfb.replace(/\,/g,'');
	       	 sancamtcurnfb=Number(sancamtcurnfb);


	       	 outamtcurfb=outamtcurfb.replace(/\,/g,'');
	       	 outamtcurfb=Number(outamtcurfb);



	       	 outamtcurnfb=outamtcurnfb.replace(/\,/g,'');
	       	 outamtcurnfb=Number(outamtcurnfb);

	       	 numerator=numerator.replace(/\,/g,'');
	       	 numerator=Number(numerator);


	       	 intRate=intRate.replace(/\,/g,'');
	       	 intRate=Number(intRate);

	       	 value=value.replace(/\,/g,'');
	       	 value=Number(value);
	       	 
	        	
	var detver={
			
			"groupName":$("#groupName_row"+no).text() ,
			"groupId":$("#groupId_row"+no).text() ,
			"partyName":$("#partyName_row"+no).text(),
			"uniqueId":$("#uniqueId_row"+no).text(),
			"typeofParty":$("#typeofParty_row"+no).text() ,
			"relationship":$("#relationship_row"+no).text(),
			"purpose":$("#purpose_row"+no).text(),
			"approvalDate":$("#approvalDate_row"+no).text() ,
			"originalCurrency":$("#originalCurrency_row"+no).text(),
			"sancamtcurfb":sancamtcurfb,
			"sancamtcurnfb":sancamtcurnfb,
			"outamtcurfb":outamtcurfb,
			"outamtcurnfb":outamtcurnfb,
			"numerator":numerator,
			"noofarrears":$("#noofarrears_row"+no).text(),
			"intRate":intRate,
			"remainingMaturityDays":$("#remainingMaturityDays_row"+no).text(),
			"collateralType":$("#collateralType_row"+no).text(),
			"collateralDesc":$("#collateralDesc_row"+no).text(),
			"lastValuationDate":$("#lastValuationDate_row"+no).text(),
			"value":value,
			"reportDate":$("#reportDate_row"+no).text(),
			"modtyp":$("#modtyp_row"+no).text()
	};

	
	 $.ajax({
	     url : "SUP0400vermaster",
	     data : detver  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 alert(res.resalert);
         location.href = "XBRL_VER_SUP0400_01.jsp";
			}
		});
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





<body>
<div class="container">
   
   
  
    
    <form class="form-horizontal" method="post" name="SUP0400Form"
		enctype="multipart/form-data">
    
    
    <div id="nav">
    <div class="loader"></div>
   
         <div id="tab3" >
			  
			 
            
            
            
            
            

 
		
	 	<div class="tab-content"  >
	 	
	 	
				
				<div class="tab-pane" id="tab2" style="width: 4257px;padding-top: 1px;margin-top: -17px;display:block;">
<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>SUP0400-Statement of Related Party Transactions<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"> 
			 <b id="sub" style="display: none"></b></b></div>
					
					 <div id="divLoading"> 
    </div> 
     <br>
     <div class="panel panel-primary filterable">
   
    
     <table class="table" style="width:4257px;height:52px; ">
          		  <tr > <td style="background-color: #bbc3cb;"> <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;float:right;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></tr>
          		  
          		  
          		  	</table>	
          		  
          	
					<table class="table" id="tbcates" border="1" style="margin-top: 0px;width:4257px">
            
          
					

					 <tr class="filters">
		<th  style="width:136px;text-align:center;"><textarea style="width:136px;text-align:center;"type="text" id="grpname" onkeyup="myFunction(this.id,0)" class="form-control2" placeholder="Group Name" disabled></textarea></th>
						<th  style="width:46px;text-align:center;"><textarea style="width:46px;text-align:center;"type="text" id="grpid" onkeyup="myFunction(this.id,1)" class="form-control2" placeholder="Group Id" disabled></textarea></th>
						<th style="width:137px;text-align:center;"><textarea type="text"style="width:137px;text-align:center;"id="prtyname" class="form-control2" onkeyup="myFunction(this.id,2)" placeholder="Party Name" disabled></textarea></th>
						
						<th  style="width:55px;text-align:center;"><textarea style="width:55px;text-align:center;" type="text" id="uqid"  onkeyup="myFunction(this.id,3)" class="form-control2" placeholder="Unique Id" disabled></textarea></th>						
						<th style="width:176px;text-align:center;"><textarea type="text"style="width:176px;text-align:center;" class="form-control2" id="typarty" onkeyup="myFunction(this.id,4)" placeholder="Type of Party" disabled></textarea></th>
						<th style="width:1358px;text-align:center;"><textarea type="text" style="width:1358px;text-align:center;" class="form-control2" id="retnsp" onkeyup="myFunction(this.id,5)" placeholder="Relationship" disabled></textarea></th>
						<th style="width:129px;text-align:center;"><textarea type="text" style="width:129px;text-align:center;"class="form-control2" id="prps" onkeyup="myFunction(this.id,6)" placeholder="Purpose" disabled></textarea></th>
						<th style="width:65px;text-align:center;"><textarea type="text" style="width:65px;text-align:center;" class="form-control2" id="appdte" onkeyup="myFunction(this.id,7)" placeholder="Approval Date" disabled></textarea></th>
						<th style="width:55px;text-align:center;"><textarea type="text" style="width:55px;text-align:center;" class="form-control2" id="orgcurncy" onkeyup="myFunction(this.id,8)" placeholder="Original Currency" disabled></textarea></th>
		  	 		    <th style="width:109px;text-align:center;"><textarea type="text" style="width:109px;text-align:center;" class="form-control2" id="funba" onkeyup="myFunction(this.id,9)" placeholder="Fund based(Amount account currency)" disabled></textarea></th>
			     		<th  style="width:149px;text-align:center;"><textarea type="text" style="width:149px;text-align:center;" class="form-control2" id="nonfunba" onkeyup="myFunction(this.id,10)" placeholder="Non Fund based(Amount account currency" disabled></textarea></th>
						<th  style="width:149px;text-align:center;"><textarea type="text"  style="width:149px;text-align:center;" class="form-control2" id="funbaout" onkeyup="myFunction(this.id,11)" placeholder="Fund based(Outstanding amount account currency)" disabled></textarea></th>
						<th style="width:149px;text-align:center;" ><textarea type="text"  style="width:149px;text-align:center;" class="form-control2" id="nonfunbaout" onkeyup="myFunction(this.id,12)" placeholder="Non fund based(Outstanding amount account)" disabled></textarea></th>
		
						<th style="width:100px;text-align:center;"><textarea type="text" style="width:100px;text-align:center;" class="form-control2" id="numrtr" onkeyup="myFunction(this.id,13)" placeholder="Numerator" disabled></textarea></th>
						<th style="width:67px;text-align:center;"><textarea type="text" style="width:67px;text-align:center;" class="form-control2" id="noarrdays" onkeyup="myFunction(this.id,14)" placeholder="No of Arrear Days" disabled></textarea></th>
						<th style="width:60px;text-align:center;"><textarea type="text" style="width:60px;text-align:center;" class="form-control2" id="insdate" onkeyup="myFunction(this.id,15)" placeholder="Interest Rate" disabled></textarea></th>
						<th style="width:71px;text-align:center;"><textarea type="text" style="width:71px;text-align:center;" class="form-control2" id="remmturtydays" onkeyup="myFunction(this.id,16)" placeholder="Remaining Maturity Days" disabled></textarea></th>
						<th style="width:150px;text-align:center;"><textarea type="text" style="width:150px;text-align:center;" class="form-control2" id="cltrltype" onkeyup="myFunction(this.id,17)" placeholder="Collateral Type" disabled></textarea></th>
						<th style="width:150px;text-align:center;"><textarea type="text" style="width:150px;text-align:center;" class="form-control2" id="cltrldesc" onkeyup="myFunction(this.id,18)" placeholder="Collateral Description" disabled></textarea></th>
						<th style="width:74px;text-align:center;"><textarea type="text" style="width:74px;text-align:center;" class="form-control2" id="lstvldt" onkeyup="myFunction(this.id,19)" placeholder="Last Valuation Date" disabled></textarea></th>
						<th style="width:92px;text-align:center;"><textarea type="text" style="width:92px;text-align:center;" class="form-control2" id="val" onkeyup="myFunction(this.id,20)" placeholder="Value" disabled></textarea></th>
						<th style="width:73px;text-align:center;"><textarea type="text" style="width:73px;text-align:center;"class="form-control2" id="repdate" onkeyup="myFunction(this.id,21)" placeholder="Report Date" disabled></textarea></th>
						
						
						<th style="text-align:center;width:66px;" id="modtyp">ModType</th>						
						<th style="text-align:center;width:170px;" id="modify">Verify/Cancel</th>	
					</tr>
					
					<tbody class="databody" id="det1">

            
					
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