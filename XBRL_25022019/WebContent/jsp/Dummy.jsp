<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Asset Manager</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="ib.viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="../css/bootstrap.min.css">

<script src="../js/jQuery-2.2.0.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

<title>Category Master</title>
</head>
<style>
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

.form-horizontal .form-group {
	margin-top: -13px;
	margin-right: -93px;
	margin-left: -15px;
}

.panel-heading {
	padding: 3px 24px;
	padding-top: 0px;
	padding-right: 200px;
}

.text-center {
	text-align: left;
}

.modal-footer {
	text-align: center;
	border-top: 0;
	padding: 25px;
	padding-right: 208px;
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
	text-align: center;
	font-size: 10px;
	font-family: arial;
}

table td{

	padding: 2px;
	text-align: center;
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
	border-top-left-radius: 17px;
	border-top-right-radius: 17px;
	padding: 6px 22px;
	border-bottom: 1px solid transparent;
}

.text-center {
	text-align: left;
}

.btn-group-xs>.btn, .btn-xs {
	padding: 1px 7px;
	padding-top: -12px;
	margin-top: -16px;
	font-size: 12px;
	line-height: 1.5;
	border-radius: 3px;
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
	width: 80%;
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
	padding-right: 208px;
}
</style>

 <script>
   
function edit_row(no)
{
 /* document.getElementById("edit_button"+no).style.display="block";
 document.getElementById("save_button"+no).style.display="block";
 
	
	
var name=document.getElementById("name_row"+no);
 var country=document.getElementById("country_row"+no);
 var age=document.getElementById("age_row"+no);
 */
 
 
 alert("EDITTTT"+no)
 var	srl =  document.getElementById("srl_row"+no);
 alert(srl);
  var	name =  document.getElementById("name_row"+no);
 var	cfid =  document.getElementById("cfid_row"+no);
 var	accno =  document.getElementById("accno_row"+no);
 var	dateopen =  document.getElementById("dateopen_row"+no);
 var	currency =  document.getElementById("currency_row"+no);
 var	amt =  document.getElementById("amt_row"+no);
 var	roi =  document.getElementById("roi_row"+no);
 var	daa =  document.getElementById("daa_row"+no);
 var	wair =  document.getElementById("wair_row"+no);
 var	iiie =  document.getElementById("iiie_row"+no); 
	
 /* var name_data=name.innerHTML;
 var country_data=country.innerHTML;
 var age_data=age.innerHTML; */
 
 
 var	srl_data  = srl.innerHTML;
 var	name_data = name.innerHTML;
 var	cfid_data = cfid.innerHTML;
 var	accno_data = accno.innerHTML;
 var	dateopen_data = dateopen.innerHTML;
 var	currency_data = currency.innerHTML;
 var	amt_data = amt.innerHTML;
 var	roi_data = roi.innerHTML;
 var	daa_data = daa.innerHTML;
 var	wair_data = wair.innerHTML;
 var	iiie_data = iiie.innerHTML; 
 
 /* name.innerHTML="<input type='text' id='name_text"+no+"' value='"+name_data+"'>";
 country.innerHTML="<input type='text' id='country_text"+no+"' value='"+country_data+"'>";
 age.innerHTML="<input type='text' id='age_text"+no+"' value='"+age_data+"'>"; 
  */
 srl.innerHTML="<input type='text' id='srl' style='width: 21px'; value='"+srl_data+"'>";
 name.innerHTML="<input type='text' id='name"+no+"' style='width: 111px'; value='"+name_data+"'>";
 cfid.innerHTML="<input type='text' id='cfid"+no+"' style='width: 21px'; value='"+cfid_data+"'>";
 accno.innerHTML="<input type='text' id='accno"+no+"'  style='width: 21px'; value='"+accno_data+"'>";
 dateopen.innerHTML="<input type='text' id='dateopen"+no+"'  style='width: 21px'; value='"+dateopen_data+"'>";
 currency.innerHTML="<input type='text' id='currency"+no+"'  style='width: 21px'; value='"+currency_data+"'>";
 amt.innerHTML="<input type='text' id='amt"+no+"'  style='width: 21px'; value='"+amt_data+"'>";
 roi.innerHTML="<input type='text' id='roi"+no+"'  style='width: 21px'; value='"+roi_data+"'>";
 daa.innerHTML="<input type='text' id='daa"+no+"'  style='width: 21px'; value='"+daa_data+"'>";
 wair.innerHTML="<input type='text' id='wair"+no+"' style='width: 21px'; value='"+wair_data+"'>";
 iiie.innerHTML="<input type='text' id='iiie"+no+"' style='width: 21px'; value='"+iiie_data+"'>"; 
 
 
}

