<%@ page import="java.util.*,java.text.*" %>
<%@ page contentType="text/html; charset=UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags"%> 

<html>
<head>
<title>Bornfire Innovations - XBRL</title>
</head>
<frameset rows="14.2%,*" FRAMEBORDER=0 FRAMESPACING=5 BORDER=0 scrolling="no" noresize="noresize">
	<frame src="<s:url value="/jsp/XBRLHeader.jsp"/>" name="header"  SCROLLING="no" noresize="noresize"/>
	
	<frameset cols="18%,*">
		<frame src="<s:url value="/jsp/XBRLMenu.jsp"/>" name="menu" SCROLLING="yes" NORESIZE/>  
		<frame src="<s:url value="/jsp/XBRLHomePage.jsp"/>" name="body" SCROLLING="yes" NORESIZE/>
	</frameset>
</frameset>
		<script>
function myFun() {
  return "Data may be lost";
}
</script>
<body onbeforeunload="return myFun()">

</body>
</html> 