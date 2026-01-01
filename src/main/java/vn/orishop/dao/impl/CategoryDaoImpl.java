package vn.orishop.dao.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import java.util.List;
import vn.orishop.configs.JPAConfig;
import vn.orishop.dao.ICategoryDao;
import vn.orishop.entity.Category;

public class CategoryDaoImpl extends AbstractDao<Category> implements ICategoryDao {

    public CategoryDaoImpl() {
        super(Category.class);
    }

    @Override
    public List<Category> findByName(String keyword) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT c FROM Category c WHERE c.categoryName LIKE :keyword";
            TypedQuery<Category> query = enma.createQuery(jpql, Category.class);
            query.setParameter("keyword", "%" + keyword + "%");
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    @Override
    public List<Category> findRootCategories() {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            String jpql =
                    "SELECT c FROM Category c WHERE c.category IS NULL ORDER BY c.categoryName";
            TypedQuery<Category> query = enma.createQuery(jpql, Category.class);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }
}
