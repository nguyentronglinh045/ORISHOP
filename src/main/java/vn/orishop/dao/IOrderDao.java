package vn.orishop.dao;

import java.util.List;
import vn.orishop.entity.Order;

public interface IOrderDao {
    void insert(Order order);
    void update(Order order);
    void delete(Object id);
    Order findById(Object id);
    List<Order> findAll();
    int count();
    
    // Hàm tìm đơn hàng theo ID người dùng
    List<Order> findByUserId(int userId);
}