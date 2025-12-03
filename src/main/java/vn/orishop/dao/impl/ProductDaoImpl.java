package vn.orishop.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import vn.orishop.configs.JPAConfig;
import vn.orishop.dao.IProductDao;
import vn.orishop.entity.Product;

public class ProductDaoImpl extends AbstractDao<Product> implements IProductDao {

    public ProductDaoImpl() {
        super(Product.class);
    }

    @Override
    public List<Product> findByName(String keyword) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT p FROM Product p WHERE p.productName LIKE :keyword";
            TypedQuery<Product> query = enma.createQuery(jpql, Product.class);
            query.setParameter("keyword", "%" + keyword + "%");
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    @Override
    public List<Product> findAll(int page, int pageSize) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT p FROM Product p";
            TypedQuery<Product> query = enma.createQuery(jpql, Product.class);
            // Tính toán vị trí bắt đầu
            query.setFirstResult((page - 1) * pageSize);
            query.setMaxResults(pageSize);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    @Override
    public List<Product> findByCategoryId(int categoryId) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT p FROM Product p WHERE p.category.categoryId = :categoryId";
            TypedQuery<Product> query = enma.createQuery(jpql, Product.class);
            query.setParameter("categoryId", categoryId);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }
}