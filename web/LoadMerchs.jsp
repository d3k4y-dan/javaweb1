<%-- 
    Document   : LoadMerchs
    Created on : Apr 30, 2021, 10:35:56 PM
    Author     : this pc
--%>

<%@page import="Servlets.Splitter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="ORM.Productdata"%>
<%@page import="java.util.List"%>
<%@page import="Model.ProductModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        String mail = (String)ses.getAttribute("email");
        ProductModel pm=new ProductModel();
        List<Productdata> lpd = pm.getProducts();
        PrintWriter outt = response.getWriter();
                    
        for (int idx = 0; idx < lpd.size(); idx++) {
            Productdata pd = lpd.get(idx);
            outt.println("<div class='col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat'>");
            outt.println("<div class='featured__item'>");
            Splitter sp=new Splitter();
            String[] split = sp.split(new String(pd.getImage()), "#");
            outt.println("<div class='featured__item__pic set-bg' data-setbg'"+ split[0] +"' style='background-image: url("+ split[0] +"'>");
            outt.println("<ul class='featured__item__pic__hover'>");
            outt.println("<li><a href='ViewProduct.jsp?proID="+ pd.getId() +"'><i class='fa fa-shopping-cart'></i></a></li>");
            outt.println("</ul>");
            outt.println("</div>");
            outt.println("<div class='featured__item__text'>");
            outt.println("<h6><a href='ViewProduct.jsp?proID="+ pd.getId() +"'>"+ pd.getId()+"</a></h6>");
            outt.println("<h6>"+ pd.getName() +"</a></h6>");
            outt.println("<h5>"+pd.getPrice()+" LKR</h5>");
            outt.println("</div>");
            outt.println("</div>");
            outt.println("</div>");
        }
    %>

    
    </body>
</html>
