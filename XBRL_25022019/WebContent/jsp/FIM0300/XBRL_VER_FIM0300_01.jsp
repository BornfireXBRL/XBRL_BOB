<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLFIM0300Bean,dao.XBRLFIM0300Dao,java.util.ArrayList,java.util.Iterator,utilities.NullCheck,java.text.DecimalFormat"%>
    
    
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

	String types=request.getParameter("types");

	String instno = request.getParameter("instno");


	String ReporefSeq = request.getParameter("ReporefSeq");

 	DecimalFormat df = new DecimalFormat("##,#0.00");
	
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
#FIMdets td{
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
</style>




<script>
 $(window).load(function() {
    $(".loader").fadeOut("slow");
});
$(document).ready(function(){

	$("#btnfilter").on("click",function(){
		
		if($(".form-control2").prop("disabled")==true){
			
			$(".form-control2").prop("disabled",false);

			 $('#country,#accname,#custid,#glshcode,#schmcode,#schmtyp,#accrycde,#baldte,#balamt').css({
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
			$(".form-control2").prop("disabled",true);
			 $('#country,#accname,#custid,#glshcode,#schmcode,#schmtyp,#accrycde,#baldte,#balamt').css({
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
			 table = document.getElementById("FIMdets");
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
		 location.href="XBRL_CRT_FIM0300_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';

		});


	 $.ajax({
	     url : "FIM0300verify",
	     /* data : detcancel  , */
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				 var srno=1;
				 $("#FIMdets tr").remove();
					var cnt1=1;
					var srno=1;
				var b=JSON.parse(res.ver);
				 console.log(b);
				 if(b.length==0){
					 $("#FIMdets").append('<tr ><td colspan="11" style="text-align:center;color:red;">No Records Available</td></tr>');
				 }else{
					 
				 
					 		for(var i=0;i<b.length;i++){
					 			

					                     
					                     
					                      
					 		 $("#FIMdets").append(
										
										
					 				 "<tr  id='fimadd"+cnt1+"'>"
					 				  +"<td  id='country_row"+srno+"'>"+b[i].country+"</td>"	
				                      +"<td  id='currencycode_row"+srno+"'>"+b[i].currencycode+"</td>"	
				                      +"<td  id='units_row"+srno+"'>"+b[i].units+"</td>"
				                      
				                      
				                      +"<td style=text-align:right; id='ttbrate_row"+srno+"'>"+b[i].ttbrate+"</td>"
				                      +"<td  style=text-align:right; id='tcbrate_row"+srno+"'>"+b[i].tcbrate+"</td>"
				                      +"<td  style=text-align:right; id='ntbrate_row"+srno+"'>"+b[i].ntbrate+"</td>"
				                      
				                      +"<td style=text-align:right; id='ttsrate_row"+srno+"'>"+b[i].ttsrate+"</td>"
				                      +"<td style=text-align:right; id='ntcrate_row"+srno+"'>"+b[i].ntcrate+"</td>"	
			  +"<td id='modtyp_row"+cnt1+"' style='width:200px;'>"+b[i].modtyp+"</td><td style='text-align:center;'><input type='button' id='verify_button"+cnt1+"' value='Verify' class='btn btn-xs btn-primary verify' style='width: 37px;' onclick=verify_row('"+cnt1+"')>  <input type='button' id='Cancel_button"+srno+"' value='Cancel' class='btn btn-xs btn-primary Cancel' style='width: 44px;' onclick=Cancel_row('"+cnt1+"')><input type='hidden' id='entryuser"+cnt1+"'   value="+b[i].entryuser+"></td>"
			  
			 
              
                +"</tr>" ) ;   
					 		 
				
							
							 srno++;
							 cnt1++;
							 
							 
								} 
				 }$("#divLoading").removeClass('show');
			}
		});

 	

		
});	

function Cancel_row(no){
	 /*  document.getElementById("del_button"+no).style.display="inline-block"; */
	 
	
		var detcancel={
				"country":$("#country_row"+no).text()
		};
		
	
		 $.ajax({
		     url : "FIM0300cancel",
		     data : detcancel  ,
				dataType : 'json', 
				type : 'POST',
				async : true,
				 success : function(res) {
					
	         alert("Cancellation Successful");
	       location.href="XBRL_VER_FIM0300_01.jsp";
				}
			});
	}
	 


function verify_row(no){
	
	
	if($("#entryuser"+no).val()=='<%=username%>'){
		alert("Same user cannot Verify");
	}else{
		var units=document.getElementById("units_row"+no).innerHTML;

		var ttbrate=document.getElementById("ttbrate_row"+no).innerHTML;

		var tcbrate=document.getElementById("tcbrate_row"+no).innerHTML;

		var ntbrate=document.getElementById("ntbrate_row"+no).innerHTML;
		
		var ttsrate=document.getElementById("ttsrate_row"+no).innerHTML;
		var ntcrate=document.getElementById("ntcrate_row"+no).innerHTML;

		

	var detver={

			
		  "country":$("#country_row"+no).text(),

		  "currencycode":$("#currencycode_row"+no).text(),

		  "units":$("#units_row"+no).text(),

		  "ttbrate":$("#ttbrate_row"+no).text(),

		  "tcbrate":$("#tcbrate_row"+no).text(),

		  "ntbrate":$("#ntbrate_row"+no).text(),

		

		

		  "ttsrate":$("#ttsrate_row"+no).text(),

		  "ntcrate":$("#ntcrate_row"+no).text(),
	};

	 $.ajax({
	     url : "FIM0300vermaster",
	     data : detver  ,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
         alert(res.resalert);
         location.href = "XBRL_VER_FIM0300_01.jsp";
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
  table = document.getElementById("FIMdets");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	if(b==0 || b==2){
		
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
   
   
  
    
    <form class="form-horizontal" method="post" name="FIM0300Form"
		enctype="multipart/form-data">
    
    
    <div id="nav">
    <div class="loader"></div>
   
         <div id="tab3" >
			  
			 
            
            
            
            
            

 
		
	 	<div class="tab-content"  >
	 	
	 	
				
				<div class="tab-pane" id="tab2" style="width: 1302px;padding-top: 1px;margin-top: -17px;display:block;">
<div style="text-align:left;    margin-top: 40px;"><font size="2" style="font-size: 13px;" ><b>
 - Balance sheet<b id="sub"
					Style="display: none"></b></b></font>
			<br><b style="font-size: 13px;"> 
			 <b id="sub" style="display: none"></b></b></div>
					
					 <div id="divLoading"> 
    </div> 
     <br>
     <div class="panel panel-primary filterable">
   
    
     <table class="table" style="width:1302px;height:51px; ">
          		  <tr > <td style="background-color: #bbc3cb;"> <a class="btn btn-default btn-xs btn-primary" style="margin-left: 10px;float:right;" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</a></tr>
          		  
          		  
          		  	</table>	
          		  
          	
					<table class="table" id="tbcates" border="1" style="margin-top: 0px;width:1302px">
            
          
					<tr class="filters">
						<th  rowspan="5" ><textarea type="text" id="country" style="width:150px;" onkeyup="myFunction(this.id,0)" class="form-control2" placeholder="Country" disabled></textarea></th>
						
						<th rowspan="5"><textarea type="text"  style="width:70px;" id="currencycode" onkeyup="myFunction(this.id,1)" class="form-control2" placeholder="Currency ISO Code" disabled></textarea></th>
						<th rowspan="5" ><textarea type="text" style="width:100px;" id="units" onkeyup="myFunction(this.id,2)" class="form-control2" placeholder="Units" disabled></textarea></th>
						
						
						

					</tr> 
					
					
					<tr>
	
						<th colspan="3" style="width:150px;,text-align:center;">BUYING</th>
						
						
						<th colspan="2" style="width:150px;,text-align:center;">SELLING</th>
						
						<th  rowspan="5" style="text-align:center;width:115px;" id="modtyp">ModType</th>						
					<th rowspan="5" style="text-align:center;width:332px;" id="modify">Verify/Cancel</th>	
					</tr> 
					
					
					
					<tr class="filters">
						
						
						<th ><textarea type="text" id="ttbrate" onkeyup="myFunction(this.id,3)" class="form-control2" placeholder="T.T" disabled></textarea>
						
						</th>
						
						
						<th ><textarea type="text" id="tcbrate" onkeyup="myFunction(this.id,4)" class="form-control2" placeholder="T.C/D.D" disabled></textarea>
						
						</th>
						
						<th ><textarea type="text" id="ntbrate" onkeyup="myFunction(this.id,5)" class="form-control2" placeholder="NOTES" disabled></textarea>
						
						</th>
						<th ><textarea type="text" id="ttsrate" onkeyup="myFunction(this.id,6)" class="form-control2" placeholder="T.T./D.D/T.C" disabled></textarea>
						
						</th>
						
						<th ><textarea type="text" id="ntcrate" onkeyup="myFunction(this.id,7)" class="form-control2" placeholder="NOTES" disabled></textarea>
						
						</th>
							
						
					</tr> 
					
				
						<tr>
						
						
						<th >A
						
						
						</th>
						
						
						<th >B
						
						</th>
						
						<th >C
						
						</th>
						<th >D
						
						</th>
						
						<th >E
						
						</th>
											
						
					
					</tr>
					
					<tbody class="databody" id="FIMdets">

            
					
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