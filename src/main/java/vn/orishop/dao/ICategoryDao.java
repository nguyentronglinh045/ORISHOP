package vn.orishop.dao;

import java.util.List;
import vn.orishop.entity.Category;

public interface ICategoryDao {
    void insert(Category category);
    void update(Category category);
    void delete(Object id); // AbstractDao dùng Object id
    Category findById(Object id);
    List<Category> findAll();
    int count();
    
    // Hàm riêng của Category
    List<Category> findByName(String keyword);
}