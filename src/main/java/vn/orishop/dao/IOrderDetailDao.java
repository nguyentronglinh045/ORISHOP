package vn.orishop.dao;

import java.util.List;
import vn.orishop.entity.OrderDetail;

public interface IOrderDetailDao {
    void insert(OrderDetail orderDetail);
    void update(OrderDetail orderDetail);
    void delete(Object id);
    OrderDetail findById(Object id);
    List<OrderDetail> findAll();
    List<OrderDetail> findByOrderId(int orderId);
}