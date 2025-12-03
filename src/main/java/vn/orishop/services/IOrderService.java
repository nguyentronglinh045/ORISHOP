package vn.orishop.services;

import java.util.List;
import vn.orishop.entity.Order;

public interface IOrderService {
    void insert(Order order);
    void update(Order order);
    void delete(int id);
    Order findById(int id);
    List<Order> findAll();
    
    // Tìm đơn hàng của một người dùng cụ thể
    List<Order> findByUserId(int userId);
}