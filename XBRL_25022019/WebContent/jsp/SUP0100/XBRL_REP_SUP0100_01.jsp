<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%
    
    String dt1 = request.getParameter("dt1");
    String dt2 = request.getParameter("dt2");
    String reptype=request.getParameter("reptype");
    String curr = request.getParameter("curr");
    String typo=request.getParameter("typo");
 %>
<html>
<head>
<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;url=../XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">




<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SUP0100</title>

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
	
</head>
<style>
body {
	font-family: Arial;
	background-color: #eee;
	 overflow-x:hidden;
	 
	   width: auto;
}

.form-control {
	height: 20px;
	border: 1px solid #6b6a6a;
	width: 170px;
	font-size: 11px;
	padding: 3px 12px;
}

.form-horizontal .control-label {
	text-align: left;
	padding-top: 0px;
}

textarea.form-control {
	height: 20px;
}

.form-horizontal .form-group {
	margin-top: -13px;
	margin-right: -93px;
	margin-left: -15px;
}

.panel-heading {
    padding: 0px 18px;
    padding-top: 3px;
    /* padding-right: 838px; */
    margin-left: 0px;
}

.text-center {
	text-align: -webkit-left;
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
    margin-left: 92px;
}
textarea {
   resize: none;
}
.tab-content {
    width: 78%;
    margin-left: 101px;
}

fieldset.scheduler-border {
	width: 840px;
	border: 1px groove #ddd !important;
	/*  padding:-1px 1.4em 1.4em !important;
    margin: 0 0 1.5em 40px !important; */
	margin-left: 111px;
	-webkit-box-shadow: 0px 0px 0px 0px #000;
	box-shadow: 0px 0px 0px 0px #000;
}

.dash-heading {
	float: right;
	padding-bottom: 12px;
	padding-right: 0px;
	padding-left: 0px;
}

button#b2 {
	top: 30%;
	left: 2%;
	bottom: 30%;
	/* background-color:#eee; */
}

.header{
color:#3C6EAC;
}

.loader {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url('../images/Loader.gif') 30% 30% no-repeat rgb(249,249,249);
    opacity: .8;
}
fieldset.scheduler-border {
	border: 1px solid #CCC;
	border-radius: 5px;
	padding: 10px;
	margin-top: 4px;
    margin-left: -47px;
}

legend.scheduler-border {
	color: #3C6EAC;
	font-size: 11px;
	font-weight: bold !important;
	text-align: left !important;
	border-bottom: none;
}


</style>

<script>


function fnnumber(evt)
{
	var e = event || evt;
	var charCode = e.which || e.keyCode;
	
	if (charCode < 48 || charCode > 57)
	{
		
		
		return false;
	}
}



</script>

<script>

