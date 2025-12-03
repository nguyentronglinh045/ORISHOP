package vn.orishop.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

import vn.orishop.configs.JPAConfig;

public class AbstractDao<T> {

    private Class<T> entityClass;

    public AbstractDao(Class<T> cls) {
        this.entityClass = cls;
    }

    public void insert(T entity) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.persist(entity);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    public void update(T entity) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.merge(entity);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    public void delete(Object id) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            T entity = enma.find(entityClass, id);
            enma.remove(entity);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    public T findById(Object id) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            return enma.find(entityClass, id);
        } finally {
            enma.close();
        }
    }

    public List<T> findAll() {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT o FROM " + entityClass.getName() + " o";
            TypedQuery<T> query = enma.createQuery(jpql, entityClass);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    // Hỗ trợ phân trang
    public List<T> findAll(int firstResult, int maxResults) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT o FROM " + entityClass.getName() + " o";
            TypedQuery<T> query = enma.createQuery(jpql, entityClass);
            query.setFirstResult(firstResult);
            query.setMaxResults(maxResults);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }
    
    // Đếm tổng số lượng bản ghi
    public int count() {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT count(o) FROM " + entityClass.getName() + " o";
            TypedQuery<Long> query = enma.createQuery(jpql, Long.class);
            return query.getSingleResult().intValue();
        } finally {
            enma.close();
        }
    }
}