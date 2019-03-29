

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="dao.XBRLBLS0140Dao ,java.util.ArrayList,java.util.Iterator"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

XBRLBLS0140Dao xrl = new XBRLBLS0140Dao();
ArrayList<XBRLBLS0140Dao> list=xrl.ReporefSeq(request.getParameter("dt1"),request.getParameter("dt2"));

%>




<html>
<head>
<meta http-equiv="refresh"
	content="<%=session.getMaxInactiveInterval() %>;url=XBRLSession.jsp?uName=<%=session.getAttribute("username")%>" />

<link rel="stylesheet" href="../../css/bootstrap.min.css">
<!-- style page -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet" href="../../css/bootstrap.min.css">
  <link rel="stylesheet" href="../../css/ajax/ajax.css" />

<link rel="stylesheet" href="../../CSS/bootstrap.min.css">
 <link rel="stylesheet" href="../../Bootstrap/css/bootstrap.min.css">

<script src="../../jQuery/jQuery-2.2.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<style>
.container {
	padding-right: 42px;
	padding-left: 39px;
	margin-right: auto;
	margin-left: auto;
}

.panel-title {
	margin-top: 0;
	margin-bottom: 0;
	font-size: 12px;
	color: inherit;
}

.pull-right {
	float: right !important;
	margin-top: -16px;
}
</style>
<script>


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

<script>

function fnclick(a){
	
	//alert("HAI"+a);
	
	window.opener.childwindow(a);
	window.close();
	
	
}


</script>


<body>


	<div class="container">

		<div class="row">
			<div class="panel panel-primary filterable">
				<div class="panel-heading">
					<h3 class="panel-title">LIST OF REPORT REF NO</h3>
					<div class="pull-right">
						<button class="btn btn-default btn-xs btn-filter">
							<span class="glyphicon glyphicon-filter"></span> Filter
						</button>
					</div>
				</div>
				<table class="table">
					<!-- <col width="60">
            <col width="90">
            <col width="100">
            <col width="90">
            <col width="100"> -->
					<thead>
						<tr class="filters">
							<th><input type="text" class="form-control"
								placeholder="REPORT REF NO" disabled></th>
							<th>Select</th>
							<!--  <th>Edit</th>
                          <th>Save</th> -->
						</tr>
					</thead>
					<tbody>
						<%
                int i = 1;
              Iterator<XBRLBLS0140Dao> itlist=list.iterator();
								while(itlist.hasNext()){
									XBRLBLS0140Dao xrl1=itlist.next();
					
									
									%>

						<tr>
							<%-- <td><%=i++%></td>  --%>
							<td><%=xrl1.getReporef()%></td>


							<td><input type="radio" id="btnclick"
								onclick="fnclick('<%=xrl1.getReporef()%>');"
								value="<%=xrl1.getReporef()%>"></td>
							<!--  <td><input type="radio" value="true"></td>
                               <td><input type="checkbox" value="true"></td> -->
						</tr>
						<%
								}
                

              %>
					</tbody>
				</table>
			</div>
		</div>



	</div>

















</body>
</html>