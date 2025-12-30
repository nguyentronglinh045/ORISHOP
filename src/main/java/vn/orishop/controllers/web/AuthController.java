package vn.orishop.controllers.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import vn.orishop.entity.User;
import vn.orishop.services.IUserService;
import vn.orishop.services.impl.UserServiceImpl;
import vn.orishop.utils.Constant;

// [SỬA LỖI] Đã xóa "/forgot-password" để tránh xung đột
@WebServlet(urlPatterns = {"/login", "/register", "/logout"})
public class AuthController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Gọi Service
    IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String url = req.getRequestURI();

        if (url.contains("login")) {
            req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
        } else if (url.contains("register")) {
            req.getRequestDispatcher("/views/web/register.jsp").forward(req, resp);
        } else if (url.contains("logout")) {
            HttpSession session = req.getSession();
            session.removeAttribute("account"); // Xóa session user

            // Xóa cookie nhớ mật khẩu nếu có
            Cookie[] cookies = req.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (Constant.COOKIE_REMEMBER.equals(cookie.getName())) {
                        cookie.setMaxAge(0); // Xóa cookie
                        resp.addCookie(cookie);
                        break;
                    }
                }
            }
            resp.sendRedirect(req.getContextPath() + "/home");
        }
        // [ĐÃ XÓA] Logic forgot-password cũ đã được chuyển sang Controller mới
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String url = req.getRequestURI();
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        if (url.contains("login")) {
            login(req, resp);
        } else if (url.contains("register")) {
            register(req, resp);
        }
    }

    protected void login(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember"); // Checkbox nhớ mật khẩu

        // Gọi service kiểm tra đăng nhập
        User user = userService.login(username, password);

        if (user != null) {
            // Đăng nhập thành công -> Lưu vào Session
            HttpSession session = req.getSession(true);
            session.setAttribute("account", user);

            // Xử lý Remember Me (Lưu cookie)
            if (remember != null) {
                Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, username);
                cookie.setMaxAge(60 * 60 * 24); // 1 ngày
                resp.addCookie(cookie);
            }

            // Chuyển hướng dựa trên Role (1: Admin, 0: User)
            if (user.getRole() == 1) {
                resp.sendRedirect(req.getContextPath() + "/admin/home");
            } else {
                resp.sendRedirect(req.getContextPath() + "/home");
            }
        } else {
            // Đăng nhập thất bại
            req.setAttribute("alert", "Tên đăng nhập hoặc mật khẩu không đúng!");
            req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
        }
    }

    protected void register(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            User user = new User();

            // Đăng ký Converter Date cho BeanUtils để tránh lỗi nếu form có gửi ngày tháng
            DateConverter dt = new DateConverter(null);
            dt.setPattern("yyyy-MM-dd");
            ConvertUtils.register(dt, java.util.Date.class);

            // Map dữ liệu từ form đăng ký (username, password, fullname, email)
            BeanUtils.populate(user, req.getParameterMap());

            // Kiểm tra username đã tồn tại chưa
            if (userService.findByUsername(user.getUsername()) != null) {
                req.setAttribute("alert", "Tên đăng nhập đã tồn tại!");
                req.getRequestDispatcher("/views/web/register.jsp").forward(req, resp);
                return;
            }

            // Set mặc định role là User (0) và ngày tạo
            user.setRole(0);
            user.setCreateDate(new java.util.Date());

            userService.insert(user);

            req.setAttribute("alert", "Đăng ký thành công! Vui lòng đăng nhập.");
            req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("alert", "Lỗi hệ thống: " + e.getMessage());
            req.getRequestDispatcher("/views/web/register.jsp").forward(req, resp);
        }
    }
}
