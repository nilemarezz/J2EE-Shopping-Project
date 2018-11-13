/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import jpa.controller.ProductJpaController;
import jpa.model.Product;
import model.ShoppingCart;

/**
 *
 * @author Nile
 */
public class MinusItemServlet extends HttpServlet {

    @PersistenceUnit(unitName = "WebApplication1PU")
    EntityManagerFactory emf;

    @Resource
    UserTransaction utx;

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
        String operator = request.getParameter("operator");
        String url = request.getParameter("url");
        HttpSession session = request.getSession();
        if (operator.equalsIgnoreCase("minus")) {
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

            ProductJpaController productJpaCtrl = new ProductJpaController(utx, emf);
            String productCode = request.getParameter("productCode");
            Product p = productJpaCtrl.findProduct(productCode);
            System.out.println(cart.getTotalQuantity());
            
            if (cart.getTotalQuantity() <= 1) {
                response.sendRedirect("ShowCart.jsp");
                return;

            }
            cart.minus(p);
            
            System.out.println(cart.getTotalQuantity());
            session.setAttribute("cart", cart);
                 getServletContext().getRequestDispatcher("/"+url).forward(request, response);

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
