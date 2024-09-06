<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find | Products</title>
    <link href="bootstrap.min.css" rel="stylesheet">
    <style>
        body{
            background-color: 	#eed9c4;
        }
        .banner-image{
            background-image: url('images/vecteezy_cosmetic-beauty-products-containers-on-white-background_28817072_206.jpg');
            background-size: cover;
        }
        .back{
            background-color: rgba(250, 249, 246,0.6);
            border-radius: 10px;
            
        }
        .dropdown-menu {
            background-color: transparent;
            border: none;
        }

        .dropdown-item {
            color: #000; 
            text-align: center;
        }


        .dropdown-item:hover {
            color:#fff;
            background-color: rgba(0, 0, 0, 0.1); 
        }
        .dropdown-menu a {
            display: flex;
            justify-content: left;
        }
        .square{
            width: 278px;
            height: 72px;
            background-color: white;
            margin-top: 300px;
            border-radius: 25px;
            background-image: url(images/search\ symbol.png);
            background-repeat: no-repeat;
            background-size: 42px;
            background-position: 25px,0px,0px,0px;

        }
        .search{
            margin-top: 19px;
            margin-left: 75px;
            width:150px;
            background-color: transparent;
            border: transparent;
        }
        .search:active{
            background-color: transparent;
            border: transparent;
        }
        .search:focus{
            background-color: transparent;
            border: transparent;
            outline: none;
        }
        input[type="number"]::-webkit-inner-spin-button,
        input[type="number"]::-webkit-outer-spin-button{
            -webkit-appearance: none;
            margin: 0;
        }
        .searchb{
            margin-left: 290px;
            
        }
        .b1{
            margin-left: 50px;
            margin-top: 15px;
        }
        .p1{
            margin-top: 10px;
            border: transparent;
        }
        .d1{
            margin-top: 10px;
            border: transparent;
        }
        .q1{
            margin-top: 10px;
            border: transparent;
        }
        .c1{
            margin-top: 10px;
            border: transparent;
        }
        .a1{
            margin-top: 10px;
            margin-bottom: 10px;
            border: transparent;
        }
        .div2{
            margin-left: 600px;
        }
    </style>
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
	
	String qry="select * from products where productid="+request.getParameter("searchb");
	rs=st.executeQuery(qry);
	
	int productid=0,quantity=0,cost=0;
	String product_name="",Description="",status="";
	
	if(rs.next()){
		
		productid=rs.getInt("productid");
		quantity=rs.getInt("quantity");
		cost=rs.getInt("cost");
		product_name=rs.getString("product_name");
		Description=rs.getString("description");
		status=rs.getString("status");
		
	}

%>
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
    <form class="form-inline">
        <div class="square container">
            <table class="container">
                <tr>
                    <td><input type="number" name="searchb" class="search" placeholder="Product Number"></td>
                    <td class="searchb"><input type="submit" name="submit" class="btn b1" value="serach"></td>
                </tr>
            </table>
        </div>
        <div class="div2 container mt-5">
            <div class="row mb-3">
              <label class="p1 col-3">Product Name :</label>
              <div class="col">
                <input type="text" name="t1" id="text1" class="p1 form-control-sm" size="50" value="<%=product_name %>">
              </div>
            </div>
      
            <div class="row mb-3">
              <label class="col-3">Description :</label>
              <div class="col">
                <textarea class="d1 form-control-" rows="5" cols="47" name="d1" ><%= Description %></textarea>
              </div>
            </div>
      
            <div class="row mb-3">
              <label class=" q1 col-3">Quantity :</label>
              <div class="col">
                <input type="text" name="t2" id="text1" class="q1 form-control-sm" size="50" value="<%=quantity %>">
              </div>
            </div>
      
            <div class="row mb-3">
              <label class="c1 col-3">Cost :</label>
              <div class="col">
                <input type="text" name="t3" id="text1" class="c1 form-control-sm" size="50" value="<%=cost %>">
              </div>
            </div>
      
            <div class="row mb-3">
              <label class="a1 col-3">Availability :</label>
              <div class="col">
                <input type="text" name="t4" id="text1" class="a1 form-control-sm" size="50" value="<%=status %>">
              </div>
            </div>
          </div>
    </form> 
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