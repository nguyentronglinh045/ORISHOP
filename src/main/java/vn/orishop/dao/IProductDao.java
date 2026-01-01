package vn.orishop.dao;

import java.util.List;
import vn.orishop.entity.Product;

public interface IProductDao {
    void insert(Product product);

    void update(Product product);

    void delete(Object id);

    Product findById(Object id);

    List<Product> findAll();

    int count();

    List<Product> findByName(String keyword);

    List<Product> findAll(int page, int pageSize);

    List<Product> findByCategoryId(int categoryId);

    // THÊM MỚI: Tìm sản phẩm khuyến mãi
    List<Product> findPromotionalProducts();
}
