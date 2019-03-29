
$(document).ready(function(){

var repid={
			"repid":$("#reportType").val()
	};
	$.ajax({
		url:"reportupload",
		data:repid,
		dataType:'json',
		type:'POST',
		async:false,
		success:function(res){
			console.log(res.upflg);
			if(res.upflg=="Y" || res.upflg=="y"){
				$("#btnUpload").show();
			}else{
				$("#btnUpload").hide();
			}
			
		}
	});



$( "#btnUpload").click(function() {
		 if($("#function1").val()=="Select"){
			  $("#function1").focus();
			
			
			$("#fun").show().fadeOut(2000);
		       $("#fun").html("Select function Name");

		  }
		  
		 else  if($("#function1").val()=="AddEntity"){
		
		
			
			  if($("#dt1").val()==""){
			 $("#dt1").focus();
		
		
		
	       
			}else if($("#dt2").val()==""){
			 $("#dt2").focus();

   
		} else {
			var dt1 = $("#dt1").val();
			 
			var dtc = {
					  "dt1" : $("#dt1").val(),"dt2" : $("#dt2").val()
					}; 
			 
			 $.ajax({
			     url : "SUP1500criteria",
			     data : dtc,
					dataType : 'json', 
					type : 'POST',
					async : true,
					 success : function(res) {						 
						 console.log(res.sup1500);
						$("#count").val(res.sup1500);
						 if(res.sup1500>0){ 
							 swal({
								    title: "Are you sure?",
								    text: " Data Already exist for given date. Do you want to reupload?",
								    type: "warning",
								    showCancelButton: true,
								    confirmButtonColor: '#DD6B55',
								    confirmButtonText: 'Yes',
								    cancelButtonText: "No"
								 }).then(
								       function () {  $(".container1").modal('toggle');  },
								       function () { return false; });
						  }else{
							 $(".container1").modal('toggle'); 
						 } 
					 
						
						 }
				});
			 
		
		/*  myWindow6 = window.open("Fileupload.jsp","50",
			"width=850,height=550,left=0,top=150,menubar=no,status=yes,location=no,toolbar=no,scrollbars=yes"); */
		} }});

});

function fnFile() {
	
	var filetype = document.getElementById("fd");
	filetype.onchange = function(e) {
		
		
		var ext = this.value.match(/\.(.+)$/)[1].toLowerCase();
	
		switch (ext) {
		//alert("inside switch");
		case 'xls':
		case 'xlsx':
		break;
		default:
			alert('Allows only Excel (.xls,.xlsx) File Only');
			this.value = '';
		}
	};
}
function sub() {
	if (document.getElementById("fd").value == "" ) {

		alert("Please Upload File");

	} else {
		
		 $("#divLoading").addClass('show'); 
		CriteriaForm.action="druploadFile.action?method=doUpload"+"&cnt="+$("#count").val();
		CriteriaForm.submit();
		
		
	}
	
}
function fnHome(){
	 $(".container1").modal('toggle'); 
	
}

$(document).ready(function(){
	$( "#dt1" ).datepicker({
    	
   	 dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      
       onClose: function() {
           var date2 = $('#dt1').datepicker('getDate');
           date2.setDate(1);
           date2.setMonth(0);
           $( "#dt1" ).datepicker("setDate", date2);
           /*$('#dt3').val($('#dt2').val());*/
       }
   });
   $( "#dt2" ).datepicker({
   	
   	 dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
  
       onClose: function() {
           var date3 = $('#dt2').datepicker('getDate');
           date3.setDate(date3.getDate()-0)
           $( "#dt1" ).datepicker("setDate", date3);
           $('#dt3').val($('#dt2').val());
       }
   });
   
   
   $( "#dt3" ).datepicker({
   	
  	 dateFormat: "dd-mm-yy",
       changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
 
      onClose: function() {
          var date4 = $('#dt3').datepicker('getDate');
          date4.setDate(date4.getDate()-0)
          $( "#dt1" ).datepicker("setDate", date4);
          $('#dt2').val($('#dt3').val());
      }
  });
  
});




