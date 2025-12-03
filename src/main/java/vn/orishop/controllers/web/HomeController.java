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

@WebServlet(urlPatterns = { "/home", "/trang-chu" })
public class HomeController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    // Khởi tạo các Service để lấy dữ liệu
    private ICategoryService categoryService = new CategoryServiceImpl();
    private IProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Thiết lập encoding tiếng Việt
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        // 1. Lấy danh sách Category (để hiển thị Menu hoặc Sidebar lọc sản phẩm)
        List<Category> listCategories = categoryService.findAll();
        req.setAttribute("categories", listCategories);

        // 2. Lấy danh sách Product để hiển thị ở trang chủ
        // (Trong thực tế bạn có thể viết thêm hàm findTop8() hoặc findLatest() trong Service để chỉ lấy sản phẩm mới)
        List<Product> listProducts = productService.findAll();
        req.setAttribute("products", listProducts);

        // 3. Forward dữ liệu về trang JSP giao diện
        req.getRequestDispatcher("/views/web/home.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}