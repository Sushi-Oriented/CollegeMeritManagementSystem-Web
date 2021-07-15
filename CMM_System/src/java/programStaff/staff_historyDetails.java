package programStaff;

import bean.Program;
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
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author mhafizkn
 */
public class staff_historyDetails extends HttpServlet {

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
            String progID = request.getParameter("progID");
            
            /*To get details of program*/
            String seql = "select * from program where progID = ?";
            PreparedStatement ps = con.prepareStatement(seql);
            ps.setString(1, progID);
            ResultSet rs = ps.executeQuery();

            Program pro = new Program();         
            while (rs.next()) {   
                pro.setFirstEmail(rs.getString(1));
                pro.setProgID(rs.getInt(2));
                pro.setProgName(rs.getString(3));
                pro.setProgLocation(rs.getString(4));
                pro.setProgStartDate(rs.getDate(5));
                pro.setProgEndDate(rs.getDate(6));
                pro.setProgOrganizer(rs.getString(7));
                pro.setProgCategory(rs.getString(8));
                pro.setProgDescription(rs.getString(9));
                pro.setProgStatus(rs.getString(10));
                pro.setMeritStatus(rs.getString(11));
            }
            
            /*To get merit on the program*/
            //Vector merList = new Vector();
            String merSql = "select * from merit where progID = ?";
            PreparedStatement ps2 = con.prepareStatement(merSql);
            ps2.setString(1, progID);
            ResultSet rs2 = ps2.executeQuery();
            
            int i=0;
            JSONArray jArray = new JSONArray();
            
            while (rs2.next()) {
//                Merit mer = new Merit();
//                
//                mer.setName(rs2.getString("name"));
//                mer.setRole(rs2.getString("role"));
//                mer.setMatricNum(rs2.getString("matricNum"));
//                mer.setIcNum(rs2.getString("IcNum"));
//                mer.setMerit(rs2.getInt("merit"));
//                mer.setStatus(rs2.getString("status"));
//                
//                merList.addElement(mer);
                String name = rs2.getString("name");
                String role = rs2.getString("role");
                String matricNum = rs2.getString("matricNum");
                String IcNum = rs2.getString("IcNum");
                String merit = rs2.getString("merit");

                JSONObject arrayObj = new JSONObject();
                
                int x = i+1;
                arrayObj.put("Bil",x);
                arrayObj.put("name", name);
                arrayObj.put("role",role);
                arrayObj.put("matricNum",matricNum);
                arrayObj.put("IcNum",IcNum);
                arrayObj.put("merit",merit);
                x++;
                
                jArray.put(i,arrayObj);
                i++;
            }
            
            /* Pass both attribute; merit & program */
            //session.setAttribute("merList", merList);
            session.setAttribute("jArray", jArray);
            session.setAttribute("pro", pro);
            response.sendRedirect("staff_historyDetails.jsp");
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
