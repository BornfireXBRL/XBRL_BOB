<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--  <script src="../jQuery/jQuery-2.2.0.min.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../js/bootstrap.min.js"></script>
</head>
<style>
#sidebar-wrapper {
	margin-left: -250px;
	left: 250px;
	width: 250px;
	position: fixed;
	height: 100%;
	overflow-y: auto;
	z-index: 1000;
	transition: all 0.4s ease 0s;
}

<
html  margin-top: -50px ;> <html   margin-left: -15px ;>body {
	margin-top: 50px;
	font-family: arial;
	font-size: 13px;
}

.glyphicon {
	margin-right: 10px;
}

.panel-body {
	padding: 0px;
}

.panel-body table tr td {
	padding-left: 15px
}

.panel-body .table {
	margin-bottom: 0px;
}


.list-group-item-success {
	background-color: #bbc3cb;
}

a.list-group-item-success:focus, a.list-group-item-success:hover, button.list-group-item-success:focus,
	button.list-group-item-success:hover {
	color: #fe192d;
	background-color: #bbc3cb;
}

.list-group-item {
	position: relative;
	display: block;
	padding: 10px 20px;
	margin-bottom: -13px;
	background-color: rgb(187, 195, 203);
	border: 1px solid #ddd;
}

a.list-group-item, button.list-group-item {
	color: rgba(7, 12, 143, 0.97);
}

.list-group-item:last-child {
	margin-bottom: -13px;
	border-bottom-right-radius: 4px;
	border-bottom-left-radius: 4px;
}

ol, ul {
	margin-bottom: 8px;
}

.dropdown-submenu {
	position: relative;
}

.dropdown-submenu>.dropdown-menu {
	top: 0;
	left: 100%;
	margin-top: -6px;
	margin-left: -1px;
	-webkit-border-radius: 0 6px 6px 6px;
	-moz-border-radius: 0 6px 6px;
	border-radius: 0 6px 6px 6px;
}

.dropdown-submenu:hover>.dropdown-menu {
	display: block;
}

.dropdown-submenu>a:after {
	display: block;
	content: " ";
	float: right;
	width: 0;
	height: 0;
	border-color: transparent;
	border-style: solid;
	border-width: 5px 0 5px 5px;
	border-left-color: #ccc;
	margin-top: 5px;
	margin-right: -10px;
}

.dropdown-submenu:hover>a:after {
	border-left-color: #fff;
}

.dropdown-submenu.pull-left {
	float: none;
}

.dropdown-submenu.pull-left>.dropdown-menu {
	left: -100%;
	margin-left: 10px;
	-webkit-border-radius: 6px 0 6px 6px;
	-moz-border-radius: 6px 0 6px 6px;
	border-radius: 6px 0 6px 6px;
}
</style>

