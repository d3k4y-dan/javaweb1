<%-- 
    Document   : ViewUserCart
    Created on : May 7, 2021, 11:34:56 PM
    Author     : this pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Merch store | Cart</title>
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
                            <center>
                                <h2 style="color: red">Merch Store</h2>	
                            </center>
			</div>
			<!-- /MAIN HEADER -->
	</header>
       
       <nav id="navigation">
			<!-- container -->
			<div class="container">
				<!-- responsive-nav -->
				<div id="responsive-nav">
					<!-- NAV -->
					<ul class="main-nav nav navbar-nav">
                                            <li><a href="Home.jsp">Home</a></li>
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
	</nav>
       
       <div class="container">
           <jsp:include page="CartData.jsp"/>
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
