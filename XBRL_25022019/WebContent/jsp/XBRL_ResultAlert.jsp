<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="../Bootstrap/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Result</title>
<script type="text/javascript">

		function alertName() {
			
<%-- if("Logout"!='<%=request.getAttribute("Page")%>'){
	alert('<%=request.getAttribute("alert")%>');
			} --%>
			
			if("userProfile"=='<%=request.getAttribute("Page")%>'){
				
				$("#msg").html('<%=request.getAttribute("alert")%>');
				$( "#dialog-confirm" ).dialog({
				      resizable: false,
				      height: "auto",
				      width: 400,
				      modal: true,
				      buttons: {
				        "OK": function() {
				        	$( this ).dialog( "close" );
				location.href = 'UserProfile.jsp?type=open';
				
			   	
				        }
				      }
				    });
				
				
				
			}else if("refcodemaint"=='<%=request.getAttribute("Page")%>'){
				$("#msg").html('<%=request.getAttribute("alert")%>');
				$( "#dialog-confirm" ).dialog({
				      resizable: false,
				      height: "auto",
				      width: 400,
				      modal: true,
				      buttons: {
				        "OK": function() {
				        	$( this ).dialog( "close" );
				location.href="../CONFIG/XBRL_REPREF_CODEMAIN.jsp?type=open";
				
			  	
				        }
				      }
				    });
				
			}else if("repcodeupdate"=='<%=request.getAttribute("Page")%>'){
				$("#msg").html('<%=request.getAttribute("alert")%>');
				$( "#dialog-confirm" ).dialog({
				      resizable: false,
				      height: "auto",
				      width: 400,
				      modal: true,
				      buttons: {
				        "OK": function() {
				        	$( this ).dialog( "close" );
				
				location.href="../REFCODE_MAPPING/XBRL_REFCODE_MAPPING.jsp";

				        }
				      }
				    });
			}
			
else if("bulkupload"=='<%=request.getAttribute("Page")%>'){
	$("#msg").html('<%=request.getAttribute("alert")%>');
	$( "#dialog-confirm" ).dialog({
	      resizable: false,
	      height: "auto",
	      width: 400,
	      modal: true,
	      buttons: {
	        "OK": function() {
	        	$( this ).dialog( "close" );
	
				
				location.href="../PYM0100/XBRL_CRT_PYM0100_01.jsp";
				
	        }
	      }
	    });
			}
			
else if("bulkuploadbls103"=='<%=request.getAttribute("Page")%>'){
	$("#msg").html('<%=request.getAttribute("alert")%>');
	$( "#dialog-confirm" ).dialog({
	      resizable: false,
	      height: "auto",
	      width: 400,
	      modal: true,
	      buttons: {
	        "OK": function() {
	        	$( this ).dialog( "close" );
	
				
				location.href="../BLS0103/XBRL_CRT_BLS0103_01.jsp";
				
	        }
	      }
	    });
			}else if("bulkuploadbls110"=='<%=request.getAttribute("Page")%>'){
				$("#msg").html('<%=request.getAttribute("alert")%>');
				$( "#dialog-confirm" ).dialog({
				      resizable: false,
				      height: "auto",
				      width: 400,
				      modal: true,
				      buttons: {
				        "OK": function() {
				        	$( this ).dialog( "close" );
				
							
							location.href="../BLS0110/XBRL_CRT_BLS0110_01.jsp";
							
				        }
				      }
				    });
						}
			
			else if("SUP0100ins"=='<%=request.getAttribute("Page")%>'){
				
				$("#msg").html('<%=request.getAttribute("alert")%>');
				$( "#dialog-confirm" ).dialog({
				      resizable: false,
				      height: "auto",
				      width: 400,
				      modal: true,
				      buttons: {
				        "OK": function() {
				        	$( this ).dialog( "close" );
				
				location.href="../SUP0100/XBRL_CRT_SUP0100_01.jsp?reptype=SUP0100";
				
				        }
				      }
				    });
					
			}else if("SUP0100mod"=='<%=request.getAttribute("Page")%>'){
				$("#msg").html('<%=request.getAttribute("alert")%>');
				$( "#dialog-confirm" ).dialog({
				      resizable: false,
				      height: "auto",
				      width: 400,
				      modal: true,
				      buttons: {
				        "OK": function() {
				        	$( this ).dialog( "close" );
				
				location.href="../SUP0100/XBRL_CRT_SUP0100_01.jsp?reptype=SUP0100";
				
	        }
	      }
	    });
		
			}
			else if("bulkuploadfim100"=='<%=request.getAttribute("Page")%>'){
				$("#msg").html('<%=request.getAttribute("alert")%>');
				$( "#dialog-confirm" ).dialog({
				      resizable: false,
				      height: "auto",
				      width: 400,
				      modal: true,
				      buttons: {
				        "OK": function() {
				        	$( this ).dialog( "close" );
				
							
							location.href="../FIM0100/XBRL_CRT_FIM0100_01.jsp";
							
				        }
				      }
				    });
						}
			
			else if("bulkuploadfim200"=='<%=request.getAttribute("Page")%>'){
				$("#msg").html('<%=request.getAttribute("alert")%>');
				$( "#dialog-confirm" ).dialog({
				      resizable: false,
				      height: "auto",
				      width: 400,
				      modal: true,
				      buttons: {
				        "OK": function() {
				        	$( this ).dialog( "close" );
				
							
							location.href="../FIM0200/XBRL_CRT_FIM0200_01.jsp";
							
				        }
				      }
				    });
						}
			
			
			else if("bulkuploadfim1000"=='<%=request.getAttribute("Page")%>'){
				
				$("#msg").html('<%=request.getAttribute("alert")%>');
				$( "#dialog-confirm" ).dialog({
				      resizable: false,
				      height: "auto",
				      width: 400,
				      modal: true,
				      buttons: {
				        "OK": function() {
				        	$( this ).dialog( "close" );
				
				location.href="../FIM1000/XBRL_CRT_FIM1000_01.jsp";
				
				        }
				      }
				    });
					
			}
			
			
			else if("bulkuploadfim300"=='<%=request.getAttribute("Page")%>'){
							$("#msg").html('<%=request.getAttribute("alert")%>');
							$( "#dialog-confirm" ).dialog({
							      resizable: false,
							      height: "auto",
							      width: 400,
							      modal: true,
							      buttons: {
							        "OK": function() {
							        	$( this ).dialog( "close" );
							
										
										location.href="../FIM0300/XBRL_CRT_FIM0300_01.jsp";
										
							        }
							      }
							    });
					}else if("bulkuploadfim400"=='<%=request.getAttribute("Page")%>'){
										
										$("#msg").html('<%=request.getAttribute("alert")%>');
										$( "#dialog-confirm" ).dialog({
										      resizable: false,
										      height: "auto",
										      width: 400,
										      modal: true,
										      buttons: {
										        "OK": function() {
										        	$( this ).dialog( "close" );
										
										location.href="../FIM0400/XBRL_CRT_FIM0400_01.jsp";
										
										        }
										      }
										    });
											
					}else if("bulkuploaddcg100"=='<%=request.getAttribute("Page")%>'){
										$("#msg").html('<%=request.getAttribute("alert")%>');
										$( "#dialog-confirm" ).dialog({
										      resizable: false,
										      height: "auto",
										      width: 400,
										      modal: true,
										      buttons: {
										        "OK": function() {
										        	$( this ).dialog( "close" );
										
													
													location.href="../DCG0100/XBRL_CRT_DCG0100_01.jsp";
													
										        }
										      }
										    });
					}else if("bulkuploadfim500"=='<%=request.getAttribute("Page")%>'){
													$("#msg").html('<%=request.getAttribute("alert")%>');
													$( "#dialog-confirm" ).dialog({
													      resizable: false,
													      height: "auto",
													      width: 400,
													      modal: true,
													      buttons: {
													        "OK": function() {
													        	$( this ).dialog( "close" );
													
																
																location.href="../FIM0500/XBRL_CRT_FIM0500.jsp";
																
													        }
													      }
													    });
						}
			
					else if("bulkuploadsup1100"=='<%=request.getAttribute("Page")%>'){
						
						$("#msg").html('<%=request.getAttribute("alert")%>');
						$( "#dialog-confirm" ).dialog({
						      resizable: false,
						      height: "auto",
						      width: 400,
						      modal: true,
						      buttons: {
						        "OK": function() {
						        	$( this ).dialog( "close" );
						
						location.href="../SUP1500/XBRL_CRT_SUP1500_01.jsp";
						
						        }
						      }
						    });
							
					}
			
					else if("bulkuploadsup1300"=='<%=request.getAttribute("Page")%>'){
						
						$("#msg").html('<%=request.getAttribute("alert")%>');
						$( "#dialog-confirm" ).dialog({
						      resizable: false,
						      height: "auto",
						      width: 400,
						      modal: true,
						      buttons: {
						        "OK": function() {
						        	$( this ).dialog( "close" );
						
						location.href="../SUP1300/XBRL_CRT_SUP1300_01.jsp";
						
						        }
						      }
						    });
							
					}
			
			
					else if("bulkuploadsup1500"=='<%=request.getAttribute("Page")%>'){
						
						$("#msg").html('<%=request.getAttribute("alert")%>');
						$( "#dialog-confirm" ).dialog({
						      resizable: false,
						      height: "auto",
						      width: 400,
						      modal: true,
						      buttons: {
						        "OK": function() {
						        	$( this ).dialog( "close" );
						
						location.href="../SUP1500/XBRL_CRT_SUP1500_01.jsp";
						
						        }
						      }
						    });
							
					}
			
					else if("bulkuploadsup1400"=='<%=request.getAttribute("Page")%>'){
						
						$("#msg").html('<%=request.getAttribute("alert")%>');
						$( "#dialog-confirm" ).dialog({
						      resizable: false,
						      height: "auto",
						      width: 400,
						      modal: true,
						      buttons: {
						        "OK": function() {
						        	$( this ).dialog( "close" );
						
						location.href="../SUP1500/XBRL_CRT_SUP1500_01.jsp";
						
						        }
						      }
						    });
							
					}
			
			
					else if("bulkuploadpsc105"=='<%=request.getAttribute("Page")%>'){
						
						$("#msg").html('<%=request.getAttribute("alert")%>');
						$( "#dialog-confirm" ).dialog({
						      resizable: false,
						      height: "auto",
						      width: 400,
						      modal: true,
						      buttons: {
						        "OK": function() {
						        	$( this ).dialog( "close" );
						
						location.href="../PSC0105/XBRL_CRT_PSC0105_01.jsp";
						
						        }
						      }
						    });
							
					}
			
					else if("bulkuploadfim800"=='<%=request.getAttribute("Page")%>'){
																
																$("#msg").html('<%=request.getAttribute("alert")%>');
																$( "#dialog-confirm" ).dialog({
																      resizable: false,
																      height: "auto",
																      width: 400,
																      modal: true,
																      buttons: {
																        "OK": function() {
																        	$( this ).dialog( "close" );
																
																location.href="../FIM0800/XBRL_CRT_FIM0800_01.jsp";
																
																        }
																      }
																    });
																	
			}else if("Logout"=='<%=request.getAttribute("Page")%>'){
				location.href="XBRLLogout.jsp";
			}
			

		}
	

	
</script>

</head>
<body onload="alertName();">
<div id="dialog-confirm" title="Alert" style="display:none">
  <p><span class="glyphicon glyphicon-alert" style="float:left; margin:0px 12px 20px 0;"></span><font id="msg"></font></p>
</div>

</body>

</html>