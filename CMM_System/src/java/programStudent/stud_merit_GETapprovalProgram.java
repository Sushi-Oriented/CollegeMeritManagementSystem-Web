/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package programStudent;

import bean.Merit;
import bean.Program;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.JDBCUtility;

/**
 *
 * @author 60111
 */
public class stud_merit_GETapprovalProgram extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 
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
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
            String firstemail = (String)session.getAttribute("firstemail");
            int progid = Integer.parseInt(request.getParameter("progid"));
        
            session.setAttribute("progid", progid);
       try {
            
//            int progid = (int)session.getAttribute("progid");
            
            String selectQry = "select * from program where progid = ?";
            PreparedStatement ps = con.prepareStatement(selectQry);
            ps.setInt(1, progid);
            
            ResultSet rs = ps.executeQuery();
           Program detailsprogram = new Program();
            
            while(rs.next()){                
                
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
            }
            String selectQry1 = "select * from merit where progid = ?";
            PreparedStatement ps1 = con.prepareStatement(selectQry1);
            ps1.setInt(1, progid);
            ResultSet rs1 = ps1.executeQuery();
            Vector dm = new Vector();
            
            while(rs1.next()){
                Merit dispmerit = new Merit();
                
                dispmerit.setName(rs1.getString("name"));
//                dispmerit.setProgID(progid);
                dispmerit.setRole(rs1.getString("role"));
                dispmerit.setMatricNum(rs1.getString("matricNum"));
                dispmerit.setIcNum(rs1.getString("icNum"));
                dispmerit.setMerit(rs1.getInt("merit"));
                
                dm.addElement(dispmerit);
            }    
            
            session.setAttribute("dm", dm);
     
            session.setAttribute("detailsprogram", detailsprogram);
            
            response.sendRedirect("stud_merit_sendMerit.jsp");
        }
        catch(SQLException e){
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
