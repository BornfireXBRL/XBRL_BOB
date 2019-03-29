<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%
    
    String dt1 = request.getParameter("dt1");
    String dt2 = request.getParameter("dt2");
    String reptype=request.getParameter("reptype");
    String curr = request.getParameter("curr");
    String typo=request.getParameter("typo");
 %>
<html>
<head>
<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;url=../XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">




<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SUP0101</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="../../CSS/bootstrap.min.css">

<!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../CSS/bootstrap-datepicker.css" />
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
	
	
	<script src="https://cdn.jsdelivr.net/sweetalert2/5.3.8/sweetalert2.js"></script>
<link href="https://cdn.jsdelivr.net/sweetalert2/5.3.8/sweetalert2.css" rel="stylesheet"/>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
	
	
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
    z-index:105;
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
	
}
/* 
tr:hover td{
    background: #bebfb0 !important;
}

 */

</style>

<script>
$(document).ready(function(){
	
	if('<%=request.getParameter("typo")%>'=="edit"){
		$("#btnedit").show();
		$("#btnadd").hide();
		var seldata={
			"dt2":'<%=request.getParameter("dt2")%>'	
		};
		$.ajax({
			url:"sup0101Formselect",
			data:seldata,
			dataType:'json',
			type:'POST',
			async:false,
			success:function(res){
				$('#apndata tr').remove();
				var b=JSON.parse(res.SUP0101arr);
				 console.log(b);
				 var cnt=1;
				 for(var i=0;i<b.length;i++){
				if(b[i].adrs=="-"){
					b[i].adrs="";
				}if(b[i].lcn=="-"){
					b[i].lcn="";
				}
					  		var data="<tr id='tr"+cnt+"'>";
					        data +=" <td id='srno"+cnt+"' >"+cnt+"</td>";
					       data +="<td><input type='text' id='adrs"+cnt+"' name='adrs' class='form-control'  value="+b[i].adrs+"  /></td>";
					        data +="<td><input type='text' id='lcn"+cnt+"' name='lcn' class='form-control'  value="+b[i].lcn+"  /></td>";
					        data +=" <td><input type='text' id='nofatm"+cnt+"' name='nofatm' class='form-control syscode'  value="+b[i].nofatm+" /></td><td> <button type='button' style='width: 30px;margin-top:3px;' class='btn btn-xs btn-danger' onclick='fnremove("+cnt+")' id='btnrmv' >X</button></td>";
					        
					
					      $('#apndata').append(data);
					      
					     cnt++;
					    
				 }
				  $("#rowno").val(cnt-1);
				$(".form-control").attr("readonly",true);
				$("#btnSubmit").hide();
			}
		}); 
		
	}else{
		$("#btnedit").hide();
	}

$("#btnadd").on('click',function(){
	var i=parseInt($("#rowno").val());
	i++;

  		var data="<tr id='tr"+i+"'>";
        data +="<td id='srno"+i+"'>"+i+"</td>";
       data +="<td><input type='text' id='adrs"+i+"' name='adrs' class='form-control'  value=''  /></td>";
        data +="<td><input type='text' id='lcn"+i+"' name='lcn' class='form-control'  value=''  /></td>";
        data +=" <td><input type='text' id='nofatm"+i+"' name='nofatm' class='form-control syscode'  value='' /></td><td> <button type='button' style='width: 20px;margin-top:3px;' class='btn btn-xs btn-danger' onclick='fnremove("+i+")' id='btnrmv' >X</button></td>";
        

      $('#apndata').append(data);
      
     
      $("#rowno").val(i++);
});

});

function fnremove(a){
	$('#tr'+a).remove();
}
</script>

