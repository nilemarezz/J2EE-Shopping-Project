/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import jpa.controller.AccountJpaController;
import jpa.controller.exceptions.RollbackFailureException;
import jpa.model.Account;

/**
 *
 * @author Nile
 */
public class ChangeProfileServlet extends HttpServlet {

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
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String province = request.getParameter("province");
        String address = request.getParameter("address");
        HttpSession session = request.getSession(false);
        AccountJpaController accountCtrl = new AccountJpaController(utx, emf);
        
        Account register;
        if (session != null) {
            register = accountCtrl.findAccount(((Account) session.getAttribute("username")).getUsername()); //Retrives account's info by a controller.
            if (register != null) {
                register.setName(name);
                register.setEmail(email);
                register.setProvice(province);
                register.setAddress(address);
                session.setAttribute("username",register);
                try {
                    accountCtrl.edit(register);
                    request.setAttribute("message", "Change Profile Complete!!");
                    
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(ChangeProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(ChangeProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                getServletContext().getRequestDispatcher("/Profile.jsp").forward(request, response);
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
