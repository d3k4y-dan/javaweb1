<%-- 
    Document   : BuyMerch
    Created on : Apr 25, 2021, 7:37:33 PM
    Author     : this pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Merch store | Buy</title>
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
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<!-- LOGO -->
						<div class="col-md-3">
							<div class="header-logo">
                                                            <h2 style="color: red">Merch Store</h2>
							</div>
						</div>
						<!-- /LOGO -->

						<!-- SEARCH BAR -->
						<div class="col-md-6">
							<div class="header-search">
                                                            <form method="GET" action="SearchResults.jsp">
                                                                <select name="category" class="input-select">
										<option value="name">Merch Name</option>
                                                                            <option value="brand">Merch Brand</option>
                                                                            <option value="category">Merch Category</option>
                                                                        </select>
									<input class="input" name="search" placeholder="Search here">
                                                                        <button class="search-btn">Search</button>
                                                                        
                                                                        <div class="price-filter">
                                                                    <div class="input-number price-min">
                                                                        <input name="startprice" placeholder="Min price" id="price-min" type="number">
									<span class="qty-up">+</span>
									<span class="qty-down">-</span>
                                                                    </div>
                                                                    <span>-</span>
                                                                    <div class="input-number price-max">
                                                                        <input name="endprice" placeholder="Max price" id="price-max" type="number">
									<span class="qty-up">+</span>
									<span class="qty-down">-</span>
                                                                    </div>
                                                        </div>
                                                                        
								</form>
							</div>
						</div>
						<!-- /SEARCH BAR -->

						<!-- ACCOUNT -->
						<div class="col-md-3 clearfix">
							<div class="header-ctn">
								
                                                            <div class="dropdown">
                                                                <a href="ViewUserCart.jsp" class="dropdown-toggle">
										<i class="fa fa-shopping-cart"></i>
										<span>Your Cart</span>
									</a>
								</div>

							</div>
						</div>
						<!-- /ACCOUNT -->
					</div>
					<!-- row -->
				</div>
				<!-- container -->
			</div>
			<!-- /MAIN HEADER -->
                        
                        <!-- NAVIGATION -->
		<nav id="navigation">
			<!-- container -->
			<div class="container">
				<!-- responsive-nav -->
				<div id="responsive-nav">
					<!-- NAV -->
					<ul class="main-nav nav navbar-nav">
						<li><a href="Home.jsp">Sell your merch</a></li>
						<li class="active"><a href="BuyMerch.jsp">Buy Merchs</a></li>
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
                        
        </header>
        
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>The Merch Store</h2>
                    </div>
                </div>
            </div>
            <div class="row featured__filter" id="MixItUpACDC7F">
                <jsp:include page="LoadMerchs.jsp"/>
            </div>
        </div>
        
        <!-- jQuery Plugins -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main_1.js"></script>
        
    </body>
</html>
