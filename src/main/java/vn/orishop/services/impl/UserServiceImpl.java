package vn.orishop.services.impl;

import java.util.List;

import vn.orishop.dao.IUserDao;
import vn.orishop.dao.impl.UserDaoImpl;
import vn.orishop.entity.User;
import vn.orishop.services.IUserService;

public class UserServiceImpl implements IUserService {

    // Gọi tầng DAO để thao tác CSDL
    IUserDao userDao = new UserDaoImpl();

    @Override
    public User login(String username, String password) {
        User user = this.findByUsername(username);
        if (user != null && password.equals(user.getPassword())) {
            return user;
        }
        return null;
    }

    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

    @Override
    public void insert(User user) {
        userDao.insert(user);
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public void delete(int id) {
        userDao.delete(id);
    }

    @Override
    public User findById(int id) {
        return userDao.findById(id);
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }
}