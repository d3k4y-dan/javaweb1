<%-- 
    Document   : Checkout
    Created on : May 10, 2021, 11:52:51 PM
    Author     : this pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Merch store | Checkout</title>
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
        
        <script type="text/javascript">
            
            function transact(){
                
               var first_name = document.getElementById('first_name').value;
               var last_name = document.getElementById('last_name').value;
               var email = document.getElementById('email').value;
               var address = document.getElementById('address').value;
               var city = document.getElementById('city').value;
               var phone = document.getElementById('phone').value;
               var amount = document.getElementById('amount').value;
               var xhttp = new XMLHttpRequest();
               
               xhttp.onreadystatechange = function (){
                   
                   if(this.readyState == 4 && this.status == 200){
                       
                   }
                   
               }
               
               xhttp.open("POST","CashOnDelivery",true);
               xhttp.send();
               
            }
            
        </script>
        
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
        
        <div class="section">
        <div class="container">
        <div class="row">
            
            <form action="https://sandbox.payhere.lk/pay/checkout" method="POST">
            
					<div class="col-md-7">
						<!-- Billing Details -->
                                                
                                                    
                                                    <input type="hidden" name="merchant_id" value="1217304">
                                                    <input type="hidden" name="return_url" value="http://localhost:8080/MerchStore/Home.jsp">
                                                    <input type="hidden" name="cancel_url" value="http://sample.com/cancel">
                                                    <input type="hidden" name="notify_url" value="http://sample.com/notify">
                                                    
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">Billing/Shipping address</h3>
							</div>
							<div class="form-group">
                                                            <input class="input" type="text" name="first_name" id="first_name" placeholder="First Name">
							</div>
							<div class="form-group">
                                                            <input class="input" type="text" name="last_name" id="last_name" placeholder="Last Name">
							</div>
							<div class="form-group">
                                                            <input class="input" type="email" name="email" id="email" placeholder="Email">
							</div>
							<div class="form-group">
                                                            <input class="input" type="text" name="address" id="address" placeholder="Address">
							</div>
							<div class="form-group">
                                                            <input class="input" type="text" name="city" id="city" placeholder="City">
							</div>
							<div class="form-group">
                                                            <input class="input" type="tel" name="phone" id="phone" placeholder="Telephone">
							</div>
                                                    <input type="hidden" name="country" value="Sri Lanka">
                                                        <div class="form-group">
                                                            <input type="submit" value="Proceed" class="primary-btn order-submit">
                                                        </div>
						</div>
                                                
						<!-- /Billing Details -->
					</div>

					<!-- Order Details -->
					<div class="col-md-5 order-details">
						<div class="section-title text-center">
							<h3 class="title">Your Order</h3>
						</div>
						<div class="order-summary">
							<div class="order-col">
								<div><strong>PRODUCT</strong></div>
								<div><strong>TOTAL</strong></div>
							</div>
							<jsp:include page="CheckoutLoadItems.jsp"/>
						</div>
						
						<div class="input-checkbox">
							<input type="checkbox" id="terms">
							<label for="terms">
								<span></span>
								I've read and accept the <a href="#">terms &amp; conditions</a>
							</label>
						</div>
					</div>
					<!-- /Order Details -->
                                        
            </form>
				</div>
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
