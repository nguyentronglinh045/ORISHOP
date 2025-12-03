package vn.orishop.controllers.web;

import java.io.IOException;
import java.util.Date;
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

@WebServlet(urlPatterns = { "/order/checkout", "/order/success" })
public class OrderController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    IOrderService orderService = new OrderServiceImpl();
    IOrderDetailService orderDetailService = new OrderDetailServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        if (url.contains("success")) {
            req.getRequestDispatcher("/views/web/order-success.jsp").forward(req, resp);
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

        // 2. Kiểm tra đăng nhập (Bắt buộc phải đăng nhập mới cho đặt hàng)
        User user = (User) session.getAttribute("account");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // 3. Lấy thông tin giao hàng từ form
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        // String note = req.getParameter("note"); // Có thể lưu vào field ghi chú nếu DB có

        // 4. Tính tổng tiền
        double totalAmount = 0;
        for (CartItem item : cart.values()) {
            totalAmount += item.getTotalPrice();
        }

        // 5. Tạo đối tượng Order và lưu
        Order order = new Order();
        order.setUser(user);
        order.setAddress(address);
        order.setPhone(phone);
        order.setStatus("Chờ xử lý");
        order.setOrderDate(new Date());
        order.setAmount(totalAmount);

        orderService.insert(order); // Sau khi insert, hibernate tự update ID vào object order

        // 6. Lưu chi tiết đơn hàng (OrderDetail)
        for (CartItem item : cart.values()) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrder(order);
            orderDetail.setProduct(item.getProduct());
            orderDetail.setQuantity(item.getQuantity());
            orderDetail.setUnitPrice(item.getUnitPrice());
            
            orderDetailService.insert(orderDetail);
        }

        // 7. Xóa giỏ hàng sau khi đặt thành công
        session.removeAttribute("cart");

        // 8. Chuyển hướng trang thông báo thành công
        resp.sendRedirect(req.getContextPath() + "/order/success");
    }
}