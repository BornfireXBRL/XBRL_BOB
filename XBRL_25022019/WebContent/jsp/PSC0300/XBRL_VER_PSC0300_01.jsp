<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="bean.XBRLPSC0300Bean,dao.XBRLPSC0300Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>

<%@ page
	import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat,utilities.NullCheck"%>




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
<meta http-equiv="refresh"
	content="<%=session.getMaxInactiveInterval() %>;url=XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" />

</head>
<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>XBRL REPORT</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="ib.viewport">
<!-- Bootstrap 3.3.6 -->

<link rel="stylesheet" href="../../css/bootstrap.min.css">
<!-- style page -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

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

.next, .previous {
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

#filter {
	padding: 25px;
}

.form-horizontal .form-group {
	margin-top: -13px;
	margin-right: -93px;
	margin-left: -15px;
}

.sumdet {
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

.tab-content>.active {
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

table td {
	padding: 2px;
	text-align: left;
	font-size: 10px;
	font-family: arial;
	background-color: white;
}

#DCGdets td {
	padding: 8px;
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

.alnum {
	text-align: right;
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
			 $('#accno,#custid,#custname,#systp,#syscode,#uqid,#nrefg,#iscode,#cntrycode,#snamt,#outstdamt,#acccurcode,#resfg,#resdate,#nfblimit,#nfboutstd,#npaflg,#secflg,#secamt,#arrday,#arramt,#loanratio,#spcprvsn,#npareason,#repdt').css({
				'text-align':'center',
				'height':'30px',
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
			
		    $('#accno,#custid,#custname,#systp,#syscode,#uqid,#nrefg,#iscode,#cntrycode,#snamt,#outstdamt,#acccurcode,#resfg,#resdate,#nfblimit,#nfboutstd,#npaflg,#secflg,#secamt,#arrday,#arramt,#loanratio,#spcprvsn,#npareason,#repdt').css({
					'text-align':'center',
					'height':'30px',
					'white-space':'pre-wrap',
					'scroll':'none',
					'word-wrap':'break-word',
					'resize':'none',
					'background-color': '#f5f5f5',
					'border':'none',
					'-webkit-text-fill-color': '#333333'
					}); 
			  var   table, tr, td, i;
				 table = document.getElementById("pymdets");
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
		 location.href="XBRL_CRT_PSC0300_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});


	 $.ajax({
	     url : "psc0300verify",
	     /* data : detcancel  , */
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 var srno=1;
				 $("#pymdets tr").remove();
					var cnt1=1;
				
				var b=JSON.parse(res.detPSC0300);
				 console.log(b);
				 if(b.length==0){
					 $("#pymdets").append('<tr ><td colspan="27" style="text-align:center;color:red;">No Records Available</td></tr>');
				 }else{
					 
				 
					 for(var i=0;i<b.length;i++){
						 $("#pymdets").append("<tr>"

			 					  +"<td id='accno_row"+srno+"'>"+b[i].accno+"</td>"
			                      +"<td id='custid_row"+srno+"' >"+b[i].custid+"</td>"
			                      +"<td id='custname_row"+srno+"' >"+b[i].custname+"</td>"
			                      +"<td  id='systp_row"+srno+"' >"+b[i].systp+"</td>"
			                      +"<td id='syscode_row"+srno+"' >"+b[i].syscode+"</td>"
			                      +"<td id='uqid_row"+srno+"'>"+b[i].uqid+"</td>"
			                      +"<td  id='nrefg_row"+srno+"' >"+b[i].nrefg+"</td>"
			                      +"<td id='iscode_row"+srno+"' >"+b[i].iscode+"</td>"
			                      +"<td   id='cntrycode_row"+srno+"' >"+b[i].cntrycode+"</td>"
		                       +"<td class='sumder alnum' id='snamt_row"+srno+"' >"+b[i].snamt+"</td>"
			                      +"<td class='sumder alnum'  id='outstdamt_row"+srno+"'>"+b[i].outstdamt+"</td>"	
			                      +"<td  id='acccurcode_row"+srno+"'>"+b[i].acccurcode+"</td>"	
			                      +"<td   id='resfg_row"+srno+"'>"+b[i].resfg+"</td>"	
			                      +"<td id='resdate_row"+srno+"'>"+b[i].resdate+"</td>"	
			                      +"<td id='nfblimit_row"+srno+"'>"+b[i].nfblimit+"</td>"	
			                      +"<td id='nfboutstd_row"+srno+"'>"+b[i].nfboutstd+"</td>"	
			                      +"<td id='npaflg_row"+srno+"'>"+b[i].npaflg+"</td>"	
			                      +"<td id='secflg_row"+srno+"'>"+b[i].secflg+"</td>"	
			                      +"<td class='sumder alnum' id='secamt_row"+srno+"'>"+b[i].secamt+"</td>"	
			                      +"<td id='arrday_row"+srno+"'>"+b[i].arrday+"</td>"	
			                      +"<td class='sumder alnum' id='arramt_row"+srno+"'>"+b[i].arramt+"</td>"	
			                      +"<td id='loanratio_row"+srno+"'>"+b[i].loanratio+"</td>"	
			                      
			                      +"<td class='sumder alnum'id='spcprvsn_row"+srno+"'>"+b[i].spcprvsn+"</td>"	
			                      
			                      +"<td id='npareason_row"+srno+"'>"+b[i].npareason+"</td>"		
			                    
			                      +"<td id='repdt_row"+srno+"'>"+b[i].repdt+"</td>"	
				                  +" <td id='modtyp_row"+srno+"'>"+b[i].modtyp+"</td>"
				                  +"<td style='text-align:center;'><input type='button' id='verify_button"+cnt1+"' value='Verify' class='btn btn-xs btn-primary verify' style='width: 37px;' onclick=verify_row('"+cnt1+"')>  <input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; ' onclick=Cancel_row('"+cnt1+"')><input type='hidden' id='entryuser"+cnt1+"'  value="+b[i].entryuser+"></td>"

			                      +"</tr>" ) ; 
			                     
			   
						
						 srno++;
						 cnt1++;
						 
						 
							} 
				 }
				 $("#divLoading").removeClass('show');
			}
		});

 	

		
});	

function Cancel_row(no){
	 /*  document.getElementById("del_button"+no).style.display="inline-block"; */
	 
	var detcancel={
				"accno":$("#accno_row"+no).text(),"custid":$("#custid_row"+no).text(),"repdt":$("#repdt_row"+no).text()
		};
		
		 $.ajax({
		     url : "PSC0300cancel",
		     data : detcancel  ,
				dataType : 'json', 
				type : 'POST',
				async : true,
				 success : function(res) {
					 
				 
         alert(res.resalert);
         location.href = "XBRL_VER_PSC0300_01.jsp";
			}
		});
}


function verify_row(no){

	if($("#entryuser"+no).val()=='<%=username%>') {
			alert("Same user cannot Verify");
		} else {

			var detver = {
				"accno" : $("#accno_row" + no).text(),
				"custid" : $("#custid_row" + no).text(),
				"custname" : $("#custname_row" + no).text(),
				"systp" : $("#systp_row" + no).text(),
				"syscode" : $("#syscode_row" + no).text(),
				"uqid" : $("#uqid_row" + no).text(),
				"nrefg" : $("#nrefg_row" + no).text(),
				"iscode" : $("#iscode_row" + no).text(),
				"cntrycode" : $("#cntrycode_row" + no).text(),
				"snamt" : $("#snamt_row" + no).text(),
				"outstdamt" : $("#outstdamt_row" + no).text(),
				"acccurcode" : $("#acccurcode_row" + no).text(),
				"resfg" : $("#resfg_row" + no).text(),
				"resdate" : $("#resdate_row" + no).text(),
				"nfblimit" : $("#nfblimit_row" + no).text(),
				"nfboutstd" : $("#nfboutstd_row" + no).text(),
				"npaflg" : $("#npaflg_row" + no).text(),
				"secflg" : $("#secflg_row" + no).text(),
				"secamt" : $("#secamt_row" + no).text(),
				"arrday" : $("#arrday_row" + no).text(),
				"arramt" : $("#arramt_row" + no).text(),
				"loanratio" : $("#loanratio_row" + no).text(),
				"spcprvsn" : $("#spcprvsn_row" + no).text(),
				"npareason" : $("#npareason_row" + no).text(),
				"repdt" : $("#repdt_row" + no).text()
			};

			$.ajax({
				url : "PSC0300vermaster",
				data : detver,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {
					alert(res.resalert);
					location.href = "XBRL_VER_PSC0300_01.jsp";
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

.body {
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

.databody td {
	border: 1px solid #ddd;
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

.clr {
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
	border-color: rgba(18, 18, 19, 0.22);
}

.modal-footer {
	text-align: center;
	border-top: 0;
	padding: 25px;
	padding-right: 208px;
}
</style>


<script>
	function myFunction(a, b) {
		var input, filter, table, tr, td, i;
		input = document.getElementById(a);
		filter = input.value.toUpperCase();
		table = document.getElementById("pymdets");
		tr = table.getElementsByTagName("tr");

		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[b];

			if (td) {
				if (b == 0 || b == 9 || b == 10 || b == 13 || b == 18
						|| b == 19 || b == 20 || b == 21 || b == 22 || b == 24) {

					if (td.innerHTML.replace(/,/g, "").substring(0,
							input.value.length) == input.value) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}

				} else {

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




		<form class="form-horizontal" method="post" name="PSC0300Form"
			enctype="multipart/form-data">


			<div id="nav">
				<div class="loader"></div>

				<div id="tab3">










					<div class="tab-content">



						<div class="tab-pane" id="tab2"
							style="width: 2550px; padding-top: 1px; margin-top: -17px; display: block;">
							<div style="text-align: left; margin-top: 40px;">
								<font size="2" style="font-size: 13px;"><b>PSC0300-Sectorwise
										Distribution of Credit to the Small and Medium Enterprises
										(SMEs)<b id="sub" Style="display: none"></b>
								</b></font> <br>
								<b style="font-size: 13px;"> <b id="sub"
									style="display: none"></b></b>
							</div>

							<div id="divLoading"></div>
							<br>
							<div class="panel panel-primary filterable">


								<table class="table" style="width: 2550px; height: 52px;">
									<tr>
										<td style="background-color: #bbc3cb;"><a
											class="btn btn-default btn-xs btn-primary"
											style="margin-left: 10px; float: right;" id="btnfilter"><span
												class="glyphicon glyphicon-filter"></span> Filter</a>
									</tr>


								</table>


								<table class="table" id="tbcate" border="1"
									style="width: 100%; margin-top:0px;">

									<thead>

										<tr class="filters">
											<th style="text-align: center"><textarea
													style="text-align: center; width: 100px;" type="text"
													id="accno" onkeyup="myFunction(this.id,0)"
													class="form-control2" placeholder="Account Number" disabled></textarea></th>

											<th style="text-align: center"><textarea
													style="text-align: center; width: 70px;" type="text"
													id="custid" onkeyup="myFunction(this.id,1)"
													class="form-control2" placeholder="Customer Id" disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 200px;" type="text"
													id="custname" onkeyup="myFunction(this.id,2)"
													class="form-control2" placeholder="Customer Name" disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 50px;" type="text"
													id="systp" onkeyup="myFunction(this.id,3)"
													class="form-control2" placeholder="Scheme Type" disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 53px;" type="text"
													id="syscode" onkeyup="myFunction(this.id,4)"
													class="form-control2" placeholder="Scheme Code" disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 66px;" type="text"
													id="uqid" onkeyup="myFunction(this.id,5)"
													class="form-control2" placeholder="Unique Identifier"
													disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 54px;" type="text"
													id="nrefg" onkeyup="myFunction(this.id,6)"
													class="form-control2" placeholder="NRE Flag" disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 50px;" type="text"
													id="iscode" onkeyup="myFunction(this.id,7)"
													class="form-control2" placeholder="ISIC Code" disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 45px;" type="text"
													id="cntrycode" onkeyup="myFunction(this.id,8)"
													class="form-control2" placeholder="Country Code" disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 83px;" type="text"
													id="snamt" onkeyup="myFunction(this.id,9)"
													class="form-control2" placeholder="Sanction Amount"
													disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 100px;" type="text"
													id="outstdamt" onkeyup="myFunction(this.id,10)"
													class="form-control2" placeholder="Outstanding Amount"
													disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 100px;" type="text"
													id="acccurcode" onkeyup="myFunction(this.id,11)"
													class="form-control2" placeholder="Account Currency Code"
													disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 70px;" type="text"
													id="resfg" onkeyup="myFunction(this.id,12)"
													class="form-control2" placeholder="Restructured flag"
													disabled></textarea></th>

											<th style="text-align: center"><textarea
													style="text-align: center; width: 100px;" type="text"
													id="resdate" onkeyup="myFunction(this.id,13)"
													class="form-control2" placeholder="Restructured Date"
													disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 100px;" type="text"
													id="nfblimit" onkeyup="myFunction(this.id,14)"
													class="form-control2" placeholder="NFB Limit" disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 77px;" type="text"
													id="nfboutstd" onkeyup="myFunction(this.id,15)"
													class="form-control2" placeholder="NFB Outstanding"
													disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 51px;" type="text"
													id="npaflg" onkeyup="myFunction(this.id,16)"
													class="form-control2" placeholder="NPA Flag" disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 58px;" type="text"
													id="secflg" onkeyup="myFunction(this.id,17)"
													class="form-control2" placeholder="Secured Flag" disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 87px;" type="text"
													id="secamt" onkeyup="myFunction(this.id,18)"
													class="form-control2" placeholder="Secured Amount" disabled></textarea></th>

											<th style="text-align: center"><textarea
													style="text-align: center; width: 55px;" type="text"
													id="arrday" onkeyup="myFunction(this.id,19)"
													class="form-control2" placeholder="Arrear Days" disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 89px;" type="text"
													id="arramt" onkeyup="myFunction(this.id,20)"
													class="form-control2" placeholder="Arrear Amount" disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 38px;" type="text"
													id="loanratio" onkeyup="myFunction(this.id,21)"
													class="form-control2" placeholder="Loan Ratio" disabled></textarea></th>

											<th style="text-align: center"><textarea
													style="text-align: center; width: 89px;" type="text"
													id="spcprvsn" onkeyup="myFunction(this.id,22)"
													class="form-control2" placeholder="Specific Provision"
													disabled></textarea></th>
											<th style="text-align: center"><textarea
													style="text-align: center; width: 77px;" type="text"
													id="npareason" onkeyup="myFunction(this.id,23)"
													class="form-control2" placeholder="NPA Reason" disabled></textarea></th>
											<th style="width: 73px; text-align: center"><textarea
													style="text-align: center; width: 73px;" type="text"
													id="repdt" onkeyup="myFunction(this.id,24)"
													class="form-control2" placeholder="Report Date" disabled></textarea></th>
											<th style="text-align: center; width: 150px" id="modtyp">Modify
												Type</th>
											<th style="text-align: center; width: 200px" id="modify">Verify/Cancel</th>

										</tr>

									</thead>



									<tbody class="databody" id="pymdets">





									</tbody>



								</table>
							</div>

							<div class="modal-footer">

								<button type="button" class="btn btn-xs btn-primary"
									id="btnhome">Home</button>


								<button type="button" class="btn btn-xs btn-primary"
									value="back" id="btnback">Back</button>
							</div>


						</div>



					</div>

				</div>




			</div>

		</form>


	</div>





</body>
</html>