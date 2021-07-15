package programStudent;

import bean.Program;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.JDBCUtility;
import loginStaff.LoginDaoStaff;

/**
 *
 * @author hafiz
 */
public class stud_programIndex extends HttpServlet {

    private LoginDaoStaff loginDao;
    private JDBCUtility jdbcUtility;
    private Connection con;
    
    public void init(){
        loginDao = new LoginDaoStaff();
        jdbcUtility = new JDBCUtility();
        jdbcUtility.jdbcConnect();
        con = jdbcUtility.jdbcGetConnection();
    }    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String firstemail = (String)session.getAttribute("firstemail");
        
        try{
            /* Constant query count program*/
            String countQry = "select count(*) from program ";
            Program studProIndex = new Program();
                
            /* Get count pending program*/
            String penQry = countQry + " where firstemail=? and progStatus='Pending'";
            PreparedStatement ps2 = con.prepareStatement(penQry);
            ps2.setString(1, firstemail);
            ResultSet rs2 = ps2.executeQuery();               
                
            while(rs2.next()){                
                studProIndex.setPendingCount(rs2.getString(1));
            }
                
            /* Get count approved program*/
            String appQry = countQry + " where firstemail=? and progStatus='Approved'";
            PreparedStatement ps3 = con.prepareStatement(appQry);
            ps3.setString(1, firstemail);
            ResultSet rs3 = ps3.executeQuery();               

            while(rs3.next()){                
                studProIndex.setApproveCount(rs3.getString(1));
            }
            
            /* Get count declined program*/
            String decQry = countQry + " where firstemail=? and progStatus='Declined'";
            PreparedStatement ps4 = con.prepareStatement(decQry);
            ps4.setString(1, firstemail);
            ResultSet rs4 = ps4.executeQuery();               

            while(rs4.next()){                
                studProIndex.setDeclineCount(rs4.getString(1));
            }
            
            /* Get count total program*/
            String totalQry = countQry + " where firstemail=?";
            PreparedStatement ps5 = con.prepareStatement(totalQry);
            ps5.setString(1, firstemail);
            ResultSet rs5 = ps5.executeQuery();               

            while(rs5.next()){                
                studProIndex.setProgramCount(rs5.getString(1));
            }

            session.setAttribute("studProIndex", studProIndex);
            response.sendRedirect("stud_index.jsp");
        }
        catch(SQLException | IOException ex){
            out.println(ex);
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
