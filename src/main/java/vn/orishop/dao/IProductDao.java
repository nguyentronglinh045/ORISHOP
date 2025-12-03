package vn.orishop.dao;

import java.util.List;
import vn.orishop.entity.Product;

public interface IProductDao {
    // Các phương thức CRUD cơ bản (khớp với AbstractDao)
    void insert(Product product);
    void update(Product product);
    void delete(Object id);
    Product findById(Object id);
    List<Product> findAll();
    int count();
    
    // Các phương thức riêng của Product (đã implement trong ProductDaoImpl)
    List<Product> findByName(String keyword);
    List<Product> findAll(int page, int pageSize); // Phân trang
    List<Product> findByCategoryId(int categoryId); // Lọc theo danh mục
}