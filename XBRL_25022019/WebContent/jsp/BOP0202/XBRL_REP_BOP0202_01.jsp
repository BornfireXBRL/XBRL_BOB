<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLBOP0202Bean,dao.XBRLBOP0202Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
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
 
 XBRLBOP0202Dao dmd=new XBRLBOP0202Dao();
 
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
		
		 location.href = "XBRL_REP_BOP0202_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		 });	
	
	$("#summaryfirst").click(function(){
		
		 location.href = "XBRL_REP_BOP0202_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
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
	 location.href = "XBRL_REP_BOP0202_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>';  
	});
		
	$("#addrowno").val("0");

	 
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');
	
	
		
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$('#btnback').click(function() {
		 location.href="XBRL_CRT_BOP0202.jsp?reptype="+'<%=request.getParameter("reptype")%>';

	});
	$('#btnExcel').click(function() {
		//alert("srdgihsdukl");//return false;
		 bop0202Form.action = "BOP0202EXCELREPORT.action?method=BOP0202EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 bop0202Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 bop0202Form.action = "bop0202EXCELSum.action?method=bop0202EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 fimm1000Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 bop0202Form.action = "bop0202PDFREPORT.action?method=bop0202PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 bop0202Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  bop0202Form.action = "XMLDOWNLOADb202.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 bop0202Form.submit(); 
	});
	var save=0;

