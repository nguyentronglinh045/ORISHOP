package vn.orishop.controllers.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import vn.orishop.models.DailyStatistic;
import vn.orishop.services.IOrderService;
import vn.orishop.services.IProductService;
import vn.orishop.services.IUserService;
import vn.orishop.services.impl.OrderServiceImpl;
import vn.orishop.services.impl.ProductServiceImpl;
import vn.orishop.services.impl.UserServiceImpl;

@WebServlet(urlPatterns = {"/admin/home"})
public class AdminHomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Services
    private final IOrderService orderService = new OrderServiceImpl();
    private final IUserService userService = new UserServiceImpl();
    private final IProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        // 1. Xác định khoảng thời gian (Tháng hiện tại)
        Date startOfMonth = getStartOfMonth();
        Date endOfMonth = getEndOfMonth();

        // 2. Lấy dữ liệu cho các thẻ thống kê (Stats Cards)
        loadDashboardStats(req, startOfMonth, endOfMonth);

        // 3. Lấy dữ liệu cho biểu đồ (Chart)
        loadChartData(req, startOfMonth, endOfMonth);

        // 4. Forward về View
        req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);
    }

    // ================= HELPER METHODS: BUSINESS LOGIC =================

    private void loadDashboardStats(HttpServletRequest req, Date start, Date end) {
        // Lấy dữ liệu từ Service
        double monthlyRevenue = orderService.getTotalRevenue(start, end);
        int totalOrders = orderService.countAll();
        int pendingOrders = orderService.countByStatus("Chờ xử lý");
        int totalCustomers = userService.findAll().size(); // Lưu ý: Nên dùng count() nếu có để tối ưu
        int totalProducts = productService.count();

        // Đẩy dữ liệu vào Request
        req.setAttribute("monthlyRevenue", formatRevenue(monthlyRevenue));
        req.setAttribute("monthlyRevenueRaw", monthlyRevenue);
        req.setAttribute("totalOrders", totalOrders);
        req.setAttribute("pendingOrders", pendingOrders);
        req.setAttribute("totalCustomers", totalCustomers);
        req.setAttribute("totalProducts", totalProducts);
    }

    private void loadChartData(HttpServletRequest req, Date start, Date end) {
        List<DailyStatistic> chartData = orderService.getDailyStatistics(start, end);

        // Sử dụng StringBuilder để tạo JSON string thủ công
        StringBuilder labels = new StringBuilder("[");
        StringBuilder revenues = new StringBuilder("[");
        StringBuilder counts = new StringBuilder("[");

        for (int i = 0; i < chartData.size(); i++) {
            DailyStatistic stat = chartData.get(i);
            if (i > 0) {
                labels.append(",");
                revenues.append(",");
                counts.append(",");
            }
            // Thêm dấu nháy đơn cho labels vì là String trong JS
            labels.append("'").append(stat.getDate()).append("'");
            revenues.append(stat.getRevenue());
            counts.append(stat.getOrderCount());
        }

        labels.append("]");
        revenues.append("]");
        counts.append("]");

        req.setAttribute("chartLabels", labels.toString());
        req.setAttribute("chartRevenues", revenues.toString());
        req.setAttribute("chartOrderCounts", counts.toString());
    }

    // ================= HELPER METHODS: UTILS =================

    private Date getStartOfMonth() {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_MONTH, 1);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        return cal.getTime();
    }

    private Date getEndOfMonth() {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
        cal.set(Calendar.HOUR_OF_DAY, 23);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59);
        return cal.getTime();
    }

    private String formatRevenue(double amount) {
        if (amount >= 1_000_000_000) {
            return String.format("₫%.1fB", amount / 1_000_000_000);
        } else if (amount >= 1_000_000) {
            return String.format("₫%.1fM", amount / 1_000_000);
        } else if (amount >= 1_000) {
            return String.format("₫%.1fK", amount / 1_000);
        } else {
            NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));
            return "₫" + nf.format(amount);
        }
    }
}