package com.library.service;

import com.library.model.User;

/**
 * Created by vural on 16-Dec-16.
 */
public interface UserService {

    User loginUser(String mail, String password);

    int save(User user);

    void update(User user);

    User display(String mail);

    User getUserById(Integer id);
}
