<%-- 
    Document   : ViewProduct
    Created on : May 1, 2021, 11:33:35 PM
    Author     : this pc
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Merch Store | Product view</title>
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
        String un = (String)ses.getAttribute("email");
        try {
            
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

						<!-- ACCOUNT -->
							<div class="header-ctn">
								
                                                            <div class="dropdown">
                                                                <a href="ViewUserCart.jsp" style="margin-left: 5%">
									<i class="fa fa-shopping-cart"></i>
									<span>Your Cart</span>
								</a>
                                                            </div>

							</div>
						<!-- /ACCOUNT -->
					</div>
					<!-- row -->
				</div>
				<!-- container -->
			</div>
			<!-- /MAIN HEADER -->
                        
                        <div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
                                
                                <jsp:include page="VIewProductData.jsp"/>
                                
                                <!-- /row -->
			</div>
			<!-- /container -->
                        
                        <br>
                        
                        <center>
                            <h2>Reviews</h2>
                        </center>
                        
                        <div class="col-md-12">
                            <div id="product-tab">
                                <div class="col-md-3">
											<div id="rating">
												<div class="rating-avg">
													
												</div>
												<ul class="rating">
													
												</ul>
											</div>
										</div>
                        <div class="col-md-6">
											<div id="reviews">
												<ul class="reviews">
													<li>
														<div class="review-heading">
															<h5 class="name">John</h5>
															<p class="date">27 DEC 2018, 8:0 PM</p>
														</div>
														<div class="review-body">
															<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
														</div>
													</li>
												</ul>
											</div>
										</div>
                                <div class="col-md-3">
											<div id="review-form">
                                                                                            <form class="review-form" action="AddReview" method="GET">
                                                                                                    <input class="input" type="email" name="email" value="<%=un%>" readonly="">
													<textarea class="input" name="review" placeholder="Your Review"></textarea>
													<button class="primary-btn">Submit</button>
												</form>
											</div>
										</div>
                        
		</div>
		</div>
                <br>
                        
	</header>
       
       
       <!-- jQuery Plugins -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main_1.js"></script>
       
    </body>
</html>
