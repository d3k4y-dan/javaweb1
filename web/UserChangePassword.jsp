<%-- 
    Document   : UserChangePassword
    Created on : May 19, 2021, 5:14:33 PM
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
        
        out.println("<form method='POST' action='ChangePassword'>");
        
        outt.println("<div class='form-group'>");
        outt.println("<input class='input' type='text' value='"+ud.getUsername()+"' readonly>");
        outt.println("</div>");
        
        outt.println("<div class='form-group'>");
        outt.println("<input class='input' type='text' name='email' value='"+ud.getEmail()+"' readonly>");
        outt.println("</div>");
        
        outt.println("<div class='form-group'>");
        outt.println("<input class='input' type='password' name='pass' id='pass' placeholder='Old Password'/>");
        outt.println("</div>");
        
        outt.println("<div class='form-group'>");
        outt.println("<input class='input' type='password' name='newpass' id='pass' placeholder='New Password'/>");
        outt.println("</div>");
        
        outt.println("<div class='form-group'>");
        outt.println("<input class='input' type='password' name='renewpass' id='pass' placeholder='Re-enter New Password'/>");
        outt.println("</div>");
        
        outt.println("<div class='form-group'>");
        outt.println("<input type='submit' value='Change Password' class='primary-btn order-submit'>");
        outt.println("</div>");
        
        out.println("</form>");
    
    %>
    
    
</html>
