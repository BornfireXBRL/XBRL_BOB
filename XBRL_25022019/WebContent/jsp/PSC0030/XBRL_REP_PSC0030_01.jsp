<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="bean.XBRLFIM0100Bean,dao.XBRLFIM0100Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>


<%@ page
	import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat"%>





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
 
 XBRLFIM0100Dao dmd=new XBRLFIM0100Dao();
 
 DecimalFormat df = new DecimalFormat("##,#0.00");
	   
	 // ArrayList<XBRLCRR0100Bean> list=dmd.xbrlcrr100();
	  
	
		  
		  
		 /*  
		  ArrayList<XBRLFIM0100Bean> list=new ArrayList<XBRLFIM0100Bean>();
		 
		  if(ReporefSeq != null){ 
			  
			// out.println("IFFF ---------------->>>>>>>>> RR ID Created" + ReporefSeq);
			  list=dmd.xbrlfimRR(dt1,dt2,ReporefSeq);
			   
			  
		 } 

		  else{
			
			 //out.println("ELSE RR ID Created" + ReporefSeq);
			 //list=dmd.xbrlcrrRR(ReporefSeq);
			 list=dmd.xbrlfim100(dt1,dt2);
			 
		   } */
		  
		  
	/* 	 
		  
		ArrayList<XBRLFIM0100Bean> list1=new ArrayList<XBRLFIM0100Bean>();
		  String ReporefSeqBB = request.getParameter("ReporefSeq");
		  DecimalFormat df1 = new DecimalFormat("0.00"); 
		  if(ReporefSeqBB != null){ 
			  
			 // out.println("IFFF RR ID Created" + ReporefSeq);
			 // list=dmd.xbrlcrrRRBB(ReporefSeq);
			   
			  
		 } 

		  else{
				
				// out.println("ELSE RR ID Created" + ReporefSeq);
				 //list=dmd.xbrlcrrRR(ReporefSeq);
				 list1=dmd.xbrlfim100BB(dt1,dt2);
				 
			   }  
	  
		  
		  ArrayList<XBRLFIM0100Bean> list2=new ArrayList<XBRLFIM0100Bean>();
		  String ReporefSeqAC = request.getParameter("ReporefSeqAC");
		  String dt1AC = request.getParameter("dt1AC");
		  String dt2AC = request.getParameter("dt2AC");
		  if(ReporefSeqAC != null){ 
			  
			  
			 // out.println("IFFF AC RR Created" + ReporefSeq);
			 // list=dmd.xbrlcrrRRBB(ReporefSeq);
			  list2=dmd.xbrlfimACRR(dt1AC,dt2AC,ReporefSeqAC);
			  
		 } 

		  else{
			
			  
			  
			  
			// out.println("ACCCCCCC" + ReporefSeq);
			 //list=dmd.xbrlcrrRR(ReporefSeq);
			 list2=dmd.xbrlfim100AC(dt1,dt2);
			 
		   }
 */
 	
    %>





<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="refresh"
	content="<%=session.getMaxInactiveInterval() %>;url=../XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>XBRL REPORT</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="ib.viewport">
<!-- Bootstrap 3.3.6 -->

<link rel="stylesheet" href="../../css/bootstrap.min.css">
<!-- style page -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="../../CSS/bootstrap-datepicker.css" />

<title>XBRL REPORT</title>
</head>




<style>
.table>thead>tr>th {
	vertical-align: top;
	    border: 1px solid #ddd;
}
#tb1 td{
    border: 1px solid #ddd;
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
.form-control2 {
	font-size: 11px;
	width: 100%;
	height: 25px;
}

form {
	margin: 6px 0;
}

.next, .previous {
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

#filter {
	padding: 25px;
}

.form-horizontal .form-group {
	margin-top: -13px;
	margin-right: -93px;
	margin-left: -15px;
}

