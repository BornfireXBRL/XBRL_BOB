<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLBLS0103Bean,dao.XBRLBLS0103Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
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
 String cnt=request.getParameter("cnt");
 String reptype=request.getParameter("reptype");
 String curr = request.getParameter("curr");
 String typo=request.getParameter("typo");
// String ReporefSeq = request.getParameter("ReporefSeq");
String types=request.getParameter("types");

String instno = request.getParameter("instno");
String ReporefSeq = request.getParameter("ReporefSeq");
 
 XBRLBLS0103Dao dmd=new XBRLBLS0103Dao();
 
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
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="../Bootstrap/css/bootstrap.min.css">
  <script src="../../js/modal/code.js"></script>
    <script src="../../js/modal/codejquery.js"></script>
  
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

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="../Bootstrap/css/bootstrap.min.css">
  	

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
.clr{
color: #0c0b0b;
    background-color: #f5f5f5;
    border-color: #f5f5f5;
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

/* .sumder{
	
	 text-align: right;

} */


.panel-heading {
    padding: 6px 22px;
    border-bottom: 5px solid transparent;
    height: 41px;
}

.table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {

    border-top: 1px solid #ddd;
}

.databody td {
    border: 1px solid #ddd;
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
#DCGdets td{
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
 .ui-dialog-titlebar-close {
    visibility: hidden;
} 
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
.tab-pane,#tbcates{
display:none;
}

.tab-pane,#tbcates{
display:none;
}

 .hidden {
  display: none;
}
textarea
{
text-align:center;
	overflow: hidden;
	resize:none;
	height: 40px;
	border:none;
	background-color: #f5f5f5;
	white-space:pre-wrap;
	word-wrap:break-word;
	resize: none;
	
	-webkit-text-fill-color: #333333;
	}
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 6px;}
</style>


<%-- <script>
$(document).ready(function(){
	$("#sumfrst").click(function(){
		
		 location.href = "XBRL_REP_BLS0103_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		 });	
	
	$("#summaryfirst").click(function(){
		
		 location.href = "XBRL_REP_BLS0103_01.jsp?ReporefSeq="+$("#refDisplay").text()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>'; 
		 });	
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		
		});
	
	
	
	
	$('#btnback').on('click', function(e){
	    e.preventDefault();
	    window.history.back();
	});
	
	
	$("#btnExcel").click(function(){ 
    	alert("HAOOO");
    	alert(document.getElementById("refdisplayFIM").innerHTML);
    	alert('<%=dt1%>');
    	alert('<%=dt2%>');
		 //return false;
		 BLS0103Form.action = "fim0100EXCELREPORT.action?method=fim0100EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+document.getElementById("refdisplayFIM").innerHTML;
		 BLS0103Form.submit();
});
	
	
	
});	

</script>




<script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});


</script> --%>





<script>

/*
Please consider that the JS part isn't production ready at all, I just code it to show the concept of merging filters and titles together !
*/
$(document).ready(function(){
	var btn=1;
	 $("#btnpre").prop("disabled",true);
  $(".tb1").show();
  
  $("#btnpre").on("click",function(){
		btn--;
		if(btn==1){
			 $("#btnpre").prop("disabled",true);
			 $("#btnnext").prop("disabled",false);
		}else{
			 $("#btnpre").prop("disabled",false);
			 $("#btnnext").prop("disabled",true);
		}
  });
  $("#btnnext").on("click",function(){
		btn++;
		if(btn==2){
			 $("#btnnext").prop("disabled",true);
			 $("#btnpre").prop("disabled",false);
		}else{
			 $("#btnnext").prop("disabled",false);
			 $("#btnpre").prop("disabled",true);
		}
  });
});
</script>


<script>
function functionli(a){
	$(".table").hide(); 
	alert(".tb"+a);
	$(".tb"+a).show();
	}
</script>





