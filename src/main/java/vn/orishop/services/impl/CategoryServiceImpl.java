package vn.orishop.services.impl;

import java.util.List;

import vn.orishop.dao.ICategoryDao;
import vn.orishop.dao.IProductDao;
import vn.orishop.dao.impl.CategoryDaoImpl;
import vn.orishop.dao.impl.ProductDaoImpl;
import vn.orishop.entity.Category;
import vn.orishop.entity.Product;
import vn.orishop.services.ICategoryService;

public class CategoryServiceImpl implements ICategoryService {

    // Gọi DAO để thao tác CSDL
    public ICategoryDao categoryDao = new CategoryDaoImpl();
    // Gọi thêm ProductDAO để xử lý sản phẩm liên quan
    public IProductDao productDao = new ProductDaoImpl();

    @Override
    public void insert(Category category) {
        categoryDao.insert(category);
    }

    @Override
    public void update(Category category) {
        categoryDao.update(category);
    }

    @Override
    public void delete(int id) {
        // [QUAN TRỌNG] Xử lý ràng buộc trước khi xóa
        
        // 1. Tìm danh mục cần xóa
        Category category = categoryDao.findById(id);
        
        if (category != null) {
            // 2. Xử lý Danh mục con: Nếu có con, chuyển chúng thành danh mục gốc (parentId = null)
            // Vì subCategories là EAGER nên có thể gọi trực tiếp
            List<Category> subCategories = category.getSubCategories();
            if (subCategories != null && !subCategories.isEmpty()) {
                for (Category sub : subCategories) {
                    sub.setCategory(null); // Gỡ bỏ cha
                    categoryDao.update(sub); // Cập nhật lại vào DB
                }
            }

            // 3. Xử lý Sản phẩm: Tìm các sản phẩm thuộc danh mục này và set category = null
            // (Hoặc bạn có thể chọn xóa luôn sản phẩm tùy nghiệp vụ, ở đây mình chọn giữ sản phẩm lại)
            List<Product> products = productDao.findByCategoryId(id);
            if (products != null && !products.isEmpty()) {
                for (Product p : products) {
                    p.setCategory(null); // Sản phẩm này sẽ không thuộc danh mục nào (Uncategorized)
                    productDao.update(p);
                }
            }
            
            // 4. Sau khi gỡ hết quan hệ, tiến hành xóa danh mục
            categoryDao.delete(id);
        }
    }

    @Override
    public Category findById(int id) {
        return categoryDao.findById(id);
    }

    @Override
    public List<Category> findAll() {
        return categoryDao.findAll();
    }

    @Override
    public List<Category> findByName(String keyword) {
        return categoryDao.findByName(keyword);
    }
    
    @Override
    public List<Category> findRootCategories() {
        return categoryDao.findRootCategories();
    }
}