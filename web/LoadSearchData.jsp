<%-- 
    Document   : LoadSearchData
    Created on : May 21, 2021, 3:19:40 AM
    Author     : this pc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Servlets.Splitter"%>
<%@page import="java.util.List"%>
<%@page import="ORM.Productdata"%>
<%@page import="Model.ProductModel"%>
<%@page import="java.io.PrintWriter"%>
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
    
    <%
    
        HttpSession ses2 = request.getSession();
        String mail = (String)ses2.getAttribute("email");
        String category=request.getParameter("category");
        String search=request.getParameter("search");
        String startprice=request.getParameter("startprice");
        String endprice=request.getParameter("endprice");
        PrintWriter outt = response.getWriter();
        
        ProductModel pm=new ProductModel();
        List<Productdata> lpd= null;
        
        if(category.equals("name")){
            lpd=pm.getProductsbyName(search);
            if(!startprice.isEmpty() && !endprice.isEmpty()){
                Double d1=Double.parseDouble(startprice);
                Double d2=Double.parseDouble(endprice);
                for (int idx = 0; idx < lpd.size(); idx++) {
                        Productdata elem = lpd.get(idx);
                        Double d3=Double.parseDouble(elem.getPrice());
                        if(d1<=d3 && d3<=d2){
                        }else{
                            lpd.remove(idx);
                        }
                    }
            }
            
        }if(category.equals("brand")){
            lpd=pm.getProductsbyBrand(search);
            if(!startprice.isEmpty() && !endprice.isEmpty()){
                Double d1=Double.parseDouble(startprice);
                Double d2=Double.parseDouble(endprice);
                for (int idx = 0; idx < lpd.size(); idx++) {
                        Productdata elem = lpd.get(idx);
                        Double d3=Double.parseDouble(elem.getPrice());
                        if(d1<=d3 && d3<=d2){
                        }else{
                            lpd.remove(idx);
                        }
                    }
            }
            
        }if(category.equals("category")){
            lpd=pm.getProductsbyCategory(search);
            if(!startprice.isEmpty() && !endprice.isEmpty()){
                Double d1=Double.parseDouble(startprice);
                Double d2=Double.parseDouble(endprice);
                for (int idx = 0; idx < lpd.size(); idx++) {
                        Productdata elem = lpd.get(idx);
                        Double d3=Double.parseDouble(elem.getPrice());
                        if(d1<=d3 && d3<=d2){
                        }else{
                            lpd.remove(idx);
                        }
                    }
            }
            
        }
        
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
</html>
