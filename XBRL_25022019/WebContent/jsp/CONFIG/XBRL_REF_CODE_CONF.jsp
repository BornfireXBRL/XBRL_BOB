<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;url=../XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">




<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>XBRL</title>




<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="ib.viewport">
	
	
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="../../css/Styles.css">
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="../../js/jQuery-2.2.0.min.js"></script>
  <link rel="stylesheet" href="../../css/jquery.dataTables.min.css">
  
 <script src="../../jQuery/jQuery-2.2.0.min.js"></script>
  <script src="../../jQuery/jquery.dataTables.min.js"></script>
  <script src="../../js/bootstrap.min.js"></script>

  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<style>

.tl {

border-style: solid;
    border-color: #337ab7;
    border-width: 1px;
   
}






/* .hover {
    background-color: #f1f1f1;
    padding: 0.01em 16px;
    margin: 20px 0;
    box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12)!important;
} */

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






  	.gmd-1{
		width:100%; 
		border-collapse:collapse; 
	}
	.gmd-1 td{ 
		padding:7px; border:#4e95f4 1px solid;
	}

    .gmd-1 tr:hover {
          background-color: #ffff99;
    }
    
    

body {
	font-family: Arial;
	background-color: #eee;
	 overflow-x:hidden;
	 
	   width: auto;
}

.form-control {
	height: 20px;
	border: 1px solid #6b6a6a;
	width: 170px;
	font-size: 11px;
	padding: 3px 12px;
}

.form-horizontal .control-label {
	text-align: left;
	padding-top: 0px;
}

textarea.form-control {
	height: 20px;
}

.form-horizontal .form-group {
	margin-top: -13px;
	margin-right: -93px;
	margin-left: -15px;
}

.panel-heading {
    padding: 0px 18px;
    padding-top: 3px;
    /* padding-right: 838px; */
    margin-left: 0px;
}



.modal-footer {
    text-align: center;
    border-top: 0;
    padding: 25px;
    padding-right: 34px;
}



.btn {
	width:55px;
}

.glyphicon {
	top: 4px;
	margin-left: -75px;
}

.tab-content {
    width: 78%;
    margin-left: 101px;
}

fieldset.scheduler-border {
	width: 840px;
	border: 1px groove #ddd !important;
	/*  padding:-1px 1.4em 1.4em !important;
    margin: 0 0 1.5em 40px !important; */
	margin-left: 111px;
	-webkit-box-shadow: 0px 0px 0px 0px #000;
	box-shadow: 0px 0px 0px 0px #000;
}

.dash-heading {
	float: right;
	padding-bottom: 12px;
	padding-right: 0px;
	padding-left: 0px;
}





.loader {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url('../images/Loader.gif') 30% 30% no-repeat rgb(249,249,249);
    opacity: .8;
}


</style>
<script>

$(document).ready(function(){
	
	
	
/* 	Load Referencecode Type on load */
	 $.ajax({
		    url:"refcodeType",
		    dataType:'json',
			type:'POST',
			async:true,
			success:function(res){
				$("#refcodetyp").empty();
			
			console.log(res.refcodetyp);	
			var b=JSON.parse(res.refcodetyp);
			/* $("#refcodetyp").append('<option value=''>'+Select+'</option>');  */
			for(var i=0;i<=b.length;i++){
				
				 if(i==0){
					
					$("#refcodetyp").append('<option value="">Select</option>');  
				} 
					$("#refcodetyp").append('<option value='+b[i].refcode+'/'+b[i].refcodeview+'>'+b[i].refdesc+'</option>');
				
				
			}
			}
	}); 
	
	 $("#refcodetyp").on("change",function(){
		 if($("#refcodetyp").val()==""){
				$("#tbody").empty();
				$("#tbody").append('<tr id="tr0" ><td colspan="4" style="text-align:center;color:red"><font size="1" >Choose Reference Code</font></td></tr>');
			}
		var refcodetype={
			"refcodetype":$("#refcodetyp").val().split("/")[1]	
		};
		$.ajax({
		    url:"refcode",
		    data:refcodetype,
		    dataType:'json',
			type:'POST',
			async:true,
			success:function(res){
				$("#refcode").empty();
				/* $("#refcode").append("<option value="">"+Select+"</option>");  */
			console.log(res.refcode);	
			var b=JSON.parse(res.refcode);
			for(var i=0;i<=b.length;i++){
				 if(i==0){
						
						$("#refcode").append('<option value="">Select</option>');  
					} 
				$("#refcode").append('<option value='+b[i].refcode+'/'+b[i].refdesc+'>'+b[i].refdesc+'</option>');
			}
			}
	});
	}); 
	 
	 $("#refcode").on("change",function(){
		 if($("#refcode").val()==""){
				$("#tbody").empty();
				$("#tbody").append('<tr id="tr0" ><td colspan="4" style="text-align:center;color:red"><font size="1" >Choose Reference Code</font></td></tr>');
			}else{
			var refcode={
				"refcodeview":$("#refcodetyp").val().split("/")[1],"refcode":$("#refcode").val().split("/")[0]	
			};
			$.ajax({
			    url:"refcodelist",
			    data:refcode,
			    dataType:'json',
				type:'POST',
				async:true,
				success:function(res){
					/* $("#refcode").append("<option value="">"+Select+"</option>");  */
				console.log(res.refcodelist);	
				$("#tbody").empty();
				var b=JSON.parse(res.refcodelist);
				
				 if(b.length==1){
					$(".delete").hide();
				}else{
					$(".delete").show();
				} 
				
				for(var i=0;i<=b.length;i++){
					
					$("#tb1").append('<tr id="tr'+i+'"><td></td><td><input type="text" class="form-control" id="refcode'+i+'" value='+b[i].refcode+' readonly></td><td><input type="text" class="form-control" id="refcodedesc'+i+'" value="'+b[i].refdesc+'" readonly></td><td><input type="text" class="form-control syscode" id="syscode'+i+'" value='+b[i].srcsyscode+'></td></tr>');
				
				$("#rowno").val(i);
				$("#footer").show();
				
				}
				}
			
		});
			
			}
		}); 
});
</script>
<body>

