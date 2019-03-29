<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLFIM1000Bean,dao.XBRLFIM1000Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
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
// String ReporefSeq = request.getParameter("ReporefSeq");
String types=request.getParameter("types");

String instno = request.getParameter("instno");
String ReporefSeq = request.getParameter("ReporefSeq");
 
 XBRLFIM1000Dao dmd=new XBRLFIM1000Dao();
 
 DecimalFormat df = new DecimalFormat("##,#0.00");
	   
	
 	
    %>
    
   
  

    
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;url=../XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" /> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>XBRL REPORT</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="ib.viewport">
<!-- Bootstrap 3.3.6 -->
  
  <link rel="stylesheet" href="../../css/bootstrap.min.css"> <!-- style page -->
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

  	<link rel="stylesheet" href="../../CSS/bootstrap-datepicker.css" />

<title>XBRL REPORT</title>
</head>



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
    z-index:110;
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
    padding: 0px 1px;
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


.filterable .filters input[disabled] {
    background-color: transparent;
    border: none;
    cursor: auto;
    box-shadow: none;
    padding: 0;
    height: auto;
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


.databody td{
border:1px solid #ddd;
}


.
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


/* 
tr:hover td{
    background: #bebfb0 !important;
}

 */

</style>


<script>
$(document).ready(function(){
	$("#sumfrst").click(function(){
		
		 location.href = "XBRL_REP_FIM1000_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		 });	
	
	$("#summaryfirst").click(function(){
		
		 location.href = "XBRL_REP_FIM1000_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		 });	
	
	
	
	
	
	
});	

</script>




<script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});


</script>



<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
	 location.href = "XBRL_REP_FIM1000_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>';  
	});
		
	$("#addrowno").val("0");

	 
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');
	
	
		
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '#btnback').click(function() {
		 location.href="XBRL_CRT_FIM1000_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	$('#btnExcel').click(function() {
		//alert("srdgihsdukl");//return false;
		 fim1000Form.action = "FIM1000EXCELREPORT.action?method=FIM1000EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 fim1000Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 fim1000Form.action = "FIM1000EXCELSum.action?method=FIM1000EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 fim1000Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 fim1000Form.action = "FIM1000PDFREPORT.action?method=FIM1000PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 fim1000Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  fim1000Form.action = "XMLDOWNLOADf10.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 fim1000Form.submit(); 
	});
	var save=0;

$('#btnSave').on("click",function() {
	 /*  $("#divLoading").addClass('show'); */
	  var datasum={
			"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").text()
	};
	$.ajax({
		url:"saveSumf10",
		data:datasum,
		dataType:'json',
		type:'POST',
		async:true,
		success:function(res){
			alert("Saved Successfully");
			save++;
			if(save>0){
				$("#btnXML").show();
				$("#btnSave").hide();
			}else{
				$("#btnXML").hide();
				$("#btnSave").show();
			}
			/*  $("#divLoading").removeClass('show'); */
		}
	});  
	 
       
		 
	 
});
$("#btnfilter").on("click",function(){
	if($(".form-control2").prop("disabled")==true){
		$(".form-control2").prop("disabled",false);
	}else{
		$(".form-control2").val("");
		$(".form-control2").prop("disabled",true);
	}
	
});

	$("#addrow").on("click",function(){
		var rowno=$("#rowno").val();
		$("#addrowno").val("1"); 
		$("#tbcate").prepend("<tr><td id='insnam_row"+rowno+"'><input type='text' id='insnam_text"+rowno+"' style='width: 100px;'></td><td id='inscode_row"+rowno+"'><input type='text'  id='inscode_text"+rowno+"' style='width: 100px;'></td><td id='trannat_row"+rowno+"'><input type='text' id='trannat_text"+rowno+"'style='width: 100px;'></td><td id='trancur_row"+rowno+"'><input type='text' 	id='trancur_text"+rowno+"' style='width: 100px;'></td><td id='trantyp_row"+rowno+"'><input type='text' id='trantyp_text"+rowno+"' style='    width: 100px;'></td><td id='tranamt_row"+rowno+"' ><input type='text'  id='tranamt_text"+rowno+"'    style='width: 100px;'><td id='instdate_row"+rowno+"'><input type='text' id='instdate_text"+rowno+"'  style='width: 100px;'></td><td id='inendate_row"+rowno+"' ><input type='text'  id='inendate_text"+rowno+"' style='width: 100px;'></td><td id='inrate_row"+rowno+"' class='sumder alnum'><input type='text' id='inrate_text"+rowno+"' class='decimalPt roundUp' style='width: 100px;'></td><td id='rem_row"+rowno+"'><input type='text' 	id='rem_text"+rowno+"' style='width: 100px;'></td><td id='reportsd_row"+rowno+"'><input type='text' id='reportsd_text"+rowno+"' style='    width: 100px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");
		fnkeyup(rowno);

		 var rownum= parseInt($("#rowno").val());
		rownum++;
		$("#rowno").val(rownum);
		$('#decimalPt, .decimalPt').keypress(function(evt) {
			
			  evt = (evt) ? evt : window.event;
			  var charCode = (evt.which) ? evt.which : evt.keyCode;
			  if (charCode == 8 || charCode == 37) {
			    return true;
			  } else if (charCode == 46 && $(this).val().indexOf('.') != -1) {
			    return false;
			  } else if (charCode > 31 && charCode != 46 && (charCode < 48 || charCode > 57)) {
			    return false;
			  }
			  return true;
			});

			$('.roundUp').blur(function() {
				
			  var value = parseFloat($(this).val());
			  if (!isNaN(value).replace(/\,/g,'')) {

			    $(this).val(parseFloat(value).toFixed(2));
			  }
			});

		/*  $( "#trdate_text"+rowno ).datepicker({
		
    	
	   	  
		   dateFormat: 'dd-mm-yy',
			changeMonth: false,//this option for allowing user to select month
		  changeYear: false//this option for allowing user to select from year range
		  
	   }); */
		});


		
});	






