package vn.orishop.controllers.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin/home" })
public class AdminHomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Có thể gọi Service đếm số lượng user, product để setAttribute vào đây
        // req.setAttribute("userCount", userService.count());
        
        req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);
    }
}