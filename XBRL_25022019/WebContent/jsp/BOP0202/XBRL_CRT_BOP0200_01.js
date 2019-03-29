




$(document).ready(function(){
	
	//alert("ldzkfgidrhfsglidrhfglihrewslgihrewlighrleiw");
	
 $( "#dt1" ).datepicker({
	
	    	
    	 dateFormat: "dd-mm-yy",
         changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: new Date(),
        onClose: function() {
        	
        	 var date = $(this).datepicker('getDate');
             if (date) {
           /*  date.setMonth(date.getMonth()-1 , date.getMonth() -1/3);*/
            	
            	 date.setDate(1);
            	 date.setMonth(Math.trunc(date.getMonth()/3)*3);
            	
            	/* date.setMonth(date.getMonth(), date.getMonth() -1/3);*/
                   $(this).datepicker('setDate', date);
                   date.setMonth((Math.trunc(date.getMonth()/3)*3)+2);
	            	 date = new Date(date.getFullYear(), date.getMonth() + 1, 0);
	                   $("#dt2").datepicker('setDate', date);
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
		            	 date.setMonth((Math.trunc(date.getMonth()/3)*3)+2);
		            	 date = new Date(date.getFullYear(), date.getMonth() + 1, 0);
		                   $(this).datepicker('setDate', date);
		                   
		                   
		             }
		        }
    });
    
    
   
    
    
    $( "#asonDate" ).datepicker({
    	
   	 dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: new Date(),
       onClose: function() {
           var date = $('#asonDate').datepicker('getDate');
          
           if (date) {
               //date.setDate(31);
        	 date.setMonth((Math.trunc(date.getMonth()/3)*3)+2);
        	 date = new Date(date.getFullYear(), date.getMonth() + 1, 0);
               $(this).datepicker('setDate', date);
               $("#dt2").datepicker('setDate', date);

          	 date.setDate(1);
          	 date.setMonth(Math.trunc(date.getMonth()/3)*3);
          	
          	/* date.setMonth(date.getMonth(), date.getMonth() -1/3);*/
                 $("#dt1").datepicker('setDate', date);
               
         }
       }
   });
   
});




$(document).ready(function(){
	
	$('.mant').css('color', '#eee');
	$('.mants').css('color', '#eee');
	 $('.mantss').css('color', 'red');
	 
	 $('.mantsb').css('color', '#eee');
	 
	
	$('#reportType,#asonDate,#dt1,#dt2,#rptCurrency,#ReporefSeq').attr("disabled", true);
	
	$( "#btnClear").click(function() {
		//alert("are you want to clear the fields!");
	$('#cform')[0].reset();
	
	});
	
	$( "#btnGo").click(function() {
		
		
	
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
		
	       
			}else if($("#dt2").val()==""){
			 $("#dt2").focus();
	
    
		} else if($("#dt1").val()!="" && $("#dt2").val()!=""){
			
			
			var dt1 = $("#dt1").val();
			var dt2 = $("#dt2").val();
			
		
		
			 
			var dtc = {
					  "dt1" : $("#dt1").val(),"dt2" : $("#dt2").val(),"curr":$("#rptCurrency").val()
					};
			
			
			 
			 $.ajax({
			     url : "BLS0700criteria",
			     data : dtc,
					dataType : 'json', 
					type : 'POST',
					async : true,
					 success : function(res) {						 
						 console.log(res.start);
						
						
						 
						 if(res.start == 0){
							 //alert("No data Found");
							 
							 swal(
										  '',
										  'No Data Found!',
										  'error'
										);
							 return false;
						 }else{  
								//alert("ELSE1111111111111111111111111111111"); 
								
								location.href = "XBRL_REP_BLS0700_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val()+"&reptype="+$("#reportType").val()+"&curr="+$("#rptCurrency").val();
								
							}  
						
						 }
				});
			
		}
		
			
			
			
		}
		  
		  if($("#function1").val()=="EditEntity"){
			  
			 
			  
			  if($("#Reporefno").val()==""){
			 $("#Reporefno").focus();
		
		
		$("#etid").show().fadeOut(2000);
	       $("#etid").html("Enter Report Ref No");
	} 
			  else{
										
					location.href = "XBRL_REP_BLS0700_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val()+"&ReporefSeq="+$("#ReporefSeq").val()+"&reptype="+$("#reportType").val()+"&curr="+$("#rptCurrency").val();
					  }   
			  
			  
		  }
		
	});
	
	
	
	

		 $("#function1").change(function(){
			
		     var status = this.value;
		     
		   if(status=="AddEntity"){
			   $('.mant').css('color', 'red');
			   
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
		   }
		  });

		
	
	
 
				 $( "#asonDate,#dt1,#dt2").datepicker({
	    		    	
	    		        dateFormat: 'dd-mm-yy',
	    		    	changeMonth: true,//this option for allowing user to select month
	    		      changeYear: true //this option for allowing user to select from year range
	    		      
	    		    }); 
 }); 
 
 


function fnentity(){
	
	//alert("HAI");
	
	
	myWindow6 = window.open("XBRL_ENT_BLS0700_01.jsp","50",
	"width=350,height=250,left=0,top=150,menubar=no,status=yes,location=no,toolbar=no,scrollbars=yes");
}


function childwindow(a){
	//alert(a);
	$("#ReporefSeq").val(a);
}




