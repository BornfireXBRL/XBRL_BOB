<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page
	import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	Date date = new Date();
	String curdate = dateFormat.format(date);
	
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>XBRL</title>
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
<script src="https://cdn.jsdelivr.net/sweetalert2/5.3.8/sweetalert2.js"></script>
<link href="https://cdn.jsdelivr.net/sweetalert2/5.3.8/sweetalert2.css" rel="stylesheet"/>

<link rel="stylesheet" href="../css/bootstrap-datepicker.css" />
 <script src="../js/bootstrap-datepicker.js"></script>
 <script type="text/javascript" src="../js/TimePicker/jquery-ui-timepicker-addon.js"></script>
 <link rel="stylesheet" media="all" type="text/css" href="../js/TimePicker/jquery-ui-timepicker-addon.css" />
</head>
<style>
body {
	font-family: Arial;
	background-color: #eee;
	 
	 
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
.container1
{
    position: fixed; /* Sit on top of the page content */
  top: 10px; 
    left: 0;
    right: 0;
    bottom: 0;
display:none;
border: 1px outset;
width: 316px;
height:165px;
background-color: #eee;
margin:0 auto;

border-radius: 10px;


transition: opacity .25s ease;
 z-index: 99999;
  -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.5s;
    animation-name: animatetop;
    animation-duration: 0.5s
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

.tab-content {
    width: 78%;
    margin-left: 101px;
}

fieldset.scheduler-border {
	width: 840px;
/* 	border: 1px groove #ddd !important;
 padding:-1px 1.4em 1.4em !important;
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
/* 	border: 1px solid #CCC;
 */
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
/* .acctd,.head{
display:none;
}
 */
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
border:0px solid #ddd;
}
 fieldset.borfs{

border:1px solid #ddd;

}  
table{
border:none;
}
</style>
<script>
$(document).ready(function(){
	
	$("#entryuser").val('<%=session.getAttribute("userName") %>');
	$("#entrytime").val('<%=curdate %>');
	$("#modifyuser").val('<%=session.getAttribute("userName") %>');
	$("#modifytime").val('<%=curdate %>');
	$('.form-control').attr("disabled", true);
	$("#addtype").attr("disabled",false);
	$("#btnadd").hide();
	
/* 	$("#btnadd").on("click",function(){
		$("#addtype").show();
		$("#btnadd,#btnlist").attr("disabled",true);
		$("#type1").text(" - Add");
		$("#typebtn").val("add");
	}); */
	
	
	
	$("#repnum").on("change",function(){
		$("#replvl").empty();
		$("#refcode").empty();
		$("#replvl").attr("disabled",false);
		$("#refcode").append('<option value="">Select</option>');
		$("#descrip").text("");
		$("#replvl").append('<option value="">Select</option>');
		var type={
				"typ":"replvl" ,"repnum":$("#repnum").val()
		};
		$.ajax({
			url:"reportdet1",
			data:type,
			dataType:'json',
			type:'POST',
			async:false,
			success:function(res){
				
				
				var b=JSON.parse(res.repnum);
				console.log(b);
				for(var i=0;i<b.length;i++){
					
					$("#replvl").append('<option value='+b[i].replvl+'>'+b[i].replvl+'</option>');		
				}
			
			}
		});
	});
	$("#replvl").on("change",function(){
		
		$("#refcode").empty();
		$("#refcode").attr("disabled",false);
		$("#descrip").text("");
		$("#refcode").append('<option value="">Select</option>');
		if($("#addtype").val()=="newreport"){
			var type={
					"typ":"refcode" ,"repnum":$("#repnum1").val(),"replvl":$("#replvl").val()
			};
		}else{
			
		
		var type={
				"typ":"refcode" ,"repnum":$("#repnum").val(),"replvl":$("#replvl").val()
		};
		}
		$.ajax({
			url:"reportdet1",
			data:type,
			dataType:'json',
			type:'POST',
			async:false,
			success:function(res){
				$("#btngotolist").show();
				
				var b=JSON.parse(res.repnum);
				console.log(b);
				for(var i=0;i<b.length;i++){
					
					$("#refcode").append('<option value="'+b[i].refcode+'/'+b[i].repname+'/'+b[i].refdesc1+'/'+b[i].refdesc2+'/'+b[i].refdesc3+'">'+b[i].refcode+'</option>');		
				}
			
			}
		});
		/* alert($("#refcode").val());
		if($("#refcode").val() !== " "){
			alert(" inside if");
			$("#btngotolist").hide();
			
		}else{
			$("#btngotolist").show();
		}
		 */
	});
	

	$("#refcode").on("change",function(){
		if(!$("#refcode").val()=="" && $("#typebtn").val()=="list"){
		$("#descrip").text($("#refcode").val().split("/")[2]);
		
	
		}/* else if(!$("#refcode").val()=="" && $("#typebtn").val()=="add"){
			$("#descrip").text($("#refcode").val().split("/")[1]);
			$("#entflg").attr("disabled",false);
		
		} */	else{
		
			$("#descrip").text("");
		}
	});
	
	/* $("#btngo").on("click",function(){
	
		
		 if(!$("#repnum1").val()==""){
				$(".container1").modal("toggle");
			
			var repnum={
				"repnum":	$("#repnum1").val()
			};
			$.ajax({
				url:"repupdate",
				data:repnum,
				dataType:'json',
				type:'POST',
				async:false,
				success:function(res){
					console.log(res.sts);
					if(res.sts=="success"){
						var type={
								"typ":"replvl" ,"repnum":$("#repnum1").val()
						};
						$.ajax({
							url:"reportdet",
							data:type,
							dataType:'json',
							type:'POST',
							async:false,
							success:function(res){
								
								
								var b=JSON.parse(res.repnum);
								console.log(b);
								for(var i=0;i<b.length;i++){
									
									$("#replvl").append('<option value='+b[i].replvl+'>'+b[i].replvl+'</option>');		
								}
								$("#replvl").attr("disabled",false);
							}
						});
					}else{
						alert("Technical Issue please try again later");
						$("#repnum2").val("");
						$("#addtype").val("");
						
					}
				}
			});
			
		}else{
			$("#repnum1").focus();
			$("#repnum2err").show().fadeOut(2000);
		}
	});
	
	$("#repnum1").on("change",function(){
		if(!$("#repnum1").val()==""){
			$("#repnum2").val($("#repnum1").val());
			
		}else{
			$("#repnum").val("");
		}
	});
	
	 */
	
	$("#btnlist").on("click",function(){
		$("#repnum").empty();
		$("#sub").show();
		$("#sub").text(" - Inquire");
		$("#typebtn").val("list");
	
		$("#btnSubmit").hide();
		//$("#btnadd").attr("disabled",true);
		$("#btnadd").hide();
		
		$("#repnum").append('<option value="">Select</option>');
		$("#repnum").attr("disabled",false);
		$("#btngotolist").hide();
		 var type={
					"typ":"repnum"
			};
			$.ajax({
				url:"reportdet1",
				data:type,
				dataType:'json',
				type:'POST',
				async:false,
				success:function(res){
										
					var b=JSON.parse(res.repnum);
					console.log(b);
					for(var i=0;i<b.length;i++){
						
						$("#repnum").append('<option value='+b[i].repnum+'>'+b[i].repnum+'</option>');		
					}
				
				}
			});
			$("#btngotolist").hide();
	});
	
	
	$("#btngotolist").on("click",function(){
		
		  $("#divLoading").addClass('show'); 
		location.href="XBRL_REP_DETAILSLIST.jsp?repnum="+$("#repnum").val()+"&replvl="+$("#replvl").val()+"&refcode="+$("#refcode").val().split("/")[0]+"&type=listmap";
	});
});
		</script>
		
<body>
<form class="form-horizontal" method="post" name="repmapping"
		enctype="multipart/form-data">
		
		<div id="divLoading"></div>
<div class="panel-heading text-center tl" 
			style="width: 86%; margin-left: 71px; margin-right: 0px; margin-top: 36px; margin-bottom: 20px;    height: 27px; background-color: #bbc3cb;">
			<input type="hidden" id="typebtn">
			
			
			<font size="2"><b>Report Details <b id="sub"
					Style="display: none"></b></b></font><b><font size="2" id="type1"></font></b>
			
			
<BUTTON type="button" class="btn btn-xs btn-primary" id="btnlist" style="float:right">List</BUTTON>
			<select id="addtype" class="form-control" style="float:right;   display:none;  width: 95px;   margin-right: 15px;"><option value="">Select</option>
			<option value="newreport">Assign to New Report</option>
			<option value="existingreport">Assign to Existing Report</option>
			
			</select><BUTTON type="button" class="btn btn-xs btn-primary" id="btnadd" style="float:right;    margin-right: 15px;">Add</BUTTON>
		</div>
<div class="container-fluid gmd-1 hover " style="padding-top: 23px; width: 85%;margin-left: 119px;">

	<div class="form-group "><input type="hidden" id="rowno">
	
	<fieldset class="scheduler-border borfs "><legend class="scheduler-border">Report Code Details </legend>
 <table border="1" style="width: 100%;border:none;" id="tb1" class="" >
 <tbody class="databody">
 
 
 
      <tr style="height: 44px;"><td> <font size="1"><b>Report Number</b></font>  </td><td><select id="repnum" style="width:131px" name="rmb.repnum" class="form-control"  >
                                       <option value="">Select</option>

									

									</select> <input type="text" id="repnum2" name="rmb.repnum2" class="form-control" style="width:131px;display:none" readonly><!-- <button class="btn btn-xs btn-primary">Go</button> --><span style="color: red; font-size: 10px; display: none;" id="repnum1err" class="error">Select Report Number</span></td><td> <font size="1"><b>Report Level</b></font>   </td><td><select id="replvl" style="width:131px" name="rmb.replvl" class="form-control"  >
                                       <option value="">Select</option>

									

									</select><span style="color: red; font-size: 10px; display: none;" id="replvl1err" class="error">Select Report Level</span> </td>
						   </tr>
						   <tr style=""><td> <font size="1"><b>Reference Code</b></font>   </td><td><select id="refcode" style="width:131px" name="rmb.refcode" class="form-control"  >
                                       <option value="">Select</option>

									

									</select><span style="color: red; font-size: 10px; display: none;" id="refcode1err" class="error">Select Reference Code</span></td><td><font size="1"><b>Reference Code Desc</b></font>   </td><td><font id="descrip" style="color:#337ab7" size="1"></font>
                               </td></tr>
  </tbody>
    </table> 
    
   
    
    </fieldset>
   
					</div>
				

</div>
<div class="container1" >

						 
						<div class="panel-heading" style="    TEXT-ALIGN: CENTER;"><font size="3"><b></b></font>
						<button type="button" class="close" data-dismiss="modal">&times;</button> </div>
  <div class="center-div" style="">
<br><br>
      <!--   <label>Upload button</label> -->
    
  <font size="2" style="    margin-left: 30px;"><b>Report Number</b></font>  <select id="repnum1" style="width:131px;float:right" name="rmb.repnum1" class="form-control"  >
                                       <option value="">Select</option>

									

									</select>
  </div>
<div style="float:right">  <span style="color: red; font-size: 10px; display: none;" id="repnum2err" class="error">Select Report Number</span></div>
 <div class="modal-footer" style="padding-right:0px;"><button type="button" class="btn btn-xs btn-primary" id="btngo">Go</button></div>

</div>
    	<div class="modal-footer" style="">
                    <button type="button" class="btn btn-xs btn-primary" id="btnHome">Home</button>
                  	<button type="button" class="btn btn-xs btn-primary" style="" id="btngotolist">Go</button>
				<!-- 	<button type="button" class="btn btn-xs btn-primary" id="btnSubmit">Update</button> -->
					<button type="button" class="btn btn-xs btn-primary" id="btnBack">Back</button></div>
					<table Style="border:1px solid;    height: 63px; width: 75%; margin-left: 92px;">
<tr><td style="text-align: center;"><font size="1"><B>Entry User :</B></font></td><td style="width:112px"><input type="text" id="entryuser" name="ub.entryuser" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td><td style="text-align: center;"><font size="1"><B>Modify User :</B></font></td><td style="width: 112px;" ><input type="text" id="modifyuser" name="ub.modifyuser" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td><td style="text-align: center;"><font size="1"><B>Verify User :</B></font></td><td style="width: 112px;" ><input type="text" id="verifyuser" name="ub.verifyuser" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td></tr>
<tr><td style="text-align: center;"><font size="1"><B>Entry Time :</B></font></td><td style="width:112px"><input type="text" id="entrytime" name="ub.entrytime" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td><td style="text-align: center;"><font size="1"><B>Modify Time :</B></font></td><td style="width:112px"><input type="text" id="modifytime" name="ub.modifytime" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td><td style="text-align: center;"><font size="1"><B>Verify Time :</B></font></td><td style="width:112px"><input type="text" id="verifytime" name="ub.verifytime" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td></tr></table>

	</form>				
</body>
</html>