$(document).ready(function(){
	var tot=0;
	$(".amt").keyup(function() {
		 var rec1=funnconv($('#credtcarda').val());
		var rec2=funnconv($('#debtcarda').val());
		
		var rec3=funnconv($('#othra').val());
		
			tot=  parseFloat(rec1)+ parseFloat(rec2) +parseFloat(rec3)  ; 

		$("#nocardsa").val(tot);
	});
	$(".amt").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	
	$(".amt1").keyup(function() {
		 var rec1=funnconv($('#credtcarda2').val());
		var rec2=funnconv($('#debtcarda2').val());
		
		var rec3=funnconv($('#othra2').val());
		
			tot=  parseFloat(rec1)+ parseFloat(rec2) +parseFloat(rec3)  ; 

		$("#nofatmtna").val(tot);

	});
	$(".amt1").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	$(".amt2").keyup(function() {
		 var rec1=funnconv($('#credtcarda3').val());
		var rec2=funnconv($('#debtcarda3').val());
		var rec3=funnconv($('#amtcshwitha3').val());
		var rec4=funnconv($('#othra3').val());
			tot=  parseFloat(rec1)+ parseFloat(rec2) +parseFloat(rec3) +parseFloat(rec4)  ; 

		$("#valfatmtna").val(parseFloat(tot).toFixed(2));
	});
	$(".amt2").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	
	$(".amt3").keyup(function() {
		 var rec1=funnconv($('#credtcarda4').val());
		var rec2=funnconv($('#debtcarda4').val());
		var rec3=funnconv($('#amtcshwitha4').val());
		var rec4=funnconv($('#othra4').val());
			tot=  parseFloat(rec1)+ parseFloat(rec2) +parseFloat(rec3) +parseFloat(rec4)  ; 

		$("#valfatmforga").val(parseFloat(tot).toFixed(2));
	});
	$(".amt3").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	
	$(".amt4").keyup(function() {
		 var rec1=funnconv($('#credtcards').val());
		var rec2=funnconv($('#debtcards').val());
		
		var rec3=funnconv($('#othrs').val());
		
			tot=  parseFloat(rec1)+ parseFloat(rec2) +parseFloat(rec3)  ; 

		$("#valoftrns").val(parseFloat(tot).toFixed(2));
	});
	$(".amt4").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	$(".amt5").keyup(function() {
		 var rec1=funnconv($('#credtcards1').val());
		var rec2=funnconv($('#debtcards1').val());
		
		var rec3=funnconv($('#othrs1').val());
		
			tot=  parseFloat(rec1)+ parseFloat(rec2) +parseFloat(rec3)  ; 

		$("#valfatmforgs").val(parseFloat(tot).toFixed(2));
	});
	$(".amt5").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	$(".amt6").keyup(function() {
		 var rec1=funnconv($('#credtcardm').val());
		var rec2=funnconv($('#debtcardm').val());
		
		var rec3=funnconv($('#othrm').val());
		
			tot=  parseFloat(rec1)+ parseFloat(rec2) +parseFloat(rec3)  ; 

		$("#noftransm").val(tot);
	});
	$(".amt6").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	$(".amt7").keyup(function() {
		 var rec1=funnconv($('#credtcardm1').val());
		var rec2=funnconv($('#debtcardm1').val());
		
		var rec3=funnconv($('#othrm1').val());
		
			tot=  parseFloat(rec1)+ parseFloat(rec2) +parseFloat(rec3)  ; 

		$("#valftransm").val(parseFloat(tot).toFixed(2));
	});
	$(".amt7").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	$(".amt8").keyup(function() {
		 var rec1=funnconv($('#nofdbttrani').val());
		var rec2=funnconv($('#nofcrttrani').val());
		
			tot=  parseFloat(rec1)+ parseFloat(rec2)  ; 

		$("#nofintbnktrani").val(tot);
	});
	$(".amt8").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	$(".amt9").keyup(function() {
		 var rec1=funnconv($('#amtofdbttrani').val());
		var rec2=funnconv($('#amtofcrttrani').val());
		
			tot=  parseFloat(rec1)+ parseFloat(rec2)  ; 

		$("#amtofintbnktrani").val(parseFloat(tot).toFixed(2));
	});
	$(".amt9").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	$(".amt10").keyup(function() {
		 var rec1=funnconv($('#nofdedttrno').val());
		var rec2=funnconv($('#nofcrttrno').val());
		
			tot=  parseFloat(rec1)+ parseFloat(rec2)  ; 

		$("#nofelcmnytrno").val(tot);
	});
	$(".amt10").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	$(".amt11").keyup(function() {
		 var rec1=funnconv($('#ofwhcamtdbtro').val());
		var rec2=funnconv($('#nofcrttrno1').val());
		
			tot=  parseFloat(rec1)+ parseFloat(rec2)  ; 

		$("#nofotelctrno").val(parseFloat(tot).toFixed(2));
	});
	$(".amt11").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
});

