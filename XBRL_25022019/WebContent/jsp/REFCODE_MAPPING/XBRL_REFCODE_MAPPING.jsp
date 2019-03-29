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
	String type=request.getParameter("type");
	String repnum=request.getParameter("repnum");
	String replvl=request.getParameter("replvl");
	String accno=request.getParameter("accno");
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
	/* border: 1px solid #CCC; */
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

 .databody td{
border:0px solid #ddd;
}
fieldset.borfs{

border:1px solid #ddd;

} 
table{
border:none;
}
/* .acctd,.head{
display:none;
}
 */
</style>
<script>
$(document).ready(function(){
	if('<%=type%>'=="add"){
		$("#addtype").show();
		$("#typebtn").val("add");
	}else{
		$("#addtype").hide();
	}
	
	$("#entryuser").val('<%=session.getAttribute("userName") %>');
	$("#entrytime").val('<%=curdate %>');
	$("#modifyuser").val('<%=session.getAttribute("userName") %>');
	$("#modifytime").val('<%=curdate %>');
	$('.form-control').attr("disabled", true);
	$("#addtype").attr("disabled",false);
	if('<%=type%>'=="fromlist"){
		$("#repnum").attr("disabled",false);
		$("#typebtn").val("list");
		 var type={
					"typ":"repnum"
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
						
						$("#repnum").append('<option value='+b[i].repnum+'>'+b[i].repnum+'</option>');		
					}
				
				}
			}); 
		
	}else{
		$("#repnum").attr("disabled",true);
	}
	
	if('<%=type%>'=="edit"){
		$('.form-control').attr("disabled", false);
		$("#entflg,#finrefcode1,#cusid2,#accno2,#symtyp2,#glhead2,#schmcode2,#finrefcode2").attr("disabled", true);
		$("#cusid1,#accno1,#repnum2").attr("readonly",true);
		$("#repnum2,#replvl2,#symtyp12,#glhead112,#schmcode12").show();
		$("#repnum,#replvl,#symtyp1,#glhead1,#schmcode1").hide();
		 $("#repnum2").val('<%=repnum%>'); 
		$("#replvl2").val('<%=replvl%>');
		$("#cusid1").val('<%=accno%>'.split("/")[1]);
		$("#accno1").val('<%=accno%>'.split("/")[0]);
		$("#symtyp12").val('<%=accno%>'.split("/")[2]);
		$("#glhead12").val('<%=accno%>'.split("/")[3]);
		$("#schmcode12").val('<%=accno%>'.split("/")[4]); 
	
		$("#refcode").attr("disabled",false);
		
		
		var type={
				"typ":"refcode" ,"repnum":'<%=repnum%>',"replvl":'<%=replvl%>'
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
					
					$("#refcode").append('<option value="'+b[i].refcode+'/'+b[i].repname+'/'+b[i].refdesc1+'/'+b[i].refdesc2+'/'+b[i].refdesc3+'">'+b[i].refcode+'</option>');		
				}
			
			}
		});
	}
	$("#btnadd").on("click",function(){
		if('<%=type%>'=="edit"){
			location.href="XBRL_REFCODE_MAPPING.jsp?type=add"
		}else{
		$("#addtype").show();
		$("#sub").text("");
		$("#repnum").empty();
		$("#btngotolist").hide();
		$("#btnSubmit").show();
		$("#repnum").append('<option value="">Select</option>');
		$("#sub").show();
	 	$("#repnum").attr("disabled",true); 
		$("#sub").text(" - Add");
		$("#typebtn").val("add");
		}
	});
	$("#entflg").on("change",function(){
		
		$('.form-control').attr("disabled", true);
		$("#entflg").attr("disabled", false);
		$(".acctd :input").val("");
		
		/* if($("#entflg").val()!=""){
			$("#repnum").empty();
			$("#repnum").append('<option value="">Select</option>');
			
		} */
		$(".acctd").hide();
		$(".head").show();
		$('.form-control').attr("disabled", false);
	if($("#entflg").val()=="customer"){
		$("#cust").show();
	}else if($("#entflg").val()=="account"){
		$("#accno").show();
		$("#accno2").attr("disabled","disabled");
		$("#schmtyp").show();
		$('#schmtyp :input').attr("disabled","disabled");
		$("#schmcode").show();
		$('#schmcode :input').attr("disabled","disabled");
		$("#glsubhead").show();
		$('#glsubhead :input').attr("disabled","disabled");
		$("#finrefcode").show();
		$('#finrefcode :input').attr("disabled","disabled");
	}else if($("#entflg").val()=="schemetype"){
		$("#schmtyp").show();
		$('#symtyp2').attr("disabled","disabled");
		$("#schmcode").show();
		$('#schmcode :input').attr("disabled","disabled");
		$("#glsubhead").show();
		$('#glsubhead :input').attr("disabled","disabled");
		$("#finrefcode").show();
		$('#finrefcode :input').attr("disabled","disabled");
		$("#symtyp1").empty();
		$("#symtyp1").append('<option value="">Select</option>');
		var type={
				"type":"schmtyp"
		};
		$.ajax({
			url:"entitydet",
			data:type,
			dataType:'json',
			type:'POST',
			async:false,
			success:function(res){
				
				
				var b=JSON.parse(res.entdet);
				console.log(b);
				for(var i=0;i<b.length;i++){
					
					$("#symtyp1").append('<option value='+b[i].schmtyp+'>'+b[i].schmtyp+'</option>');		
				}
			
			}
		});
		
	}else if($("#entflg").val()=="glsubhead"){
		
		$("#schmcode").show();
		$('#schmcode :input').attr("disabled","disabled");
		$("#glsubhead").show();
		$('#glhead2').attr("disabled","disabled");
		$("#finrefcode").show();
		$('#finrefcode :input').attr("disabled","disabled");
		$("#glhead1").empty();
		$("#glhead1").append('<option value="">Select</option>');
		var type={
				"type":"glhead",
		};
		$.ajax({
			url:"entitydet",
			data:type,
			dataType:'json',
			type:'POST',
			async:false,
			success:function(res){
				
				
				var b=JSON.parse(res.entdet);
				console.log(b);
				for(var i=0;i<b.length;i++){
					
					$("#glhead1").append('<option value='+b[i].glhead1+'>'+b[i].glhead1+'</option>');		
				}
			
			}
		});
	}else if($("#entflg").val()=="schemecode"){
		$("#schmcode").show();
		
		$("#finrefcode").show();
		$('#schmcode2').attr("disabled","disabled");
		$('#finrefcode :input').attr("disabled","disabled");
		
		$("#schmcode1").empty();
		$("#schmcode1").append('<option value="">Select</option>');
		var type={
				"type":"schcode"
		};
		$.ajax({
			url:"entitydet",
			data:type,
			dataType:'json',
			type:'POST',
			async:false,
			success:function(res){
				
				
				var b=JSON.parse(res.entdet);
				console.log(b);
				for(var i=0;i<b.length;i++){
					
					$("#schmcode1").append('<option value='+b[i].schmcode+'>'+b[i].schmcode+'</option>');		
				}
			
			}
		});
		
	}else if($("#entflg").val()=="finrefcode"){
		
		$("#finrefcode1").empty();
		$("#finrefcode1").append('<option value="">Select</option>');
		$("#finrefcode").show();
		var type={
				"type":"finrefcode"
		};
		$.ajax({
			url:"entitydet",
			data:type,
			dataType:'json',
			type:'POST',
			async:false,
			success:function(res){
				
				
				var b=JSON.parse(res.entdet);
				console.log(b);
				for(var i=0;i<b.length;i++){
					
					$("#finrefcode1").append('<option value='+b[i].finrefcode1+'>'+b[i].finrefcode1+'</option>');		
				}
			
			}
		});
		}
		if($("#entflg").val()==""){
			
			$(".acctd").show();
			$('.form-control').attr("disabled", true);
			$("#entflg").attr("disabled", false);
			$(".acctd :input").val("");
			$("#tb1 :input").val("");
		}
	});
	
		
	
	
	
	
	$("#repnum").on("change",function(){
		$("#replvl").empty();
		$("#refcode").empty();
		if($("#typebtn").val()=="list"){
			/* $("#entflg").val("schemetype");
			$("#symtyp1").attr("disabled",false); */
			var type={
					"type":"schmtyp"
			};
			$.ajax({
				url:"entitydet",
				data:type,
				dataType:'json',
				type:'POST',
				async:false,
				success:function(res){
					
					
					var b=JSON.parse(res.entdet);
					console.log(b);
					for(var i=0;i<b.length;i++){
						
						$("#symtyp1").append('<option value='+b[i].schmtyp+'>'+b[i].schmtyp+'</option>');		
					}
				
				}
			});
		}
		$("#replvl").attr("disabled",false);
		$("#refcode").append('<option value="">Select</option>');
		$("#descrip").text("");
		$("#replvl").append('<option value="">Select</option>');
		var type={
				"typ":"replvl" ,"repnum":$("#repnum").val()
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
			
			}
		});
	});
	$("#replvl").on("change",function(){
	
		$("#refcode").empty();
		$("#refcode").attr("disabled",false);
		if($("#addtype").val()=="newreport"){
			$("#entflg").attr("disabled",false);
		}
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
			url:"reportdet",
			data:type,
			dataType:'json',
			type:'POST',
			async:false,
			success:function(res){
				
				
				var b=JSON.parse(res.repnum);
				console.log(b);
				for(var i=0;i<b.length;i++){
					
					$("#refcode").append('<option value="'+b[i].refcode+'/'+b[i].repname+'/'+b[i].refdesc1+'/'+b[i].refdesc2+'/'+b[i].refdesc3+'">'+b[i].refcode+'</option>');		
				}
			
			}
		});
	});
	

	
		$("#btnSubmit").on("click",function(){
			
			if($("#entflg").val()=="" && !'<%=type%>'=="edit"){
				$("#entflg").focus();
				$("#entflgerr").show().fadeOut(2000);
			}else if($("#entflg").val()=="customer" && $("#cusid1").val()==""){
				$("#cusid1").focus();
				$("#cust1err").show().fadeOut(2000);
			}else if($("#entflg").val()=="account" && $("#accno1").val()==""){
				$("#accno1").focus();
				$("#acc1err").show().fadeOut(2000);
			}else if($("#entflg").val()=="schemetype" && $("#symtyp1").val()==""){
				$("#symtyp1").focus();
				$("#schmtyperr").show().fadeOut(2000);
			}else if($("#entflg").val()=="glsubhead" && $("#glhead1").val()==""){
				$("#glhead1").focus();
				$("#glhead1err").show().fadeOut(2000);
			}else if($("#entflg").val()=="schemecode" && $("#schmcode1").val()==""){
				$("#schmcode1").focus();
				$("#schmcode1err").show().fadeOut(2000);
			} else if($("#entflg").val()=="finrefcode" && $("#finrefcode1").val()==""){
				$("#finrefcode1").focus();
				$("#finref1err").show().fadeOut(2000);
			}else if($("#addtype").val()=="existingreport" && $("#repnum").val()==""){
				$("#repnum").focus();
				$("#repnum1err").show().fadeOut(2000);
				
			}else if($("#replvl").val()==""  && !'<%=type%>'=="edit"){
				$("#replvl").focus();
				$("#replvl1err").show().fadeOut(2000);
				
			}else if($("#refcode").val()==""  && !'<%=type%>'=="edit"){
				$("#refcode").focus();
				$("#refcode1err").show().fadeOut(2000);
				
			}else{
			var det={
				"entflg":$("#entflg").val(),"cust1":$("#cusid1").val(),"cust2":$("#cusid2").val(),"acc1":$("#accno1").val(),"acc2":$("#accno2").val(),"glhead1":$("#glhead1").val(),"glhead2":$("#glhead2").val(),"schmcode":$("#schmcode1").val(),"finrefcode":$("#finrefcode1").val(),"schmtyp":$("#symtyp1").val()
			};
			$.ajax({
				url:"upcount",
				data:det,
				dataType:'json',
				type:'POST',
				async:false,
				success:function(res){
					
					if(res.count>0){
						 swal({
							 
							    text: " "+res.count+" rows will be Updated",
							    type: "info",
							    showCancelButton: true,
							    confirmButtonColor: '#337ab7',
							    confirmButtonText: 'Proceed',
							    cancelButtonText: "No"
							 }).then(
							       function () {  
							    	   if('<%=type%>'=="edit"){
							    		   repmapping.action="reportupdate.action?method=repcodeupdate"+"&type=edit";
											repmapping.submit();
							    	   }else{
							    		   repmapping.action="reportupdate.action?method=repcodeupdate"+"&type=norm";
											repmapping.submit(); 
							    	   }
							    	   
							    	   
							       },
							       function () { return false; });
					}else{
						alert("No Records Found");
					}
				}
			});
			}
			
		});
		/* Validations */
		$("#symtyp1").on("change",function(){
			if($("#entflg").val()=="account"){
				$("#glhead1").empty();
				$("#glhead1").append('<option value="">Select</option>');
				fnschmtyp("glheadcode1");
				$("#symtyp2").val($("#symtyp1").val());
				$("#glhead1").attr("disabled",false);
				
			}else{
			if($("#symtyp1").val()!=""){
			$("#symtyp2").val($("#symtyp1").val());
			$("#glhead1").attr("disabled",false);
			
			$("#glhead1").empty();
			$("#glhead1").append('<option value="">Select</option>');
			var type={
					"type":"glhead1","schmtyp":$("#symtyp1").val()
			};
			$.ajax({
				url:"entitydet",
				data:type,
				dataType:'json',
				type:'POST',
				async:false,
				success:function(res){
					
					
					var b=JSON.parse(res.entdet);
					console.log(b);
					for(var i=0;i<b.length;i++){
						
						$("#glhead1").append('<option value='+b[i].glhead1+'>'+b[i].glhead1+'</option>');		
					}
				
				}
			});
			}}
		});
		
		$("#glhead1").on("change",function(){
			if($("#entflg").val()=="account"){
				$("#glhead2").attr("disabled",false);
				$("#schmcode1").attr("disabled",false);
				$("#glhead2").empty();
				$("#glhead2").append('<option value="">Select</option>');
				$("#schmcode1").empty();
				$("#schmcode1").append('<option value="">Select</option>');
				fnschmtyp("glheadcode2");
				
				fnschmtyp("schemecode1");
				
			}else{
			if($("#glhead1").val()!=""){
				$("#glhead2").empty();
				$("#glhead2").append('<option value="">Select</option>');
				if($("#entflg").val()=="glsubhead"){
					$("#glhead2").attr("disabled",false);
					$("#schmcode1").attr("disabled",false);
					var type={
							"type":"glhead3","glhead1":$("#glhead1").val()
					};
					$.ajax({
						url:"entitydet",
						data:type,
						dataType:'json',
						type:'POST',
						async:false,
						success:function(res){
							
							
							var b=JSON.parse(res.entdet);
							console.log(b);
							for(var i=0;i<b.length;i++){
								
								$("#glhead2").append('<option value='+b[i].glhead2+'>'+b[i].glhead2+'</option>');		
							}
						
						}
					});
					
					var type={
							"type":"schcode3","glhead1":$("#glhead1").val()
					};
					$.ajax({
						url:"entitydet",
						data:type,
						dataType:'json',
						type:'POST',
						async:false,
						success:function(res){
							
							$("#schmcode1").empty();
							$("#schmcode1").append('<option value="">Select</option>');
							var b=JSON.parse(res.entdet);
							console.log(b);
							for(var i=0;i<b.length;i++){
								
								$("#schmcode1").append('<option value='+b[i].schmcode+'>'+b[i].schmcode+'</option>');		
							}
						
						}
					});
				}else{
				$("#glhead2").attr("disabled",false);
				$("#schmcode1").attr("disabled",false);
				var type={
						"type":"glhead2","schmtyp":$("#symtyp1").val(),"glhead1":$("#glhead1").val()
				};
				$.ajax({
					url:"entitydet",
					data:type,
					dataType:'json',
					type:'POST',
					async:false,
					success:function(res){
						$("#glhead2").empty();
						$("#glhead2").append('<option value="">Select</option>');
						
						var b=JSON.parse(res.entdet);
						console.log(b);
						for(var i=0;i<b.length;i++){
							
							$("#glhead2").append('<option value='+b[i].glhead2+'>'+b[i].glhead2+'</option>');		
						}
					
					}
				});
				
				var type={
						"type":"schcode1","schmtyp":$("#symtyp1").val(),"glhead1":$("#glhead1").val()
				};
				$.ajax({
					url:"entitydet",
					data:type,
					dataType:'json',
					type:'POST',
					async:false,
					success:function(res){
						$("#schmcode1").empty();
						$("#schmcode1").append('<option value="">Select</option>');
						
						var b=JSON.parse(res.entdet);
						console.log(b);
						for(var i=0;i<b.length;i++){
							
							$("#schmcode1").append('<option value='+b[i].schmcode+'>'+b[i].schmcode+'</option>');		
						}
					
					}
				});
			}}}
			
		});
		$("#btnHome").on("click",function(){
			location.href="../XBRLHomePage.jsp";
		});
		$("#btnBack").on("click",function(){
			location.href="../REFCODE_MAPPING/XBRL_REFCODE_MAPPING.jsp";
		});
		$("#glhead2").on("change",function(){
			if($("#entflg").val()=="account"){
				$("#schmcode1").empty();
				$("#schmcode1").append('<option value="">Select</option>');
				fnschmtyp("schemecode2");
				
				
			}else if($("#entflg").val()=="glsubhead"){
				$("#schmcode1").empty();
				$("#schmcode1").append('<option value="">Select</option>');
				fnschmtyp("schemecode3");
			}	else{
			
			if($("#glhead2").val()!=""){
				$("#schmcode1").empty();
				$("#schmcode1").append('<option value="">Select</option>');
				var type={
						"type":"schcode2","schmtyp":$("#symtyp1").val(),"glhead1":$("#glhead1").val(),"glhead2":$("#glhead2").val()
				};
				$.ajax({
					url:"entitydet",
					data:type,
					dataType:'json',
					type:'POST',
					async:false,
					success:function(res){
						
						
						var b=JSON.parse(res.entdet);
						console.log(b);
						for(var i=0;i<b.length;i++){
							
							$("#schmcode1").append('<option value='+b[i].schmcode+'>'+b[i].schmcode+'</option>');		
						}
					
					}
				});
			}
			}
		});
		
		$("#schmcode1").on("change",function(){
	if($("#entflg").val()=="account"){
		$("#schmcode2").val($("#schmcode1").val());
		$("#finrefcode1").attr("disabled",false);
		$("#finrefcode1").empty();
		$("#finrefcode1").append('<option value="">Select</option>');
				fnschmtyp("finaclefefcode");
			}else{
			if($("#schmcode1").val()!=""){
			$("#schmcode2").val($("#schmcode1").val());
			$("#finrefcode1").attr("disabled",false);
			if($("#entflg").val()=="schemecode"){
				var type={
						"type":"finrefcode","schcode":$("#schmcode1").val()
				};
				$.ajax({
					url:"entitydet",
					data:type,
					dataType:'json',
					type:'POST',
					async:false,
					success:function(res){
						$("#finrefcode1").empty();
						$("#finrefcode1").append('<option value="">Select</option>');
						
						var b=JSON.parse(res.entdet);
						console.log(b);
						for(var i=0;i<b.length;i++){
							
							$("#finrefcode1").append('<option value='+b[i].finrefcode1+'>'+b[i].finrefcode1+'</option>');		
						}
					
					}
				});
			}else{
			var type={
					"type":"finrefcode1","schmtyp":$("#symtyp1").val(),"glhead1":$("#glhead1").val(),"glhead2":$("#glhead2").val(),"schcode":$("#schmcode1").val()
			};
			$.ajax({
				url:"entitydet",
				data:type,
				dataType:'json',
				type:'POST',
				async:false,
				success:function(res){
					
					$("#finrefcode1").empty();
					$("#finrefcode1").append('<option value="">Select</option>');
					var b=JSON.parse(res.entdet);
					console.log(b);
					for(var i=0;i<b.length;i++){
						
						$("#finrefcode1").append('<option value='+b[i].finrefcode1+'>'+b[i].finrefcode1+'</option>');		
					}
				
				}
			});
			}
			}
			}
		});
		$("#finrefcode1").on("change",function(){
			$("#finrefcode2").val($("#finrefcode1").val());
		});
		$("#accno1").keyup(function(){
			cnt=1;
		});
		$("#accno2").keyup(function(){
			cnt1=1;
		});
		var cnt=1;
		var cnt1=1;
		$("#accno1").blur(function(){
			/* && $("#accno1").val().length>6  */
			if(cnt==1 && !$("#accno1").val()==""){
				var acct={
					"acct":$("#accno1").val(),"acctyp":"acctyp1"
				};
				$.ajax({
					url:"actvali",
					data:acct,
					dataType:'json',
					type:'POST',
					async:false,
					success:function(res){
						
						console.log(res.count);
						 if(res.count>0 ){
							
							cnt++;
							$("#accno2").attr("disabled",false);
							$("#symtyp1").attr("disabled",false);
							fnschmtyp("schemetype");
						}else{
							alert("InValid Account");
							$("#accno1").val("");
							$("#accno1").focus();
							cnt++;
							return true;
						}
						
						
					
					}
				});
			}
		});
	$("#accno2").blur(function(){
			
			if(!$("#accno2").val()=="" && cnt1==1){
				var acct={
					"acct":$("#accno2").val(),"acctyp":"acctyp2","acct1":$("#accno1").val()
				};
				$.ajax({
					url:"actvali",
					data:acct,
					dataType:'json',
					type:'POST',
					async:false,
					success:function(res){
						
						console.log(res.count);
						 if(res.count>0 ){
							
							cnt1++;
						}else{
							alert("InValid Account");
							$("#accno2").val("");
							$("#accno2").focus();
							cnt1++;
							return true;
						}
						
						
					
					}
				});
			}
		});
	
	
	function fnschmtyp(typ){
		
		var type={
				"type":typ,"acc1":$("#accno1").val(),"acc2":$("#accno2").val(),"glhead1":$("#glhead1").val(),"glhead2":$("#glhead2").val(),"schmcode":$("#schmcode1").val(),"finrefcode":$("#finrefcode1").val(),"schmtyp":$("#symtyp1").val()
		};
		$.ajax({
			url:"entitydet",
			data:type,
			dataType:'json',
			type:'POST',
			async:false,
			success:function(res){
				
				
				var b=JSON.parse(res.entdet);
				console.log(b);
				
				if(typ=="schemetype"){
					for(var i=0;i<b.length;i++){
						
						$("#symtyp1").append('<option value='+b[i].schmtyp+'>'+b[i].schmtyp+'</option>');		
					}
				}else if(typ=="glheadcode1"){
                for(var i=0;i<b.length;i++){
						
						$("#glhead1").append('<option value='+b[i].glhead1+'>'+b[i].glhead1+'</option>');		
					}
				}else if(typ=="glheadcode2"){
                for(var i=0;i<b.length;i++){
						
						$("#glhead2").append('<option value='+b[i].glhead2+'>'+b[i].glhead2+'</option>');		
					}
				}else if(typ=="schemecode1"){
					for(var i=0;i<b.length;i++){
				
					
					$("#schmcode1").append('<option value='+b[i].schmcode+'>'+b[i].schmcode+'</option>');		
				}
					}else if(typ=="schemecode2"){
						for(var i=0;i<b.length;i++){
							
							
							$("#schmcode1").append('<option value='+b[i].schmcode+'>'+b[i].schmcode+'</option>');		
						}
			}else if(typ=="finaclefefcode"){
				for(var i=0;i<b.length;i++){
					
					$("#finrefcode1").append('<option value='+b[i].finrefcode1+'>'+b[i].finrefcode1+'</option>');		
				}
			}else if(typ=="schemecode3"){
				for(var i=0;i<b.length;i++){
					
					
					$("#schmcode1").append('<option value='+b[i].schmcode+'>'+b[i].schmcode+'</option>');		
				}
	}
				
				
				
			}
		});
	}
	$("#cusid1").keyup(function(){
		cust1=1;
	});
	$("#cusid2").keyup(function(){
		cust2=1;
	});
	var cust1=1;
	var cust2=1;
	$("#cusid1").blur(function(){
		if(!$("#cusid1").val()=="" && cust1==1){
			var cust={
					"cust":$("#cusid1").val(),"custyp":"cust1"
			};
			$.ajax({
				url:"custvali",
				data:cust,
				dataType:'json',
				type:'POST',
				async:false,
				success:function(res){
					
					console.log(res.count);
					 if(res.count>0 ){
					
						cust1++;
					}else{
						alert("Invalid Customer");
						$("#cusid1").val("");
						$("#cusid1").focus();
						cust1++;
						return true;
					}
					
					
				
				}
			});
		}
	});
	
	$("#cusid2").blur(function(){
		if(!$("#cusid2").val()=="" && cust2==1){
			var cust={
					"cust":$("#cusid1").val(),"custyp":"cust2","cust1":$("#cusid2").val()
			};
			$.ajax({
				url:"custvali",
				data:cust,
				dataType:'json',
				type:'POST',
				async:false,
				success:function(res){
					
					console.log(res.count);
					 if(res.count>0 ){
				
						cust2++;
					}else{
						alert("Invalid Customer");
						$("#cusid2").val("");
						$("#cusid2").focus();
						cust2++;
						return true;
					}
					
					
				
				}
			});
		}
	});
	
	
	$("#refcode").on("change",function(){
		if(!$("#refcode").val()=="" && $("#typebtn").val()=="list"){
		$("#descrip").text($("#refcode").val().split("/")[1]);
		
		
		}else if(!$("#refcode").val()=="" && $("#typebtn").val()=="add"){
			$("#descrip").text($("#refcode").val().split("/")[2]);
			/* $("#entflg").attr("disabled",false); */
		
		}	else{
		
			$("#descrip").text("");
		}
	});
	
	$("#btngo").on("click",function(){
	
		
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
	
	$("#addtype").on("change",function(){
		if($("#addtype").val()=="newreport"){
			$('.form-control').val("");
			$("#accdetails").show();
			$("#addtype").val("newreport");
			$('.form-control').attr("disabled", true);
			$("#addtype").attr("disabled",false);
			$("#descrip").text("");
			$("#repnum1").attr("disabled",false);
			$(".container1").modal('toggle');
			/* $("#repnum").empty(); */
			$("#repnum1").empty();
			$("#repnum1").append('<option value="">Select</option>');
			 $("#repnum").hide();
			$("#repnum2").show();
			 var type={
					"typ":"repnumnew"
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
						
						$("#repnum1").append('<option value='+b[i].repnum+'>'+b[i].repnum+'</option>');		
					}
				
				}
			}); 
			
			
		}else if($("#addtype").val()=="existingreport"){
			$("#accdetails").hide();
			$("#repnum").attr("disabled",false);
			 $("#repnum").show();
				$("#repnum2").hide();
				$("#repnum").empty();
				$("#btnSubmit").hide();
				$("#btngotolist").show();
				$("#repnum").append('<option value="">Select</option>');
			var type={
					"typ":"repnum"
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
						
						$("#repnum").append('<option value='+b[i].repnum+'>'+b[i].repnum+'</option>');		
					}
				
				}
			});
			
		}
	});
	
	
	$("#btnlist").on("click",function(){
		$("#accdetails").hide();
		if('<%=type%>'=="edit"){
		location.href="XBRL_REFCODE_MAPPING.jsp?type=fromlist";
		
		}else{
		$("#repnum").empty();
		$("#sub").text("");
		$("#refcode").empty();
		$("#descrip").text("");
		$("#addtype").hide();
		$("#entflg,.form-control").val("");
		$("#entflg,.acctd").attr("disabled",true);
		$(".acctd").show();
		$("#refcode").append('<option value="">Select</option>');
		$("#replvl").empty();
		$("#replvl").append('<option value="">Select</option>');
		$("#sub").show();
		$("#sub").text(" - Inquire");
		$("#typebtn").val("list");
		$("#btngotolist").show();
		$("#btnSubmit").hide();
		/* $("#btnadd").attr("disabled",true); */
		
		$("#repnum").append('<option value="">Select</option>');
		$("#repnum").attr("disabled",false);
		 var type={
					"typ":"repnum"
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
						
						$("#repnum").append('<option value='+b[i].repnum+'>'+b[i].repnum+'</option>');		
					}
				
				}
			}); 
		}
	});
	
	
	$("#btngotolist").on("click",function(){
		
		if($("#repnum").val()=="" ){
			$("#repnum").focus();
			$("#repnum1err").show().fadeOut();
		}else if($("#replvl").val()=="" ){
			$("#replvl").focus();
			$("#replvl1err").show().fadeOut();
		}else if($("#typebtn").val()=="add"){
		var acclist=[];
		
	/* 	acclist[0]=$("#accno1").val();
		acclist[1]=$("#accno2").val(); */
		acclist[0]=$("#symtyp1").val();
		acclist[1]=$("#glhead1").val();
		acclist[2]=$("#glhead2").val();
		acclist[3]=$("#schmcode1").val();
		acclist[4]=$("#finrefcode1").val();
		acclist[5]="end";
		
		/* sessionStorage.setItem('acclist', acclist); */
		location.href="XBRL_REP_CODMAPPINGLIST.jsp?repnum="+$("#repnum").val()+"&replvl="+$("#replvl").val()+"&refcode="+$("#refcode").val()+"&type=listmapadd"+"&acclist="+acclist+"&finrecode="+$("#finrefcode1").val();
		}else {
			var acclist=[];
			
			/* 	acclist[0]=$("#accno1").val();
				acclist[1]=$("#accno2").val(); */
				acclist[0]=$("#symtyp1").val();
				acclist[1]=$("#glhead1").val();
				acclist[2]=$("#glhead2").val();
				acclist[3]=$("#schmcode1").val();
				acclist[4]=$("#finrefcode1").val();
				acclist[5]="end";
				
				/* sessionStorage.setItem('acclist', acclist); */
				location.href="XBRL_REP_CODMAPPINGLIST.jsp?repnum="+$("#repnum").val()+"&replvl="+$("#replvl").val()+"&refcode="+$("#refcode").val()+"&type=listmap"+"&acclist="+acclist+"&finrecode="+$("#finrefcode1").val();
				}
		});
});
		</script>
		<script>