$(document).ready(function(){
	
	$('.mant').css('color', '#eee');
	$('.mants').css('color', '#eee');
	 $('.mantss').css('color', 'red');
	 
	 $('.mantsb').css('color', '#eee');
	 
	
	$('#reportType,#dt3,#dt1,#dt2,#rptCurrency,#ReporefSeq').attr("disabled", true);
	
	$( "#btnClear").click(function() {
		//alert("are you want to clear the fields!");
	$('#cform')[0].reset();
	
	});
	
	$( "#btnGo").click(function() {
		//alert("Please Select the Function");
		
		
		  if($("#function1").val()=="Select"){
			  $("#function1").focus();
			//alert("Please Select the function");
			
			$("#fun").show().fadeOut(2000);
		       $("#fun").html("Select function Name");

		  }
		  
		  if($("#function1").val()=="AddEntity"){
		
			  //alert("ADD ENTITY");
			
			  if($("#dt1").val()==""){
			 $("#dt1").focus();
		//alert("Please Select the FromDate");
		
		$("#frmdt").show().fadeOut(2000);
	       $("#frmdt").html("Enter From Date");
	       
			}else if($("#dt2").val()==""){
			 $("#dt2").focus();
	//alert("Please Select the dt2");
	
	$("#todt").show().fadeOut(2000);
    $("#todt").html("Enter To Date");
    
		} else if($("#dt1").val()!="" && $("#dt2").val()!=""){
			
			//alert("HAI date");
					
			//alert("HAI date" + $("#dt1").val());
			
			var dt2 = $("#dt2").val();
			
		
			
			
			//var textarea_value = $("#dt1").val();
			 
		
			 
			var dtc = {
					  "dt2" : $("#dt2").val()
					}; 
			 
			 $.ajax({
			     url : "SUP1500criteria",
			     data : dtc,
					dataType : 'json', 
					type : 'POST',
					async : true,
					 success : function(res) {						 
						 console.log(res.sup1500);
						
						//alert("eeeeeeeeeeeeeeeeeeeee");
						 //alert("1111" + res.count);
						 
						 if(res.sup1500 == 0){
							 swal(
									  '',
									  'No Data Found!',
									  'error'
									);
							 return false;
						 }else{  
								//alert("ELSE"); 
								location.href = "XBRL_REP_SUP1500_01.jsp?dt2="+$("#dt2").val()+"&reptype="+$("#reportType").val()+"&typo="+"sum"+"&curr="+$("#rptCurrency").val();
								
							}  
						
						 }
				});
			
		}
		
				
			
		}/* else{
				
				location.href = "XBRLReport1.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val();
				  } */
		  
	  
		  if($("#function1").val()=="EditEntity"){
			  
			  //alert("Edit ENTITY");
			  
			  if($("#ReporefSeq").val()==""){
			 $("#ReporefSeq").focus();
		//alert("Please Enter the Entity Id");
		
		$("#etid").show().fadeOut(2000);
	       $("#etid").html("Enter Report Ref No");
	} 
			  else{
					//alert("SE EditEntity");
					
					//alert("From Date" + $("#dt1").val());
					
					location.href = "XBRL_ENT_SUP1500_01.jsp?dt2="+$("#dt2").val()+"&ReporefSeq="+$("#ReporefSeq").val();
					  }   
			  
			  
		  }
		//location.href = "XBRLReport.jsp?dt1="+$(this).val();
		
		/* CriteriaForm.action="bopDetails.action?method=detailsBop";
		CriteriaForm.submit(); */
	});
	
	
	
	
	
	/*  $(function () {           
		            var d = new Date().getDate();
		            var m = new Date().getMonth() + 1; // JavaScript months are 0-11
		            var y = new Date().getFullYear();
		            $("[id$=dt3]").val(d + "/" + m + "/" + y);
		            $("[id$=dt3]").datepicker({ weekStart: 1, dateFormat: 'dd/mm/yy' });
		        });
	 */
	
	

		 $("#function1").change(function(){
			
		     var status = this.value;
		     
		   if(status=="AddEntity"){
			   $('.mant').css('color', 'red');
			   
			   $('.mants').css('color', '#eee');
			   
			   $('.mantsb').css('color', '#eee');
			   
		     $("#dt1, #dt2, #dt3,#asonDate,#rptCurrency").attr("disabled", false);
		   $("#ReporefSeq").attr("disabled", true);
		   
		   } else if(status=="EditEntity"){
			 
			   $('.mants').css('color', 'red');
			   
			   $('.mant').css('color', '#eee');
			   
			   $('.mantsb').css('color', '#428bca');
			   $("#dt1").val('');
			   $("#dt2").val('');
			   
			  
			   $("#dt1, #dt2, #rptCurrency").attr("disabled", true);
			   $("#ReporefSeq, #dt3").attr("disabled", false);
		   }
		  });

		
	
	
 
				 $( "#dt3,#dt1,#dt2").datepicker({
	    		    	
	    		        dateFormat: 'dd-mm-yy',
	    		    	changeMonth: true,//this option for allowing user to select month
	    		      changeYear: true //this option for allowing user to select from year range
	    		      
	    		    }); 
 }); 
 
 

function fnentity(){
	
	//alert("HAI");
	
	
	myWindow6 = window.open("XBRL_ENT_SUP1500_01.jsp","50",
	"width=350,height=250,left=0,top=150,menubar=no,status=yes,location=no,toolbar=no,scrollbars=yes");
}


function childwindow(a){
	//alert(a);
	$("#ReporefSeq").val(a);
}




$(window).load(function() {
    $(".loader").fadeOut("slow");
});

