
package programStaff;

import bean.Program;
import bean.Staff;
import bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.JDBCUtility;


public class details_programServlet extends HttpServlet {

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
        Program programView = new Program();
        try 
        {
            String progID = request.getParameter("progID");
            String selectQry = "select * from program where progID = ?";
            PreparedStatement ps = con.prepareStatement(selectQry);
            ps.setString(1, progID);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                String studFirstEmail = rs.getString("firstemail");
                String sql2 = "select * from user where firstemail = ?"; 
                PreparedStatement ps2 = con.prepareStatement(sql2);
                ps2.setString(1, studFirstEmail);
                ResultSet rs2 = ps2.executeQuery();                
                while(rs2.next()){
                    String studName = rs2.getString(1);                    
                    programView.setStudName(studName);
                }
                
                programView.setProgID(rs.getInt("progID"));
                programView.setProgName(rs.getString("progName"));
                programView.setProgLocation(rs.getString("progLocation"));
                programView.setProgStartDate(rs.getDate("progStartDate"));
                programView.setProgEndDate(rs.getDate("progEndDate"));
                programView.setProgOrganizer(rs.getString("progOrganizer"));
                programView.setProgCategory(rs.getString("progCategory"));
                programView.setProgDescription(rs.getString("progDescription"));
                programView.setProgStatus(rs.getString("progStatus"));
            }
            HttpSession session = request.getSession();
            session.setAttribute("programView", programView);
            response.sendRedirect("staff_programView.jsp");
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
