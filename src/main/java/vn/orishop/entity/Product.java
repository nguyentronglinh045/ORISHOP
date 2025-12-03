package vn.orishop.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "products")
@NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p")
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "productId")
    private int productId;

    @Column(name = "productName", columnDefinition = "nvarchar(500) NOT NULL")
    private String productName;

    @Column(name = "price")
    private double price;

    @Column(name = "quantity")
    private int quantity;

    @Column(name = "image", columnDefinition = "nvarchar(500)")
    private String image;

    @Column(name = "description", columnDefinition = "nvarchar(MAX)")
    private String description;

    @Column(name = "active")
    private boolean active; // Trạng thái sản phẩm (còn bán hay ngừng bán)

    // Quan hệ Many-to-One với Category: Nhiều sản phẩm thuộc một danh mục
    @ManyToOne
    @JoinColumn(name = "categoryId")
    private Category category;

    // Quan hệ One-to-Many với OrderDetail: Một sản phẩm có thể xuất hiện trong nhiều đơn hàng
    // mappedBy = "product" nghĩa là bên OrderDetail có thuộc tính tên là product
    @OneToMany(mappedBy = "product")
    private List<OrderDetail> orderDetails;
}