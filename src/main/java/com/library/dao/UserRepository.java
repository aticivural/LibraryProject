package com.library.dao;

import com.library.model.User;

import javax.sql.DataSource;
import java.util.List;

/**
 * Created by vural on 04-Dec-16.
 */
public interface UserRepository {

    int create(User user);

    void update(int userId, User user);

    User getUserById(Integer id);

    User getUserByMail(String mail);

    List<User> getUserList();
}
