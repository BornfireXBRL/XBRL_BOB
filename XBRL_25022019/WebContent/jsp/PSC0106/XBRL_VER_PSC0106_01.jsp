<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLPSC0106Bean,dao.XBRLPSC0106Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    <%@ page import="java.text.DateFormat,java.util.Date,java.text.SimpleDateFormat,utilities.NullCheck"%>
    


   
  
    <%
    DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Date date = new Date();	
	String username = session.getAttribute("userName").toString();
    String curdate = dateFormat.format(date);
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

.tables {
    width: 109%;
    max-width: 117%;
    margin-bottom: 20px;
}


.glyphicon {
   
    font-weight: 600;
   
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
	height: 15px;
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

.tab-content > .active {
  display: block;
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
/* .show {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url('../../images/Loader.gif') 30% 30% no-repeat rgb(249,249,249);
    opacity: .8;
} */
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
	
	-webkit-text-fill-color: #333333;
}

	.container {
    padding-right: 0px;
    padding-left: 0px;
    margin-right: auto;
    margin-left: auto;
}
	
</style>




<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){

$(".tb1").show();


$("#btnfilter").on("click",function(){
	if($(".form-control2").prop("disabled")==true){
		$(".form-control2").prop("disabled",false);
		 $('#accno ,#acname,#scode,#stype,#iscode,#sflag,#outamt,#impflg,#accopndat,#rendat,#secflg ,#reflg,#resdat,#sanamt,#acccrcode,#repdat').css({
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
		
		 $('#accno ,#acname,#scode,#stype,#iscode,#sflag,#outamt,#impflg,#accopndat,#rendat,#secflg ,#reflg,#resdat,#sanamt,#acccrcode,#repdat').css({
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
			 table = document.getElementById("pymdets");
			 tr = table.getElementsByTagName("tr");
			 for (i = 0; i < tr.length; i++) {
				 
					 
					 tr[i].style.display = ""; 
					 
			 
				 
			 }
			
	}
	
});
			
			
			
			
	
	$( "#btnhome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	$( '#btnback').click(function() {
		 location.href="XBRL_CRT_PSC0106_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});

	 $.ajax({
	     url : "PSC0106verify",
	     /* data : detcancel  , */
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 var srno=1;
				 $("#pymdets tr").remove();
					var cnt1=1;
				var b=JSON.parse(res.detpsc0106);
				 console.log(b);
				 if(b.length==0){
					 $("#pymdets").append('<tr ><td colspan="21" style="text-align:center;color:red;">No Records Available</td></tr>');
				 }else{
					 
				 
					 		for(var i=0;i<b.length;i++){
					 		
					 			
					 			
								                    
					 			 $("#pymdets").append("<tr ><td id='accno_row"+srno+"'>"+b[i].accno+"</td><td id='acnam_row"+srno+"'>"+b[i].acnam+"</td><td id='scode_row"+srno+"'>"+b[i].scode+"</td><td class='sumder alnum' id='stype_row"+srno+"'>"+b[i].stype+"</td><td class='sumder alnum' id='iscode_row"+srno+"'>"+b[i].iscode+"</td><td id='sflag_row"+srno+"'>"+b[i].sflag+"</td><td id='outamt_row"+srno+"'>"+b[i].outamt+"</td><td class='sumder alnum'id='impflg_row"+srno+"'>"+b[i].impflg+"</td><td id='accopndat_row"+srno+"'>"+b[i].accopndat+"</td><td class='sumder alnum' id='rendat_row"+srno+"'>"+b[i].rendat+"</td><td id='secflg_row"+srno+"'>"+b[i].secflg+"</td><td id='reflg_row"+srno+"'>"+b[i].reflg+"</td><td id='resdat_row"+srno+"'>"+b[i].resdat+"</td><td id='sanamt_row"+srno+"'>"+b[i].sanamt+"</td><td id='acccrcode_row"+srno+"'>"+b[i].acccrcode+"</td><td id='repdat_row"+srno+"'>"+b[i].repdat+"</td><td id='modtyp_row"+srno+"'>"+b[i].modtyp+"</td><td style='text-align:center;'><input type='button' id='verify_button"+srno+"' value='Verify' class='btn btn-xs btn-primary verify' style='width: 37px;' onclick=verify_row('"+srno+"')>  <input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;' onclick=Cancel_row('"+srno+"')><input type='hidden' id='entryuser"+srno+"'  value="+b[i].entryuser+"></td>"
						                    
					                     
					                     
					                      
						                    +"</tr>" ) ;    
								 		  
							 srno++;
							 cnt1++;
							 
							 
								} 
				 }$("#divLoading").removeClass('show');
			}
		});

 	

		
});	

function Cancel_row(no){
	
	var detcancel={
			"accno":$("#accno_row"+no).text()
	};
	
	 $.ajax({
	     url : "PSC0106cancel",
	     data : detcancel  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 
         alert(res.resalert);
         location.href = "XBRL_VER_PSC0106_01.jsp";
			}
		});
}


function verify_row(no){
	
	if($("#entryuser"+no).val()=='<%=username%>'){
		alert("Same user cannot Verify");
	}else{
		
		
		var rendat=document.getElementById("rendat_row"+no).innerHTML;
		var stype=document.getElementById("stype_row"+no).innerHTML;

		var iscode=document.getElementById("iscode_row"+no).innerHTML;
		var impflg=document.getElementById("impflg_row"+no).innerHTML;

		
		
		rendat=rendat.replace(/\,/g,'')
		rendat=Number(rendat)
		
		stype=stype.replace(/\,/g,'')
		stype=Number(stype)
		
		iscode=iscode.replace(/\,/g,'')
		iscode=Number(iscode)

		impflg=impflg.replace(/\,/g,'')
		impflg=Number(impflg)

	var detver={
			"accno":$("#accno_row"+no).text() ,"acnam":$("#acnam_row"+no).text(),"scode":$("#scode_row"+no).text(),"stype":$("#stype_row"+no).text(),"iscode":$("#iscode_row"+no).text(),"sflag":$("#sflag_row"+no).text() ,"outamt":$("#outamt_row"+no).text(),"impflg":$("#impflg_row"+no).text(),"accopndat":$("#accopndat_row"+no).text(),"rendat":$("#rendat_row"+no).text(),"secflg":$("#secflg_row"+no).text(),"reflg":$("#reflg_row"+no).text(),"resdat":$("#resdat_row"+no).text(),"sanamt":$("#sanamt_row"+no).text() ,"acccrcode":$("#acccrcode_row"+no).text(),"repdat":$("#repdat_row"+no).text(),"modtyp":$("#modtyp_row"+no).text(),"entryuser":$("#entryuser_row"+no).text()
	};
	
	 $.ajax({
	     url : "PSC0106vermaster",
	     data : detver  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
         alert(res.resalert);
         
         location.href = "XBRL_VER_PSC0106_01.jsp";
			}
		});
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
/* .loader {
   position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url('../../images/Loader.gif') 30% 30% no-repeat
		rgb(249, 249, 249);
	opacity: .8;
}  */



.databody td{
border:1px solid #ddd;
}



#divLoading {
	display: none;
}
/* 
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
} */

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

.clr{
color: #0c0b0b;
    background-color: #f5f5f5;
    border-color: #f5f5f5;
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
   padding-right: 0px;
}


.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	padding: 0px;
}
</style>


<script>
function myFunction(a,b) {
	
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("pymdets");
  /* table = document.getElementById("pymdets2"); */

  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==0 || b==9 ||b==10 || b==12 ||b==13|| b==14 ||b==16 || b==17 ||b==17 || b==18){
		
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

<body>
<div class="container">
   
   
  
    
    <form class="form-horizontal" method="post" name="DCG0100Form"
		enctype="multipart/form-data">
    
    
    <div id="nav">
    <div class="loader"></div>
   
         <div id="tab3" >
			  
			 
            
            
            
            
            

 
		
	 	<div class="tab-content"  >
	 	
	 	
				
			
				<div class="activetab1" id="tab1" style="width: 1500px;padding-top: 1px;margin-top: -17px;display:block;">
<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>PSC0106List of names of SMEs - SME Financing Scheme and MSME<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"> 
			 <b id="sub" style="display: none"></b></b></div>
					
					 <div id="divLoading"> 
    </div> 
     <br>
     <div class="panel panel-primary filterable">
   
    
     <table class="table" style="width:1500px;height:72px; ">
          		  <tr > <td style="background-color: #bbc3cb;"> <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;float:right;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></tr>
          		  
          		  
          		  	</table>	
          		  
          	
					<table class="table" id="tbcates" border="1" style="margin-top: -42px;width:1500px">
            
          
          
            
								<tr class="filters">
            <th rowspan="2" style="width:1%;"><textarea  style="text-align:center;width:70px;" type="text"id="accno" onkeyup="myFunction(this.id,0)"class="form-control2" placeholder="Account No" disabled></textarea></th>
               <th style="width:2%;"><textarea style="text-align:center;width:60px;" type="text"id="acnam" onkeyup="myFunction(this.id,1)"class="form-control2" placeholder="Account Name" disabled></textarea></th>
                <th style="width:1%;" ><textarea style="text-align:center;width:70px;" type="text"id="scode" onkeyup="myFunction(this.id,2)"class="form-control2" placeholder="Scheme Code" disabled></textarea></th>
               <th style="width:1%;" ><textarea style="text-align:center;width:70px;" type="text"id="stype" onkeyup="myFunction(this.id,3)"class="form-control2" placeholder="Scheme Type" disabled></textarea></th>
               <th style="width:1%;" ><textarea style="text-align:center;width:70px;" type="text"id="iscode" onkeyup="myFunction(this.id,4)"class="form-control2" placeholder="ISIC Code" disabled></textarea></th>
               <th style="width:1%;" ><textarea style="text-align:center;width:70px;" type="text"id="sflag" onkeyup="myFunction(this.id,5)"class="form-control2" placeholder="SME Flag" disabled></textarea></th>
               <th style="width:1%;"><textarea  style="text-align:center;width:70px;" type="text"id="outamt" onkeyup="myFunction(this.id,6)"class="form-control2" placeholder="Outstanding Amount" disabled></textarea></th>
               <th style="width:1%;"><textarea  style="text-align:center;width:70px;" type="text"id="impflg" onkeyup="myFunction(this.id,7)"class="form-control2" placeholder="Impaired Flag" disabled></textarea></th>
               <th style="width:1%;"><textarea style="text-align:center;width:70px;" type="text"id="accopndat" onkeyup="myFunction(this.id,8)"class="form-control2" placeholder="Account Opening Date" disabled></textarea></th>
               <th style="width:1%;"><textarea style="text-align:center;width:70px;" type="text"id="rendat" onkeyup="myFunction(this.id,9)"class="form-control2" placeholder="Renewal Date" disabled></textarea></th>
               <th style="width:1%;"><textarea style="text-align:center;width:70px;" type="text"id="secflg" onkeyup="myFunction(this.id,10)"class="form-control2" placeholder="Secured Flag" disabled></textarea></th>
               <th style="width:1%;"><textarea style="text-align:center;width:70px;" type="text"id="reflg" onkeyup="myFunction(this.id,11)"class="form-control2" placeholder="Restructured Flag" disabled></textarea></th>
             <th style="width:1%;"><textarea style="text-align:center;width:70px;" type="text"id="resdat" onkeyup="myFunction(this.id,12)"class="form-control2" placeholder="Restructured Date" disabled></textarea></th>
               <th style="width:1%;"><textarea style="text-align:center;width:70px;" type="text"id="sanamt" onkeyup="myFunction(this.id,13)"class="form-control2" placeholder="Sanction Amount" disabled></textarea></th>
               <th style="width:1%;"><textarea style="text-align:center;width:70px;" type="text"id="acccrcode" onkeyup="myFunction(this.id,14)"class="form-control2" placeholder="Account Currency Code" disabled></textarea></th>
              
               <th style="width:1%;"><textarea style="text-align:center;width:70px;" type="text"id="repdat" onkeyup="myFunction(this.id,15)"class="form-control2" placeholder="Report Date" disabled></textarea></th>
									<th style="width:1%;" id="modify">Modify</th>
																		<th style="width:2%" id="modify">Modify</th>
									

								</tr>
					
					
					
					
				
				
					<tbody class="databody" id="pymdets">


              </tbody>
              
             
            				
					
				</table>
				
				
				</div>
				<div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
           
               
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