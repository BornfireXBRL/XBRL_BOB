<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLSUP0603Bean,dao.XBRLSUP0603Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
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
#DCGdets td{
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

 
</style>




<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){

	$("#btnfilter").on("click",function(){
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
		}else{
			$(".form-control2").val("");
			$(".form-control2").prop("disabled",true);
			 
			  var   table, tr, td, i;
			 table = document.getElementById("DCGdets");
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
		 location.href="XBRL_CRT_SUP0603_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});


	 $.ajax({
	     url : "sup0603verify",
	     /* data : detcancel  , */
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 var srno=1;
				 $("#sup3dets tr").remove();
					var cnt1=1;
				
				var b=JSON.parse(res.detSUP0603);
				 console.log(b);
				 if(b.length==0){
					 $("#sup3dets").append('<tr ><td colspan="30" style="text-align:center;color:red;">No Records Available</td></tr>');
				 }else{
					 
				 
					 		for(var i=0;i<b.length;i++){
					 			
						 		  $("#sup3dets").append("<tr id='sup3add"+cnt1+"'><td id='acctNum_row"+srno+"'>"+b[i].acctNum+"</td><td id='acctName_row"+srno+"'>"+b[i].acctName+"</td><td id='custId_row"+srno+"'>"+b[i].custId+"</td><td id='schmCode_row"+srno+"' >"+b[i].schmCode+"</td><td id='schmType_row"+srno+"' >"+b[i].schmType+"</td><td id='acctopenDate_row"+srno+"'>"+b[i].acctopenDate+"</td><td id='intRate_row"+srno+"' class='sumder'>"+b[i].intRate+"</td><td id='acctBalanceamtac_row"+srno+"' class='sumder'>"+b[i].acctBalanceamtac+"</td><td id='acctCrncyCode_row"+srno+"'>"+b[i].acctCrncyCode+"</td><td id='isicCode_row"+srno+"'>"+b[i].isicCode+"</td><td id='natureofCust_row"+srno+"' >"+b[i].natureofCust+"</td><td id='nreFlg_row"+srno+"'>"+b[i].nreFlg+"</td><td id='country_row"+srno+"'>"+b[i].country+"</td><td id='bomGroupIdentifier_row"+srno+"'>"+b[i].bomGroupIdentifier+"</td><td id='custUniqueIdentifier_row"+srno+"'>"+b[i].custUniqueIdentifier+"</td><td id='loanAmt_row"+srno+"' class='sumder'>"+b[i].loanAmt+"</td><td id='specProv_row"+srno+"' class='sumder'>"+b[i].specProv+"</td><td id='badDrwroff_row"+srno+"' class='sumder'>"+b[i].badDrwroff+"</td><td id='dprCntr_row"+srno+"'>"+b[i].dprCntr+"</td><td id='impairedFlg_row"+srno+"'>"+b[i].impairedFlg+"</td><td id='secAmt_row"+srno+"' class='sumder'>"+b[i].secAmt+"</td><td id='purposeofLoan_row"+srno+"'>"+b[i].purposeofLoan+"</td><td id='smeFlg_row"+srno+"'>"+b[i].smeFlg+"</td><td id='nonFundBasedFacilities_row"+srno+"'>"+b[i].nonFundBasedFacilities+"</td><td id='resdt_row"+srno+"'>"+b[i].resdt+"</td><td id='resflg_row"+srno+"'>"+b[i].resflg+"</td><td id='noofres_row"+srno+"'>"+b[i].nofres+"</td><td id='reportDate_row"+srno+"'>"+b[i].reportDate+"</td><td id='modtyp_row"+cnt1+"'>"+b[i].modtyp+"</td><td style='text-align:center;'><input type='button' id='verify_button"+cnt1+"' value='Verify' class='btn btn-xs btn-primary verify' style='width: 37px;' onclick=verify_row('"+cnt1+"')>  <input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; ' onclick=Cancel_row('"+cnt1+"')><input type='hidden' id='entryuser"+cnt1+"'  value="+b[i].entryuser+"></td></tr>");

					                     
					                     
					   
							 srno++;
							 cnt1++;
							 
							 
								} 
				 }$("#divLoading").removeClass('show');
			}
		});

 	

		
});	

function Cancel_row(no){

	var detcancel={
			"acctNum":$("#acctNum_row"+no).text() ,"custId":$("#custId_row"+no).text() ,"reportDate":$("#reportDate_row"+no).text()
	};

	 $.ajax({
	     url : "SUP0603cancel",
	     data : detcancel  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {

         alert(res.resalert);
         location.href = "XBRL_VER_SUP0603_01.jsp";
			}
		});
}


