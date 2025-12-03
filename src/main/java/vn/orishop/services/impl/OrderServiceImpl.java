package vn.orishop.services.impl;

import java.util.List;

import vn.orishop.dao.IOrderDao;
import vn.orishop.dao.impl.OrderDaoImpl;
import vn.orishop.entity.Order;
import vn.orishop.services.IOrderService;

public class OrderServiceImpl implements IOrderService {

    // Gọi DAO để thao tác CSDL
    IOrderDao orderDao = new OrderDaoImpl();

    @Override
    public void insert(Order order) {
        orderDao.insert(order);
    }

    @Override
    public void update(Order order) {
        orderDao.update(order);
    }

    @Override
    public void delete(int id) {
        orderDao.delete(id);
    }

    @Override
    public Order findById(int id) {
        return orderDao.findById(id);
    }

    @Override
    public List<Order> findAll() {
        return orderDao.findAll();
    }

    @Override
    public List<Order> findByUserId(int userId) {
        return orderDao.findByUserId(userId);
    }
}