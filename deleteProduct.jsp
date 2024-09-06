<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*" %>

<%!
	Connection con;
	Statement st;
	ResultSet rs;
%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");

	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","varun2","manager");
	Statement st=con.createStatement();
	
	String qry="delete from products where productid="+request.getParameter("pid");
	int n=st.executeUpdate(qry);
	
	if(n==0)
	{
		out.println("<script language='javascript'>window.alert('record not deleted');window.location='viewProduct.jsp';</script>");
	}
	else
	{
		out.println("<script language='javascript'>window.alert('record deleted');window.location='viewProduct.jsp';</script>");
	}
%>
</body>
</html>