function myFun() {
  return "Data may be lost";
}
</script>
		
<body onbeforeunload="return myFun()" >
<form class="form-horizontal" method="post" name="repmapping"
		enctype="multipart/form-data">
<div class="panel-heading text-center tl" 
			style="width: 86%; margin-left: 71px; margin-right: 0px; margin-top: 36px; margin-bottom: 20px;    height: 27px; background-color: #bbc3cb;">
			<input type="hidden" id="typebtn">
			
			
			<font size="2"><b>Report Reference Code Mapping <b id="sub"
					Style="display: none"></b></b></font>
			
			
<BUTTON type="button" class="btn btn-xs btn-primary" id="btnlist" style="float:right">List</BUTTON>
			<select id="addtype" name="rmb.addtype" class="form-control" style="float:right;   display:none;  width: 95px;   margin-right: 15px;"><option value="">Select</option>
			<option value="newreport">Assign to New Report</option>
			<option value="existingreport">Assign to Existing Report</option>
			
			</select><BUTTON type="button" class="btn btn-xs btn-primary" id="btnadd" style="float:right;    margin-right: 15px;">Add</BUTTON>
		</div>
<div class="container-fluid gmd-1 hover " style="padding-top: 23px; width: 85%;margin-left: 119px;">

	<div class="form-group "><input type="hidden" id="rowno">
	
	<fieldset class="scheduler-border borfs"><legend class="scheduler-border">Report Code Details </legend>
 <table border="1" style="width: 100%;border:none;" id="tb1" class="" >
 
 <tbody class="databody">
      <tr style="height: 44px;"><td> <font size="1"><b>Report Number</b></font>  </td><td><select id="repnum" style="width:131px" name="rmb.repnum" class="form-control"  >
                                       <option value="">Select</option>

									

									</select> <input type="text" id="repnum2" name="rmb.repnum2" class="form-control" style="width:131px;display:none" ><!-- <button class="btn btn-xs btn-primary">Go</button> --><span style="color: red; font-size: 10px; display: none;" id="repnum1err" class="error">Select Report Number</span></td>
									
									<td> <font size="1"><b>Report Level</b></font>   </td><td><select id="replvl" style="width:131px" name="rmb.replvl" class="form-control"  >
                                       <option value="">Select</option>

									

									</select><input type="text" id="replvl2" name="rmb.replvl2" class="form-control" style="width:131px;display:none" readonly><span style="color: red; font-size: 10px; display: none;" id="replvl1err" class="error">Select Report Level</span> </td>
						   </tr>
						   <tr style=""><td> <font size="1"><b>Reference Code</b></font>   </td><td><select id="refcode" style="width:131px" name="rmb.refcode" class="form-control"  >
                                       <option value="">Select</option>

									

									</select><input type="text" id="refcode2" name="rmb.refcode2" class="form-control" style="width:131px;display:none" readonly><span style="color: red; font-size: 10px; display: none;" id="refcode1err" class="error">Select Reference Code</span></td><td><font size="1"><b>Reference Code Desc</b></font>   </td><td><font id="descrip" style="color:#337ab7" size="1"></font>
                               </td></tr>
  </tbody>
    </table> 
    
   
    
    </fieldset>
    <BR>
	<div id="accdetails"><fieldset class="scheduler-border borfs"><legend class="scheduler-border">Account Details </legend>
	<div class="form-group "><div class="row  col-sm-12">
							<label class="col-sm-3 control-label" style="margin-top: 4px;"><font
								size="1">Entity Flg</font></label>
							<div class="col-sm-3 ">
							<select id="entflg" name="rmb.entityflg" class="form-control"  >
                                       <option value="">Select</option>
