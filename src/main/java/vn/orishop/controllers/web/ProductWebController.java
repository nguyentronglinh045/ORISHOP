package vn.orishop.controllers.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.orishop.entity.Category;
import vn.orishop.entity.Product;
import vn.orishop.services.ICategoryService;
import vn.orishop.services.IProductService;
import vn.orishop.services.impl.CategoryServiceImpl;
import vn.orishop.services.impl.ProductServiceImpl;

// Đã thêm "/product/promotion" vào urlPatterns
@WebServlet(urlPatterns = { "/product", "/product/detail", "/product/category", "/product/search", "/product/promotion" })
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

        // Luôn load danh mục cho menu
        List<Category> listCategories = categoryService.findRootCategories();
        req.setAttribute("categories", listCategories);

        // 2. Điều hướng xử lý
        if (url.contains("detail")) {
            productDetail(req, resp);
        } else if (url.contains("category")) {
            listByCategory(req, resp);
        } else if (url.contains("search")) {
            searchProduct(req, resp);
        } else if (url.contains("promotion")) { // Xử lý khi bấm vào "Khuyến mãi"
            listPromotionalProducts(req, resp);
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

 // Hiển thị sản phẩm khuyến mãi
    private void listPromotionalProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // GỌI HÀM MỚI: Chỉ lấy sản phẩm có discount > 0
        List<Product> list = productService.findPromotionalProducts();
        
        req.setAttribute("products", list);
        req.setAttribute("pageTitle", "Sản phẩm Khuyến mãi");
        
        req.getRequestDispatcher("/views/web/product-list.jsp").forward(req, resp);
    }

    // Hiển thị sản phẩm theo danh mục
    private void listByCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cateId = req.getParameter("cid");
        
        if (cateId != null) {
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
            
            // --- 1. XỬ LÝ HÀNG ĐÃ XEM ---
            String recentIds = updateRecentViewedCookie(req, resp, id);
            List<Product> recentProducts = getRecentProductsFromCookie(recentIds);
            req.setAttribute("recentProducts", recentProducts);
            // ----------------------------
            
            // 2. Lấy thêm sản phẩm liên quan (cùng category)
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
            List<Product> list = productService.findByName(keyword);
            
            req.setAttribute("products", list);
            req.setAttribute("keyword", keyword); // Giữ lại từ khóa ở ô input
        } else {
            listAll(req, resp);
            return;
        }
        req.getRequestDispatcher("/views/web/product-list.jsp").forward(req, resp);
    }

    // ==========================================
    // CÁC HÀM HỖ TRỢ XỬ LÝ COOKIE HÀNG ĐÃ XEM
    // ==========================================

    private String updateRecentViewedCookie(HttpServletRequest req, HttpServletResponse resp, String currentId) {
        String txt = "";
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("recent_viewed")) {
                    txt = c.getValue();
                    break;
                }
            }
        }

        LinkedList<String> ids = new LinkedList<>();
        if (!txt.isEmpty()) {
            String[] arr = txt.split("-");
            for (String s : arr) {
                if (!s.equals(currentId)) {
                    ids.add(s);
                }
            }
        }
        
        ids.addFirst(currentId);
        
        while (ids.size() > 6) {
            ids.removeLast();
        }

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < ids.size(); i++) {
            sb.append(ids.get(i));
            if (i < ids.size() - 1) sb.append("-");
        }
        
        Cookie c = new Cookie("recent_viewed", sb.toString());
        c.setMaxAge(7 * 24 * 60 * 60);
        c.setPath("/"); 
        resp.addCookie(c);
        
        return sb.toString();
    }

    private List<Product> getRecentProductsFromCookie(String recentIds) {
        List<Product> list = new ArrayList<>();
        if (recentIds != null && !recentIds.isEmpty()) {
            String[] arr = recentIds.split("-");
            for (String sId : arr) {
                try {
                    Product p = productService.findById(Integer.parseInt(sId));
                    if (p != null) {
                        list.add(p);
                    }
                } catch (Exception e) {
                    // Bỏ qua lỗi
                }
            }
        }
        return list;
    }
}