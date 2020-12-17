package danhnlc.daos;

import danhnlc.common.AbstractDAO;
import danhnlc.dtos.RoomType;
import danhnlc.util.DBConnection;
import java.util.ArrayList;
import java.util.List;

public class RoomTypeDAO extends AbstractDAO {

    public List<RoomType> getList() throws Exception {
        List<RoomType> result = null;
        String sql = "Select typeID, typeName, description From tblRoomType";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                RoomType roomType = new RoomType();
                roomType.setTypeID(rs.getString("typeID"));
                roomType.setTypeName(rs.getString("typeName"));
                roomType.setDescription(rs.getString("description"));
                result.add(roomType);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<String> getTypeID() throws Exception {
        List<String> result = null;
        String sql = "Select typeID From tblRoomType";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String typeID = rs.getString("typeID");
                result.add(typeID);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean isnert(RoomType roomType) throws Exception {
        String sql = "Insert Into tblRoomType(typeID, typeName, description) Values(?,?,?,?)";
        return query(sql, roomType.getTypeID(), roomType.getTypeName(), roomType.getDescription());
    }

    public boolean update(RoomType roomType) throws Exception {
        String sql = "Update tblRoomType Set typeName=?, description=? Where typeID=?";
        return query(sql, roomType.getTypeName(), roomType.getDescription(), roomType.getTypeID());
    }

    public boolean delete(String typeID) throws Exception {
        String sql = "Delete From tblRoomType Where typeID=?";
        return query(sql, typeID);
    }
}
