package vn.orishop.services;

import java.util.List;
import vn.orishop.entity.OrderDetail;

public interface IOrderDetailService {
    void insert(OrderDetail orderDetail);

    List<OrderDetail> findByOrderId(int orderId);
}
