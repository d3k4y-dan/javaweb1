/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Model.Usermodel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author this pc
 */
public class ChangePassword extends HttpServlet {

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
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
            String newpass=request.getParameter("newpass");
            String renewpass=request.getParameter("renewpass");
            if(!pass.isEmpty()&&!newpass.isEmpty()&&!renewpass.isEmpty()){
                if(renewpass.equals(newpass)){
                    Usermodel um=new Usermodel();
                    String b= um.isPasswordMatching(email, pass);
                    if(b.equals(newpass)){
                        out.println("<script type=\"text/javascript\">");
                        out.println("location='UserChangePw.jsp';");
                        out.println("alert('New password cannot be old password');");
                        out.println("</script>");
                    }else{
                        boolean b1=um.changePassword(email, newpass);
                        if(b1){
                            response.sendRedirect("UserChangePw.jsp");
                        }else{
                            out.println("<script type=\"text/javascript\">");
                            out.println("location='UserChangePw.jsp';");
                            out.println("alert('Cannot change password');");
                            out.println("</script>");
                        }
                    }
                }
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
