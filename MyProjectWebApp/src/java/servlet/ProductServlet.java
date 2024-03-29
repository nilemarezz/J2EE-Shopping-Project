/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
import jpa.model.Productline;

/**
 *
 * @author Nile
 */
public class ProductServlet extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        String category = request.getParameter("name");
        ProductJpaController productJpaCtrl = new ProductJpaController(utx, emf);
        if (category.equalsIgnoreCase("All")) {
            List<Product> products = productJpaCtrl.findProductEntities();
            session.setAttribute("products", products);
            session.setAttribute("message", "ALL PRODUCT");
            getServletContext().getRequestDispatcher("/Product.jsp").forward(request, response);
            return;
        } else {
            
            List<Product> products = productJpaCtrl.findProductEntities();
            List<Product> products_add = new ArrayList<>();
            
            for (Product product1 : products) {
                if(product1.getProductline().getProductline().equals(category)){
                    products_add.add(product1);
                }
             
            }
            session.setAttribute("message", category);
             session.setAttribute("products", products_add);
             getServletContext().getRequestDispatcher("/Product.jsp").forward(request, response);


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