$(window).load(function() {
    $(".loader").fadeOut("slow");
});


$(document).ready(function(){
	
	//alert("ldzkfgidrhfsglidrhfglihrewslgihrewlighrleiw");
	
 $( "#dt1" ).datepicker({
	
	    	
    	 dateFormat: "dd-mm-yy",
         changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: new Date(),
        onClose: function() {
        	
        	 var date = $(this).datepicker('getDate');
             if (date) {
           /*  date.setMonth(date.getMonth()-1 , date.getMonth() -1/3);*/
            	
            	 date.setDate(1);
            	 date.setMonth(Math.trunc(date.getMonth()/3)*3);
            	
            	/* date.setMonth(date.getMonth(), date.getMonth() -1/3);*/
                   $(this).datepicker('setDate', date);
                   date.setMonth((Math.trunc(date.getMonth()/3)*3)+2);
	            	 date = new Date(date.getFullYear(), date.getMonth() + 1, 0);
	                   $("#dt2").datepicker('setDate', date);
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
		            	 date.setMonth((Math.trunc(date.getMonth()/3)*3)+2);
		            	 date = new Date(date.getFullYear(), date.getMonth() + 1, 0);
		                   $(this).datepicker('setDate', date);
		                   
		                   
		             }
		        }
    });
    
    
   
    
    
    $( "#asonDate" ).datepicker({
    	
   	 dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
	      yearRange: "-100:+0",
	      maxDate: new Date(),
       onClose: function() {
           var date = $('#asonDate').datepicker('getDate');
          
           if (date) {
               //date.setDate(31);
        	 date.setMonth((Math.trunc(date.getMonth()/3)*3)+2);
        	 date = new Date(date.getFullYear(), date.getMonth() + 1, 0);
               $(this).datepicker('setDate', date);
               $("#dt2").datepicker('setDate', date);

          	 date.setDate(1);
          	 date.setMonth(Math.trunc(date.getMonth()/3)*3);
          	
          	/* date.setMonth(date.getMonth(), date.getMonth() -1/3);*/
                 $("#dt1").datepicker('setDate', date);
               
         }
       }
   });
   
});




$(document).ready(function(){
	
	$('.mant').css('color', '#eee');
	$('.mants').css('color', '#eee');
	 $('.mantss').css('color', 'red');
	 
	 $('.mantsb').css('color', '#eee');
	 
	
	$('#reportType,#asonDate,#dt1,#dt2,#rptCurrency,#ReporefSeq').attr("disabled", true);
	
	$( "#btnClear").click(function() {
		//alert("are you want to clear the fields!");
	$('#cform')[0].reset();
	
	});
	
	$( "#btnGo").click(function() {
		
		
	
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
		
	       
			}else if($("#dt2").val()==""){
			 $("#dt2").focus();
	
    
		} else if($("#dt1").val()!="" && $("#dt2").val()!=""){
			
			
			var dt1 = $("#dt1").val();
			var dt2 = $("#dt2").val();
			
		
		
			 
			var dtc = {
					  "dt1" : $("#dt1").val(),"dt2" : $("#dt2").val(),"curr":$("#rptCurrency").val()
					};
			
			
			 
			 $.ajax({
			     url : "BLS0700criteria",
			     data : dtc,
					dataType : 'json', 
					type : 'POST',
					async : true,
					 success : function(res) {						 
						 console.log(res.start);
						
						
						 
						 if(res.start == 0){
							 //alert("No data Found");
							 
							 swal(
										  '',
										  'No Data Found!',
										  'error'
										);
							 return false;
						 }else{  
								//alert("ELSE1111111111111111111111111111111"); 
								
								location.href = "XBRL_REP_BLS0700_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val()+"&reptype="+$("#reportType").val()+"&curr="+$("#rptCurrency").val();
								
							}  
						
						 }
				});
			
		}
		
			
			
			
		}
		  
		  if($("#function1").val()=="EditEntity"){
			  
			 
			  
			  if($("#Reporefno").val()==""){
			 $("#Reporefno").focus();
		
		
		$("#etid").show().fadeOut(2000);
	       $("#etid").html("Enter Report Ref No");
	} 
			  else{
										
					location.href = "XBRL_REP_BLS0700_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val()+"&ReporefSeq="+$("#ReporefSeq").val()+"&reptype="+$("#reportType").val()+"&curr="+$("#rptCurrency").val();
					  }   
			  
			  
		  }
		
	});
	
	
	
	

		 $("#function1").change(function(){
			
		     var status = this.value;
		     
		   if(status=="AddEntity"){
			   $('.mant').css('color', 'red');
			   
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
		   }
		  });

		
	
	
 
				 $( "#asonDate,#dt1,#dt2").datepicker({
	    		    	
	    		        dateFormat: 'dd-mm-yy',
	    		    	changeMonth: true,//this option for allowing user to select month
	    		      changeYear: true //this option for allowing user to select from year range
	    		      
	    		    }); 
 }); 
 
 


function fnentity(){
	
	//alert("HAI");
	
	
	myWindow6 = window.open("XBRL_ENT_BLS0700_01.jsp","50",
	"width=350,height=250,left=0,top=150,menubar=no,status=yes,location=no,toolbar=no,scrollbars=yes");
}


function childwindow(a){
	//alert(a);
	$("#ReporefSeq").val(a);
}




$(window).load(function() {
    $(".loader").fadeOut("slow");
});

