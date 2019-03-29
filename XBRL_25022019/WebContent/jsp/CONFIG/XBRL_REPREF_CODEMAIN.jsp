<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="bean.XBRL_REF_CODEMAINTBean,dao.XBRL_REF_CODEMAINTDao,java.util.ArrayList,java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Date date = new Date();
	String curdate = dateFormat.format(date);
	String type="";
	if(!request.getParameter("type").equals(null)){
		type=request.getParameter("type");
	}
	XBRL_REF_CODEMAINTBean rcb=new XBRL_REF_CODEMAINTBean();
	
	if(type.equals("inq")){
		 XBRL_REF_CODEMAINTDao upd=new XBRL_REF_CODEMAINTDao();
		   rcb=upd.detailsbean(request.getParameter("refcode"));
	}
	
	
	
%>





        
<head>

<%-- <meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;url=../XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" /> --%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">




<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>XBRL</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
 <link href="../css/bootstrap.min.css" rel="stylesheet">
 <link href="../css/bootstrap.css" rel="stylesheet">
 <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

 <script src="../jQuery/jQuery-2.2.0.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  <link href="../CSS/bootstrap.min.css" rel="stylesheet">  -->
<link href="../css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="../css/bootstrap-datepicker.css" />
 <script src="../js/bootstrap-datepicker.js"></script>
 <script type="text/javascript" src="../js/TimePicker/jquery-ui-timepicker-addon.js"></script>
 <link rel="stylesheet" media="all" type="text/css" href="../js/TimePicker/jquery-ui-timepicker-addon.css" />


	
	
<!-- <script src="../JS/jquerydatepicker.js"></script> -->
<!-- <script src="../JS/bootbox.min.js"></script>   -->

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
	width: 61px;
}

