<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add products</title>
</head>
<body>

<%!
	Connection con;
	Statement st;
	ResultSet rs;
%>
<%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","varun2","manager");
	Statement st=con.createStatement();
	
	String pid=request.getParameter("pid");
	String pname=request.getParameter("pname");
	String des=request.getParameter("textarea");
	String quan=request.getParameter("quantity");
	String cost=request.getParameter("cost");
	String stat=request.getParameter("status");
	
	String qry="insert into products values("+pid+",'"+pname+"','"+des+"',"+quan+","+cost+",'"+stat+"')";
	
	int n=st.executeUpdate(qry);
	
	if(n==0)
	{
		response.sendRedirect("Addproduct.jsp?x=0");
	}
	else
	{
		response.sendRedirect("Addproduct.jsp?x=1");
	}
	st.close();
	con.close();
	
	
}
catch(Exception e)
{
	out.println("Error: "+e);
}
	
%>

</body>
</html>