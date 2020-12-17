/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhnlc.daos;

import danhnlc.Interface.ArmorInterface;
import danhnlc.dtos.Armor;
import danhnlc.utils.DBConnection;
import java.rmi.server.UnicastRemoteObject;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class ArmorDAO extends UnicastRemoteObject implements  ArmorInterface{
    
    public ArmorDAO() throws Exception{
    }
  
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
            } else if(parameter instanceof  Integer) {
                cs.setInt(index, (int) parameter);
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

    @Override
    public boolean createArmor(Armor dto) throws Exception{
        String sql = "{call createArmor(?,?,?,?,?,?)}";
        return query(sql, dto.getArmorID(), dto.getClassification(), dto.getDescription(), dto.getStatus(), new Date(dto.getTimeOfCreate().getTime()), dto.getDefense());
    }

    @Override
    public Armor findByArmorID(String id) throws Exception{
        try {
            conn = DBConnection.getConnection();
            cs = conn.prepareCall("{call findByArmorID(?)}");
            setParameters(cs, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                Armor dto = new Armor();
                dto.setArmorID(rs.getString("ArmorID"));
                dto.setClassification(rs.getString("Classification"));
                dto.setDescription(rs.getString("Description"));
                dto.setStatus(rs.getString("Status"));
                dto.setTimeOfCreate(rs.getDate("TimeOfCreate"));
                dto.setDefense(rs.getInt("Defense"));
                return dto;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return null;
    }

    @Override
    public List<Armor> findAllArmor() throws Exception{
        List<Armor> result = null;
        try {
            conn = DBConnection.getConnection();
            cs = conn.prepareCall("{call getAll}");
            rs = cs.executeQuery();
            result = new ArrayList<>(); 
            while (rs.next()) {
                Armor dto = new Armor();
                dto.setArmorID(rs.getString("ArmorID"));
                dto.setClassification(rs.getString("Classification"));
                dto.setDescription(rs.getString("Description"));
                dto.setStatus(rs.getString("Status"));
                dto.setTimeOfCreate(rs.getDate("TimeOfCreate"));
                dto.setDefense(rs.getInt("Defense"));
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return result;
    }

    @Override
    public boolean removeArmor(String id) throws Exception{
        String sql = "{call deleteArmor(?)}";
        return query(sql, id);
    }

    @Override
    public boolean updateArmor(Armor dto) throws Exception{
        String sql = "{call updateArmor(?,?,?,?,?,?)}";
        return query(sql, dto.getArmorID(), dto.getClassification(), dto.getDescription(), dto.getStatus(), new Date(dto.getTimeOfCreate().getTime()), dto.getDefense());
    }

    @Override
    public boolean checkLogin(String username, String password) throws Exception {
        try {
            conn = DBConnection.getConnection();
            cs = conn.prepareCall("{call checkLogin(?,?)}");
            cs.setString(1, username);
            cs.setString(2, password);
            rs = cs.executeQuery();
            if(rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return false;
    }
}