function funnconv(a){

	if(a==""){
return 0;
	}else{
	return a;
	}
}
</script>
<script>
$(document).ready(function(){
	if('<%=request.getParameter("typo")%>'=="edit"){
		$(".form-control").attr("readonly",true);
		$("#btnedit").show();
		$("#btnSubmit").hide();
		
		var dtdate={
			"dt2":'<%=request.getParameter("dt2")%>',"curr":	'<%=request.getParameter("curr")%>'
		};
		$.ajax({
			url:"finddata",
			data:dtdate,
			dataType : 'json',
			type : 'POST',
			async : false,
			success : function(res) {	
			 console.log(res.SUP0100arr); 
			 
			    $("#noatminopa").val(res.SUP0100arr[0]);
				$("#nocardsa").val(res.SUP0100arr[1]);
				$("#credtcarda").val(res.SUP0100arr[2]);
				$("#debtcarda").val(res.SUP0100arr[3]);
				$("#othra").val(res.SUP0100arr[4]);
				$("#nofatmtna").val(res.SUP0100arr[5]);
				$("#credtcarda2").val(res.SUP0100arr[6]);
				$("#debtcarda2").val(res.SUP0100arr[7]);
				$("#othra2").val(res.SUP0100arr[8]);
				$("#valfatmtna").val(res.SUP0100arr[9]);
				$("#credtcarda3").val(res.SUP0100arr[10]);
				$("#debtcarda3").val(res.SUP0100arr[11]);
				$("#amtcshwitha3").val(res.SUP0100arr[12]);
				$("#othra3").val(res.SUP0100arr[13]);
				$("#valfatmforga").val(res.SUP0100arr[14]);
				$("#credtcarda4").val(res.SUP0100arr[15]);
				$("#debtcarda4").val(res.SUP0100arr[16]);
				$("#amtcshwitha4").val(res.SUP0100arr[17]);
				$("#othra4").val(res.SUP0100arr[18]);
				$("#noftranss").val(res.SUP0100arr[19]);
				$("#valoftrns").val(res.SUP0100arr[20]);
				$("#credtcards").val(res.SUP0100arr[21]);
				$("#debtcards").val(res.SUP0100arr[22]);
				$("#othrs").val(res.SUP0100arr[23]);
				$("#valfatmforgs").val(res.SUP0100arr[24]);
				$("#credtcards1").val(res.SUP0100arr[25]);
				$("#debtcards1").val(res.SUP0100arr[26]);
				$("#othrs1").val(res.SUP0100arr[27]);
				$("#nomerchantntm").val(res.SUP0100arr[28]);
				$("#noftransm").val(res.SUP0100arr[29]);
				$("#credtcardm").val(res.SUP0100arr[30]);
				$("#debtcardm").val(res.SUP0100arr[31]);
				$("#othrm").val(res.SUP0100arr[32]);
				$("#valftransm").val(res.SUP0100arr[33]);
				$("#credtcardm1").val(res.SUP0100arr[34]);
				$("#debtcardm1").val(res.SUP0100arr[35]);
				$("#othrm1").val(res.SUP0100arr[36]);
			    $("#nofintbnkcusi").val(res.SUP0100arr[37]);
			    $("#nofintbnktrani").val(res.SUP0100arr[38]);
			    $("#nofdbttrani").val(res.SUP0100arr[39]);
				$("#nofcrttrani").val(res.SUP0100arr[40]);
				$("#amtofintbnktrani").val(res.SUP0100arr[41]); 
				$("#amtofdbttrani").val(res.SUP0100arr[42]);
			    $("#amtofcrttrani").val(res.SUP0100arr[43]);
				$("#nofsubsserm").val(res.SUP0100arr[44]);
				$("#nofactmonactm").val(res.SUP0100arr[45]);
				$("#nofregagntsactmobpaym").val(res.SUP0100arr[46]); 
				$("#nofactagoutm").val(res.SUP0100arr[47]);
				$("#nofmobpaytransm").val(res.SUP0100arr[48]);
				$("#noftranftransm").val(res.SUP0100arr[49]);
		        $("#nofpaytransm").val(res.SUP0100arr[50]);
				$("#nofcashtransm").val(res.SUP0100arr[51]);
				$("#nofcashwithtransm").val(res.SUP0100arr[52]); 
				$("#nofmobmnytransm").val(res.SUP0100arr[53]);
			    $("#amtmobpaytranm").val(res.SUP0100arr[54]);
				$("#amttranstranm").val(res.SUP0100arr[55]);
				$("#amtpaytranm").val(res.SUP0100arr[56]);
				$("#amtcashbacktranm").val(res.SUP0100arr[57]);
				$("#amtcardcashwithtranm").val(res.SUP0100arr[58]); 
				$("#amtmobmnytranm").val(res.SUP0100arr[59]);
				$("#outbalactmobactm").val(res.SUP0100arr[60]);
				$("#listicfailaa").val(res.SUP0100arr[61]);
			    $("#detofactkbyidwab").val(res.SUP0100arr[62]);
				$("#serbrkdwreac").val(res.SUP0100arr[63]);
				$("#sysseclabactad").val(res.SUP0100arr[64]);
				$("#lsbybkcusae").val(res.SUP0100arr[65]);
				$("#lsofconfdtaf").val(res.SUP0100arr[66]);
				$("#brofguidag").val(res.SUP0100arr[67]);
				$("#nofelcmnytrno").val(res.SUP0100arr[68]);
				$("#nofdedttrno").val(res.SUP0100arr[69]);
				$("#nofcrttrno").val(res.SUP0100arr[70]);
				$("#nofotelctrno").val(res.SUP0100arr[71]);
				$("#ofwhcamtdbtro").val(res.SUP0100arr[72]);
				$("#nofcrttrno1").val(res.SUP0100arr[73]);
				$("#rcreusrname").val(res.SUP0100arr[74]);
				$("#rcreusrtime").val(res.SUP0100arr[75]);
				$("#lchgusrname").val(res.SUP0100arr[76]);
				$("#rcreusrtime").val(res.SUP0100arr[77]);
				
			}
		});
	}else{
		$("#btnedit").hide();
		$("#btnSubmit").show();
	}
	
	$("#btnedit").on("click",function(){
		$(".form-control").attr("readonly",false);
		$(".formnum").attr("readonly",true);
		$("#btnMsubmit").show();
	});
	$("#btnSubmit").on("click",function(){
		
		
		var sup0100data={
	
				"noatminopa":$("#noatminopa").val(),
				"nocardsa":$("#nocardsa").val(),
				"credtcarda":$("#credtcarda").val(),
				"debtcarda":$("#debtcarda").val(),
				"othra":$("#othra").val(),
				"nofatmtna":$("#nofatmtna").val(),
				"credtcarda2":$("#credtcarda2").val(),
				"debtcarda2":$("#debtcarda2").val(),
				"othra2":$("#othra2").val(),
				"valfatmtna":$("#valfatmtna").val(),
				"credtcarda3":$("#credtcarda3").val(),
				"debtcarda3":$("#debtcarda3").val(),
				"amtcshwitha3":$("#amtcshwitha3").val(),
				"othra3":$("#othra3").val(),
				"valfatmforga":$("#valfatmforga").val(),
				"credtcarda4":$("#credtcarda4").val(),
				"debtcarda4":$("#debtcarda4").val(),
				"amtcshwitha4":$("#amtcshwitha4").val(),
				"othra4":$("#othra4").val(),
				"noftranss":$("#noftranss").val(),
				"valoftrns":$("#valoftrns").val(),
				"credtcards":$("#credtcards").val(),
				"debtcards":$("#debtcards").val(),
				"othrs":$("#othrs").val(),
				"valfatmforgs":$("#valfatmforgs").val(),
				"credtcards1":$("#credtcards1").val(),
				"debtcards1":$("#debtcards1").val(),
				"othrs1":$("#othrs1").val(),
				"nomerchantntm":$("#nomerchantntm").val(),
				"noftransm":$("#noftransm").val(),
				"credtcardm":$("#credtcardm").val(),
				"debtcardm":$("#debtcardm").val(),
				"othrm":$("#othrm").val(),
				"valftransm":$("#valftransm").val(),
				"credtcardm1":$("#credtcardm1").val(),
				"debtcardm1":$("#debtcardm1").val(),
				"othrm1":$("#othrm1").val(),
				"nofintbnkcusi":$("#nofintbnkcusi").val(),
				"nofintbnktrani":$("#nofintbnktrani").val(),
				"nofdbttrani":$("#nofdbttrani").val(),
				"nofcrttrani":$("#nofcrttrani").val(),
				"amtofintbnktrani":$("#amtofintbnktrani").val(), 
				"amtofdbttrani":$("#amtofdbttrani").val(),
				"amtofcrttrani":$("#amtofcrttrani").val(),
				"nofsubsserm":$("#nofsubsserm").val(),
				"nofactmonactm":$("#nofactmonactm").val(),
				"nofregagntsactmobpaym":$("#nofregagntsactmobpaym").val(), 
				"nofactagoutm":$("#nofactagoutm").val(),
				"nofmobpaytransm":$("#nofmobpaytransm").val(),
				"noftranftransm":$("#noftranftransm").val(),
				"nofpaytransm":$("#nofpaytransm").val(),
				"nofcashtransm":$("#nofcashtransm").val(),
				"nofcashwithtransm":$("#nofcashwithtransm").val(), 
				"nofmobmnytransm":$("#nofmobmnytransm").val(),
				"amtmobpaytranm":$("#amtmobpaytranm").val(),
				"amttranstranm":$("#amttranstranm").val(),
				"amtpaytranm":$("#amtpaytranm").val(),
				"amtcashbacktranm":$("#amtcashbacktranm").val(),
				"amtcardcashwithtranm":$("#amtcardcashwithtranm").val(), 
				"amtmobmnytranm":$("#amtmobmnytranm").val(),
				"outbalactmobactm":$("#outbalactmobactm").val(),
				"listicfailaa":$("#listicfailaa").val(),
				"detofactkbyidwab":$("#detofactkbyidwab").val(),
				"serbrkdwreac":$("#serbrkdwreac").val(),
				"sysseclabactad":$("#sysseclabactad").val(),
				"lsbybkcusae":$("#lsbybkcusae").val(),
				"lsofconfdtaf":$("#lsofconfdtaf").val(),
				"brofguidag":$("#brofguidag").val(),
				"nofelcmnytrno":$("#nofelcmnytrno").val(),
				"nofdedttrno":$("#nofdedttrno").val(),
				"nofcrttrno":$("#nofcrttrno").val(),
				"nofotelctrno":$("#nofotelctrno").val(),
				"ofwhcamtdbtro":$("#ofwhcamtdbtro").val(),
				"nofcrttrno1":$("#nofcrttrno1").val(),
				"rcreusrname":$("#rcreusrname").val(),
				"rcreusrtime":$("#rcreusrtime").val(),
				"lchgusrname":$("#lchgusrname").val(),
				"rcreusrtime":$("#rcreusrtime").val(),"dt2":'<%=request.getParameter("dt2")%>'
	
		};
		$.ajax({
			url:"sup0100Forminsert",
			data:sup0100data,
			dataType:'json',
			type:'POST',
			async:false,
			success:function(res){
				alert(res.alert);
				$(".form-control").attr("readonly",true);
				$("#btnSubmit").hide();
				 var datasum={
							"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").text()

				};
				$.ajax({
					url:"saveSums1",
					data:datasum,
					dataType:'json',
					type:'POST',
					async:false,
					success:function(res){
						alert("Saved Successfully");
						$("#btnXML").show();
					
					}
				});  
			}
		});
		<%-- sup0100Form.action="sup0100Forminsert.action?method=sup0100Formins&dt2="+'<%=request.getParameter("dt2")%>';
		sup0100Form.submit(); --%>
	});
	
	
	$('#btnXML').click(function() {
		sup0100Form.action = "XMLDOWNLOADs1.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		sup0100Form.submit(); 
	});
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$("#btnMsubmit").on("click",function(){
		var sup0100moddata={
				
				"noatminopa":$("#noatminopa").val(),
				"nocardsa":$("#nocardsa").val(),
				"credtcarda":$("#credtcarda").val(),
				"debtcarda":$("#debtcarda").val(),
				"othra":$("#othra").val(),
				"nofatmtna":$("#nofatmtna").val(),
				"credtcarda2":$("#credtcarda2").val(),
				"debtcarda2":$("#debtcarda2").val(),
				"othra2":$("#othra2").val(),
				"valfatmtna":$("#valfatmtna").val(),
				"credtcarda3":$("#credtcarda3").val(),
				"debtcarda3":$("#debtcarda3").val(),
				"amtcshwitha3":$("#amtcshwitha3").val(),
				"othra3":$("#othra3").val(),
				"valfatmforga":$("#valfatmforga").val(),
				"credtcarda4":$("#credtcarda4").val(),
				"debtcarda4":$("#debtcarda4").val(),
				"amtcshwitha4":$("#amtcshwitha4").val(),
				"othra4":$("#othra4").val(),
				"noftranss":$("#noftranss").val(),
				"valoftrns":$("#valoftrns").val(),
				"credtcards":$("#credtcards").val(),
				"debtcards":$("#debtcards").val(),
				"othrs":$("#othrs").val(),
				"valfatmforgs":$("#valfatmforgs").val(),
				"credtcards1":$("#credtcards1").val(),
				"debtcards1":$("#debtcards1").val(),
				"othrs1":$("#othrs1").val(),
				"nomerchantntm":$("#nomerchantntm").val(),
				"noftransm":$("#noftransm").val(),
				"credtcardm":$("#credtcardm").val(),
				"debtcardm":$("#debtcardm").val(),
				"othrm":$("#othrm").val(),
				"valftransm":$("#valftransm").val(),
				"credtcardm1":$("#credtcardm1").val(),
				"debtcardm1":$("#debtcardm1").val(),
				"othrm1":$("#othrm1").val(),
				"nofintbnkcusi":$("#nofintbnkcusi").val(),
				"nofintbnktrani":$("#nofintbnktrani").val(),
				"nofdbttrani":$("#nofdbttrani").val(),
				"nofcrttrani":$("#nofcrttrani").val(),
				"amtofintbnktrani":$("#amtofintbnktrani").val(), 
				"amtofdbttrani":$("#amtofdbttrani").val(),
				"amtofcrttrani":$("#amtofcrttrani").val(),
				"nofsubsserm":$("#nofsubsserm").val(),
				"nofactmonactm":$("#nofactmonactm").val(),
				"nofregagntsactmobpaym":$("#nofregagntsactmobpaym").val(), 
				"nofactagoutm":$("#nofactagoutm").val(),
				"nofmobpaytransm":$("#nofmobpaytransm").val(),
				"noftranftransm":$("#noftranftransm").val(),
				"nofpaytransm":$("#nofpaytransm").val(),
				"nofcashtransm":$("#nofcashtransm").val(),
				"nofcashwithtransm":$("#nofcashwithtransm").val(), 
				"nofmobmnytransm":$("#nofmobmnytransm").val(),
				"amtmobpaytranm":$("#amtmobpaytranm").val(),
				"amttranstranm":$("#amttranstranm").val(),
				"amtpaytranm":$("#amtpaytranm").val(),
				"amtcashbacktranm":$("#amtcashbacktranm").val(),
				"amtcardcashwithtranm":$("#amtcardcashwithtranm").val(), 
				"amtmobmnytranm":$("#amtmobmnytranm").val(),
				"outbalactmobactm":$("#outbalactmobactm").val(),
				"listicfailaa":$("#listicfailaa").val(),
				"detofactkbyidwab":$("#detofactkbyidwab").val(),
				"serbrkdwreac":$("#serbrkdwreac").val(),
				"sysseclabactad":$("#sysseclabactad").val(),
				"lsbybkcusae":$("#lsbybkcusae").val(),
				"lsofconfdtaf":$("#lsofconfdtaf").val(),
				"brofguidag":$("#brofguidag").val(),
				"nofelcmnytrno":$("#nofelcmnytrno").val(),
				"nofdedttrno":$("#nofdedttrno").val(),
				"nofcrttrno":$("#nofcrttrno").val(),
				"nofotelctrno":$("#nofotelctrno").val(),
				"ofwhcamtdbtro":$("#ofwhcamtdbtro").val(),
				"nofcrttrno1":$("#nofcrttrno1").val(),
				"rcreusrname":$("#rcreusrname").val(),
				"rcreusrtime":$("#rcreusrtime").val(),
				"lchgusrname":$("#lchgusrname").val(),
				"rcreusrtime":$("#rcreusrtime").val(),"dt2":'<%=request.getParameter("dt2")%>'
	
		};
	
		$.ajax({
			url:"sup0100Formmodify",
			data:sup0100moddata,
			dataType:'json',
			type:'POST',
			async:false,
			success:function(res){
				alert(res.alert);
				$(".form-control").attr("readonly",true);
				$("#btnMsubmit").hide();
				 var datasum={
							"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").text()

				};
				$.ajax({
					url:"saveSums1",
					data:datasum,
					dataType:'json',
					type:'POST',
					async:false,
					success:function(res){
						alert("Saved Successfully");
						$("#btnXML").show();
					
					}
				});  
			}
		});
		<%-- sup0100Form.action="sup0100Formmodify.action?method=sup0100Formmod&dt2="+'<%=request.getParameter("dt2")%>';
		sup0100Form.submit(); --%>
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			sup0100Form.action = "SUP0100EXCELSum.action?method=SUP0100EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			sup0100Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			sup0100Form.action = "SUP0100PDFREPORT.action?method=SUP0100PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			sup0100Form.submit();
		}
	});
	$("#btnBack").on("click",function(){
		location.href="XBRL_CRT_SUP0100_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
	});
	
	


	
});


