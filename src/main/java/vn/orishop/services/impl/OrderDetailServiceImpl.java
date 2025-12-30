package vn.orishop.services.impl;

import java.util.List;
import vn.orishop.dao.IOrderDetailDao;
import vn.orishop.dao.impl.OrderDetailDaoImpl;
import vn.orishop.entity.OrderDetail;
import vn.orishop.services.IOrderDetailService;

public class OrderDetailServiceImpl implements IOrderDetailService {

    IOrderDetailDao orderDetailDao = new OrderDetailDaoImpl();

    @Override
    public void insert(OrderDetail orderDetail) {
        orderDetailDao.insert(orderDetail);
    }

    @Override
    public List<OrderDetail> findByOrderId(int orderId) {
        return orderDetailDao.findByOrderId(orderId);
    }
}