.sumdet {
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

table td {
	padding: 2px;
	text-align: left;
	font-size: 10px;
	font-family: arial;
	background-color: white;
}

#pymdets td {
	padding: 8px;
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

.alnum {
	text-align: right;
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
/* 
.loader {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url('../../images/Loader.gif') 30% 30% no-repeat rgb(249,249,249);
    opacity: .8;
} */
.tab-pane, #tbcates {
	display: none;
}

.tab-pane, #tbcates {
	display: none;
}

.clr{
color: #0c0b0b;
    background-color: #f5f5f5;
    border-color: #f5f5f5;
}
</style>

<script>
$(document).ready(function(){

	if('<%=reptype%>'=="PSC0501" || '<%=reptype%>'=="psc0501"){
		
		$(".psc0501").show();
		$(".psc0500").hide();
	}else if('<%=reptype%>'=="PSC0500" || '<%=reptype%>'=="psc0500"){
		
		$(".psc0500").show();
		$(".psc0501").hide();
	}
	
	
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
	
	
	
	$('#btnback').on('click', function(e){
	    e.preventDefault();
	    window.history.back();
	});
	
	
	$("#btnExcel").click(function(){ 
    	
		 //return false;
		 psc0030Form.action = "psc0030EXCELREPORT.action?method=psc0030EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+document.getElementById("refdisplayFIM").innerHTML;
		 psc0030Form.submit();
});
	
	
	
});	

</script>




<script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});


</script>

<script>

$(document).ready(function(){
	var btn=1;
	 $("#btnpre").prop("disabled",true);
  $("#tb1").show();
  
  $("#btnpre").on("click",function(){
		btn--;
		if(btn==1){
			 $("#btnpre").prop("disabled",true);
			 $("#btnnext").prop("disabled",false);
			 $("#li1").addClass("active");
			 $("#li2").removeClass("active");
		}else{
			 $("#btnpre").prop("disabled",false);
			 $("#btnnext").prop("disabled",true);
			 $("#li2").addClass("active");
			 $("#li1").removeClass("active");
		}
  });
  $("#btnnext").on("click",function(){
		btn++;
		if(btn==2){
			 $("#btnnext").prop("disabled",true);
			 $("#btnpre").prop("disabled",false);
			 $("#li2").addClass("active");
			 $("#li1").removeClass("active");
		}else{
			 $("#btnnext").prop("disabled",false);
			 $("#btnpre").prop("disabled",true);
			 $("#li1").addClass("active");
			 $("#li2").removeClass("active");
		}
  });
});
</script>


<script>
function functionli(a){
	$(".table").hide();
	$("#tb"+a).show();
if(a==1){
	
	$("#btnpre").prop("disabled",true);
	 $("#btnnext").prop("disabled",false);
	 $("#li1").addClass("active");
	 $("#li2").removeClass("active");
}else if(a==2){
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li2").addClass("active");
	 $("#li1").removeClass("active");
}
}
</script>