.glyphicon {
    top: 4px;
    margin-left: 92px;
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




$(document).ready(function(){
	$("#reportname").text("");
	
	$('.mant').css('color', '#eee');
	$('.form-control').attr("readonly", true);
	$('#btnSubmit').hide();
	$("#btngo").hide();
	$("#repCode1,#replvl1").hide();
	
	$( "#btnAdd" ).click(function() {
		$("#reportname").text("");
		$('.mant').css('color', 'red');
		$('.form-control').attr("readonly", false);	
		$("#sub").html(" - Add");
		$( "#btnAdd" ).attr("disabled", true);
		$("#repCode1,#replvl1").hide();
		$("#btnSubmit").show();
		$("#entryuser").val('<%=session.getAttribute("userName")%>');
		$("#entrytime").val('<%=curdate%>');
		$("#modifyuser").val('<%=session.getAttribute("userName")%>');
		$("#modifytime").val('<%=curdate%>');
		
	});
	$( "#btnModify" ).click(function() {
		$('.mant').css('color', 'red');
		$('.form-control').attr("readonly", false);	
		$("#sub").html(" - Modify");
		$("#repCode1,#replvl1").hide();
		$( "#btnModify" ).hide();
		$("#btnMsubmit").show();
		$("#btnVerify").hide();
		
	});
	$("#btnVerify").on("click",function(){
		$("#btnModify").hide();
		$("#sub").html(" - Verify");
		$("#repCode1,#replvl1").hide();
		$( "#btnVerify" ).hide();
		$("#btnVsubmit").show();
		
	});
$( "#btnHome" ).click(function() {
		
		location.href = "XBRLHomePage.jsp";
		
		});
	
	$( "#btnBack" ).click(function() {
		window.history.back();
	});
	
	
	$( "#btnInq" ).click(function() {
		
		$("#sub").html(" - List");
		$("#repCode,#replvl").hide();
		$("#repCode1,#replvl1").show();
		$("#repCode1,#replvl1").attr("readonly", false);	
		$( "#btnAdd" ).attr("disabled", true);
		$( "#btnAdd,#refCode,#refdescp1,#refdescp2,#refdescp3,#remarks,#headerFlg").attr("disabled", true);
		$("#btnSubmit").hide();
					
			 var repcode={
						"entyflg":	"N"
					};
					$.ajax({
						url:"repcodmain",
						data:repcode,
						dataType:'json',
						type:'POST',
						async:true,
						success:function(res){
							$("#repCode1").empty();
							var b=JSON.parse(res.repcodmain);
							
							console.log(b);
							$("#repCode1").append('<option value="">Select</option>'); 
								for(var i=0;i<b.length;i++){
										
									$("#repCode1").append('<option value="'+b[i].repcode+"/"+b[i].repname+'">'+b[i].repcode+'</option>');		
								}
							}
								
							});	
		
					
				$("#repCode1").change(function(){		
									$("#reportname").text($("#repCode1").val().split("/")[1]);
					/*  if($("#repCode").val() == ""){				
							
						
								$("#repCode").focus();
								$("#repCodeError").show().fadeOut(2000);
								
								$("#replvl").empty();
								$("#btngo").hide();
								
															
					 }
					 
					
					 else{ */
							var type={
									"repcode" : $("#repCode1").val().split("/")[0]
							};
							$.ajax({
								url:"replevel",
								data:type,
								dataType:'json',
								type:'POST',
								async:true,
								success:function(res){
									$("#replvl").empty();							
									var b=JSON.parse(res.repcodlev);
									
									console.log(b);
									 $("#replvl1").append('<option value="">Select</option>'); 
									for(var i=0;i<b.length;i++){
										
										$("#replvl1").empty();
											// 
										$("#replvl1").append('<option value='+b[i].repcodelvl+'>'+b[i].repcodelvl+'</option>');		
									}
									
								}
							});
					// }
					 
					
						$("#btngo").show();
						
					$("#btngo").on("click",function(){
				location.href = "XBRL_REP_CODMAINTLIST.jsp?type=list&refcode="+$("#repCode1").val().split("/")[0]+"&replev="+$("#replvl1").val();
					});
					 
				});
				
	
				 
	});
	
	
	if('<%=request.getParameter("type")%>'=="inq"){
		$("#btnModify").show();
		$("#repCode").val("<%=rcb.getRepcode()%>");
		$("#replvl").val("<%=rcb.getRepcodelvl()%>");
		$("#refCode").val("<%=rcb.getRefcode()%>");
		$("#refdescp1").val("<%=rcb.getRefdesc1()%>");
		$("#refdescp2").val("<%=rcb.getRefdesc2()%>");
		$("#refdescp3").val("<%=rcb.getRefdesc3()%>");
		$("#remarks").val("<%=rcb.getRemarks()%>");
		$("#headerFlg").val("<%=rcb.getHeaderflg()%>");
		$("#entryuser").val('<%=rcb.getEntryuser()%>');
		$("#entrytime").val('<%=rcb.getEntrytime()%>');
		$("#modifyuser").val('<%=rcb.getModifyuser()%>');
		$("#modifytime").val('<%=rcb.getModifytime()%>');
		$("#verifytime").val('<%=rcb.getVerifytime()%>');
		$("#verifyuser").val('<%=rcb.getVerifyuser()%>');
		if("<%=rcb.getEntitycreflg()%>"=="Y"){
			$("#btnModify").show();
		}else{
			$("#btnVerify").show();
		}
		
		$("#btnAdd").attr("disabled","disabled");
if($("#modifyuser").val()=='<%=session.getAttribute("userName")%>'){
			$("#btnVerify").hide();
		}else{
			$("#btnVerify").show();
		}
	}
	
	$("#btnMsubmit").on("click",function(){
		
		Refcodeform.action="refcodemod.action?method=refcodeupdate&type=modify";
		Refcodeform.submit();
	});
$("#btnVsubmit").on("click",function(){
		
		Refcodeform.action="refcodemod.action?method=refcodeupdate&type=verify";
		Refcodeform.submit();
	});
	
	$("#btnSubmit").on("click",function(){
		if($("#repCode").val()==""){
			$("#repCode").focus();
			$("#repCodeError").show().fadeOut(2000);
		}else if($("#replvl").val()==""){
			$("#replvl").focus();
			$("#replvlError").show().fadeOut(2000);
		}else if($("#refCode").val()==""){
			$("#refCode").focus();
			$("#refCodeError").show().fadeOut(2000);
		}else if($("#headerFlg").val()==""){
			$("#headerFlg").focus();
			$("#headerFlgError").show().fadeOut(2000);
		}else{
		Refcodeform.action="refcodemod.action?method=refcodeupdate&type=add";
		Refcodeform.submit();
		}
	});
});
function validateEmail(emailField){
    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

    if (reg.test(emailField.value) == false) 
    {
        alert('Invalid Email Address');
       /*  $("#emailId").focus(); */
        return false;
    }

    return true;

}
function fnnumber(evt)
{
	var e = event || evt;
	var charCode = e.which || e.keyCode;
	
	if (charCode < 48 || charCode > 57)
	{
		
		alert("Enter Numbers Only");
		event.preventDefault();
		
		
		return false;
	}
}

</script>



<body>


	<form class="form-horizontal" method="post" name="Refcodeform" id="Refcodeform"
		enctype="multipart/form-data">
		
		
        
		
		<div class="panel-heading text-center" 
			style="width: 86%;height:30px; margin-left: 53px; margin-right: 0px; margin-top: 36px; margin-bottom: 20px; background-color: #bbc3cb;">
			
			
			
			<font size="2"><b>Report Code Maintenance<b id="sub"></b></b></font>
			<button type="button" class="btn btn-xs btn-primary" id="btnInq" style="float:right;margin-left: 15px;">List</button>
			 <button type="button" class="btn btn-xs btn-primary" id="btnAdd" style="float:right;">Add</button>
			  
			

			
		</div>
		
		<div class="container-fluid" >





			<div class="panel-body">
				
				<div class="tab-content" style="width:75%;margin-left:118px;">

					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Report Code</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								 <input type="text" name="ub.repcode" id="repCode" value=""  class="form-control " autocomplete="off"/>  
								<select id="repCode1" name="ub.repcode1" class="form-control"  >
                                      	 <!--  <option value="">Select</option>  -->

									

									</select>
								
								
								
								<span style="color: red;font-size: 10px;display:none" id="repCodeError" class="error">Enter Report Code</span>
							</div><div class="col-sm-4 "><span style="color: #337ab7;font-size: 10px;" id="reportname" class=""></span></div></div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							
							<label class="col-sm-2 control-label" ><font size="1">Report Level</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								<input type="text" name="ub.repcodelvl" id="replvl" value=""  class="form-control"/> 
								
								<select id="replvl1" name="ub.repcodelvl1" class="form-control"  >
                                        <!-- <option value="">Select</option> --> 

									

									</select>
								
								<span style="color: red;font-size: 10px;display:none" id="replvlError" class="error">Enter Report Level</span>
							</div>
							</div></div>
							
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Reference Code</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="ub.refcode" id="refCode" value=""  class="form-control " autocomplete="off"/> 
								<span style="color: red;font-size: 10px;display:none" id="refCodeError" class="error">Enter Reference Code</span>
							</div></div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Reference Description-1</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								<input type="text" name="ub.refdesc1" id="refdescp1" value=""  class="form-control"/> 
								<span style="color: red;font-size: 10px;display:none" id="refdescp1Error" class="error"></span>
							</div>
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Reference Description-2</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="ub.refdesc2" id="refdescp2" value=""  class="form-control " autocomplete="off"/> 
								<span style="color: red;font-size: 10px;display:none" id="refdescp2Error" class="error"></span>
							</div>
						</div></div><div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Reference Description-3</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								<input type="text" name="ub.refdesc3" id="refdescp3" value=""  class="form-control"/> 
								<span style="color: red;font-size: 10px;display:none" id="refdescp3Error" class="error"></span>
							</div>
							</div></div>
							
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Remarks</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="ub.remarks" id="remarks" value=""  class="form-control " autocomplete="off"/> 
								<span style="color: red;font-size: 10px;display:none" id="remarksError" class="error"></span>
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-2 control-label" ><font size="1">Header Flag</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3">
								<select  name="ub.headerflg" id="headerFlg" value=""  class="form-control"> 
							<option value="N" selected>N</option>
							<option value="Y">Y</option>	</select>
								<span style="color: red;font-size: 10px;display:none" id="headerFlgError" class="error"></span>
							</div>
							
							</div></div>
					
				

				</div>
				<div class="modal-footer" style="margin-top: 20px;">
                    <button type="button" class="btn btn-xs btn-primary" id="btnHome">Home</button>
                    <button type="button" class="btn btn-xs btn-primary" style="display:none;" id="btnModify">Modify</button>
                     <button type="button" class="btn btn-xs btn-primary" style="display:none;" id="btnMsubmit">Submit</button>
                      <button type="button" class="btn btn-xs btn-primary" style="display:none;" id="btnVerify">Verify</button>
                     <button type="button" class="btn btn-xs btn-primary" style="display:none;" id="btnVsubmit">Submit</button>
					<button type="button" class="btn btn-xs btn-primary" id="btnSubmit">Submit</button>
					<button type="button" class="btn btn-xs btn-primary" id="btngo">Go</button>
					<button type="button" class="btn btn-xs btn-primary" id="btnBack">Back</button>
					
				</div>
<table Style="border:1px solid;    height: 63px; width: 690px; margin-left: 139px;">
<tr><td style="text-align: center;"><font size="1"><B>Entry User :</B></font></td><td style="width:112px"><input type="text" id="entryuser" name="ub.entryuser" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td><td style="text-align: center;"><font size="1"><B>Modify User :</B></font></td><td style="width: 112px;" ><input type="text" id="modifyuser" name="ub.modifyuser" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td><td style="text-align: center;"><font size="1"><B>Verify User :</B></font></td><td style="width: 112px;" ><input type="text" id="verifyuser" name="ub.verifyuser" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td></tr>
<tr><td style="text-align: center;"><font size="1"><B>Entry Time :</B></font></td><td style="width:112px"><input type="text" id="entrytime" name="ub.entrytime" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td><td style="text-align: center;"><font size="1"><B>Modify Time :</B></font></td><td style="width:112px"><input type="text" id="modifytime" name="ub.modifytime" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td><td style="text-align: center;"><font size="1"><B>Verify Time :</B></font></td><td style="width:112px"><input type="text" id="verifytime" name="ub.verifytime" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td></tr></table>





			</div>


		</div>
		
	</form>
</body>



</html>



