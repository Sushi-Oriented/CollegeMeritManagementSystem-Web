/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package programStudent;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.JDBCUtility;

/**
 *
 * @author User
 */
public class stud_programServlet extends HttpServlet {
    
    private JDBCUtility jdbcUtility;
    private Connection con;

    public void init() throws ServletException
    {
        jdbcUtility = new JDBCUtility();
        jdbcUtility.jdbcConnect();
        con = jdbcUtility.jdbcGetConnection();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String firstemail = (String) session.getAttribute("firstemail");
        PrintWriter out = response.getWriter();
        String progName = request.getParameter("progName");
        String progLocation = request.getParameter("progLocation");
        String progStartDate = request.getParameter("progStartDate");
        String progEndDate = request.getParameter("progEndDate");
        String progOrganizer = request.getParameter("progOrganizer");
        String progCategory = request.getParameter("progCategory");
        String progDescription = request.getParameter("progDescription");
        String progStatus = "Pending";
        String meritStatus = "No action";
        
        
        try {
            String sqlInsert = "INSERT INTO program(firstemail, progName, progLocation, progStartDate, progEndDate, progOrganizer, progCategory, progDescription, progStatus, meritStatus) VALUES (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sqlInsert);
            ps.setString (1, firstemail);
            ps.setString (2, progName);
            ps.setString (3, progLocation);
            ps.setString (4, progStartDate);
            ps.setString (5, progEndDate);
            ps.setString (6, progOrganizer);
            ps.setString (7, progCategory);
            ps.setString (8, progDescription);
            ps.setString (9, progStatus);
            ps.setString (10, meritStatus);
            ps.executeUpdate();
            
           
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Your program is submitted successfully!');");
            out.println("location='stud_programIndex';");
            out.println("</script>");
        }
        
        catch(SQLException ex){
            out.print(ex);
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