<script>
$(document).ready(function() {

	$.ajax({
        url : "getMenuPage",
        dataType : 'json', 
		type : 'GET',
		async : false,
		 success : function(res) {
			 var b=JSON.parse(res.menulist);
			
				console.log(b);
				var yrly="";var halfyrly="";var quty="";var mnthly="";var fort="";var wekly="";var daily="";var prev_rep="";
				for ( var i = 0; i < b.length; i++)	 {
					
					if(b[i].frquency.toUpperCase()=="YEARLY"){
						// TO HANDLE SUB REPORTS
						if(b[i].subReportFlg.toUpperCase()=="Y"){
							
														
							if(yrly=="" && prev_rep!=b[i].reportId){
								$("#myUL").append('<li class="list-group-item"><a data-toggle="collapse" href="#yearly"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="yearly" class="collapse librePanelSubListGroupItem"></ul></li>');
								$("#yearly").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');	
								yrly="s";
							}else if(yrly=="s" && prev_rep!=b[i].reportId){
								$("#yearly").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}else {
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}
							
							prev_rep=b[i].reportId;
						}
			
						else
							{
			// TO HANDLE SUB REPORTS
			
						if(yrly==""){
							$("#myUL").append('<li class="list-group-item"><a data-toggle="collapse" href="#yearly"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="yearly" class="collapse librePanelSubListGroupItem"></ul></li>');
							$("#yearly").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
							yrly="s";
						}else{
							$("#yearly").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
						}
							}
					}else if(b[i].frquency.toUpperCase()=="HALF YEARLY"){
				
			// TO HANDLE SUB REPORTS
						if(b[i].subReportFlg.toUpperCase()=="Y"){
							
														
							if(halfyrly=="" && prev_rep!=b[i].reportId){
								$("#myUL").append('<li class="list-group-item"><a data-toggle="collapse" href="#halfyrly"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="halfyrly" class="collapse librePanelSubListGroupItem"></ul></li>');
								$("#halfyrly").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');	
								halfyrly="s";
							}else if(halfyrly=="s" && prev_rep!=b[i].reportId){
								$("#halfyrly").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}else {
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}
							
							prev_rep=b[i].reportId;
						}
			
						else
							{
			// TO HANDLE SUB REPORTS
						if(halfyrly==""){
							$("#myUL").append('<li class="list-group-item"><a data-toggle="collapse" href="#halfyrly"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="halfyrly" class="collapse librePanelSubListGroupItem"></ul></li>');
							$("#halfyrly").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
							halfyrly="s";
						}else{
							$("#halfyrly").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
						}
							}
					}else if(b[i].frquency.toUpperCase()=="QUARTERLY"){
		// TO HANDLE SUB REPORTS
						if(b[i].subReportFlg.toUpperCase()=="Y"){
							
														
							if(quty=="" && prev_rep!=b[i].reportId){
								$("#myUL").append('<li class="list-group-item"><a data-toggle="collapse" href="#quty"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="quty" class="collapse librePanelSubListGroupItem"></ul></li>');
								$("#quty").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');	
								quty="s";
							}else if(quty=="s" && prev_rep!=b[i].reportId){
								$("#quty").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}else {
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}
							
							prev_rep=b[i].reportId;
						}
			
						else
							{
			// TO HANDLE SUB REPORTS
						if(quty==""){
							$("#myUL").append('<li class="list-group-item"><a data-toggle="collapse" href="#quty"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="quty" class="collapse librePanelSubListGroupItem"></ul></li>');
							$("#quty").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
							quty="s";
						}else{
							$("#quty").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
						}
							}
					}else if(b[i].frquency.toUpperCase()=="MONTHLY"){
						
			// TO HANDLE SUB REPORTS
						if(b[i].subReportFlg.toUpperCase()=="Y"){
							
														
							if(mnthly=="" && prev_rep!=b[i].reportId){
								$("#myUL").append('<li class="list-group-item"><a data-toggle="collapse" href="#mnthly"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="mnthly" class="collapse librePanelSubListGroupItem"></ul></li>');
								$("#mnthly").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');	
								mnthly="s";
							}else if(mnthly=="s" && prev_rep!=b[i].reportId){
								$("#mnthly").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}else {
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}
							
							prev_rep=b[i].reportId;
						}
			
						else
							{
			// TO HANDLE SUB REPORTS
						
							if(mnthly==""){
								$("#myUL").append('<li class="list-group-item"><a data-toggle="collapse" href="#mnthly"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="mnthly" class="collapse librePanelSubListGroupItem"></ul></li>');
								$("#mnthly").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
					
								mnthly="s";
							}else{
								$("#mnthly").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
							}
							
							}
						
					}else if(b[i].frquency.toUpperCase()=="FORTNIGHTLY"){
						
		 // TO HANDLE SUB REPORTS
						if(b[i].subReportFlg.toUpperCase()=="Y"){
							
														
							if(fort=="" && prev_rep!=b[i].reportId){
								$("#myUL").append('<li class="list-group-item"><a data-toggle="collapse" href="#fort"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="fort" class="collapse librePanelSubListGroupItem"></ul></li>');
								$("#fort").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');	
								fort="s";
							}else if(fort=="s" && prev_rep!=b[i].reportId){
								$("#fort").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}else {
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}
							
							prev_rep=b[i].reportId;
						}
			
						else
							{
			// TO HANDLE SUB REPORTS		
				
						if(fort==""){
							$("#myUL").append('<li class="list-group-item"><a data-toggle="collapse" href="#fort"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="fort" class="collapse librePanelSubListGroupItem"></ul></li>');
							$("#fort").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
							fort="s";
						}else{
							$("#fort").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
						}
							}
					}else if(b[i].frquency.toUpperCase()=="WEEKLY"){
						
		// TO HANDLE SUB REPORTS
						if(b[i].subReportFlg.toUpperCase()=="Y"){
							
														
							if(wekly=="" && prev_rep!=b[i].reportId){
								$("#myUL").append('<li class="list-group-item"><a data-toggle="collapse" href="#wekly"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="wekly" class="collapse librePanelSubListGroupItem"></ul></li>');
								$("#wekly").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');	
								wekly="s";
							}else if(wekly=="s" && prev_rep!=b[i].reportId){
								$("#wekly").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+' title='+b[i].reportName+' ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}else {
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}
							
							prev_rep=b[i].reportId;
						}
			
						else
							{
			// TO HANDLE SUB REPORTS	
						if(wekly==""){
							$("#myUL").append('<li class="list-group-item"><a data-toggle="collapse" href="#wekly"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="wekly" class="collapse librePanelSubListGroupItem"></ul></li>');
							$("#wekly").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
							wekly="s";
						}else{
							$("#wekly").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
						}
						
							}
					}else if(b[i].frquency.toUpperCase()=="DAILY"){
						
			// TO HANDLE SUB REPORTS
						if(b[i].subReportFlg.toUpperCase()=="Y"){
							
														
							if(daily=="" && prev_rep!=b[i].reportId){
								$("#myUL").append('<li class="list-group-item"><a data-toggle="collapse" href="#daily"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="daily" class="collapse librePanelSubListGroupItem"></ul></li>');
								$("#daily").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');	
								daily="s";
							}else if(daily=="s" && prev_rep!=b[i].reportId){
								$("#daily").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+' title='+b[i].reportName+' ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}else {
								$('#'+b[i].reportId).append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}
							
							prev_rep=b[i].reportId;
						}
			
						else
							{
			// TO HANDLE SUB REPORTS	
						if(daily==""){
							$("#myUL").append('<li class="list-group-item"><a data-toggle="collapse" href="#daily"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="daily" class="collapse librePanelSubListGroupItem"></ul></li>');
							$("#daily").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
							daily="s";
						}else{
							$("#daily").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
						}
							}
					}
						
				}
				}
		 });
	
	
	
});
</script>

