





$(document).ready(function(){

	$('.mant').css('color', '#eee');
	$('.mants').css('color', '#eee');
	 $('.mantss').css('color', 'red');
	 
	 $('.mantsb').css('color', '#eee');
	 
	
	$('#reportType,#asonDate,#dt1,#dt2,#rptCurrency,#ReporefSeq').attr("disabled", true);
	
	$( "#btnClear").click(function() {
	
	$('#cform')[0].reset();
	
	});
	
	$( "#btnGo").click(function() {

		  if($("#function1").val()=="Select"){
			  $("#function1").focus();
			
			
			$("#fun").show().fadeOut(2000);
		       $("#fun").html("Select function Name");

		  }
		  
		  if($("#function1").val()=="AddEntity"){
		
		
			
			  if($("#dt1").val()==""){
			 $("#dt1").focus();
		
		
		
	       
			}else if($("#dt2").val()==""){
			 $("#dt2").focus();

    
		} else if($("#dt1").val()!="" && $("#dt2").val()!=""){
			
			
			
			var dt1 = $("#dt1").val();
			 
			var dtc = {
					  "dt1" : $("#dt1").val(),"dt2" : $("#dt2").val()
					}; 
			 
			 $.ajax({
			     url : "pym0100criteria",
			     data : dtc,
					dataType : 'json', 
					type : 'POST',
					async : true,
					 success : function(res) {						 
						 console.log(res.pym0100);
						 
						 
						 if(res.pym0100 == 0){
							
							 
							 swal(
										  '',
										  'No Data Found!',
										  'error'
										);
							 return false;
						 }else{  
							
								
								location.href = "XBRL_REP_PYM0100_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val()+"&reptype="+$("#reportType").val()+"&typo="+"sum"+"&curr="+$("#rptCurrency").val();
								
							}  
						
						 }
				});
			
		}
		
			
			
			
		}
		  
		  
		  if($("#function1").val()=="EditEntity"){
			  
			  
			  if($("#asonDate").val()==""){
					 $("#asonDate").focus();
				
			}
			  else if($("#ReporefSeq").val()==""){
			 $("#ReporefSeq").focus();
		
		
		$("#etid").show().fadeOut(2000);
	       $("#etid").html("Enter Report Ref No");
	} 
			  else{	
				  
					
					location.href = "XBRL_REP_PYM0100_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val()+"&ReporefSeq="+$("#ReporefSeq").val()+"&reptype="+$("#reportType").val()+"&typo="+"sum"+"&curr="+$("#rptCurrency").val();
					  }   
			  
			  
		  }
		
	});
	
	
	
	

		 $("#function1").change(function(){
			
		     var status = this.value;
		     
		   if(status=="AddEntity"){
			   $('.mant').css('color', 'red');
			   $("#dt1,#dt2,#asonDate,#ReporefSeq").val('');
			   $('.mants').css('color', '#eee');
			   
			   $('.mantsb').css('color', '#eee');
			   
			   $("#dt1, #dt2, #asonDate,#rptCurrency").attr("disabled", false);
			   $("#ReporefSeq").attr("disabled", true);
			   
		  
		   
		   } else if(status=="EditEntity"){
			 
			   $('.mants').css('color', 'red');
			   
			   $('.mant').css('color', '#eee');
			   
			   $('.mantsb').css('color', '#428bca');
			   $("#dt1").val('');
			   $("#dt2").val('');
			   
			  
			   $("#dt1, #dt2, #rptCurrency").attr("disabled", true);
			   $("#ReporefSeq, #asonDate").attr("disabled", false);
		   }else if(status=="Select"){
			   $("#dt1, #dt2, #asonDate,#rptCurrency,#ReporefSeq").val("");
			   
		   }
		  });

 }); 
 
 


function fnentity(){
	
	//alert("HAI");
	
	
	myWindow6 = window.open("XBRL_ENT_PYM0100_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val(),"50",
	"width=350,height=250,left=0,top=150,menubar=no,status=yes,location=no,toolbar=no,scrollbars=yes");
}


function childwindow(a){
	//alert(a);
	$("#ReporefSeq").val(a);
}




$(window).load(function() {
    $(".loader").fadeOut("slow");
});
/*$(document).ready(function(){

	
	$( "#dt1" ).datepicker({
		
    	
	   	 dateFormat: "dd-mm-yy",
	        changeMonth: true,//this option for allowing user to select month
			      changeYear: true,
			      yearRange: "-100:+0",
			      maxDate: new Date(),
	       onClose: function() {
	       	
	       	 var date = $(this).datepicker('getDate');
	            if (date) {
	                  date.setDate(1);
	                  $(this).datepicker('setDate', date);
	            }
	       }
	   });
	 $( "#dt2" ).datepicker({
    	
   	 dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: new Date(),
		      onClose: function() {
		        	
		        	 var date = $(this).datepicker('getDate');
		             if (date) {
		                   //date.setDate(31);
		                   date = new Date(date.getFullYear(), date.getMonth() + 1, 0);

		                   $(this).datepicker('setDate', date);
		                   
		                   
		             }
		        }
   });
   
   
  
   
   var date4 ="";
   $( "#asonDate" ).datepicker({
   	
  	 dateFormat: "dd-mm-yy",
       changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: new Date(),
      onClose: function() {
           date4 = $(this).datepicker('getDate');

          if (date4) {
       	   date4 = new Date(date4.getFullYear(), date4.getMonth() + 1, 0);
              $(this).datepicker("setDate", date4);
              $('#dt2').datepicker("setDate", date4);
              date4.setDate(1);
              $('#dt1').datepicker("setDate", date4);
        }
      }
  });
	
	 
	 
   

});*/

