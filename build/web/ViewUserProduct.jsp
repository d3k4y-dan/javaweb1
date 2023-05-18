<%-- 
    Document   : ViewUserProduct
    Created on : May 6, 2021, 5:37:15 PM
    Author     : this pc
--%>

<%@page import="Servlets.Splitter"%>
<%@page import="ORM.Productdata"%>
<%@page import="java.util.List"%>
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
					<li><a href="#"><i class="fa fa-user-o"></i> My Account</a></li>
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
                                                <center>
						<div class="col-md-3">
							<div class="header-logo">
                                                            <h2 style="color: red">Merch Store</h2>
							</div>
						</div>
                                                </center>
						<!-- /LOGO -->
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
                                
                                <jsp:include page="ViewUserProductData.jsp"/>
                                
                                <!-- /row -->
			</div>
			<!-- /container -->
		</div>
                        
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