<script>
function addBlock(f,b){
	
	var menuid = {
			"menuid" : f,"menutyp":"other"
		}; 
		$.ajax({
			 url : "menuid",
			data : menuid,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				
}
		 });

	 if(f == 'BOP0300' && b==''){
			parent.frames[2].location='../jsp/BOP0300/XBRL_CRT_BOP0300_01.jsp';
			
		}else if(f == 'BOP0300' && b=='archival'){
			parent.frames[2].location='../jsp/BOP300Archival/XBRL_CRTAr_BOP0300.jsp';
			
		} else if(f == 'Home'){
			parent.frames[2].location='XBRLHomePage.jsp';
		} 
		else if(f == 'BLS0010'){
			parent.frames[2].location='XBRLBLSReport.jsp';
			
		} 
		else if(f == 'ARM001'){
			parent.frames[2].location='XBRLCriteriaARM.jsp';
			
		} 
		else if(f == 'CAR0100'){
			parent.frames[2].location='XBRLCriteriaCAR0100.jsp';
			
		} 
		else if(f == 'CAR0101'){
			parent.frames[2].location='XBRLCriteriaCAR0101.jsp';
			
		} 
		else if(f == 'CAR0102'){
			parent.frames[2].location='XBRLCriteriaCAR0102.jsp';
		
		} 
		else if(f == 'CAR0103'){
			parent.frames[2].location='XBRLCriteriaCAR0103.jsp';
			
		} 
		else if(f == 'CAR0104'){
			parent.frames[2].location='XBRLCriteriaCAR0104.jsp';
		
		} 
		else if(f == 'CAR0105'){
			parent.frames[2].location='XBRLCriteriaCAR0105.jsp';
			
		} 
		else if(f == 'CAR0106'){
			parent.frames[2].location='XBRLCriteriaCAR0106.jsp';
		
		} 
		else if(f == 'CAR0107'){
			parent.frames[2].location='XBRLCriteriaCAR0107.jsp';
		
		} 
		else if(f == 'CAR0108'){
			parent.frames[2].location='XBRLCriteriaCAR0108.jsp';
		
		} 
		else if(f == 'CAR0109'){
			parent.frames[2].location='XBRLCriteriaCAR0109.jsp';
			
		} 
		else if(f == 'CAR0110'){
			parent.frames[2].location='XBRLCriteriaCAR0110.jsp';
		
		} 
		else if(f == 'FIM0300'){
			parent.frames[2].location='../jsp/FIM0300/XBRL_CRT_FIM0300_01.jsp';
		
		} 
		else if(f == 'RG-BOP0300'){
			parent.frames[2].location='Reportdeveloping.jsp';
			
		} 
		else if(f == 'RG-BLS0010'){
			parent.frames[2].location='Reportdeveloping.jsp';
		
		} 
		else if(f == 'RG-FIM0300'){
			parent.frames[2].location='Reportdeveloping.jsp';

		} 
		else if(f == 'CRR0100'){
			parent.frames[2].location='../jsp/CRR0100/XBRL_CRT_CRR0100_01.jsp';
		
		} 
		 
		else if(f == 'SUP0100'){
			parent.frames[2].location='../jsp/SUP0100/XBRL_CRT_SUP0100_01.jsp?reptype='+f;
		
		}
		else if(f == 'SUP0101'){
			parent.frames[2].location='../jsp/SUP0101/XBRL_CRT_SUP0101_01.jsp?reptype='+f;
		
		}
		else if(f == 'SUP0103'){
			parent.frames[2].location='XBRLCriteriaSUP0103.jsp';
		
		}
		else if(f == 'SUP0200'){
			parent.frames[2].location='../jsp/SUP0200/XBRL_CRT_SUP0200_01.jsp?reptype='+f;
		
		}
		else if(f == 'SUP0300'){
			parent.frames[2].location='XBRLCriteriaSUP0300.jsp';
		
		}
		else if(f == 'SUP0302'){
			parent.frames[2].location='XBRLCriteriaSUP0302.jsp';
		
		}
		else if(f == 'SUP0400'){
			parent.frames[2].location='../jsp/SUP0400/XBRL_CRT_SUP0400.jsp';
		
		}
		else if(f == 'SUP0500'){
			parent.frames[2].location='../jsp/SUP0500/XBRL_CRT_SUP0500_01.jsp';
		
		}
		
		else if(f == 'SUP0700'){
			parent.frames[2].location='XBRLCriteriaSUP0700.jsp';
		
		}
		else if(f == 'SUP0800'){
			parent.frames[2].location='XBRLCriteriaSUP0800.jsp';
			
		}
		else if(f == 'SUP0900'){
			parent.frames[2].location='../jsp/SUP0900/XBRL_CRT_SUP0900_01.jsp';
		
		}
		else if(f == 'SUP1000'){
			parent.frames[2].location='../jsp/SUP1000/XBRL_CRT_SUP1000_01.jsp';
			
		}
		else if(f == 'SUP1100'){
			parent.frames[2].location='../jsp/SUP1100/XBRL_CRT_SUP1100_01.jsp';
		
		}
		else if(f == 'SUP1200'){
			parent.frames[2].location='../jsp/SUP1200/XBRL_CRT_SUP1200_01.jsp';
		
		}
		else if(f == 'SUP1300'){
			parent.frames[2].location='../jsp/SUP1300/XBRL_CRT_SUP1300_01.jsp';
			
		}
		else if(f == 'SUP1400'){
			parent.frames[2].location='../jsp/SUP1400/XBRL_CRT_SUP1400_01.jsp';
		
		}
		else if(f == 'SUP1500'){
			parent.frames[2].location='../jsp/SUP1500/XBRL_CRT_SUP1500_01.jsp';
		
		}
		else if(f == 'PARAMETERS'){
			parent.frames[2].location='../jsp/Parameter/XBRL_PARAM.jsp';
		
		} 
		else if(f == 'EMAIL'){
			parent.frames[2].location='Reportdeveloping.jsp';
	
		} 
		else if(f == 'SMS'){
			parent.frames[2].location='Reportdeveloping.jsp';
	
		} 
		else if(f == 'ALERT'){
			parent.frames[2].location='Reportdeveloping.jsp';
			
		} 
		 


		else if(f == 'BLS0106'){
					
					
					
					parent.frames[2].location='../jsp/BLS0106/XBRL_CRT_BLS0106_01.jsp';
					
				}

		 
		else if(f == 'BLS0300A'){
			parent.frames[2].location='XBRLCriteriaBLS0300Asset.jsp';
		
		}
		else if(f == 'BLS0300L'){
			parent.frames[2].location='XBRLCriteriaBLS0300Liabilities.jsp';
		
		}
		 
		 
		 else if(f == 'BLS0300MA'){
				parent.frames[2].location='XBRLCriteriaBLS0300MemAssets.jsp';
			
			}
		 else if(f == 'BLS0300ML'){
				parent.frames[2].location='XBRLCriteriaBLS0300MemLiabilities.jsp';
		
			}
		 
		 
		 else if(f == 'BLS0310'){
				parent.frames[2].location='XBRLCriteriaBLS0310.jsp';
		
			}
		 
		 else if(f == 'BLS0320'){
				parent.frames[2].location='XBRLCriteriaBLS0320.jsp';
			
			}
		 
		 else if(f == 'BLS0330'){
				parent.frames[2].location='XBRLCriteriaBLS0330.jsp';
			
			}
		 
		 else if(f == 'BLS0340'){
				parent.frames[2].location='XBRLCriteriaBLS0340.jsp';
			
			}
		 
		 else if(f == 'BLS0400'){
				parent.frames[2].location='XBRLCriteriaBLS0400.jsp';
		
			}
		 
		 else if(f == 'BLS0500'){
				parent.frames[2].location='XBRLCriteriaBLS0500.jsp';
		
			}
		 
		 else if(f == 'BLS0600'){
				parent.frames[2].location='../jsp/BLS0600/XBRL_CRT_BLS0600_01.jsp';
			
			}
		 
		 else if(f == 'BLS0700'){
				parent.frames[2].location='../jsp/BLS0700/XBRL_CRT_BLS0700.jsp';
		
			}
		 else if(f == 'BOP0100'){
				parent.frames[2].location='../jsp/BOP0100/XBRL_CRT_BOP0100_01.jsp';
			
			}
		 else if(f == 'BOP0400'){
				parent.frames[2].location='XBRLCriteriaBOP0400.jsp';
		
			}
		 else if(f == 'BOP0500'){
				parent.frames[2].location='XBRLCriteriaBOP0500.jsp';
		
			}
		 
		 else if(f == 'BOP0200'){
				parent.frames[2].location='XBRLCriteriaBOP0200.jsp';
		
			}
		 
		 else if(f == 'BOP0202'){
			 parent.frames[2].location='../jsp/BOP0202/XBRL_CRT_BOP0202.jsp';

			 }

		 else if(f == 'CAR0200'){
				parent.frames[2].location='XBRLCriteriaCAR0200.jsp';
			
			}
			 
			 
			else if(f == 'CAR0201'){
				parent.frames[2].location='XBRLCriteriaCAR0201.jsp';
			
			}
			 
			 
			
			 
			else if(f == 'FIM0100'){
				parent.frames[2].location='../jsp/FIM0100/XBRL_CRT_FIM0100_01.jsp';
				
			}
			else if(f == 'FIM0200'){
				parent.frames[2].location='../jsp/FIM0200/XBRL_CRT_FIM0200_01.jsp';
			
			}
			 else if(f == 'BLS0100'){
					parent.frames[2].location='../jsp/BLS0100/XBRL_CRT_BLS0100_01.jsp';
				
				}  
