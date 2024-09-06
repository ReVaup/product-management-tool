<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>

<%! 
	Connection con;
	Statement st;
	ResultSet rs;
%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");

	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","varun2","manager");
	Statement st=con.createStatement();
	
	String qry = "update products set product_name='"+request.getParameter("pname")+"',description='"+request.getParameter("textarea")+"',quantity="+request.getParameter("quantity")+",cost="+request.getParameter("cost")+",status='"+request.getParameter("status")+"' where productid="+request.getParameter("pid");

	int n=st.executeUpdate(qry);
	
	if(n==0)
	{
		out.println("<script>window.alert('Record not updated');window.location='viewProduct.jsp';</script>");
	}
	else
	{
		out.println("<script>window.alert('Record updated');window.location='viewProduct.jsp';</script>");
	}
%>

</body>
</html>