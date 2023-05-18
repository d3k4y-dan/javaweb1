<%-- 
    Document   : VIewProductData
    Created on : May 2, 2021, 9:08:10 PM
    Author     : this pc
--%>

<%@page import="Servlets.Splitter"%>
<%@page import="ORM.Productdata"%>
<%@page import="java.util.List"%>
<%@page import="Model.ProductModel"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <link rel="stylesheet" href="css/style1.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>
        <link rel="stylesheet" href="css/font-awesome.min.css">
    
    <%
                                    
        HttpSession ses2 = request.getSession();
        String mail = (String)ses2.getAttribute("email");
        String proID=request.getParameter("proID");
        PrintWriter outt = response.getWriter();
//        outt.println(proID);

        ProductModel pm=new ProductModel();
        List<Productdata> lpd = pm.getSelectedProduct(proID);
        
        for (int idx = 0; idx < lpd.size(); idx++) {
        
            Productdata pd = lpd.get(idx);
            
            Splitter sp=new Splitter();
            String[] split = sp.split(new String(pd.getImage()), "#");
            
            String image1=split[0];
            String image2=split[1];
            String image3=split[2];
            String image4=split[3];
            
            outt.println("<div class='container-fluid'>");
            outt.println("<div class='row'>");
            outt.println("<div class='col-sm-6 col-2 fixed-top one' style='width: 50%'>");
            outt.println("<div class='row'><a href='"+ image2 +"'><img src='"+ image2 +"' width='100%'></a></div>");
            outt.println("<div class='row'><a href='"+ image3 +"'><img src='"+ image3 +"' width='100%'></a></div>");
            outt.println("</div>");
            outt.println("<div class='col-sm-6 col-2 fixed-top one' style='width: 50%'>");
            outt.println("<div class='row'><a href='"+ image4 +"'><img src='"+ image4 +"' width='100%'></a></div>");
            outt.println("<div class='row'><a href='"+ image1 +"'><img src='"+ image1 +"' width='100%'></a></div>");
            outt.println("</div>");
            outt.println("</div>");
            outt.println("</div>");
            
            outt.println("<center>");
            
            outt.println("<div class='row'><br>");
            
            outt.println("<form action='AddtoCart' method='GET'>");
            
            outt.println("<div class='product-details'>");
            outt.println("Product ID : <input name='proID' type='text' value='"+proID+"' readonly>");
            outt.println("</div>");
            
            outt.println("<div class='product-details'>");
            outt.println("<h2 style='color : red' class='product-name'>Product name : "+pd.getName()+"</h2>");
            outt.println("</div>");
            
            outt.println("<div>");
            outt.println("<h3 class='product-price'>Price : "+pd.getPrice()+" LKR</h3>");
            outt.println("<span class='product-available' style='color:red'>"+pd.getStatus()+"</span>");
            outt.println("</div><br>");
            
            outt.println("<div style='outline: solid; outline-color: red; outline-width: 1px; padding: 2px'>");
            outt.println("<h3 style='color:red'>Description ;</h3>");
            outt.println("<p>"+pd.getDescription()+"</p><br>");
            outt.println("</div><br>");
            
            outt.println("<div class='product-options'>");
            
            outt.println("<label>");
            outt.println("Size : ");
            outt.println("<select name='size' class='input-select'>");
            outt.println("<option value='S'>S</option>");
            outt.println("<option value='M'>M</option>");
            outt.println("<option value='L'>L</option>");
            outt.println("<option value='XL'>XL</option>");
            outt.println("<option value='XXL'>XXL</option>");
            outt.println("</select>");
            outt.println("</label>");
            
            outt.println("</div><br>");
            
            outt.println("<div class='add-to-cart'><div class='qty-label'>");
            outt.println("QTY : ");
            outt.println("<input placeholder='Enter quantity' name='quantity' type='number'>");
            outt.println("<br><br>");
            
            outt.println("<button class='primary-btn order-submit'><i class='fa fa-shopping-cart'></i> Add to cart</button>");
            outt.println("</div><br>");
            
            outt.println("<ul class='product-links'>");
            outt.println("<li>Category :"+pd.getCategory()+"</li>");
            outt.println("<li>Brand :"+pd.getBrand()+"</li>");
            outt.println("<li>Gender :"+pd.getGender()+"</li>");
            outt.println("</ul>");
            
            outt.println("</form>");
            
            outt.println("</div>");
            
            outt.println("</center>");
        
        }
                                
    %>
    <script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main_1.js"></script>
</html>
