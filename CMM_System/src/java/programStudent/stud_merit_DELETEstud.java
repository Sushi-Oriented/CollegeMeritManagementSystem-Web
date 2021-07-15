/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package programStudent;

import bean.Merit;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
public class stud_merit_DELETEstud extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        int progid = (int) session.getAttribute("progid");
        int pk = Integer.parseInt(request.getParameter("pk"));
        String name = request.getParameter("name");
    
        try {
            String sqlInsert = "delete from merit where pk= ?";
            PreparedStatement ps = con.prepareStatement(sqlInsert);
            ps.setInt (1, pk);
            ps.executeUpdate();
        }
        catch(NumberFormatException | SQLException e){
            out.println(e);
        }
        
        try{
           String selectQry = "select * from merit where progid = ?";
            PreparedStatement ps1 = con.prepareStatement(selectQry);
            ps1.setInt(1, progid);
            ResultSet rs = ps1.executeQuery();
            Vector dm = new Vector();
            
            while(rs.next()){
                Merit dispmerit = new Merit();
                
                dispmerit.setName(rs.getString("name"));
                dispmerit.setPk(rs.getInt("pk"));
                dispmerit.setRole(rs.getString("role"));
                dispmerit.setMatricNum(rs.getString("matricNum"));
                dispmerit.setIcNum(rs.getString("icNum"));
                dispmerit.setMerit(rs.getInt("merit"));
                
                dm.addElement(dispmerit);
            }    
            
            session.setAttribute("dm", dm);
             out.println("<script type=\"text/javascript\">");
                out.println("alert('"+name+" already removed from merit list');");
                out.println("location='stud_merit_sendMerit.jsp';");
                out.println("</script>");
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