</script>
<body>
<form class="form-horizontal" method="post" name="sup0100Form" id="cform"
		enctype="multipart/form-data">
		
		
        <input type="hidden"id="authFlg" value=""/>
		
		<div class="panel-heading text-center" 
			style="width: 92%; margin-left: 53px; margin-right: 0px; margin-top: 36px; margin-bottom: 20px; background-color: #bbc3cb;">
			
			<input type="hidden" name="sbn.lchgusrname" id="lchgusrname">
			<input type="hidden" name="sbn.lchgusrtime" id="lchgusrtime">
			<input type="hidden" name="sbn.rcreusrname" id="rcreusrname">
			<input type="hidden" name="sbn.rcreusrtime" id="rcreusrtime">
			<font size="2"><b> SUP0100 - Statement of Electronic Banking Transactions <b id="sub" ></b></b></font>
			 <span style="margin-left: 400px;"><button type="button" class="btn btn-xs btn-primary" id="btnedit" style="display:none;">Edit</button>
			<!--   <button type="button" class="btn btn-xs btn-primary" id="btnInq" style="width: 60px;">List</button> -->
			 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select>

			</span>
		</div>
		
		<div class="container-fluid" >





			<div class="panel-body">
				
				<div class="tab-content" style="width:75%;margin-left:118px;">
