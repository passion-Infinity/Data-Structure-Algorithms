/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhnlc.daos;

import danhncl.dtos.Employee;
import danhnlc.utils.DBConnection;
import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author User
 */
public class EmpDAO implements Serializable {

    private Connection conn = null;
    private CallableStatement cs = null;
    private ResultSet rs = null;

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (cs != null) {
            cs.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    private void setParameters(CallableStatement cs, Object... parameters) throws Exception {
        for (int i = 0; i < parameters.length; i++) {
            Object parameter = parameters[i];
            int index = i + 1;
            if (parameter instanceof String) {
                cs.setString(index, (String) parameter);
            } else if (parameter instanceof Boolean) {
                cs.setBoolean(index, (boolean) parameter);
            } else if (parameter instanceof Date) {
                cs.setDate(index, (Date) parameter);
            }
        }
    }

    private boolean query(String sql, Object... parameter) throws Exception {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            cs = conn.prepareCall(sql);
            setParameters(cs, parameter);
            check = cs.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<Employee> getAll() throws Exception {
        List<Employee> result = null;
        try {
            conn = DBConnection.getConnection();
            cs = conn.prepareCall("{call getAllEmp}");
            rs = cs.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                Employee emp = new Employee();
                emp.setEmpID(rs.getString("EmpID"));
                emp.setFullName(rs.getString("Fullname"));
                emp.setPhone(rs.getString("Phone"));
                emp.setEmail(rs.getString("Email"));
                emp.setAddress(rs.getString("Address"));
                emp.setDob(rs.getDate("DateOfBirth"));
                emp.setIsDelete(rs.getBoolean("IsDelete"));
                result.add(emp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return result;
    }

    public Employee findByEmpID(String code) throws Exception {
        try {
            conn = DBConnection.getConnection();
            cs = conn.prepareCall("{call findByEmpID(?)}");
            setParameters(cs, code);
            rs = cs.executeQuery();
            while (rs.next()) {
                Employee emp = new Employee();
                emp.setEmpID(rs.getString("EmpID"));
                emp.setFullName(rs.getString("Fullname"));
                emp.setPhone(rs.getString("Phone"));
                emp.setEmail(rs.getString("Email"));
                emp.setAddress(rs.getString("Address"));
                emp.setDob(rs.getDate("DateOfBirth"));
                emp.setIsDelete(rs.getBoolean("IsDelete"));
                return emp;
            }
        } finally {
            closeConnection();
        }
        return null;
    }

    public boolean insert(Employee emp) throws Exception {
        String sql = "{call insertEmp(?,?,?,?,?,?,?)}";
        return query(sql, emp.getEmpID(), emp.getFullName(), emp.getPhone(), emp.getEmail(), emp.getAddress(), new Date(emp.getDob().getTime()), emp.isIsDelete());
    }
    
    public boolean update(Employee emp) throws Exception {
        String sql = "{call updateEmp(?,?,?,?,?,?,?)}";
        return query(sql, emp.getEmpID(), emp.getFullName(), emp.getPhone(), emp.getEmail(), emp.getAddress(), new Date(emp.getDob().getTime()), emp.isIsDelete());
    }
    
    public boolean delete(Employee employee) throws Exception{
        String sql = "{call updateIsDelete(?, ?)}";
        return query(sql, employee.getEmpID(), employee.isIsDelete());
    }
    
}
