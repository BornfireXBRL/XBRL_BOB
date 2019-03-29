<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="action.XBRLLoginAction" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Team Manager</title>
</head>



<body>
<% //System.out.println("TEST " + request.getParameter("closeWin"));
 
if(request.getParameter("closeWin")!= null){

	XBRLLoginAction ld = new XBRLLoginAction();
	String s=ld.logoutUpdate(request.getParameter("uName")); 
	
	session.invalidate();
	//response.sendRedirect("Login.jsp?session=timeout"); 
	//response.sendRedirect("XBRLLogin.jsp?closeWin="+request.getParameter("closeWin")); 
	response.sendRedirect("XBRLLogin.jsp?session=timeout"); 

}
else{
	XBRLLoginAction ld = new XBRLLoginAction();

	String s=ld.logoutUpdate(request.getParameter("uName"));
	session.invalidate();
	response.sendRedirect("XBRLLogin.jsp?session=timeout"); 
	//response.sendRedirect("JSP/Login.jsp?session=timeout"); 
}%>
</body>
</html>