</script>



<SCRIPT>
function fnload(z,d,e,b,c,a,f,g){
	//z --->typo(load or summary)
	//d -->date1
	//e -->date2
	//b -->refseqno
	//c -->instance no
	//a -->reptype
	//f -->types of details
	//g -->currency
	
	 if(z=="load"){
		//FOR DETAILS
		$(".det").addClass("clr");
		$("#tab1").show();
		$("#tab2").hide();
		$(".fim1000").hide();
		var refno=b;
		var srno=1;
		var cnt1=1;
		var ins=c;
		
		if(ins==""){
			
			ins=0;
			
		}else{
		
			ins=c;
		} 
		if(refno=="null" || refno==null || refno==""){
			
			refno=0;
		}
		

		 $(".repdisp").text(refno);
		 var srno=1;
		
		
		 $("#divLoading").addClass("show"); 
		 var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
			
			$.ajax({
				url : "fim1000details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				
					
					  $("#test tr").remove();
					 var cnt1=1;
					
					var b=JSON.parse(res.dtlFIM1000);
					 console.log(b);
					
					
			
						 	if(f=="onload"){
						 		$("#tab2").hide();
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 			  $("#test").append('<tr><td id="insnam_row'+cnt1+'">'+b[i].insnam+'</td><td  id="inscode_row'+cnt1+'" >'+b[i].inscode+'</td><td id="trannat_row'+cnt1+'" >'+b[i].trannat+'</td><td id="trancur_row'+cnt1+'" >'+b[i].trancur+'</td><td id="trantyp_row'+cnt1+'" >'+b[i].trantyp+'</td><td class="sumder" id="tranamt_row'+cnt1+'" >'+b[i].tranamt+'</td><td  id="instdate_row'+cnt1+'" >'+b[i].instdate+'</td><td  id="inendate_row'+cnt1+'" >'+b[i].inendate+'</td><td class="sumder"  id="inrate_row'+cnt1+'" >'+b[i].inrate+'</td><td id="rem_row'+cnt1+'" >'+b[i].rem+'</td><td id="reportsd_row'+cnt1+'" >'+b[i].reportsd+'</td> <td style="text-align:center;"><input type="button" id="edit_button'+srno+'" value="Edit" class="btn btn-xs btn-primary edit" style="width: 37px;text-align:center;" onclick=edit_row("'+srno+'")>  <input type="button" id="save_button'+srno+'" value="Save" class="btn btn-xs btn-primary save" style="width: 37px; display:none;text-align:center;" onclick=save_row("'+srno+'")></td><tr>');	
						 		  
						 		 
								
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 		$("#tab2").hide();
						 		$("#modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
							 		  $("#test").append('<tr><td id="insnam_row'+cnt1+'">'+b[i].insnam+'</td><td  id="inscode_row'+cnt1+'" >'+b[i].inscode+'</td><td id="trannat_row'+cnt1+'" >'+b[i].trannat+'</td><td id="trancur_row'+cnt1+'" >'+b[i].trancur+'</td><td id="trantyp_row'+cnt1+'" >'+b[i].trantyp+'</td><td class="sumder" id="tranamt_row'+cnt1+'" >'+b[i].tranamt+'</td><td  id="instdate_row'+cnt1+'" >'+b[i].instdate+'</td><td  id="inendate_row'+cnt1+'" >'+b[i].inendate+'</td><td class="sumder"  id="inrate_row'+cnt1+'" >'+b[i].inrate+'</td><td id="rem_row'+cnt1+'" >'+b[i].rem+'</td><td id="reportsd_row'+cnt1+'" >'+b[i].reportsd+'</td><tr>');	
							
								 srno++;
								
								
									}
						 		 $("#divLoading").removeClass('show');
						 	}
							
							
						 $("#divLoading").removeClass('show'); 
						$('.alnum').mask("#,##0.00", {reverse: true}); 
					
						}
						

						
				
			});   
	 }else{
		//For summary
		$(".summ").addClass("clr");
		$("#tab1").hide();
		
		$("#tb1").show();
		$("#tb2").hide();
			var refno=b;
			var ins=c;
				if(ins=="" || ins=="null" || ins==null ){
					ins=0;
				}else{
					ins=c;
				} 
				if(refno=="null" || refno==null || refno==""){
					refno=0;
				}
				
		

				 $(".repdisp").text(refno);
				
				
				 
					
						$("#sec1 tr").children().detach().remove();
						
						 var pymd = {
									"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
								}; 
							
						$.ajax({
							url : "FIM1000SUM1",
							data : pymd,
							dataType : 'json',
							type : 'POST',
							async : true,
							success : function(res) {	
							
								
								  $("#sec1 tr").remove();
								 
								
								var b=JSON.parse(res.sum1FIM1000);
								 console.log(b);
								
                                 
									 
									 		for(var i=0;i<b.length;i++){
									 			
									 		  $("#sec1").append("<tr><td id='inssrno"+srno+"'>"+b[i].inssrno+"</td><td id='namins"+srno+"'>"+b[i].namins+"</td><td><input type=radio style=width: 15px; onclick=fnloads(0) id='edit"+srno+"'></td></tr>");  
									 		   
									 		 
											
											 srno++;
											 
											
												}
								
									}
									

						});   	
						
						
							 var pymd = {
										"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
								}; 
							
							$.ajax({
							     url : "FIM1000SUM",
							     data : pymd  ,
									dataType : 'json', 
									type : 'POST',
									async : true,
									 success : function(res) {
										
										 $("#sumtest tr").remove();
								
								console.log(res.summaryFIM1000);
							
								var b=JSON.parse(res.summaryFIM1000);
								

									 
									 		for(var i=0;i<b.length;i++){
									 		
										 		  $("#sumtest").append('<tr><td id="dynamicdomain'+cnt1+'">'+b[i].dynamicdomain+'</td><td  id="instnstno'+cnt1+'" >'+b[i].instnstno+'</td><td id="transtno'+cnt1+'" >'+b[i].transtno+'</td><td id="instname'+cnt1+'" >'+b[i].instname+'</td><td id="nametran'+cnt1+'" >'+b[i].nametran+'</td><td class="sumder" id="curr'+cnt1+'" >'+b[i].curr+'</td><td class="sumder"  id="cmamt'+cnt1+'" >'+b[i].cmamt+'</td><td class="sumder"  id="cmrpa'+cnt1+'" >'+b[i].cmrpa+'</td><td class="sumder"  id="msnamt'+cnt1+'" >'+b[i].msnamt+'</td><td id="msnstartdate'+cnt1+'" >'+b[i].msnstartdate+'</td><td id="msnenddate'+cnt1+'" >'+b[i].msnenddate+'</td><td class="sumder"  id="msnrpa'+cnt1+'" >'+b[i].msnrpa+'</td><td class="sumder"  id="tmamt'+cnt1+'" >'+b[i].tmamt+'</td><td id="tmstartdate'+cnt1+'" >'+b[i].tmstartdate+'</td><td id="tmenddate'+cnt1+'" >'+b[i].tmenddate+'</td><td class="sumder" id="tmrpa'+cnt1+'" >'+b[i].tmrpa+'</td><td id="remark+'+cnt1+'" >'+b[i].remark+'</td><td style="text-align: center;"><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td><tr>');	
									 		  
									 		 
											
											 srno++;
											 
											
												}
							
									}
									

						});   
						
				}
			 
 }
