<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Add | Products</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="style1.css">
    <style>
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

    <div style='height: 100vh;' class="banner-image w-100 vh-100 d-flex justify-content-center align-items-center">
        <div class="container mt-5 back">
            <form method="post" name="f2" action="addproducts_code.jsp">
                <div class="mt-2 row mx-2">
                    <label>Product ID</label>
                    <input type="number" name="pid" id="n" class="form-control">
                </div>
                <div class="mt-2 row mx-2">
                    <lable>Product Name</lable>
                    <input type="text" name="pname" id="en" class="form-control">
                </div>
                <div class="row mt-2 mx-2">
                    <label>Description</label>
                    <textarea rows="4" id="d" class="form-control" name="textarea"></textarea>
                </div>
                <div class="mt-2 row mx-2">
                    <lable>Quantity</lable>
                    <input type="number" name="quantity" class="form-control">
                </div>
                <div class="mt-2 row mx-2">
                    <lable>Cost</lable>
                    <input type="number" name="cost" class="form-control">
                </div>
                <div class="row mt-2 mx-2">
                    <label>Availability : &nbsp</label>
                    <select class="form-select" name="status">
                        <option>--Select Availability--</option>
                        <option>Available</option>
                        <option>Unavailable</option>
                    </select>
                </div>
                <div class="mt-5 text-center mb-2"> 
                        <input type="submit" class="btn btn-success me-5 " value="Submit" name="submit" onclick="pop()"> 
                        <input type="reset" class="btn btn-danger mx-5" name="reset">
                </div>
            </form>
        </div>
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
	<%
    if(request.getAttribute("x") != null)
    {
        int x = (int) request.getAttribute("x");
        if(x == 0)
        {
%>
            <script>
                function pop() {
                    alert("Product not added");
                }
            </script>
<%
        }
        else
        {
%>
            <script>
                function pop() {
                    alert("Product added");
                }
            </script>
<%
        }
    }
%>

</body>
</html>