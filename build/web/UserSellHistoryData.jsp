<%-- 
    Document   : UserSellHistoryData
    Created on : May 20, 2021, 12:01:23 AM
    Author     : this pc
--%>

<%@page import="ORM.InvoiceProducts"%>
<%@page import="java.util.List"%>
<%@page import="Model.InvoiceProductsModel"%>
<%@page import="Model.Histories"%>
<%@page import="ORM.Userdata"%>
<%@page import="Model.Usermodel"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <%
        
        HttpSession ses2 = request.getSession();
        String mail = (String)ses2.getAttribute("email");
        PrintWriter outt = response.getWriter();
        
        Usermodel um=new Usermodel();
        Userdata ud=um.getUserData(mail);
        
        Histories h=new Histories();
        List<InvoiceProducts> lst = h.getSellHistory(mail);
        
        outt.println("<table class='table'>");
        
        outt.println("<thead>");
        outt.println("<tr>");
        outt.println("<th scope='col'>#</th>");
        outt.println("<th scope='col'>Invoice ID</th>");
        outt.println("<th scope='col'>Product Name</th>");
        outt.println("<th scope='col'>Size</th>");
        outt.println("<th scope='col'>Quantity</th>");
        outt.println("<th scope='col'>Total Price</th>");
        outt.println("</tr>");
        outt.println("</thead>");
        
        outt.println("<tbody>");
        
        for (int idx = 0; idx < lst.size(); idx++) {
            
            InvoiceProducts i = lst.get(idx);
            
            outt.println("<tr>");
        
            outt.println("<th scope='row'>"+idx+"</th>");
            outt.println("<th scope='row'>"+i.getInvoices().getId()+"</th>");
            outt.println("<th scope='row'>"+i.getProductdata().getName()+"</th>");
            outt.println("<th scope='row'>"+i.getSize()+"</th>");
            outt.println("<th scope='row'>"+i.getQty()+"</th>");
            outt.println("<th scope='row'>"+i.getPrice()+"</th>");
        
            outt.println("</tr>");
                
        }
        
        outt.println("</tbody>");
        
        outt.println("</table>");
        
    %>
    
</html>
