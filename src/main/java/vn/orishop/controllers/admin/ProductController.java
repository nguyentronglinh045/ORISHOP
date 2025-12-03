package vn.orishop.controllers.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import vn.orishop.entity.Category;
import vn.orishop.entity.Product;
import vn.orishop.services.ICategoryService;
import vn.orishop.services.IProductService;
import vn.orishop.services.impl.CategoryServiceImpl;
import vn.orishop.services.impl.ProductServiceImpl;
import vn.orishop.utils.Constant;
import vn.orishop.utils.UploadUtils;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(urlPatterns = { "/admin/products", "/admin/product/create", "/admin/product/update",
        "/admin/product/edit", "/admin/product/delete", "/admin/product/reset" })
public class ProductController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    // Khởi tạo Service
    private IProductService productService = new ProductServiceImpl();
    private ICategoryService categoryService = new CategoryServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getRequestURI();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        if (url.contains("create")) {
            List<Category> listCate = categoryService.findAll();
            request.setAttribute("listCate", listCate);
            request.getRequestDispatcher("/views/admin/product/add.jsp").forward(request, response);
            return;
        } else if (url.contains("delete")) {
            delete(request, response); // Gọi hàm xóa thông minh
        } else if (url.contains("edit")) {
            edit(request, response);
            return;
        } else if (url.contains("reset")) {
            request.setAttribute("product", new Product());
        }

        // Sau khi xóa hoặc reset, load lại danh sách
        findAll(request, response);
        request.setAttribute("tag", "product");
        request.getRequestDispatcher("/views/admin/product/list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getRequestURI();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        if (url.contains("create")) {
            insert(request, response);
        } else if (url.contains("update")) {
            update(request, response);
        } else if (url.contains("delete")) {
            delete(request, response);
        } else if (url.contains("reset")) {
            request.setAttribute("product", new Product());
        }

        findAll(request, response);
        request.getRequestDispatcher("/views/admin/product/list.jsp").forward(request, response);
    }

    protected void insert(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Product product = new Product();
            BeanUtils.populate(product, request.getParameterMap());

            // Set Category
            String categoryId = request.getParameter("categoryId");
            if(categoryId != null && !categoryId.isEmpty()) {
                Category category = categoryService.findById(Integer.parseInt(categoryId));
                product.setCategory(category);
            }

            // Upload ảnh (Dùng "/" cho đường dẫn web)
            String fileName = "product" + System.currentTimeMillis();
            String savedFileName = UploadUtils.processUpload("image", request, Constant.DIR + "/product", fileName);
            product.setImage(savedFileName);

            productService.insert(product);
            request.setAttribute("message", "Đã thêm sản phẩm thành công");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi thêm sản phẩm: " + e.getMessage());
        }
    }

    protected void findAll(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Product> list = productService.findAll();
            request.setAttribute("products", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            if (id != null) {
                Product product = productService.findById(Integer.parseInt(id));
                List<Category> listCate = categoryService.findAll();
                
                request.setAttribute("listCate", listCate);
                request.setAttribute("product", product);
                
                request.getRequestDispatcher("/views/admin/product/edit.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/products");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi tải sản phẩm: " + e.getMessage());
            findAll(request, response);
            request.getRequestDispatcher("/views/admin/product/list.jsp").forward(request, response);
        }
    }

    // HÀM XÓA THÔNG MINH (Smart Delete)
    protected void delete(HttpServletRequest request, HttpServletResponse response) {
        try {
            String idStr = request.getParameter("id");
            int id = Integer.parseInt(idStr);
            
            // Thử xóa cứng trong DB
            try {
                productService.delete(id);
                request.setAttribute("message", "Đã xóa sản phẩm hoàn toàn khỏi hệ thống.");
            } catch (Exception e) {
                // Nếu xóa thất bại (do dính khóa ngoại OrderDetail), chuyển sang xóa mềm (Ẩn đi)
                Product p = productService.findById(id);
                if (p != null) {
                    p.setActive(false); // Chuyển trạng thái thành Ngừng bán
                    productService.update(p);
                    request.setAttribute("message", "Sản phẩm đã có đơn hàng, hệ thống đã chuyển sang trạng thái 'Ngừng bán'!");
                } else {
                    request.setAttribute("error", "Lỗi: Không tìm thấy sản phẩm.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống: " + e.getMessage());
        }
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) {
        try {
            Product product = new Product();
            BeanUtils.populate(product, request.getParameterMap());

            // Set Category
            String categoryId = request.getParameter("categoryId");
            if(categoryId != null && !categoryId.isEmpty()) {
                Category category = categoryService.findById(Integer.parseInt(categoryId));
                product.setCategory(category);
            }
            
            // Xử lý ảnh cập nhật
            Product oldProduct = productService.findById(product.getProductId());
            
            // Nếu người dùng không chọn ảnh mới (size = 0) -> Giữ ảnh cũ
            if (request.getPart("image").getSize() == 0) {
                product.setImage(oldProduct.getImage());
            } else {
                // Có ảnh mới -> Xóa ảnh cũ & Lưu ảnh mới
                if (oldProduct.getImage() != null && !oldProduct.getImage().isEmpty()) {
                    String fname = oldProduct.getImage();
                    String deletePath = request.getServletContext().getRealPath(Constant.DIR + "/product/" + fname);
                    File file = new File(deletePath);
                    file.delete();
                }
                
                String fileName = "product" + System.currentTimeMillis();
                String savedFileName = UploadUtils.processUpload("image", request, Constant.DIR + "/product", fileName);
                product.setImage(savedFileName);
            }

            productService.update(product);
            request.setAttribute("product", product);
            request.setAttribute("listCate", categoryService.findAll()); // Load lại danh mục để dropdown không rỗng
            request.setAttribute("message", "Cập nhật sản phẩm thành công!");
            
            // Forward lại trang edit để xem kết quả
            request.getRequestDispatcher("/views/admin/product/edit.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi cập nhật: " + e.getMessage());
            findAll(request, response);
            try {
                request.getRequestDispatcher("/views/admin/product/list.jsp").forward(request, response);
            } catch (Exception ex) { ex.printStackTrace(); }
        }
    }
}