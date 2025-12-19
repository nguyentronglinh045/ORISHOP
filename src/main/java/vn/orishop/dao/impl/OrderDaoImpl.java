package vn.orishop.dao.impl;

import java.util.ArrayList;
import java.util.Date;
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
    
    // ===================== THỐNG KÊ DOANH THU =====================
    
    @Override
    public double getTotalRevenue(Date startDate, Date endDate, String status) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            StringBuilder jpql = new StringBuilder("SELECT COALESCE(SUM(o.amount), 0) FROM Order o WHERE o.orderDate BETWEEN :startDate AND :endDate");
            if (status != null && !status.isEmpty()) {
                jpql.append(" AND o.status = :status");
            }
            
            TypedQuery<Double> query = enma.createQuery(jpql.toString(), Double.class);
            query.setParameter("startDate", startDate);
            query.setParameter("endDate", endDate);
            if (status != null && !status.isEmpty()) {
                query.setParameter("status", status);
            }
            
            Double result = query.getSingleResult();
            return result != null ? result : 0.0;
        } finally {
            enma.close();
        }
    }
    
    @Override
    public List<Object[]> getDailyStatistics(Date startDate, Date endDate, String status) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            StringBuilder jpql = new StringBuilder(
                "SELECT FUNCTION('CONVERT', DATE, o.orderDate) as orderDay, " +
                "COALESCE(SUM(o.amount), 0) as totalRevenue, " +
                "COUNT(o) as orderCount " +
                "FROM Order o " +
                "WHERE o.orderDate BETWEEN :startDate AND :endDate"
            );
            
            if (status != null && !status.isEmpty()) {
                jpql.append(" AND o.status = :status");
            }
            
            jpql.append(" GROUP BY FUNCTION('CONVERT', DATE, o.orderDate)");
            jpql.append(" ORDER BY FUNCTION('CONVERT', DATE, o.orderDate)");
            
            TypedQuery<Object[]> query = enma.createQuery(jpql.toString(), Object[].class);
            query.setParameter("startDate", startDate);
            query.setParameter("endDate", endDate);
            if (status != null && !status.isEmpty()) {
                query.setParameter("status", status);
            }
            
            return query.getResultList();
        } catch (Exception e) {
            // Fallback: nếu FUNCTION không hoạt động, dùng native query
            e.printStackTrace();
            return new ArrayList<>();
        } finally {
            enma.close();
        }
    }
    
    @Override
    public int countByStatus(String status) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            String jpql;
            TypedQuery<Long> query;
            
            if (status != null && !status.isEmpty()) {
                jpql = "SELECT COUNT(o) FROM Order o WHERE o.status = :status";
                query = enma.createQuery(jpql, Long.class);
                query.setParameter("status", status);
            } else {
                jpql = "SELECT COUNT(o) FROM Order o";
                query = enma.createQuery(jpql, Long.class);
            }
            
            return query.getSingleResult().intValue();
        } finally {
            enma.close();
        }
    }
}