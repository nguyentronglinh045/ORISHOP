package vn.orishop.controllers.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import vn.orishop.entity.Order;
import vn.orishop.services.IOrderService;
import vn.orishop.services.impl.OrderServiceImpl;

@WebServlet(
        urlPatterns = {
            "/admin/orders",
            "/admin/order/update",
            "/admin/order/edit",
            "/admin/order/delete",
            "/admin/order/reset"
        })
public class OrderController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    // Khởi tạo Service
    private IOrderService orderService = new OrderServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy url
        String url = request.getRequestURI();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        if (url.contains("delete")) {
            delete(request, response);
            // Reset object
            Order order = new Order();
            request.setAttribute("order", order);
        } else if (url.contains("edit")) {
            edit(request, response);
            request.getRequestDispatcher("/views/admin/order/edit.jsp").forward(request, response);
            return;
        } else if (url.contains("reset")) {
            Order order = new Order();
            request.setAttribute("order", order);
        }

        // Gọi hàm findAll để lấy thông tin từ entity
        findAll(request, response);
        request.setAttribute("tag", "order");
        request.getRequestDispatcher("/views/admin/order/list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy url
        String url = request.getRequestURI();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Kiểm tra url rồi chuyển đến hàm tương ứng
        if (url.contains("update")) {
            update(request, response);
        } else if (url.contains("delete")) {
            delete(request, response);
        } else if (url.contains("reset")) {
            request.setAttribute("order", new Order());
        }

        // Gọi hàm findAll để lấy thông tin mới nhất
        findAll(request, response);
        request.getRequestDispatcher("/views/admin/order/list.jsp").forward(request, response);
    }

    protected void findAll(HttpServletRequest request, HttpServletResponse response) {
        try {
            // Gọi hàm findAll() trong service
            List<Order> list = orderService.findAll(); //
            // Đẩy list ra view
            request.setAttribute("orders", list);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    protected void edit(HttpServletRequest request, HttpServletResponse response) {
        try {
            // Lấy id từ param
            String id = request.getParameter("id");

            // Gọi service tìm theo ID
            Order order = orderService.findById(Integer.parseInt(id)); //

            // Đẩy đối tượng ra view
            request.setAttribute("order", order);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    // [CẬP NHẬT QUAN TRỌNG] Sửa logic hàm update để không làm mất thông tin User
    protected void update(HttpServletRequest request, HttpServletResponse response) {
        try {
            // 1. Lấy ID từ form (đảm bảo edit.jsp có input hidden name="orderId")
            String orderIdStr = request.getParameter("orderId");
            int orderId = Integer.parseInt(orderIdStr);

            // 2. Tìm đơn hàng CŨ trong database (để giữ lại thông tin User và OrderDetails)
            Order oldOrder = orderService.findById(orderId); //

            if (oldOrder != null) {
                // 3. Chỉ cập nhật những thông tin thay đổi từ form Admin
                // (Status, Address, Phone - KHÔNG dùng BeanUtils.populate để tránh ghi đè null lên
                // User)
                String status = request.getParameter("status");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");

                if (status != null) oldOrder.setStatus(status);
                if (address != null) oldOrder.setAddress(address);
                if (phone != null) oldOrder.setPhone(phone);

                // 4. Lưu lại
                orderService.update(oldOrder); //

                request.setAttribute("order", oldOrder);
                request.setAttribute("message", "Cập nhật trạng thái đơn hàng thành công!");
            } else {
                request.setAttribute("error", "Không tìm thấy đơn hàng!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) {
        try {
            // Lấy id từ param
            String id = request.getParameter("id");

            // Gọi hàm delete trong service
            orderService.delete(Integer.parseInt(id)); //

            request.setAttribute("message", "Đã xóa đơn hàng thành công");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }
}
