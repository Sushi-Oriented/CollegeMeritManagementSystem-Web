package programStaff;

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
public class staff_programIndex extends HttpServlet {

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
        
        try{
            /* Constant query count program*/
            String countQry = "select count(*) from program ";
            Program proIndex = new Program();
                
            /* Get count pending program*/
            String penQry = countQry + " where progStatus='Pending'";
            PreparedStatement ps2 = con.prepareStatement(penQry);
            ResultSet rs2 = ps2.executeQuery();               
                
            while(rs2.next()){                
                proIndex.setPendingCount(rs2.getString(1));
            }
                
            /* Get count approved program*/
            String appQry = countQry + " where progStatus='Approved'";
            PreparedStatement ps3 = con.prepareStatement(appQry);
            ResultSet rs3 = ps3.executeQuery();               

            while(rs3.next()){                
                proIndex.setApproveCount(rs3.getString(1));
            }
            
            /* Get count declined program*/
            String decQry = countQry + " where progStatus='Declined'";
            PreparedStatement ps4 = con.prepareStatement(decQry);
            ResultSet rs4 = ps4.executeQuery();               

            while(rs4.next()){                
                proIndex.setDeclineCount(rs4.getString(1));
            }
            
            /* Get count total program*/
            PreparedStatement ps5 = con.prepareStatement(countQry);
            ResultSet rs5 = ps5.executeQuery();               

            while(rs5.next()){                
                proIndex.setProgramCount(rs5.getString(1));
            }
            
            /* Get count Festival program*/
            String fesQry = countQry + " where progCategory='Festival'";
            PreparedStatement ps6 = con.prepareStatement(fesQry);
            ResultSet rs6 = ps6.executeQuery();               

            while(rs6.next()){                
                proIndex.setFestCount(rs6.getString(1));
            }
            
            /* Get count Workshop program*/
            String workQry = countQry + " where progCategory='Workshops'";
            PreparedStatement ps7 = con.prepareStatement(workQry);
            ResultSet rs7 = ps7.executeQuery();               

            while(rs7.next()){                
                proIndex.setWorkCount(rs7.getString(1));
            }
            
            /* Get count conferences program*/
            String confQry = countQry + " where progCategory='Conferences'";
            PreparedStatement ps8 = con.prepareStatement(confQry);
            ResultSet rs8 = ps8.executeQuery();               

            while(rs8.next()){                
                proIndex.setConfCount(rs8.getString(1));
            }
            
            /* Get count program by current year, extract(year from dateSubmit)*/
            String proCount = "Select monthname(dateSubmit), count(*) from program where year(dateSubmit) = year (curdate()) group by month(dateSubmit)"; //Get current year
            PreparedStatement ps9 = con.prepareStatement(proCount);
            ResultSet rs9 = ps9.executeQuery();
            int i=0;
            ArrayList progCount = new ArrayList<>();

            while(rs9.next()){
                String m = rs9.getString(1);
                int val = rs9.getInt(2);                

                progCount.add(val);
            }

            request.getSession().setAttribute("progCount", progCount);
            session.setAttribute("proIndex", proIndex);
            response.sendRedirect("staff_index.jsp");
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
