package vn.orishop.dao.impl;

import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import vn.orishop.configs.JPAConfig;
import vn.orishop.dao.IOrderDetailDao;
import vn.orishop.entity.OrderDetail;

public class OrderDetailDaoImpl extends AbstractDao<OrderDetail> implements IOrderDetailDao {

    public OrderDetailDaoImpl() {
        super(OrderDetail.class);
    }

    @Override
    public List<OrderDetail> findByOrderId(int orderId) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT od FROM OrderDetail od WHERE od.order.orderId = :orderId";
            TypedQuery<OrderDetail> query = enma.createQuery(jpql, OrderDetail.class);
            query.setParameter("orderId", orderId);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }
}