function verify_row(no){

	if($("#entryuser"+no).val()=='<%=username%>'){
		alert("Same user cannot Verify");
	}else{

		 var acctBalanceamtac=document.getElementById("acctBalanceamtac_row"+no).innerHTML;
		 var loanAmt=document.getElementById("loanAmt_row"+no).innerHTML;
     	var specProv=document.getElementById("specProv_row"+no).innerHTML;
     	var badDrwroff=document.getElementById("badDrwroff_row"+no).innerHTML;	
		 var secAmt=document.getElementById("secAmt_row"+no).innerHTML;
		 
		 acctBalanceamtac=acctBalanceamtac.replace(/\,/g,'');
		 acctBalanceamtac=Number(acctBalanceamtac);


		 loanAmt=loanAmt.replace(/\,/g,'');
		 loanAmt=Number(loanAmt);




		 specProv=specProv.replace(/\,/g,'');
		 specProv=Number(specProv);

		 badDrwroff=badDrwroff.replace(/\,/g,'');
		 badDrwroff=Number(badDrwroff);


		 secAmt=secAmt.replace(/\,/g,'');
		 secAmt=Number(secAmt);

	
	var detver={
			"acctNum":$("#acctNum_row"+no).text() ,"acctName":$("#acctName_row"+no).text() ,"custId":$("#custId_row"+no).text() ,"schmCode":$("#schmCode_row"+no).text() ,"schmType":$("#schmType_row"+no).text() ,"acctopenDate":$("#acctopenDate_row"+no).text() ,"intRate":$("#intRate_row"+no).text() ,"acctBalanceamtac":acctBalanceamtac,"acctCrncyCode":$("#acctCrncyCode_row"+no).text() ,"isicCode":$("#isicCode_row"+no).text() ,"natureofCust":$("#natureofCust_row"+no).text() ,"nreFlg":$("#nreFlg_row"+no).text() ,"country":$("#country_row"+no).text() ,"bomGroupIdentifier":$("#bomGroupIdentifier_row"+no).text() ,"custUniqueIdentifier":$("#custUniqueIdentifier_row"+no).text() ,"loanAmt":loanAmt,"specProv":specProv ,"badDrwroff":badDrwroff ,"dprCntr":$("#dprCntr_row"+no).text() ,"impairedFlg":$("#impairedFlg_row"+no).text() ,"secAmt":secAmt,"purposeofLoan":$("#purposeofLoan_row"+no).text() ,"smeFlg":$("#smeFlg_row"+no).text() ,"nonFundBasedFacilities":$("#nonFundBasedFacilities_row"+no).text() ,"resdt":$("#resdt_row"+no).text() ,"resflg":$("#resflg_row"+no).text() ,"noofres":$("#noofres_row"+no).text() ,"reportDate":$("#reportDate_row"+no).text()

	};

	 $.ajax({
	     url : "SUP0603vermaster",
	     data : detver  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {

         alert(res.resalert);
         location.href = "XBRL_VER_SUP0603_01.jsp";
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
  table = document.getElementById("sup3dets");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==0 ||b==5 || b==6 || b==7 ||b==15 || b==16 || b==17 ||b==18 || b==20 || b==24 || b==27){
		
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
   
   
  
    
    <form class="form-horizontal" method="post" name="SUP0603Form"
		enctype="multipart/form-data">
    
    
    <div id="nav">
    <div class="loader"></div>
   
         <div id="tab3" >
			  
			 
            
            
            
            
            

 
		
	 	<div class="tab-content"  >
	 	
	 	
				
				<div class="tab-pane" id="tab2" style="width: 2899px;padding-top: 1px;margin-top: -17px;display:block;">
<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>SUP0603-Detailed List of Credit in Arrears and Impaired in excess of Rs. 100,000 equivalent<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"> 
			 <b id="sub" style="display: none"></b></b></div>
					
					 <div id="divLoading"> 
    </div> 
     <br>
     <div class="panel panel-primary filterable">
   
    
     <table class="table" style="width:2899px;height:52px; ">
          		  <tr > <td style="background-color: #bbc3cb;"> <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;float:right;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></tr>
          		  
          		  
          		  	</table>	
          		  
          	  <table class="table" id="tbcate" border="1" style="width:100%;   margin-top:0px;">
            
             <thead>
					  <tr class="filters">
					 
						<th ><textarea type="text" style="width: 100px;" onkeyup="myFunction(this.id,0)" class="form-control2" id="acctNum" placeholder="Account Number" disabled></textarea></th>
						<!-- <th id="chalpha">Cheque Alpha</th>					 -->	
						<th ><textarea type="text" style="width: 250px;" id="acctName" onkeyup="myFunction(this.id,1)" class="form-control2" placeholder="Account Name" disabled></textarea></th>	
						<th ><textarea type="text" style="width: 70px;" id="custId" onkeyup="myFunction(this.id,2)" class="form-control2" placeholder="Customer Id" disabled></textarea></th>						
											
						<th  ><textarea type="text" style="width: 52px;" id="schmCode" onkeyup="myFunction(this.id,3)" class="form-control2" placeholder="Scheme Code" disabled></textarea></th>
						<th ><textarea type="text"  style="width: 52px;" id="schmType" class="form-control2" onkeyup="myFunction(this.id,4)" placeholder="Scheme Type" disabled></textarea></th>
						<!-- <th id="valdate">Value Date</th> -->
						<th  style=""><textarea type="text" style="width: 70px;" id="acctopenDate"  onkeyup="myFunction(this.id,5)" class="form-control2" placeholder="Acct Open Date" disabled></textarea></th>						
						<th ><textarea type="text"  style="width: 60px;" class="form-control2" id="intRate" onkeyup="myFunction(this.id,6)" placeholder="Int Rate" disabled></textarea></th>
						<th ><textarea type="text" style="width: 80px;" class="form-control2" id="acctBalanceamtac" onkeyup="myFunction(this.id,7)" placeholder="Acct Bal Amt Ac" disabled></textarea></th>
						<th ><textarea type="text" style="width: 50px;" class="form-control2" id="acctCrncyCode" onkeyup="myFunction(this.id,8)" placeholder="Acct Crncy Code" disabled></textarea></th>
						<th ><textarea type="text" style="width: 60px;" class="form-control2" id="isicCode" onkeyup="myFunction(this.id,9)" placeholder="ISIC Code" disabled></textarea></th>
						<th ><textarea type="text" style="width: 70px;" class="form-control2" id="natureofCust" onkeyup="myFunction(this.id,10)" placeholder="Nature of Cust" disabled></textarea></th>
						<th ><textarea type="text" style="width: 60px;" class="form-control2" id="nreFlg" onkeyup="myFunction(this.id,11)" placeholder="NRE Flg" disabled></textarea></th>
						<th ><textarea type="text" style="width: 60px;" class="form-control2" id="country" onkeyup="myFunction(this.id,12)" placeholder="Country" disabled></textarea></th>
						<th ><textarea type="text" style="width: 100px;" class="form-control2" id="bomGroupIdentifier" onkeyup="myFunction(this.id,13)" placeholder="BOM Group Identifier" disabled></textarea></th>
						<th ><textarea type="text" style="width: 100px;" class="form-control2" id="custUniqueIdentifier" onkeyup="myFunction(this.id,14)" placeholder="Cust Unique Identifier" disabled></textarea></th>
						<th ><textarea type="text" style="width: 80px;" class="form-control2" id="loanAmt" onkeyup="myFunction(this.id,15)" placeholder="Loan Amount" disabled></textarea></th>
						<th ><textarea type="text" style="width: 80px;" class="form-control2" id="specProv" onkeyup="myFunction(this.id,16)" placeholder="Spec Prov" disabled></textarea></th>
						<th ><textarea type="text" style="width: 80px;" class="form-control2" id="badDrwroff" onkeyup="myFunction(this.id,17)" placeholder="Bad Dr Wr Off" disabled></textarea></th>
						<th ><textarea type="text" style="width: 60px;" class="form-control2" id="dprCntr" onkeyup="myFunction(this.id,18)" placeholder="DPD Cntr" disabled></textarea></th>
						<th ><textarea type="text" style="width: 60px;" class="form-control2" id="impairedFlg" onkeyup="myFunction(this.id,19)" placeholder="Impaired Flg" disabled></textarea></th>
						<th ><textarea type="text" style="width: 80px;" class="form-control2" id="secAmt" onkeyup="myFunction(this.id,20)" placeholder="Sec Amount" disabled></textarea></th>
						<th ><textarea type="text"  style="width: 100px;"class="form-control2" id="purposeofLoan" onkeyup="myFunction(this.id,21)" placeholder="Purpose of Loan" disabled></textarea></th>
						<th ><textarea type="text" style="width: 60px;" class="form-control2" id="smeFlg" onkeyup="myFunction(this.id,22)" placeholder="SME Flg" disabled></textarea></th>
						<th ><textarea type="text"  style="width: 80px;"class="form-control2" id="nonFundBasedFacilities" onkeyup="myFunction(this.id,23)" placeholder="Non Fund Based Facilities" disabled></textarea></th>
						<th ><textarea type="text"  style="width: 100px;"class="form-control2" id="resdt" onkeyup="myFunction(this.id,24)" placeholder="Rescheduled Date" disabled></textarea></th>
						<th ><textarea type="text"  style="width: 80px;"class="form-control2" id="resflg" onkeyup="myFunction(this.id,25)" placeholder="Restructured flag" disabled></textarea></th>
						<th ><textarea type="text"  style="width: 60px;"class="form-control2" id="noofres" onkeyup="myFunction(this.id,26)" placeholder="No of restructure" disabled></textarea></th>
						
						
						<th ><textarea type="text" style="width: 70px;" class="form-control2" id="reportDate" onkeyup="myFunction(this.id,27)" placeholder="Report Date" disabled></textarea></th>
						<th id="modtyp" style="width: 100px;">Modify Type</th>
						 						<th id="modify" style="width: 116px;">Verify/cancel</th>
						 
					</tr>
					
					
				</thead>
					
					

                    <tbody class="databody" id="sup3dets">
 


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