<script>
$(document).ready(function(){

	
	
	

	
	
	
	
	$("#btnfilter").on("click",function(){
		
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
		 $('#countno,#namentity,#uniidenentity,#dydom,#trno,#couno,#namenti,#uident,#isiccode,#typinvesdispo,#typinvesinst,#clashar,#qualded,#countryname,#doacq,#matdate,#cur,#nomval,#trabook,#bankbook,#pershare,#datreguappr,#valinvesdispo,#cusid,#cusnam,#uniqid,#isiccod,#investyp,#invesintrutyp,#clsshr,#quaedu,#counam,#acqudat,#matudat,#currcod,#nomival,#tradcos,#bankcos,#sharpc,#pagregap,#invesdip,#redat').css({
				'text-align':'center',
				'height':'30px',
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
		
			/* document
			.getElementById("1","2")
			.setAttribute("style","text-align:center;height:44px;width:70px;white-space:pre-wrap;scroll:none;word-wrap:break-word;resize: none;background-color: white;");
		 */
		}else{
			$(".form-control2").val("");
			$(".form-control2").prop("disabled",true);
			
			 $('#countno,#namentity,#uniidenentity,#dydom,#trno,#couno,#namenti,#uident,#isiccode,#typinvesdispo,#typinvesinst,#clashar,#qualded,#countryname,#doacq,#matdate,#cur,#nomval,#trabook,#bankbook,#pershare,#datreguappr,#valinvesdispo,#cusid,#cusnam,#uniqid,#isiccod,#investyp,#invesintrutyp,#clsshr,#quaedu,#counam,#acqudat,#matudat,#currcod,#nomival,#tradcos,#bankcos,#sharpc,#pagregap,#invesdip,#redat').css({
					'text-align':'center',
					'height':'30px',
					'white-space':'pre-wrap',
					'scroll':'none',
					'word-wrap':'break-word',
					'resize':'none',
					'background-color': '#f5f5f5',
					'border':'none',
					'-webkit-text-fill-color': '#333333'
					}); 
			  var   table, tr, td, i;
				 table = document.getElementById("det1");
				 tr = table.getElementsByTagName("tr");
				 for (i = 0; i < tr.length; i++) {
					 
						 
						 tr[i].style.display = ""; 
						 
				 
					 
				 }
				
		}
		
	});
				
				
			
	
});	

</script>

<script>
function myFunction(a,b) {
	
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("det1");
  /* table = document.getElementById("pymdets2"); */

  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==12 || b==13 ||b==14 || b==15 ||b==17){
		
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





<script>

$(document).ready(function(){
	var btn=1;
	 $("#btnpre").prop("disabled",true);
	 $(".table").hide();
	 if('<%=types%>'!="frmsum"){
		 
		 $(".tb1").show();
	 }else{
		
		 $(".tb"+'<%=cnt%>').show();
		 if('<%=cnt%>'==1){
				
				$("#btnpre").prop("disabled",true);
				 $("#btnnext").prop("disabled",false);
				 $("#li1").addClass("active");
				 $("#li2").removeClass("active");
			}else if('<%=cnt%>'==2){
				$("#btnpre").prop("disabled",false);
				 $("#btnnext").prop("disabled",true);
				 $("#li2").addClass("active");
				 $("#li1").removeClass("active");
			}
	 }
 
  
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
	$(".tb"+a).show();
	$("#btnSave").hide();
	$("#btnXML").hide();
if(a==1){
	
	$("#btnpre").prop("disabled",true);
	 $("#btnnext").prop("disabled",false);
	 $("#li1").addClass("active");
	 $("#li2").removeClass("active");
	 document.getElementById("tab2").style.width = "1000px";
	 document.getElementById("mytab").style.width = "1000px";
}else if(a==2){
	$("#btnSave").show();
	$("#btnXML").show();
	$("#btnpre").prop("disabled",false);
	 $("#btnnext").prop("disabled",true);
	 $("#li2").addClass("active");
	 $("#li1").removeClass("active");
	 document.getElementById("tab2").style.width = "1435px";
	 document.getElementById("mytab").style.width = "1435px";
}
}
</script>

<script>

$(window).load(function() {
   $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	
	var det={
			"repdate":'<%=dt2%>',"type":"chckmodified"
		};
		$.ajax({
			url:"BLS0103chckmodified",
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
					        	location.href = "XBRL_CRT_BLS0103_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
					        }
					      }
					    });
					
					
				}else{
					$("#modflg").val("N");
				}
			}
		});
		
		var hh=0;
		
		$('#btnSave').on("click",function() {
			
			$("#divLoading").addClass('show'); 
			
			
			if((hh==0)&&($("#savecheck").val()==0)){
		 		
	 			if($("#savecheck").val()==0){
	 				
	 			
				  var datasum={
						"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").val()
				};
				$.ajax({
					  

					url:"saveSumbls1",
					data:datasum,
					dataType:'json',
					type:'POST',
					async:true,
					success:function(res){
						
						alert("Saved Successfully");
						save++;
						
							
						 $("#divLoading").removeClass('show');
					}
				});  
				$("#btnXML").prop("disabled",false);
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
	 				   		$.ajax({
	 				   			url:"saveSumbls1",
	 				   			data:datasum,
	 								dataType:'json',
	 								type:'POST',
	 								async:true,
	 								success:function(res){
	 									alert("Saved Successfully");
	 									
	 							
	 							 $("#divLoading").removeClass('show');
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
	
	
	
	
	
	
	$("#sumfirst").on("click",function(){
		
		location.href = "XBRL_REP_BLS0103_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"sum"+"&curr="+'<%=curr%>';
	});
	$("#addrowno").val("0");
 	fnload('<%=typo%>','<%=dt1%>','<%=dt2%>','<%=ReporefSeq%>','<%=instno%>','<%=reptype%>','<%=types%>','<%=curr%>'); 
 
	$(".det").on("click",function(){
		
		//types=onload for details to load
		//typo=load for details
		location.href = "XBRL_REP_BLS0103_01.jsp?ReporefSeq="+$("#refDisplay").val()+"&instno="+"0"+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&reptype="+'<%=reptype%>'+"&typo="+"load"+"&types="+"onload"+"&curr="+'<%=curr%>'; 
	});
	 
	$( ".btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '.btnback').click(function() {
		 location.href="XBRL_CRT_BLS0103_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});
	$('#btnExcel').click(function() {
		
		 BLS0103Form.action = "BLS0103EXCELREPORT.action?method=BLS0103EXCEL&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&instno="+'<%=instno%>'+"&curr="+'<%=curr%>';
		 BLS0103Form.submit();
	});
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			 BLS0103Form.action = "BLS0103EXCELSum.action?method=BLS0103EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 BLS0103Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			 BLS0103Form.action = "BLS0103PDFREPORT.action?method=BLS0103PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			 BLS0103Form.submit();
		}
	});
	$('#btnXML').click(function() {
		  BLS0103Form.action = "XMLDOWNLOAD1.action?method=bls5xml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").val()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		 BLS0103Form.submit(); 
	});
	



});




</script>


 <script>
 var modtyp;

 $(document).ready(function(){
 

	$("#addrow").on("click",function(){
		var rowno=$("#rowno").val();
modtyp="A";
		$("#addrowno").val("1"); 
		
	$("#det1").prepend("<tr id='dcgadd"+rowno+"'><td id='cusid_row"+rowno+"'><input type='text' id='cusid_text"+rowno+"' style='width: 58px;'></td><td id='cusnam_row"+rowno+"'><input type='text'  id='cusnam_text"+rowno+"' style='    width:117px;'></td><td id='uniqid_row"+rowno+"'><input type='text' id='uniqid_text"+rowno+"' style='     width: 100px;'></td><td id='isiccod_row"+rowno+"'><input type='text' 	id='isiccod_text"+rowno+"' style='    width: 68px;'></td><td id='investyp_row"+rowno+"'><input type='text' id='investyp_text"+rowno+"' style='    width: 100px;'></td><td id='invesintrutyp_row"+rowno+"'><input type='text' id='invesintrutyp_text"+rowno+"' style='width: 77px;'></td><td id='clsshr_row"+rowno+"'><input type='text'  id='clsshr_text"+rowno+"' style='    width:117px;'></td><td id='quaedu_row"+rowno+"'><input type='text' id='quaedu_text"+rowno+"' style='     width: 121px;'></td><td id='counam_row"+rowno+"'><input type='text' 	id='counam_text"+rowno+"' style='    width: 100px;'></td><td id='acqudat_row"+rowno+"'><input type='text' id='acqudat_text"+rowno+"' style='    width: 100px;'></td><td id='matudat_row"+rowno+"'><input type='text' id='matudat_text"+rowno+"' style='width: 100px;'></td><td id='currcod_row"+rowno+"'><input type='text'  id='currcod_text"+rowno+"' style='    width:68px;'></td><td id='nomival_row"+rowno+"'><input type='text' id='nomival_text"+rowno+"' class='decimalPt roundUp' style='     width: 121px;'></td><td id='tradcos_row"+rowno+"'><input type='text' 	id='tradcos_text"+rowno+"' class='decimalPt roundUp' style='    width: 100px;'></td><td id='bankcos_row"+rowno+"'><input type='text' id='bankcos_text"+rowno+"' class='decimalPt roundUp' style='    width: 100px;'></td><td id='sharpc_row"+rowno+"'><input type='text' id='sharpc_text"+rowno+"' style='width: 47px;'></td><td id='pagregap_row"+rowno+"'><input type='text'  id='pagregap_text"+rowno+"' style='    width:100px;'></td><td id='invesdip_row"+rowno+"'><input type='text' id='invesdip_text"+rowno+"' class='decimalPt roundUp' style='     width:100px;'></td><td id='redat_row"+rowno+"'><input type='text' 	id='redat_text"+rowno+"' style='    width: 100px;'></td><td><input type='button' id='edit_button"+rowno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 32px;display:none;' onclick=edit_row('"+rowno+"')> <input type='button' id='save_button"+rowno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 34px; ' onclick=save_row('"+rowno+"')>&nbsp;<input type='button' id='Cancel_button"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;'onclick=Canadd_row('"+rowno+"')><input type='button' id='Cancel_btn"+rowno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+rowno+"')></td></tr>");

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


	});


	
});	
function fnkeyup(a){
	$("#redat_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
	});
	$("#pagregap_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
	});
	$("#acqudat_text"+a).datepicker({
		dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today"
	});
	$("#matudat_text"+a).datepicker({
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

	  
	 

var	nomival =  document.getElementById("nomival_row"+no);

var	nomival_data = nomival.innerHTML;



var	tradcos =  document.getElementById("tradcos_row"+no);

var	tradcos_data = tradcos.innerHTML;



var	bankcos =  document.getElementById("bankcos_row"+no);

var	bankcos_data = bankcos.innerHTML;


var	invesdip =  document.getElementById("invesdip_row"+no);

var	invesdip_data = invesdip.innerHTML;


nomival.innerHTML="<input type='text' class='decimalPt roundUp'  id='nomival_text"+no+"'  style='width: 83px'; value='"+nomival_data+"'>";
tradcos.innerHTML="<input type='text' class='decimalPt roundUp'  id='tradcos_text"+no+"'  style='width: 83px'; value='"+tradcos_data+"'>";
bankcos.innerHTML="<input type='text' class='decimalPt roundUp'  id='bankcos_text"+no+"'  style='width: 83px'; value='"+bankcos_data+"'>";
invesdip.innerHTML="<input type='text' class='decimalPt roundUp'  id='invesdip_text"+no+"'  style='width: 83px'; value='"+invesdip_data+"'>";






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
		
		
		if(document.getElementById("nomival_text"+no).value==""){
			alert("Enter Nominal value ..");
			error="Y"
			
		}else if(document.getElementById("tradcos_text"+no).value==""){
					alert("Enter Trading Book Cost..");
					error="Y"
					
			}else if(document.getElementById("bankcos_text"+no).value==""){
							alert("Enter Banking Book Cost ..");
							error="Y"
							
					}else if(document.getElementById("invesdip_text"+no).value==""){
									alert("Enter Invest Value Diposed ..");
									error="Y"		
		}
		
	} else if (modtyp=="A") {
		
		
		

		if(document.getElementById("cusid_text"+no).value==""){
			alert("Enter Customer Id ..");
			error="Y"
		}else if(document.getElementById("cusnam_text"+no).value==""){
			alert("Enter Type of coin ..");	
			error="Y"
		}else if(document.getElementById("uniqid_text"+no).value==""){
			alert("Enter Unique Id ..");
			error="Y"
		}else if(document.getElementById("isiccod_text"+no).value==""){
			alert("Enter Isic Code ..");
			error="Y"
		}else if(document.getElementById("investyp_text"+no).value==""){
			alert("Enter Invest Type..");
			error="Y"
		}else if(document.getElementById("invesintrutyp_text"+no).value==""){
			alert("Enter Invest Instrument Type..");
			error="Y"
		}else if(document.getElementById("clsshr_text"+no).value==""){
			alert("Enter Class of Share ..");
			error="Y"
		}else if(document.getElementById("quaedu_text"+no).value==""){
			alert("Enter Qualification for education..");
			error="Y"
		}else if(document.getElementById("counam_text"+no).value==""){
			alert("Enter Country Name..");
			error="Y"
		}else if(document.getElementById("acqudat_text"+no).value==""){
			alert("Enter Acquisition Date..");
			error="Y"
		}else if(document.getElementById("matudat_text"+no).value==""){
			alert("Enter Maturity Date..");
			error="Y"
		}else if(document.getElementById("currcod_text"+no).value==""){
			alert("Enter Currency code ..");
			error="Y"
		}else if(document.getElementById("sharpc_text"+no).value==""){
			alert("Enter Share Pcnt..");
			error="Y"
		}else if(document.getElementById("pagregap_text"+no).value==""){
			alert("Enter Date Reg Appr ..");
			error="Y"
		}else if(document.getElementById("redat_text"+no).value==""){
			alert("Enter Report Date ..");
			error="Y"
		}
	}
	
	
	
	if (error=="N"){
		
		
	
	$("#modflg").val("Y");
	modtyp="M";
	document.getElementById("edit_button"+no).checked = false;

	  

var nomival_val=document.getElementById("nomival_text"+no).value;
document.getElementById("nomival_row"+no).innerHTML=nomival_val;

var tradcos_val=document.getElementById("tradcos_text"+no).value;
document.getElementById("tradcos_row"+no).innerHTML=tradcos_val;

var bankcos_val=document.getElementById("bankcos_text"+no).value;
document.getElementById("bankcos_row"+no).innerHTML=bankcos_val;


var invesdip_val=document.getElementById("invesdip_text"+no).value;
document.getElementById("invesdip_row"+no).innerHTML=invesdip_val;

if($("#addrowno").val()=="1"){
	modtyp="A";
var  cusid_val=document.getElementById("cusid_text"+no).value;	 
document.getElementById("cusid_row"+no).innerHTML=cusid_val;

   var cusnam_val=document.getElementById("cusnam_text"+no).value;
   document.getElementById("cusnam_row"+no).innerHTML=cusnam_val;
   
  var uniqid_val=document.getElementById("uniqid_text"+no).value;
   document.getElementById("uniqid_row"+no).innerHTML=uniqid_val;
   
  var isiccod_val=document.getElementById("isiccod_text"+no).value;	
  document.getElementById("isiccod_row"+no).innerHTML=isiccod_val;

  var investyp_val=document.getElementById("investyp_text"+no).value;
	document.getElementById("investyp_row"+no).innerHTML=investyp_val;
	
	 var invesintrutyp_val=document.getElementById("invesintrutyp_text"+no).value;
	   document.getElementById("invesintrutyp_row"+no).innerHTML=invesintrutyp_val;
	
	  var clsshr_val=document.getElementById("clsshr_text"+no).value;
	   document.getElementById("clsshr_row"+no).innerHTML=clsshr_val;
	   
	  var quaedu_val=document.getElementById("quaedu_text"+no).value;	
	  document.getElementById("quaedu_row"+no).innerHTML=quaedu_val;

	  var counam_val=document.getElementById("counam_text"+no).value;
		document.getElementById("counam_row"+no).innerHTML=counam_val;
		
		  var acqudat_val=document.getElementById("acqudat_text"+no).value;	
		  document.getElementById("acqudat_row"+no).innerHTML=acqudat_val;

		  var matudat_val=document.getElementById("matudat_text"+no).value;
			document.getElementById("matudat_row"+no).innerHTML=matudat_val;
			
			 var currcod_val=document.getElementById("currcod_text"+no).value;
			   document.getElementById("currcod_row"+no).innerHTML=currcod_val;
			   
			  var sharpc_val=document.getElementById("sharpc_text"+no).value;
			   document.getElementById("sharpc_row"+no).innerHTML=sharpc_val;
			   
			  var pagregap_val=document.getElementById("pagregap_text"+no).value;	
			  document.getElementById("pagregap_row"+no).innerHTML=pagregap_val;

			
				
				  var redat_val=document.getElementById("redat_text"+no).value;
					document.getElementById("redat_row"+no).innerHTML=redat_val;		
		
		

}else{
	document.getElementById("Cancel_button"+no).style.display="inline-block";
	document.getElementById("Cancel_btn"+no).style.display="none";
}

document.getElementById("edit_button"+no).style.display="inline-block";
document.getElementById("save_button"+no).style.display="none";

 var cusid=document.getElementById("cusid_row"+no).innerHTML;	 
   var cusnam=document.getElementById("cusnam_row"+no).innerHTML;
  var uniqid=document.getElementById("uniqid_row"+no).innerHTML;
  var isiccod=document.getElementById("isiccod_row"+no).innerHTML;
  var investyp=document.getElementById("investyp_row"+no).innerHTML;

  var invesintrutyp=document.getElementById("invesintrutyp_row"+no).innerHTML;	 

  var clsshr=document.getElementById("clsshr_row"+no).innerHTML;
 var quaedu=document.getElementById("quaedu_row"+no).innerHTML;
 var counam=document.getElementById("counam_row"+no).innerHTML;	
 var acqudat=document.getElementById("acqudat_row"+no).innerHTML;	
 var matudat=document.getElementById("matudat_row"+no).innerHTML;	 
 var currcod=document.getElementById("currcod_row"+no).innerHTML;
var nomival=document.getElementById("nomival_row"+no).innerHTML;
var tradcos=document.getElementById("tradcos_row"+no).innerHTML;
var bankcos=document.getElementById("bankcos_row"+no).innerHTML;	

var sharpc=document.getElementById("sharpc_row"+no).innerHTML;	 
var pagregap=document.getElementById("pagregap_row"+no).innerHTML;
var invesdip=document.getElementById("invesdip_row"+no).innerHTML;
var redat=document.getElementById("redat_row"+no).innerHTML;
 

$("#dcgadd"+no).addClass("rowaddedd");
$("#det1 td").attr("padding","8px");

var refeBLS103=document.getElementById("refDisplay").value;

nomival=nomival.replace(/\,/g,'')
  nomival=Number(nomival)
  
  tradcos=tradcos.replace(/\,/g,'')
  tradcos=Number(tradcos)
  
  bankcos=bankcos.replace(/\,/g,'')
  bankcos=Number(bankcos)
   
   sharpc=sharpc.replace(/\,/g,'')
  sharpc=Number(sharpc)
 invesdip=invesdip.replace(/\,/g,'')
  invesdip=Number(invesdip)

  var rptdate1 = {
     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>', "reportrefno": refeBLS103, "cusid":cusid,"cusnam":cusnam,"uniqid" : uniqid,"isiccod":isiccod, "investyp":investyp,"invesintrutyp":invesintrutyp ,"clsshr":clsshr,"quaedu" :quaedu,"counam":counam, "acqudat":acqudat, "matudat":matudat,"currcod":currcod,"nomival" : nomival,"tradcos":tradcos, "bankcos":bankcos,"sharpc":sharpc ,"pagregap":pagregap,"invesdip" : invesdip,"redat":redat,"modtyp":modtyp
}; 
$.ajax({
url : "BLS0103",
data : rptdate1  ,
dataType : 'json', 
type : 'POST',
async : true,
 success : function(res) {
	 console.log(res.refno);

	 $("#refDisplay").html(res.refno);
	
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
					//alert(""+Integer.ParseInteger(no));
					
				/* 	var	noo= parseInt(no)-1;
				 */
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
					        	
					        	 var cusid=document.getElementById("cusid_row"+no).innerHTML;	 
					        	   var cusnam=document.getElementById("cusnam_row"+no).innerHTML;
					        	  var uniqid=document.getElementById("uniqid_row"+no).innerHTML;
					        	  var isiccod=document.getElementById("isiccod_row"+no).innerHTML;
					        	  var investyp=document.getElementById("investyp_row"+no).innerHTML;

					        	  var invesintrutyp=document.getElementById("invesintrutyp_row"+no).innerHTML;	 

					        	  var clsshr=document.getElementById("clsshr_row"+no).innerHTML;
					        	 var quaedu=document.getElementById("quaedu_row"+no).innerHTML;
					        	 var counam=document.getElementById("counam_row"+no).innerHTML;	
					        	 var acqudat=document.getElementById("acqudat_row"+no).innerHTML;	
					        	 var matudat=document.getElementById("matudat_row"+no).innerHTML;	 
					        	 var currcod=document.getElementById("currcod_row"+no).innerHTML;
					        	var nomival=document.getElementById("nomival_row"+no).innerHTML;
					        	var tradcos=document.getElementById("tradcos_row"+no).innerHTML;
					        	var bankcos=document.getElementById("bankcos_row"+no).innerHTML;	

					        	var sharpc=document.getElementById("sharpc_row"+no).innerHTML;	 
					        	var pagregap=document.getElementById("pagregap_row"+no).innerHTML;
					        	var invesdip=document.getElementById("invesdip_row"+no).innerHTML;
					        	var redat=document.getElementById("redat_row"+no).innerHTML;
					        	
					        	var refeBLS103=document.getElementById("refDisplay").value;
					        	
					        	nomival=nomival.replace(/\,/g,'')
					        	  nomival=Number(nomival)
					        	  
					        	  tradcos=tradcos.replace(/\,/g,'')
					        	  tradcos=Number(tradcos)
					        	  
					        	  bankcos=bankcos.replace(/\,/g,'')
					        	  bankcos=Number(bankcos)
					        	   
					        	   sharpc=sharpc.replace(/\,/g,'')
					        	  sharpc=Number(sharpc)
					        	 invesdip=invesdip.replace(/\,/g,'')
					        	  invesdip=Number(invesdip)
					        	
					        	 var rptdate1 = {
					        			     "dt1" : '<%=dt1%>',"dt2":'<%=dt2%>',"reportrefno": refeBLS103, "cusid":cusid,"cusnam":cusnam,"uniqid" : uniqid,"isiccod":isiccod, "investyp":investyp,"invesintrutyp":invesintrutyp ,"clsshr":clsshr,"quaedu" :quaedu,"counam":counam, "acqudat":acqudat, "matudat":matudat,"currcod":currcod,"nomival" : nomival,"tradcos":tradcos, "bankcos":bankcos,"sharpc":sharpc ,"pagregap":pagregap,"invesdip" : invesdip,"redat":redat,"modtyp":modtyp
					        			}; 
					        	 $.ajax({
					        	     url : "BLS0103",
					        	     data : rptdate1  ,
					        			dataType : 'json', 
					        			type : 'POST',
					        			async : true,
					        			 success : function(res) {
					        				 console.log(res.refno);
					        				//	alert("refeDCG100"+refeDCG100);
					        				
					        				// alert("sfsdf");
					        				 $("#refDisplay").val(res.refno);
						   
							  
					        				 $("#dcgadd"+no).closest("tr").remove();

							   
					        				
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
			 "cusid":$("#cusid_row"+no).text()
	 	};
	 	
	 	 $.ajax({
	 	     url : "BLS0103cancel",
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
	  

	/* 	  document.getElementById("del_button"+no).style.display="inline-block";
	 */ 

	 var nomival_val=document.getElementById("nomival_text"+no).value;
	 document.getElementById("nomival_row"+no).innerHTML=nomival_val;

	 var tradcos_val=document.getElementById("tradcos_text"+no).value;
	 document.getElementById("tradcos_row"+no).innerHTML=tradcos_val;

	 var bankcos_val=document.getElementById("bankcos_text"+no).value;
	 document.getElementById("bankcos_row"+no).innerHTML=bankcos_val;


	 var invesdip_val=document.getElementById("invesdip_text"+no).value;
	 document.getElementById("invesdip_row"+no).innerHTML=invesdip_val;
	 
	 
			$("#edit_button"+no).show();
			/* document.getElementById("edit_button"+no).style.display="block"; */
			document.getElementById("save_button"+no).style.display="none";
			document.getElementById("Cancel_btn"+no).style.display="none";
			 location.reload(true); 
			 
			 
			  var Nomival=document.getElementById("nomival_row"+no).innerHTMLL;
			  var Tradcos=document.getElementById("tradcos_row"+no).innerHTML;
			  var bankcos= document.getElementById("bankcos_row"+no).innerHTML;
			  var invesdip= document.getElementById("invesdip_row"+no).innerHTML;
			  
			  if($("#dcgadd"+no).hasClass( "rowaddedd" )){
				  
				  document.getElementById("Cancel_button"+no).style.display="inline-block";


			  }else{
				  document.getElementById("Cancel_button"+no).style.display="none";
			  }
			  
			
	 }


	 function Canadd_row(no){
		 
		  /* document.getElementById("del_button"+no).style.display="inline-block"; */

					;															   

		 if($("#dcgadd"+no).hasClass( "rowaddedd" )){
			var detcancel={
					"cusid":$("#cusid_row"+no).text(),"date":'<%=dt2%>'
			};
			
			
			
			 $.ajax({
			     url : "BLS0103cancel",
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
		 $("#dcgadd"+no).remove();
		 
	 }
	</script> 
</script>

<SCRIPT>
var save=0;
function fnload(z,d,e,b,c,a,f,g){

	//z --->typo(load or summary)
	//d -->date1
	//e -->date2
	//b -->refseqno
	//c -->instance no
	//a -->reptype
	//f -->types of details
	//g -->currency
	 $("#btnXML").hide();
	 $("#btnSave").hide();
	 if(z=="load"){
		 
		 $(".det").addClass("clr");
		//FOR DETAILS
		$("#tab1").show();
		var refno=b;
		
		var ins=c;
		
		if(ins==""){
			
			ins=0;
			
		}else{
		
			ins=c;
		} 
		if(refno=="null" || refno==null || refno==""){
			
			refno=0;
		}  var cnt1=1;
		var srno=1;
		
		 $(".repdisp").text(refno);
		 var srno=1;
		$(".activetab1").show();
		$(".activetab2").hide();
		 $("#divLoading").addClass("show"); 
		 $("#tab1").show();
		 var pymd = {
					"repname" : a,"ReporefSeq" : refno,"instno" : ins,"dt2" : e,"dt1" :d,"curr":g  
				}; 
				
			$.ajax({
				url : "BLS0103det1",
				data : pymd,
				dataType : 'json',
				type : 'POST',
				async : false,
				success : function(res) {	
				//	alert("refePYM100"+refePYM100);
					
					  $("#pymdets tr").remove();
					 
					
					var b=JSON.parse(res.det1BLS0103);
					 console.log(b);
					 
						 	if(f=="onload"){
						 		$("#modify").show();
/* 						 		$("#modify1").show();
 */						 		for(var i=0;i<b.length;i++){
						 			
						 		 // $("#pymdets").append("<tr><td id='applno"+srno+"'>"+b[i].applno+"</td><td id='applname"+srno+"'>"+b[i].aplcantname+"</td><td id='schmtyp"+srno+"'>"+b[i].schmtyp+"</td><td id='curr"+b[i].curr+"'></td><td id='outbal"+srno+"'>"+b[i].outstndingamt+"</td><td id='intrate"+srno+"'>"+b[i].intrate+"</td><td id='accopndate"+srno+"'>"+b[i].actopndate+"</td><td id='recvddate"+srno+"'>"+b[i].rcvddate+"</td><td id='appdate"+srno+"'>"+b[i].apprvddate+"</td><td id='rejctddate"+srno+"'>"+b[i].rejctdate+"</td><td id='rejreason"+srno+"'>"+b[i].rejctdreason+"</td><td><input type='radio' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')></td></tr>") ;  
						 		  
							
								$("#det1").append(

						 				 "<tr id='dcgadd"+cnt1+"'>"
				  +"<td  id='cusid_row"+srno+"'>"+b[i].cusid+"</td>"
			      +"<td  id='cusnam_row"+srno+"'>"+b[i].cusnam+"</td>"
				  +"<td  id='uniqid_row"+srno+"'>"+b[i].uniqid+"</td>"
				  +"<td  id='isiccod_row"+srno+"'>"+b[i].isiccod+"</td>"
				  +"<td  id='investyp_row"+srno+"'>"+b[i].investyp+"</td>"
				  +"<td  id='invesintrutyp_row"+srno+"'>"+b[i].invesintrutyp+"</td>"
				  +"<td  id='clsshr_row"+srno+"'>"+b[i].clsshr+"</td>"
				  +"<td  id='quaedu_row"+srno+"'>"+b[i].quaedu+"</td>"
				  +"<td  id='counam_row"+srno+"'>"+b[i].counam+"</td>"
				  +"<td  id='acqudat_row"+srno+"'>"+b[i].acqudat+"</td>"
				  +"<td  id='matudat_row"+srno+"'>"+b[i].matudat+"</td>"
				  +"<td  id='currcod_row"+srno+"'>"+b[i].currcod+"</td>"
				  +"<td class='sumder alnum' id='nomival_row"+srno+"'>"+b[i].nomival+"</td>"
				  +"<td class='sumder alnum' id='tradcos_row"+srno+"'>"+b[i].tradcos+"</td>"
				  +"<td class='sumder alnum' id='bankcos_row"+srno+"'>"+b[i].bankcos+"</td>"
				  +"<td  id='sharpc_row"+srno+"'>"+b[i].sharpc+"</td>"
				  +"<td  id='pagregap_row"+srno+"'>"+b[i].pagregap+"</td>"
				  +"<td class='sumder alnum' id='invesdip_row"+srno+"'>"+b[i].invesdip+"</td>"
				  +"<td  id='redat_row"+srno+"'>"+b[i].redat+"</td>"

				  +"<td style='text-align:center;'><input type='button' id='edit_button"+srno+"' value='Edit' class='btn btn-xs btn-primary edit' style='width: 37px;' onclick=edit_row('"+srno+"')>  <input type='button' id='save_button"+srno+"' value='Save' class='btn btn-xs btn-primary save' style='width: 37px; display:none;' onclick=save_row('"+srno+"')><input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px; display:none; ' onclick=Cancel_row('"+cnt1+"')><input type='button' id='Cancel_btn"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel1' style='width: 44px; display:none; ' onclick=Canedit_row('"+cnt1+"')><input type='button'id='del_button"+srno+"' value='Delete' class='btn btn-xs btn-primary delete' style='width: 39px;' onclick=savedel_row('"+cnt1+"')></td>"
				  
				 
                 
                   +"</tr>" ) ; 
								cnt1++;
								 srno++;
								 
								
									}
								 $("#divLoading").removeClass('show');
								$("#rowno").val(srno);
						 	}else if(f=="frmsum"){
						 		$(".add").hide();//add button hide
						 		$(".tb1").show();
						 		
						 		$("#modify").hide();//modify in the header hide
						 		$("#modify1").hide();
						 		$("#tb1").show();
								 for (var i = 0; i <b.length; i++) {
							
									 $("#det1").append(											
												
							 				 "<tr>"
						                 
				 +"<td  id='cusid_row"+srno+"'>"+b[i].cusid+"</td>"
			      +"<td  id='cusnam_row"+srno+"'>"+b[i].cusnam+"</td>"
				  +"<td  id='uniqid_row"+srno+"'>"+b[i].uniqid+"</td>"
				  +"<td  id='isiccod_row"+srno+"'>"+b[i].isiccod+"</td>"
				  +"<td  id='investyp_row"+srno+"'>"+b[i].investyp+"</td>"
				  +"<td  id='invesintrutyp_row"+srno+"'>"+b[i].invesintrutyp+"</td>"
				  +"<td  id='clsshr_row"+srno+"'>"+b[i].clsshr+"</td>"
				  +"<td  id='quaedu_row"+srno+"'>"+b[i].quaedu+"</td>"
				  +"<td  id='counam_row"+srno+"'>"+b[i].counam+"</td>"
				  +"<td  id='acqudat_row"+srno+"'>"+b[i].acqudat+"</td>"
				  +"<td  id='matudat_row"+srno+"'>"+b[i].matudat+"</td>"
				  +"<td  id='currcod_row"+srno+"'>"+b[i].currcod+"</td>"
				  +"<td class='sumder alnum' id='nomival_row"+srno+"'>"+b[i].nomival+"</td>"
				  +"<td class='sumder alnum' id='tradcos_row"+srno+"'>"+b[i].tradcos+"</td>"
				  +"<td class='sumder alnum' id='bankcos_row"+srno+"'>"+b[i].bankcos+"</td>"
				  +"<td  id='sharpc_row"+srno+"'>"+b[i].sharpc+"</td>"
				  +"<td  id='pagregap_row"+srno+"'>"+b[i].pagregap+"</td>"
				  +"<td class='sumder alnum' id='invesdip_row"+srno+"'>"+b[i].invesdip+"</td>"
				  +"<td  id='redat_row"+srno+"'>"+b[i].redat+"</td>"
							 
	                    
	                     
                      
	                    +"</tr>" ) ; 
								cnt1++;
								
							 
							
								
								 srno++;
								
								
									}
						 		 $("#divLoading").removeClass('show');
						 	}
							
						 	$("#tab1").show();
						 $("#divLoading").removeClass('show'); 
						$('.alnum').mask("#,##0.00", {reverse: true}); 
					
						}
						

						
				
			});   
		
			
	 }else{
		//For summary
		$(".summ").addClass("clr");
		$("#tab1").hide();
		
		$(".activetab2,.tb1").show();
		$(".activetab1").hide();
			var refno=b;
			var ins=c;
				if(ins==""){
					ins=0;
				}else{
					ins=c;
				} 
				if(refno=="null" || refno==null || refno==""){
					refno=0;
				}var cnt1=1;
				var srno=1;
				
				  /* $("#divLoading").addClass("show");  */
				
				 $(".repdisp").text(refno);
				 
						
						$("#test tr").children().detach().remove();
						
						 var rptdate1 = {
								 "dt1" : d,"dt2":e,"ReporefSeq" : refno,"curr":g,"reptype":a
								 
								}; 
						
						 $.ajax({
						     url : "BLS0103sec1",
						     data : rptdate1  ,
								dataType : 'json', 
								type : 'POST',
								async :false,
								 success : function(res) {
									 
						 console.log(res.s1BLS0103);
						
							var b=JSON.parse(res.s1BLS0103);
							 console.log(b);
							
							var k=1;
							
							
							for (var i = 0; i < b.length; i++) {
								
							
								$("#sec1").append("<tr><td id='countno"+cnt1+"'>"+b[i].countno+"</td><td id='namentity"+cnt1+"'>"+b[i].namentity+"</td><td id='uniidenentity"+cnt1+"'>"+b[i].uniidenentity+"</td><td style='text-align:center;'><input type=radio style=width: 15px; onclick=fnloads('1') id='edit"+cnt1+"'></td></tr>");
								
							srno++;
								cnt1++;
								
							}  
							
							
							  $("#divLoading").removeClass('show'); 
							 $('.alnum').mask("#,##0.00", {reverse: true});
							
								 }
								 }); 

						 	
						 var rptdate2 = {
								  "dt1" : d,"dt2":e,"ReporefSeq" : refno,"curr":g,"reptype":a
								}; 
						 
						 $.ajax({
						     url : "BLS0103sec2",
						     data : rptdate2  ,
								dataType : 'json', 
								type : 'POST',
								async : false,
								 success : function(res) {
									 //console.log(res.refnoAB);
							
							console.log(res.s2BLS0103);
						
							var b=JSON.parse(res.s2BLS0103);
							
							var k=1;
							
							for (var i = 0; i < b.length; i++) {
							
								$("#sec2").append("<tr><td id='dydom"+cnt1+"'>"+b[i].dydom+"</td><td id='trno"+cnt1+"'>"+b[i].trno+"</td><td id='couno"+cnt1+"'>"+b[i].couno+"</td><td id='namenti"+cnt1+"'>"+b[i].namenti+"</td><td id='uident"+cnt1+"'>"+b[i].uident+"</td><td id='isiccode"+cnt1+"'>"+b[i].isiccode+"</td><td id='typinvesdispo"+cnt1+"'>"+b[i].typinvesdispo+"</td><td id='typinvesinst"+cnt1+"'>"+b[i].typinvesinst+"</td><td id='clashar"+cnt1+"'>"+b[i].clashar+"</td><td id='qualded"+cnt1+"'>"+b[i].qualded+"</td><td id='countryname"+cnt1+"'>"+b[i].countryname+"</td><td id='doacq"+cnt1+"'>"+b[i].doacq+"</td><td id='matdate"+cnt1+"'>"+b[i].matdate+"</td><td id='cur"+cnt1+"'>"+b[i].cur+"</td><td class='sumder alnum' id='nomval"+cnt1+"'>"+b[i].nomval+"</td><td class='sumder alnum' id='trabook"+cnt1+"'>"+b[i].trabook+"</td><td class='sumder alnum' id='bankbook"+cnt1+"'>"+b[i].bankbook+"</td><td id='pershare"+cnt1+"'>"+b[i].pershare+"</td><td id='datreguappr"+cnt1+"'>"+b[i].datreguappr+"</td><td class='sumder alnum' id='valinvesdispo"+cnt1+"'>"+b[i].valinvesdispo+"</td><td style='text-align:center;'><input type=radio style=width: 15px; onclick=fnloads('2') id='edit"+cnt1+"'></td></tr>");
								
								srno++;
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
						url:"savecheckbls0103",
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

	 

</SCRIPT>
<script>

function fnloads(cnt){
	
	//for details from summary
	//typo=load for details
	//types=frmsum for dteails to load for instance
	location.href = "XBRL_REP_BLS0103_01.jsp?reptype="+'<%=reptype%>'+"&ReporefSeq="+$("#refDisplay").text()+"&instno="+cnt+"&dt2="+'<%=dt2%>'+"&dt1="+'<%=dt1%>'+"&typo="+"load"+"&types="+"frmsum"+"&curr="+'<%=curr%>'+"&cnt="+cnt;
	
}
</script>
<body>


<div class="container">
 
  <div class="loader"></div>
    
    <form class="form-horizontal" method="post" name="BLS0103Form"
		enctype="multipart/form-data">
            
            <input type="hidden" id="savecheck">
	               <input type="hidden" id="modflg" >
	               <input type="hidden" id="modtyp" >
	            
            
            <div class="tab-content" >
	 	<div class="activetab2 BLS0103" id="" style="width: 1000px;padding-top: 1px;margin-top: -17px;" >
	 	<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" id="equinvesh"><b>BLS0103-Investments in Shares and Fixed-dated Securities<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"> <b id="sub" style="display: none"></b></b></div> 
		<ul class="nav nav-tabs navright" id="mytab" style="    width: 100%;">

					<li class=" pull-right list" id="li2" onclick="functionli(2);"><a href="#tab2" data-toggle="tab"><span
							class="headingtab">2</span></a></li>
					
					
					<li class=" pull-right active list" id="li1" onclick="functionli(1);" ><a href="#tab1"
						data-toggle="tab"><span class="headingtab" >
								1 </span></a></li>




				</ul>	
					<table class="" id="tab2" style="width:100%;height:50px; ">
          		  <tr ><td style="background-color: #bbc3cb;"> <!-- <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font> -->
			 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;width:450px;"></td><td style="background-color: #bbc3cb;text-align:right;">
			 <a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
          		 <a class="btn btn-xs btn-primary summ" href="#tab2" data-toggle="tab"><span class="headingtab " >Summary </span></a>
          		 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select>&nbsp;&nbsp;&nbsp;</td></tr>
          		  </table>
           	
            <table class="table tb1" id="tb1" style="width:100%;display:none;margin-top:-20px;">
          	<tr><th rowspan="2" style="text-align:center;"" id="countno">Counterparty Sr.No</th>
          		<th  rowspan="1" style="text-align:center;" id="namentity">Name of Entity</th>
          		<th  rowspan="1" style="text-align:center;"id="uniidenentity">Unique identifier for Entity</th>
          		<th rowspan="2"style="text-align:center">Select</th>
          	</tr>
          	<tr>
          	<th style="text-align:center;"> A</th>
          	<th style="text-align:center;" > B</th>          	
          	</tr>
          <tbody id="sec1" class="databody"></tbody>
          </table>
          
          <table class="table tb2" id="tb2" style="width:150%;display:none;margin-top:-20px;">
          <tr><th rowspan="3"style="text-align:center;width:185px;"id="dydom">Dynamic Domain</th>
          <th rowspan="4"style="text-align:center"id="trno">Transaction Sr.No.</th>
          <th rowspan="5" style="text-align:center;width: 79px;"id="couno">Counterparty Sr.No.</th>
          <th style="text-align:center;width:131px;"id="namenti">Name of Entity</th> 
          <th style="text-align:center;width:83px;"id="uident">Unique identifier for Entity</th>
          <th style="text-align:center;width:243px;"id="isiccode">ISIC Code / Institutional Sector</th>
          <th style="text-align:center;width:100px;" id="typinvesdispo">Type of investment held/disposed</th>
          <th style="text-align:center;width:150px;"id="typinvesinst">Type of Investment Instrument</th>
          <th style="text-align:center;width:100px;"id="clashar">Class of Shares</th>  
          <th style="text-align:center;width:174px;"id="qualded">Qualification for Deduction by Type of Capital (if applicable)</th>
          <th style="text-align:center;"id="countryname">Name of Country</th>
          <th style="text-align:center;width: 88px;"id="doacq">Date of Acquisition</th>
          <th style="text-align:center;width: 88px;"id="matdate">Maturity Date</th>
          <th style="text-align:center;"id="cur">Currency</th>
          <th style="text-align:center;"id="nomval">Nominal Value</th>
          <th style="text-align:center;"id="trabook">Trading Book - Current Market or Realisable Value of Investment</th>
          <th style="text-align:center;"id="bankbook">Banking Book - Cost</th>   
          <th style="text-align:center;"id="pershare">Percentage Share of Investment in Issuing Entity's Issued Share Capital</th>
          <th style="text-align:center;"id="datreguappr">Date of Regulatory Approval (if applicable)</th>
          <th style="text-align:center;;"id="valinvesdispo">Value of investments disposed</th>   
          <th rowspan="4"style="text-align:center">Select</th></tr>
       <!--    <tr><th style="text-align:center">Min</th><th style="text-align:center">Max</th></tr> -->
          <tr><th style="text-align:center">C</th><th style="text-align:center">D</th><th style="text-align:center">E</th><th style="text-align:center">F</th><th style="text-align:center">G</th>
          <th style="text-align:center">H</th><th style="text-align:center">I</th><th style="text-align:center">J</th><th style="text-align:center">K</th><th style="text-align:center">L</th>
          <th style="text-align:center">M</th><th style="text-align:center">N</th><th style="text-align:center">O</th><th style="text-align:center">P</th><th style="text-align:center">Q</th>
          <th style="text-align:center">R</th><th style="text-align:center">S</th></tr>
          
          
          <tbody  class="databody" id="sec2"></tbody>  </table>
          
          
          
          
            <div class="modal-footer"> <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
<!--       <button type="button" class="btn btn-xs btn-primary" onclick="functionli(1);"  value="back" id="btnpre">Previous</button>
 -->    
                 <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button>
                 
                  <button type="button" class="btn btn-xs btn-primary" style="" value="Excel" id="btnXML">Gen XML Sum</button>
                 
<!--        <button type="button" class="btn btn-xs btn-primary" onclick="functionli(2);"  value="back" id="btnnext">Next</button>
 -->      <button type="button" class="btn btn-xs btn-primary btnback" value="back" id="btnback">Back</button></div>
          
            </div>
           
          
          
          <!-- DETAIL TABLE -->
          
          <input type="hidden" id="rowno">
	 	<input type="hidden" id="addrowno">
			 <div class="activetab1" id="tab1" style="width: 2275px;padding-top: 1px;margin-top: -17px;display:none" >
			<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>BLS0103-Investments in Shares and Fixed-dated securities	
<b id="sub"
					Style="display: none"></b></b></font>
			<br><br><b style="font-size: 13px;"> <b id="sub" style="display: none"></b></b></div> 
			<div id="divLoading"> 
    </div>
 
           <table class=""style="width: 100%;height:50px; 
           ">
   	  <tr><td style="background-color: #bbc3cb;    width: 1030px;"> <!-- <font size="1"><b style="color: #0c1190;font-size: 11px;">  Report Ref No :  </b></font> -->
	 <font size="1"><input type="hidden" style="color: #0c1190;font-size: 11px;" class="repdisp" id="refDisplay"></b></font></td><td style="text-align:center;background-color: #bbc3cb;"></td>
	 <td style="background-color: #bbc3cb;text-align:right;"><a  class="btn btn-xs btn-primary det" href="#tab1"  id="det" data-toggle="tab"><span class="headingtab" > Details </span></a> 
				
                
        <a class="btn btn-xs btn-primary" href="#tab2" data-toggle="tab"><span class="headingtab" id="sumfirst">Summary </span></a><a id="btnExcel"><i class="glyphicon glyphicon-download-alt"
		style="margin-left: 10px; font-size: 16px; cursor: pointer"></i></a><a class="btn btn-xs btn-primary add" style=" width: 45px; margin-left: 15px;" href="#" data-toggle="tab"><span class="headingtab" id="addrow">Add </span></a>
        <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a>&nbsp;&nbsp;&nbsp;</td></tr>
          		  </table>
 
					 <div class="panel panel-primary filterable">
					 
					   <table class="table tb1" id="tb1" style="width:100%;display:none;margin-top:-20px;"><tr>			
         	 
 				<tr class="filters">
 				         				    	 <th style="text-align:center;"><textarea type="text" onkeyup="myFunction(this.id,0)" class="form-control1" id="cusid" style="width: 100px;text-align:center;width:82px" placeholder="Customer ID"disabled></textarea></th>
 				         
				    	 <th style="text-align:center;"><textarea type="text" onkeyup="myFunction(this.id,1)" class="form-control2" id="cusnam" style="width: 100px;text-align:center;width:82px" placeholder="Customer Name"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text" onkeyup="myFunction(this.id,2)" class="form-control2" id="uniqid" style="width: 100px;text-align:center;width:82px" placeholder="Unique Id"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,3)" class="form-control2" id="isiccod" style="width: 100px;text-align:center;width:82px" placeholder="Isic Code" disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,4)" class="form-control2" id="investyp" style="width: 100px;text-align:center;width:82px" placeholder="Invest Type"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,5)" class="form-control2" id="invesintrutyp" style="width: 100px;text-align:center;width: 110px;" placeholder="Invest Instrument Type"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,6)" class="form-control2" id="clsshr" style="width: 100px;text-align:center;width: 110px;" placeholder="Class of Share"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,7)" class="form-control2" id="quaedu" style="width: 100px;text-align:center;width: 130px;" placeholder="Qualification for education"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,8)" class="form-control2" id="counam" style="width: 100px;text-align:center;width:82px" placeholder="Country Name"disabled></textarea></th>	
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,9)" class="form-control2" id="acqudat" style="width: 100px;text-align:center;width:82px" placeholder="Acquisition Date"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,10)" class="form-control2" id="matudat" style="width: 100px;text-align:center;width:82px" placeholder="Maturity Date"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,11)" class="form-control2" id="currcod" style="width: 100px;text-align:center;width:82px" placeholder="Currency code"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,12)" class="form-control2" id="nomival" style="width: 100px;text-align:center;width:82px" placeholder="Nominal value"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,13)" class="form-control2" id="tradcos" style="width: 100px;text-align:center;width:82px" placeholder="Trading Book Cost"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,14)" class="form-control2" id="bankcos" style="width: 100px;text-align:center;" placeholder="Banking Book Cost"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,15)" class="form-control2" id="sharpc" style="width: 52px;text-align:center;" placeholder="Share Pcnt"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,16)" class="form-control2" id="pagregap" style="width: 68px;text-align:center;" placeholder="Date Reg Appr"disabled></textarea></th>
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,17)" class="form-control2" id="invesdip" style="width: 100px;text-align:center;" placeholder="Invest Value Diposed"disabled></textarea></th>					
						<th style="text-align:center;"><textarea type="text"  onkeyup="myFunction(this.id,18)" class="form-control2" id="redat" style="width: 56px;text-align:center;" placeholder="Report Date"disabled></textarea></th>					
											
						<th id="modify1">Modify</th>
											
					
					</tr>
					
				</thead>
				
					<tbody class="databody" id="det1">


 


              </tbody>
              
              
				</table>

				</div>
      <div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary btnhome" id="btnhome">Home</button>
                 
                <button type="button" class="btn btn-xs btn-primary btnback" value="back" id="btnback">Back</button>
            </div>
        
				
			
				</div>
				
				
            </div>
            

     </form>
    
    
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
 



</body>
</html>