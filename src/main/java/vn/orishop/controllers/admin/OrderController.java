package vn.orishop.controllers.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import vn.orishop.entity.Order;
import vn.orishop.services.IOrderService;
import vn.orishop.services.impl.OrderServiceImpl;

@WebServlet(urlPatterns = { "/admin/orders", "/admin/order/update",
        "/admin/order/edit", "/admin/order/delete", "/admin/order/reset" })
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
            List<Order> list = orderService.findAll();
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
            Order order = orderService.findById(Integer.parseInt(id));
            
            // Đẩy đối tượng ra view
            request.setAttribute("order", order);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) {
        try {
            // Khởi tạo đối tượng
            Order order = new Order();
            
            // Map dữ liệu từ form vào entity 
            BeanUtils.populate(order, request.getParameterMap());

            // Gọi hàm update trong service
            orderService.update(order);

            request.setAttribute("order", order);
            request.setAttribute("message", "Cập nhật đơn hàng thành công!");
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
            orderService.delete(Integer.parseInt(id));
            
            request.setAttribute("message", "Đã xóa đơn hàng thành công");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }
}