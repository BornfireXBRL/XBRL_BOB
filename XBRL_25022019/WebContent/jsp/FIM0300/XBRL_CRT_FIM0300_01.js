

$(document).ready(function(){

    $( "#dt1" ).datepicker({
    	
    	 //var today = new Date();
    	 dateFormat: "dd-mm-yy",
         changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today",
		      
		      
        onClose: function() {
            var date2 = $('#dt1').datepicker('getDate');
            date2.setDate(date2.getDate()+0)
            $( "#dt2" ).datepicker("setDate", date2);
            $('#dt3').val($('#dt2').val());
        }
    });
    $( "#dt2" ).datepicker({
    	 //var today = new Date();
    	 dateFormat: "dd-mm-yy",
         changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      yearRange: "-100:+0",
		      maxDate: "today",
   
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
	      yearRange: "-100:+0",
	      maxDate: "today",
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
		
		/*  +"<div id='loadingBar'> "+ 
		 +"<div id='bar'> </div> "+
		 +"</div>"+
		
		  
		 function animateLoad(animationLength){
			 $('#bar').css('left','-100%');
			 $('#bar').html('');
			 $('#bar').stop().animate({
			    left: '+=100%'
			  }, animationLength, function() {
			    $('#bar').html('Load complete');
			  }); 
			}

			$('document').ready(function(){
			  var animationLength = 5000;
			  $('#loadingTimer').change(function(){ 
			    animationLength = $(this).val() * 1000;
			    animateLoad(animationLength);
			  });
			  
			  animateLoad(animationLength);
			});
       */
    

  

		
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
			
			var dt1 = $("#dt1").val();
			
		
			
			
			//var textarea_value = $("#dt1").val();
			 
			 
			var dtc = {
					  "dt2" : $("#dt2").val()
					}; 
			 
			 $.ajax({
			     url : "FIM0300criteria",
			     data : dtc,
					dataType : 'json', 
					type : 'POST',
					async : true,
					 success : function(res) {						 
						 console.log(res.coun);
						
						//alert("eeeeeeeeeeeeeeeeeeeee");
						 //alert("1111" + res.count);
						 
						 if(res.coun == 0){
							 swal(
									  '',
									  'No Data Found!',
									  'error'
									);
							 return false;
						 }else{  
								//alert("ELSE"); 
/*								location.href = "XBRL_REP_FIM0300_01.jsp?dt2="+$("#dt2").val()+"&reptype="+$("#reportType").val()+"&typo="+"sum"+"&curr="+$("#rptCurrency").val();
*/								
								location.href = "XBRL_REP_FIM0300_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val()+"&curr="+$("#rptCurrency").val();
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
					
/*					location.href = "XBRL_ENT_FIM0300_01.jsp?dt2="+$("#dt2").val()+"&ReporefSeq="+$("#ReporefSeq").val();
*/					  
					
					location.href = "XBRL_REP_FIM0300_01.jsp?dt1="+$("#dt1").val()+"&dt2="+$("#dt2").val()+"&ReporefSeq="+$("#ReporefSeq").val()+"&curr="+$("#rptCurrency").val();

			  
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
	
	
	myWindow6 = window.open("XBRL_ENT_FIM0300_01.jsp","50",
	"width=350,height=250,left=0,top=150,menubar=no,status=yes,location=no,toolbar=no,scrollbars=yes");
}


function childwindow(a){
	//alert(a);
	$("#ReporefSeq").val(a);
}




$(window).load(function() {
  $(".loader").fadeOut("slow");
});

