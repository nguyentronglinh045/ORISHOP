package vn.orishop.services;

import java.util.Date;
import java.util.List;

import vn.orishop.entity.Order;
import vn.orishop.models.DailyStatistic;

public interface IOrderService {
    void insert(Order order);
    void update(Order order);
    void delete(int id);
    Order findById(int id);
    List<Order> findAll();
    
    // Tìm đơn hàng của một người dùng cụ thể
    List<Order> findByUserId(int userId);
    
    // ===================== THỐNG KÊ DOANH THU =====================
    
    /**
     * Lấy tổng doanh thu từ đơn hàng "Đã giao" trong khoảng thời gian
     */
    double getTotalRevenue(Date startDate, Date endDate);
    
    /**
     * Lấy thống kê doanh thu và số đơn hàng theo ngày (chỉ đơn "Đã giao")
     */
    List<DailyStatistic> getDailyStatistics(Date startDate, Date endDate);
    
    /**
     * Đếm tổng số đơn hàng
     */
    int countAll();
    
    /**
     * Đếm số đơn hàng theo trạng thái
     */
    int countByStatus(String status);
}