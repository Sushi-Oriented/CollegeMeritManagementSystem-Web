package programStaff;

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
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author mhafizkn
 */
public class staff_programHistory extends HttpServlet {

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
            
            String sql = "select * from program where progStatus='Approved' or progStatus='Declined'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            //Vector progList = new Vector();
            int i=0;
            JSONArray jArray = new JSONArray();
            
            while (rs.next()) 
            {   
                //Program program = new Program();
                JSONObject arrayObj = new JSONObject();
                
                /*To get name of student*/
                String studFirstEmail = rs.getString("firstemail");
                //User stud = new User();
                String sql2 = "select * from user where firstemail = ?"; 
                PreparedStatement ps2 = con.prepareStatement(sql2);
                ps2.setString(1, studFirstEmail);
                ResultSet rs2 = ps2.executeQuery();                
                
                while(rs2.next()){
                    String studName = rs2.getString(1);                    
                    //program.setStudName(studName);
                    arrayObj.put("studName",studName);
                }
                
//                program.setFirstEmail2(rs.getString("firstemail"));
//                program.setProgID(rs.getInt("progID"));
//                program.setProgName(rs.getString("progName"));
//                program.setProgLocation(rs.getString("progLocation"));
//                program.setProgStartDate(rs.getDate("progStartDate"));
//                program.setProgEndDate(rs.getDate("progEndDate"));
//                program.setProgOrganizer(rs.getString("progOrganizer"));
//                program.setProgCategory(rs.getString("progCategory"));
//                program.setProgDescription(rs.getString("progDescription"));
//                program.setProgStatus(rs.getString("progStatus"));        
//                program.setMeritStatus(rs.getString("meritStatus")); 
//                
//                progList.addElement(program);
                
                String progID = rs.getString("progID");
                String progName = rs.getString("progName");
                String progCategory = rs.getString("progCategory");
                String progOrganizer = rs.getString("progOrganizer");
                String progStatus = rs.getString("progStatus");
                String meritStatus = rs.getString("meritStatus");

                int x = i+1;
                arrayObj.put("Bil",x);
                arrayObj.put("progID", progID);
                arrayObj.put("ProgramName",progName);
                arrayObj.put("Category",progCategory);
                arrayObj.put("Organizer",progOrganizer);
                arrayObj.put("ProgramStatus",progStatus);
                arrayObj.put("MeritStatus",meritStatus);
                x++;
                
                jArray.put(i,arrayObj);
                i++;
            }   
            
            session.setAttribute("jArray", jArray);
            //session.setAttribute("progList", progList);
            response.sendRedirect("staff_history.jsp");
            
        }
        catch (JSONException | SQLException | IOException e){
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
