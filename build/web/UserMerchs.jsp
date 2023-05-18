<%-- 
    Document   : UserMerchs
    Created on : Apr 29, 2021, 3:49:40 PM
    Author     : this pc
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="ORM.Productdata"%>
<%@page import="java.util.List"%>
<%@page import="Model.ProductModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Merch Store | My Merchs</title>
        <link rel="icon" href="images/logo.png">
        <link rel="stylesheet" href="css/style1.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>
        <link rel="stylesheet" href="css/font-awesome.min.css">
        
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style2.css" type="text/css">
        
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
						<li><a href="Home.jsp">Sell your merch</a></li>
						<li><a href="BuyMerch.jsp">Buy Merchs</a></li>
						<li class="active"><a href="UserMerchs.jsp">View my Merchs</a></li>
						<li><a href="#">Posts</a></li>
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		<!-- /NAVIGATION -->
                
                
                <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>My Merchs</h2>
                    </div>
                </div>
            </div>
            <div class="row featured__filter" id="MixItUpACDC7F">
<!--                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">-->
                    
                    <jsp:include page="LoadUserMerchs.jsp"/>
                    
                <!--</div>-->
            </div>
        </div>
                
        
        <!-- jQuery Plugins -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main_1.js"></script>
                
                <script src="js/jquery-3.3.1.min.js"></script>
                <script src="js/bootstrap.min.js"></script>
                <script src="js/jquery.nice-select.min.js"></script>
                <script src="js/jquery-ui.min.js"></script>
                <script src="js/jquery.slicknav.js"></script>
                <script src="js/mixitup.min.js"></script>
                <script src="js/owl.carousel.min.js"></script>
                <script src="js/main.js"></script>
        
    </body>
</html>