<option value="customer">Customer</option>
<option value="account">Account</option>
<option value="schemetype">Scheme Type</option>	
<option value="glsubhead">Gl Subhead Code</option>		
<option value="schemecode">Scheme Code</option>		
				
<option value="finrefcode">Finacle Reference Code</option>
									</select>
<span style="color: red; font-size: 10px; display: none;" id="entflgerr" class="error">Select Entity flg</span>
							</div>
							
						

							</div>	</div>
							
							
							
							
							
							
							
							
						
	<div class="form-group "><div class="row  col-sm-12 head"><div class="col-sm-3"></div><div class="col-sm-3"><label style="color: #3C6EAC;
    font-size: 11px;">From</label></div><div class="row col-sm-2"></div><div class="col-sm-3" style="color: #3C6EAC;
    font-size: 11px;"><label>To</label></div>
	</div></div>
						<div id="cust"  class="acctd">
				<div class="form-group "><div class="row  col-sm-12">
							<label class="col-sm-3 control-label" style="margin-top: 4px;"><font
								size="1">Customer Id</font></label>
							<div class="col-sm-3 ">
							<input type="text" id="cusid1" name="rmb.custid1" class="form-control"  >
                                      
<span style="color: red; font-size: 10px; display: none;" id="cust1err" class="error">Enter Customer Id</span>
							</div>
						<div class="row col-sm-2"></div>
							
							<div class="col-sm-3 ">
							<input type="text" id="cusid2" name="rmb.custid2" class="form-control"  >
                                      

							</div>	</div></div></div>
							
							<div id="accno"  class="acctd">
									<div class="form-group "><div class="row  col-sm-12">
							<label class="col-sm-3 control-label" style="margin-top: 4px;"><font
								size="1">Account No</font></label>
							<div class="col-sm-3 ">
							<input type="text" id="accno1" name="rmb.actno1" class="form-control"  >
                                       
