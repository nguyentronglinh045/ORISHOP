package vn.orishop.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "order_details")
public class OrderDetail implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "orderDetailId")
    private int orderDetailId;

    @Column(name = "quantity")
    private int quantity; // Số lượng mua

    @Column(name = "unitPrice")
    private double unitPrice; // Giá tiền tại thời điểm mua (quan trọng để lưu lịch sử giá)

    // Quan hệ Many-to-One với Order: Một chi tiết thuộc về một hóa đơn
    @ManyToOne
    @JoinColumn(name = "orderId")
    private Order order;

    // Quan hệ Many-to-One với Product: Một chi tiết chứa một sản phẩm
    @ManyToOne
    @JoinColumn(name = "productId")
    private Product product;
}