package vn.orishop.controllers.web;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.orishop.entity.Category;
import vn.orishop.entity.Product;
import vn.orishop.services.ICategoryService;
import vn.orishop.services.IProductService;
import vn.orishop.services.impl.CategoryServiceImpl;
import vn.orishop.services.impl.ProductServiceImpl;

@WebServlet(urlPatterns = { "/product", "/product/detail", "/product/category", "/product/search" })
public class ProductWebController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    // Khởi tạo Service
    private ICategoryService categoryService = new CategoryServiceImpl();
    private IProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        
        List<Category> listCategories = categoryService.findRootCategories();
        req.setAttribute("categories", listCategories);

        // 2. Điều hướng xử lý
        if (url.contains("detail")) {
            productDetail(req, resp);
        } else if (url.contains("category")) {
            listByCategory(req, resp);
        } else if (url.contains("search")) {
            searchProduct(req, resp);
        } else {
            listAll(req, resp);
        }
    }

    // Hiển thị tất cả sản phẩm
    private void listAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Trong thực tế, nên dùng hàm findAll(page, pagesize) để phân trang
        List<Product> list = productService.findAll();
        req.setAttribute("products", list);
        
        // Forward về trang danh sách sản phẩm
        req.getRequestDispatcher("/views/web/product-list.jsp").forward(req, resp);
    }

    // Hiển thị sản phẩm theo danh mục
    private void listByCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cateId = req.getParameter("cid");
        
        if (cateId != null) {
            // Đã sửa: Gọi đúng hàm findByCategoryId trong Service
            List<Product> list = productService.findByCategoryId(Integer.parseInt(cateId));
            
            req.setAttribute("products", list);
            req.setAttribute("activeCate", cateId); // Để đánh dấu menu đang chọn
        } else {
            // Nếu không có cateId thì hiển thị tất cả
            List<Product> list = productService.findAll();
            req.setAttribute("products", list);
        }
        
        req.getRequestDispatcher("/views/web/product-list.jsp").forward(req, resp);
    }

    // Hiển thị chi tiết sản phẩm
    private void productDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        
        if (id != null) {
            Product product = productService.findById(Integer.parseInt(id));
            req.setAttribute("product", product);
            
            // Gợi ý: Lấy thêm sản phẩm liên quan (cùng category)
            if (product.getCategory() != null) {
                 List<Product> relatedProducts = productService.findByCategoryId(product.getCategory().getCategoryId());
                 req.setAttribute("relatedProducts", relatedProducts);
            }
            
            req.getRequestDispatcher("/views/web/product-detail.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/product");
        }
    }

    // Tìm kiếm sản phẩm
    private void searchProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        if (keyword != null && !keyword.isEmpty()) {
            // SỬA LỖI DÒNG 102: Đổi từ search() thành findByName() cho đúng với Service
            List<Product> list = productService.findByName(keyword);
            
            req.setAttribute("products", list);
            req.setAttribute("keyword", keyword); // Giữ lại từ khóa ở ô input
        } else {
            listAll(req, resp);
            return;
        }
        req.getRequestDispatcher("/views/web/product-list.jsp").forward(req, resp);
    }
}