<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-12 control-label" ><font size="1" class="header">AUTOMATED TELLER MACHINES(ATMs)</font><span
									style="color: red;" class="mant" ></span></label>
									</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of ATMs in operation</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.noatminopa" id="noatminopa" value=""  class="form-control" autocomplete="off" onkeypress='return fnnumber();'/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nocardsa" id="nocardsa" value="0"  class="form-control formnum" onkeypress='return fnnumber();'autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
				<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Credit Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.credtcarda" id="credtcarda" value=""  class="form-control amt"  onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Debit Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.debtcarda" id="debtcarda" value=""  class="form-control amt" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Others (Please provide details in footnote)</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.othra" id="othra" value=""  class="form-control amt" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
                   <div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of ATM Transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofatmtna" id="nofatmtna" value="0"  class="form-control formnum"  onkeypress='return fnnumber();' autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Credit Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.credtcarda2" id="credtcarda2" value=""  class="form-control amt1 "  onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Debit Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.debtcarda2" id="debtcarda2" value=""  class="form-control amt1" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Others (Please provide details in footnote)</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.othra2" id="othra2" value=""  class="form-control amt1" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							 <div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Value of ATM Transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.valfatmtna" id="valfatmtna" value="0"  class="form-control formnum" onkeypress='return fnnumber();' autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Credit Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.credtcarda3" id="credtcarda3" value=""  class="form-control amt2" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Debit Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.debtcarda3" id="debtcarda3" value=""  class="form-control amt2" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Amount of Cash withdrawal</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.amtcshwitha3" id="amtcshwitha3" value=""  class="form-control amt2" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Others (Please provide details in footnote)</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="othra3" id="othra3" value=""  class="form-control amt2" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Value of ATM Transactions in foreign currency</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.valfatmforga" id="valfatmforga" value="0"  class="form-control formnum" onkeypress='return fnnumber();' autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Credit Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.credtcarda4" id="credtcarda4" value=""  class="form-control amt3" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Debit Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.debtcarda4" id="debtcarda4" value=""  class="form-control amt3" onkeypress='return fnnumber();'autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Amount of Cash withdrawal</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.amtcshwitha4" id="amtcshwitha4" value=""  class="form-control amt3" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Others (Please provide details in footnote)</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.othra4" id="othra4" value=""  class="form-control amt3" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<!--  -->
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-12 control-label" ><font size="1" class="header">SHARED ATMs TRANSACTIONS</font><span
									style="color: red;" class="mant" ></span></label>
									</div></div>
									<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.noftranss" id="noftranss" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Value of Transactions </font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.valoftrns" id="valoftrns" value="0"  class="form-control formnum" onkeypress='return fnnumber();' autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Credit Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.credtcards" id="credtcards" value=""  class="form-control amt4" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Debit Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.debtcards" id="debtcards" value=""  class="form-control amt4" autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Others (Please provide details in footnote)</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.othrs" id="othrs" value=""  class="form-control amt4" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Value of ATM Transactions in foreign currency</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.valfatmforgs" id="valfatmforgs" value="0"  class="form-control formnum" onkeypress='return fnnumber();' autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Credit Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.credtcards1" id="credtcards1" value=""  class="form-control amt5" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Debit Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.debtcards1" id="debtcards1" value=""  class="form-control amt5" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Others (Please provide details in footnote)</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.othrs1" id="othrs1" value=""  class="form-control amt5" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<!--  -->
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-12 control-label" ><font size="1" class="header">MERCHANT POLE OF SALE</font><span
									style="color: red;" class="mant" ></span></label>
									</div></div>
							
							
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of Merchant Point of Sale in operation</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nomerchantntm" id="nomerchantntm" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.noftransm" id="noftransm" value="0"  class="form-control formnum" onkeypress='return fnnumber();' autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" > &nbsp;&nbsp;&nbsp;<font size="1">Credit Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.credtcardm" id="credtcardm" value=""  class="form-control amt6" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Debit Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.debtcardm" id="debtcardm" value=""  class="form-control amt6" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Others (Please provide details in footnote)</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.othrm" id="othrm" value=""  class="form-control amt6" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Value of transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.valftransm" id="valftransm" value="0"  class="form-control formnum" onkeypress='return fnnumber();' autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Credit Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.credtcardm1" id="credtcardm1" value=""  class="form-control amt7" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Debit Cards</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.debtcardm1" id="debtcardm1" value=""  class="form-control amt7" aonkeypress='return fnnumber();' utocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Others (Please provide details in footnote)</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.othrm1" id="othrm1" value=""  class="form-control amt7" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-12 control-label" ><font size="1" class="header">INTERNET BANKING</font><span
									style="color: red;" class="mant" ></span></label>
									</div></div>
									<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of Internet Banking customers</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofintbnkcusi" id="nofintbnkcusi" value=""  class="form-control " autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of Internet Banking transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofintbnktrani" id="nofintbnktrani" value="0"  class="form-control " onkeypress='return fnnumber();' autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of Debit transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofdbttrani" id="nofdbttrani" value=""  class="form-control amt8"  onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of Credit transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofcrttrani" id="nofcrttrani" value=""  class="form-control amt8" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Amount of Internet Banking transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.amtofintbnktrani" id="amtofintbnktrani" value="0"  class="form-control formnum" onkeypress='return fnnumber();' autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Amount of Debit transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.amtofdbttrani" id="amtofdbttrani" value=""  class="form-control amt9" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Amount of Credit transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.amtofcrttrani" id="amtofcrttrani" value=""  class="form-control amt9" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-12 control-label" ><font size="1" class="header">MOBILE BANKING AND MOBILE PAYMENT</font><span
									style="color: red;" class="mant" ></span></label>
									</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of subscriber to the service</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofsubsserm" id="nofsubsserm" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of active mobile money accounts</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofactmonactm" id="nofactmonactm" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of registered agents outlets for accepting mobile payments</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofregagntsactmobpaym" id="nofregagntsactmobpaym" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of active agent outlets</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofactagoutm" id="nofactagoutm" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of mobile payment and mobile banking transaction</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofmobpaytransm" id="nofmobpaytransm" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of transfer transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.noftranftransm" id="noftranftransm" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of payment transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofpaytransm" id="nofpaytransm" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of cashback transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofcashtransm" id="nofcashtransm" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of cash-less cash withdrawal transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofcashwithtransm" id="nofcashwithtransm" value=""  class="form-control " onkeypress='return fnnumber();'  autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of mobile money transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofmobmnytransm" id="nofmobmnytransm" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Amount of mobile payment and mobile banking transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.amtmobpaytranm" id="amtmobpaytranm" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Amount of transfer transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.amttranstranm" id="amttranstranm" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Amount of payment transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.amtpaytranm" id="amtpaytranm" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Amount of cash back transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.amtcashbacktranm" id="amtcashbacktranm" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Amount of card less cash withdrawal transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.amtcardcashwithtranm" id="amtcardcashwithtranm" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Amount of mobile money transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.amtmobmnytranm" id="amtmobmnytranm" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Outstanding balances on active mobile money accounts</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.outbalactmobactm" id="outbalactmobactm" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-12 control-label" ><font size="1" class="header">Additional Information</font><span
									style="color: red;" class="mant" ></span></label>
									</div></div>
									
									
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">a.A List of any complaints required,includes service failures of any kind</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<textarea name="sbn.listicfailaa" id="listicfailaa" value=""  class="form-control " autocomplete="off" style="width: 171px; height: 76px;" > </textarea>
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">b. Details of action taken to identify patterns in the complaints that may point to general or systemic weaknesses</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<textarea name="sbn.detofactkbyidwab" id="detofactkbyidwab" value=""  class="form-control " autocomplete="off" style="width: 171px; height: 76px;" > </textarea> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">c. Any service breakdowns, such as network outages, giving details of the time the service went down, the reasons and the action being taken to prevent a recurrence</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<textarea name="sbn.serbrkdwreac" id="serbrkdwreac" value=""  class="form-control " autocomplete="off" style="width: 171px; height: 76px;" > </textarea> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">d. Any system security lapses, giving details and activities</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<textarea name="sbn.sysseclabactad" id="sysseclabactad" value=""  class="form-control " autocomplete="off" style="width: 171px; height: 76px;" > </textarea>
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">e. Any losses incurred by the bank or its customers</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<textarea name="sbn.lsbybkcusae" id="lsbybkcusae" value=""  class="form-control " autocomplete="off" style="width: 171px; height: 76px;" > </textarea> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">f. Any loss of confidential data</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<textarea name="sbn.lsofconfdtaf" id="lsofconfdtaf" value=""  class="form-control " autocomplete="off" style="width: 171px; height: 76px;" > </textarea>
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">g. Any breach of these guidelines (a record of which should be held by the bank)</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<textarea name="sbn.brofguidag" id="brofguidag" value=""  class="form-control " autocomplete="off" style="width: 171px; height: 76px;" > </textarea> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
								<div class="form-group ">
							<label class="col-sm-12 control-label" ><font size="1" class="header">OTHER ELECTRONIC MONEY TRANSACTIONS</font><span
									style="color: red;" class="mant" ></span></label>
									</div></div>
									<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of other electronic money transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofelcmnytrno" id="nofelcmnytrno" value="0"  class="form-control formnum" onkeypress='return fnnumber();' autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
									<div class="row col-sm-12 " >
								<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of debit transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofdedttrno" id="nofdedttrno" value=""  class="form-control amt10" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>	
									<div class="row col-sm-12 " >
								<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of credit transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofcrttrno" id="nofcrttrno" value=""  class="form-control amt10" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>	
							<div class="row col-sm-12 " >
							<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of other electronic transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofotelctrno" id="nofotelctrno" value="0"  class="form-control formnum" onkeypress='return fnnumber();' autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							
							<div class="row col-sm-12 " >
							<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">of which: Amount of debit transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.ofwhcamtdbtro" id="ofwhcamtdbtro" value=""  class="form-control amt11" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
								<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of credit transactions</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbn.nofcrttrno1" id="nofcrttrno1" value=""  class="form-control amt11" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>	
								
				
				<div class="modal-footer" style="margin-top: 20px;">
                    <button type="button" class="btn btn-xs btn-primary" id="btnHome">Home</button>
                    <button type="button" class="btn btn-xs btn-primary" style="display:none;" id="btnModify">Modify</button>
                     <button type="button" class="btn btn-xs btn-primary" style="display:none;" id="btnMsubmit">Submit</button>
                  <!-- <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button> -->
                 
                  <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                
					<button type="button" class="btn btn-xs btn-primary" id="btnSubmit">Submit</button>
					<button type="button" class="btn btn-xs btn-primary" id="btnBack">Back</button>
					
				</div>


  



			</div>


		</div>
		
	</form>
</body>
</html>