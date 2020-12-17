/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhncl.dtos;

import java.io.Serializable;
import java.util.Date;
import java.util.Vector;

/**
 *
 * @author User
 */
public class Employee implements Serializable{
    
    private String empID;
    private String fullName;
    private String phone;
    private String email;
    private String address;
    private Date dob;
    private boolean isDelete;

    public Employee() {
    }

    public Employee(String empID, String fullName, String phone, String email, String address, Date dob) {
        this.empID = empID;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.dob = dob;
    }
    
    public Vector toVector() {
        Vector v = new Vector();
        v.add(empID);
        v.add(fullName);
        v.add(phone);
        v.add(email);
        return v;
    }

    public String getEmpID() {
        return empID;
    }

    public void setEmpID(String empID) {
        this.empID = empID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public boolean isIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }
    
    
    
}
