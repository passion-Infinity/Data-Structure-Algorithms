/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhncl.daos;

import danhncl.common.AbstractDAO;
import danhnlc.dtos.Items;
import danhnlc.dtos.Suppliers;
import danhnlc.utils.DBConnection;
import java.io.Serializable;
import java.sql.CallableStatement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class ItemDAO extends AbstractDAO implements Serializable {
    
    public List<Items> getAll(List<Suppliers> list) {
        List<Items> result = null;
        CallableStatement cs = null;
        String itemCode, itemName, unit, supCode;
        float price;
        boolean supplying;
        try {
            conn = DBConnection.getConnection();
            cs = conn.prepareCall("{call getAllItem}");
            rs = cs.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                itemCode = rs.getString("itemCode");
                itemName = rs.getString("itemName");
                unit = rs.getString("unit");
                price = rs.getFloat("price");
                supplying = rs.getBoolean("supplying");
                supCode = rs.getString("supCode");
                Suppliers supplier = null;
                for (Suppliers x : list) {
                    if(x.getCode().equals(supCode)) {
                        supplier = x;
                    }
                }
                result.add(new Items(itemCode, itemName, supCode, unit, price, supplying, supplier));
            }
        } catch (Exception e) {
            e.getStackTrace();
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public Items findByPrimarykey(List<Suppliers> list, String code) {
        String itemCode, itemName, unit, supCode;
        float price;
        boolean supplying;
        try {
            conn = DBConnection.getConnection();
            cs = conn.prepareCall("{call getItemCode(?)}");
            cs.setString(1, code);
            rs = cs.executeQuery();
            while (rs.next()) {
                itemCode = rs.getString("itemCode");
                itemName = rs.getString("itemName");
                unit = rs.getString("unit");
                price = rs.getFloat("price");
                supplying = rs.getBoolean("supplying");
                supCode = rs.getString("supCode");
                Suppliers supplier = null;
                for (Suppliers x : list) {
                    if(x.getCode().equals(supCode)) {
                        supplier = x;
                    }
                }
                return new Items(itemCode, itemName, supCode, unit, price, supplying, supplier);
            }
        } catch (Exception e) {
            e.getStackTrace();
        } finally {
            closeConnection();
        }
        return null;
    }
    
    public boolean insert(Object...obj) throws Exception {
        String sql = "{call addNewItem(?,?,?,?,?,?)}";
        return query(sql, obj);
    }
    
    public boolean update(Object...obj) throws Exception {
        String sql = "{call updateItem(?,?,?,?,?,?)}";
        return query(sql, obj);
    }
    
    public boolean delete(String code) throws Exception {
        String sql = "{call deleteItem(?)}";
        return query(sql, code);
    }
}