$('#btnSave').on("click",function() {
	 /*  $("#divLoading").addClass('show'); */
	  var datasum={
			"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").text()
	};
	$.ajax({
		url:"saveSumb202",
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
		$("#test").prepend("<tr><td id='instname_row"+rowno+"'><input type='text' id='instname_text"+rowno+"' style='width: 100px;'></td><td id='unid_row"+rowno+"'><input type='text'  id='unid_text"+rowno+"' style='width: 100px;'></td><td id='cntry_row"+rowno+"'><input type='text' id='cntry_text"+rowno+"'style='width: 100px;'></td><td id='trantyp_row"+rowno+"'><input type='text' 	id='trantyp_text"+rowno+"' style='width: 100px;'></td><td class='sumder alnum' id='peropnpos_row"+rowno+"'><input type='text' class='decimalPt roundUp' id='peropnpos_text"+rowno+"' style='    width: 100px;'></td><td class='sumder alnum' id='perclspos_row"+rowno+"' ><input type='text' class='decimalPt roundUp'  id='perclspos_text"+rowno+"'    style='width: 100px;'><td id='opnposs_row"+rowno+"'><input type='text' id='opnposs_text"+rowno+"'  style='width: 100px;'></td><td id='addtns_row"+rowno+"' ><input type='text'  id='addtns_text"+rowno+"' style='width: 100px;'></td><td id='redctns_row"+rowno+"'><input type='text' id='redctns_text"+rowno+"' class='decimalPt roundUp' style='width: 100px;'></td><td id='othrchnges_row"+rowno+"'><input type='text' 	id='othrchnges_text"+rowno+"' style='width: 100px;'></td><td id='revchnge_row"+rowno+"'><input type='text' 	id='revchnge_text"+rowno+"' style='width: 100px;'></td><td id='clspos_row"+rowno+"'><input type='text' 	id='clspos_text"+rowno+"' style='width: 100px;'></td><td id='reportsd_row"+rowno+"'><input type='text' id='reportsd_text"+rowno+"' style='    width: 100px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");
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
		$(".bop0202").hide();
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
				url : "BOP0202details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				
					
					  $("#test tr").remove();
					 var cnt1=1;
					
					var b=JSON.parse(res.dtlBOP0202);
					 console.log(b);
					
					
			
						 	if(f=="onload"){
						 		$("#tab2").hide();
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 			  $("#test").append('<tr><td id="instname_row'+cnt1+'" >'+b[i].instname+'</td><td id="unid_row'+cnt1+'" >'+b[i].unid+'</td><td id="cntry_row'+cnt1+'" >'+b[i].cntry+'</td><td class="sumder" id="trantyp_row'+cnt1+'" >'+b[i].trantyp+'</td><td class="sumder"  id="peropnpos_row'+cnt1+'" >'+b[i].peropnpos+'</td><td class="sumder"  id="perclspos_row'+cnt1+'" >'+b[i].perclspos+'</td><td   id="opnposs_row'+cnt1+'" >'+b[i].opnposs+'</td><td id="addtns_row'+cnt1+'" >'+b[i].addtns+'</td><td id="redctns_row'+cnt1+'" >'+b[i].redctns+'</td><td  id="othrchnges_row'+cnt1+'" >'+b[i].othrchnges+'</td><td  id="revchnge_row'+cnt1+'" >'+b[i].revchnge+'</td><td id="clspos_row'+cnt1+'" >'+b[i].clspos+'</td><td id="reportsd_row'+cnt1+'" >'+b[i].reportsd+'</td> <td style="text-align:center;"><input type="radio" id="edit_button'+srno+'" value="Edit" class="btn btn-xs btn-primary edit" style="width: 37px;text-align:center;" onclick=edit_row("'+srno+'")>  <input type="button" id="save_button'+srno+'" value="Save" class="btn btn-xs btn-primary save" style="width: 37px; display:none;text-align:center;" onclick=save_row("'+srno+'")></td><tr>');	
						 		  
						 		 
								
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 		$("#tab2").hide();
						 		$("#modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
							 		  $("#test").append('<tr><td id="instname_row'+cnt1+'" >'+b[i].instname+'</td><td id="unid_row'+cnt1+'" >'+b[i].unid+'</td><td id="cntry_row'+cnt1+'" >'+b[i].cntry+'</td><td class="sumder" id="trantyp_row'+cnt1+'" >'+b[i].trantyp+'</td><td class="sumder"  id="peropnpos_row'+cnt1+'" >'+b[i].peropnpos+'</td><td class="sumder"  id="perclspos_row'+cnt1+'" >'+b[i].perclspos+'</td><td   id="opnposs_row'+cnt1+'" >'+b[i].opnposs+'</td><td id="addtns_row'+cnt1+'" >'+b[i].addtns+'</td><td id="redctns_row'+cnt1+'" >'+b[i].redctns+'</td><td  id="othrchnges_row'+cnt1+'" >'+b[i].othrchnges+'</td><td  id="revchnge_row'+cnt1+'" >'+b[i].revchnge+'</td><td id="clspos_row'+cnt1+'" >'+b[i].clspos+'</td><td id="reportsd_row'+cnt1+'" >'+b[i].reportsd+'</td> <tr>');	
							
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
							     url : "BOP0202SUM",
							     data : pymd  ,
									dataType : 'json', 
									type : 'POST',
									async : true,
									 success : function(res) {
										
										 $("#sumtest tr").remove();
								
								console.log(res.sum1BOP0202);
							
								var b=JSON.parse(res.sum1BOP0202);
								

									 
									 		for(var i=0;i<b.length;i++){
									 		
										 		  $("#sec1").append('<tr><td id="dynamicdomain_row'+cnt1+'">'+b[i].dynamicdomain+'</td><td id="srno_row'+cnt1+'">'+b[i].srno+'</td><td id="instname_row'+cnt1+'" >'+b[i].instname+'</td><td id="unid_row'+cnt1+'" >'+b[i].unid+'</td><td id="cntry_row'+cnt1+'" >'+b[i].cntry+'</td><td class="sumder" id="trantyp_row'+cnt1+'" >'+b[i].trantyp+'</td><td class="sumder"  id="peropnpos_row'+cnt1+'" >'+b[i].peropnpos+'</td><td class="sumder"  id="perclspos_row'+cnt1+'" >'+b[i].perclspos+'</td><td class="sumder"  id="opnposs_row'+cnt1+'" >'+b[i].opnposs+'</td><td id="addtns_row'+cnt1+'" >'+b[i].addtns+'</td><td id="redctns_row'+cnt1+'" >'+b[i].redctns+'</td><td class="sumder"  id="othrchnges_row'+cnt1+'" >'+b[i].othrchnges+'</td><td class="sumder"  id="revchnge_row'+cnt1+'" >'+b[i].revchnge+'</td><td id="clspos_row'+cnt1+'" >'+b[i].clspos+'</td><td style="text-align: center;"><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td><tr>');	
									 		  
									 		 
											
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
	location.href = "XBRL_REP_BOP0202_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';

	


} 

</SCRIPT>

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

	$(".add").attr("disabled",true);
	$("#addrowno").val("0");
		
	
	  document.getElementById("edit_button"+no).style.display="none";
	  document.getElementById("save_button"+no).style.display="block";
	  
	 	


	  var peropnpos	 =  document.getElementById("peropnpos_row"+no);
	  var perclspos	 =  document.getElementById("perclspos_row"+no);
	 

	
	  
	  var	peropnpos_data = peropnpos.innerHTML;
	  var	perclspos_data = perclspos.innerHTML;
	 
	
	  
	  peropnpos.innerHTML="<input type='text' class='decimalPt roundUp'  id='peropnpos_text"+no+"'  style='width: 83px'; value='"+peropnpos_data+"'>";
	  perclspos.innerHTML="<input type='text' class='decimalPt roundUp'  id='perclspos_text"+no+"'  style='width: 83px'; value='"+perclspos_data+"'>";
	
	  
	 
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


var peropnpos_val=document.getElementById("peropnpos_text"+no).value;

document.getElementById("peropnpos_row"+no).innerHTML=peropnpos_val;

var perclspos_val=document.getElementById("perclspos_text"+no).value;

document.getElementById("perclspos_row"+no).innerHTML=perclspos_val;




if($("#addrowno").val()=="1"){
	
	
	var  instname_val=document.getElementById("instname_text"+no).value;	 
	document.getElementById("instname_row"+no).innerHTML=instname_val;



	var unid_val=document.getElementById("unid_text"+no).value;
	document.getElementById("unid_row"+no).innerHTML=unid_val;

	
	var cntry_val=document.getElementById("cntry_text"+no).value;
	document.getElementById("cntry_row"+no).innerHTML=cntry_val;



	var trantyp_val=document.getElementById("trantyp_text"+no).value;
		document.getElementById("trantyp_row"+no).innerHTML=trantyp_val;

		
	var  opnposs_val=document.getElementById("opnposs_text"+no).value;	 
	document.getElementById("opnposs_row"+no).innerHTML=opnposs_val;


	var  addtns_val=document.getElementById("addtns_text"+no).value;	 
	document.getElementById("addtns_row"+no).innerHTML=addtns_val;
	
	var  redctns_val=document.getElementById("redctns_text"+no).value;	 
	document.getElementById("redctns_row"+no).innerHTML=redctns_val;

	var  othrchnges_val=document.getElementById("othrchnges_text"+no).value;	 
	document.getElementById("othrchnges_row"+no).innerHTML=othrchnges_val;

	var  revchnge_val=document.getElementById("revchnge_text"+no).value;	 
	document.getElementById("revchnge_row"+no).innerHTML=revchnge_val;

	var  clspos_val=document.getElementById("clspos_text"+no).value;	 
	document.getElementById("clspos_row"+no).innerHTML=clspos_val;

	

	var  reportsd_val=document.getElementById("reportsd_text"+no).value;	 
	document.getElementById("reportsd_row"+no).innerHTML=reportsd_val;
	

}

document.getElementById("edit_button"+no).style.display="block";
document.getElementById("save_button"+no).style.display="none";



var instname=document.getElementById("instname_row"+no).innerHTML;	 

var unid=document.getElementById("unid_row"+no).innerHTML;
var cntry=document.getElementById("cntry_row"+no).innerHTML;

var trantyp=document.getElementById("trantyp_row"+no).innerHTML;

var peropnpos=document.getElementById("peropnpos_row"+no).innerHTML;

var perclspos=document.getElementById("perclspos_row"+no).innerHTML;
var opnposs=document.getElementById("opnposs_row"+no).innerHTML;

var addtns=document.getElementById("addtns_row"+no).innerHTML;
var redctns=document.getElementById("redctns_row"+no).innerHTML;

var othrchnges=document.getElementById("othrchnges_row"+no).innerHTML;	 
var revchnge=document.getElementById("revchnge_row"+no).innerHTML;	
var clspos=document.getElementById("clspos_row"+no).innerHTML;		
 var reportsd =document.getElementById("reportsd_row"+no).innerHTML; 


$("#det1 td").attr("padding","8px");
var refeBOP0202=document.getElementById("refDisplay").innerHTML;
peropnpos=peropnpos.replace(/\,/g,'');
peropnpos=Number(peropnpos);

perclspos=perclspos.replace(/\,/g,'');
perclspos=Number(perclspos);


var rptdate1 = {
	     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeBOP0202,"instname":instname,"unid":unid,"cntry":cntry,"trantyp":trantyp,"peropnpos":peropnpos,"perclspos":perclspos,"opnposs":opnposs,"addtns":addtns,"redctns":redctns,"othrchnges":othrchnges,"revchnge":revchnge,"clspos":clspos,"reportsd":reportsd  
	}; 

$.ajax({
   url : "BOP0202",
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
	if(b==4 ||b==5 || b==12 ){
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
    
    <form class="form-horizontal" method="post" name="bop0202Form"
		enctype="multipart/form-data">
             	<div class="tab-content" >
             	<input type="hidden" id="addrowno">
	 	<div class="active bop0202" id="tab2" style="width: 1506px;padding-top: 1px;margin-top: -17px;" >
	 	<div style=" margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;"><%=reptype %> - <b id="sub" style="display: none"></b></b><b>Statement of Bank's Own Investment Position and Transactions on Selected Financial Assets Held With and Liabilities Due To Non-residents by Country	<b id="sub"
					Style="display: none"></b></b></font>
			<br><br></div> 
		
            <table class="" style="width:1506px;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfrst">Summary </span></a><a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
 
            
            <table class="table" id="tb1" style=" width: 100%;margin-top: -20px;" border="1">
            
             <thead>
					
					
					 <tr class="filters" >
					 <th  rowspan="2" id="dyndomain"  style="text-align: center;width:131px;" >Dynamic Domian</th>
						<th rowspan="2" id="instsrno"   style="text-align: center;">Sr.No.</th>
						<th id="transactnsrno"  style="text-align: center;">Name of Non-resident Institution</th>
						<th  id="namofinstn"  style="text-align: center;">Unique identifier for Non-resident Institution</th>
						
						<th  id="natuoftranstn"  style="text-align: center;">Country</th>
						
						<th  id="curr"  style="text-align: center;">Type of transaction</th>
						<th  id="callmoney"  style="text-align: center;">Percentage Shareholding at Opening Position</th>
						<th  id="monatshortnotice"  style="text-align: center;">Percentage Shareholding at Closing Position</th>
						<th  id="termoney"  style="text-align: center;">Opening Position</th>
						<th  id="remark"  style="text-align: center;" style="text-align: center;" >Additions</th>
						<th id="termoney"  style="text-align: center;">Reductions</th>
						<th id="remark"  style="text-align: center;" style="text-align: center;" >Other Changes in Volume</th>
						<th  id="termoney"  style="text-align: center;">Revaluation Changes</th>
						<th  id="remark"  style="text-align: center;" style="text-align: center;" >Closing Position </th>
						
						<th   style="text-align: center;">Select</th>
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
			
				 </tr>
				 
				 
				 
				<thead>
					
					<tbody class="databody" id="sec1">

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
				
				
			
   
				
			  </div>	
				
				<div class="tab-pane" id="tab1" style="width: 1577px;padding-top: 1px;margin-top: -17px;">
<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b> BOP0202-Statement Of Bank's Own Investment Position And Transactions On Selected Financial Assets Held With And Liabilities Due To Non-residents By Country
 <b id="sub"
					Style="display: none"></b></b></font>
			<b style="font-size: 13px;">   <b id="sub" style="display: none"></b></b></div><br>
					
					 <div id="divLoading"> 
    </div>
  
    
     <table class="table" style="width: 1577px;height:50px;   ">
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
					 
					 
						<th style="width: 100px;text-align:center;"><input type="text"  style="width: 100px;text-align:center;" id="custid" onkeyup="myFunction(this.id,0)" class="form-control2" placeholder="Name of Non-resident Institution" disabled> </th>						
						<th  style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" id="schmcd" onkeyup="myFunction(this.id,1)" class="form-control2" placeholder="Unique identifier for Non-resident Institution" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text"  style="width: 100px;text-align:center;" id="schmty" class="form-control2" onkeyup="myFunction(this.id,2)" placeholder="Country" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" id="acopendt"  onkeyup="myFunction(this.id,3)" class="form-control2" placeholder="Type of transaction" disabled></th>						
						<th style="width: 100px;text-align:center;"><input type="text"  style="width: 100px;text-align:center;" class="form-control2" id="intrt" onkeyup="myFunction(this.id,4)" placeholder="Percentage Shareholding at Opening Position" disabled></th>
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="acbalamt" onkeyup="myFunction(this.id,5)" placeholder="Percentage Shareholding at Closing Position" disabled></th>
						<th style="width: 100px;text-align:center;" ><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="acrncycd" onkeyup="myFunction(this.id,6)" placeholder="Opening Position" disabled></th>
						
						<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="rem" onkeyup="myFunction(this.id,7)" placeholder="Additions" disabled></th>
						<th style="width: 100px;text-align:center;" ><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="repdate" onkeyup="myFunction(this.id,8)" placeholder="Reductions" disabled></th>
					
							<th style="width: 100px;text-align:center;"><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="r1" onkeyup="myFunction(this.id,9)" placeholder="Other Changes in Volume" disabled></th>
						<th style="width: 100px;text-align:center;" ><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="r2" onkeyup="myFunction(this.id,10)" placeholder="Revaluation Changes" disabled></th>
											<th style="width: 100px;text-align:center;" ><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="r3" onkeyup="myFunction(this.id,11)" placeholder="Closing Position   " disabled></th>
							<th style="width: 100px;text-align:center;" ><input type="text" style="width: 100px;text-align:center;" class="form-control2" id="r4" onkeyup="myFunction(this.id,12)" placeholder="Report Date  " disabled></th>
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