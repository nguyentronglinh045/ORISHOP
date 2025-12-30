package vn.orishop.services;

import java.util.List;
import vn.orishop.entity.User;

public interface IUserService {
    // Nghiệp vụ đăng nhập/đăng ký
    User login(String username, String password);

    User findByUsername(String username);

    // [MỚI] Tìm kiếm user theo email (Dùng cho Quên mật khẩu)
    User findByEmail(String email);

    // Nghiệp vụ quản lý (CRUD)
    void insert(User user);

    void update(User user);

    void delete(int id);

    User findById(int id);

    List<User> findAll();
}
