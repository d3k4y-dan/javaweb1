<%-- 
    Document   : UserBuyHistoryData
    Created on : May 23, 2021, 2:29:36 AM
    Author     : this pc
--%>

<%@page import="ORM.Invoices"%>
<%@page import="java.util.List"%>
<%@page import="Model.InvoiceModel"%>
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
        
        InvoiceModel h=new InvoiceModel();
        List<Invoices> lst = h.getUserInvoices(mail);
        
        outt.println("<table class='table'>");
        
        outt.println("<thead>");
        outt.println("<tr>");
        outt.println("<th scope='col'>Invoice ID</th>");
        outt.println("<th scope='col'>Date</th>");
        outt.println("<th scope='col'>Total Price</th>");
        outt.println("<th scope='col'>Details</th>");
        outt.println("</tr>");
        outt.println("</thead>");
        
        outt.println("<tbody>");
        
        for (int idx = 0; idx < lst.size(); idx++) {
            
            Invoices i = lst.get(idx);
            
            outt.println("<tr>");
        
            outt.println("<th scope='row'>"+i.getId()+"</th>");
            outt.println("<th scope='row'>"+i.getDate()+"</th>");
            outt.println("<th scope='row'>"+i.getTotalPrice()+"</th>");
            outt.println("<th scope='row'><a href='ViewInvoice?invoice_id="+i.getId()+"'>View</a></th>");
        
            outt.println("</tr>");
                
        }
        
        outt.println("</tbody>");
        
        outt.println("</table>");
        
    %>
</html>
