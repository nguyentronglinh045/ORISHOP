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

    // THÊM MỚI: Tìm sản phẩm có discount > 0
    @Override
    public List<Product> findPromotionalProducts() {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT p FROM Product p WHERE p.discount > 0 ORDER BY p.discount DESC";
            TypedQuery<Product> query = enma.createQuery(jpql, Product.class);
            // Có thể giới hạn lấy top 20 sản phẩm sale mạnh nhất
            query.setMaxResults(20); 
            return query.getResultList();
        } finally {
            enma.close();
        }
    }
}