function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_FIM1000_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';

	


} 

</SCRIPT>


<%-- 
<script>

function fnload(z,d,e,b,c,a,f,g){

	//z --->typo(load or summary)
	//d -->date1
	//e -->date2
	//b -->refseqno
	//c -->instance no
	//a -->reptype
	//f -->types of details
	//g -->currency
	 if(z=="load"){
		
		//FOR DETAILS
		$(".det").addClass("clr");
			$(".tab-pane,#tb2").hide();
			$(".active,#tbcate").show(); 
		$("#tab1").show();
		$("#tab2").hide();
			var refno=b;
			
			var ins=c;
			
			if(ins==""){
				
				ins=0;
				
			}else{
			
				ins=c;
			} 
			if(refno=="null" || refno==null || refno==""){
				
				refno=0;
			}
			
			 $(".repdisp").text(refno);
			 var srno=1;
			 
			 $("#divLoading").addClass("show");
			 /*   $(".loader").fadeOut("slow"); */
				 var pymd = {
						"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
					}; 
					
				$.ajax({
					url : "fim1000details",
					data : pymd,
					dataType : 'json',
					type : 'POST',
					async : true,
					success : function(res) {	
					
						
						  $("#test tr").remove();
						 var cnt1=1;
						
						var b=JSON.parse(res.dtlFIM1000);
						 console.log(b);
						
						
						
					
							if(f=="onload"){
						 		
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		 
						                     
  $("#test").append('<tr><td id="insnam_row'+cnt1+'">'+b[i].insnam+'</td><td  id="inscode_row'+cnt1+'" >'+b[i].inscode+'</td><td id="trannat_row'+cnt1+'" >'+b[i].trannat+'</td><td id="trancur_row'+cnt1+'" >'+b[i].trancur+'</td><td id="trantyp_row'+cnt1+'" >'+b[i].trantyp+'</td><td class="sumder" id="tranamt_row'+cnt1+'" >'+b[i].tranamt+'</td><td  id="instdate_row'+cnt1+'" >'+b[i].instdate+'</td><td  id="inendate_row'+cnt1+'" >'+b[i].inendate+'</td><td class="sumder"  id="inrate_row'+cnt1+'" >'+b[i].inrate+'</td><td id="rem_row'+cnt1+'" >'+b[i].rem+'</td><td id="reportsd_row'+cnt1+'" >'+b[i].reportsd+'</td> <td style="text-align:center;"><input type="radio" id="edit_button'+srno+'" value="Edit" class="btn btn-xs btn-primary edit" style="width: 37px;text-align:center;" onclick=edit_row("'+srno+'")>  <input type="button" id="save_button'+srno+'" value="Save" class="btn btn-xs btn-primary save" style="width: 37px; display:none;text-align:center;" onclick=save_row("'+srno+'")></td><tr>');	
        
						                  
						 		 
								
								 srno++;
								 cnt1++;
								 
								 
									} $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 		$("#tab2").hide();
						 		$("#modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
						 	
						 		  $("#test").append('<tr><td id="insnam_row'+cnt1+'">'+b[i].insnam+'</td><td  id="inscode_row'+cnt1+'" >'+b[i].inscode+'</td><td id="trannat_row'+cnt1+'" >'+b[i].trannat+'</td><td id="trancur_row'+cnt1+'" >'+b[i].trancur+'</td><td id="trantyp_row'+cnt1+'" >'+b[i].trantyp+'</td><td class="sumder" id="tranamt_row'+cnt1+'" >'+b[i].tranamt+'</td><td  id="instdate_row'+cnt1+'" >'+b[i].instdate+'</td><td  id="inendate_row'+cnt1+'" >'+b[i].inendate+'</td><td class="sumder"  id="inrate_row'+cnt1+'" >'+b[i].inrate+'</td><td id="rem_row'+cnt1+'" >'+b[i].rem+'</td><td id="reportsd_row'+cnt1+'" >'+b[i].reportsd+'</td><tr>');	
						 			 
								 srno++;
								 
								 cnt1++;
								 
									}
						 		 $("#divLoading").removeClass('show');
						 	}
								
								
							 $("#divLoading").removeClass('show'); 
							$('.alnum').mask("#,##0.00", {reverse: true}); 
						
							}
							

							
					
				});   
	 }else{
		 //For summary
		 $(".summ").addClass("clr");
		 $("#divLoading").addClass('show');
		 //active,tab-pane for whole div
		 //tbcate,tb2 for table
		 $(".active,#tbcate").hide(); //tab1 or for details
			$(".tab-pane,#tb2").show(); //tab2 or for summary
			$("#tab2").show();
			$("#tab1").hide();
		var refno=b;
		var ins=c;
			if(ins==""){
				ins=0;
			}else{
				ins=c;
			} 
			if(refno=="null" || refno==null || refno==""){
				refno=0;
			}
			
			  $("#divLoading").addClass("show"); 
			
			 $(".repdisp").text(refno);
			
				$("#sumtest tr").children().detach().remove();
			
				var rptdate1 = {
						  "dt1" : d,"dt2":e,"reportrefnos":refno,"curr":g
						}; 
				 
				 $.ajax({
				     url : "FIM1000SUM",
				     data : rptdate1  ,
						dataType : 'json', 
						type : 'POST',
						async : true,
						 success : function(res) {
							 //console.log(res.refnoAB);
					
					console.log(res.summaryFIM1000);
				
					var b=JSON.parse(res.summaryFIM1000);
					
					var k=1;
					var cnt1=1;
					
					
					for (var i = 0; i < b.length; i++) {
					
						
						
						
				 		  $("#sumtest").append('<tr><td id="dynamicdomain'+cnt1+'">'+b[i].dynamicdomain+'</td><td  id="instnstno'+cnt1+'" >'+b[i].instnstno+'</td><td id="transtno'+cnt1+'" >'+b[i].transtno+'</td><td id="instname'+cnt1+'" >'+b[i].instname+'</td><td id="nametran'+cnt1+'" >'+b[i].nametran+'</td><td class="sumder" id="curr'+cnt1+'" >'+b[i].curr+'</td><td class="sumder"  id="cmamt'+cnt1+'" >'+b[i].cmamt+'</td><td class="sumder"  id="cmrpa'+cnt1+'" >'+b[i].cmrpa+'</td><td class="sumder"  id="msnamt'+cnt1+'" >'+b[i].msnamt+'</td><td id="msnstartdate'+cnt1+'" >'+b[i].msnstartdate+'</td><td id="msnenddate'+cnt1+'" >'+b[i].msnenddate+'</td><td class="sumder"  id="msnrpa'+cnt1+'" >'+b[i].msnrpa+'</td><td class="sumder"  id="tmamt'+cnt1+'" >'+b[i].tmamt+'</td><td id="tmstartdate'+cnt1+'" >'+b[i].tmstartdate+'</td><td id="tmenddate'+cnt1+'" >'+b[i].tmenddate+'</td><td class="sumder" id="tmrpa'+cnt1+'" >'+b[i].tmrpa+'</td><td id="remark+'+cnt1+'" >'+b[i].remark+'</td><td style="text-align: center;"><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td><tr>');	

						
						cnt1++;
						
					} 
					
					  $("#divLoading").removeClass('show'); 
					 $('.alnum').mask("#,##0.00", {reverse: true});
					
						 }
						 });	
	 }
}
function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_FIM1000_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';

	


}
</script> --%>