/* 
			 else if(f == 'BLS0100A'){
					parent.frames[2].location='XBRLCriteriaBLS0100Asset.jsp';
				
				}  
			 else if(f == 'BLS0100L'){
					parent.frames[2].location='XBRLCriteriaBLS0100Liabilities.jsp';
			
				} 
			 else if(f == 'BLS0100MA'){
					parent.frames[2].location='XBRLCriteriaBLS0100MemAsset.jsp';
				
				} 
			 
			 else if(f == 'BLS0100ML'){
					parent.frames[2].location='XBRLCriteriaBLS0100MemLiabilities.jsp';
				
				}   */
			 else if(f == 'BLS0110'){
					parent.frames[2].location='../jsp/BLS0110/XBRL_CRT_BLS0110_01.jsp';
				
				} 
			 else if(f == 'BLS0120'){
					parent.frames[2].location='../jsp/BLS0120/XBRL_CRT_BLS0120_01.jsp';
				
				} 
			 else if(f == 'BLS0130'){
					parent.frames[2].location='../jsp/BLS0130/XBRL_CRT_BLS0130_01.jsp';
				
				} 
			 else if(f == 'BLS0140'){
					parent.frames[2].location='../jsp/BLS0140/XBRL_CRT_BLS0140_01.jsp';
				
				} 


			 else if(f == 'BLS0102'){
				
					parent.frames[2].location='../jsp/BLS0102/XBRL_CRT_BLS0102_01.jsp';
					
				} 
				  
			 else if(f == 'BLS0103'){
				
					parent.frames[2].location='../jsp/BLS0103/XBRL_CRT_BLS0103_01.jsp';
					
				} 
			 else if(f == 'BLS0104'){
				
					parent.frames[2].location='../jsp/BLS0104/XBRL_CRT_BLS0104_01.jsp';
					
				} 
			 else if(f == 'BLS0105'){
			
					parent.frames[2].location='../jsp/BLS0105/XBRL_CRT_BLS0105_01.jsp';
					
				} 

		 
		 /* else if(f == 'SUP0600'){
			 alert(" SUP0600 ");
				parent.frames[2].location='../jsp/SUP0600/XBRLCriteriaSUP0600.jsp';
				
			} 

		 else if(f == 'SUP0601'){
			 alert(" SUP0601 ");
				parent.frames[2].location='XBRLCriteriaSUP0601.jsp';
				
			} 

		 else if(f == 'SUP0602'){
				alert("CHKINGGGGGGGGG");
					parent.frames[2].location='../jsp/SUP0602/XBRL_CRT_SUP0602_01.jsp';
					
				}

		 else if(f == 'SUP0603'){
			 alert(" SUP0603 ");
				parent.frames[2].location='XBRLCriteriaSUP0603.jsp';
				
			} */ 
			
			
			
			
			
			
			 else if(f == 'SUP0600'){
				 
					parent.frames[2].location='../jsp/SUP0600/XBRL_CRT_SUP0600.jsp';
					
				} 

			else if(f == 'SUP0601'){
			parent.frames[2].location='../jsp/SUP0601/XBRL_CRT_SUP0601.jsp';
			
		}
	 
				else if(f == 'SUP0602'){
			parent.frames[2].location='../jsp/SUP0602/XBRL_CRT_SUP0602_01.jsp';
			
		}
		
				else if(f == 'SUP0603'){
			parent.frames[2].location='../jsp/SUP0603/XBRL_CRT_SUP0603_01.jsp';
		
		}
		

				else if(f == 'SUP0604'){
						parent.frames[2].location='../jsp/SUP0604/XBRL_CRT_SUP0604.jsp';
					
					}

				else if(f == 'SUP0605'){
					
					parent.frames[2].location='../jsp/SUP0605/XBRL_CRT_SUP0605_01.jsp';
					
				}
				else if(f == 'SUP0606'){
					
					parent.frames[2].location='../jsp/SUP0606/XBRL_CRT_SUP0606_01.jsp';
					
				}
		
			else if(f == 'FIM0400'){
				parent.frames[2].location='../jsp/FIM0400/XBRL_CRT_FIM0400_01.jsp';
				
			}
			
			else if(f == 'FIM0500'){
				parent.frames[2].location='../jsp/FIM0500/XBRL_CRT_FIM0500.jsp';
			
			}
	 
			else if(f == 'FIM0600'){
				parent.frames[2].location='../jsp/FIM0600/XBRL_CRT_FIM0600.jsp';
			
			}
			 
						
			else if(f == 'FIM0601'){
				parent.frames[2].location='XBRLCriteriaFIM0601.jsp';
			
			} 
			 
			else if(f == 'FIM0800'){
				parent.frames[2].location='../jsp/FIM0800/XBRL_CRT_FIM0800_01.jsp';
			
			}
			 
			 
			else if(f == 'FIM0900'){
				 parent.frames[2].location='../jsp/FIM0900/XBRL_CRT_FIM0900_01.jsp';
			
			} 
			 
			 
			else if(f == 'FIM1000'){
				parent.frames[2].location='../jsp/FIM1000/XBRL_CRT_FIM1000_01.jsp';
			
			} 

			else if(f == 'PSC0100'){
				parent.frames[2].location='XBRLPSC0100CriteriaPage.jsp';
			
			}
			else if(f == 'PSC0102'){
				parent.frames[2].location='../jsp/PSC0102/XBRL_CRT_PSC0102_01.jsp';
				
			}
			else if(f == 'PSC0103'){
				parent.frames[2].location='../jsp/PSC0103/XBRL_CRT_PSC0103_01.jsp';
			
			}
			else if(f == 'PSC0104'){
				parent.frames[2].location='../jsp/PSC0104/XBRL_CRT_PSC0104_01.jsp';
			
			}
			else if(f == 'PSC0200'){
				parent.frames[2].location='../jsp/PSC0200/XBRL_CRT_PSC0200_01.jsp';
				
			}
			 
			else if(f == 'PSC0300'){
				parent.frames[2].location='../jsp/PSC0300/XBRL_CRT_PSC0300_01.jsp';
				
			}
			else if(f == 'PSC0400'){
				
				parent.frames[2].location='XBRLPSC0400CriteriaPage.jsp';
				
			}
		
		
	 
	 
		else if(f == 'PYM0100' && b==''){
			
			
			
			parent.frames[2].location='../jsp/PYM0100/XBRL_CRT_PYM0100_01.jsp?reptype='+f;
			
		}else if(f == 'PYM0100' && b=='archival'){
			parent.frames[2].location='../jsp/PYM0100Archival/XBRL_CRTAr_PYM0100_01.jsp?reptype='+f;
		}

		else if(f == 'PSC0105'){
		
				parent.frames[2].location='../jsp/PSC0105/XBRL_CRT_PSC0105_01.jsp?reptype='+f;
				
			} 
			else if(f == 'PSC0106'){
				
					parent.frames[2].location='../jsp/PSC0106/XBRL_CRT_PSC0106_01.jsp?reptype='+f;
					
				}
	 
	 
	 
		
			else if(f == 'PSC0500'){

				parent.frames[2].location='../jsp/PSC0500/XBRL_CRT_PSC0500_01.jsp?reptype=PSC0500';

				}
			 else if(f == 'PSC0501'){

				 parent.frames[2].location='../jsp/PSC0501/XBRL_CRT_PSC0501_01.jsp?reptype=PSC0501';

				 }
			 else if(f == 'DCG0100'){
					parent.frames[2].location='../jsp/DCG0100/XBRL_CRT_DCG0100_01.jsp';
					
				} 
	 
	 
			 else if(f == 'REFCODECONF'){
					parent.frames[2].location='../jsp/CONFIG/XBRL_REF_CODE_CONF.jsp';
					
				} else if(f == 'REPCONF'){
					parent.frames[2].location='../jsp/REFCODE_MAPPING/XBRL_REFCODE_MAPPING.jsp';
					
				}  else if(f == 'REFCODECMAINT'){
					parent.frames[2].location='../jsp/CONFIG/XBRL_REPREF_CODEMAIN.jsp?type=open';
					
				} 
				 else if(f == 'UP'){
					 parent.frames[2].location='UserProfile.jsp?type=open';

					 }
				 else if(f == 'RMP'){
					 parent.frames[2].location='../jsp/REP_DETAILS/XBRL_Rep_Details1.jsp';

					 }

	
	 
	
}
function fnlogout(){
	//alert("HAI");
	/* self.parent.location='Logout.jsp'; */
	var menuid = {
			"menutyp":"logout"
		}; 
		$.ajax({
			 url : "menuid",
			data : menuid,
			dataType : 'json', 
			type : 'POST',
			async : true,
			 success : function(res) {
				
}
		 });
	 LogoutForm.action = "logout.action?method=logout&uName="+'<%=session.getAttribute("userName")%>';
	 LogoutForm.submit(); 
	
}
</script>
<script>

