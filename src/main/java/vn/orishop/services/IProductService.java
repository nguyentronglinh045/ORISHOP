package vn.orishop.services;

import java.util.List;
import vn.orishop.entity.Product;

public interface IProductService {
    // Các hàm cơ bản Controller đang gọi
    void insert(Product product);
    void update(Product product);
    void delete(int productId);
    Product findById(int productId);
    List<Product> findAll();

    // Các hàm nâng cao (nếu cần)
    List<Product> findByName(String keyword);
    List<Product> findAll(int page, int pageSize);
    List<Product> findByCategoryId(int categoryId);
    int count();
}