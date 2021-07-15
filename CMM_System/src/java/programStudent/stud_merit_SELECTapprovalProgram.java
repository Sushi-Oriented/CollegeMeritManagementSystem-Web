/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package programStudent;

import bean.Program;
import bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 60111
 */
public class stud_merit_SELECTapprovalProgram extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    String driver = "com.mysql.jdbc.Driver";
    String dbName = "cmmsdb";
    String url = "jdbc:mysql://localhost/" + dbName + "?";
    String username = "root";
    String password = "";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        
        
       try {
            HttpSession session = request.getSession();
            String firstemail = (String)session.getAttribute("firstemail");
            
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, username, password);
            String selectQry = "select * from program where firstemail = ? and progStatus = ? and meritStatus = ?";
            PreparedStatement ps = con.prepareStatement(selectQry);
            ps.setString(1, firstemail);
            ps.setString(2, "Approved");
            ps.setString(3, "No action");
            
            ResultSet rs = ps.executeQuery();
            Vector dp = new Vector();
            Program id = new Program();
            while(rs.next()){                
                
                Program detailsprogram = new Program();
                   
                detailsprogram.setFirstEmail(rs.getString("firstemail"));
                detailsprogram.setProgID(rs.getInt("progid"));
                detailsprogram.setProgCategory(rs.getString("progCategory"));
                detailsprogram.setProgDescription(rs.getString("progDescription"));
                detailsprogram.setProgEndDate(rs.getDate("progEndDate"));
                detailsprogram.setProgLocation(rs.getString("progLocation"));
                detailsprogram.setProgName(rs.getString("progName"));
                detailsprogram.setProgOrganizer(rs.getString("ProgOrganizer"));
                detailsprogram.setProgStartDate(rs.getDate("progStartDate"));
                detailsprogram.setProgStatus(rs.getString("progStatus"));
                
                dp.addElement(detailsprogram);
            }
            
            session.setAttribute("dp", dp);
            
            response.sendRedirect("stud_merit_approvalProgram.jsp");
        }
        catch(ClassNotFoundException | SQLException e){
            out.println(e);
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