<script>
$(document).ready(function(){


		$("#btnMsubmit").on("click",function(){
			var adrs="";
			var lcn="";
			var nofatm="";
			var cnt=0;
			$("input[name='adrs']").each(function(){
				alert(this.value=="");
				if(this.value==""){
					adrs=adrs+"/"+"-";
					cnt++;
				}else{
					adrs=adrs+"/"+this.value;
					cnt++;
				}
				
			});
			$("input[name='lcn']").each(function(){
				if(this.value==""){
					lcn=lcn+"/"+"-";
				}else{
				lcn=lcn+"/"+this.value;
				}
			});
			$("input[name='nofatm']").each(function(){
				if(this.value==""){
					nofatm=nofatm+"/"+"0";
				}else{
				nofatm=nofatm+"/"+this.value;
				}
			});
			
			var insdata={
				"adrs":adrs,
				"lcn":lcn,
				"nofatm":nofatm,
				"cnt":cnt,
				"dt2":'<%=request.getParameter("dt2")%>',
				"type":"modify"
			};
			$.ajax({
				url:"sup0101Forminsert",
				data:insdata,
				dataType:'json',
				type:'POST',
				async:false,
				success:function(res){
					alert(res.alert);
					$(".form-control").attr("readonly",true);
					$("#btnSubmit").hide();
					$("#btnedit").show();
					$("#btnMsubmit").hide();
					$("#btnedit").attr("disabled",false);
					$("#btnadd").hide();
					
					 var datasum={
								"dt1":'<%=dt1%>',"dt2":'<%=dt2%>',"reptype":'<%=reptype%>',"curr":'<%=curr%>',"refno":$("#refDisplay").text()

					};
					$.ajax({
						url:"saveSums101",
						data:datasum,
						dataType:'json',
						type:'POST',
						async:false,
						success:function(res){
							alert("Saved Successfully");
							$("#btnXML").show();
						
						}
					});  
				}
			}); 
					 
		});
	
	$('#btnXML').click(function() {
		SUP0101Form.action = "XMLDOWNLOADs101.action?method=pymxml&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&ReporefSeq="+$("#refDisplay").html()+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
		SUP0101Form.submit(); 
	});
	
	$( "#btnHome" ).click(function() {
		location.href = "../XBRLHomePage.jsp";
		});
	
	$("#btndwnld").on("click",function(){
		if($("#dnloadfrmt").val()=="excel"){
			SUP0101Form.action = "SUP0101EXCELSum.action?method=SUP0101EXCELsums&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			SUP0101Form.submit();
		}else if($("#dnloadfrmt").val()=="pdf"){
			SUP0101Form.action = "SUP0101PDFREPORT.action?method=SUP0101PDF&dt1="+'<%=dt1%>'+"&dt2="+'<%=dt2%>'+"&reptype="+'<%=reptype%>'+"&curr="+'<%=curr%>';
			SUP0101Form.submit();
		}
	});
	$("#btnBack").on("click",function(){
		location.href="XBRL_CRT_SUP0101_01.jsp?reptype="+'<%=request.getParameter("reptype")%>';
	});
	$("#btnedit").on("click",function(){
		$("#btnadd").show();
		$("#btnedit").attr("disabled",true);
		$(".form-control").attr("readonly",false);
		$(".formnum").attr("readonly",true);
		$("#btnMsubmit").show();
	});
	$("#btnSubmit").on("click",function(){
		var adrs="";
		var lcn="";
		var nofatm="";
		var cnt=0;
		$("input[name='adrs']").each(function(){
			
			if(!this.value==""){
		
				adrs=adrs+"/"+this.value;
				cnt++;
			}
			
		});
		$("input[name='lcn']").each(function(){
			if(this.value==""){
				lcn=lcn+"/"+"-";
			}else{
			lcn=lcn+"/"+this.value;
			}
		});
		$("input[name='nofatm']").each(function(){
			if(this.value==""){
				nofatm=nofatm+"/"+"0";
			}else{
			nofatm=nofatm+"/"+this.value;
			}
		});
		
		var insdata={
			"adrs":adrs,
			"lcn":lcn,
			"nofatm":nofatm,
			"cnt":cnt,
			"dt2":'<%=request.getParameter("dt2")%>',
			"type":"add"
		};
		$.ajax({
			url:"sup0101Forminsert",
			data:insdata,
			dataType:'json',
			type:'POST',
			async:false,
			success:function(res){
				alert(res.alert);
				
				$(".form-control").attr("readonly",true);
				
		
					$("#btnSubmit").hide();
				
			}
		}); 
		
		
	});
		
	

	
});


