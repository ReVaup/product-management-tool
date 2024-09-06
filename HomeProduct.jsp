<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%!
	Connection con;
	Statement st;
	ResultSet rs;
%>

<%
		Class.forName("oracle.jdbc.driver.OracleDriver");

		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","varun2","manager");
		st=con.createStatement();
		
		String username=request.getParameter("login");
		String password=request.getParameter("pass");
		
		String qry="select * from users where username='"+username+"' and password='"+password+"'";
		rs=st.executeQuery(qry);
		
	if(rs.next()) {
%>
	<jsp:forward page="home.html" />
	<%
	}
	else{
	%>
	<jsp:forward page="login.html" />
	<%
	}
	con.close();
	st.close();
	
	%>
	
</body>
</html>