<span style="color: red; font-size: 10px; display: none;" id="acc1err" class="error">Enter Account Number</span>
							</div>
						<div class="row col-sm-2"></div>
							
							<div class="col-sm-3 ">
							<input type="text" id="accno2" name="rmb.actno2" class="form-control"  >
                                      
							</div>	</div></div></div>
							
							<div id="schmtyp"  class="acctd">
									<div class="form-group ">	<div class="row  col-sm-12">
							<label class="col-sm-3 control-label" style="margin-top: 4px;"><font
								size="1">Scheme Type</font></label>
							<div class="col-sm-3 ">
							<select id="symtyp1" name="rmb.schmtyp" class="form-control"  >
                                       <option value="">Select</option></select><input type="text" id="symtyp12" name="rmb.symtyp12" class="form-control" style="display:none" readonly>
                                       <span style="color: red; font-size: 10px; display: none;" id="schmtyperr" class="error">Select Scheme Type</span>
							</div>
						<div class="row col-sm-2"></div>
							
							<div class="col-sm-3 ">
							<input type="text" id="symtyp2" name="rmb.schmtyp2" class="form-control"  >
                                      
 
							</div>	</div></div></div>
							<div id="glsubhead"  class="acctd">
							<div class="form-group "><div class="row  col-sm-12">
							<label class="col-sm-3 control-label" style="margin-top: 4px;"><font
								size="1">GL Sub Head Code</font></label>
							<div class="col-sm-3 ">
							<select  id="glhead1" name="rmb.glhead1" class="form-control"  >
