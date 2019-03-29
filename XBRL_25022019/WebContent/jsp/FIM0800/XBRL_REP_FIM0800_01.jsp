<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLFIM0800Bean,dao.XBRLFIM0800Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    <%@ page import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat"%>
    
<%
    DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Date date = new Date();
	
	String username = session.getAttribute("userName").toString();
    String curdate = dateFormat.format(date);
%>
  
    
  <%
  
  String trade = request.getParameter("trade");
  String dt1 = request.getParameter("dt1");
  String dt2 = request.getParameter("dt2");
  
  String reptype=request.getParameter("reptype");
  String curr = request.getParameter("curr");
  String typo=request.getParameter("typo");
 // String ReporefSeq = request.getParameter("ReporefSeq");
 String types=request.getParameter("types");

 String instno = request.getParameter("instno");
 String ReporefSeq = request.getParameter("ReporefSeq");
  
 
  DecimalFormat df = new DecimalFormat("##,##.00");
   
   
  %>
 
 
 
  

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
.clr{
color: #0c0b0b;
    background-color: #f5f5f5;
    border-color: #f5f5f5;
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
.tables {
    width: 109%;
    max-width: 117%;
    margin-bottom: 20px;
}


.glyphicon {
   
    font-weight: 600;
   
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




.tab-content .tab-pane {
  display: none;
}

.tab-content .tab-pane.active {
  display: block;
}

.next, .previous {
  cursor: pointer;
}


.databody td{
border:1px solid #ddd;
}

textarea {
	text-align: center;
	overflow: hidden;
	resize: none;
	height: 40px;
	border: none;
	background-color: #f5f5f5;
	white-space: pre-wrap;
	word-wrap: break-word;
	resize: none;
	color: #a9a9a9;
	-webkit-text-fill-color: #333333;
}		


</style> 



<%-- <script>

$(document).ready(function(){
	
	
		
	 
	 
	
	
	

$( "#btngen").click(function() {
	alert("XML Download++++++++>>>>>");
	var kd='<%=eid%>';
	CategoryForm.action="downXML.action?method=gani&eid="+'<%=eid%>';
	CategoryForm.submit();
	});
});	

</script> --%>


<!-- <script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});
</script>
 -->








 


