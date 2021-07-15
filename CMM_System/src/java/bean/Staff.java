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
public class Staff implements Serializable{
    String fullname, nickname, firstemail, staffID, staffphoneno, password;

    public Staff() {
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

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getStaffphoneno() {
        return staffphoneno;
    }

    public void setStaffphoneno(String staffphoneno) {
        this.staffphoneno = staffphoneno;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
}
