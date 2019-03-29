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
<title>SUP0200</title>

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
		 var rec1=funnconv($('#binmts').val());
		var rec2=funnconv($('#boutmts').val());
		
			tot=  parseFloat(rec1)+ parseFloat(rec2)  ; 

		$("#nofbinchdof").val(tot);
	});
	$(".amt").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	
	$(".amt1").keyup(function() {
		 var rec1=funnconv($('#nofbrurarea').val());
		var rec2=funnconv($('#nofbrrlarea').val());
		
			tot=  parseFloat(rec1)+ parseFloat(rec2); 

		$("#binmts").val(tot);

	});
	$(".amt1").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	$(".amt2").keyup(function() {
		 var rec1=funnconv($('#cinmts').val());
		var rec2=funnconv($('#coutmts').val());
		
			tot=  parseFloat(rec1)+ parseFloat(rec2); 

		$("#nofcntrs").val(tot);
	});
	$(".amt2").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	
	$(".amt3").keyup(function() {
		 var rec1=funnconv($('#inofcntrsinurarea').val());
		var rec2=funnconv($('#inofcntrsinrlarea').val());
	
			tot=  parseFloat(rec1)+ parseFloat(rec2) ; 

		$("#cinmts").val(tot);
	});
	$(".amt3").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	
	$(".amt4").keyup(function() {
		 var rec1=funnconv($('#ntfbldep').val());
		var rec2=funnconv($('#nsvngdp').val());
		
		var rec3=funnconv($('#ntimedp').val());
		
			tot=  parseFloat(rec1)+ parseFloat(rec2) +parseFloat(rec3)  ; 

		$("#nofdpapplcnrev").val(tot);
	});
	$(".amt4").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	$(".amt5").keyup(function() {
		 var rec1=funnconv($('#vtfbldep').val());
			var rec2=funnconv($('#vsvngdp').val());
			
			var rec3=funnconv($('#vtimedp').val());
			tot=  parseFloat(rec1)+ parseFloat(rec2) +parseFloat(rec3)  ; 

		$("#valofdp").val(parseFloat(tot).toFixed(2));
	});
	$(".amt5").on("blur",function(){
		if(this.value==""){
			this.value="0";
		}
	});
	$(".amt6").keyup(function() {
		 var rec1=funnconv($('#einmts').val());
		var rec2=funnconv($('#eoutmts').val());
		
		
		
			tot=  parseFloat(rec1)+ parseFloat(rec2) ; 

		$("#nofemps").val(tot);
	});
	$(".amt6").on("blur",function(){
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
			url:"finddata200",
			data:dtdate,
			dataType : 'json',
			type : 'POST',
			async : false,
			success : function(res) {	
			 console.log(res.SUP0200arr); 
			 
			 $("#nofbinchdof").val(res.SUP0200arr[0]);
					 $("#binmts").val(res.SUP0200arr[1]);
					 $("#bimnobrnchopn").val(res.SUP0200arr[2]);
					 $("#bimnobrnchcls").val(res.SUP0200arr[3]);
					 $("#nofbrurarea").val(res.SUP0200arr[4]);
					 $("#nofbrrlarea").val(res.SUP0200arr[5]);
					 $("#boutmts").val(res.SUP0200arr[6]);
					 $("#bomnofbrnchopn").val(res.SUP0200arr[7]);
					 $("#bomnobrnchcls").val(res.SUP0200arr[8]);
					 $("#nofcntrs").val(res.SUP0200arr[9]);
					 $("#cinmts").val(res.SUP0200arr[10]);
					 $("#inofcntrsopn").val(res.SUP0200arr[11]);
					 $("#inofcntrscls").val(res.SUP0200arr[12]);
					 $("#inofcntrsinurarea").val(res.SUP0200arr[13]);
					 $("#inofcntrsinrlarea").val(res.SUP0200arr[14]);
					 $("#coutmts").val(res.SUP0200arr[15]);
					 $("#onofcntrsopn").val(res.SUP0200arr[16]);
					 $("#onofcntrscls").val(res.SUP0200arr[17]);
					 $("#nofbkagent").val(res.SUP0200arr[18]);
					 $("#nofdpapplcnrev").val(res.SUP0200arr[19]);
					 $("#ntfbldep").val(res.SUP0200arr[20]);
					 $("#nsvngdp").val(res.SUP0200arr[21]);
					 $("#ntimedp").val(res.SUP0200arr[22]);
					 $("#valofdp").val(res.SUP0200arr[23]);
					 $("#vtfbldep").val(res.SUP0200arr[24]);
					 $("#vsvngdp").val(res.SUP0200arr[25]);
					 $("#vtimedp").val(res.SUP0200arr[26]);
					 $("#nofwthdrwls").val(res.SUP0200arr[27]);
					 $("#amtofwthdrwls").val(res.SUP0200arr[28]);
					 $("#noflnapplcn").val(res.SUP0200arr[29]);
					 $("#totnofrepoutmts").val(res.SUP0200arr[30]);
					 $("#nofemps").val(res.SUP0200arr[31]);
					 $("#einmts").val(res.SUP0200arr[32]);
					 $("#ofwhchnoftrns").val(res.SUP0200arr[33]);
					 $("#nofexpts").val(res.SUP0200arr[34]);
					 $("#eoutmts").val(res.SUP0200arr[35]);
					 $("#ofwhchmntnal").val(res.SUP0200arr[36]);
					 $("#cnsltnts").val(res.SUP0200arr[37]);
					 $("#ofwhchexpcsltnts").val(res.SUP0200arr[38]);

				
				$("#rcreusrname").val(res.SUP0200arr[39]);
				$("#rcreusrtime").val(res.SUP0200arr[40]);
				$("#lchgusrname").val(res.SUP0200arr[41]);
				$("#rcreusrtime").val(res.SUP0200arr[42]);
				
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
		
		
		var SUP0200data={
	
				"nofbinchdof":$("#nofbinchdof").val(),
				"binmts":$("#binmts").val(),
				"bimnobrnchopn":$("#bimnobrnchopn").val(),
				"bimnobrnchcls":$("#bimnobrnchcls").val(),
				"nofbrurarea":$("#nofbrurarea").val(),
				"nofbrrlarea":$("#nofbrrlarea").val(),
				"boutmts":$("#boutmts").val(),
				"bomnofbrnchopn":$("#bomnofbrnchopn").val(),
				"bomnobrnchcls":$("#bomnobrnchcls").val(),
				"nofcntrs":$("#nofcntrs").val(),
				"cinmts":$("#cinmts").val(),
				"inofcntrsopn":$("#inofcntrsopn").val(),
				"inofcntrscls":$("#inofcntrscls").val(),
				"inofcntrsinurarea":$("#inofcntrsinurarea").val(),
				"inofcntrsinrlarea":$("#inofcntrsinrlarea").val(),
				"coutmts":$("#coutmts").val(),
				"onofcntrsopn":$("#onofcntrsopn").val(),
				"onofcntrscls":$("#onofcntrscls").val(),
				"nofbkagent":$("#nofbkagent").val(),
				"nofdpapplcnrev":$("#nofdpapplcnrev").val(),
				"ntfbldep":$("#ntfbldep").val(),
				"nsvngdp":$("#nsvngdp").val(),
				"ntimedp":$("#ntimedp").val(),
				"valofdp":$("#valofdp").val(),
				"vtfbldep":$("#vtfbldep").val(),
				"vsvngdp":$("#vsvngdp").val(),
				"vtimedp":$("#vtimedp").val(),
				"nofwthdrwls":$("#nofwthdrwls").val(),
				"amtofwthdrwls":$("#amtofwthdrwls").val(),
				"noflnapplcn":$("#noflnapplcn").val(),
				"totnofrepoutmts":$("#totnofrepoutmts").val(),
				"nofmblvansinop":$("#nofmblvansinop").val(),
				"nofemps":$("#nofemps").val(),
				"einmts":$("#einmts").val(),
				"ofwhchnoftrns":$("#ofwhchnoftrns").val(),
				"nofexpts":$("#nofexpts").val(),
				"eoutmts":$("#eoutmts").val(),
				"ofwhchmntnal":$("#ofwhchmntnal").val(),
				"cnsltnts":$("#cnsltnts").val(),
				"ofwhchexpcsltnts":$("#ofwhchexpcsltnts").val(),

				"rcreusrname":$("#rcreusrname").val(),
				"rcreusrtime":$("#rcreusrtime").val(),
				"lchgusrname":$("#lchgusrname").val(),
				"rcreusrtime":$("#rcreusrtime").val(),"dt2":'<%=request.getParameter("dt2")%>'
	
		};
		$.ajax({
			url:"SUP0200Forminsert",
			data:SUP0200data,
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
		<%-- SUP0200Form.action="SUP0200Forminsert.action?method=SUP0200Formins&dt2="+'<%=request.getParameter("dt2")%>';
		SUP0200Form.submit(); --%>
	});
	
	
	$('#btnXML').click(function() {
		SUP0200Form.action = "XMLDOWNLOADs1.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		SUP0200Form.submit(); 
	});
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$("#btnMsubmit").on("click",function(){
		var SUP0200moddata={
				
				"nofbinchdof":$("#nofbinchdof").val(),
				"binmts":$("#binmts").val(),
				"bimnobrnchopn":$("#bimnobrnchopn").val(),
				"bimnobrnchcls":$("#bimnobrnchcls").val(),
				"nofbrurarea":$("#nofbrurarea").val(),
				"nofbrrlarea":$("#nofbrrlarea").val(),
				"boutmts":$("#boutmts").val(),
				"bomnofbrnchopn":$("#bomnofbrnchopn").val(),
				"bomnobrnchcls":$("#bomnobrnchcls").val(),
				"nofcntrs":$("#nofcntrs").val(),
				"cinmts":$("#cinmts").val(),
				"inofcntrsopn":$("#inofcntrsopn").val(),
				"inofcntrscls":$("#inofcntrscls").val(),
				"inofcntrsinurarea":$("#inofcntrsinurarea").val(),
				"inofcntrsinrlarea":$("#inofcntrsinrlarea").val(),
				"coutmts":$("#coutmts").val(),
				"onofcntrsopn":$("#onofcntrsopn").val(),
				"onofcntrscls":$("#onofcntrscls").val(),
				"nofbkagent":$("#nofbkagent").val(),
				"nofdpapplcnrev":$("#nofdpapplcnrev").val(),
				"ntfbldep":$("#ntfbldep").val(),
				"nsvngdp":$("#nsvngdp").val(),
				"ntimedp":$("#ntimedp").val(),
				"valofdp":$("#valofdp").val(),
				"vtfbldep":$("#vtfbldep").val(),
				"vsvngdp":$("#vsvngdp").val(),
				"vtimedp":$("#vtimedp").val(),
				"nofwthdrwls":$("#nofwthdrwls").val(),
				"amtofwthdrwls":$("#amtofwthdrwls").val(),
				"noflnapplcn":$("#noflnapplcn").val(),
				"totnofrepoutmts":$("#totnofrepoutmts").val(),
				"nofmblvansinop":$("#nofmblvansinop").val(),
				"nofemps":$("#nofemps").val(),
				"einmts":$("#einmts").val(),
				"ofwhchnoftrns":$("#ofwhchnoftrns").val(),
				"nofexpts":$("#nofexpts").val(),
				"eoutmts":$("#eoutmts").val(),
				"ofwhchmntnal":$("#ofwhchmntnal").val(),
				"cnsltnts":$("#cnsltnts").val(),
				"ofwhchexpcsltnts":$("#ofwhchexpcsltnts").val(),

				"rcreusrname":$("#rcreusrname").val(),
				"rcreusrtime":$("#rcreusrtime").val(),
				"lchgusrname":$("#lchgusrname").val(),
				"rcreusrtime":$("#rcreusrtime").val(),"dt2":'<%=request.getParameter("dt2")%>'
	
		};
	
		$.ajax({
			url:"SUP0200Formmodify",
			data:SUP0200moddata,
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
		<%-- SUP0200Form.action="SUP0200Formmodify.action?method=SUP0200Formmod&dt2="+'<%=request.getParameter("dt2")%>';
		SUP0200Form.submit(); --%>
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			SUP0200Form.action = "SUP0200EXCELSum.action?method=SUP0200EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			SUP0200Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			SUP0200Form.action = "SUP0200PDFREPORT.action?method=SUP0200PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			SUP0200Form.submit();
		}
	});
	$("#btnBack").on("click",function(){
		location.href="XBRL_CRT_SUP0200_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
	});
	
	


	
});


</script>
<script>

function functionli(a){
	$("#tab1").show();
if(a==1){
	
	$("#tab1").show();
	 $("#li1").addClass("active");
	 $("#li2").removeClass("active");
}else if(a==2){
	$("#tab2").show();
	 $("#li2").addClass("active");
	 $("#li1").removeClass("active");
}
}
</script>
<body>
<form class="form-horizontal" method="post" name="SUP0200Form" id="cform"
		enctype="multipart/form-data">
		
		
        <input type="hidden"id="authFlg" value=""/>
		
		<div class="panel-heading text-center" 
			style="width: 92%; margin-left: 53px; margin-right: 0px; margin-top: 36px; margin-bottom: 20px; background-color: #bbc3cb;">
			
			<input type="hidden" name="sbs.lchgusrname" id="lchgusrname">
			<input type="hidden" name="sbs.lchgusrtime" id="lchgusrtime">
			<input type="hidden" name="sbs.rcreusrname" id="rcreusrname">
			<input type="hidden" name="sbs.rcreusrtime" id="rcreusrtime">
			
			 <ul class="nav nav-tabs navright" id="mytab" style="    width: 1236px; ">

					<li class=" pull-right list" id="li2" onclick="functionli(2);"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" id="li1" onclick="functionli(1);" ><a href="#tab1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>




				</ul>
			<font size="2"><b> SUP0200 - Statement of Bank Structure <b id="sub" ></b></b></font>
			 <span style="margin-left: 400px;"><button type="button" class="btn btn-xs btn-primary" id="btnedit" style="display:none;">Edit</button>
			<!--   <button type="button" class="btn btn-xs btn-primary" id="btnInq" style="width: 60px;">List</button> -->
			 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select>

			</span>
		</div>
		
		<div class="container-fluid" >





			<div class="panel-body" id="tab1">
				
				<div class="tab-content" style="width:75%;margin-left:118px;">

					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of branches (incl. Head Office)</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.nofbinchdof" id="nofbinchdof" value="0"  class="form-control formnum" autocomplete="off" onkeypress='return fnnumber();' readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">In Mauritius</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.binmts" id="binmts" value="0"  class="form-control formnum amt" onkeypress='return fnnumber();'autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
				<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of branches opened</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.bimnobrnchopn" id="bimnobrnchopn" value=""  class="form-control "  onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of branches closed</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.bimnobrnchcls" id="bimnobrnchcls" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of branches in urban areas</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.nofbrurarea" id="nofbrurarea" value=""  class="form-control amt1" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
                   <div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of branches in rural areas</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.nofbrrlarea" id="nofbrrlarea" value=""  class="form-control amt1"  onkeypress='return fnnumber();' autocomplete="off" /> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Outside Mauritius</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.boutmts" id="boutmts" value=""  class="form-control amt "  onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of branches opened</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.bomnofbrnchopn" id="bomnofbrnchopn" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of branches closed</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.bomnobrnchcls" id="bomnobrnchcls" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							 <div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of Counters</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.nofcntrs" id="nofcntrs" value="0"  class="form-control formnum" onkeypress='return fnnumber();' autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">In Mauritius</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.cinmts" id="cinmts" value="0"  class="form-control formnum amt2" onkeypress='return fnnumber();' autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of counters opened</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.inofcntrsopn" id="inofcntrsopn" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of counters closed</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.inofcntrscls" id="inofcntrscls" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of counters in urban areas</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.inofcntrsinurarea" id="inofcntrsinurarea" value=""  class="form-control amt3" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of counters in rural areas</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.inofcntrsinrlarea" id="inofcntrsinrlarea" value=""  class="form-control amt3" onkeypress='return fnnumber();' autocomplete="off" /> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Outside Mauritius</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.coutmts" id="coutmts" value=""  class="form-control amt2" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of counters opened</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.onofcntrsopn" id="onofcntrsopn" value=""  class="form-control " onkeypress='return fnnumber();'autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of counters closed</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.onofcntrscls" id="onofcntrscls" value=""  class="form-control" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of banking agents (non-branch retail locations)</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.nofbkagent" id="nofbkagent" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off" /> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							
							
							
									<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of deposit applications received</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.nofdpapplcnrev" id="nofdpapplcnrev" value="0"  class="form-control formnum" onkeypress='return fnnumber();' autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">	Transferable deposits </font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.ntfbldep" id="ntfbldep" value=""  class="form-control amt4" onkeypress='return fnnumber();' autocomplete="off" /> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">	Savings deposits</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.nsvngdp" id="nsvngdp" value=""  class="form-control amt4" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Time deposits</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.ntimedp" id="ntimedp" value=""  class="form-control amt4" autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Value of deposits</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.valofdp" id="valofdp" value="0"  class="form-control formnum" onkeypress='return fnnumber();' autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Transferable deposits</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.vtfbldep" id="vtfbldep" value=""  class="form-control amt5" onkeypress='return fnnumber();' autocomplete="off" /> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Savings deposits</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.vsvngdp" id="vsvngdp" value=""  class="form-control amt5" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Time deposits</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.vtimedp" id="vtimedp" value=""  class="form-control amt5" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-12 control-label" ><font size="1" class="header">Withdrawals</font><span
									style="color: red;" class="mant" ></span></label>
									</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of withdrawals</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.nofwthdrwls" id="nofwthdrwls" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Amount of withdrawals</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.amtofwthdrwls" id="amtofwthdrwls" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off" /> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" > <font size="1">Number of loan applications</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.noflnapplcn" id="noflnapplcn" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Total number of representative offices outside Mauritius</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.totnofrepoutmts" id="totnofrepoutmts" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of mobile vans in operation</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.nofmblvansinop" id="nofmblvansinop" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of employees</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.nofemps" id="nofemps" value="0"  class="form-control formnum" onkeypress='return fnnumber();' autocomplete="off" readonly/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">In Mauritius</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.einmts" id="einmts" value=""  class="form-control amt6" onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
					<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">of which: Number of trainees</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.ofwhchnoftrns" id="ofwhchnoftrns" value=""  class="form-control " aonkeypress='return fnnumber();' utocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Number of expatriates</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.nofexpts" id="nofexpts" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div></div>
						</div>
						<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Outside Mauritius</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.eoutmts" id="eoutmts" value=""  class="form-control amt6 " autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">of which: Mauritian nationals</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.ofwhchmntnal" id="ofwhchmntnal" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off" /> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							
							
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">Consultants</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.cnsltnts" id="cnsltnts" value=""  class="form-control "  onkeypress='return fnnumber();' autocomplete="off"/> 
								<!-- <span style="color: red;font-size: 10px;display:none" id="noatminopError" class="error"></span> -->
							</div>
							</div></div>
							<div class="row col-sm-12 " >
						<div class="form-group ">
							<label class="col-sm-4 control-label" ><font size="1">of which: Expatriate consultants</font><span
									style="color: red;" class="mant" ></span></label>
							<div class="col-sm-3 ">
								<input type="text" name="sbs.ofwhchexpcsltnts" id="ofwhchexpcsltnts" value=""  class="form-control " onkeypress='return fnnumber();' autocomplete="off"/> 
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



 <table class="table" id="tab2" style="width: 1024px; margin-top: -20px;margin-left: 6px;">
   
             <thead>
          <th colspan="6" style="text-align:center;font-size: 13px;text-align:center"><b>Locations of ATMs in Operation</b></th></tr>
          <tr>
         
          <th rowspan="2" style="text-align:center" id="srno" >Serial Number</th>
          <th style="text-align:center" id="adrs" >Address</th>
          <th style="text-align:center" id="lcn" >Location</th>
          <th  style="text-align:center" id="nofatm" >Number of ATMs</th>
          <th rowspan="2"  ></th>
          </tr>
          <tr>
          <th style="text-align:center">A</th>
          <th style="text-align:center">B</th>
          <th style="text-align:center">C</th>
          </thead>
          
           <tbody id="apndata"></tbody>
          </table>
 


			</div>


		</div>
		
	</form>
</body>
</html>