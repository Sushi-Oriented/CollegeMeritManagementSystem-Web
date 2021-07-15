/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.JDBCUtility;

/**
 *
 * @author Alifah Ilyana binti Soharto B19EC0003
 */
public class RegServlet extends HttpServlet {

    private JDBCUtility jdbcUtility;
    private Connection con;

    public void init() throws ServletException
    {
        jdbcUtility = new JDBCUtility();
        jdbcUtility.jdbcConnect();
        con = jdbcUtility.jdbcGetConnection();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String fullname = request.getParameter("fullname");
            String nickname = request.getParameter("nickname");
            String firstemail = request.getParameter("firstemail");
            String studentID = request.getParameter("studentID");
            String studphoneno = request.getParameter("studphoneno");
            String password = request.getParameter("password");
            
            String findSql = "select * from user where firstemail = ?";
            PreparedStatement ps1 = con.prepareStatement(findSql);
            ps1.setString(1, firstemail);
            ResultSet rs = ps1.executeQuery();
            
            if(rs.next()){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Your account have been registered previously.');");
                out.println("location='stud_register.jsp';");
                out.println("</script>");
            }
            
            else{
                String insSql = "insert into user(fullname, nickname, firstemail, studentID, studphoneno, password) values (?,?,?,upper(?),?,?)";
                PreparedStatement ps2 = con.prepareStatement(insSql);
                ps2.setString(1, fullname);
                ps2.setString(2, nickname);
                ps2.setString(3, firstemail);
                ps2.setString(4, studentID);
                ps2.setString(5, studphoneno);
                ps2.setString(6, password);
                ps2.executeUpdate();
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Your account have been successfully registered!');");
                out.println("location='login.jsp';");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
