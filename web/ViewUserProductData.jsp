<%-- 
    Document   : ViewUserProductData
    Created on : May 6, 2021, 6:45:14 PM
    Author     : this pc
--%>

<%@page import="Model.ProductModel"%>
<%@page import="Servlets.Splitter"%>
<%@page import="ORM.Productdata"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            
            outt.println("<div class='row col-md-7'><br>");
            
            outt.println("<form action='EditProduct' method='POST'>");
            
            outt.println("<div class='product-details'>");
            outt.println("Product ID : <input class='input' name='proID' type='text' value='"+proID+"' readonly>");
            outt.println("</div><br>");
            
            outt.println("<div class='product-details'>");
            outt.println("Product name : <input class='input' name='name' type='text' value='"+pd.getName()+"'>");
            outt.println("</div><br>");
            
            outt.println("<div>");
            outt.println("Price : <input class='input' name='price' type='number' value='"+pd.getPrice()+"' >");
            outt.println("</div><br>");
            
            outt.println("<div style='form-group'>");
            outt.println("<h3 style='color:red'>Description ;</h3>");
            outt.println("<textarea class='input' name='description' placeholder='description'>"+pd.getDescription()+"</textarea><br>");
            outt.println("</div><br>");
            
            outt.println("<ul class='product-links'>");
            outt.println("<li>Category : <input class='input' name='category' type='text' value='"+pd.getCategory()+"'></li><br>");
            outt.println("<li>Brand : <input class='input' name='brand' type='text' value='"+pd.getBrand()+"'></li><br>");
            outt.println("<div class='form-group'>");
            outt.println("<span>Gender :-</span>");
            outt.println("<select name='gender' class='input-select'>");
            outt.println("<option value='Male'>Male</option>");
            outt.println("<option value='Female'>Female</option>");
            outt.println("<option value='Unisex'>Unisex</option>");
            outt.println("</select>");
            outt.println("</div><br>");
            outt.println("<div class='form-group'>");
            outt.println("<span>Product Status :-</span>");
            outt.println("<select name='status' class='input-select'>");
            outt.println("<option value='Available'>Available</option>");
            outt.println("<option value='Out of Stock'>Out of Stock</option>");
            outt.println("</select>");
            outt.println("</div><br>");
            outt.println("</ul>");
            
            outt.println("<button class='primary-btn order-submit'>Update Product</button><br><br>");
            outt.println("</form>");
            
            outt.println("<a href='DeleteProduct?proID="+proID+"'><button class='primary-btn order-submit'>Delete Product</button></a>");
            outt.println("</div><br>");
            
            outt.println("</div>");
        
        }
                                
    %>
</html>
