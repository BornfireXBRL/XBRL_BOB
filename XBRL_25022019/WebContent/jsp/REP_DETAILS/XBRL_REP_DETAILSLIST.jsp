
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRL_REPREF_MAPPINGBean,dao.XBRL_REPREF_MAPPINGDao,java.util.ArrayList,java.util.Iterator"%>
    
    <%
   String type=request.getParameter("type");
    String repnum=request.getParameter("repnum");
    String replvl=request.getParameter("replvl");
    String refcode=request.getParameter("refcode");
    XBRL_REPREF_MAPPINGDao upd=new XBRL_REPREF_MAPPINGDao();
    ArrayList<XBRL_REPREF_MAPPINGBean> list=upd.listDetails11(repnum,replvl,refcode);
    
    %>
 <% %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>XBRL</title>
</head>


<meta charset="UTF-8">
     
  <link rel="stylesheet" href="../CSS/bootstrap.min.css"> <!-- style page -->
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="../../CSS/bootstrap-datepicker.css" />


<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnfilter").on("click",function(){
		
		if($(".form-control2").prop("disabled")==true){
			$(".form-control2").prop("disabled",false);
		}else{
			$(".form-control2").val("");
			$(".form-control2").prop("disabled",true);
		}
		
	});
	 $( "#btnhome" ).click(function() {
			location.href = "XBRLHomePage.jsp";
			
			});
		$( "#btnback" ).click(function() {
			window.history.back();
			
			});	
   
} );

</script>
<script>
function myFunction(a,b) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(a);
  filter = input.value.toUpperCase();
  table = document.getElementById("refcodelist");
  tr = table.getElementsByTagName("tr");
 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[b];
 
if (td) {
	/* if(b==5 ||b==1 || b==2){ */
		
		 if(td.innerHTML.substring(0,input.value.length).toUpperCase()==filter){
			 tr[i].style.display = "";
		}else {
	        tr[i].style.display = "none";
	      }
		 
		 
/* 	    } else{
	    	
	    
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
    	
        tr[i].style.display = "";
       
      } else {
        tr[i].style.display = "none";
      }
	    } */
    }       
    
    
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
font-family: calibri;
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
        text-align: center;
            color: black;
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
   font-family: calibri;
   }
   .panel-primary {
    border-color: rgba(18,18,19,0.22);
}
.modal-footer {
   text-align:center;
    border-top: 0;
    padding: 25px;
   padding-right: 208px;
}table {
            width: 100%;
        }

        thead, tbody, tr, td, th { display: block; }

        tr:after {
            content: ' ';
            display: block;
            visibility: hidden;
            clear: both;
        }

        thead th {
            height: 40px;

            /*text-align: left;*/
        }

        tbody {
            height: 330px;
            overflow-y: auto;
        }

        thead {
            /* fallback */
        }


        tbody td, thead th {
            width: 125px;
            float: left;
        }
    
</style>
<script>


$(document).ready(function(){

$( "#btnHome" ).click(function() {
		
		location.href = "XBRLHomePage.jsp";
		
		});
	
	$( "#btnBack" ).click(function() {
		window.history.back();
	});
});

</script>

<body>
<div class="container">

   
     <div class="panel-body" style="width:1220px">
    <%if(type.toUpperCase().equals("LISTMAP")){
    	type="INQUIRIES";
    } %>
   <div class="panel-heading text-center" id="modheadtitle"><font size="2"><b>Report Code Details- List</b></font>
   </div>
    <div class="row">
        <div class="panel panel-primary filterable" style="width: 1147px;">
            <div class="panel-heading">
                <h3 class="panel-title algin-centre">Report Code Details</h3>
                                <div class="pull-right">
                 
                    <button class="btn btn-default btn-xs btn-filter" id="btnfilter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
            <table class="table" id="refcodelist">
                <thead>
                    <tr class="filters">
                    <th><input type="text" class="form-control2" onkeyup="myFunction(this.id,0)" id="repcode1" placeholder="Customer Id" disabled></th> 
                       <th style="width: 88px;"><input type="text" id="replvl1" onkeyup="myFunction(this.id,1)"  class="form-control2" placeholder="Account No" disabled></th> 
                        <th style="width: 100px;"><input type="text" id="refcode1" onkeyup="myFunction(this.id,2)" class="form-control2" placeholder="Scheme Type" disabled></th>
                        <th style="width: 93px;"><input  type="text" class="form-control2" id="refdesc1" onkeyup="myFunction(this.id,3)" placeholder="Scheme Code" disabled></th>
                        <th style="    width: 95px;" ><input type="text" class="form-control2" id="rem1"  onkeyup="myFunction(this.id,4)" placeholder="Gl SubHead Code" disabled></th>
                        <th><input type="text" class="form-control2" id="status1" onkeyup="myFunction(this.id,5)" placeholder="Report Code" disabled></th>
                        <th style="    width: 117px;" ><input type="text" class="form-control2" id="rem1"  onkeyup="myFunction(this.id,6)" placeholder="Report Name" disabled></th>
                        <th style="    width: 117px;" ><input type="text" class="form-control2" id="rem1"  onkeyup="myFunction(this.id,7)" placeholder="Reference Level" disabled></th>
                        <th style="    width: 105px;" ><input type="text" class="form-control2" id="rem1"  onkeyup="myFunction(this.id,8)" placeholder="Reference Code" disabled></th>
                        <th style="    width: 157px;" ><input type="text" class="form-control2" id="rem1"  onkeyup="myFunction(this.id,9)" placeholder="Reference Desc1" disabled></th>
                        
                        
                        <!--  <th>Edit</th>
                          <th>Save</th> -->
                    </tr>
                </thead>
                <tbody>
                
              <%if(list.size()>0){
                int i = 1;
                Iterator<XBRL_REPREF_MAPPINGBean> itlist=list.iterator();
								while(itlist.hasNext()){
									XBRL_REPREF_MAPPINGBean umb=itlist.next();
					
									
									%>
						
                    <tr>
                       
                         <td><%=umb.getCustid1() %></td>
                        <td style="width: 88px;"><%=umb.getActno1() %></td>
                        <td style="width: 100px;"><%=umb.getSchmtyp() %></td>
                        <td style="   width: 93px; "><%=umb.getSchmcode() %></td>
                         <td style=" width: 95px; "><%=umb.getGlhead1() %></td>
                        <td style="   "><%=umb.getRepcode() %></td>
                         <td style="   width: 117px; "><%=umb.getRepname() %></td>
                          <td style="  width: 117px; "><%=umb.getReplvl() %></td>
                           <td style="  width: 105px; "><%=umb.getRefcode() %></td>
                            <td style=" width: 157px; "><%=umb.getRefdesc1() %></td>
                          
                            
                            <!--  <td><input type="radio" value="true"></td>
                               <td><input type="checkbox" value="true"></td> -->
                    </tr>
                    <%	
								}}else{
                

              %>
              <tr><td></td><td></td><td></td><td></td><td></td><td style="width: 150px;"><font color="Red" size="2">No records available</font></td><td></td><td></td></tr>
              
              <%} %>
              
                </tbody>
            </table>
        </div>
    </div>
    
    <div class="modal-footer">
               
                <button type="button" class="btn btn-xs btn-primary" id="btnhome">Home</button>
                
                   <button type="button" class="btn btn-xs btn-primary" value="back" id="btnback">Back</button>
            
 </div>
</div>
</div>



</body>
</html>