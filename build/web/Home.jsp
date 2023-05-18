<%-- 
    Document   : Home
    Created on : Apr 23, 2021, 9:32:26 PM
    Author     : this pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Merch store | Home</title>
        <link rel="icon" href="images/logo.png">
        <link rel="stylesheet" href="css/style1.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>
        <link rel="stylesheet" href="css/font-awesome.min.css">
    </head>
    <body>
        <header>
			<!-- TOP HEADER -->
			<div id="top-header">
				<div class="container">
                                    <ul class="header-links pull-left">
                                        <li style="color: white"><i class="fa fa-phone"></i>+94-70-102-5014</li>
					<li><a href="AboutUs.jsp"><i class="fa fa-envelope-o"></i> merchstorelanka@gmail.com</a></li>
                                    </ul>
                                    <ul class="header-links pull-right">
					<li><a href="UserAccount.jsp"><i class="fa fa-user-o"></i> My Account</a></li>
                                    </ul>
				</div>
			</div>
			<!-- /TOP HEADER -->

			<!-- MAIN HEADER -->
			<div id="header">
                            <center>
                                <h2 style="color: red">Merch Store</h2>	
                            </center>
			</div>
			<!-- /MAIN HEADER -->
		</header>
        
        <!-- NAVIGATION -->
		<nav id="navigation">
			<!-- container -->
			<div class="container">
				<!-- responsive-nav -->
				<div id="responsive-nav">
					<!-- NAV -->
					<ul class="main-nav nav navbar-nav">
						<li class="active"><a href="Home.jsp">Sell your merch</a></li>
						<li><a href="BuyMerch.jsp">Buy Merchs</a></li>
						<li><a href="UserMerchs.jsp">View my Merchs</a></li>
						<li><a href="#">Posts</a></li>
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		<!-- /NAVIGATION -->
                
                <div class="section">
			<!-- container -->
			<div class="container">
                            <form action="AddProduct" method="POST" enctype="multipart/form-data">
				<!-- row -->
				<div class="row">

					<div class="col-md-7">
                                            
						<div class="shiping-details">
							<div class="section-title">
								<h3 class="title">Add Product</h3>
							</div>
								<div class="caption">
                                                                    <div class="form-group">
									<input class="input" type="text" name="productname" placeholder="Product Name">
                                                                    </div>
                                                                    <div class="form-group">
									<input class="input" type="text" name="brandname" placeholder="Brand Name">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <span>Gender :-</span>
                                                                        <select name="gender" class="input-select">
                                                                            <option value="Male">Male</option>
                                                                            <option value="Female">Female</option>
                                                                            <option value="Unisex">Unisex</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-group">
									<input class="input" type="text" name="category" placeholder="Category">
                                                                    </div>
                                                                    <div class="form-group">
									<textarea class="input" name="description" placeholder="description"></textarea>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <input class="input" type="number" name="price" placeholder="Price in LKR">
                                                                    </div>
								</div>
						</div>
					</div>
					<div class="col-md-5 order-details">
                                            <div class="form-group">
                                                <span>Select product picture 1</span>
                                                <input type="file" accept="image/*" id="myFile" name="image1">
                                            </div>
                                            <div class="form-group">
                                                <span>Select product picture 2</span>
                                                <input type="file" accept="image/*" id="myFile" name="image2">
                                            </div>
                                            <div class="form-group">
                                                <span>Select product picture 3</span>
                                                <input type="file" accept="image/*" id="myFile" name="image3">
                                            </div>
                                            <div class="form-group">
                                                <span>Select product picture 4</span>
                                                <input type="file" accept="image/*" id="myFile" name="image4">
                                            </div>
                                            <input type="submit" class="primary-btn order-submit" value="Add Product">
					</div>
					<!-- /Order Details -->
				</div>
				<!-- /row -->
                            </form>
			</div>
			<!-- /container -->
		</div>
        
        <!-- jQuery Plugins -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main_1.js"></script>
                
        <%
            
        HttpSession ses = request.getSession();
        try {
            String un = (String)ses.getAttribute("email");
                if(un.equals(null)){
                response.sendRedirect("index.jsp");
            }else{
                
            }
        } catch (Exception e) {
             response.sendRedirect("index.jsp");
        }
        
       %>
        
    </body>
</html>
