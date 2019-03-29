<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLBLS0700Bean,dao.XBRLBLS0700Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    <%@ page import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat,utilities.NullCheck"%>
    

  
    
  <%  
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
  DecimalFormat df = new DecimalFormat("#,###.00");  
  %>
  
      <%
    DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Date date = new Date();	
	String username = session.getAttribute("userName").toString();
    String curdate = dateFormat.format(date);
	%>
 
 
 
  <%--  <%
   
   XBRLBLS0700Dao dmd=new XBRLBLS0700Dao();
   ArrayList<XBRLBLS0700Bean> list=new ArrayList<XBRLBLS0700Bean>();
    
   
  // ArrayList<XBRLBLS0700Bean> listsum=dmd.xbrlpymsum(dt1,dt2,ReporefSeq);
	  
	  DecimalFormat df1 = new DecimalFormat("0.00");
	//out.print(repname+" "+ReporefSeq);
	  if(repname == null ){ 
		//  out.println("if");
		   
	//	 list=dmd.xbrlpym400(dt1,dt2);
	 } 

	   else{
		// out.println("else");
	//list=dmd.xbrlpym4RR(dt1,dt2,ReporefSeq);	
		  

	      }
	  
    %>  --%>
    
   
  
    

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

/* 
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
 */


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
#pymdets td{
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



.clr{
color: #0c0b0b;
    background-color: #f5f5f5;
    border-color: #f5f5f5;
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

.loader {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url('../../images/Loader.gif') 30% 30% no-repeat rgb(249,249,249);
    opacity: .8;
}
.tab-pane,#tbcates{
display:none;
}


 .databody td{
border:1px solid #ddd;
}
.tab-pane,#tbcates{
display:none;
}

 
</style>