$(document).ready(function(){
	$.ajax({
        url : "getMenuPagearch",
        dataType : 'json', 
		type : 'POST',
		async : false,
		 success : function(res) {
			
			 var b=JSON.parse(res.menulist);
				console.log(b);
				var yrly="";var halfyrly="";var quty="";var mnthly="";var fort="";var wekly="";var daily="";var prev_rep="";
				for ( var i = 0; i < b.length; i++)	 {
					
					if(b[i].frquency.toUpperCase()=="YEARLY"){
						// TO HANDLE SUB REPORTS
						if(b[i].subReportFlg.toUpperCase()=="Y"){
							
														
							if(yrly=="" && prev_rep!=b[i].reportId){
								$("#archival").append('<li class="list-group-item"><a data-toggle="collapse" href="#yearly1"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="yearly1" class="collapse librePanelSubListGroupItem"></ul></li>');
								$("#yearly1").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+'1'+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+'1'+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');	
								yrly="s";
							}else if(yrly=="s" && prev_rep!=b[i].reportId){
								$("#yearly1").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+'1'+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+'1'+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}else {
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}
							
							prev_rep=b[i].reportId;
						}
			
						else
							{
			// TO HANDLE SUB REPORTS
			
						if(yrly==""){
							$("#archival").append('<li class="list-group-item"><a data-toggle="collapse" href="#yearly1"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="yearly1" class="collapse librePanelSubListGroupItem"></ul></li>');
							$("#yearly1").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
							yrly="s";
						}else{
							$("#yearly1").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
						}
							}
					}else if(b[i].frquency.toUpperCase()=="HALF YEARLY"){
				
			// TO HANDLE SUB REPORTS
						if(b[i].subReportFlg.toUpperCase()=="Y"){
							
														
							if(halfyrly=="" && prev_rep!=b[i].reportId){
								$("#archival").append('<li class="list-group-item"><a data-toggle="collapse" href="#halfyrly1"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="halfyrly1" class="collapse librePanelSubListGroupItem"></ul></li>');
								$("#halfyrly1").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+'1'+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+'1'+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');	
								halfyrly="s";
							}else if(halfyrly=="s" && prev_rep!=b[i].reportId){
								$("#halfyrly1").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+'1'+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+'1'+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}else {
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}
							
							prev_rep=b[i].reportId;
						}
			
						else
							{
			// TO HANDLE SUB REPORTS
						if(halfyrly==""){
							$("#archival").append('<li class="list-group-item"><a data-toggle="collapse" href="#halfyrly1"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="halfyrly1" class="collapse librePanelSubListGroupItem"></ul></li>');
							$("#halfyrly1").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
							halfyrly="s";
						}else{
							$("#halfyrly1").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
						}
							}
					}else if(b[i].frquency.toUpperCase()=="QUARTERLY"){
		// TO HANDLE SUB REPORTS
						if(b[i].subReportFlg.toUpperCase()=="Y"){
							
														
							if(quty=="" && prev_rep!=b[i].reportId){
								$("#archival").append('<li class="list-group-item"><a data-toggle="collapse" href="#quty1"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="quty1" class="collapse librePanelSubListGroupItem"></ul></li>');
								$("#quty1").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+'1'+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+'1'+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');	
								quty="s";
							}else if(quty=="s" && prev_rep!=b[i].reportId){
								$("#quty1").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+'1'+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+'1'+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}else {
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}
							
							prev_rep=b[i].reportId;
						}
			
						else
							{
			// TO HANDLE SUB REPORTS
						if(quty==""){
							$("#archival").append('<li class="list-group-item"><a data-toggle="collapse" href="#quty1"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="quty1" class="collapse librePanelSubListGroupItem"></ul></li>');
							$("#quty1").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
							quty="s";
						}else{
							$("#quty1").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
						}
							}
					}else if(b[i].frquency.toUpperCase()=="MONTHLY"){
						
			// TO HANDLE SUB REPORTS
						if(b[i].subReportFlg.toUpperCase()=="Y"){
							
														
							if(mnthly=="" && prev_rep!=b[i].reportId){
								$("#archival").append('<li class="list-group-item"><a data-toggle="collapse" href="#mnthly1"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="mnthly1" class="collapse librePanelSubListGroupItem"></ul></li>');
								$("#mnthly1").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+'1'+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+'1'+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');	
								mnthly="s";
							}else if(mnthly=="s" && prev_rep!=b[i].reportId){
								$("#mnthly1").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+'1'+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+'1'+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}else {
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}
							
							prev_rep=b[i].reportId;
						}
			
						else
							{
			// TO HANDLE SUB REPORTS
						
							if(mnthly==""){
								$("#archival").append('<li class="list-group-item"><a data-toggle="collapse" href="#mnthly1"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="mnthly1" class="collapse librePanelSubListGroupItem"></ul></li>');
								$("#mnthly1").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
					
								mnthly="s";
							}else{
								$("#mnthly1").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
							}
							
							}
						
					}else if(b[i].frquency.toUpperCase()=="FORTNIGHTLY"){
						
		 // TO HANDLE SUB REPORTS
						if(b[i].subReportFlg.toUpperCase()=="Y"){
							
														
							if(fort=="" && prev_rep!=b[i].reportId){
								$("#archival").append('<li class="list-group-item"><a data-toggle="collapse" href="#fort1"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="fort1" class="collapse librePanelSubListGroupItem"></ul></li>');
								$("#fort1").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+'1'+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+'1'+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');	
								fort="s";
							}else if(fort=="s" && prev_rep!=b[i].reportId){
								$("#fort1").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+'1'+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+'1'+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}else {
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}
							
							prev_rep=b[i].reportId;
						}
			
						else
							{
			// TO HANDLE SUB REPORTS		
				
						if(fort==""){
							$("#archival").append('<li class="list-group-item"><a data-toggle="collapse" href="#fort1"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="fort1" class="collapse librePanelSubListGroupItem"></ul></li>');
							$("#fort1").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
							fort="s";
						}else{
							$("#fort1").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
						}
							}
					}else if(b[i].frquency.toUpperCase()=="WEEKLY"){
						
		// TO HANDLE SUB REPORTS
						if(b[i].subReportFlg.toUpperCase()=="Y"){
							
														
							if(wekly=="" && prev_rep!=b[i].reportId){
								$("#archival").append('<li class="list-group-item"><a data-toggle="collapse" href="#wekly1"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="wekly1" class="collapse librePanelSubListGroupItem"></ul></li>');
								$("#wekly1").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+'1'+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+'1'+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');	
								wekly="s";
							}else if(wekly=="s" && prev_rep!=b[i].reportId){
								$("#wekly1").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+'1'+' title='+b[i].reportName+' ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+'1'+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}else {
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}
							
							prev_rep=b[i].reportId;
						}
			
						else
							{
			// TO HANDLE SUB REPORTS	
						if(wekly==""){
							$("#archival").append('<li class="list-group-item"><a data-toggle="collapse" href="#wekly1"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="wekly1" class="collapse librePanelSubListGroupItem"></ul></li>');
							$("#wekly1").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
							wekly="s";
						}else{
							$("#wekly1").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
						}
						
							}
					}else if(b[i].frquency.toUpperCase()=="DAILY"){
						
			// TO HANDLE SUB REPORTS
						if(b[i].subReportFlg.toUpperCase()=="Y"){
							
														
							if(daily=="" && prev_rep!=b[i].reportId){
								$("#archival").append('<li class="list-group-item"><a data-toggle="collapse" href="#daily1"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="daily1" class="collapse librePanelSubListGroupItem"></ul></li>');
								$("#daily1").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+'1'+' title="'+b[i].reportName+'" ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+'1'+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');	
								daily="s";
							}else if(daily=="s" && prev_rep!=b[i].reportId){
								$("#daily1").append('<li class="list-group-item librePanelListGroupItem"><a data-toggle="collapse" href='+'#'+b[i].reportId+'1'+' title='+b[i].reportName+' ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a><ul id='+b[i].reportId+'1'+' class="collapse librePanelSubListGroupItem"></ul></li>');
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}else {
								$('#'+b[i].reportId+'1').append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].subReportName+'" onclick=addBlock("'+b[i].subReportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].subReportId+'</font></a></li>');
							}
							
							prev_rep=b[i].reportId;
						}
			
						else
							{
			// TO HANDLE SUB REPORTS	
						if(daily==""){
							$("#archival").append('<li class="list-group-item"><a data-toggle="collapse" href="#daily1"><font style="margin-left: 10px;color: #0d1292;">'+b[i].frquency+'</font></a><ul id="daily1" class="collapse librePanelSubListGroupItem"></ul></li>');
							$("#daily1").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
							daily="s";
						}else{
							$("#daily1").append('<li class="list-group-item librePanelListGroupItem"><a href="#" title="'+b[i].reportName+'" onclick=addBlock("'+b[i].reportId+'","archival") ><font style="margin-left: -32px;color: #0d1292;">'+b[i].reportId+'</font></a></li>');
						}
							}
					}
						
				}
				}
		 });
});
</script>
<script>
function myFunction() {
    var input, filter, ul, li, a, i;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";

        }
    }
}
</script>



