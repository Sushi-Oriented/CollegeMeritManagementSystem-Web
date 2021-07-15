/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginStudent;

import java.io.Serializable;

/**
 *
 * @author Alifah Ilyana binti Soharto B19EC0003
 */
public class LoginBeanStudent implements Serializable {
    
    String firstemail, password;

    public LoginBeanStudent() {
    }

    public String getFirstemail() {
        return firstemail;
    }

    public void setFirstemail(String firstemail) {
        this.firstemail = firstemail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
}