<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	$("#addrowno").val("0");
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');
	$("#sumfirst").on("click",function(){ 
	
		 location.href = "XBRL_REP_BLS0700_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		 });
	$(".det").on("click",function(){
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_BLS0700_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$('#btnback').click(function(){
		 location.href="XBRL_CRT_BLS0700.jsp?reptype="+'<%=request.getParameter("reptype")%>';

	});
	$('#btnExcel').click(function() {
		//alert("srdgihsdukl");//return false;
		 BLS0700Form.action = "BLS0700EXCELREPORT.action?method=BLS0700EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 BLS0700Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 BLS0700Form.action = "BLS0700EXCELSum.action?method=BLS0700EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 BLS0700Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 BLS0700Form.action = "BLS0700PDFREPORT.action?method=BLS0700PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 BLS0700Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  BLS0700Form.action = "XMLDOWNLOADb7.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 BLS0700Form.submit(); 
	});
	var save=0;

$('#btnSave').on("click",function() {
	 /*  $("#divLoading").addClass('show'); */
	  var datasum={
			"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").text()
	};
	$.ajax({
		url:"saveSumb7",
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
	  <%-- BLS0700Form.action = "saveSum.action?method=sumBLS0700saves&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&repname="+'<%=repname%>'+"&ReporefSeq="+'<%=ReporefSeq%>'+"&instno="+'<%=instno%>';
	  
		 BLS0700Form.submit(); --%>
       
		 
	 
});

 $("#addrow").on("click",function(){
		var rowno=$("#rowno").val();
		$("#addrowno").val("1"); 
		$("#pymdets").prepend("<tr><td id='actno_row"+rowno+"'><input type='text' id='actno_text"+rowno+"' style='width: 100px;'></td><td id='accname_row"+rowno+"'><input type='text'  id='accname_text"+rowno+"' style='    width:263px;'></td><td id='schmtyp_row"+rowno+"'><input type='text' id='schmtyp_text"+rowno+"' style='     width: 65px;'></td><td id='intrate_row"+rowno+"'><input type='text' 	id='intrate_text"+rowno+"' style='    width: 65px;'></td><td id='intperdays_row"+rowno+"'><input type='text' id='intperdays_text"+rowno+"' style='    width: 100px;'></td><td id='curr_row"+rowno+"'><input type='text'  id='curr_text"+rowno+"'   style='    width: 60px;'><td id='balamt_row"+rowno+"' class='sumder alnum'><input type='text'  id='balamt_text"+rowno+"'  class='decimalPt roundUp'  style='    width: 85px;'><td id='repdat_row"+rowno+"'><input type='text' id='repdat_text"+rowno+"' style='     width: 90px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");


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
			  if (!isNaN(value)) {
			    $(this).val(parseFloat(value).toFixed(2));
			  }
			});
/* 
	 $( "#trdate_text"+rowno ).datepicker({
		
    	
	   	  
		   dateFormat: 'dd-mm-yy',
			changeMonth: false,//this option for allowing user to select month
		  changeYear: false//this option for allowing user to select from year range
		  
	   });  */
		});


		
});	






</script>



 <script>
 
 
 
 



	
   
function edit_row(no)
{
	//alert("happyyyyyyyyyyyyy");
//alert("hiii 2d AGccccccccc" +  edit_row(no));
$(".add").attr("disabled",true);

$("#addrowno").val("0");
 	
 	document.getElementById("edit_button"+no).style.display="none";
 	  document.getElementById("save_button"+no).style.display="block";
 	 	

 	  
 	 
  
  var	balamt =  document.getElementById("balamt_row"+no);

 var	balamt_data = balamt.innerHTML;
 
 
  balamt.innerHTML="<input type='text' class='decimalPt roundUp'  id='balamt_text"+no+"'  style='width: 83px'; value='"+balamt_data+"'>";
 


 
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
	
	document.getElementById("edit_button"+no).checked = false;
	
	  
	 
	var balamt_val=document.getElementById("balamt_text"+no).value;
	
	document.getElementById("balamt_row"+no).innerHTML=balamt_val;
	
	if($("#addrowno").val()=="1"){
	var  actno_val=document.getElementById("actno_text"+no).value;	 
	document.getElementById("actno_row"+no).innerHTML=actno_val;
	 
	var accname_val=document.getElementById("accname_text"+no).value;
	  document.getElementById("accname_row"+no).innerHTML=accname_val;
	  
	   var schmtyp_val=document.getElementById("schmtyp_text"+no).value;
	   document.getElementById("schmtyp_row"+no).innerHTML=schmtyp_val;
	   
	  var intrate_val=document.getElementById("intrate_text"+no).value;
	   document.getElementById("intrate_row"+no).innerHTML=intrate_val;
	  
	  
	  
	  var intperdays_val=document.getElementById("intperdays_text"+no).value;	
	  document.getElementById("intperdays_row"+no).innerHTML=intperdays_val;
	 
	  var curr_val=document.getElementById("curr_text"+no).value;
	  document.getElementById("curr_row"+no).innerHTML=curr_val;
	
	  
	  var repdat_val=document.getElementById("repdat_text"+no).value;
	  document.getElementById("repdat_row"+no).innerHTML=repdat_val;
	 
	}
	
	document.getElementById("edit_button"+no).style.display="block";
	document.getElementById("save_button"+no).style.display="none";


	 var  actno=document.getElementById("actno_row"+no).innerHTML;	 
	 var accname=document.getElementById("accname_row"+no).innerHTML;
	  var schmtyp=document.getElementById("schmtyp_row"+no).innerHTML;
	  
	  var intrate=document.getElementById("intrate_row"+no).innerHTML;	
	 var intperdays=document.getElementById("intperdays_row"+no).innerHTML;
	 
	  var curr=document.getElementById("curr_row"+no).innerHTML;
		 var  balamt=document.getElementById("balamt_row"+no).innerHTML;	 
	  var repdat=document.getElementById("repdat_row"+no).innerHTML;
	
	 $("#pymdets td").attr("padding","8px");
	var refeBLS700=document.getElementById("refDisplay").innerHTML;
	
	//alert("refePYM100==>"+refePYM100+"refePYM100"); 

	  balamt=balamt.replace(/\,/g,'')
	  balamt=Number(balamt)
	
	/*    $("#divLoading").addClass('show'); */
	 var rptdate1 = {
			     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeBLS700, "actno":actno,"accname":accname,"schmtyp" : schmtyp,"intrate":intrate, "intperdays":intperdays,"curr":curr,"balamt":balamt,"repdat":repdat
			}; 
	 
	 $.ajax({
	     url : "BLS0700",
	     data : rptdate1  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 console.log(res.refno);
				
				// alert("sfsdf");
				 $("#refDisplay").html(res.refno);
				 
				
				
				
			}
		});
	

	
}

 

</script> 




<script>

