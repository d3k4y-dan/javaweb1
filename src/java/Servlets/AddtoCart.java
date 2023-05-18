/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Model.CartModel;
import Model.ProductModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author this pc
 */
public class AddtoCart extends HttpServlet {

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
            
            HttpSession ses = request.getSession();
            String umail=(String)ses.getAttribute("email");
            
            String proID=request.getParameter("proID");
            String size=request.getParameter("size");
            String quantity=request.getParameter("quantity");
            
            if(umail.isEmpty()){
                
                out.println("<script type=\"text/javascript\">");
                out.println("location='index.jsp';");
                out.println("alert('User timeout, relogin');");
                out.println("</script>");
                
            }else{
                
                if(proID.isEmpty() || quantity.isEmpty()){
                
                out.println("<script type=\"text/javascript\">");
                out.println("location='VIewProductData.jsp?proID="+proID+"';");
                out.println("alert('Fill all fields first');");
                out.println("</script>");
                
            }else{
                
                CartModel cm=new CartModel();
                Boolean result=cm.addToCart(umail, proID, quantity, size);
                if(result){
                    response.sendRedirect("BuyMerch.jsp");
                }else{
                    out.println("<script type=\"text/javascript\">");
                    out.println("location='ViewProduct.jsp';");
                    out.println("alert('Cannot add to the cart');");
                    out.println("</script>");
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
