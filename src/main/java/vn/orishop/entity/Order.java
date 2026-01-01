package vn.orishop.entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "orders")
public class Order implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "orderId")
    private int orderId;

    @Column(name = "address", columnDefinition = "nvarchar(500) NOT NULL")
    private String address;

    @Column(name = "phone", columnDefinition = "varchar(15)")
    private String phone;

    @Column(name = "status", columnDefinition = "nvarchar(50)")
    private String status; // Ví dụ: Chờ xử lý, Đang giao, Đã giao, Đã hủy

    @Column(name = "orderDate")
    @Temporal(TemporalType.TIMESTAMP) // Lưu cả ngày và giờ
    private Date orderDate;

    @Column(name = "amount")
    private double amount; // Tổng tiền của đơn hàng

    // Quan hệ Many-to-One với User: Một User có thể có nhiều đơn hàng
    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;

    // Quan hệ One-to-Many với OrderDetail: Một đơn hàng có nhiều chi tiết sản phẩm
    // mappedBy = "order" nghĩa là bên OrderDetail có thuộc tính tên là order

    // [CẬP NHẬT QUAN TRỌNG]
    // cascade = CascadeType.ALL: Cho phép xóa Order thì xóa luôn OrderDetail
    // orphanRemoval = true: Xóa các chi tiết mồ côi
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<OrderDetail> orderDetails;
}