/*
Please consider that the JS part isn't production ready at all, I just code it to show the concept of merging filters and titles together !
*/
$(document).ready(function(){
	$("#btnfilter").on("click",function(){
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
		}else{
			$(".form-control2").val("");
			$(".form-control2").prop("disabled",true);
		}
		
	});

	$("#amt1").html((parseFloat(document.getElementById("chqamt_row1").innerHTML.replace(/,/g, ''))+parseFloat(document.getElementById("chqamt_row4").innerHTML.replace(/,/g, ''))).toFixed(2))
	$("#amt2").html((parseFloat(document.getElementById("chqamt_row2").innerHTML.replace(/,/g, ''))+parseFloat(document.getElementById("chqamt_row5").innerHTML.replace(/,/g, ''))).toFixed(2))
	$("#amt3").html((parseFloat(document.getElementById("chqamt_row3").innerHTML.replace(/,/g, ''))+parseFloat(document.getElementById("chqamt_row6").innerHTML.replace(/,/g, ''))).toFixed(2))
	
	
	Number(parseFloat(amt1).toFixed(2)).toLocaleString('en', {
	    minimumFractionDigits: 2
	});
	

});
</script>




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

		 $(".det").addClass("clr");
		//FOR DETAILS
			$(".tab-pane,#tbcates").hide();
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
					url : "BLS0700details",
					data : pymd,
					dataType : 'json',
					type : 'POST',
					async : true,
					success : function(res) {	
					//	alert("refePYM100"+refePYM100);
						
						  $("#pymdets tr").remove();
						 
						
						var b=JSON.parse(res.detBLS0700);
						 console.log(b);
						
						
						
					
							 	if(f=="onload"){
							 		$("#modify").show();
							 		
							 		for(var i=0;i<b.length;i++){
							 			
							 		  $("#pymdets").append(
							 				 "<tr>"
												 
						                       +"<td  id='actno_row"+srno+"' >"+b[i].accno+"</td>"
						                      +"<td  id='accname_row"+srno+"'>"+ b[i].accname+"</td>"
						                      +"<td  id='schmtyp_row"+srno+"'>"+b[i].schmtyp+"</td>"	
						                      +"<td  class='alnum' id='intrate_row"+srno+"'>"+b[i].intrate+"</td>"	
						                      +"<td  id='intperdays_row"+srno+"'>"+b[i].intperioddays+"</td>"
						                      +"<td  id='curr_row"+srno+"'>"+b[i].curr+"</td>"		                      
						                      +"<td class='alnum' id='balamt_row"+srno+"'>"+b[i].balamt+"</td>"	
						                     + "<td  id='repdat_row"+srno+"'>"+b[i].rptdate+"</td><td><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>" ) ;  
												 
							 				/*  '<tr><td id="itn'+cnt1+'"><b>'+b[i].instcode+'</b></td><td  id="itc'+cnt1+'" >'+b[i].depusd+'</td><td id="daa'+cnt1+'" class=alnum>'+b[i].depeuro+'</td><td id="wai'+cnt1+'" class=alnum>'+b[i].depgbp+'</td><td id="iie'+cnt1+'" class=alnum>'+b[i].deprand+'</td><td id="itn'+cnt1+'"><b>'+b[i].depothers+'</b></td><td id="itn'+cnt1+'"><b>'+b[i].minusd+'</b></td><td  id="itc'+cnt1+'" >'+b[i].maxusd+'</td><td id="daa'+cnt1+'" class=alnum>'+b[i].wgtusd+'</td><td id="wai'+cnt1+'" class=alnum>'+b[i].ollminusd+'</td><td id="iie'+cnt1+'" class=alnum>'+b[i].ollmaxusd+'</td><td id="itn'+cnt1+'"><b>'+b[i].ollwgtusd+'</b></td><td id="itn'+cnt1+'"><b>'+b[i].mineuro+'</b></td><td  id="itc'+cnt1+'" >'+b[i].maxeuro+'</td><td id="daa'+cnt1+'" class=alnum>'+b[i].wgteuro+'</td><td id="wai'+cnt1+'" class=alnum>'+b[i].ollmineuro+'</td><td id="iie'+cnt1+'" class=alnum>'+b[i].ollmaxeuro+'</td><td id="itn'+cnt1+'"><b>'+b[i].ollwgteuro+'</b></td><td id="itn'+cnt1+'"><b>'+b[i].mingbp+'</b></td><td  id="itc'+cnt1+'" >'+b[i].maxgbp+'</td><td id="daa'+cnt1+'" class=alnum>'+b[i].wgtgbp+'</td><td id="wai'+cnt1+'" class=alnum>'+b[i].ollmingbp+'</td><td id="iie'+cnt1+'" class=alnum>'+b[i].ollmaxgbp+'</td><td id="itn'+cnt1+'"><b>'+b[i].ollwgtgbp+'</b></td><td id="itn'+cnt1+'"><b>'+b[i].minrand+'</b></td><td  id="itc'+cnt1+'" >'+b[i].maxrand+'</td><td id="daa'+cnt1+'" class=alnum>'+b[i].wgtrand+'</td><td id="wai'+cnt1+'" class=alnum>'+b[i].ollminrand+'</td><td id="iie'+cnt1+'" class=alnum>'+b[i].ollmaxrand+'</td><td id="itn'+cnt1+'"><b>'+b[i].ollwgtrand+'</b></td><td><input type=radio id="edit_button'+srno+'" value=Edit class=btn btn-xs btn-primary edit style=width: 37px; onclick=edit_row('+srno+')>  <input type=button id="save_button'+srno+'" value=Save class=btn btn-xs btn-primary save style=width: 37px; display:none; onclick=save_row("'+srno+'")></td><tr>');
 */
												
							 	
									/*  $("#chqamt_row"+srno+"").html(parseFloat(document.getElementById("chqamt_row"+srno+"").innerHTML).toFixed(2)); */
									
									 srno++;
									
									 
									
										} $("#divLoading").removeClass('show');
									$("#rowno").val(srno);
							 	}else if(f=="frmsum"){
							 		$(".add").hide();//add button hide
							 	
							 		$("#modify").hide();//modify in the header hide
							 		for(var i=0;i<b.length;i++){
							 			
							 		  $("#pymdets").append(

												 
												
												
												 "<tr>"
												 
							                      +"<td  id='actno_row"+srno+"' >"+b[i].accno+"</td>"
						                      +"<td  id='accname_row"+srno+"'>"+ b[i].accname+"</td>"
						                      +"<td  id='schmtyp_row"+srno+"'>"+b[i].schmtyp+"</td>"	
						                      +"<td  class='alnum' id='intrate_row"+srno+"'>"+b[i].intrate+"</td>"	
						                      +"<td  id='intperdays_row"+srno+"'>"+b[i].intperioddays+"</td>"
						                      +"<td  id='curr_row"+srno+"'>"+b[i].curr+"</td>"		                      
						                      +"<td class='alnum' id='balamt_row"+srno+"'>"+b[i].balamt+"</td>"	
							                     + "<td  id='repdat_row"+srno+"'>"+b[i].rptdate+"</td></tr>" ) ;  
									 
									
									 srno++;
									 
									 
									 
										}
							 		 $("#divLoading").removeClass('show');
							 	}
								
								
							 $("#divLoading").removeClass('show'); 
							$('.alnum').mask("#,##0.00", {reverse: true}); 
						
							}
							

							
					
				});   
	 }else{
		 
		 
		 $(".summ").addClass("clr");
		 //For summary
		 $("#divLoading").addClass('show');
		 //active,tab-pane for whole div
		 //tbcate,tbcates for table
		 $(".active,#tbcate").hide(); //tab1 or for details
			$(".tab-pane,#tbcates").show(); //tab2 or for summary
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
			
				$("#test tr").children().detach().remove();
			
				var rptdate1 = {
						  "reptype":a,"reportrefnos":refno,"dt1" : d,"dt2":e,"curr":g
						}; 
				 
				 $.ajax({
				     url : "BLS0700SUM",
				     data : rptdate1  ,
						dataType : 'json', 
						type : 'POST',
						async : true,
						 success : function(res) {
							 //console.log(res.refnoAB);
					
					console.log(res.summaryBLS0700);
				
					var b=JSON.parse(res.summaryBLS0700);
					
					var k=1;
					var cnt1=1;
					
					
					for (var i = 0; i < b.length; i++) {
					
						
						//$('.alnum').mask("#,##0.00", {reverse: true});
				
					/* if(i==0 || i==1 || i==2 || i==8 || i==9 || i==7 || i==15 || i==16 || i==14 || i==21 || i==22 || i==23){
						$("#test").append('<tr><td  class=sumder alnum id="itn'+cnt1+'"><b>'+b[i].instname+'</b></td><td  class=sumder alnum id="itn'+cnt1+'"><b>'+b[i].instcode+'</b></td><td  class=sumder alnum   id="itc'+cnt1+'" >'+b[i].depusd+'</td><td  class=sumder alnum id="daa'+cnt1+'" class=alnum>'+b[i].depeuro+'</td><td  class=sumder alnum id="wai'+cnt1+'" >'+b[i].depgbp+'</td><td class=sumder alnum id="iie'+cnt1+'" >'+b[i].deprand+'</td><td class=sumder alnum id="itn'+cnt1+'"><b>'+b[i].depothers+'</b></td><td class=sumder alnum id="itn'+cnt1+'"><b>'+b[i].minusd+'</b></td><td class=sumder alnum id="itc'+cnt1+'" >'+b[i].maxusd+'</td><td class=sumder alnum id="daa'+cnt1+'" >'+b[i].wgtusd+'</td><td class=sumder alnum id="wai'+cnt1+'" >'+b[i].ollminusd+'</td><td class=sumder alnum id="iie'+cnt1+'" >'+b[i].ollmaxusd+'</td><td class=sumder alnum id="itn'+cnt1+'"><b>'+b[i].ollwgtusd+'</b></td><td class=sumder alnum id="itn'+cnt1+'"><b>'+b[i].mineuro+'</b></td><td class=sumder alnum id="itc'+cnt1+'" >'+b[i].maxeuro+'</td><td class=sumder alnum id="daa'+cnt1+'" >'+b[i].wgteuro+'</td><td class=sumder alnum id="wai'+cnt1+'" >'+b[i].ollmineuro+'</td><td class=sumder alnum id="iie'+cnt1+'" >'+b[i].ollmaxeuro+'</td><td class=sumder alnum id="itn'+cnt1+'"><b>'+b[i].ollwgteuro+'</b></td><td class=sumder alnum id="itn'+cnt1+'"><b>'+b[i].mingbp+'</b></td><td class=sumder alnum id="itc'+cnt1+'" >'+b[i].maxgbp+'</td><td class=sumder alnum id="daa'+cnt1+'" >'+b[i].wgtgbp+'</td><td class=sumder alnum id="wai'+cnt1+'" >'+b[i].ollmingbp+'</td><td class=sumder alnum id="iie'+cnt1+'" >'+b[i].ollmaxgbp+'</td><td class=sumder alnum id="itn'+cnt1+'"><b>'+b[i].ollwgtgbp+'</b></td><td class=sumder alnum id="itn'+cnt1+'"><b>'+b[i].minrand+'</b></td><td class=sumder alnum id="itc'+cnt1+'" >'+b[i].maxrand+'</td><td class=sumder alnum id="daa'+cnt1+'" >'+b[i].wgtrand+'</td><td class=sumder alnum id="wai'+cnt1+'" >'+b[i].ollminrand+'</td><td class=sumder alnum id="iie'+cnt1+'" >'+b[i].ollmaxrand+'</td><td class=sumder alnum id="itn'+cnt1+'"><b>'+b[i].ollwgtrand+'</b></td><td class=sumder alnum style="text-align: center;"><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td><tr>');							
					}else{ */
						//$("#test").append('<tr><td id="itn'+cnt1+'"><b>'+b[i].instname+'</b></td><td id="itn'+cnt1+'"><b>'+b[i].instcode+'</b></td><td  id="itc'+cnt1+'" >'+b[i].depusd+'</td><td id="daa'+cnt1+'" class=alnum>'+b[i].depeuro+'</td><td id="wai'+cnt1+'" class=alnum>'+b[i].depgbp+'</td><td id="iie'+cnt1+'" class=alnum>'+b[i].deprand+'</td><td id="itn'+cnt1+'"><b>'+b[i].depothers+'</b></td><td id="itn'+cnt1+'"><b>'+b[i].minusd+'</b></td><td  id="itc'+cnt1+'" >'+b[i].maxusd+'</td><td id="daa'+cnt1+'" class=alnum>'+b[i].wgtusd+'</td><td id="wai'+cnt1+'" class=alnum>'+b[i].ollminusd+'</td><td id="iie'+cnt1+'" class=alnum>'+b[i].ollmaxusd+'</td><td id="itn'+cnt1+'"><b>'+b[i].ollwgtusd+'</b></td><td id="itn'+cnt1+'"><b>'+b[i].mineuro+'</b></td><td  id="itc'+cnt1+'" >'+b[i].maxeuro+'</td><td id="daa'+cnt1+'" class=alnum>'+b[i].wgteuro+'</td><td id="wai'+cnt1+'" class=alnum>'+b[i].ollmineuro+'</td><td id="iie'+cnt1+'" class=alnum>'+b[i].ollmaxeuro+'</td><td id="itn'+cnt1+'"><b>'+b[i].ollwgteuro+'</b></td><td id="itn'+cnt1+'"><b>'+b[i].mingbp+'</b></td><td  id="itc'+cnt1+'" >'+b[i].maxgbp+'</td><td id="daa'+cnt1+'" class=alnum>'+b[i].wgtgbp+'</td><td id="wai'+cnt1+'" class=alnum>'+b[i].ollmingbp+'</td><td id="iie'+cnt1+'" class=alnum>'+b[i].ollmaxgbp+'</td><td id="itn'+cnt1+'"><b>'+b[i].ollwgtgbp+'</b></td><td id="itn'+cnt1+'"><b>'+b[i].minrand+'</b></td><td  id="itc'+cnt1+'" >'+b[i].maxrand+'</td><td id="daa'+cnt1+'" class=alnum>'+b[i].wgtrand+'</td><td id="wai'+cnt1+'" class=alnum>'+b[i].ollminrand+'</td><td id="iie'+cnt1+'" class=alnum>'+b[i].ollmaxrand+'</td><td id="itn'+cnt1+'"><b>'+b[i].ollwgtrand+'</b></td><td style="text-align: center;"><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td><tr>');
				//	}
					//alert($("#it"'+cnt1+'")val());
						//  $("#it"+cnt1+" ").html(parseFloat(document.getElementById("it"+cnt1+"").innerHTML).toFixed(2));
					//	$("#ite"+cnt1+" ").html(parseFloat(document.getElementById("ite"+cnt1+"").innerHTML).toFixed(2));
						$("#test").append('<tr><td   id="intnam'+cnt1+'"><b>'+b[i].instname+'</b></td><td  id="intcode'+cnt1+'"><b>'+b[i].instcode+'</b></td><td  class= alnum   id="depusd'+cnt1+'" >'+b[i].depusd+'</td><td  class=alnum id="depeuro'+cnt1+'" >'+b[i].depeuro+'</td><td class=alnum id="depgbp'+cnt1+'" >'+b[i].depgbp+'</td><td class=alnum id="deprand'+cnt1+'" >'+b[i].deprand+'</td><td class=alnum id="depothers'+cnt1+'">'+b[i].depothers+'</td><td class=alnum id="minusd'+cnt1+'">'+b[i].minusd+'</td><td class=alnum id="maxusd'+cnt1+'" >'+b[i].maxusd+'</td><td class=alnum id="wgtusd'+cnt1+'" >'+b[i].wgtusd+'</td><td class=alnum id="ollminusd'+cnt1+'" >'+b[i].ollminusd+'</td><td class=alnum id="ollmaxusd'+cnt1+'" >'+b[i].ollmaxusd+'</td><td class=alnum id="ollwgtusd'+cnt1+'">'+b[i].ollwgtusd+'</td><td class=alnum id="mineuro'+cnt1+'">'+b[i].mineuro+'</td><td class=alnum id="maxeuro'+cnt1+'" >'+b[i].maxeuro+'</td><td class=alnum id="wgteuro'+cnt1+'" >'+b[i].wgteuro+'</td><td class=alnum id="ollmineuro'+cnt1+'" >'+b[i].ollmineuro+'</td><td class=alnum id="ollmaxeuro'+cnt1+'" >'+b[i].ollmaxeuro+'</td><td class=alnum id="ollwgteuro'+cnt1+'">'+b[i].ollwgteuro+'</td><td class=alnum id="mingbp'+cnt1+'">'+b[i].mingbp+'</td><td class=alnum id="maxgb'+cnt1+'" >'+b[i].maxgbp+'</td><td class=alnum id="wgtgbp'+cnt1+'" >'+b[i].wgtgbp+'</td><td class=alnum id="ollmingbp'+cnt1+'" >'+b[i].ollmingbp+'</td><td class=alnum id="ollmaxgbp'+cnt1+'" >'+b[i].ollmaxgbp+'</td><td class=alnum id="ollwgtgbp'+cnt1+'">'+b[i].ollwgtgbp+'</td><td class=alnum id="minrand'+cnt1+'">'+b[i].minrand+'</td><td class=alnum id="maxrand'+cnt1+'" >'+b[i].maxrand+'</td><td class=alnum id="wgtrand'+cnt1+'" >'+b[i].wgtrand+'</td><td class=alnum id="ollminrand'+cnt1+'" >'+b[i].ollminrand+'</td><td class=alnum id="ollmaxrand'+cnt1+'" >'+b[i].ollmaxrand+'</td><td class=alnum id="ollwgtrand'+cnt1+'">'+b[i].ollwgtrand+'</td><td class=alnum style="text-align: center;"><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td><tr>');
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
	location.href = "XBRL_REP_BLS0700_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</script>

<script>
function myFunction(a,b) {
	
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("pymdets");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
    
if (td) {
	if(b==0 ||b==3|| b==6|| b==7){
		
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
</style>







<body>
<div class="container">
   
   
  
    
    <form class="form-horizontal" method="post" name="BLS0700Form"
		enctype="multipart/form-data">
    
    
    <div id="nav">
    <div class="loader"></div>
   
         <div id="tab3" >
			  
			  <%--  <div class="panel-heading text-center" style="width: 103%;margin-left: 0px;margin-right: 0px;m;margin-top: 26px;argin-bottom: 0px;background-color: #bbc3cb;padding-bottom: 50px;">
			
			
			
			<div class="pull-left" style="width: 200px;text-align: left;">
			 <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" id="refDisplay"><%if(ReporefSeq != null){%><%=ReporefSeq%><%}
			else{%>0<%}%></b></font>
			</div>
			
			
		
            
			<div>
			<font size="2" style="font-size: 13px;" ><b>Statistics for Interbank Clearing Cheques<b id="sub"
					Style="display: none"></b></b></font>
			
			</div> 
			
			<div>
			<b style="font-size: 13px;"> PYM 0100 <b id="sub" style="display: none"></b></b> 
			</div> 
			
			
			
                <div class="pull-right" style="margin-top: -36px;">
               
					
				<a  class="btn btn-xs btn-primary" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a>
          		 
          		  	
						
				
               
                </div>
			
              
            </div> --%>
            
            
            
            
            
            

 
		
	 	<div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			<div class="active" id="tab1" style="width:1020px;padding-top: 1px;margin-top: -17px;" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>BLS0700-Statement of Maturity Pattern of Foreign Currency Deposits and Interest Rates Applicable Thereon<b id="sub"
					Style="display: none"></b></b></font>
			</div>
			<div id="divLoading"> 
    </div><br>
           <table class="table" style="width:;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td>
			 <td style="background-color: #bbc3cb;width: 325px;"></td>
			 <td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a>
    <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></td></tr>
          		  </table>
       
            
           <div class="panel panel-primary filterable">
           
            <table class="table" id="tbcate" border="1" style="  margin-top: -20px;">
            
             <thead>
					 <tr class="filters">
			
				<th style="text-align: center;"><input type="text" id="accnum" onkeyup="myFunction(this.id,0)" style="width: 100px;" class="form-control2" placeholder="Account Number" disabled></th>
					<th style="text-align: center;"><input type="text" id="accname" onkeyup="myFunction(this.id,1)" style="width: 261px;"class="form-control2" placeholder="Account Name" disabled></th>
					<th style="text-align: center;"><input type="text" id="schmtype" onkeyup="myFunction(this.id,2)" style="width: 65px;" class="form-control2" placeholder="Scheme Type" disabled></th>
<th style="text-align: center;"><input type="text" id="intrate" onkeyup="myFunction(this.id,3)" style="width: 59px;"class="form-control2" placeholder="Interest Rate" disabled></th>
<th style="text-align: center;"><input type="text" id="intperdays" onkeyup="myFunction(this.id,4)" style="width: 98px;" class="form-control2" placeholder="Interest Period Days" disabled></th>
<th style="text-align: center;"><input type="text" id="curr" onkeyup="myFunction(this.id,5)" style="width:48px;" class="form-control2" placeholder="Currency" disabled></th>
<th style="text-align: center;"><input type="text" id="balamt" onkeyup="myFunction(this.id,6)" style="width: 84px;" class="form-control2" placeholder="Balance Amount" disabled></th>
<th style="text-align: center;"><input type="text" id="repdate" onkeyup="myFunction(this.id,7)" style="width: 60px;" class="form-control2" placeholder="Report Date" disabled></th>
<th  style="text-align: center;" id="modify">Modify</th>
</tr>
					
				</thead>
					
					<tbody class="databody" id="pymdets">
              </tbody>
              
   
        
				</table>
			</div>
				
			  </div>	
				
				
				
 
				
   
				
				<div class="tab-pane" id="tab2" style="width: 1806PX;padding-top: 1px;margin-top: -17px;">
<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>BLS0700-Statement of Maturity Pattern of Foreign Currency Deposits and Interest Rates Applicable Thereon
<b id="sub"
					Style="display: none"></b></b></font>
			</div>
					<br>
					 <div id="divLoading"> 
    </div>  <table class="table" style="width:1806PX;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font>
			 <font size="1"><b style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:right;background-color: #bbc3cb;width:250px;"></td>
			 <td style="background-color: #bbc3cb;text-align:right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
					<table class="table" id="tbcates" border="1" style="width: 100%;margin-top: -21px;display: table;">
            
             <thead>
					
<tr>
				<th style="width:1100px"> </th>
					<th></th>
					<th style="text-align: center;">United States of America, Dollars</th>
<th style="text-align: center;">Euro Member Countries, Euro</th>
<th style="text-align: center;">United Kingdom, Pounds</th>
<th style="text-align: center;">South Africa, Rand</th>
<th style="text-align: center;">United States of America, Dollars</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th style="text-align: center;">PURE</th>
<th rowspan="3" id="modify">Select</th>
</tr>
		
		<tr>
		<th rowspan="2">Duration</th>
		<th  rowspan="2"></th>
		<th colspan="5"> Deposits Denominated in Foreign Currencies</th>
<th colspan="3">Interest Rate Applicable on New USD Deposits During the Period</th>
<th colspan="3">Interest Rate Applicable on Overall USD Deposits Portfolio</th>
<th colspan="3">Interest Rate Applicable on New EURO Deposits During the Period</th>
<th colspan="3">Interest Rate Applicable on Overall EURO Deposits Portfolio</th>
<th colspan="3">Interest Rate Applicable on New GBP Deposits During the Period</th>
<th colspan="3">Interest Rate Applicable on Overall GBP Deposits Portfolio</th>
<th colspan="3">Interest Rate Applicable on New South African Rand Deposits During the Period</th>
<th colspan="3">Interest Rate Applicable on Overall South African Rand Deposits Portfolio</th>
		</tr>	
		<tr>
		<th style="text-align: center;">US Dollars</th>
<th style="text-align: center;"> Euro </th>
<th  style="text-align: center;">GBP</th>
<th style="text-align: center;"> South African Rand </th>
<th style="text-align: center;"> Other Currencies in USD Equivalent </th>
<th style="text-align: center;"> Min </th>
<th style="text-align: center;"> Max </th>
<th style="text-align: center;"> Weighted Average </th>
<th style="text-align: center;"> Min </th>
<th style="text-align: center;"> Max </th>
<th style="text-align: center;"> Weighted Average </th>
<th style="text-align: center;"> Min </th>
<th style="text-align: center;"> Max </th>
<th style="text-align: center;"> Weighted Average </th>
<th style="text-align: center;"> Min </th>
<th style="text-align: center;"> Max </th>
<th style="text-align: center;"> Weighted Average </th>
<th style="text-align: center;"> Min </th>
<th style="text-align: center;"> Max </th>
<th style="text-align: center;"> Weighted Average </th>
<th style="text-align: center;"> Min </th>
<th style="text-align: center;"> Max </th>
<th style="text-align: center;"> Weighted Average </th>
<th style="text-align: center;"> Min </th>
<th style="text-align: center;"> Max </th>
<th style="text-align: center;"> Weighted Average </th>
<th style="text-align: center;"> Min </th>
<th style="text-align: center;"> Max </th>
<th style="text-align: center;"> Weighted Average </th>
				</tr>
				</thead>
					
					<tbody class="databody" id="test">

            
					
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
			
			
         
        </div>
   
   </div>
   
   
    
    
     </div>
     
     </form>
    
    
</div>





</body>
</html>