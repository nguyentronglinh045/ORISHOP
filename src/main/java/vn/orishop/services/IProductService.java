package vn.orishop.services;

import java.util.List;
import vn.orishop.entity.Product;

public interface IProductService {
    void insert(Product product);
    void update(Product product);
    void delete(int productId);
    Product findById(int productId);
    List<Product> findAll();

    List<Product> findByName(String keyword);
    List<Product> findAll(int page, int pageSize);
    List<Product> findByCategoryId(int categoryId);
    int count();
    
    // THÊM MỚI
    List<Product> findPromotionalProducts();
}