function save_row(no)
{
 var name_val=document.getElementById("name_text"+no).value;
 var country_val=document.getElementById("country_text"+no).value;
 var age_val=document.getElementById("age_text"+no).value;

 document.getElementById("name_row"+no).innerHTML=name_val;
 document.getElementById("country_row"+no).innerHTML=country_val;
 document.getElementById("age_row"+no).innerHTML=age_val;

 document.getElementById("edit_button"+no).style.display="block";
 document.getElementById("save_button"+no).style.display="block";
}

 

</script> 
<body>



	<form class="form-horizontal" method="post" name="CategoryForm"
		enctype="multipart/form-data">


		<div class="panel-heading text-center"
			style="width: 86%; margin-left: 53px; margin-right: 0px; margin-top: 8px; margin-bottom: 0px; background-color: #bbc3cb;">
			<font size="2"><b> BOP 300 XBRL Report<b id="sub"
					Style="display: none"></b></b></font>

			<ul class="nav nav-tabs navright">
				<li class=" pull-right"><a href="#tab2" data-toggle="tab"><span
						class="headingtab" style="color: red;">B Details </span></a></li>
				<li class=" pull-right active"><a href="#tab1"
					data-toggle="tab"><span class="headingtab" style="color: red;">A
							Details </span></a></li>

			</ul>
		</div>

		<div class="tab-content" style="margin: auto; width: 90%">

			<div class="tab-pane active" id="tab1">
			
			
			
			
			<iframe class="doc" src="https://docs.google.com/gview?url=http://writing.engr.psu.edu/workbooks/formal_report_template.doc&embedded=true"></iframe>