<div class="panel-heading text-center tl" 
			style="width: 86%; margin-left: 110px; margin-right: 0px; margin-top: 36px; margin-bottom: 20px; background-color: #bbc3cb;">
			
			
			
			<font size="2"><b> Reference Code configuration <b id="sub"
					Style="display: none"></b></b></font>
			
			

			
		</div>
<div class="container-fluid gmd-1 hover " style="padding-top: 23px; width: 85%;margin-left: 119px;">

	<div class="form-group "><input type="hidden" id="rowno">
						<div class="row  ">
							<label class="col-sm-2 control-label" style="margin-top: 4px;"><font
								size="1">Reference code Type</font></label>
							<div class="col-sm-3 ">
							<select id="refcodetyp" name="refcodetyp" class="form-control"  >
                                       <option value="">Select</option>

									

									</select>

							</div>

							<div class="col-sm-1"></div>
							<label class="col-sm-2 control-label" style="margin-top: 4px;"><font
								size="1">Reference code</font></label>
							<div class="col-sm-3">
							<select name="refcode" id="refcode"
									value="" class="form-control" >
									 <option value="">Select</option>
</select>
							</div>

						</div>
					</div>
				
</div>
<br><br>
<table border="1" style="width: 85%;margin-left: 120px;" id="tb1" class="table table-bordered" >
      <thead><tr><th></th><th> <font size="1">Reference Code</font>  </th><th> <font size="1">Description</font>   </th><th> <font size="1">Source System Code</font>   </th>
						   </tr></thead>
   <tbody id="tbody"><tr id="tr0" ><td colspan="4" style="text-align:center;color:red"><font size="1" >Choose Reference Code</font></td></tr>
       
      </tbody>   
    </table>
    <div class="text-center" id="footer" style="display:none">
    <button type="button" class="btn btn-xs btn-primary addmore" >Add</button>
<button type="button" class="btn btn-xs btn-danger delete" >Remove</button>
  <button type="button" class="btn btn-xs btn-primary save"  >Save</button>
</div>















</body>

<script>

$(".addmore").on('click',function(){
	$(".delete").show();
	var i=parseInt($("#rowno").val());
	i++;
      if($("#refcode0").val()=="" || $("#refcode0").val()==null || $("#refcodedesc0").val()=="" || $("#refcodedesc0").val()==null){
    	  var data="<tr id='tr"+i+"'><td><input type='checkbox' class='case' id='check"+i+"' value='"+i+"' /></td>";
          data +="<td><input type='text' id='refcode"+i+"' name='refcode' class='form-control'  value='' /></td>";
          data +="<td><input type='text' id='refcodedesc"+i+"' name='refcodedesc' class='form-control'  value='' /></td>";
          data +=" <td><input type='text' id='syscode"+i+"' name='syscode' class='form-control syscode'  value='' /></td>";
  	}else{
  		var data="<tr id='tr"+i+"'><td><input type='checkbox' class='case' id='check"+i+"' value='"+i+"'/></td>";
        data +="<td><input type='text' id='refcode"+i+"' name='refcode' class='form-control'  value='"+$("#refcode0").val()+"' readonly/></td>";
        data +="<td><input type='text' id='refcodedesc"+i+"' name='refcodedesc' class='form-control'  value='"+$("#refcodedesc0").val()+"' readonly/></td>";
        data +=" <td><input type='text' id='syscode"+i+"' name='syscode' class='form-control syscode'  value='' /></td>";
  	}
      $('#tb1').append(data);
      
     
      $("#rowno").val(i++);
});

$(".delete").on('click', function() {
	  
	  var rowCount = $('#tb1 tr').length;
	  var checkedBox=$("[type='checkbox']:checked").length;
	  if(checkedBox==0){
		  
		  alert("Select File");
	  }else{
		  
	  }
	 
	 if(rowCount>2){
		$('.case:checkbox:checked').parents("tr").remove();
	    $('.check_all').prop("checked", false); 
	 }else{
		
		 alert("Can't delete this row" );
	 }
	 if(rowCount-1==2 && checkedBox!=0){
		 $(".delete").hide();
	 }
	 
	});
	
	$(".save").on("click",function(){
	var syscode;
	var cnt=1;
		 $(".syscode").each(function(){
			 if(cnt==1){
				 syscode=this.value;
			 }else{
				 syscode=syscode+","+this.value;
			 }
			cnt++;
				}); 
		 var syscode={
			"syscode":syscode,"refcodetyp":$("#refcodetyp").val().split("/")[0]	 ,"refcode":$("#refcode").val().split("/")[0]
		 };
		$.ajax({
			url:"syscodeupd",
			data:syscode,
			dataType:'json',
			type:'POST',
			async:true,
			success:function(res){
				if(res.status=="success"){
					alert("Updated Successfully");
					location.href="../CONFIG/XBRL_REF_CODE_CONF.jsp";
				}else{
					alert("Technical Issue..Try again later");
					location.href="../CONFIG/XBRL_REF_CODE_CONF.jsp";
				}
			}
		}); 
	});
</script>
</html>