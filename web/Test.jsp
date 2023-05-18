<%-- 
    Document   : Test
    Created on : May 3, 2021, 12:40:18 AM
    Author     : this pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap image slider</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
<script type="text/javascript" src="engine1/jquery.js"></script>
</head>
<body>
<div class="container-fluid">
            <div class="row">
                <div class="col-sm-6 col-2 fixed-top one" style="width: 30%">
                    <div class="row">
                        <a href="images/signin-image.jpg"><img src="images/signin-image.jpg" alt="Girl in a jacket" width="500" height="600"></a>
                        
                    </div>
                    <div class="row">
                        <img src="images/signin-image.jpg" alt="Girl in a jacket" width="500" height="600">
                    </div>
                    <div class="row">
                        <img src="images/signin-image.jpg" alt="Girl in a jacket" width="500" height="600">
                    </div>
                </div>
                <div class="col-sm-6 col-2 fixed-top one">
                    <img src="images/signup-image.jpg" alt="Girl in a jacket" width="500" height="600">
                </div>
            </div>
</div>
    
    <div class="product-details">
        <h2 class="product-name" style="background-color: gray">product name goes here</h2>
							<div>
								<div class="product-rating">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star-o"></i>
								</div>
								<a class="review-link" href="#">10 Review(s) | Add your review</a>
							</div>
							<div>
								<h3 class="product-price">$980.00</h3>
								<span class="product-available">In Stock</span>
							</div>
                                                        <p style="outline-color: red; outline-width: 1px; outline: solid; padding: 3%">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

							<div class="product-options">
								<label>
									Size
									<select class="input-select">
										<option value="0">X</option>
									</select>
								</label>
								<label>
									Color
									<select class="input-select">
										<option value="0">Red</option>
									</select>
								</label>
							</div>

							<div class="add-to-cart">
								<div class="qty-label">
									Qty
									<div class="input-number">
                                                                            <input width="" type="number">
										<span class="qty-up">+</span>
										<span class="qty-down">-</span>
									</div>
								</div>
								<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
							</div>

							<ul class="product-btns">
								<li><a href="#"><i class="fa fa-heart-o"></i> add to wishlist</a></li>
							</ul>

							<ul class="product-links">
								<li>Category:</li>
								<li><a href="#">Headphones</a></li>
								<li><a href="#">Accessories</a></li>
							</ul>

							<ul class="product-links">
								<li>Share:</li>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
								<li><a href="#"><i class="fa fa-envelope"></i></a></li>
							</ul>

						</div>
    
    <form action="AddtoCart" method="GET">
        
    </form>
    
</body>
</html>