<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	$("#sumfirst").on("click",function(){
		
		location.href = "XBRL_REP_PSC0030_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
 	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>'); 
 
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_PSC0030_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$('#btnback').on('click', function(e){
	    e.preventDefault();
	    window.history.back();
	});
	$('#btnExcel').click(function() {
		
		 PSC0030Form.action = "PSC0030EXCELREPORT.action?method=PSC0030EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 PSC0030Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 PSC0030Form.action = "PSC0030EXCELSum.action?method=PSC0030EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 PSC0030Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 PSC0030Form.action = "PSC0030PDFREPORT.action?method=PSC0030PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 PSC0030Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  PSC0030Form.action = "XMLDOWNLOAD.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 PSC0030Form.submit(); 
	});
	var save=0;

$('#btnSave').on("click",function() {
	
	  var datasum={
			"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>'
	};
	$.ajax({
		url:"saveSum",
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
		
		}
	});  
	  
	 
});

	/* $("#addrow").on("click",function(){
		var rowno=$("#rowno").val();
		$("#addrowno").val("1"); 
		$("#pymdets").prepend("<tr><td id='modes_row"+rowno+"'><input type='text' id='modes_text"+rowno+"' style='width: 47px;'></td><td id='chqno_row"+rowno+"'><input type='text'  id='chqno_text"+rowno+"' style='    width:117px;'></td><td id='accno_row"+rowno+"'><input type='text' id='accno_text"+rowno+"' style='     width: 121px;'></td><td id='accname_row"+rowno+"'><input type='text' 	id='accname_text"+rowno+"' style='    width: 242px;'></td><td id='trdate_row"+rowno+"'><input type='text' id='trdate_text"+rowno+"' style='    width: 100px;'></td><td id='chqamt_row"+rowno+"' class='sumder alnum'><input type='text'  id='chqamt_text"+rowno+"'  class='decimalPt roundUp'  style='    width: 115px;'><td hidden id='rcrusrid_row"+rowno+"'></td><td hidden id='rcrtme_row"+rowno+"'></td><td hidden id='lchusrid_row"+rowno+"'></td><td hidden id='lchtme_row"+rowno+"'></td><td hidden id='del_row"+rowno+"'></td></td><td id='crncy_row"+rowno+"'><input type='text' id='crncy_text"+rowno+"' style='    width: 52px;'></td><td><input type='radio' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')></td></tr>");


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


		}); */


		
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
		$("#tab1").show();
		$(".det").addClass("clr");
		$(".psc0500,.psc0501").hide();
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
		 var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "psc0030details",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : true,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#pymdets tr").remove();
					 
					
					var b=JSON.parse(res.detPSC0030);
					 console.log(b);
					
					
				
				
						 	if(f=="onload"){
						 		$("#modify").show();
						 		for(var i=0;i<b.length;i++){
						 			
						 		  $("#pymdets").append("<tr><td id='applno"+srno+"'>"+b[i].applno+"</td><td id='applname"+srno+"'>"+b[i].aplcantname+"</td><td id='schmtyp"+srno+"'>"+b[i].schmtyp+"</td><td id='curr"+b[i].curr+"'></td><td id='outbal"+srno+"'>"+b[i].outstndingamt+"</td><td id='intrate"+srno+"'>"+b[i].intrate+"</td><td id='accopndate"+srno+"'>"+b[i].actopndate+"</td><td id='recvddate"+srno+"'>"+b[i].rcvddate+"</td><td id='appdate"+srno+"'>"+b[i].apprvddate+"</td><td id='rejctddate"+srno+"'>"+b[i].rejctdate+"</td><td id='rejreason"+srno+"'>"+b[i].rejctdreason+"</td><td><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>") ;  
						 		  
						 		 
								
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 	
						 		$("#modify").hide();//modify in the header hide
						 		for(var i=0;i<b.length;i++){
						 			
						 			$("#pymdets").append("<tr><td id='applno"+srno+"'>"+b[i].applno+"</td><td id='applname"+srno+"'>"+b[i].aplcantname+"</td><td id='schmtyp"+srno+"'>"+b[i].schmtyp+"</td><td id='curr"+b[i].curr+"'></td><td id='outbal"+srno+"'>"+b[i].outstndingamt+"</td><td id='intrate"+srno+"'>"+b[i].intrate+"</td><td id='accopndate"+srno+"'>"+b[i].actopndate+"</td><td id='recvddate"+srno+"'>"+b[i].rcvddate+"</td><td id='appdate"+srno+"'>"+b[i].apprvddate+"</td><td id='rejctddate"+srno+"'>"+b[i].rejctdate+"</td><td id='rejreason"+srno+"'>"+b[i].rejctdreason+"</td></tr>") ;  
							 		  
							 		  
								 
								
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
		$("#tab1").hide();
		$(".summ").addClass("clr");
			
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
				
				  /* $("#divLoading").addClass("show");  */
				
				 $(".repdisp").text(refno);
				 if(a=="PSC0500" || a=="psc0500"){
						$(".psc0500").show();
						$(".psc0501").hide();
						
						$("#test tr").children().detach().remove();
						
						 var rptdate1 = {
								  "dt1" : d,"dt2":e,"reportrefnos":refno,"curr":g,"reptype":a
								}; 
						 
						 $.ajax({
						     url : "PSC0030SUM",
						     data : rptdate1  ,
								dataType : 'json', 
								type : 'POST',
								async : true,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							console.log(res.summaryPSC0030);
						
							var b=JSON.parse(res.summaryPSC0030);
							
							var k=1;
							var cnt1=1;
							
							
							for (var i = 0; i < 3; i++) {
							
								$("#sec1").append("<tr><td id='stschm"+cnt1+"'>"+b[i].instname+"</td><td id='instcode"+cnt1+"'>"+b[i].instcode+"</td><td id='stlapp"+cnt1+"'>"+b[i].loanapprvd+"</td><td id='amtout"+cnt1+"'>"+b[i].outstndingamt+"</td><td><input type=radio style=width: 15px; onclick=fnloads("+cnt1+") id='edit"+cnt1+"'></td></tr>");
								
							
								cnt1++;
								
							} 
							for (var i = 3; i < 6; i++) {
								
								$("#sec2").append("<tr><td id='stschm"+cnt1+"'>"+b[i].instname+"</td><td id='instcode"+cnt1+"'>"+b[i].instcode+"</td><td id='stlapp"+cnt1+"'>"+b[i].loanapprvd+"</td><td id='amtout"+cnt1+"'>"+b[i].outstndingamt+"</td><td id='min"+cnt1+"'>"+b[i].minintrate+"</td><td id='max"+cnt1+"'>"+b[i].maxintrate+"</td><td><input type=radio style=width: 15px; onclick=fnloads("+cnt1+") id='edit"+cnt1+"'></td></tr>");
								
							
								cnt1++;
								
							} 
							
							  $("#divLoading").removeClass('show'); 
							 $('.alnum').mask("#,##0.00", {reverse: true});
							
								 }
								 }); 
					}else{
						$(".psc0501").show();
						$(".psc0500").hide();
						$("#test tr").children().detach().remove();
						
						var rptdate1 = {
								  "dt1" : d,"dt2":e,"reportrefnos":refno,"curr":g,"reptype":a
								}; 
						 
						 $.ajax({
						     url : "PSC0030SUM",
						     data : rptdate1  ,
								dataType : 'json', 
								type : 'POST',
								async : true,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							console.log(res.summaryPSC0030);
						
							var b=JSON.parse(res.summaryPSC0030);
							
							var k=1;
							var cnt1=1;
							
							
							for (var i = 0; i < b.length; i++) {
							
								
								//$('.alnum').mask("#,##0.00", {reverse: true});
					$("#section1").append('<tr><td>'+cnt1+'</td><td id="applsubon'+cnt1+'">'+b[i].apsubdate+'</td><td id="name'+cnt1+'">'+b[i].name+'</td><td id="reason'+cnt1+'">'+b[i].rejctdreason+'</td><td><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td></tr>');
					
							
								cnt1++;
								
							} 
							
							  $("#divLoading").removeClass('show'); 
							 $('.alnum').mask("#,##0.00", {reverse: true});
							
								 }
								 });
					}
				 
	 }
	 }
