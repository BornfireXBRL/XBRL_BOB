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
	$("#btnedit2").hide();
	$("#btnadd").hide();
	$("#tab1").show();
	$(".table").hide();
	$("#tab2").hide();
	$("#footer").hide();
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
					url:"saveSums200",
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
$(document).ready(function(){
	
	if('<%=request.getParameter("typo")%>'=="edit"){
		$("#btnSubmit3").hide();
		$("#btnedit").show();
		$("#btnadd").hide();
		var seldata={
			"dt2":'<%=request.getParameter("dt2")%>'	
		};
		$.ajax({
			url:"sup0200s1Formselect",
			data:seldata,
			dataType:'json',
			type:'POST',
			async:false,
			success:function(res){
				$('#apndata tr').remove();
				var b=JSON.parse(res.SUP0200s1arr);
				 console.log(b);
				 var cnt=1;
				 for(var i=0;i<b.length;i++){
				if(b[i].typofbsns=="-"){
					b[i].typofbsns="";
				}if(b[i].nmeofadrs=="-"){
					b[i].nmeofadrs="";
				}if(b[i].lcn=="-"){
					b[i].lcn="";
				}if(b[i].nmeofchrg=="-"){
					b[i].nmeofchrg="";
				}
					  		var data="<tr id='tr"+cnt+"'>";
					        data +="<td id='srno"+cnt+"' >"+cnt+"</td>";
					       data +="<td><input type='text' id='typofbsns"+cnt+"' name='typofbsns' class='form-control'  value="+b[i].typofbsns+"  /></td>";
					        data +="<td><input type='text' id='nmeofadrs"+cnt+"' name='nmeofadrs' class='form-control'  value="+b[i].nmeofadrs+"  /></td>";
					       data +="<td><input type='text' id='lcn"+cnt+"' name='lcn' class='form-control'  value="+b[i].lcn+"  /></td>";
					        data +=" <td><input type='text' id='nmeofchrg"+cnt+"' name='nmeofchrg' class='form-control syscode'  value="+b[i].nmeofchrg+" /></td><td> <button type='button' style='width: 30px;margin-top:3px;' class='btn btn-xs btn-danger' onclick='fnremove("+cnt+")' id='btnrmv' >X</button></td>";
					        
					
					      $('#apndata').append(data);
					      
					     cnt++;
					    
				 }
				  $("#rowno").val(cnt-1);
				$(".form-control").attr("readonly",true);
				$("#btnSubmit3").hide();
			}
		}); 
		
	}else{
		$("#btnedit2").hide();
	}

$("#btnadd").on('click',function(){
	
	var i=parseInt($("#rowno").val());
	i++;

	var data="<tr id='tr"+i+"'>";
    data +=" <td>"+i+"</td>";
   data +="<td><input type='text' id='typofbsns"+i+"' name='typofbsns' class='form-control'  value=''  /></td>";
    data +="<td><input type='text' id='nmeofadrs"+i+"' name='nmeofadrs' class='form-control'  value=''  /></td>";
   data +="<td><input type='text' id='lcn"+i+"' name='lcn' class='form-control'  value='' /></td>";
    data +=" <td><input type='text' id='nmeofchrg"+i+"' name='nmeofchrg' class='form-control syscode'  value='' /></td><td> <button type='button' style='width: 30px;margin-top:3px;' class='btn btn-xs btn-danger' onclick='fnremove("+i+")' id='btnrmv' >X</button></td>";
    

      $('#apndata').append(data);
      
     
      $("#rowno").val(i++);
   
});

$("#btnMsubmit2").on("click",function(){
	var typofbsns="";
	var nmeofadrs="";
	var lcn="";
	var nmeofchrg="";
	var cnt=0;
	$("input[name='typofbsns']").each(function(){
		alert(this.value=="");
		if(this.value==""){
			typofbsns=typofbsns+"/"+"-";
			cnt++;
		}else{
			typofbsns=typofbsns+"/"+this.value;
			cnt++;
		}
		
	});
	$("input[name='nmeofadrs']").each(function(){
		if(this.value==""){
			nmeofadrs=nmeofadrs+"/"+"-";
		}else{
			nmeofadrs=nmeofadrs+"/"+this.value;
		}
	});
	$("input[name='lcn']").each(function(){
		if(this.value==""){
			lcn=lcn+"/"+"-";
		}else{
		lcn=lcn+"/"+this.value;
		}
	});
	$("input[name='nmeofchrg']").each(function(){
		if(this.value==""){
			nmeofchrg=nmeofchrg+"/"+"0";
		}else{
			nmeofchrg=nmeofchrg+"/"+this.value;
		}
	});
	
	var insdata={
		"typofbsns":typofbsns,
		"nmeofadrs":nmeofadrs,
		"lcn":lcn,
		"nmeofchrg":nmeofchrg,
		"cnt":cnt,
		"dt2":'<%=request.getParameter("dt2")%>',
		"typo":"modify"
	};
	$.ajax({
		url:"sup0200sec1insajx",
		data:insdata,
		dataType:'json',
		type:'POST',
		async:false,
		success:function(res){
			alert(res.alert);
			$(".form-control").attr("readonly",true);
			$("#btnSubmit3").hide();
			$("#btnedit2").show();
			$("#btnMsubmit2").hide();
			$("#btnedit2").attr("disabled",false);
			$("#btnadd").hide();
			
			 var datasum={
						"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").text()

			};
			$.ajax({
				url:"saveSums200",
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
			 
});
$("#btnedit2").on("click",function(){
	$("#btnadd").show();
	$("#btnedit2").attr("disabled",true);
	$(".form-control").attr("readonly",false);
	$(".formnum").attr("readonly",true);
	$("#btnMsubmit2").show();
});
$("#btnSubmit3").on("click",function(){
	var typofbsns="";
	var nmeofadrs="";
	var lcn="";
	var nofchrg="";
	var cnt=0;
	$("input[name='typofbsns']").each(function(){
		
		if(!this.value==""){
	
			typofbsns=typofbsns+"/"+this.value;
			cnt++;
		}
		
	});
	
$("input[name='nmeofadrs']").each(function(){
		
		if(this.value==""){
	
			nmeofadrs=nmeofadrs+"/"+"-";
			
		}else{
		nmeofadrs=nmeofadrs+"/"+this.value;
		}
		
	});
	$("input[name='lcn']").each(function(){
		if(this.value==""){
			lcn=lcn+"/"+"-";
		}else{
		lcn=lcn+"/"+this.value;
		}
	});
	$("input[name='nmeofchrg']").each(function(){
		if(this.value==""){
			nmeofchrg=nmeofchrg+"/"+"-";
		}else{
			nmeofchrg=nmeofchrg+"/"+this.value;
		}
	});
	var inpdata={
			"typofbsns":typofbsns,
			"nmeofadrs":nmeofadrs,
			"lcn":lcn,
			"nmeofchrg":nmeofchrg,
		"cnt":cnt,
		"dt2":'<%=request.getParameter("dt2")%>',
		"typo":"add"
	};
	
	$.ajax({
		url:"sup0200sec1insajx",
		data:inpdata,
		dataType:'json',
		type:'POST',
		async:true,
		success:function(res){
			alert(res.alert);
			$("#btnadd").attr("disabled",true);
			$(function() {
				  $('table tr').each(function() {
				    $(this).find('td').each(function() {
				        $(this).find('input,select,textarea').attr("readonly", true);
				    });
				  });
				});
			$("#btnSubmit3").hide();
		}
	});
	
});

});


</script>

<script>
function fnremove(a){
	$('#tr'+a).remove();
}
function functionli(a){

if(a==1){
	$("#tab1").show();
	$("#tab2").hide();
	$("#footer").hide();
	 $("#li1").addClass("active");
	 $("#li2").removeClass("active");
	 $("#btnedit2").hide();
	 $("#btnedit").show();
}else if(a==2){
	$("#tab2").show();
	$("#footer").show();
	 $("#li2").addClass("active");
	 $("#li1").removeClass("active");
	 $("#tab1").hide();
	 if('<%=typo%>'=="add"){
		 $("#btnadd").show();
	 }else{
		 $("#btnedit").hide();
		 $("#btnedit2").show();
	 }
	
	 
}
}
</script>
<body>
<form class="form-horizontal" method="post" name="SUP0200Form" id="cform"
		enctype="multipart/form-data">
		
		
        <input type="hidden"id="authFlg" value=""/>
		 <ul class="nav nav-tabs navright" id="mytab" style=" margin-top: 36px; width:92%;height:30px; ">

					<li class=" pull-right list" id="li2" onclick="functionli(2);"><a href="#tab2" data-toggle="tab" style="height:30px;"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" id="li1" onclick="functionli(1);" ><a href="#tab1" style="height:30px;"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>




				</ul>
		<div class="panel-heading text-center" 
			style="width: 92%; margin-left: 53px; margin-right: 0px;margin-bottom: 20px; background-color: #bbc3cb;">
			<input type="hidden" id="rowno" value="0">
			<input type="hidden" name="sbs.lchgusrname" id="lchgusrname">
			<input type="hidden" name="sbs.lchgusrtime" id="lchgusrtime">
			<input type="hidden" name="sbs.rcreusrname" id="rcreusrname">
			<input type="hidden" name="sbs.rcreusrtime" id="rcreusrtime">
			
			
			<font size="2"><b> SUP0200 - Statement of Bank Structure <b id="sub" ></b></b></font>
			 <span style="margin-left: 400px;"><button type="button" class="btn btn-xs btn-primary" id="btnedit" style="display:none;">Edit</button>
			 <button type="button" class="btn btn-xs btn-primary" id="btnedit2" style="display:none;">Edit</button>
			  <button type="button" class="btn btn-xs btn-primary" id="btnadd" >Add</button>
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



 


			</div>


		</div>
		<table class="table" id="tab2" style="width: 965px; margin-top: -20px;margin-left: 38px;">
   
             <thead>
          <th colspan="6" style="text-align:center;font-size: 13px;text-align:center"><b>List of branches, counters, representative offices, subsidiaries, banking agents</b></th></tr>
          <tr>
         
          <th rowspan="2" style="text-align:center" id="srno" >Serial Number</th>
          <th style="text-align:center" id="typofbsns" >Type of Business</th>
          <th style="text-align:center" id="nmeofadrs" >Name & Address</th>
          <th  style="text-align:center" id="lcn" >Location</th>
           <th  style="text-align:center" id="nmeofchrg" >Name of officer in charge</th>
          <th rowspan="2"  ></th>
          </tr>
          <tr>
          <th style="text-align:center">A</th>
          <th style="text-align:center">B</th>
          <th style="text-align:center">C</th>
           <th style="text-align:center">D</th>
          </thead>
          
           <tbody id="apndata"></tbody>
           
          </table>
          <div class="modal-footer" id="footer"style="margin-top: 20px;">
                    <button type="button" class="btn btn-xs btn-primary" id="btnHome">Home</button>
                    <button type="button" class="btn btn-xs btn-primary" style="display:none;" id="btnModify2">Modify</button>
                     <button type="button" class="btn btn-xs btn-primary" style="display:none;" id="btnMsubmit2">Submit</button>
                  <!-- <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button> -->
                 
                  <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                
					<button type="button" class="btn btn-xs btn-primary" id="btnSubmit3">Submit</button>
					<button type="button" class="btn btn-xs btn-primary" id="btnBack">Back</button>
					
				</div>
 </div>
	</form>
</body>
</html>