<iframe class="doc" src="file:///C:/Users/adminDocuments/gg.mht"></iframe>

				<div class="col-md-1"></div>

				<table id="tbcate" border="1">
					<tr>

						<th colspan="2"></th>
						<th colspan="2"></th>
						<th colspan="2"></th>
						<th colspan="3">Details</th>
						<th colspan="2">Summary</th>
						<th colspan="2"></th>


					</tr>

					<tr>
						<th></th>
						<th align="center" style="width: 150px">BOP 300 DETAILS</th>
						<th style="width: 90px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 80px"></th>
						<th style="width: 70px"></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>


					</tr>


					<tr>
						<th id="srl">SRL</th>
						<th id="name" align="center" style="width: 150px">Name Of Customer</th>
						<th id="cfid" style="width: 90px">CIF ID</th>
						<th id="accno" style="width: 120px">ACCOUNT NO</th>
						<th id="dateopen" style="width: 120px">DATE OF OPEN</th>
						<th id="currency" style="width: 80px">CURRENCY</th>
						<th id="amt" style="width: 70px">AMOUNT</th>
						<th id="roi">RATE OF INTEREST</th>
						<th id="daa">DAILY AVERAGE AMOUNT</th>
						<th id="wair">WEIGHTED AVERAGE INTEREST RATE</th>
						<th id="iiie">INTEREST INCOME/INEREST EXPENSE</th>
						<th id="edit">Edit</th>
						<th id="save">Save</th>
					</tr>


				<tr id="row1">
					<td id="srl_row1">1</td>
					<td id="name_row1">Gani</td>
					<td id="cfid_row1">CFK 001</td>
					<td id="accno_row1">0258000021574</td>
					<td id="dateopen_row1">12 OCT 2017</td>
					<td id="currency_row1">USD</td>
					<td id="amt_row1">100000</td>
					<td id="roi_row1">10 %</td>
					<td id="daa_row1">100</td>
					<td id="wair_row1">1000</td>
					<td id="iiie_row1">100</td>
					<td>
					
					
					<input type="button" id="edit_button1" value="Edit" class="edit" onclick="edit_row('1')"> 
						
						
					</td>
					<td>
					<input type="button" id="save_button1" value="Save" class="save" onclick="save_row('1')">
						
					</td>
					</tr>		

				</table>

			</div>


			<!-- <table align='center' cellspacing=2 cellpadding=5 id="data_table"
				border=1>
				<tr>
					<th>Name</th>
					<th>Country</th>
					<th>Age</th>
				</tr>

				<tr id="row1">
					<td id="name_row1">Ankit</td>
					<td id="country_row1">India</td>
					<td id="age_row1">20</td>
					<td><input type="button" id="edit_button1" value="Edit"
						class="edit" onclick="edit_row('1')"> <input type="button"
						id="save_button1" value="Save" class="save"
						onclick="save_row('1')"></td>
				</tr>



			</table> -->


			<div class="tab-pane" id="tab2">

				<div class="col-md-1"></div>

				<table id="tbcate1">
					<tr>
						<th colspan="2"></th>
						<th colspan="2"></th>
						<th colspan="2"></th>

						<th colspan="3">Details</th>
						<th colspan="2">Summary</th>
						<th colspan="1"></th>
						<th colspan="1"></th>


					</tr>

					<tr>
						<th style="width: 50px"></th>
						<th align="center" style="width: 150px">BOP 300 DETAILS</th>
						<th style="width: 90px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>


					</tr>


					<tr>

						<th colspan="2" rowspan="2" align="center"
							style="width: 250px; height: 150px">ASSETS</th>
						<th style="width: 90px"></th>
						<th style="width: 120px">Daily Average Amount</th>
						<th style="width: 120px">Weighted Average Interest Rate (%)</th>
						<th style="width: 120px">Interest Income/Interest Expense</th>
						<th colspan="3" style="width: 120px">Select</th>


					</tr>

					<tr>

						<th style="width: 90px"></th>
						<th style="width: 90px">A</th>
						<th style="width: 120px">B</th>
						<th style="width: 120px">C</th>
						<th colspan="3" style="width: 120px"></th>



					</tr>

					<tr>

						<th style="width: 90px">1</th>
						<th style="width: 90px">Total loans extended to non-residents</th>
						<th style="width: 120px">1</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>




					</tr>


					<tr>
						<th style="width: 25px"></th>
						<th style="width: 90px">Domestic Currency</th>
						<th style="width: 120px">2</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>
						<th style="width: 25px"></th>
						<th style="width: 90px">Foreign Currency</th>
						<th style="width: 120px">3</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>
						<th style="width: 25px"></th>
						<th style="width: 90px">US Dollar</th>
						<th style="width: 120px">4</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>
						<th style="width: 25px"></th>
						<th style="width: 90px">Euro</th>
						<th style="width: 120px">5</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>
						<th style="width: 25px"></th>
						<th style="width: 90px">Pound Sterling</th>
						<th style="width: 120px">6</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>
						<th style="width: 25px"></th>
						<th style="width: 90px">Other Currencies</th>
						<th style="width: 120px">7</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>


					<tr>

						<th style="width: 90px">II</th>
						<th style="width: 90px">Total depoists held with
							non-residents</th>
						<th style="width: 120px">8</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>

						<th style="width: 90px"></th>
						<th style="width: 90px">Foreign Currency</th>
						<th style="width: 120px">10</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>

						<th style="width: 90px"></th>
						<th style="width: 90px">US Dollar</th>
						<th style="width: 120px">11</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>


					<tr>

						<th style="width: 90px"></th>
						<th style="width: 90px">Euro</th>
						<th style="width: 120px">12</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>


					<tr>

						<th style="width: 90px"></th>
						<th style="width: 90px">Pound Sterling</th>
						<th style="width: 120px">13</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>


					<tr>

						<th style="width: 90px"></th>
						<th style="width: 90px">Other Currencies</th>
						<th style="width: 120px">14</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>


					<tr>

						<th style="width: 90px"></th>
						<th style="width: 90px"><b>Liabilities</b></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>





					<!--************** row 3 ************ -->

					<tr>
						<th style="width: 90px"><b>III</b></th>
						<th style="width: 90px">Total loans due to non-residents</th>
						<th style="width: 120px">15</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>


					<tr>
						<th style="width: 90px"><b></b></th>
						<th style="width: 90px">Domestic Currency</th>
						<th style="width: 120px">16</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>
						<th style="width: 90px"></th>
						<th style="width: 90px">Foreign Currency</th>
						<th style="width: 120px">17</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>
						<th style="width: 90px"></th>
						<th style="width: 90px">US Dollar</th>
						<th style="width: 120px">18</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>
						<th style="width: 90px"></th>
						<th style="width: 90px">Euro</th>
						<th style="width: 120px">19</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>
						<th style="width: 90px"></th>
						<th style="width: 90px">Pound Sterling</th>
						<th style="width: 120px">20</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>
						<th style="width: 90px"></th>
						<th style="width: 90px">Other Currencies</th>
						<th style="width: 120px">21</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>




					<!--************ row 4 ****************-->



					<tr>
						<th style="width: 90px"><b>IV</b></th>
						<th style="width: 90px">Total loans due to non-residents</th>
						<th style="width: 120px">22</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>


					<tr>
						<th style="width: 90px"><b></b></th>
						<th style="width: 90px">Domestic Currency</th>
						<th style="width: 120px">21</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>
						<th style="width: 90px"></th>
						<th style="width: 90px">Foreign Currency</th>
						<th style="width: 120px">22</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>
						<th style="width: 90px"></th>
						<th style="width: 90px">US Dollar</th>
						<th style="width: 120px">23</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>
						<th style="width: 90px"></th>
						<th style="width: 90px">Euro</th>
						<th style="width: 120px">24</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>
						<th style="width: 90px"></th>
						<th style="width: 90px">Pound Sterling</th>
						<th style="width: 120px">25</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

					<tr>
						<th style="width: 90px"></th>
						<th style="width: 90px">Other Currencies</th>
						<th style="width: 120px">26</th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th style="width: 120px"></th>
						<th colspan="3" style="width: 120px"></th>
					</tr>

				</table>


				<div class="modal-footer"></div>
			</div>
		</div>

	</form>


</body>
</html>