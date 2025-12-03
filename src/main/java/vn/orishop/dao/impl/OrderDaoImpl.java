package vn.orishop.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import vn.orishop.configs.JPAConfig;
import vn.orishop.dao.IOrderDao;
import vn.orishop.entity.Order;

public class OrderDaoImpl extends AbstractDao<Order> implements IOrderDao {

    public OrderDaoImpl() {
        super(Order.class);
    }

    @Override
    public List<Order> findByUserId(int userId) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT o FROM Order o WHERE o.user.id = :userId";
            TypedQuery<Order> query = enma.createQuery(jpql, Order.class);
            query.setParameter("userId", userId);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }
}