<script>


function fnkeyup(a){
	$("#reportsd_text"+a).datepicker({
	dateFormat: "dd-mm-yy",
	        changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: "today"
	});
}
	
	
</script>


<script>





function edit_row(no)
{


	
	document.getElementById("edit_button"+no).style.display="none";
	  document.getElementById("save_button"+no).style.display="block";
	  
	 	


	  var tranamt	 =  document.getElementById("tranamt_row"+no);
	  var inrate	 =  document.getElementById("inrate_row"+no);
	 

	
	  
	  var	tranamt_data = tranamt.innerHTML;
	  var	inrate_data = inrate.innerHTML;
	 
	
	  
	 tranamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='tranamt_text"+no+"'  style='width: 83px'; value='"+tranamt_data+"'>";
	 inrate.innerHTML="<input type='text' class='decimalPt roundUp'  id='inrate_text"+no+"'  style='width: 83px'; value='"+inrate_data+"'>";
	
	  
	 
$('#decimalPt, .decimalPt').keypress(function(evt) {
	
evt = (evt) ? evt : window.event;
var charCode = (evt.which) ? evt.which : evt.keyCode;
if (charCode == 8 || charCode == 37) {
 return true;
} else if (charCode == 46 && $(this).val().indexOf('.') != -1) {
 return false;
} else if (charCode > 31 && charCode != 46 && (charCode < 48 || charCode > 57)) {
 return false;
}
return true;
});

$('.roundUp').blur(function() {
	
var value = parseFloat($(this).val());
if (!isNaN(value).replace(/\,/g,'')) {
 $(this).val(parseFloat(value).toFixed(2));
}
});

}



