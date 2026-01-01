package vn.orishop.controllers.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import org.apache.commons.beanutils.BeanUtils;
import vn.orishop.entity.Category;
import vn.orishop.services.ICategoryService;
import vn.orishop.services.impl.CategoryServiceImpl;
import vn.orishop.utils.Constant;
import vn.orishop.utils.UploadUtils;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(
        urlPatterns = {
            "/admin/categories",
            "/admin/category/create",
            "/admin/category/update",
            "/admin/category/edit",
            "/admin/category/delete",
            "/admin/category/reset"
        })
public class CategoryController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    // Khởi tạo Service
    private ICategoryService categoryService = new CategoryServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getRequestURI();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        Category category = null;

        if (url.contains("create")) {
            // Load danh sách để chọn cha
            List<Category> list = categoryService.findAll();
            request.setAttribute("categories", list);

            request.getRequestDispatcher("/views/admin/category/add.jsp")
                    .forward(request, response);
            return;
        } else if (url.contains("delete")) {
            delete(request, response);
            category = new Category();
            request.setAttribute("category", category);
        } else if (url.contains("edit")) {
            edit(request, response);
            return;
        } else if (url.contains("reset")) {
            category = new Category();
            request.setAttribute("category", category);
        }

        findAll(request, response);
        request.setAttribute("tag", "cate");
        request.getRequestDispatcher("/views/admin/category/list.jsp").forward(request, response);
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
            request.setAttribute("category", new Category());
        }

        findAll(request, response);
        request.getRequestDispatcher("/views/admin/category/list.jsp").forward(request, response);
    }

    protected void insert(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            Category category = new Category();
            BeanUtils.populate(category, request.getParameterMap());

            // Xử lý Danh mục cha
            String parentIdStr = request.getParameter("parentId");
            if (parentIdStr != null && !parentIdStr.isEmpty()) {
                int parentId = Integer.parseInt(parentIdStr);
                Category parentCategory = categoryService.findById(parentId);
                category.setCategory(parentCategory);
            }

            // Xử lý hình ảnh
            String fileName = "cate" + System.currentTimeMillis();

            String savedFileName =
                    UploadUtils.processUpload(
                            "icon", request, Constant.DIR + "/category", fileName);
            category.setIcon(savedFileName);

            categoryService.insert(category);
            request.setAttribute("message", "Đã thêm thành công");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    protected void findAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Category> list = categoryService.findAll();
            request.setAttribute("categories", list);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    protected void edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            // Fallback nếu người dùng gõ sai url hoặc dùng link cũ
            if (id == null) {
                id = request.getParameter("categoryId");
            }

            if (id != null) {
                Category category = categoryService.findById(Integer.parseInt(id));

                // Load danh sách tất cả danh mục để hiển thị dropdown chọn cha
                List<Category> list = categoryService.findAll();
                request.setAttribute("categories", list);

                request.setAttribute("cate", category);

                request.getRequestDispatcher("/views/admin/category/edit.jsp")
                        .forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/categories");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading category: " + e.getMessage());
            findAll(request, response);
            request.getRequestDispatcher("/views/admin/category/list.jsp")
                    .forward(request, response);
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            if (id == null) id = request.getParameter("categoryId");

            categoryService.delete(Integer.parseInt(id));
            request.setAttribute("message", "Đã xóa thành công");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            Category category = new Category();
            BeanUtils.populate(category, request.getParameterMap());

            // Xử lý Danh mục cha
            String parentIdStr = request.getParameter("parentId");
            if (parentIdStr != null && !parentIdStr.isEmpty()) {
                int parentId = Integer.parseInt(parentIdStr);

                // Kiểm tra quan trọng: Không được chọn chính mình làm cha
                if (parentId != category.getCategoryId()) {
                    Category parentCategory = categoryService.findById(parentId);
                    category.setCategory(parentCategory);
                } else {
                    // Nếu cố tình chọn chính mình, set về null (gốc) hoặc giữ nguyên logic cũ
                    // Ở đây ta set về null cho an toàn
                    category.setCategory(null);
                }
            } else {
                // Nếu chọn "Là danh mục gốc" (value="")
                category.setCategory(null);
            }

            // Lấy thông tin cũ để giữ lại ảnh nếu không up mới
            Category oldCate = categoryService.findById(category.getCategoryId());

            // Xử lý hình ảnh
            if (request.getPart("icon").getSize() == 0) {
                category.setIcon(oldCate.getIcon());
            } else {
                // Nếu có ảnh mới -> Xóa ảnh cũ
                if (oldCate.getIcon() != null && !oldCate.getIcon().isEmpty()) {
                    String fname = oldCate.getIcon();
                    String deletePath =
                            request.getServletContext()
                                    .getRealPath(Constant.DIR + "/category/" + fname);
                    File file = new File(deletePath);
                    if (file.delete()) {
                        System.out.println("Đã xóa ảnh cũ: " + fname);
                    }
                }

                String fileName = "cate" + System.currentTimeMillis();
                String savedFileName =
                        UploadUtils.processUpload(
                                "icon", request, Constant.DIR + "/category", fileName);
                category.setIcon(savedFileName);
            }

            categoryService.update(category);

            // Cập nhật lại view sau khi update
            request.setAttribute("cate", category);
            // Load lại danh sách cha để dropdown không bị rỗng khi forward lại trang edit
            request.setAttribute("categories", categoryService.findAll());

            request.setAttribute("message", "Cập nhật thành công!");

            // Forward lại trang edit để người dùng thấy kết quả
            request.getRequestDispatcher("/views/admin/category/edit.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            findAll(request, response);
            request.getRequestDispatcher("/views/admin/category/list.jsp")
                    .forward(request, response);
        }
    }
}