</script>

<body>
<form class="form-horizontal" method="post" name="SUP0101Form" id="cform"
		enctype="multipart/form-data">
		
		
        <input type="hidden"id="authFlg" value=""/>
		
		<div class="panel-heading text-center" 
			style="width: 98%; margin-left:20px; margin-right: 25px; margin-top: 36px; margin-bottom: 20px; background-color: #bbc3cb;">

			<input type="hidden" name="sbn.lchgusrname" id="lchgusrname">
			<input type="hidden" name="sbn.lchgusrtime" id="lchgusrtime">
			<input type="hidden" name="sbn.rcreusrname" id="rcreusrname">
			<input type="hidden" name="sbn.rcreusrtime" id="rcreusrtime">
			<font size="2"><b style="margin-left:-10px"> SUP0101 -Locations of ATMs in Operations  <b id="sub" ></b></b></font>
			 <span style="margin-left: 400px;"><button type="button" class="btn btn-xs btn-primary" id="btnedit" style="display:none;">Edit</button>
			 <button type="button" class="btn btn-xs btn-primary" id="btnadd" >Add</button>
			 
			<!--   <button type="button" class="btn btn-xs btn-primary" id="btnInq" style="width: 60px;">List</button> -->
			 <a id="btndwnld"><i class="glyphicon glyphicon-download-alt" style="margin-left: 10px;
font-size: 16px;cursor:pointer"></i></a><select id="dnloadfrmt" style="border-radius: 4px;
    margin-left: 10px;"><option value="pdf">pdf</option><option value="excel">Excel</option></select>

			</span>
		</div>
		
		<div class="container-fluid" >

<input type="hidden" id="rowno" value="0">

		
             <table class="table"  style="width: 1024px; margin-top: -20px;margin-left: 6px;">
   
             <thead>
          <th colspan="6" style="text-align:center;font-size: 13px;text-align:center"><b>Locations of ATMs in Operation</b></th></tr>
          <tr>
         
          <th rowspan="2" style="text-align:center" id="srno" >Serial Number</th>
          <th style="text-align:center" id="adrs" >Address</th>
          <th style="text-align:center" id="lcn" >Location</th>
          <th  style="text-align:center" id="nofatm" >Number of ATMs</th>
          <th rowspan="2"  ></th>
          </tr>
          <tr>
          <th style="text-align:center">A</th>
          <th style="text-align:center">B</th>
          <th style="text-align:center">C</th>
          </thead>
          
           <tbody id="apndata"></tbody>
          </table>

					
				<div class="modal-footer" style="margin-top: 20px;">
                    <button type="button" class="btn btn-xs btn-primary" id="btnHome">Home</button>
                    <button type="button" class="btn btn-xs btn-primary" style="display:none;" id="btnModify">Modify</button>
                     <button type="button" class="btn btn-xs btn-primary" style="display:none;" id="btnMsubmit">Submit</button>
                  <!-- <button type="button" class="btn btn-xs btn-primary" value="Excel" id="btnSave">Save</button> -->
                 
                  <button type="button" class="btn btn-xs btn-primary" style="display:none" value="Excel" id="btnXML">Gen XML Sum</button>
                
					<button type="button" class="btn btn-xs btn-primary" id="btnSubmit">Submit</button>
					<button type="button" class="btn btn-xs btn-primary" id="btnBack">Back</button>
					
				</div>
		
	</form>
</body>
</html>