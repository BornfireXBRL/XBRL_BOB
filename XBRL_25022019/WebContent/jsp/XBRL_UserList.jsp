
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page	import="bean.XBRLUserProfileBean,dao.XBRLUserProfileDao,java.util.ArrayList,java.util.Iterator"%>
    
    <%
   // String type=request.getParameter("type");
    XBRLUserProfileDao upd=new XBRLUserProfileDao();
    ArrayList<XBRLUserProfileBean> list=upd.listDetails();
    
    %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BAJ</title>
</head>


<meta charset="UTF-8">
     
  <link rel="stylesheet" href="../CSS/bootstrap.min.css"> <!-- style page -->
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 <link rel="stylesheet" href="../CSS/bootstrap.min.css">
 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="../jQuery/jQuery-2.2.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script>

/*
Please consider that the JS part isn't production ready at all, I just code it to show the concept of merging filters and titles together !
*/
$(document).ready(function(){
    $('.filterable .btn-filter').click(function(){
        var $panel = $(this).parents('.filterable'),
        $filters = $panel.find('.filters input'),
        $tbody = $panel.find('.table tbody');
        if ($filters.prop('disabled') == true) {
            $filters.prop('disabled', false);
            $filters.first().focus();
        } else {
            $filters.val('').prop('disabled', true);
            $tbody.find('.no-result').remove();
            $tbody.find('tr').show();
        }
    });

    $('.filterable .filters input').keyup(function(e){
        /* Ignore tab key */
        var code = e.keyCode || e.which;
        if (code == '9') return;
        /* Useful DOM data and selectors */
        var $input = $(this),
        inputContent = $input.val().toLowerCase(),
        $panel = $input.parents('.filterable'),
        column = $panel.find('.filters th').index($input.parents('th')),
        $table = $panel.find('.table'),
        $rows = $table.find('tbody tr');
        /* Dirtiest filter function ever ;) */
        var $filteredRows = $rows.filter(function(){
            var value = $(this).find('td').eq(column).text().toLowerCase();
            return value.indexOf(inputContent) === -1;
        });
        /* Clean previous no-result if exist */
        $table.find('tbody .no-result').remove();
        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
        $rows.show();
        $filteredRows.hide();
        /* Prepend no-result row if all rows are filtered */
        if ($filteredRows.length === $rows.length) {
            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
        }
    });
});
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
       #mod{
float:right;
cursor:pointer;}
#ver{
float:right;
cursor:pointer;}
#can{
float:right;
cursor:pointer;}
#del{
float:right;
cursor:pointer;}
#list{
float:right;
cursor:pointer;}
</style>
<script type="text/javascript">
$(document).ready(function() {
$( "#btnhome" ).click(function() {
	
	location.href = "XBRLHomePage.jsp";
	
	});

$( "#btnback" ).click(function() {
	location.href = "UserProfile.jsp?type=open";
});
});

function fnclick(userid){
	location.href = "UserProfile.jsp?type=list&userid="+userid;
}
</script>

<body>
<div class="container">

	
   
     <div class="panel-body" >
  
   <div class="panel-heading text-center" id="modheadtitle"><font size="2"><b>USER PROFILE LIST</b></font>
    
    <div class="row">
        <div class="panel panel-primary filterable" style="width: 900px;">
            <div class="panel-heading">
                <h3 class="panel-title algin-centre"> User Search </h3>
                                <div class="pull-right">
                 
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr class="filters">
                    <th><input type="text" class="form-control" placeholder="Srlno" disabled></th> 
                       <th><input type="text" class="form-control" placeholder="User Id" disabled></th> 
                        <th><input type="text" class="form-control" placeholder="User Name" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Employee Id" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Role" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Status" disabled></th>
                        
                        <th >Select</th>
                        <!--  <th>Edit</th>
                          <th>Save</th> -->
                    </tr>
                </thead>
                <tbody>
                
              <%if(list.size()>0){
                int i = 1;
                Iterator<XBRLUserProfileBean> itlist=list.iterator();
								while(itlist.hasNext()){
									XBRLUserProfileBean umb=itlist.next();
					
									
									%>
						
                    <tr style="margin-left: -35px;">
                        
                         <td><%=i++%></td>
                        <td><%=umb.getUserId() %></td>
                        <td ><%=umb.getUserName() %></td>
                        <td><%=umb.getEmpId() %></td>
                         <td><%=umb.getRoleId() %></td>
                         <%if(umb.getUserStatus().equals("Y")){ %>
                        <td> Verified</td>
                          <%}else{ %>
                           <td> Unverified</td>
                           <%} %>
                           <td><input type="radio" name="rbtn" id="btnclick" onclick="fnclick('<%=umb.getUserId() %>');" value="<%=umb.getUserId() %>"></td>
                            <!--  <td><input type="radio" value="true"></td>
                               <td><input type="checkbox" value="true"></td> -->
                    </tr>
                    <%	
								}}else{
                

              %>
              <tr><td></td><td></td><td></td><td style="width: 150px;"><font color="Red" size="2">No Available Records</font></td><td></td><td></td></tr>
              
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




</body>
</html>