<option value="">Select</option>                                       
</select><input type="text" id="glhead112" name="rmb.glhead112" class="form-control" style="display:none" readonly>
						<span style="color: red; font-size: 10px; display: none;" id="glhead1err" class="error">Select GL Sub Head Code</span>
							</div>
						<div class="row col-sm-2"></div>
							
							<div class="col-sm-3 ">
							<select  id="glhead2" name="rmb.glhead2" class="form-control"  >
                                    <option value="">Select</option>  </select>
							</div>	</div></div></div>
							<div id="schmcode"  class="acctd">
						<div class="form-group "><div class="row  col-sm-12">
							<label class="col-sm-3 control-label" style="margin-top: 4px;"><font
								size="1">Scheme Code</font></label>
							<div class="col-sm-3 ">
							<select id="schmcode1" name="rmb.schmcode" class="form-control"  >
                                       <option value="">Select</option>

									

									</select><input type="text" id="schmcode12" name="rmb.schmcode12" class="form-control" style="display:none" readonly>
<span style="color: red; font-size: 10px; display: none;" id="schmcode1err" class="error">Select Scheme Code</span>
							</div>
						<div class="row col-sm-2"></div>
							
							<div class="col-sm-3 ">
							<input type="text" id="schmcode2" name="rmb.schmcod2" class="form-control"  >
                                      

							</div>	</div></div></div>
							
							<div id="finrefcode" class="acctd">
							<div class="form-group "><div class="row  col-sm-12">
							<label class="col-sm-3 control-label" style="margin-top: 4px;"><font
								size="1">Finacle Reference Code</font></label>
							<div class="col-sm-3 ">
							<select id="finrefcode1" name="rmb.finrefcode1" class="form-control"  ><option value="">Select</option>
                                       
