package vn.orishop.controllers.web;

import java.io.IOException;
import java.sql.Timestamp;
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

@WebServlet(urlPatterns = { "/payment/create", "/payment/process" })
public class PaymentController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    IOrderService orderService = new OrderServiceImpl();
    IOrderDetailService orderDetailService = new OrderDetailServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        if (url.contains("create")) {
            showFakeBankGateway(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        if (url.contains("process")) {
            processPayment(req, resp);
        }
    }

    // 1. Chuyển hướng người dùng đến trang Ngân hàng giả lập
    protected void showFakeBankGateway(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/cart");
            return;
        }

        // Tính tổng tiền
        long amount = 0;
        for (CartItem item : cart.values()) {
            amount += (long) item.getTotalPrice();
        }

        // Tạo mã giao dịch giả
        String txnRef = "NCB" + System.currentTimeMillis();

        // Lưu thông tin tạm vào Session để hiển thị bên trang ngân hàng
        session.setAttribute("tempAmount", amount);
        session.setAttribute("tempTxnRef", txnRef);

        // Chuyển hướng sang trang giao diện ngân hàng
        req.getRequestDispatcher("/views/web/bank-gateway.jsp").forward(req, resp);
    }

    // 2. Xử lý khi người dùng bấm "Xác nhận thanh toán" tại ngân hàng giả
    protected void processPayment(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        // Lúc này coi như ngân hàng đã trừ tiền thành công
        // Tiến hành lưu đơn hàng
        saveOrder(req);

        // Xóa thông tin tạm và giỏ hàng
        HttpSession session = req.getSession();
        session.removeAttribute("cart");
        session.removeAttribute("tempAmount");
        session.removeAttribute("tempTxnRef");

        // Chuyển hướng trang báo thành công
        req.setAttribute("message", "Giao dịch thành công! Ngân hàng đã xác nhận thanh toán.");
        req.getRequestDispatcher("/views/web/order-success.jsp").forward(req, resp);
    }

    // Logic lưu đơn hàng
    private void saveOrder(HttpServletRequest req) {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("account");
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        
        // Kiểm tra null an toàn trước khi ép kiểu số tiền
        Double amount = 0.0;
        Object tempAmountObj = session.getAttribute("tempAmount");
        if (tempAmountObj != null) {
            try {
                amount = Double.valueOf(tempAmountObj.toString());
            } catch (NumberFormatException e) {
                amount = 0.0;
            }
        }

        if (cart != null && !cart.isEmpty()) {
            Order order = new Order();
            if (user != null) {
                order.setUser(user);
                
                // [FIX LỖI DÒNG 113] Vì User entity chưa có field address, ta dùng địa chỉ mặc định
                // Lưu ý: Nút bấm ở checkout.jsp là thẻ <a> nên không gửi được form địa chỉ lên đây.
                String address = "Địa chỉ nhận hàng mặc định (Thanh toán Online)";
                
                String phone = (user.getPhone() != null) ? user.getPhone() : "";
                
                order.setAddress(address);
                order.setPhone(phone);
            } else {
                 order.setAddress("Khách vãng lai");
                 order.setPhone("");
            }
            
            // Set thông tin đơn hàng
            order.setOrderDate(new Timestamp(System.currentTimeMillis()));
            order.setStatus("Đã thanh toán (Online Banking)"); 
            order.setAmount(amount);

            // Lưu vào DB
            orderService.insert(order);

            // Lưu chi tiết
            for (CartItem item : cart.values()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrder(order);
                orderDetail.setProduct(item.getProduct());
                orderDetail.setQuantity(item.getQuantity());
                orderDetail.setUnitPrice(item.getUnitPrice());
                orderDetailService.insert(orderDetail);
            }
        }
    }
}