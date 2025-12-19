package vn.orishop.models;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO để chứa thống kê doanh thu theo ngày
 * Dùng cho biểu đồ doanh thu trong Admin Dashboard
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DailyStatistic implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private String date;        // Ngày (định dạng dd/MM)
    private double revenue;     // Doanh thu trong ngày
    private long orderCount;    // Số đơn hàng trong ngày
}
