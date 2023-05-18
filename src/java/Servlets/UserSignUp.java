/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Model.Usermodel;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author this pc
 */
public class UserSignUp extends HttpServlet {
    
    Usermodel um ;
    public UserSignUp(){
        um = new Usermodel();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String name=request.getParameter("name");
            String username=request.getParameter("username");
            String address=request.getParameter("address");
            String mobile=request.getParameter("mobile");
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
            String re_pass=request.getParameter("re_pass");
            
            Date d=new Date();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String date=sdf.format(d);
            
            if(pass.equals(re_pass)){
                
                if(!um.checkEmail(email)){
                    if(!um.checkIsUser(username)){
                        um.addUser(name, address, mobile, email, pass, username, date);
                        response.sendRedirect("index.jsp");
                    }else{
                        out.println("<script type=\"text/javascript\">");
                        out.println("location='signup.jsp';");
                        out.println("alert('Username already in use');");
                        out.println("</script>");
                    }
                }else{
                    out.println("<script type=\"text/javascript\">");
                    out.println("location='signup.jsp';");
                    out.println("alert('E-mail already in use');");
                    out.println("</script>");
                }
                
            }else{
                out.println("<script type=\"text/javascript\">");
                out.println("location='signup.jsp';");
                out.println("alert('Passwords doesn't match');");
                out.println("</script>");
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
