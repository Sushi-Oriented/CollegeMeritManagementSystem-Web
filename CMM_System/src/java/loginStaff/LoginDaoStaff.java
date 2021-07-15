/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginStaff;

import java.sql.*;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author Alifah Ilyana binti Soharto B19EC0003
 */
public class LoginDaoStaff extends HttpServlet {

    public boolean validate(LoginBeanStaff loginBean) throws ClassNotFoundException {
        boolean status = false;

        String driver = "com.mysql.jdbc.Driver";
        String dbName = "cmmsdb";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String username = "root";
        String password = "";
        
        Class.forName(driver);
        try (Connection conn = DriverManager.getConnection(url, username, password);

            PreparedStatement preparedStatement = conn.prepareStatement("select * from staff where firstemail = ? and password = ? ")) {
            preparedStatement.setString(1, loginBean.getFirstemail());
            preparedStatement.setString(2, loginBean.getPassword());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();
        } 
        
        catch (SQLException e) {
            printSQLException(e);
        }
        
        return status;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}