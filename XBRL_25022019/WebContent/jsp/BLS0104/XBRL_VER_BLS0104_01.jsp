
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLBLS0104Bean,dao.XBRLBLS0104Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
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

 
</style>




<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){
	$(".table").show();

	$("#btnfilter").on("click",function(){
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
		}else{
			$(".form-control2").val("");
			$(".form-control2").prop("disabled",true);
			 
			  var   table, tr, td, i;
			 table = document.getElementById("det1");
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
		 location.href="XBRL_CRT_BLS0104_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});


	 $.ajax({
	     url : "bls0104verify",
	     /* data : detcancel  , */
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 var srno=1;
				 $("#det1 tr").remove();
					var cnt1=1;
				
				var b=JSON.parse(res.detBLS0104);
				 console.log(b);
				 if(b.length==0){
					 $("#det1").append('<tr ><td colspan="12" style="text-align:center;color:red;">No Records Available</td></tr>');
				 }else{
					 
				 
					 		for(var i=0;i<b.length;i++){
					 			
					 		  $("#det1").append('<tr id="bls4add'+cnt1+'"><td  id="actnum_row'+cnt1+'">'+b[i].actnum+'</td><td  id="cusid_row'+cnt1+'">'+b[i].cusid+'</td><td  id="cusnam_row'+cnt1+'">'+b[i].cusnam+'</td><td  id="cusnrflg_row'+cnt1+'">'+b[i].cusnrflg+'</td><td  id="accurcode_row'+cnt1+'">'+b[i].accurcode+'</td><td class="sumder" id="balastmon_row'+cnt1+'">'+b[i].balastmon+'</td><td class="sumder" id="balcurmon_row'+cnt1+'">'+b[i].balcurmon+'</td><td class="sumder" id="accrint_row'+cnt1+'">'+b[i].accrint+'</td><td  id="accrtyp_row'+cnt1+'">'+b[i].accrtyp+'</td><td  id="reportdate_row'+cnt1+'">'+b[i].reportdate+'</td><td id="modtyp_row'+cnt1+'">'+b[i].modtyp+'</td><td style="text-align:center;"><input type="button" id="verify_button'+cnt1+'" value="Verify" class="btn btn-xs btn-primary verify" style="width: 37px;" onclick=verify_row("'+cnt1+'")>  <input type="button" id="Cancel_button'+srno+'" value="Cancel" class="btn btn-xs btn-primary Cancel" style="width: 44px;  " onclick=Cancel_row("'+cnt1+'")><input type="hidden" id="entryuser'+cnt1+'"  value='+b[i].entryuser+'></td></tr>');

					                     
					                     
					   
							 srno++;
							 cnt1++;
							 
							 
								} 
				 }$("#divLoading").removeClass('show');
			}
		});

 	

		
});	

function Cancel_row(no){
	
	var detcancel={
			"actnum":$("#actnum_row"+no).text() ,"date":$("#reportdate_row"+no).text()
	};
	
	 $.ajax({
	     url : "BLS0104cancel",
	     data : detcancel  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 
         alert(res.resalert);
         location.href = "XBRL_VER_BLS0104_01.jsp";
			}
		});
}


function verify_row(no){

	if($("#entryuser"+no).val()=='<%=username%>'){
		alert("Same user cannot Verify");
	}else{
		
	
	
	var detver={
			"actnum":$("#actnum_row"+no).text() ,"cusid":$("#cusid_row"+no).text() ,"cusnam":$("#cusnam_row"+no).text(),"cusnrflg":$("#cusnrflg_row"+no).text(),"accurcode":$("#accurcode_row"+no).text() ,"balastmon":$("#balastmon_row"+no).text(),"balcurmon":$("#balcurmon_row"+no).text(),"accrint":$("#accrint_row"+no).text() ,"accrtyp":$("#accrtyp_row"+no).text(),"date":$("#reportdate_row"+no).text()
	};
	
	 $.ajax({
	     url : "BLS0104vermaster",
	     data : detver  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
         alert(res.resalert);
         location.href = "XBRL_VER_BLS0104_01.jsp";
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



.databody td{
border:1px solid #ddd;
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
   padding-right: 208px;
}
</style>


<script>
function myFunction(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("det1");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==5 ||b==6 || b==7||b==0||b==9){
		
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
   
   
  
    
    <form class="form-horizontal" method="post" name="BLS0104Form"
		enctype="multipart/form-data">
    
    
    <div id="nav">
    <div class="loader"></div>
   
         <div id="tab3" >
			  
			 
            
            
            
            
            

 
		
	 	<div class="tab-content"  >
	 	
	 	
				
				<div class="tab-pane" id="tab2" style="width: 1400px;padding-top: 1px;margin-top: -17px;display:block;">
<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>BLS0104- Change In Deposits Held And Credit Extended To Residents And Non-Residents<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"> 
			 <b id="sub" style="display: none"></b></b></div>
					
					 <div id="divLoading"> 
    </div> 
     <br>
     <div class="panel panel-primary filterable">
   
    
     <table class="table" style="width:1400px;height:72px; ">
          		  <tr > <td style="background-color: #bbc3cb;"> <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;float:right;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></tr>
          		  
          		  
          		  	</table>	
          		  
          	   <table class="table tb1" id="tb1" style="width:100%;margin-top:-33px;"><tr>			
         	 
 				<tr class="filters">
				    	 <th style="text-align:center;"><input type="text"  onkeyup="myFunction(this.id,0)" class="form-control2" id="cusid" style="width: 87px;text-align:center;"placeholder="Account Number"disabled> </th>				
						<th style="text-align:center;"><input type="text" onkeyup="myFunction(this.id,1)" class="form-control2" id="cusnam" style="width: 100px;text-align:center;" placeholder="Customer Id"disabled></th>
						<th style="text-align:center;"><input type="text" onkeyup="myFunction(this.id,2)" class="form-control2" id="cusgrp" style="width: 100px;text-align:center;" placeholder="Customer Name"disabled></th>
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction(this.id,3)" class="form-control2" id="cussugrp"  style="width: 50px;text-align:center;" placeholder="Non Resident Flag" disabled></th>
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction(this.id,4)" class="form-control2" id="isiccod" style="width: 120px;text-align:center;" placeholder="Account Currency Code" disabled></th>
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction(this.id,5)" class="form-control2" id="unicod" style="width: 120px;text-align:center;" placeholder="Balance On Last Month"disabled></th>
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction(this.id,6)" class="form-control2" id="exsutyp" style="width: 125px;text-align:center;" placeholder="Balance On Current Month"disabled></th>
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction(this.id,7)" class="form-control2" id="balamtac" style="width: 100px;text-align:center;" placeholder="Accured Interest"disabled></th>
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction(this.id,8)" class="form-control2" id="curcod" style="width: 100px;text-align:center;" placeholder="Account Type"disabled></th>	
						<th style="text-align:center;"><input type="text"  onkeyup="myFunction(this.id,9)" class="form-control2" id="repdat" style="width: 100px;text-align:center;" placeholder="Report Date"disabled></th>
<th style="text-align:center;" id="modtyp">Modify Type</th>
						<th style="text-align:center;width:115px" id="modify1">Verify/Cancel</th>
											
					
					</tr>
					
				
				
					<tbody class="databody" id="det1">


 


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