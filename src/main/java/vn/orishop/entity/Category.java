package vn.orishop.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "categories")
@NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c")
public class Category implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "categoryId")
    private int categoryId;

    @Column(name = "categoryName", columnDefinition = "nvarchar(200) NOT NULL")
    private String categoryName;

    @Column(name = "icon", columnDefinition = "nvarchar(200)")
    private String icon;

    // --- QUAN HỆ CHA - CON (Self-referencing) ---

    // Danh mục cha (Parent)
    @ManyToOne
    @JoinColumn(name = "parentId")
    @ToString.Exclude // Ngăn chặn đệ quy vô tận và lỗi Lazy load khi in log
    private Category category;

    // Danh sách danh mục con (Children)
    // QUAN TRỌNG: Đổi sang EAGER để lấy luôn danh sách con khi query cha, phục vụ cho Menu đa cấp
    @OneToMany(mappedBy = "category", fetch = FetchType.EAGER)
    @ToString.Exclude // Loại bỏ khỏi toString để tránh đệ quy
    private List<Category> subCategories;

    // -----------------------------------

    // Quan hệ với sản phẩm
    @OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
    @ToString.Exclude // QUAN TRỌNG: Khắc phục lỗi LazyInitializationException khi gọi toString()
    private List<Product> products;

    // Helper methods
    public Product addProduct(Product product) {
        getProducts().add(product);
        product.setCategory(this);
        return product;
    }

    public Product removeProduct(Product product) {
        getProducts().remove(product);
        product.setCategory(null);
        return product;
    }

    // Helper để kiểm tra có con hay không (tiện cho JSP)
    public boolean hasSubCategories() {
        return subCategories != null && !subCategories.isEmpty();
    }
}
