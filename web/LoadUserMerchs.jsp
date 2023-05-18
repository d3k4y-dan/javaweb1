<%-- 
    Document   : LoadUserMerchs
    Created on : Apr 30, 2021, 5:14:54 PM
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
    <%
        HttpSession ses = request.getSession();
        String mail = (String)ses.getAttribute("email");
        ProductModel pm=new ProductModel();
        List<Productdata> lpd = pm.getUserProducts(mail);
        PrintWriter outt = response.getWriter();
                    
        for (int idx = 0; idx < lpd.size(); idx++) {
            Productdata pd = lpd.get(idx);
            outt.println("<div class='col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat'>");
            outt.println("<div class='featured__item'>");
            Splitter sp=new Splitter();
            String[] split = sp.split(new String(pd.getImage()), "#");
            outt.println("<div class='featured__item__pic set-bg' data-setbg'"+ split[0] +"' style='background-image: url("+ split[0] +"'>");
            outt.println("<ul class='featured__item__pic__hover'>");
            
            outt.println("</ul>");
            outt.println("</div>");
            outt.println("<div class='featured__item__text'>");
            outt.println("<h6><a href='ViewUserProduct.jsp?proID="+ pd.getId() +"'>"+ pd.getId() +"</a></h6>");
            outt.println("<h6>"+ pd.getName() +"</a></h6>");
            outt.println("<h5>"+pd.getPrice()+" LKR</h5>");
            outt.println("</div>");
            outt.println("</div>");
            outt.println("</div>");
            
        }
    %>
</html>
