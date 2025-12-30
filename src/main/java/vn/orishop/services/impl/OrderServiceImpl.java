package vn.orishop.services.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import vn.orishop.dao.IOrderDao;
import vn.orishop.dao.impl.OrderDaoImpl;
import vn.orishop.entity.Order;
import vn.orishop.models.DailyStatistic;
import vn.orishop.services.IOrderService;

public class OrderServiceImpl implements IOrderService {

    // Gọi DAO để thao tác CSDL
    IOrderDao orderDao = new OrderDaoImpl();
    
    // Trạng thái đơn hàng hoàn thành (dùng để tính doanh thu)
    private static final String STATUS_COMPLETED = "Đã giao";

    @Override
    public void insert(Order order) {
        orderDao.insert(order);
    }

    @Override
    public void update(Order order) {
        orderDao.update(order);
    }

    @Override
    public void delete(int id) {
        orderDao.delete(id);
    }

    @Override
    public Order findById(int id) {
        return orderDao.findById(id);
    }

    @Override
    public List<Order> findAll() {
        return orderDao.findAll();
    }

    @Override
    public List<Order> findByUserId(int userId) {
        return orderDao.findByUserId(userId);
    }
    
    // ===================== THỐNG KÊ DOANH THU =====================
    
    @Override
    public double getTotalRevenue(Date startDate, Date endDate) {
        return orderDao.getTotalRevenue(startDate, endDate, STATUS_COMPLETED);
    }
    
    @Override
    public List<DailyStatistic> getDailyStatistics(Date startDate, Date endDate) {
        List<Object[]> rawData = orderDao.getDailyStatistics(startDate, endDate, STATUS_COMPLETED);
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM");
        
        // Tạo map để tra cứu dữ liệu theo ngày
        Map<String, DailyStatistic> dataMap = new HashMap<>();
        for (Object[] row : rawData) {
            // Native query có thể trả về java.sql.Date hoặc java.util.Date
            Date date;
            if (row[0] instanceof java.sql.Date) {
                date = new Date(((java.sql.Date) row[0]).getTime());
            } else if (row[0] instanceof java.sql.Timestamp) {
                date = new Date(((java.sql.Timestamp) row[0]).getTime());
            } else {
                date = (Date) row[0];
            }
            
            Double revenue = row[1] != null ? ((Number) row[1]).doubleValue() : 0.0;
            Long orderCount = row[2] != null ? ((Number) row[2]).longValue() : 0L;
            
            String dateKey = sdf.format(date);
            dataMap.put(dateKey, new DailyStatistic(dateKey, revenue, orderCount));
        }
        
        // Tạo danh sách đầy đủ các ngày (kể cả ngày không có dữ liệu)
        List<DailyStatistic> result = new ArrayList<>();
        Calendar cal = Calendar.getInstance();
        cal.setTime(startDate);
        
        while (!cal.getTime().after(endDate)) {
            String dateKey = sdf.format(cal.getTime());
            if (dataMap.containsKey(dateKey)) {
                result.add(dataMap.get(dateKey));
            } else {
                // Ngày không có đơn hàng -> thêm giá trị 0
                result.add(new DailyStatistic(dateKey, 0.0, 0L));
            }
            cal.add(Calendar.DAY_OF_MONTH, 1);
        }
        
        return result;
    }
    
    @Override
    public int countAll() {
        return orderDao.countByStatus(null);
    }
    
    @Override
    public int countByStatus(String status) {
        return orderDao.countByStatus(status);
    }
}