<%-- 
    Document   : CheckoutLoadItems
    Created on : May 12, 2021, 10:36:00 PM
    Author     : this pc
--%>

<%@page import="Model.InvoiceModel"%>
<%@page import="ORM.Productdata"%>
<%@page import="ORM.Cart"%>
<%@page import="java.util.List"%>
<%@page import="Model.CartModel"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%

    HttpSession ses2 = request.getSession();
    
    try {
        String un = (String)ses2.getAttribute("email");
            if(un.equals(null)){
            response.sendRedirect("index.jsp");
        }else{
                
        }
    } catch (Exception e) {
        response.sendRedirect("index.jsp");
    }
    
    String mail = (String)ses2.getAttribute("email");
    String proID=request.getParameter("proID");
    PrintWriter outt = response.getWriter();
    
    CartModel cm=new CartModel();
    List<Cart> lpd = cm.getCartItems(mail);
        
    Double grossTotal=0.0;
    
    outt.println("<div class='order-products'>");
    
    for (int idx = 0; idx < lpd.size(); idx++) {
            
            Cart cart = lpd.get(idx);
            Productdata pd=cart.getProductdata();
            
            Double price=Double.parseDouble(pd.getPrice());
            
            Double actTotal=price*cart.getQuantity();
            
            grossTotal=grossTotal+actTotal;
            
            outt.println("<div class='order-col'>");
            outt.println("<div>" + cart.getQuantity() + " X " + pd.getName() +"</div>");
            outt.println("<div>" + actTotal +"</div>");
            outt.println("</div>");
            
    }
    
    outt.println("</div>");
    
    InvoiceModel im=new InvoiceModel();
    int inv_id=im.getInvoices(mail);
    
    outt.println("<input type='hidden' name='order_id' value='"+inv_id+"'>");
    outt.println("<input type='hidden' name='items' value='item'>");
    outt.println("<input type='hidden' name='currency' value='LKR'>");
    outt.println("<input type='hidden' name='amount' id='amount' value='"+grossTotal+"'>");
    
    outt.println("<div class='order-col'>");
    outt.println("<div><strong>TOTAL</strong></div>");
    outt.println("<div><strong class='order-total'>"+grossTotal+" LKR</strong></div>");
    outt.println("</div>");

%>
</html>
