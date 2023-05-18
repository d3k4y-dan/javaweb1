<%-- 
    Document   : UserBuyHistory
    Created on : May 10, 2021, 1:33:36 AM
    Author     : this pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Merch store | Buy History</title>
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
					<li><a href="Home.jsp"><i class="fa fa-user-o"></i>Home</a></li>
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
						<li><a href="UserAccount.jsp">Edit Profile</a></li>
						<li><a href="UserChangePw.jsp">Change Password</a></li>
						<li><a href="UserSellHistory.jsp">Sell History</a></li>
						<li class="active"><a href="UserBuyHistory.jsp">Buy History</a></li>
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		<!-- /NAVIGATION -->
                
                <div class="section">
                    <div class="container">
                        <div class="row">
					<div class="col-md-7">
						<div class="shiping-details">
							<div class="section-title">
								<h3 class="title">My buy history</h3>
							</div>
                                                    <div class="row">
                                                    <jsp:include page="UserBuyHistoryData.jsp"/>
                                                    </div>
                                                </div>
                                        </div>
                        </div>
                    </div>
                </div>
                
    </body>
</html>