</select>   <span style="color: red; font-size: 10px; display: none;" id="finref1err" class="error">Select Finacle Reference Code</span>
							</div>
						<div class="row col-sm-2"></div>
							
							<div class="col-sm-3 ">
							<input type="text" id="finrefcode2" name="rmb.finrefcode2" class="form-control"  >
                                    
							</div>	</div></div></div>
						</fieldset></div>
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
                    <button type="button" class="btn btn-xs btn-primary"  id="btnHome">Home</button>
                  	<button type="button" class="btn btn-xs btn-primary" style="display:none" id="btngotolist">Go</button>
					<button type="button" class="btn btn-xs btn-primary" id="btnSubmit">Update</button>
					<button type="button" class="btn btn-xs btn-primary"  id="btnBack">Back</button></div>
					<table Style="border:1px solid;    height: 63px; width: 75%; margin-left: 92px;">
<tr><td style="text-align: center;"><font size="1"><B>Entry User :</B></font></td><td style="width:112px"><input type="text" id="entryuser" name="ub.entryuser" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td><td style="text-align: center;"><font size="1"><B>Modify User :</B></font></td><td style="width: 112px;" ><input type="text" id="modifyuser" name="ub.modifyuser" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td><td style="text-align: center;"><font size="1"><B>Verify User :</B></font></td><td style="width: 112px;" ><input type="text" id="verifyuser" name="ub.verifyuser" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td></tr>
<tr><td style="text-align: center;"><font size="1"><B>Entry Time :</B></font></td><td style="width:112px"><input type="text" id="entrytime" name="ub.entrytime" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td><td style="text-align: center;"><font size="1"><B>Modify Time :</B></font></td><td style="width:112px"><input type="text" id="modifytime" name="ub.modifytime" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td><td style="text-align: center;"><font size="1"><B>Verify Time :</B></font></td><td style="width:112px"><input type="text" id="verifytime" name="ub.verifytime" style="width: 112px;border:none;outline:none;background-color:transparent;font-size:12px;" readonly></td></tr></table>

	</form>				
</body>
</html>