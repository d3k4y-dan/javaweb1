<%-- 
    Document   : EditUserData
    Created on : May 18, 2021, 4:03:02 AM
    Author     : this pc
--%>

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
        
        out.println("<form method='POST' action='EditMyUserData'>");
        
        outt.println("<div class='form-group'>");
        outt.println("<input class='input' type='text' value='"+ud.getUsername()+"' readonly>");
        outt.println("</div>");
        
        outt.println("<div class='form-group'>");
        outt.println("<input class='input' type='text' name='email' value='"+ud.getEmail()+"' readonly>");
        outt.println("</div>");
        
        outt.println("<div class='form-group'>");
        outt.println("<input class='input' type='text' name='name' value='"+ud.getName()+"'>");
        outt.println("</div>");
        
        outt.println("<div class='form-group'>");
        outt.println("<input class='input' type='text' name='address' value='"+ud.getAddress()+"'>");
        outt.println("</div>");
        
        outt.println("<div class='form-group'>");
        outt.println("<input class='input' type='number' name='mobile' value='"+ud.getMobile()+"'>");
        outt.println("</div>");
        
        outt.println("<div class='form-group'>");
        outt.println("<input type='submit' value='Edit Profile' class='primary-btn order-submit'>");
        outt.println("</div>");
        
        outt.println("</form>");
    
    %>
</html>
