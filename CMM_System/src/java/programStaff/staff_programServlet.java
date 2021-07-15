
package programStaff;

import bean.Availability;
import bean.Program;
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

public class staff_programServlet extends HttpServlet {

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
        try {
            HttpSession session = request.getSession();
            
            //Display available status
            String sql2 = "select * from progavailable";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ResultSet rs2 = ps2.executeQuery();
            Availability status = new Availability();
            while(rs2.next()){
                
                status.setStatus(rs2.getString("status"));
            }
            
            session.setAttribute("status", status);
            
            //display program table
            String sql = "select * from program where progStatus='Pending'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            Vector progList = new Vector();
            
            while (rs.next()) 
            {   
                Program program = new Program();
                program.setProgID(rs.getInt("progID"));
                program.setProgName(rs.getString("progName"));
                program.setProgLocation(rs.getString("progLocation"));
                program.setProgStartDate(rs.getDate("progStartDate"));
                program.setProgEndDate(rs.getDate("progEndDate"));
                program.setProgOrganizer(rs.getString("progOrganizer"));
                program.setProgCategory(rs.getString("progCategory"));
                program.setProgDescription(rs.getString("progDescription"));
                program.setProgStatus(rs.getString("progStatus"));

                progList.addElement(program);
            }
            
            session.setAttribute("progList", progList);
            response.sendRedirect("staff_program.jsp");
        }
        catch (SQLException | IOException e){
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
