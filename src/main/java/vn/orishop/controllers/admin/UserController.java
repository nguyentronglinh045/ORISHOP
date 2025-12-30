package vn.orishop.controllers.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import vn.orishop.entity.User;
import vn.orishop.services.IUserService;
import vn.orishop.services.impl.UserServiceImpl;

@WebServlet(
        urlPatterns = {
            "/admin/users",
            "/admin/user/create",
            "/admin/user/update",
            "/admin/user/edit",
            "/admin/user/delete",
            "/admin/user/reset"
        })
public class UserController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Khởi tạo Service
    private IUserService userService = new UserServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getRequestURI();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        if (url.contains("create")) {
            request.getRequestDispatcher("/views/admin/user/add.jsp").forward(request, response);
            return;
        } else if (url.contains("delete")) {
            delete(request, response);
            User user = new User();
            request.setAttribute("user", user);
        } else if (url.contains("edit")) {
            edit(request, response);
            return; // edit function đã tự forward rồi
        } else if (url.contains("reset")) {
            User user = new User();
            request.setAttribute("user", user);
        }

        findAll(request, response);
        request.setAttribute("tag", "user");
        request.getRequestDispatcher("/views/admin/user/list.jsp").forward(request, response);
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
            request.setAttribute("user", new User());
        }

        findAll(request, response);
        request.getRequestDispatcher("/views/admin/user/list.jsp").forward(request, response);
    }

    protected void insert(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            User user = new User();
            // Đăng ký Converter để BeanUtils hiểu được kiểu Date (nếu form gửi lên ngày tháng)
            DateConverter dt = new DateConverter(null);
            dt.setPattern("yyyy-MM-dd");
            ConvertUtils.register(dt, java.util.Date.class);

            BeanUtils.populate(user, request.getParameterMap());

            // Set ngày tạo mặc định là hiện tại
            user.setCreateDate(new java.util.Date());

            userService.insert(user);
            request.setAttribute("message", "Đã thêm người dùng thành công");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    protected void findAll(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<User> list = userService.findAll();
            request.setAttribute("users", list);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    protected void edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String userId = request.getParameter("id");
            User user = userService.findById(Integer.parseInt(userId));

            request.setAttribute("user", user);
            request.getRequestDispatcher("/views/admin/user/edit.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) {
        try {
            String userId = request.getParameter("id");
            userService.delete(Integer.parseInt(userId));
            request.setAttribute("message", "Đã xóa người dùng thành công");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            User user = new User();

            // Đăng ký Converter Date cho BeanUtils
            DateConverter dt = new DateConverter(null);
            dt.setPattern("yyyy-MM-dd");
            ConvertUtils.register(dt, java.util.Date.class);

            BeanUtils.populate(user, request.getParameterMap());

            // 1. SỬA LỖI DÒNG 137: getId() -> getUserId()
            User oldUser = userService.findById(user.getUserId());

            // Xử lý logic mật khẩu
            if (user.getPassword() == null || user.getPassword().trim().isEmpty()) {
                user.setPassword(oldUser.getPassword());
            }

            // 2. SỬA LỖI DÒNG 145: getCreatedDate() -> getCreateDate()
            if (oldUser.getCreateDate() != null) {
                // 3. SỬA LỖI DÒNG 146: setCreatedDate() -> setCreateDate()
                user.setCreateDate(oldUser.getCreateDate());
            }

            userService.update(user);
            request.setAttribute("user", user);
            request.setAttribute("message", "Cập nhật người dùng thành công!");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }
}