<body style="background-color: #bbc3cb; font-size: 12px;">
	<form class="form-horizontal" method="post" name="LogoutForm"
		enctype="multipart/form-data">






		<!-- menu -->
		<div class="content">
			<div id="MainMenu">
				<!-- <div id="sidebar-wrapper"> -->


					<div class="list-group panel" style="margin-left: -15px;">




						<a href="#" onclick="addBlock('Home')"
							class="list-group-item list-group-item-success"
							data-parent="#MainMenu">Home</a> <a href="#demo1"
							class="list-group-item list-group-item-success"
							data-toggle="collapse" data-parent="#MainMenu">Admin</a>



						<div class="collapse" id="demo1">


							<a href="#" title="Bank and Branch Master"
								onclick="addBlock('BBM')" class="list-group-item"><font
								style="margin-left: 16px;">Bank and Branch Master</font></a> <a
								href="#" title="User Profile" onclick="addBlock('UP')"
								class="list-group-item"><font style="margin-left: 16px;">User
									Profile</font></a>




						</div>
						<a href="#conf" class="list-group-item list-group-item-success"
							data-toggle="collapse" data-parent="#MainMenu">XBRL
							Configuration</a>
						<div class="collapse" id="conf">
						<a href="#" title="Reference Code Configuration"
								onclick="addBlock('REFCODECONF')" class="list-group-item"><font
								style="margin-left: 16px;">Reference Code
									Configuration</font></a> <!-- <a href="#" title="Reference Code Configuration"
								onclick="addBlock('REPCONF')" class="list-group-item"><font
								style="margin-left: 16px;">Report Code Mapping</font></a> -->
							<a href="#" title="Report Code Maintenance"
								onclick="addBlock('REFCODECMAINT')" class="list-group-item"><font
								style="margin-left: 16px;">Report Code
									Maintenance</font></a> <a href="#" title="Report Code Mapping"
								onclick="addBlock('REPCONF')" class="list-group-item"><font
								style="margin-left: 16px;">Report Code Mapping</font></a>

							<a href="#" title="Report Details" onclick="addBlock('RMP')"
								class="list-group-item"><font style="margin-left: 16px;">
									Report Details</font></a>
						</div>


						<a href="#demo12" class="list-group-item list-group-item-success"
							data-toggle="collapse" data-parent="#MainMenu">Batch job
							Scheduler</a> <a href="#demo13"
							class="list-group-item list-group-item-success"
							data-toggle="collapse" data-parent="#MainMenu">Batch job
							Execution</a> <a href="#myUL" data-toggle="collapse"
							onclick="addBlock('Homesss')"
							class="list-group-item list-group-item-success"
							data-parent="#MainMenu"> XBRL Reports </a>







						<ul class="list-group collapse" id="myUL" style="padding: 0px;">


						</ul>
						<a href="#archival" data-toggle="collapse"
							onclick="addBlock('archival')"
							class="list-group-item list-group-item-success"
							data-parent="#MainMenu">XBRL Archival</a>
						<ul class="list-group collapse" id="archival"
							style="padding: 0px;">


						</ul>


					 <!-- 	<a href="#batchjop" data-toggle="collapse"
							onclick="addBlock('Homesss')"
							class="list-group-item list-group-item-success"
							data-parent="#MainMenu">Batch Jobs </a>
						<ul class="list-group collapse" id="batchjop"
							style="padding: 0px;">

							<li class="list-group-item"><a data-toggle="collapse"
								href="#menuBYearlyPanelSubListGroup"> <font
									style="margin-left: 10px; color: #0d1292;">Yearly</font>

							</a>
								<ul id="menuBYearlyPanelSubListGroup"
									class="collapse librePanelSubListGroupItem">
								</ul></li>
							<li class="list-group-item"><a data-toggle="collapse"
								href="#menuBHalfYearlyPanelSubListGroup"> <font
									style="margin-left: 10px; color: #0d1292;">Half Yearly</font>

							</a>
								<ul id="menuBHalfYearlyPanelSubListGroup"
									class="collapse librePanelSubListGroupItem">
								</ul></li>
							<li class="list-group-item"><a data-toggle="collapse"
								href="#menuBQuarterlyPanelSubListGroup"> <font
									style="margin-left: 10px; color: #0d1292;">Quarterly</font>

							</a>
								<ul id="menuBQuarterlyPanelSubListGroup"
									class="collapse librePanelSubListGroupItem">
								</ul></li>
							<li class="list-group-item"><a data-toggle="collapse"
								href="#menuBMonthlyPanelSubListGroup"> <font
									style="margin-left: 10px; color: #0d1292;">Monthly</font>

							</a>
								<ul id="menuBMonthlyPanelSubListGroup"
									class="collapse librePanelSubListGroupItem">
								</ul></li>
							<li class="list-group-item"><a data-toggle="collapse"
								href="#menuBFortnightlyPanelSubListGroup"> <font
									style="margin-left: 10px; color: #0d1292;">Fortnightly</font>

							</a>
								<ul id="menuBFortnightlyPanelSubListGroup"
									class="collapse librePanelSubListGroupItem">
								</ul></li>

							<li class="list-group-item"><a data-toggle="collapse"
								href="#menuBWeeklyPanelSubListGroup"> <font
									style="margin-left: 10px; color: #0d1292;">Weekly</font>

							</a>
								<ul id="menuBWeeklyPanelSubListGroup"
									class="collapse librePanelSubListGroupItem">
								</ul></li>
							<li class="list-group-item"><a data-toggle="collapse"
								href="#menuBDailyPanelSubListGroup"> <font
									style="margin-left: 10px; color: #0d1292;">Daily</font>

							</a>
								<ul id="menuBDailyPanelSubListGroup"
									class="collapse librePanelSubListGroupItem">
								</ul></li>

						</ul> -->
						
						
						<a href="#mis" data-toggle="collapse" onclick="addBlock('mis')"
							class="list-group-item list-group-item-success"
							data-parent="#MainMenu">MIS Reports</a> 
					<a href="#generalInq"
							data-toggle="collapse" onclick="addBlock('generalInq')"
							class="list-group-item list-group-item-success"
							data-parent="#MainMenu">Inquiries</a>
						<ul class="list-group collapse" id="generalInq"
							style="padding: 0px;">
							
							<li class="list-group-item"><a data-toggle="collapse"
								href="#menuaudInqPanelSubListGroup"> <font
									style="margin-left: 10px; color: #0d1292;">General
										Inquiries</font>

							</a>
								<ul id="menuaudInqPanelSubListGroup"
									class="collapse librePanelSubListGroupItem">
								</ul></li>
							
							
							<li class="list-group-item"><a data-toggle="collapse"
								href="#menuaudInqPanelSubListGroup"> <font
									style="margin-left: 10px; color: #0d1292;">Audit
										Inquiries</font>

							</a>
								<ul id="menuaudInqPanelSubListGroup"
									class="collapse librePanelSubListGroupItem">
								</ul></li>
								
							<li class="list-group-item"><a data-toggle="collapse"
								href="#menuuserlogPanelSubListGroup"> <font
									style="margin-left: 10px; color: #0d1292;">User Logs</font>

							</a>
								<ul id="menuuserlogPanelSubListGroup"
									class="collapse librePanelSubListGroupItem">
								</ul></li>
						</ul>
					<!-- <a href="audInq" data-toggle="collapse"
							onclick="addBlock('audInq')"
							class="list-group-item list-group-item-success"
							data-parent="#MainMenu">Audit Inquiries</a>  -->
					<a href="#demo10"
							onclick="fnlogout();"
							class="list-group-item list-group-item-success"
							data-toggle="collapse" data-parent="#MainMenu">LogOut </a>
						<div class="collapse" id="demo10"></div>


					</div>
				</div>

			</div>


		<!-- </div> -->


	</form>
</body>
</html>