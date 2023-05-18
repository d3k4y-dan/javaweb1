/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Model.CartModel;
import Model.InvoiceModel;
import Model.InvoiceProductsModel;
import Model.PaymentModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author this pc
 */
public class CashonDelivery extends HttpServlet {

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
            
            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            String city=request.getParameter("city");
            String country=request.getParameter("country");
            String tel=request.getParameter("tel");
            
            HttpSession ses = request.getSession();
            String usermail=(String)ses.getAttribute("email");
            
            System.out.println("ok");
            
            if(!firstname.isEmpty()||!lastname.isEmpty()||!email.isEmpty()||!address.isEmpty()||!city.isEmpty()||!country.isEmpty()||!tel.isEmpty()){
                
//                System.out.println("in");
                
                    
                    InvoiceModel im=new InvoiceModel();
                    Boolean r1=im.addInvoice(usermail);
//                    System.out.println(r1);
                    
                    if(r1){
                        
                        PaymentModel pm=new PaymentModel();
                        Boolean r2=pm.codPay(usermail,firstname,lastname,email,address,city,country,tel);
//                        System.out.println(r2);
                        
                        if(r2){
                            
                            InvoiceProductsModel ipm=new InvoiceProductsModel();
                            Boolean r3=ipm.addInvoiceProducts(usermail);
//                            System.out.println(r3);
                            
                            if(r3){
                                CartModel cm=new CartModel();
                                cm.deleteCartItems(usermail);
                                response.sendRedirect("Home.jsp");
                            }else{
                                out.println("<script type=\"text/javascript\">");
                                out.println("location='Checkout.jsp';");
                                out.println("alert('Please fill out all fields');");
                                out.println("</script>");
                            }
                            
                        }else{
                            out.println("<script type=\"text/javascript\">");
                            out.println("location='Checkout.jsp';");
                            out.println("alert('Please fill out all fields');");
                            out.println("</script>");
                        }
                        
                    }else{
                        out.println("<script type=\"text/javascript\">");
                        out.println("location='Checkout.jsp';");
                        out.println("alert('Please fill out all fields');");
                        out.println("</script>");
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
