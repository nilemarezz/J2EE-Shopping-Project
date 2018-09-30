/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
import jpa.model.Account;

/**
 *
 * @author Nile
 */
public class RegisterServlet extends HttpServlet {
     @PersistenceUnit(unitName ="WebApplication1PU")
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
      String password  = request.getParameter("password");
      password = cryptWithMD5(password);
      String address = request.getParameter("address");
      Account register = new Account(username, password, name, email, address);
      AccountJpaController accountCtrl = new AccountJpaController(utx, emf);
      
         if(username != null && password != null && email !=null && name != null){
             
             try{
                 accountCtrl.create(register);
                 request.setAttribute("username", register);
                 request.setAttribute("messageregister", "You successful Register,Please Login to continue!!");
                 getServletContext().getRequestDispatcher("/Activate.jsp").forward(request, response);
                 
                } catch(Exception ex){
                 Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE,null,ex);
                 request.setAttribute("message", "Username or Email already exist, Try Again!!");
                 getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
                 
             }
             
             
             getServletContext().getRequestDispatcher("/view/state/landing.html").forward(request, response);
             
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
    
        public static String cryptWithMD5(String pass) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] passBytes = pass.getBytes();
            md.reset();
            byte[] digested = md.digest(passBytes);
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < digested.length; i++) {
                sb.append(Integer.toHexString(0xff & digested[i]));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            System.out.println(ex);
        }
        return null;
    }


}
