package vn.orishop.dao;

import java.util.List;
import vn.orishop.entity.User;

public interface IUserDao {
    // Các phương thức CRUD cơ bản (khớp với AbstractDao)
    void insert(User user);

    void update(User user);

    void delete(Object id);

    User findById(Object id);

    List<User> findAll();

    int count();

    // Các phương thức riêng của User
    User findByUsername(String username);

    User findByEmail(String email);
}
