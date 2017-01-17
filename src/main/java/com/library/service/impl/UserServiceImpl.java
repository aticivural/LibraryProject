package com.library.service.impl;

import com.library.dao.UserRepository;
import com.library.model.User;
import com.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by vural on 16-Dec-16.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

    public User loginUser(String mail, String password) {

        User user = userRepository.getUserByMail(mail);
        if(user != null && user.getPassword().equals(password))
            return user;
        else
            return null;
    }

    public int save(User user) {
        if (user == null)
            return 0;
        if (user != null){
            return userRepository.create(user);
            //return 1;
        }
        return 0;
    }

    public void update(User user) {
        userRepository.update(user.getUserId(), user);
    }

    public User display(String mail) {
        User user = userRepository.getUserByMail(mail);

        if (user == null)
            return null;
        else
            return user;
    }

    public User getUserById(Integer id) {
        User user = userRepository.getUserById(id);
        if (user == null)
            return null;
        else
            return user;
    }
}
