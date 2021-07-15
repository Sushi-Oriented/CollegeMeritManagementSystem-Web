/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginStudent;

import bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.JDBCUtility;

/**
 *
 * @author Alifah Ilyana binti Soharto B19EC0003
 */
public class LoginServletStudent extends HttpServlet {

    private LoginDaoStudent loginDao;
    private JDBCUtility jdbcUtility;
    private Connection con;
    
    public void init() {
        loginDao = new LoginDaoStudent();
        jdbcUtility = new JDBCUtility();
        jdbcUtility.jdbcConnect();
        con = jdbcUtility.jdbcGetConnection();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String firstemail = request.getParameter("firstemail");
        String password = request.getParameter("password");
        LoginBeanStudent loginBean = new LoginBeanStudent();
        loginBean.setFirstemail(firstemail);
        loginBean.setPassword(password);
        
        HttpSession session = request.getSession(true);
        
        session.setAttribute("firstemail", firstemail);
           
        try {
            if (loginDao.validate(loginBean)) {
                String selectQry = "select * from user where firstemail = ?";
                PreparedStatement ps = con.prepareStatement(selectQry);
                ps.setString(1, firstemail);
                ResultSet rs = ps.executeQuery();
                User ust = new User();
            
                while(rs.next()){                
                    ust.setFullname(rs.getString(1));
                    ust.setNickname(rs.getString(2));
                }

                session.setAttribute("ust", ust);
                RequestDispatcher rd=request.getRequestDispatcher("stud_programIndex"); 
                rd.forward(request, response);
            } 
            
            else {
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Wrong email or password');");
                out.println("location='login.jsp';");
                out.println("</script>");
            }
        } 
        
        catch (ClassNotFoundException e) {
//            e.printStackTrace();
        } catch (SQLException ex) {
            Logger.getLogger(LoginServletStudent.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}