package danhnlc.daos;

import danhnlc.common.AbstractDAO;
import danhnlc.dtos.Room;
import danhnlc.util.DBConnection;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO extends AbstractDAO {

    public List<Room> getList() throws Exception {
        List<Room> result = null;
        String sql = "Select roomID, typeID, roomName, roomFloor, quantity, price, numberOfPersons, image, status From tblRooms Where status = 1";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                Room room = new Room();
                room.setRoomID(rs.getString("roomID"));
                room.setTypeID(rs.getString("typeID"));
                room.setRoomName(rs.getString("roomName"));
                room.setRoomFloor(rs.getInt("roomFloor"));
                room.setQuantity(rs.getInt("quantity"));
                room.setPrice(rs.getFloat("price"));
                room.setNumberOfPersons(rs.getInt("numberOfPersons"));
                room.setImage(rs.getString("image"));
                room.setStatus(rs.getBoolean("status"));
                result.add(room);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<Room> getList(String date1, String date2) throws Exception {
        List<Room> result = null;
        String sql = "Select roomID, typeID, roomName, roomFloor, quantity, price, numberOfPersons, image, status "
                + "From tblRooms "
                + "Where roomID not in "
                + "("
                + "Select roomID "
                + "From tblOrderDetails "
                + "Where checkin <= ? and checkout >= ?"
                + ")"
                + " And status = 1";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, date2);
            preStm.setString(2, date1);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                Room room = new Room();
                room.setRoomID(rs.getString("roomID"));
                room.setTypeID(rs.getString("typeID"));
                room.setRoomName(rs.getString("roomName"));
                room.setRoomFloor(rs.getInt("roomFloor"));
                room.setQuantity(rs.getInt("quantity"));
                room.setPrice(rs.getFloat("price"));
                room.setNumberOfPersons(rs.getInt("numberOfPersons"));
                room.setImage(rs.getString("image"));
                room.setStatus(rs.getBoolean("status"));
                result.add(room);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int checkQuantity(String id) throws Exception {
        int result = 0;
        try {
            String sql = "Select quantity From tblRooms Where roomID=?";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                result = rs.getInt("quantity");
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public void updateStautsRoom(String id) throws Exception {
        String sql = "Update tblRooms Set status = 0 Where roomID=?";
        try {
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            preStm.executeUpdate();
        } finally {
            if (preStm != null) {
                preStm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public boolean create(Room room) throws Exception {
        String sql = "Insert Into tblRooms(roomID, typeID, roomName, roomFloor, quantity, price, numberOfPersons, image, status) Values(?,?,?,?,?,?,?,?,?)";
        return query(sql, room.getRoomID(), room.getTypeID(), room.getRoomName(), room.getRoomFloor(), room.getQuantity(), room.getPrice(), room.getNumberOfPersons(), room.getImage(), room.isStatus());
    }

    public boolean update(Room room) throws Exception {
        String sql = "Update tblRooms Set typeID=?, roomName=?, roomFloor=?, quantity=?, price=?, numberOfPersons=?, image=?, status=? Where roomID=?";
        return query(sql, room.getTypeID(), room.getRoomName(), room.getRoomFloor(), room.getQuantity(), room.getPrice(), room.getNumberOfPersons(), room.getImage(), room.isStatus(), room.getRoomID());
    }

//    public boolean delete(String roomID) throws Exception {
//        String sql = "Delete From tblRooms Where roomID=?";
//        return query(sql, roomID);
//    }

}
