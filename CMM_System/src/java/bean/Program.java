
package bean;

import java.io.Serializable;
import java.util.Date;

public class Program implements Serializable {

    int progID;
    String progName, progLocation, progOrganizer, progCategory, progDescription, progStatus, firstEmail, studName, meritStatus;
    Date progStartDate, progEndDate;
    
    // Table Data
    String pendingCount, approveCount, DeclineCount, programCount, festCount, workCount, confCount;   
    
    public Program() {
    }

    public String getMeritStatus() {
        return meritStatus;
    }

    public void setMeritStatus(String meritStatus) {
        this.meritStatus = meritStatus;
    }
    
    public int getFirstEmail() {
        return progID;
    }

    public void setFirstEmail(String firstEmail) {
        this.firstEmail = firstEmail;
    }
         
    public String getFirstEmail2(){
        return firstEmail;
    }
    
    public void setFirstEmail2(String firstEmail) {
        this.firstEmail = firstEmail;
    }
        
    public String getStudName(){
        return studName;
    }
    
    public void setStudName(String studName) {
        this.studName = studName;
    }
    
    public int getProgID() {
        return progID;
    }

    public void setProgID(int progID) {
        this.progID = progID;
    }

    public String getProgName() {
        return progName;
    }

    public void setProgName(String progName) {
        this.progName = progName;
    }

    public String getProgLocation() {
        return progLocation;
    }

    public void setProgLocation(String progLocation) {
        this.progLocation = progLocation;
    }

    public String getProgOrganizer() {
        return progOrganizer;
    }

    public void setProgOrganizer(String progOrganizer) {
        this.progOrganizer = progOrganizer;
    }

    public String getProgCategory() {
        return progCategory;
    }

    public void setProgCategory(String progCategory) {
        this.progCategory = progCategory;
    }

    public String getProgDescription() {
        return progDescription;
    }

    public void setProgDescription(String progDescription) {
        this.progDescription = progDescription;
    }

    public String getProgStatus() {
        return progStatus;
    }

    public void setProgStatus(String progStatus) {
        this.progStatus = progStatus;
    }

    public Date getProgStartDate() {
        return progStartDate;
    }

    public void setProgStartDate(Date progStartDate) {
        this.progStartDate = progStartDate;
    }

    public Date getProgEndDate() {
        return progEndDate;
    }

    public void setProgEndDate(Date progEndDate) {
        this.progEndDate = progEndDate;
    }

    public String getPendingCount() {
        return pendingCount;
    }

    public void setPendingCount(String pendingCount) {
        this.pendingCount = pendingCount;
    }

    public String getApproveCount() {
        return approveCount;
    }

    public void setApproveCount(String approveCount) {
        this.approveCount = approveCount;
    }

    public String getDeclineCount() {
        return DeclineCount;
    }

    public void setDeclineCount(String DeclineCount) {
        this.DeclineCount = DeclineCount;
    }

    public String getProgramCount() {
        return programCount;
    }

    public void setProgramCount(String programCount) {
        this.programCount = programCount;
    }

    public String getFestCount() {
        return festCount;
    }

    public void setFestCount(String festCount) {
        this.festCount = festCount;
    }

    public String getWorkCount() {
        return workCount;
    }

    public void setWorkCount(String workCount) {
        this.workCount = workCount;
    }

    public String getConfCount() {
        return confCount;
    }

    public void setConfCount(String confCount) {
        this.confCount = confCount;
    }
}