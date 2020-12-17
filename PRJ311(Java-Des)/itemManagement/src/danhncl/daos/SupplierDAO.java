/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhncl.daos;

import danhncl.common.AbstractDAO;
import danhnlc.dtos.Suppliers;
import static danhnlc.utils.DBConnection.getConnection;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class SupplierDAO extends AbstractDAO implements Serializable {

    public int find(List<Suppliers> list, String code) {
        for (int i = 0; i < list.size(); i++) {
            if (code.equals(list.get(i).getCode())) {
                return i;
            }
        }
        return -1;
    }
    
    public Suppliers findSupplier(List<Suppliers> list, String code) {
        int i = find(list, code);
        return i < 0 ? null : list.get(i);
    }

    public List<Suppliers> getAll() {
        List<Suppliers> result = null;
        try {
            conn = getConnection();
            cs = conn.prepareCall("{call getAllSupplier}");
            rs = cs.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                Suppliers dto = new Suppliers();
                dto.setCode(rs.getString("supCode"));
                dto.setName(rs.getString("supName"));
                dto.setAddress(rs.getString("address"));
                result.add(dto);
            }

        } catch (SQLException e) {
            e.getStackTrace();
        } finally {
            closeConnection();
        }
        return result;
    }

    public Suppliers findbyPrimaryKey(String code) {
        String sql = "Select * From tblSuppliers Where supCode=?";
        try {
            conn = getConnection();
            cs = conn.prepareCall("{call getSupplierByPrimarykey(?)}");
            cs.setString(1, code);
            rs = cs.executeQuery();
            while (rs.next()) {
                Suppliers dto = new Suppliers();
                dto.setCode(rs.getString("supCode"));
                dto.setName(rs.getString("supName"));
                dto.setAddress(rs.getString("address"));
                dto.setCollaborating(rs.getBoolean("collaborating"));
                return dto;
            }
        } catch (Exception e) {
            e.getStackTrace();
        } finally {
            closeConnection();
        }
        return null;
    }

    public boolean insert(Suppliers dto) throws Exception {
        String sql = "{call addNewSupplier(?,?,?,?)}";
        return query(sql, dto.getCode(), dto.getName(), dto.getAddress(), dto.isCollaborating());
    }

    public boolean edit(Suppliers dto) throws Exception {
        String sql = "{call updateSupplier(?,?,?,?)}";
        return query(sql, dto.getCode(), dto.getName(), dto.getAddress(), dto.isCollaborating());
    }

    public boolean delete(String code) throws Exception {
        String sql = "{call deleteSupplier(?)}";
        return query(sql, code);
    }
}
