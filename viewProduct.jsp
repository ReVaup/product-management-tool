<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View | Products</title>
    <link href="bootstrap.min.css" rel="stylesheet">
    <style>
        .dropdown-menu {
            background-color: transparent;
            border: none;
        }

        .dropdown-item {
            color: #000; 
            text-align: center;
        }


        .dropdown-item:hover {
            color:#000000;
            background-color: rgba(0, 0, 0, 0.1); 
        }
        .dropdown-menu a {
            display: flex;
            justify-content: left;
        }
        a{
        	text-decoration:none;
        	color:black;
        }
        a:hover{
        	text-decoration:none;
        	color:blue;
        }
    </style>
</head>
<body>
    <nav class="navbar fixed-top navbar-expand-lg navbar-light p-md-3">
        <div class="container">
            <a href="home.html" class="navbar-brand text-dark">Products©</a>
            <button type="button" class="navbar-toggler" data-target="#navbarNav" data-toggle="collapse" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle Navbar">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="mx-auto"></div>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="home.html" class="nav-link text-dark">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle text-dark" id="productsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Products</a>
                        <div class="dropdown-menu" aria-labelledby="productsDropdown">
                            <a class="dropdown-item" href="Addproduct.jsp">Add Product</a>
                            <a class="dropdown-item" href="viewProduct.jsp">View Products</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="findProduct.jsp" class="nav-link text-dark">Find Product</a>
                    </li>
                    <li class="nav-item">
                        <a href="login.html" class="nav-link text-dark">Log out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <h2 style="margin-left: 450px; margin-top: 50px; font-size: 50px;">Table of Products</h2>
        <table class="table mt-5">
            <thead class="table-dark">
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Quantity</th>
                    <th>Cost</th>
                    <th>Availability</th>
                    <th>Edit option</th>
                    <th>Delete option</th>
                </tr>
            </thead>
        
<%!
	Connection con;
	Statement st;
	ResultSet rs;
%>

<%
	Class.forName("oracle.jdbc.driver.OracleDriver");

	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","varun2","manager");
   	Statement st=con.createStatement();
   	
   	String qry="select * from products order by productid asc";
   	
   	rs=st.executeQuery(qry);
   	
   	while(rs.next())
   	{
   		out.println("<tr><td>"+rs.getInt("PRODUCTID")+"</td><td>"+rs.getString("PRODUCT_NAME")+"</td><td>"+rs.getString("DESCRIPTION")+"</td><td>"+rs.getInt("QUANTITY")+"</td><td>"+rs.getInt("COST")+"</td><td>"+rs.getString("STATUS")+"</td><td><a href='editProduct.jsp?pid="+rs.getInt("productid")+"'>EDIT</a></td><td><a href='deleteProduct.jsp?pid="+rs.getInt("productid")+"'>DELETE</a></td></tr>");
   	}
   	
%>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"></script>
    
    <script>
        var nav = document.querySelector('nav');

        window.addEventListener('scroll', function(){
            if(window.pageYOffset > 100){
                nav.classList.add("bg-dark", "shadow");
            }
            else{
                nav.classList.remove('bg-dark', 'shadow');
            }
        })
    </script>
</body>
</html>