function save_row(no)
{
$(".add").attr("disabled",false);
document.getElementById("edit_button"+no).checked = false;


var tranamt_val=document.getElementById("tranamt_text"+no).value;

document.getElementById("tranamt_row"+no).innerHTML=tranamt_val;

var inrate_val=document.getElementById("inrate_text"+no).value;

document.getElementById("inrate_row"+no).innerHTML=inrate_val;




if($("#addrowno").val()=="1"){
	
	
	var  insnam_val=document.getElementById("insnam_text"+no).value;	 
	document.getElementById("insnam_row"+no).innerHTML=insnam_val;



	var inscode_val=document.getElementById("inscode_text"+no).value;
	document.getElementById("inscode_row"+no).innerHTML=inscode_val;


	var trannat_val=document.getElementById("trannat_text"+no).value;
	document.getElementById("trannat_row"+no).innerHTML=trannat_val;



	var trancur_val=document.getElementById("trancur_text"+no).value;
		document.getElementById("trancur_row"+no).innerHTML=trancur_val;
		
	
		
		
	var trantyp_val=document.getElementById("trantyp_text"+no).value;	
	document.getElementById("trantyp_row"+no).innerHTML=trantyp_val;



	var  instdate_val=document.getElementById("instdate_text"+no).value;	 
	document.getElementById("instdate_row"+no).innerHTML=instdate_val;

	
	var  inendate_val=document.getElementById("inendate_text"+no).value;	 
	document.getElementById("inendate_row"+no).innerHTML=inendate_val;


	var  rem_val=document.getElementById("rem_text"+no).value;	 
	document.getElementById("rem_row"+no).innerHTML=rem_val;

	

	var  reportsd_val=document.getElementById("reportsd_text"+no).value;	 
	document.getElementById("reportsd_row"+no).innerHTML=reportsd_val;
	

}

document.getElementById("edit_button"+no).style.display="block";
document.getElementById("save_button"+no).style.display="none";



var insnam=document.getElementById("insnam_row"+no).innerHTML;	 

var inscode=document.getElementById("inscode_row"+no).innerHTML;
var trannat=document.getElementById("trannat_row"+no).innerHTML;

var trancur=document.getElementById("trancur_row"+no).innerHTML;

var trantyp=document.getElementById("trantyp_row"+no).innerHTML;

var tranamt=document.getElementById("tranamt_row"+no).innerHTML;
var instdate=document.getElementById("instdate_row"+no).innerHTML;

var inendate=document.getElementById("inendate_row"+no).innerHTML;
var inrate=document.getElementById("inrate_row"+no).innerHTML;

var rem=document.getElementById("rem_row"+no).innerHTML;	 
 var reportsd =document.getElementById("reportsd_row"+no).innerHTML; 


$("#det1 td").attr("padding","8px");
var refeFIM1000=document.getElementById("refDisplay").innerHTML;
tranamt=tranamt.replace(/\,/g,'');
tranamt=Number(tranamt);

inrate=inrate.replace(/\,/g,'');
inrate=Number(inrate);


var rptdate1 = {
	     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeFIM1000,"insnam":insnam,"inscode":inscode,"trannat":trannat,"trancur":trancur,"trantyp":trantyp,"tranamt":tranamt,"instdate":instdate,"inendate":inendate,"inrate":inrate,"rem":rem,"reportsd":reportsd  
	}; 

$.ajax({
   url : "FIM1000",
   data : rptdate1  ,
		dataType : 'json', 
		type : 'POST',
		async : true,
		 success : function(res) {
			 console.log(res.refno);
			
			/*  $("#refDisplay").html(res.refno); */
			 $(".repdisp").html(res.refno);
			
			
			
		}
	});



}

