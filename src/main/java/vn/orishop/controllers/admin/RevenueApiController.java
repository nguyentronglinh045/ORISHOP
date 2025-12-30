package vn.orishop.controllers.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.orishop.models.DailyStatistic;
import vn.orishop.services.IOrderService;
import vn.orishop.services.impl.OrderServiceImpl;

/**
 * API Controller để trả về dữ liệu thống kê doanh thu dạng JSON
 * Dùng cho biểu đồ trong Admin Dashboard
 */
@WebServlet(urlPatterns = { "/api/revenue" })
public class RevenueApiController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private IOrderService orderService = new OrderServiceImpl();
    private Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Set response type là JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        
        // Lấy tham số period (week, month)
        String period = req.getParameter("period");
        if (period == null || period.isEmpty()) {
            period = "month"; // Mặc định là tháng hiện tại
        }
        
        // Tính khoảng thời gian dựa trên period
        Date[] dateRange = calculateDateRange(period);
        Date startDate = dateRange[0];
        Date endDate = dateRange[1];
        
        // Lấy dữ liệu thống kê từ service
        List<DailyStatistic> statistics = orderService.getDailyStatistics(startDate, endDate);
        double totalRevenue = orderService.getTotalRevenue(startDate, endDate);
        
        // Tạo response object
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("statistics", statistics);
        responseData.put("totalRevenue", totalRevenue);
        responseData.put("period", period);
        
        // Trả về JSON
        PrintWriter out = resp.getWriter();
        out.print(gson.toJson(responseData));
        out.flush();
    }
    
    /**
     * Tính khoảng thời gian dựa trên loại period
     * @param period week, month, quarter
     * @return mảng [startDate, endDate]
     */
    private Date[] calculateDateRange(String period) {
        Calendar cal = Calendar.getInstance();
        Date startDate, endDate;
        
        switch (period.toLowerCase()) {
            case "week":
                // Tuần: Thứ 2 -> Chủ nhật của tuần hiện tại (theo chuẩn ISO và phổ biến ở VN)
                // Calendar.DAY_OF_WEEK: 1=Sunday, 2=Monday, ..., 7=Saturday
                int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
                
                // Tính số ngày cần lùi để về thứ 2
                // Nếu là Chủ nhật (1), lùi 6 ngày; Thứ 2 (2) lùi 0 ngày; Thứ 3 (3) lùi 1 ngày...
                int daysToMonday = (dayOfWeek == Calendar.SUNDAY) ? 6 : (dayOfWeek - Calendar.MONDAY);
                cal.add(Calendar.DAY_OF_MONTH, -daysToMonday);
                cal.set(Calendar.HOUR_OF_DAY, 0);
                cal.set(Calendar.MINUTE, 0);
                cal.set(Calendar.SECOND, 0);
                startDate = cal.getTime();
                
                // End = Chủ nhật (start + 6 ngày)
                cal.add(Calendar.DAY_OF_MONTH, 6);
                cal.set(Calendar.HOUR_OF_DAY, 23);
                cal.set(Calendar.MINUTE, 59);
                cal.set(Calendar.SECOND, 59);
                endDate = cal.getTime();
                break;
                
            case "month":
            default:
                // Tháng: Ngày 1 -> ngày cuối tháng hiện tại
                cal.set(Calendar.DAY_OF_MONTH, 1);
                cal.set(Calendar.HOUR_OF_DAY, 0);
                cal.set(Calendar.MINUTE, 0);
                cal.set(Calendar.SECOND, 0);
                startDate = cal.getTime();
                
                // End = ngày cuối tháng
                cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
                cal.set(Calendar.HOUR_OF_DAY, 23);
                cal.set(Calendar.MINUTE, 59);
                cal.set(Calendar.SECOND, 59);
                endDate = cal.getTime();
                break;
        }
        
        return new Date[] { startDate, endDate };
    }
}
