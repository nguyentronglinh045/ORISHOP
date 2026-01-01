package vn.orishop.services;

import java.util.List;
import vn.orishop.entity.Category;

public interface ICategoryService {
    void insert(Category category);

    void update(Category category);

    void delete(int id);

    Category findById(int id);

    List<Category> findAll();

    List<Category> findByName(String keyword);

    // Lấy danh mục gốc (không có danh mục cha)
    List<Category> findRootCategories();
}
