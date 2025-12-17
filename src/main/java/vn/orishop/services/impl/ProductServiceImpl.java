package vn.orishop.services.impl;

import java.util.List;

import vn.orishop.dao.IProductDao;
import vn.orishop.dao.impl.ProductDaoImpl;
import vn.orishop.entity.Product;
import vn.orishop.services.IProductService;

public class ProductServiceImpl implements IProductService {

    IProductDao productDao = new ProductDaoImpl();

    @Override
    public void insert(Product product) {
        productDao.insert(product);
    }

    @Override
    public void update(Product product) {
        productDao.update(product);
    }

    @Override
    public void delete(int productId) {
        productDao.delete(productId);
    }

    @Override
    public Product findById(int productId) {
        return productDao.findById(productId);
    }

    @Override
    public List<Product> findAll() {
        return productDao.findAll();
    }

    @Override
    public List<Product> findByName(String keyword) {
        return productDao.findByName(keyword);
    }

    @Override
    public List<Product> findAll(int page, int pageSize) {
        return productDao.findAll(page, pageSize);
    }

    @Override
    public List<Product> findByCategoryId(int categoryId) {
        return productDao.findByCategoryId(categoryId);
    }

    @Override
    public int count() {
        return productDao.count();
    }

    // THÊM MỚI: Implementation
    @Override
    public List<Product> findPromotionalProducts() {
        return productDao.findPromotionalProducts();
    }
}