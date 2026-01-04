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

@WebServlet(urlPatterns = { "/admin/home" })
public class AdminHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IOrderService orderService = new OrderServiceImpl();
	private IUserService userService = new UserServiceImpl();
	private IProductService productService = new ProductServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

// ===================== THỐNG KÊ CHO STATS CARDS =====================

// Tính khoảng thời gian tháng hiện tại (ngày 1 -> ngày cuối tháng)
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		Date startOfMonth = cal.getTime();

		cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		Date endOfMonth = cal.getTime();

// Doanh thu tháng này (chỉ đơn "Đã giao")
		double monthlyRevenue = orderService.getTotalRevenue(startOfMonth, endOfMonth);

// Tổng số đơn hàng
		int totalOrders = orderService.countAll();

// Số đơn chờ xử lý
		int pendingOrders = orderService.countByStatus("Chờ xử lý");

// Tổng số khách hàng
		int totalCustomers = userService.findAll().size();

// Tổng số sản phẩm
		int totalProducts = productService.count();

// Format doanh thu (VD: 128,400,000 -> "128.4M")
		String formattedRevenue = formatRevenue(monthlyRevenue);

// Set attributes cho stats cards
		req.setAttribute("monthlyRevenue", formattedRevenue);
		req.setAttribute("monthlyRevenueRaw", monthlyRevenue);
		req.setAttribute("totalOrders", totalOrders);
		req.setAttribute("pendingOrders", pendingOrders);
		req.setAttribute("totalCustomers", totalCustomers);
		req.setAttribute("totalProducts", totalProducts);

// ===================== DỮ LIỆU CHO BIỂU ĐỒ (INITIAL LOAD) =====================

// Lấy dữ liệu tháng hiện tại cho biểu đồ (đủ các ngày trong tháng)
		List<DailyStatistic> chartData = orderService.getDailyStatistics(startOfMonth, endOfMonth);

// Chuẩn bị mảng labels, revenues, orderCounts dạng JSON string cho JS
		StringBuilder labelsBuilder = new StringBuilder("[");
		StringBuilder revenuesBuilder = new StringBuilder("[");
		StringBuilder orderCountsBuilder = new StringBuilder("[");

		for (int i = 0; i < chartData.size(); i++) {
			DailyStatistic stat = chartData.get(i);
			if (i > 0) {
				labelsBuilder.append(",");
				revenuesBuilder.append(",");
				orderCountsBuilder.append(",");
			}
			labelsBuilder.append("'").append(stat.getDate()).append("'");
			revenuesBuilder.append(stat.getRevenue());
			orderCountsBuilder.append(stat.getOrderCount());
		}

		labelsBuilder.append("]");
		revenuesBuilder.append("]");
		orderCountsBuilder.append("]");

		req.setAttribute("chartLabels", labelsBuilder.toString());
		req.setAttribute("chartRevenues", revenuesBuilder.toString());
		req.setAttribute("chartOrderCounts", orderCountsBuilder.toString());

		req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);
	}

	/** Format số tiền thành dạng ngắn gọn (VD: 128,400,000 -> "₫128.4M") */
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
