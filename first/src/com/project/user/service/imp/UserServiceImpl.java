package com.project.user.service.imp;

import com.project.user.models.User;
import com.project.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import com.project.user.dao.UserDao;
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User searchUser(User user) {
        User user1 = userDao.searchUser(user);
        return user1;
    }
}