function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_PSC0030_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</SCRIPT>
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
	border-color: rgba(18, 18, 19, 0.22);
}

.modal-footer {
	text-align: center;
	border-top: 0;
	padding: 25px;
	padding-right: 208px;
}

.navright {
	/* background-color: rgb(238, 238, 238); */
	background-image: none;
	background-repeat: no-repeat;
	width: 100%;
	border-radius: 4px;
	float: right;
	height: 30px;
}

li  .active a {
	backround-color: #f1efef;
}

.headingtab {
	font-size: 11px;
	line-height: 0.428971;
}
</style>

<body>


	<div class="container">

		<div class="loader"></div>

		<form class="form-horizontal" method="post" name="psc0030Form"
			enctype="multipart/form-data">
			<div class="tab-content">
				<div class="active psc0500" id=""
					style="width: 968px; padding-top: 1px; margin-top: -17px;">
					<div style="margin-top: 40px;">
						<font size="2" style="font-size: 13px;"><b><%=reptype%> - Student Loan
								Scheme<b id="sub" Style="display: none"></b>
						</b></font> <br> <b style="font-size: 13px;"> <b
							id="sub" style="display: none"></b></b>
					</div>
					<ul class="nav nav-tabs navright" id="mytab" style="width: 100%;">

						<li class=" pull-right list" id="li2" onclick="functionli(2);"><a
							href="#tab2" data-toggle="tab"><span class="headingtab">2</span></a></li>


						<li class=" pull-right active list" id="li1"
							onclick="functionli(1);"><a href="#tab1" data-toggle="tab"><span
								class="headingtab"> 1 </span></a></li>




					</ul>
					<table class="" style="width: 100%; height: 50px;">
						<tr>
							<td style="background-color: #bbc3cb;"><font size="1"><b
									style="color: #0c1190; font-size: 11px;"> Report Ref No : </b></font>
								<font size="1"><b
									style="color: #0c1190; font-size: 11px;" class="repdisp"
									id="refDisplay"></b></font></td>
							<td
								style="text-align: center; background-color: #bbc3cb; width: 325px;"></td>
							<td style="background-color: #bbc3cb; text-align: right;">
								<a class="btn btn-xs btn-primary det" href="#tab1" id="det"
								data-toggle="tab"><span class="headingtab"> Details </span></a>
								<a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span
									class="headingtab ">Summary </span></a> <a id="btndwnld"><i
									class="glyphicon glyphicon-download-alt"
									style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><select
								id="dnloadfrmt" style="border-radius: 4px; margin-left: 10px;"><option
										value="pdf">pdf</option>
									<option value="excel">Excel</option></select>
							</td>
						</tr>
					</table>

					<table class="table" id="tb1"
						style="width: 100%; display: none; margin-top: -20px;">
						<tr>
							<th colspan="5"
								style="font-size: 13px; text-align: center"><b>Student
									Loan - Government Guaranteed Scheme </b></th>
						</tr>
						<tr>
							<th rowspan="2" style="text-align: center">Student loan
								Scheme</th>
							<th rowspan="2"></th>
							<th style="text-align: center">Student Loan Approved</th>
							<th style="text-align: center">Amount Outstanding</th>
							<th style="text-align: center" rowspan="2">Select</th>
						</tr>
						<tr>
							<th style="text-align: center">A</th>
							<th style="text-align: center">B</th>
						</tr>
						<tbody id="sec1"></tbody>
					</table>

					<table class="table" id="tb2"
						style="width: 100%; display: none; margin-top: -20px;">
						<tr>
							<th colspan="7"
								style="text-align: center; font-size: 13px; text-align: center"><b>Student
									Loans - Normal Banking Terms And Conditions</b></th>
						</tr>
						<tr>
							<th rowspan="3" style="text-align: center">Student loan</th>
							<th rowspan="3"></th>
							<th style="text-align: center" rowspan="2">Student Loan
								Approved</th>
							<th style="text-align: center" rowspan="2">Amount
								Outstanding</th>
							<th colspan="2" style="text-align: center">Range Of Interest
								Rate (%)</th>
							<th style="text-align: center" rowspan="3">Select</th>
						</tr>
						<tr>
							<th style="text-align: center">Min</th>
							<th style="text-align: center">Max</th>
						</tr>
						<tr>
							<th style="text-align: center">C</th>
							<th style="text-align: center">D</th>
							<th style="text-align: center">E</th>
							<th style="text-align: center">F</th>
						</tr>
						<tbody id="sec2"></tbody>
					</table>
					<div class="modal-footer">
						<button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
						<!-- <button type="button" class="btn btn-xs btn-primary"
							onclick="functionli(1);" value="back" id="btnpre">Previous</button> -->

						<button type="button" class="btn btn-xs btn-primary" value="Excel"
							id="btnSave">Save</button>

						<button type="button" class="btn btn-xs btn-primary"
							style="display: none" value="Excel" id="btnXML">Gen XML
							Sum</button>

						<!-- <button type="button" class="btn btn-xs btn-primary"
							onclick="functionli(2);" value="back" id="btnnext">Next</button> -->
						<button type="button" class="btn btn-xs btn-primary" value="back"
							id="btnback">Back</button>
					</div>

				</div>
				<!-- psc0501 -->
				<div class="active psc0501" id=""
					style="width: 968px; padding-top: 1px; margin-top: -17px;">
					<div style=" margin-top: 40px;">
						<font size="2" style="font-size: 13px;"><b> <%=reptype%> - Names of the
								applicant for the Student Loan Under the Government Scheme whose
								applications have been rejected<b id="sub" Style="display: none"></b>
						</b></font><b
							id="sub" style="display: none"></b>
					</div>
					<br>
					<table class="table" style="width: 100%; height: 50px;">
						<tr>
							<td style="background-color: #bbc3cb;"><font size="1"><b
									style="color: #0c1190; font-size: 11px;"> Report Ref No : </b></font>
								<font size="1"><b
									style="color: #0c1190; font-size: 11px;" class="repdisp"
									id="refDisplay"></b></font></td>
							<td
								style="text-align: center; background-color: #bbc3cb; width: 325px;"></td>
							<td style="background-color: #bbc3cb; text-align: right;">
								<a class="btn btn-xs btn-primary det" href="#tab1" id="det"
								data-toggle="tab"><span class="headingtab"> Details </span></a>
								<a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span
									class="headingtab ">Summary </span></a> <a id="btndwnld"><i
									class="glyphicon glyphicon-download-alt"
									style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><select
								id="dnloadfrmt" style="border-radius: 4px; margin-left: 10px;"><option
										value="pdf">pdf</option>
									<option value="excel">Excel</option></select>
							</td>
						</tr>
					</table>
					<table class="table" id="tb"
						style="width: 100%; margin-top: -20px;">
						<tr>
							<th rowspan="2" style="text-align: center">Sr.no</th>
							<th style="text-align: center">Application submitted on</th>
							<th style="text-align: center">Name</th>
							<th style="text-align: center">Reason for rejection</th>
							<th style="text-align: center" rowspan="2">Select</th>
						</tr>
						<tr>
							<th style="text-align: center">A</th>
							<th style="text-align: center">B</th>
							<th style="text-align: center">C</th>
						</tr>

						<tbody id="section1"></tbody>
					</table>
					<div class="modal-footer">

						<button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>

						<button type="button" class="btn btn-xs btn-primary" value="Excel"
							id="btnSave">Save</button>

						<button type="button" class="btn btn-xs btn-primary"
							style="display: none" value="Excel" id="btnXML">Gen XML
							Sum</button>

						<button type="button" class="btn btn-xs btn-primary" value="back"
							id="btnback">Back</button>
					</div>

				</div>

				<!-- DETAIL TABLE -->

				<input type="hidden" id="rowno"> <input type="hidden"
					id="addrowno">
				<div class="active" id="tab1"
					style="width: 1778px; padding-top: 1px; margin-top: -17px; display: none">
					<div style=" margin-top: 40px;">
						<font size="2" style="font-size: 13px;"><b> <%=reptype%> - Student Loan
								Scheme<b id="sub" Style="display: none"></b>
						</b></font> 
						
						
						 <!-- <div style="float:right"><b
							id="sub" style="display: none"></b> <a
								class="btn btn-xs btn-primary det" href="#tab1" id="det"
								data-toggle="tab"><span class="headingtab"> Details </span></a>
								<a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span
									class="headingtab" id="sumfirst">Summary </span></a><a
								id="btnExcel"><i class="glyphicon glyphicon-download-alt"
									style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a
								class="btn btn-xs btn-primary add"
								style="width: 45px; margin-left: 15px;" href="#"
								data-toggle="tab"><span class="headingtab" id="addrow">Add
								</span></a> <a class="btn btn-default btn-xs btn-primary"
								style="margin-left: 10px;" id="btnfilter"><span
									class="glyphicon glyphicon-filter"></span> Filter</a></div> -->
					</div>
					<br>
					<div id="divLoading"></div>
					<table class="table" style="width: 1778px; height: 50px;">
						<tr>
							<td style="background-color: #bbc3cb; width: 250px;"><font
								size="1"><b style="color: #0c1190; font-size: 11px;">
										Report Ref No : </b></font> <font size="1"><b
									style="color: #0c1190; font-size: 11px;" class="repdisp"
									id="refDisplay"></b></font></td>
							<td
								style="text-align: right; background-color: #bbc3cb; width: 325px;"></td>
							<td style="background-color: #bbc3cb; text-align:right;"> <a
								class="btn btn-xs btn-primary det" href="#tab1" id="det"
								data-toggle="tab"><span class="headingtab"> Details </span></a>
								<a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span
									class="headingtab" id="sumfirst">Summary </span></a><a
								id="btnExcel"><i class="glyphicon glyphicon-download-alt"
									style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a
								class="btn btn-xs btn-primary add"
								style="width: 45px; margin-left: 15px;" href="#"
								data-toggle="tab"><span class="headingtab" id="addrow">Add
								</span></a> <a class="btn btn-default btn-xs btn-primary"
								style="margin-left: 10px;" id="btnfilter"><span
									class="glyphicon glyphicon-filter"></span> Filter</a> </td>
						</tr>
					</table>
					<div class="panel panel-primary filterable">


						<table class="table" id="tbcate" border="1"
							style="width: 100%; margin-top: -20px;">

							<thead>
								<tr class="filters">

									<th><input type="text" onkeyup="myFunction(this.id,0)"
										class="form-control2" id="applno"
										placeholder="Application Number" disabled></th>
									<!-- <th id="chalpha">Cheque Alpha</th>					 -->
									<th><input type="text" id="applname"
										onkeyup="myFunction(this.id,1)" class="form-control2"
										placeholder="Applicant Name" disabled></th>
									<th><input type="text" id="schmtyp"
										onkeyup="myFunction(this.id,2)" class="form-control2"
										placeholder="Scheme Type" disabled></th>
									<th style=""><input type="text" id="curr"
										onkeyup="myFunction(this.id,3)" class="form-control2"
										placeholder="Currency" disabled></th>
									<th><input type="text" id="outbal" class="form-control2"
										onkeyup="myFunction(this.id,4)"
										placeholder="Outstanding Balance" disabled></th>
									<!-- <th id="valdate">Value Date</th> -->
									<th style=""><input type="text" id="intrate"
										onkeyup="myFunction(this.id,5)" class="form-control2"
										placeholder="Interest Date" disabled></th>
									<th><input type="text" class="form-control2"
										id="accopndate" onkeyup="myFunction(this.id,6)"
										placeholder="Account Open Date" disabled></th>
									<th><input type="text" class="form-control2"
										id="recvddate" onkeyup="myFunction(this.id,7)"
										placeholder="Received Date" disabled></th>
									<th><input type="text" class="form-control2" id="appdate"
										onkeyup="myFunction(this.id,8)" placeholder="Approved Date"
										disabled></th>
									<th><input type="text" class="form-control2" id="rejdate"
										onkeyup="myFunction(this.id,9)" placeholder="Rejected Date"
										disabled></th>
									<th><input type="text" class="form-control2" id="rejdate"
										onkeyup="myFunction(this.id,10)"
										placeholder="Rejection reason" disabled></th>
									<th id="modify">Modify</th>

								</tr>

							</thead>

							<tbody class="databody" id="pymdets">





							</tbody>



						</table>

					</div>
				</div>


			</div>








		</form>


	</div>





</body>
</html>