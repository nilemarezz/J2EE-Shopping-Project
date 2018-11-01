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
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.mail.AuthenticationFailedException;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.RequestDispatcher;
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
        final String err = "/error.jsp";
        final String succ = "/success.jsp";
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String province = request.getParameter("province");
        
        String passwordregis = request.getParameter("password");
        passwordregis = cryptWithMD5(passwordregis);
        String address = request.getParameter("address");
        HttpSession session1 = request.getSession(false);
        AccountJpaController accountCtrl = new AccountJpaController(utx, emf);
        

        if (username != null && passwordregis != null && email != null && name != null) {
            Account account = new Account(username, passwordregis, name, email, address, province);

            try {
                accountCtrl.create(account);
                session1.setAttribute("username", account);
                

                String from = "pcmprojectz@gmail.com";
                String to = request.getParameter("email");
                String subject = "Activate Account!!";
                String message = "If your run on localhost Click this link,"+" http://localhost:8080/MyProjectWebApp/Activate?username="+account.getUsername()+"&activateKey="+account.getActivatekey() + 
                                  "\n If you run with KMUTT-Secure Click this link,"+ " http://10.5.5.157:8080/MyProjectWebApp/Activate?username="+account.getUsername()+"&activateKey="+account.getActivatekey() +
                                    "\n If you run with eduroam Click this link,"+ " http://10.5.43.91:8080/MyProjectWebApp/Activate?username="+account.getUsername()+"&activateKey="+account.getActivatekey();
                
                String login = "pcmprojectz@gmail.com";
                String password = "int303project";

                RequestDispatcher dispatcher = request.getRequestDispatcher(succ);

                try {
                    Properties props = new Properties();
                    props.setProperty("mail.host", "smtp.gmail.com");
                    props.setProperty("mail.smtp.port", "587");
                    props.setProperty("mail.smtp.auth", "true");
                    props.setProperty("mail.smtp.starttls.enable", "true");

                    Authenticator auth = new SMTPAuthenticator(login, password);

                    Session session = Session.getInstance(props, auth);

                    MimeMessage msg = new MimeMessage(session);
                    msg.setText(message);
                    msg.setSubject(subject);
                    msg.setFrom(new InternetAddress(from));
                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                    Transport.send(msg);

                } catch (AuthenticationFailedException ex) {

                    request.setAttribute("ErrorMessage", "Authentication failed");

                    dispatcher = request.getRequestDispatcher(err);

                } catch (AddressException ex) {
                    request.setAttribute("ErrorMessage", "Wrong email address");

                    dispatcher = request.getRequestDispatcher(err);

                } catch (MessagingException ex) {
                    request.setAttribute("ErrorMessage", ex.getMessage());

                    dispatcher = request.getRequestDispatcher(err);
                }

                

                
                getServletContext().getRequestDispatcher("/Activate.jsp").forward(request, response);

            } catch (Exception ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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

    private class SMTPAuthenticator extends Authenticator {

        private PasswordAuthentication authentication;

        public SMTPAuthenticator(String login, String password) {
            authentication = new PasswordAuthentication(login, password);
        }

        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return authentication;
        }
    }

}
