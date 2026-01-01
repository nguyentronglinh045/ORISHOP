package vn.orishop.models;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.orishop.entity.Product;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItem implements Serializable {
    private int productId;
    private String productName;
    private String image;
    private int quantity;
    private double unitPrice;

    // Thuộc tính tiện ích để giữ tham chiếu Product gốc nếu cần
    private Product product;

    // Helper method để tính thành tiền của item này
    public double getTotalPrice() {
        return quantity * unitPrice;
    }
}
