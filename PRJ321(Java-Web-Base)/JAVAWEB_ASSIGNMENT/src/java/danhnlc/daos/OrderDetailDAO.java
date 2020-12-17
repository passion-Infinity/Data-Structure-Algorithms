package danhnlc.daos;

import danhnlc.common.AbstractDAO;
import danhnlc.dtos.OrderDetail;

public class OrderDetailDAO extends AbstractDAO {

    public boolean insertOrderDetail(OrderDetail orderDetail) throws Exception {
        String sql = "Insert Into tblOrderDetails(orderID, roomID, price, checkin, checkout) Values(?,?,?,?,?)";
        return query(sql, orderDetail.getOrder().getOrderID(), orderDetail.getRoom().getRoomID(),
                orderDetail.getPrice(), orderDetail.getCheckIn(), orderDetail.getCheckOut());
    }

}
