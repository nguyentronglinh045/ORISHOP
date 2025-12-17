package vn.orishop.controllers.web;

import java.io.IOException;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.orishop.entity.User;
import vn.orishop.services.IUserService;
import vn.orishop.services.impl.UserServiceImpl;
import vn.orishop.utils.EmailUtils;

@WebServlet(urlPatterns = { "/forgot-password", "/verify-otp", "/reset-password" })
public class ForgotPasswordController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        if (url.contains("forgot-password")) {
            req.getRequestDispatcher("/views/web/forgot-password.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        HttpSession session = req.getSession();

        if (url.contains("forgot-password")) {
            // Bước 1: Nhập Email và gửi OTP
            String email = req.getParameter("email");
            User user = userService.findByEmail(email);

            if (user == null) {
                req.setAttribute("error", "Email không tồn tại trong hệ thống!");
                req.getRequestDispatcher("/views/web/forgot-password.jsp").forward(req, resp);
                return;
            }

            // Tạo OTP ngẫu nhiên 6 số
            String otp = String.format("%06d", new Random().nextInt(999999));
            
            try {
                EmailUtils.send(email, "Mã xác thực quên mật khẩu - ORISHOP", 
                        "<h3>Mã OTP của bạn là: <span style='color:red'>" + otp + "</span></h3>"
                        + "<p>Mã này sẽ hết hạn trong 5 phút.</p>");
                
                // Lưu OTP và Email vào Session để kiểm tra sau
                session.setAttribute("otp", otp);
                session.setAttribute("resetEmail", email);
                session.setAttribute("otpTime", System.currentTimeMillis());

                req.setAttribute("message", "Mã OTP đã được gửi đến email của bạn.");
                req.setAttribute("step", "verify"); // Chuyển sang bước nhập OTP
                req.getRequestDispatcher("/views/web/forgot-password.jsp").forward(req, resp);

            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("error", "Lỗi gửi email! Vui lòng thử lại.");
                req.getRequestDispatcher("/views/web/forgot-password.jsp").forward(req, resp);
            }

        } else if (url.contains("verify-otp")) {
            // Bước 2: Xác thực OTP
            String inputOtp = req.getParameter("otp");
            String sessionOtp = (String) session.getAttribute("otp");
            Long otpTime = (Long) session.getAttribute("otpTime");

            if (sessionOtp != null && sessionOtp.equals(inputOtp)) {
                // Kiểm tra hết hạn (ví dụ 5 phút)
                if (System.currentTimeMillis() - otpTime > 5 * 60 * 1000) {
                    req.setAttribute("error", "Mã OTP đã hết hạn!");
                    req.setAttribute("step", "verify");
                    req.getRequestDispatcher("/views/web/forgot-password.jsp").forward(req, resp);
                    return;
                }
                
                req.setAttribute("step", "reset"); // Chuyển sang bước nhập mật khẩu mới
                req.getRequestDispatcher("/views/web/forgot-password.jsp").forward(req, resp);
            } else {
                req.setAttribute("error", "Mã OTP không chính xác!");
                req.setAttribute("step", "verify");
                req.getRequestDispatcher("/views/web/forgot-password.jsp").forward(req, resp);
            }

        } else if (url.contains("reset-password")) {
            // Bước 3: Đổi mật khẩu
            String newPassword = req.getParameter("password");
            String confirmPassword = req.getParameter("confirmPassword");
            String email = (String) session.getAttribute("resetEmail");

            if (!newPassword.equals(confirmPassword)) {
                req.setAttribute("error", "Mật khẩu xác nhận không khớp!");
                req.setAttribute("step", "reset");
                req.getRequestDispatcher("/views/web/forgot-password.jsp").forward(req, resp);
                return;
            }

            if (email != null) {
                User user = userService.findByEmail(email);
                if (user != null) {
                    user.setPassword(newPassword); // Cần mã hóa nếu hệ thống dùng BCrypt
                    userService.update(user);
                    
                    // Xóa session
                    session.removeAttribute("otp");
                    session.removeAttribute("resetEmail");
                    session.removeAttribute("otpTime");

                    req.setAttribute("message", "Đổi mật khẩu thành công! Vui lòng đăng nhập.");
                    req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
                }
            }
        }
    }
}