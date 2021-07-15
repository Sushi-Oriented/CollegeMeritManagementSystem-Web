/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;

/**
 *
 * @author Alifah Ilyana binti Soharto B19EC0003
 */
public class User implements Serializable {
    String fullname, nickname, firstemail, studentID, studphoneno, password;

    public User() {
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getFirstemail() {
        return firstemail;
    }

    public void setFirstemail(String firstemail) {
        this.firstemail = firstemail;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getStudphoneno() {
        return studphoneno;
    }

    public void setStudphoneno(String studphoneno) {
        this.studphoneno = studphoneno;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