</script> 






<script>
function myFunction(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("test");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==5||b==6 || b==7||b==8 ||b==10){
    	

		 if(td.innerHTML.replace(/,/g,"").substring(0,input.value.length)==input.value){
			 tr[i].style.display = "";
		}else {
	        tr[i].style.display = "none";
	      }
		 

   }
	else{
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

.clr{
color: #0c0b0b;
    background-color: #f5f5f5;
    border-color: #f5f5f5;
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



</style>
<script>
function functionli(a){
	$(".table").hide();
	$("#tb"+a).show();
if(a==1){
	
	$("#btnpre").prop("disabled",true);
	 $("#btnnext").prop("disabled",false);
	 $("#li1").addClass("active");
	 $("#li2").removeClass("active");
}else if(a==5){
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li2").addClass("active");
	 $("#li1").removeClass("active");
}
}
</script>
<body>


<div class="container">
 
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="fim1000Form"
		enctype="multipart/form-data">
             	<div class="tab-content" >
	 	<div class="active fim1000" id="tab2" style="width: 1506px;padding-top: 1px;margin-top: -17px;" >
	 	<div style=" margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;"><%=reptype %> - <b id="sub" style="display: none"></b></b><b>Statement of Restructured/Rescheduled Credit Facilities	<b id="sub"
					Style="display: none"></b></b></font>
			<br><br></div> 
			
		<ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">

					<li class=" pull-right list" onclick="functionli(2);"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" onclick="functionli(1);" ><a href="#tab1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>




				</ul>
            <table class="" style="width:1506px;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfrst">Summary </span></a><a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
 
              <table class="table" id="tb1" style="width:100%;display:none;margin-top:-20px;">											
			 
        <tr>
         
          <th   style="text-align:center">Institution Sr.No.</th>
          <th style="text-align:center">Name Of Institution</th>
         
          </tr>
           
         
          <tbody class="databody" id="sec1"></tbody>
          </table>
            
            <table class="table" id="tb2" style=" width: 100%;margin-top: -20px;" border="1">
            
             <thead>
					
					
					 <tr class="filters" >
					 <th rowspan="3" id="dyndomain"  style="text-align: center;width:131px;" >Dynamic Domian</th>
						<th rowspan="3" id="instsrno"   style="text-align: center;">Institution Sr.No.</th>
						<th rowspan="3" id="transactnsrno"  style="text-align: center;">Transaction Sr.No.</th>
						<th rowspan="2" id="namofinstn"  style="text-align: center;">Name of Institution</th>
						
						<th rowspan="2" id="natuoftranstn"  style="text-align: center;">Nature of Transaction </th>
						
						<th rowspan="2" id="curr"  style="text-align: center;">Currency</th>
						<th  colspan="2"id="callmoney"  style="text-align: center;">Call Money	</th>
						<th colspan="4" id="monatshortnotice"  style="text-align: center;">Money at Short Notice</th>
						<th colspan="4" id="termoney"  style="text-align: center;">Term Money</th>
						<th rowspan="2" id="remark"  style="text-align: center;" style="text-align: center;" >Remark</th>
						<th rowspan="3"  style="text-align: center;">Select</th>
					</tr>
					
					<tr>
				<th id="callamount"  style="text-align: center;">Amount </th>
				<th id="callrpa"  style="text-align: center;">Rate per annum (%)</th>
				<th id="masnamount"  style="text-align: center;">Amount </th>
				<th id="masnstartdate"  style="text-align: center;width:73px;">Start Date</th>
				<th id="masnenddate"  style="text-align: center;width:73px;">End Date</th>
				<th id="masnrpa"  style="text-align: center;">Rate per annum (%)</th>
				<th id="tmamount"  style="text-align: center;">Amount</th>
				<th id="tmstartdate"  style="text-align: center;width:73px;">Start Date</th>
				<th id="tmenddate"  style="text-align: center;width:73px;">End Date</th>
				<th id="tmrpa"  style="text-align: center;">Rate per annum (%)</th>
				
				 </tr>
					
					
				<tr>
				<th  style="text-align: center;" id="A">A</th>
				<th  style="text-align: center;" id="B">B</th>
				<th  style="text-align: center;" id="C">C</th>
				<th  style="text-align: center;" id="D">D</th>
				<th  style="text-align: center;" id="E">E</th>
				<th  style="text-align: center;"  id="F">F</th>
				<th   style="text-align: center;" id="G">G</th>
				<th   style="text-align: center;" id="H">H</th>
				<th   style="text-align: center;" id="I">I</th>
				<th   style="text-align: center;" id="J">J</th>
				<th   style="text-align: center;" id="K">K</th>
				<th   style="text-align: center;" id="L">L</th>
				<th  style="text-align: center;"  id="M">M</th>
				<th   style="text-align: center;" id="N">N</th>
				 </tr>
				 
				 
				 
				<thead>
					
					<tbody class="databody" id="sumtest">

              </tbody>
				</table>
				<div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
            <!--     <button type="button" class="btn btn-xs btn-primary" value="Excel" >Generate Excel</button> -->
                 <!-- <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnExcelSum">Gen Sum</button> -->
               <!--   <button type="button" class="btn btn-xs btn-primary" value="Pdf" id="btnPdf">Generate PDF</button> -->
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
                <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button>
            </div>
				
				
				
				<!-- <div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
                <button type="button" class="btn btn-xs btn-primary" id="btnExcel">Generate Excel</button>
                <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback"  >Back</button>
            </div>
  -->
				
   <!--   </div> -->
				
			
			
         
        <!-- </div> -->
   
				
			  </div>	
				
				<div class="tab-pane" id="tab1" style="width: 1343px;padding-top: 1px;margin-top: -17px;">
<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b> FIM1000-Statement of transactions with Parent / Head Office
 <b id="sub"
					Style="display: none"></b></b></font>
			<b style="font-size: 13px;">   <b id="sub" style="display: none"></b></b></div><br>
					
					 <div id="divLoading"> 
    </div>
  
    
     <table class="table" style="width: 1343px;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width: 325px;"></td><td style="background-color: #bbc3cb;text-align: right;padding-top: -13px;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="summaryfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a><a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></td></tr>
          		  </table>
       
          		  <div class="panel panel-primary filterable">
          		  
          		  
          		  <table class="table" id="tbcate" border="1" style="margin-top: -21px;width: 100%;">
            
             <thead>
					


					 
				
					 <tr class="filters" >
					 
					 
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" onkeyup="myFunction(this.id,0)" class="form-control2" id="applno" placeholder="Institute Name" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" id="applname" onkeyup="myFunction(this.id,1)" class="form-control2" placeholder="Institute Code" disabled></th>						
						<th style="width: 100px;text-align:center;"><input type="text"  style="width: 100px;text-align:center;" id="custid" onkeyup="myFunction(this.id,2)" class="form-control2" placeholder="Transaction Nature" disabled> </th>						
						<th  style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" id="schmcd" onkeyup="myFunction(this.id,3)" class="form-control2" placeholder="Tran Currency" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text"  style="width: 100px;text-align:center;" id="schmty" class="form-control2" onkeyup="myFunction(this.id,4)" placeholder="Transaction Type" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" id="acopendt"  onkeyup="myFunction(this.id,5)" class="form-control2" placeholder="Transaction Amount" disabled></th>						
						<th style="width: 100px;text-align:center;"><input type="text"  style="width: 100px;text-align:center;" class="form-control2" id="intrt" onkeyup="myFunction(this.id,6)" placeholder="Initial Start Date" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="acbalamt" onkeyup="myFunction(this.id,7)" placeholder="Initial End Date" disabled></th>
						<th style="width: 100px;text-align:center;" ><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="acrncycd" onkeyup="myFunction(this.id,8)" placeholder="Initial Rate" disabled></th>
						
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="rem" onkeyup="myFunction(this.id,9)" placeholder="Remarks" disabled></th>
						<th style="width: 100px;text-align:center;" ><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="repdate" onkeyup="myFunction(this.id,10)" placeholder="Report Date" disabled></th>
					
						<th style="width: 50px;text-align:center;" id="modify">Modify</th>
						
					 
					 
					</tr>
				 
					
				</thead>
					
					<tbody class="databody" id="test">

            
					
              </tbody>
				</table>
				

		</div>
					

			
			
            
            </div>
            
            

     
     </form>
    
    
</div>





</body>
</html>