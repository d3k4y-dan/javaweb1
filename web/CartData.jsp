<%-- 
    Document   : CartData
    Created on : May 8, 2021, 12:51:35 AM
    Author     : this pc
--%>

<%@page import="ORM.Productdata"%>
<%@page import="java.util.List"%>
<%@page import="ORM.Cart"%>
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
        PrintWriter outt = response.getWriter();
        
        CartModel cm=new CartModel();
        List<Cart> lpd = cm.getCartItems(mail);
        
        Double grossTotal=0.0;
        
        outt.println("<div>");
        
        outt.println("<table class='table'>");
        
        outt.println("<thead>");
        outt.println("<tr>");
            
        outt.println("<th scope='col'><span>No.</span></th>");
        outt.println("<th scope='col'><span>Product ID</span></th>");
        outt.println("<th scope='col'><span>Product Name</span></th>");
        outt.println("<th scope='col'><span>Size</span></th>");
        outt.println("<th scope='col'><span>Quantity</span></th>");
        outt.println("<th scope='col'><span>Total</span></th>");
            
        outt.println("</tr>");
        outt.println("</thead>");
        
        outt.println("<tbody>");
        
        for (int idx = 0; idx < lpd.size(); idx++) {
            
            Cart cart = lpd.get(idx);
            Productdata pd=cart.getProductdata();
            
            Double price=Double.parseDouble(pd.getPrice());
            Double actTotal=price*cart.getQuantity();
            grossTotal=grossTotal+actTotal;
        
            outt.println("<tr>");
            
            outt.println("<th scope='row'><span>"+idx+"</span></td>");
            outt.println("<th scope='row'><span>"+pd.getId()+"</span></td>");
            outt.println("<th scope='row'><span>"+pd.getName()+"</span></td>");
            outt.println("<th scope='row'><span>"+cart.getSize()+"</span></td>");
            outt.println("<th scope='row'><span>"+cart.getQuantity()+"</span></td>");
            outt.println("<th scope='row'><span>"+actTotal+"</span></td>");
            outt.println("<th scope='row'><span><a href='RemoveCartItem?cartItemID="+cart.getId()+"'>Remove</a></span></td>");
            
            outt.println("</tr>");
            
        }
        
        outt.println("<tr>");
            
        outt.println("<th scope='row'><span> </span></td>");
        outt.println("<th scope='row'><span> </span></td>");
        outt.println("<th scope='row'><span> </span></td>");
        outt.println("<th scope='row'><span> </span></td>");
        outt.println("<th scope='row'><span>Gross Total = </span></td>");
        outt.println("<th scope='row'><span>"+grossTotal+"</span></td>");
            
        outt.println("</tr>");
        
        outt.println("</tbody>");
        
        outt.println("</table>");
        
        outt.println("<a href='Checkout.jsp' class='primary-btn order-submit'>Proceed to checkout</a>");
        
        outt.println("</div>");

    %>
</html>
