


$(document).ready(function(){
	
	 //alert("dsrfhsjsrtgfjrtsjsrtjrts");
	
	 $( "#dt1" ).datepicker({
	    	
    	 dateFormat: "dd-mm-yy",
         changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
		      
        onClose: function() {
            var date2 = $('#dt1').datepicker('getDate');
            date2.setDate(date2.getDate()+5)
            $( "#dt2" ).datepicker("setDate", date2);
            $('#dt3').val($('#dt2').val());
        }
    });
    $( "#dt2" ).datepicker({
    	
    	 dateFormat: "dd-mm-yy",
         changeMonth: true,//this option for allowing user to select month
		      changeYear: true,
   
        onClose: function() {
            var date3 = $('#dt2').datepicker('getDate');
            date3.setDate(date3.getDate()-6)
            $( "#dt1" ).datepicker("setDate", date3);
            $('#dt3').val($('#dt2').val());
        }
    });
    
    
   
    
    
    $( "#asonDate" ).datepicker({
    	
   	 dateFormat: "dd-mm-yy",
        changeMonth: true,//this option for allowing user to select month
	      changeYear: true,
  
       onClose: function() {
           var date4 = $('#asonDate').datepicker('getDate');
           date4.setDate(date4.getDate()-6)
           $( "#dt1" ).datepicker("setDate", date4);
           $('#dt2').val($('#dt1').val());
       }
   });
   
});



function fnentity(){
	
	myWindow6 = window.open("XBRL_ENT_PARAMETER.jsp","50",
	"width=350,height=250,left=0,top=150,menubar=no,status=yes,location=no,toolbar=no,scrollbars=yes");
}
 






function childwindow(a){
	alert(a);
	$("#ReporefSeq").val(a);
}




$(window).load(function() {
    $(".loader").fadeOut("slow");
});

