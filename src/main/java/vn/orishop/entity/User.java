package vn.orishop.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "users")
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "userId")
    private int userId;

    @Column(name = "username", columnDefinition = "varchar(50) NOT NULL")
    private String username;

    @Column(name = "password", columnDefinition = "varchar(50) NOT NULL")
    private String password;

    @Column(name = "fullname", columnDefinition = "nvarchar(500)")
    private String fullname;

    @Column(name = "email", columnDefinition = "varchar(100)")
    private String email;

    @Column(name = "phone", columnDefinition = "varchar(15)")
    private String phone;

    @Column(name = "role")
    private int role; // 1: Admin, 0: User

    @Column(name = "createDate")
    @Temporal(TemporalType.DATE)
    private Date createDate;

    // Quan hệ 1-n với Order: Một user có thể có nhiều đơn hàng
    // mappedBy = "user" nghĩa là bên Order có thuộc tính tên là user
    @OneToMany(mappedBy = "user")
    private List<Order> orders;
}