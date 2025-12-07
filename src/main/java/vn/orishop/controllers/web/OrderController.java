package vn.orishop.controllers.web;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.orishop.entity.Order;
import vn.orishop.entity.OrderDetail;
import vn.orishop.entity.User;
import vn.orishop.models.CartItem;
import vn.orishop.services.IOrderDetailService;
import vn.orishop.services.IOrderService;
import vn.orishop.services.impl.OrderDetailServiceImpl;
import vn.orishop.services.impl.OrderServiceImpl;

// [FIX] Thêm urlPatterns /order/history và /order/detail
@WebServlet(urlPatterns = { "/order/checkout", "/order/success", "/order/history", "/order/detail" })
public class OrderController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    IOrderService orderService = new OrderServiceImpl();
    IOrderDetailService orderDetailService = new OrderDetailServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        
        // Kiểm tra đăng nhập trước khi xem lịch sử
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("account");

        if (url.contains("history")) {
            // 1. Xử lý trang Lịch sử đơn hàng
            if (user == null) {
                resp.sendRedirect(req.getContextPath() + "/login");
                return;
            }
            
            // Lấy danh sách đơn hàng của user đó
            List<Order> list = orderService.findByUserId(user.getUserId());
            req.setAttribute("orders", list);
            
            req.getRequestDispatcher("/views/web/history.jsp").forward(req, resp);
            
        } else if (url.contains("detail")) {
            // 2. Xử lý trang Chi tiết đơn hàng
            if (user == null) {
                resp.sendRedirect(req.getContextPath() + "/login");
                return;
            }
            
            String idStr = req.getParameter("id");
            if (idStr != null) {
                int orderId = Integer.parseInt(idStr);
                Order order = orderService.findById(orderId);
                
                // Kiểm tra bảo mật: User chỉ xem được đơn của chính mình
                if (order != null && order.getUser().getUserId() == user.getUserId()) {
                    List<OrderDetail> details = orderDetailService.findByOrderId(orderId);
                    req.setAttribute("order", order);
                    req.setAttribute("details", details);
                    req.getRequestDispatcher("/views/web/history-detail.jsp").forward(req, resp);
                } else {
                    resp.sendRedirect(req.getContextPath() + "/order/history");
                }
            } else {
                resp.sendRedirect(req.getContextPath() + "/order/history");
            }
            
        } else if (url.contains("success")) {
            // 3. Trang thông báo đặt hàng thành công
            req.getRequestDispatcher("/views/web/order-success.jsp").forward(req, resp);
        } else if (url.contains("checkout")) {
            // 4. Trang thanh toán (nếu truy cập trực tiếp bằng GET)
            req.getRequestDispatcher("/views/web/checkout.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        
        if (url.contains("checkout")) {
            checkout(req, resp);
        }
    }

    protected void checkout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        HttpSession session = req.getSession();
        
        // 1. Kiểm tra giỏ hàng
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/cart");
            return;
        }

        // 2. Kiểm tra đăng nhập
        User user = (User) session.getAttribute("account");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // 3. Lấy thông tin giao hàng
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");

        // 4. Tính tổng tiền
        double totalAmount = 0;
        for (CartItem item : cart.values()) {
            totalAmount += item.getTotalPrice();
        }

        // 5. Tạo Order
        Order order = new Order();
        order.setUser(user);
        order.setAddress(address);
        order.setPhone(phone);
        order.setStatus("Chờ xử lý");
        order.setOrderDate(new Date());
        order.setAmount(totalAmount);

        orderService.insert(order);

        // 6. Tạo OrderDetail
        for (CartItem item : cart.values()) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrder(order);
            orderDetail.setProduct(item.getProduct());
            orderDetail.setQuantity(item.getQuantity());
            orderDetail.setUnitPrice(item.getUnitPrice());
            
            orderDetailService.insert(orderDetail);
        }

        // 7. Xóa giỏ hàng và chuyển hướng
        session.removeAttribute("cart");
        resp.sendRedirect(req.getContextPath() + "/order/success");
    }
}