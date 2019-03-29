<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="dao.LoginDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Team Manager</title>
</head>



<body>
<% 
 System.out.println("ddd"+request.getParameter("userName"));
 if(request.getParameter("autoClose")!= null){

	 LoginDao ld = new LoginDao();
	String s=ld.logoutUpdate(request.getParameter("userName")); 
	session.invalidate();
	response.sendRedirect("XBRLLogin.jsp"); 

}
%>
</body>
</html>