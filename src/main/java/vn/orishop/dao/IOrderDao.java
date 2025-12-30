package vn.orishop.dao;

import java.util.Date;
import java.util.List;
import vn.orishop.entity.Order;

public interface IOrderDao {
    void insert(Order order);

    void update(Order order);

    void delete(Object id);

    Order findById(Object id);

    List<Order> findAll();

    int count();

    // Hàm tìm đơn hàng theo ID người dùng
    List<Order> findByUserId(int userId);

    // ===================== THỐNG KÊ DOANH THU =====================

    /**
     * Tính tổng doanh thu trong khoảng thời gian với trạng thái cụ thể
     *
     * @param startDate Ngày bắt đầu
     * @param endDate Ngày kết thúc
     * @param status Trạng thái đơn hàng (vd: "Đã giao"), null để lấy tất cả
     * @return Tổng doanh thu
     */
    double getTotalRevenue(Date startDate, Date endDate, String status);

    /**
     * Lấy thống kê doanh thu và số đơn hàng theo từng ngày
     *
     * @param startDate Ngày bắt đầu
     * @param endDate Ngày kết thúc
     * @param status Trạng thái đơn hàng, null để lấy tất cả
     * @return List các Object[] với [0]=Date, [1]=totalRevenue, [2]=orderCount
     */
    List<Object[]> getDailyStatistics(Date startDate, Date endDate, String status);

    /**
     * Đếm số đơn hàng theo trạng thái
     *
     * @param status Trạng thái đơn hàng, null để đếm tất cả
     * @return Số lượng đơn hàng
     */
    int countByStatus(String status);
}