<script>
function myFunction(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("FIMdets");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==1 || b==2 || b==4 ||b==7 || b==8||b==9 ||b==10 ){
		
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
 .ui-dialog-titlebar-close {
    visibility: hidden;
}	 

.hidden {
  display: none;
}
</style>



<script>
$(document).ready(function(){
	var det={
			"repdate":'<%=dt2%>',"type":"chckmodified"
		};
		$.ajax({
			url:"FIM0800chckmodified",
			data:det,
			dataType:'json',
			type:'POST',
			async:true,
			success:function(res){
				console.log(res.cnt);
				if(res.cnt>0){
					$("#modflg").val("Y");
					$("#msg").html('Verification pending for some records');
					$( "#dialog-confirm" ).dialog({
					      resizable: false,
					      closeOnEscape: false,
					      height: "auto",
					      width: 400,
					      modal: true,
					      buttons: {
					        "OK": function() {
					        	$( this ).dialog( "close" );
					        	location.href = "XBRL_CRT_FIM0800_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
					        }
					      }
					    });
					
					
				}else{
					$("#modflg").val("N");
				}
			}
		});
		
		
	$("#sumfrst").click(function(){
		
		 location.href = "XBRL_REP_FIM0800_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		 });	
	
	$("#summaryfirst").click(function(){
		
		 location.href = "XBRL_REP_FIM0800_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		 });	
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	

	
});	

</script>




<script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
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
	
	var save=0;
	$("#btnXML").show(); 
	 if(z=="load"){
		//FOR DETAILS
		$(".det").addClass("clr");
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
			
			 $(".repdisp").val(refno);
			 var srno=1;
			// $("#divLoading").addClass("show");
			 /*   $(".loader").fadeOut("slow"); */
			
				 var FIMd = {
						"reptype" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
					}; 
					
				$.ajax({
					url : "FIM0800details",
					data : FIMd,
					dataType : 'json',
					type : 'POST',
					async : true,
					success : function(res) {	
					//	alert("refeDCG100"+refeDCG100);
						
						  $("#FIMdets tr").remove();
							var cnt1=1;
						
						var b=JSON.parse(res.detailFIM0800);
						 console.log(b);
						
						
						
					
							 	if(f=="onload"){
							 		$("#modify").show();
							 		for(var i=0;i<b.length;i++){
							 			
							 		  $("#FIMdets").append(
												 
					
			                   			'<tr  id="fimadd'+cnt1+'"><td id="srlno_row'+cnt1+'">'+b[i].srlno+'</td><td id="trade1_row'+cnt1+'">'+b[i].trade1+'</td><td id="valdate1_row'+cnt1+'">'+b[i].valdate1+'</td><td  id="typtrn1_row'+cnt1+'">'+b[i].typtrn1+'</td><td id="acntno1_row'+cnt1+'">'+b[i].acntno1+'</td><td id="cntprty1_row'+cnt1+'">'+b[i].cntprty1+'</td><td id="ccntprtycode1_row'+cnt1+'">'+b[i].ccntprtycode1+'</td><td class="sumder" id="nominalamt1_row'+cnt1+'">'+b[i].nominalamt1+'</td><td class="sumder" id="yields1_row'+cnt1+'">'+b[i].yields1+'</td><td class="sumder" id="clanpr1_row'+cnt1+'">'+b[i].clanpr1+'</td><td id="matudat1_row'+cnt1+'">'+b[i].matudat1+'</td><td id="residudat1_row'+cnt1+'">'+b[i].residudat1+'</td><td id="isin1_row'+cnt1+'">'+b[i].isin1+'</td><td style="text-align:center;"><input type="button" id="edit_button'+cnt1+'" value="Edit" class="btn btn-xs btn-primary edit" style="width: 37px;" onclick=edit_row("'+cnt1+'")>  <input type="button" id="save_button'+srno+'" value="Save" class="btn btn-xs btn-primary save" style="width: 37px; display:none;" onclick=save_row("'+cnt1+'")><input type="button" id="Cancel_button'+srno+'" value="Cancel" class="btn btn-xs btn-primary Cancel" style="width: 44px; display:none; " onclick=Cancel_row("'+cnt1+'")><input type="button" id="Cancel_btn'+srno+'" value="Cancel" class="btn btn-xs btn-primary Cancel1" style="width: 44px; display:none; " onclick=Canedit_row("'+cnt1+'")><input type="button" id="del_button'+srno+'" value="Delete" class="btn btn-xs btn-primary delete" style="width: 39px;" onclick=savedel_row("'+cnt1+'")></td></tr>');

									 srno++;
									 cnt1++;
									 
									 
										} $("#divLoading").removeClass('show');
									$("#rowno").val(srno);
							 	}else if(f=="frmsum"){
							 		$(".add").hide();//add button hide
							 	
							 		$("#modify").hide();//modify in the header hide
							 		for(var i=0;i<b.length;i++){
							 			
		
				$("#FIMdets").append('<tr><td id="srlno_row'+cnt1+'">'+b[i].srlno+'</td><td id="trade1_row'+cnt1+'">'+b[i].trade1+'</td><td id="valdate1_row'+cnt1+'">'+b[i].valdate1+'</td><td class="alnum" id="typtrn1_row'+cnt1+'">'+b[i].typtrn1+'</td><td id="acntno1_row'+cnt1+'">'+b[i].acntno1+'</td><td id="cntprty1_row'+cnt1+'">'+b[i].cntprty1+'</td><td id="ccntprtycode1_row'+cnt1+'">'+b[i].ccntprtycode1+'</td><td id="nominalamt1_row'+cnt1+'">'+b[i].nominalamt1+'</td><td id="yields1_row'+cnt1+'">'+b[i].yields1+'</td><td id="clanpr1_row'+cnt1+'">'+b[i].clanpr1+'</td><td id="matudat1_row'+cnt1+'">'+b[i].matudat1+'</td><td id="residudat1_row'+cnt1+'">'+b[i].residudat1+'</td><td id="isin1_row'+cnt1+'">'+b[i].isin1+'</td></tr>');

									
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
			
			 $(".repdisp").val(refno);
			
				$("#test tr").children().detach().remove();
			
				var rptdate1 = {
						  "dt1" : d,"dt2":e,"reportrefnos":refno,"curr":g
						}; 
				 
				 $.ajax({
				     url : "FIM0800SUM",
				     data : rptdate1  ,
						dataType : 'json', 
						type : 'POST',
						async : true,
						 success : function(res) {
							 //console.log(res.refnoAB);
					
					console.log(res.summaryFIM0800);
				
					var b=JSON.parse(res.summaryFIM0800);
					
					var k=1;
					var cnt1=1;
					
					
					for (var i = 0; i < b.length; i++) {
					
					
						//$('.alnum').mask("#,##0.00", {reverse: true});
					
					
						
						$("#test").append('<tr><td id="sno'+cnt1+'">'+b[i].sno+'</td><td id="trade'+cnt1+'">'+b[i].trade+'</td><td id="valdate'+cnt1+'">'+b[i].valdate+'</td><td  id="typtrn'+cnt1+'">'+b[i].typtrn+'</td><td id="acntno'+cnt1+'">'+b[i].acntno+'</td><td id="cntprty'+cnt1+'">'+b[i].cntprty+'</td><td id="ccntprtycode'+cnt1+'">'+b[i].ccntprtycode+'</td><td class="sumder" id="nominalamt'+cnt1+'">'+b[i].nominalamt+'</td><td class="sumder" id="yields'+cnt1+'">'+b[i].yields+'</td><td class="sumder" id="clanpr'+cnt1+'">'+b[i].clanpr+'</td><td id="matudat'+cnt1+'">'+b[i].matudat+'</td><td id="residudat'+cnt1+'">'+b[i].residudat+'</td><td id="isin'+cnt1+'">'+b[i].isin+'</td><td style="text-align:center"><input type=radio style=width: 15px; onclick=fnloads('+cnt1+') id="edit'+cnt1+'"></td><tr>');	
						
						
						cnt1++;
						
					} 
					
					  $("#divLoading").removeClass('show'); 
					 $('.alnum').mask("#,##0.00", {reverse: true});
					
						 }
						 });	

	 
	
	 }
	
	
	 var datasum={
				"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>'
		};
	 

	 $.ajax({
			url:"savecheckFIM0800",
			data:datasum,
			dataType:'json',
			type:'POST',
			async:true,
			success : function(res) {
				
				/* $("#savecheck").val(res.cnt); */
			
					 			 	

				if(res.cnt1=="0"){
					save=0;	
					 $("#btnXML").prop("disabled",true); 
					
				
					
				}
				else
					{
					
					$("#btnXML").prop("disabled",false);
			save++;
					
					
				}
				 
				 $("#savecheck").val(save);
				 
			}
		
	
		
		
		}); 
	
	
	
	
	
	
	
	
}
function fnloads(cnt){
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_FIM0800_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").val()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>';
	
}
</script>

<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	$('#btnExcel').click(function() {
		
		 FIM0800Form.action = "FIM0800EXCELREPORT.action?method=FIM0800EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 FIM0800Form.submit();
	});
	 $("#sumfrst").click(function(){
		 
		    	
		    		  location.href = "XBRL_REP_FIM0800_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		    		
		 });
	
	$("#addrowno").val("0");
	
	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>');
	
	$(".det").on("click",function(){
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_FIM0800_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '#btnback').click(function() {
		 location.href="XBRL_CRT_FIM0800_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 FIM0800Form.action = "FIM0800EXCELSum.action?method=FIM0800EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 FIM0800Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 FIM0800Form.action = "FIM0800PDFREPORT.action?method=FIM0800PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 FIM0800Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  FIM0800Form.action = "XMLDOWNLOADfim800.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 FIM0800Form.submit(); 
	});
	 
	  $("#btnfilter").on("click",function(){
		 
			if($(".form-control2").prop("disabled")==true){
				$(".form-control2").prop("disabled",false);
				
				

				 $('#srlno,#trade1,#valdate1,#typtrn1,#acntno1,#cntprty1,#ccntprtycode1,#nominalamt1,#yields1,#clanpr1,#matudat1,#residudat1,#isin1').css({
					
						'text-align':'center',
						'height':'46px',
						'white-space':'pre-wrap',
						'scroll':'none',
						'word-wrap':'break-word',
						'resize':'none',
						'background-color': 'white',
						'border':'1px solid',
						'color':' rgb(21, 19, 19)',
						'border-color':'#a9a9a9',
						'-webkit-text-fill-color': 'rgb(117, 117, 117)'
						}); 
			}else{
				
				$(".form-control2").val("");
				$(".form-control2").prop("disabled",true);$(".form-control2").val("");
				$(".form-control2").prop("disabled",true);
				
				 $('#srlno,#trade1,#valdate1,#typtrn1,#acntno1,#cntprty1,#ccntprtycode1,#nominalamt1,#yields1,#clanpr1,#matudat1,#residudat1,#isin1').css({

					 'text-align':'center',
						'height':'46px',
						'white-space':'pre-wrap',
						'scroll':'none',
						'word-wrap':'break-word',
						'resize':'none',
						'background-color': '#f5f5f5',
						'border':'none',
						'-webkit-text-fill-color': '#333333'
						}); 
				 
				  var   table, tr, td, i;
				  
					 table = document.getElementById("FIMdets`");
					 tr = table.getElementsByTagName("tr");
					 for (i = 0; i < tr.length; i++) {
						 
							 
							 tr[i].style.display = ""; 
							 
					 
						 
					 }
				
			}
		});
	var hh=0;

	 $('#btnSave').on("click",function() {
	 	 
	 		
	 	if((hh==0)&&($("#savecheck").val()==0)){
	 		
	 			if($("#savecheck").val()==0){
	 	
	 				var datasum={
	 						"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").val()
	 				};
	 				 $("#divLoading").addClass('show');
	 				$.ajax({
	 					url:"saveSumf8",
	 					data:datasum,
	 					
	 					dataType:'json',
	 					type:'POST',
	 					async:true,
	 					success:function(res){
	 						 $("#divLoading").removeClass('show');

	 						alert("Saved Successfully");
	 						 $("#btnXML").prop("disabled",false);
	 					}
	 				
	 				}); 
	 				
	 			}
	 		
	 	}	else
	 				{
	 				
				
				 $("#msg").html("Report already exist, do you want to replace it?");
	 				  $( "#dialog-confirm" ).dialog({
	 				      resizable: false,
	 				      height: "auto",
	 				      width: 400,
	 				      modal: true,
	 				      
	 				     
	 				      buttons: {
	 				        "OK": function() {
	 				        	
	 				        	$( this ).dialog( "close" );
	 				        	
	 				        	var datasum={
	 				   				"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").val()
	 				   		};
	 			 			 	$("#divLoading").addClass('show'); 

	 				   		$.ajax({
	 				   			url:"saveSumf8",
	 				   			data:datasum,
	 								dataType:'json',
	 								type:'POST',
	 								async:true,
	 								success:function(res){
	 		 							 $("#divLoading").removeClass('show');

	 									alert("Saved Successfully");
	 									
	 							
	 								}
	 							});  
	 				        			        
	 				  
	 				      },
	 				      Cancel: function() {
	 				          $( this ).dialog( "close" );
	 				        }
	 				      }
	 				  
	 				    });
	 				
	 			}
	 	
	 	hh++;	
	  
	 });



		});




</script>
<script>
var modtyp;
<<<<<<< .mine
$(document).ready(function(){
||||||| .r80
$("#addrow").on("click",function(){
	
=======

$("#addrow").on("click",function(){
	
>>>>>>> .r106
	$("#addrow").on("click",function(){

	var rowno=$("#rowno").val();
	modtyp="A";
	$("#addrowno").val("1"); 
	$("#FIMdets").prepend("<tr id='fimadd"+rowno+"'><td><textarea type='text' placeholder='Auto Generated' style='-webkit-text-fill-color: black;width: 56px;word-wrap:break-word;border:1px solid;' disabled></textarea></td><td id='trade1_row"+rowno+"'><input type='text' id='trade1_text"+rowno+"' style='width: 63px;'></td><td id='valdate1_row"+rowno+"'><input type='text'  id='valdate1_text"+rowno+"' style='    width:65px;'></td><td id='typtrn1_row"+rowno+"'><input type='text' id='typtrn1_text"+rowno+"' style='     width: 56px;'></td><td id='acntno1_row"+rowno+"'><input type='text' id='acntno1_text"+rowno+"' style='     width: 100px;'></td><td id='cntprty1_row"+rowno+"'><input type='text' id='cntprty1_text"+rowno+"' style='     width: 129px;'></td><td id='ccntprtycode1_row"+rowno+"'><input type='text' id='ccntprtycode1_text"+rowno+"' style='     width: 87px;'></td><td class='sumder' id='nominalamt1_row"+rowno+"'><input type='text' id='nominalamt1_text"+rowno+"' style='     width: 100px;'></td><td class='sumder' id='yields1_row"+rowno+"'><input type='text' id='yields1_text"+rowno+"' style='     width: 75px;'></td><td  class='sumder' id='clanpr1_row"+rowno+"'><input type='text' id='clanpr1_text"+rowno+"' style='     width: 77px;'></td><td id='matudat1_row"+rowno+"'><input type='text' id='matudat1_text"+rowno+"' style='     width: 87px;'></td><td id='residudat1_row"+rowno+"'><input type='text' id='residudat1_text"+rowno+"' style='     width: 81px;'></td><td id='isin1_row"+rowno+"'><input type='text' id='isin1_text"+rowno+"' style='     width: 51px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");
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
		}); });

}); 

function fnkeyup(a){
	$("#trade1_text"+a).datepicker({
	dateFormat: "dd-mm-yy",
	        changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: "today"
	});


	$("#valdate1_text"+a).datepicker({
	dateFormat: "dd-mm-yy",
	        changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: "today"
	});
	
	
	$("#matudat1_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
		        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
		});	
	$("#residudat1_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
		        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
		});	
}
function edit_row(no)
{
	  var	nominalamt1 =  document.getElementById("nominalamt1_row"+no);


	$(".add").prop("disabled",true);

	/*  	  document.getElementById("del_button"+no).style.display="none";
	 */
	 $("#del_button"+no).addClass('hidden');
	$("#addrowno").val("0");
	modtyp="M";
 	document.getElementById("edit_button"+no).style.display="none";
 	  document.getElementById("save_button"+no).style.display="inline-block";
 	 document.getElementById("Cancel_btn"+no).style.display="inline-block";
 	document.getElementById("Cancel_button"+no).style.display="none";
 

  alert("gggg1");
  var	nominalamt1 =  document.getElementById("nominalamt1_row"+no);
  var	yields1 =  document.getElementById("yields1_row"+no);   
 var	clanpr1 =  document.getElementById("clanpr1_row"+no);
 
  
 var	nominalamt1_data = nominalamt1.innerHTML;
 var	yields1_data =yields1.innerHTML;
 var	clanpr1_data = clanpr1.innerHTML; 
 

 alert("gggg1");

  
 
 nominalamt1.innerHTML="<input type='text' class='decimalPt roundUp'  id='nominalamt1_text"+no+"'  style='width: 83px'; value='"+nominalamt1_data+"'>";
 
 yields1.innerHTML="<input type='text' class='decimalPt roundUp' id='yields1_text"+no+"' style='width: 83px'; value='"+yields1_data+"'>";
 alert("gggg1");

 clanpr1.innerHTML="<input type='text' class='decimalPt roundUp' id='clanpr1_text"+no+"' style='width: 83px'; value='"+clanpr1_data+"'>";
 //price.innerHTML="<input type='text' class='decimalPt roundUp' id='price_text"+no+"' style='width: 83px'; value='"+price_data+"'>"; 
  alert("gggg1");


 
 
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
	
var error="N";
	
	if (modtyp=="M"){
		
		
		if(document.getElementById("nominalamt1_text"+no).value==""){
			alert("Enter Nominal Amount of security ..");
			error="Y"
		}else if(document.getElementById("yields1_text"+no).value==""){
			alert("Enter Yields Amount of security..");	
			error="Y"
		}else if(document.getElementById("clanpr1_text"+no).value==""){
			alert("Enter Clean Price  of security..");
			error="Y"
		}
		
		
		
	} else if (modtyp=="A") {
		
	

		if(document.getElementById("trade1_text"+no).value==""){
			alert("Enter trade ..");	
			error="Y"
		}else if(document.getElementById("valdate1_text"+no).value==""){
			alert("Enter value date ..");
			error="Y"
		}
		
		else if(document.getElementById("typtrn1_text"+no).value==""){
			alert("Enter type of transaction ..");
			error="Y"
		}
		else if(document.getElementById("acntno1_text"+no).value==""){
			alert("Enter account number of  security..");
			error="Y"
		}
		else if(document.getElementById("cntprty1_text"+no).value==""){
			alert("Enter Name of counter party ..");
			error="Y"
		}else if(document.getElementById("ccntprtycode1_text"+no).value==""){
			alert("Enter counter party code ..");
			error="Y"
		}else if(document.getElementById("nominalamt1_text"+no).value==""){
			alert("Enter Nominal Amount of security ..");
			error="Y"
		}else if(document.getElementById("yields1_text"+no).value==""){
			alert("Enter Yields Amount of security..");	
			error="Y"
		}else if(document.getElementById("clanpr1_text"+no).value==""){
			alert("Enter Clean Price  of security..");
			error="Y"
		}else if(document.getElementById("matudat1_text"+no).value==""){
			alert("Enter Maturity date ..");
			error="Y"
		}
		else if(document.getElementById("residudat1_text"+no).value==""){
			alert("Enter Residual Days to Maturity ..");
			error="Y"
		}
		else if(document.getElementById("isin1_text"+no).value==""){
			alert("Enter ISIN ..");
			error="Y"
		}
		
	
		
	}
	
	
	
	if (error=="N"){
	
	$("#modflg").val("Y");
	modtyp="M";
	document.getElementById("edit_button"+no).checked = false;

	
	var nominalamt1_val=document.getElementById("nominalamt1_text"+no).value;
	
	document.getElementById("nominalamt1_row"+no).innerHTML=nominalamt1_val;
	
	
   var yields1_val=document.getElementById("yields1_text"+no).value;
	
	document.getElementById("yields1_row"+no).innerHTML=yields1_val;
	
	

   var clanpr1_val=document.getElementById("clanpr1_text"+no).value;
	
	document.getElementById("clanpr1_row"+no).innerHTML=clanpr1_val;
	
	
	if($("#addrowno").val()=="1"){
	
		modtyp="A";
		
	
		/* var  srlno_val=document.getElementById("srlno_text"+no).value;	 
	document.getElementById("srlno_row"+no).innerHTML=srlno_val; */

		var  trade1_val=document.getElementById("trade1_text"+no).value;	 
	document.getElementById("trade1_row"+no).innerHTML=trade1_val;
	
	
	var  valdate1_val=document.getElementById("valdate1_text"+no).value;	 
	document.getElementById("valdate1_row"+no).innerHTML=valdate1_val;
	
	var  typtrn1_val=document.getElementById("typtrn1_text"+no).value;	 
	document.getElementById("typtrn1_row"+no).innerHTML=typtrn1_val;
	
	var  acntno1_val=document.getElementById("acntno1_text"+no).value;	 
	document.getElementById("acntno1_row"+no).innerHTML=acntno1_val;
	
	var  cntprty1_val=document.getElementById("cntprty1_text"+no).value;	 
	document.getElementById("cntprty1_row"+no).innerHTML=cntprty1_val;
	
	var  ccntprtycode1_val=document.getElementById("ccntprtycode1_text"+no).value;	 
	document.getElementById("ccntprtycode1_row"+no).innerHTML=ccntprtycode1_val;
	
	var  matudat1_val=document.getElementById("matudat1_text"+no).value;	 
	document.getElementById("matudat1_row"+no).innerHTML=matudat1_val;
	
	var  residudat1_val=document.getElementById("residudat1_text"+no).value;	 
	document.getElementById("residudat1_row"+no).innerHTML=residudat1_val;
	
	var  isin1_val=document.getElementById("isin1_text"+no).value;	 
	document.getElementById("isin1_row"+no).innerHTML=isin1_val;
	
	  
	
	}
	
	else{
		document.getElementById("Cancel_button"+no).style.display="inline-block";
		document.getElementById("Cancel_btn"+no).style.display="none";
	}
	
	document.getElementById("edit_button"+no).style.display="inline-block";
	document.getElementById("save_button"+no).style.display="none";


<<<<<<< .mine
	/* var srlno=document.getElementById("srlno_row"+no).innerHTML; */
||||||| .r80
	var srlno=document.getElementById("srlno_row"+no).innerHTML;
=======
	 var srlno=document.getElementById("srlno_row"+no).innerHTML;
>>>>>>> .r106
	 var trade1=document.getElementById("trade1_row"+no).innerHTML;
	 var valdate1=document.getElementById("valdate1_row"+no).innerHTML;
	 var typtrn1=document.getElementById("typtrn1_row"+no).innerHTML;
	 var acntno1=document.getElementById("acntno1_row"+no).innerHTML;
	 var cntprty1=document.getElementById("cntprty1_row"+no).innerHTML;
	 var ccntprtycode1=document.getElementById("ccntprtycode1_row"+no).innerHTML;
	 var nominalamt1=document.getElementById("nominalamt1_row"+no).innerHTML;	 	
     var yields1=document.getElementById("yields1_row"+no).innerHTML;
	 var clanpr1=document.getElementById("clanpr1_row"+no).innerHTML;
	 var matudat1=document.getElementById("matudat1_row"+no).innerHTML;
	 var residudat1=document.getElementById("residudat1_row"+no).innerHTML;
	 var isin1=document.getElementById("isin1_row"+no).innerHTML;
	 

	 $("#fimadd"+no).addClass("rowaddedd");
	 $("#FIMdets td").attr("padding","8px");
	var refeFIM0800=document.getElementById("refDisplay").value;
	
	nominalamt1=nominalamt1.replace(/\,/g,'')
	  nominalamt1=Number(nominalamt1)

	yields1=yields1.replace(/\,/g,'')
	  yields1=Number(yields1)
	  
	  clanpr1=clanpr1.replace(/\,/g,'')
	  clanpr1=Number(clanpr1)
	
	 var rptdate1 = {
			     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>',"reportrefno": refeFIM0800,"trade1":trade1,"valdate1":valdate1,"typtrn1":typtrn1,"acntno1":acntno1,"cntprty1":cntprty1,"ccntprtycode1":ccntprtycode1,"nominalamt1":nominalamt1,"yields1":yields1,"clanpr1":clanpr1,"matudat1":matudat1,"residudat1":residudat1,"isin1":isin1,"modtyp":modtyp
			}; 
	 
	 $.ajax({
	     url : "FIM0800",
	     data : rptdate1  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 console.log(res.refno);
				//	alert("refeDCG100"+refeDCG100);
				alert("hjjjh");
				 
				 $(".repdisp").val(res.refno);
				 
				 $("#msg").html("Record Saved successfully");
		         $( "#dialog-confirm" ).dialog({
				      resizable: false,
				      closeOnEscape: false,
				      height: "auto",
				      width: 400,
				      modal: true,
				      buttons: {
				        "OK": function() {
				        	$( this ).dialog( "close" );
				        	

				        }
				      }
				    });
				
				
			}
		});
	

	
}
}
 
function savedel_row(no){
	 $("#msg").html("Are you sure you want to delete?");
	  $( "#dialog-confirm" ).dialog({
	      resizable: false,
	      height: "auto",
	      width: 400,
	      modal: true,
	      
	     
	      buttons: {
	        "OK": function() {
	        	modtyp="D";
	        	document.getElementById("edit_button"+no).checked = false;
	        	document.getElementById("edit_button"+no).style.display="inline-block";
	        	document.getElementById("save_button"+no).style.display="none";
	        	
	        	
	        	
	        	/* var srlno=document.getElementById("srlno_row"+no).innerHTML; */
	       	 var trade1=document.getElementById("trade1_row"+no).innerHTML;
	       	 var valdate1=document.getElementById("valdate1_row"+no).innerHTML;
	       	 var typtrn1=document.getElementById("typtrn1_row"+no).innerHTML;
	       	 var acntno1=document.getElementById("acntno1_row"+no).innerHTML;
	       	 var cntprty1=document.getElementById("cntprty1_row"+no).innerHTML;
	       	 var ccntprtycode1=document.getElementById("ccntprtycode1_row"+no).innerHTML;
	       	 var nominalamt1=document.getElementById("nominalamt1_row"+no).innerHTML;	 	
	            var yields1=document.getElementById("yields1_row"+no).innerHTML;
	       	 var clanpr1=document.getElementById("clanpr1_row"+no).innerHTML;
	       	 var matudat1=document.getElementById("matudat1_row"+no).innerHTML;
	       	 var residudat1=document.getElementById("residudat1_row"+no).innerHTML;
	       	 var isin1=document.getElementById("isin1_row"+no).innerHTML;
	        	
	       	var refeFIM0800=document.getElementById("refDisplay").value;
	    	
	    	nominalamt1=nominalamt1.replace(/\,/g,'')
	    	  nominalamt1=Number(nominalamt1)

	    	yields1=yields1.replace(/\,/g,'')
	    	  yields1=Number(yields1)
	    	  
	    	  clanpr1=clanpr1.replace(/\,/g,'')
	    	  clanpr1=Number(clanpr1)
	    	
	    	 var rptdate1 = {
	    			     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>',"reportrefno": refeFIM0800,"trade1":trade1,"valdate1":valdate1,"typtrn1":typtrn1,"acntno1":acntno1,"cntprty1":cntprty1,"ccntprtycode1":ccntprtycode1,"nominalamt1":nominalamt1,"yields1":yields1,"clanpr1":clanpr1,"matudat1":matudat1,"residudat1":residudat1,"isin1":isin1,"modtyp":modtyp
	    			}; 
	    	 
	    	 $.ajax({
	    	     url : "FIM0800",
	    	     data : rptdate1  ,
	    			dataType : 'json', 
	    			type : 'POST',
	    			async : true,
	    			 success : function(res) {
	    				 console.log(res.refno);
	        				
	        				 $("#refDisplay").val(res.refno);
		   
			  
	        				 $("#fimadd"+no).closest("tr").remove();

			   
	        				
	        			}
	        		});
	        	
	        	 $( this ).dialog( "close" );	        
	  
	      },
	      Cancel: function() {
	          $( this ).dialog( "close" );
	        }
	      }
	  

	      
	    });
	
}

function Cancel_row(no){
 /*  document.getElementById("del_button"+no).style.display="inline-block"; */
 
var detcancel={
		 
		"acntno1":$("#acntno1_row"+no).text(),"date":'<%=dt2%>'
	};
	
	 $.ajax({
	     url : "FIM0800cancel",
	     data : detcancel  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 
        /*  alert("Cancelation Successful"); */
       
         $("#msg").html("Cancellation successful");
         $( "#dialog-confirm" ).dialog({
		      resizable: false,
		      closeOnEscape: false,
		      height: "auto",
		      width: 400,
		      modal: true,
		      buttons: {
		        "OK": function() {
		        	$( this ).dialog( "close" );
		        	$("#del_button"+no).removeClass('hidden');
		        	location.reload(true);
		        }
		      }
		    });
         
         
         $("#Cancel_button"+no).hide();
         $("#Cancel_btn"+no).hide();
         
			}
		});
}
 
 function Canedit_row(no){
 $("#del_button"+no).removeClass('hidden');
 	
 var	nominalamt1 =  document.getElementById("nominalamt1_row"+no);
 var	yields1 =  document.getElementById("yields1_row"+no);   
var	clanpr1 =  document.getElementById("clanpr1_row"+no);

 
document.getElementById("nominalamt1_row"+no).innerHTML=nominalamt1_val;
document.getElementById("yields1_row"+no).innerHTML=yields1_val;
document.getElementById("clanpr1_row"+no).innerHTML=clanpr1_val;
		$("#edit_button"+no).show();
		/* document.getElementById("edit_button"+no).style.display="block"; */
		document.getElementById("save_button"+no).style.display="none";
		document.getElementById("Cancel_btn"+no).style.display="none";
		 location.reload(true); 
		 var nominalamt1=document.getElementById("nominalamt1_row"+no).innerHTML;
		 var yields1=document.getElementById("yields1_row"+no).innerHTML;
		 var clanpr1=document.getElementById("clanpr1_row"+no).innerHTML;
		  if($("#fimadd"+no).hasClass( "rowaddedd" )){
			  
			  document.getElementById("Cancel_button"+no).style.display="inline-block";


		  }else{
			  document.getElementById("Cancel_button"+no).style.display="none";
		  }
		  
		
 }

 
 function Canadd_row(no){
	 
	  /* document.getElementById("del_button"+no).style.display="inline-block"; */

																   

	 if($("#fimadd"+no).hasClass( "rowaddedd" )){
		
		var detcancel={
				"acntno1":$("#acntno1_row"+no).text(),"date":'<%=dt2%>'
		};
		

		 $.ajax({
		     url : "FIM0800cancel",
		     data : detcancel  ,
				dataType : 'json', 
				type : 'POST',
				async : true,
				 success : function(res) {
					 $("#msg").html("Cancellation successful");
			         $( "#dialog-confirm" ).dialog({
					      resizable: false,
					      closeOnEscape: false,
					      height: "auto",
					      width: 400,
					      modal: true,
					      buttons: {
					        "OK": function() {
					        	$( this ).dialog( "close" );
					        	
					        }
					      }
					    });
			         
			         
				}
			});
	 }
	 $("#fimadd"+no).remove();
	 
 }
</script> 



<body>
<div class="container">
   
   
   <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="FIM0800Form"
		enctype="multipart/form-data">
    <input type="hidden" id="savecheck">
										
    <div id="nav">
    
    
    <div class="loader"></div>
   <input type="hidden" id="modflg" >
   <input type="hidden" id="modtyp" >
         <div id="tab3" >
	
	 	<div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
    
  	
            
            	<div class="tab-content" >
	 	<input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
             <!-- //sum -->
             
             <div class="active" id="tab2" style="width: 948px;padding-top: 1px;margin-top: -17px;" >
			<div style="margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;"> FIM0800 -
 <b id="sub" style="display: none"></b></b><b>Primary Dealers Transactions


<b id="sub"
					Style="display: none"></b></b></font>
			<br><br></div>
			<div id="divLoading"> 
    </div>
          <table class="table" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;">
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:right;background-color: #bbc3cb;width:325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab2"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab1" data-toggle="tab"><span class="headingtab" id="sumfrst">Summary </span></a><a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select></td></tr>
          		  </table>
        
            
            <table class="table" id="tbcates" style=" width: 948px;margin-top: -20px;" border="1">
            
             <thead>
					
					
					 <tr class="filters">
					 <th id="sno" >Serial No</th>
						<th id="trade" style=" width: 120px;">Trade Date</th>
						<th id="valdate" style=" width: 120px;" >Value Date</th>
						
						<th id="typtrn" > Type of Transaction</th>				
						<th id="acntno" >Account Number of Security</th>
						
						<th id="cntprty" style=" width: 213px;">Name of counter party</th>
						<th id="ccntprtycode" >Counter party Code</th>
						<th id="nominalamt" >Nominal Amount of security </th>
						<th id="yields"   >Yield to Maturity of Security (%)</th>
						<th id="clanpr" >Clean Price of Security</th>
						<th id="matudat" style="width: 120px">Maturity Date of security</th>
						<th id="residudat" >Residual Days to Maturity</th>
						<th id="isin" >ISIN</th>
						
						
						<th id="edit">Select</th>
						
					</tr>
					
				<thead>
					
					<tbody class="databody" id="test">
					
					
					
					
					 </tbody>
				</table>
				
					<div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
            <!--     <button type="button" class="btn btn-xs btn-primary" value="Excel" >Generate Excel</button> -->
               <!--   <button type="button" class="btn btn-xs btn-primary" value="Pdf" id="btnPdf">Generate PDF</button> -->
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                 <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                 
                <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button>
            </div>
				

 
   
				
			  </div>	
				<!-- //details -->
				<div class="tab-pane" id="tab1" style="width: 1407px;padding-top: 1px;margin-top: -17px;">
<div style=" margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b style="font-size: 13px;"> FIM0800 - <b id="sub" style="display: none"></b></b><b> Primary Dealers Transactions

 <b id="sub"
					Style="display: none"></b></b></font>
			<br><br></div>
					
					 <div id="divLoading"> 
    </div> <table class="table" style="width:   1407px;height:50px;   ">
          		  <tr ><td style="background-color: #bbc3cb;    width: 250px;"> 
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:right;background-color: #bbc3cb;width: 325px;"></td><td style="background-color: #bbc3cb;text-align: right;"><a  class="btn btn-xs btn-primary det" href="#tab2"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary" href="#tab1" data-toggle="tab"><span class="headingtab" id="summaryfirst">Summary </span></a><a
										id="btnExcel"><i class="glyphicon glyphicon-download-alt"
											style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style="    width: 45px;
    margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a><a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a>
    </td></tr>
          		  </table>

          		  <div class="panel panel-primary filterable">
          		  
          		  
          		  <table class="table" id="tbcate" border="1" style="margin-top: -21px;width:100%;">
            
             <thead>
					


					
					 <tr class="filters">
					 <th  ><textarea  type="text" id="srlno" style="text-align: center;width: 43px;" onkeyup="myFunction(this.id,0)"class="form-control2" placeholder="Serial No" disabled></textarea></th>
						<th><textarea type="text" id="trade1" style=" text-align: center;width: 60px;" onkeyup="myFunction(this.id,1)"class="form-control2" placeholder="Trade Date" disabled></textarea></th>
						<th><textarea type="text" id=valdate1 style=" text-align: center;width:60px;" onkeyup="myFunction(this.id,2)"class="form-control2" placeholder="Value Date" disabled ></textarea></th>
						
						<th><textarea type="text" id="typtrn1" style=" text-align: center;width:75px;" onkeyup="myFunction(this.id,3)"class="form-control2" placeholder="Type of Transaction" disabled ></textarea></th>				
						<th><textarea type="text" id="acntno1" style=" text-align: center;width:100px;"  onkeyup="myFunction(this.id,4)"class="form-control2" placeholder="Account Number of Security" disabled ></textarea></th>
						
						<th><textarea type="text" id="cntprty1" style=" text-align: center;width: 131px;" onkeyup="myFunction(this.id,5)"class="form-control2" placeholder="Name of counter party" disabled></textarea></th>
						<th><textarea type="text" id="ccntprtycode1"style=" text-align: center;width: 95px;"  onkeyup="myFunction(this.id,6)"class="form-control2" placeholder="Counter party Code" disabled></textarea></th>
						<th><textarea type="text" id="nominalamt1" style=" text-align: center;width: 99px;" onkeyup="myFunction(this.id,7)"class="form-control2" placeholder="Nominal Amount of security" disabled ></textarea></th>
						<th><textarea type="text" id="yields1"  style=" text-align: center;width: 79px;" onkeyup="myFunction(this.id,8)"class="form-control2" placeholder="Yield to Maturity of Security (%)" disabled ></textarea></th>
						<th><textarea type="text" id="clanpr1"  style=" text-align: center;width: 83px"onkeyup="myFunction(this.id,9)"class="form-control2" placeholder="Clean Price of Security" disabled></textarea></th>
						<th><textarea type="text" id="matudat1" style="text-align: center;width: 87px" onkeyup="myFunction(this.id,10)"class="form-control2" placeholder="Maturity Date of security" disabled></textarea></th>
						<th><textarea type="text" id="residudat1" style=" text-align: center;width: 83px"onkeyup="myFunction(this.id,11)"class="form-control2" placeholder="Residual Days to Maturity" disabled ></textarea></th>
						<th><textarea type="text" id="isin1"style=" text-align: center;width: 52px;" onkeyup="myFunction(this.id,12)"class="form-control2" placeholder="ISIN" disabled ></textarea></th>
						<th id="modify"style=" width: 112px;" >Select</th>
<!-- 						<th id="edit">Modify</th>
 -->						
					</tr>
					
				</thead>
					
					<tbody class="databody" id="FIMdets">

            
					
              </tbody>
				</table>
				
</div>
		



			</div>
			
            
            </div>
             <div id="dialog-confirm" title="Alert" style="display:none">
  <p><span class="glyphicon glyphicon-alert" style="float:left; margin:0px 12px 20px 0;"></span><font id="msg"></font></p>
</div>
<div tabindex="-1" role="dialog"
		class="ui-dialog ui-corner-all ui-widget ui-widget-content ui-front ui-dialog-buttons ui-draggable"
		aria-describedby="dialog-confirm" aria-labelledby="ui-id-1"
		style="height: auto; width: 400px; top: 322px; left: 325px; display: none; z-index: 101;">
		<div
			class="ui-dialog-titlebar ui-corner-all ui-widget-header ui-helper-clearfix ui-draggable-handle">
			<span id="ui-id-1" class="ui-dialog-title">Alert</span>
			<button type="button"
				class="ui-button ui-corner-all ui-widget ui-button-icon-only ui-dialog-titlebar-close"
				title="Close">
				<span class="ui-button-icon ui-icon ui-icon-closethick"> </span> <span
					class="ui-button-icon-space"> </span>Close
			</button>
		</div>
		<div id="dialog-confirm"
			style="width: auto; min-height: 63px; max-height: none; height: auto;"
			class="ui-dialog-content ui-widget-content">
			<p>
				<span class="glyphicon glyphicon-alert"
					style="float: left; margin: 0px 12px 20px 0;"></span> <font
					id="msg">Are you sure,you want to delete it?</font>
			</p>
		</div>
		 <div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
			<div class="ui-dialog-buttonset">
				<button type="button" class="ui-button ui-corner-all ui-widget">OK</button>
			
				<button type="button" class="ui-button ui-corner-all ui-widget">CLOSE</button>
			</div>
			</div> 
	</div>
       
   
     
     </form>
    
    
</div>





</body>
</html>