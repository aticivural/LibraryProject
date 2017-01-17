package com.library.dao.impl;

import com.library.dao.UserRepository;
import com.library.model.User;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.inject.Inject;
import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by vural on 04-Dec-16.
 */

@Component
public class JDBCUserRepositoryImpl implements UserRepository {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCUserRepositoryImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public User getUserById(Integer id) {
        User user;
        RowMapper<User> userRowMapper = new UserRowMapper();
        String SQL = "select * from User where userId = ?";
        try {
            user = jdbcTemplate.queryForObject(SQL, userRowMapper, id);
            return user;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    public User getUserByMail(String mail) {
        User user;
        RowMapper<User> userRowMapper = new UserRowMapper();
        String SQL = "select * from User where mail = ?";
        try {
            user = jdbcTemplate.queryForObject(SQL, userRowMapper, mail);
            return user;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }

    }

    public int create(User user) {
        String SQL = "insert into User (firstname, lastname, mail, password, status) values(?, ?, ?, ?, ?)";
        int result = 0;
        try {
            result = jdbcTemplate.update(SQL, user.getFirstname(), user.getLastname(), user.getMail(), user.getPassword(), user.getStatus());
        } catch (DuplicateKeyException e) {
            result  = 2;//bunu ben tanimladim mail kayitliysa bunu dondurecek
        }
        return result;
    }

    public void update(int userId, User user) {
        String SQL = "update User set firstname = ?, lastname = ?, mail = ?, password = ?, status = ? where userId = ?";
        jdbcTemplate.update(SQL, user.getFirstname(), user.getLastname(), user.getMail(), user.getPassword(), user.getStatus(), userId);

    }

    public List<User> getUserList() {
        RowMapper<User> userRowMapper = new UserRowMapper();
        String SQL = "select * from User";
        try {
            List<User> userList = jdbcTemplate.query(SQL, userRowMapper);
            return userList;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    private class UserRowMapper implements RowMapper<User> {

        public User mapRow(ResultSet resultSet, int i) throws SQLException {
            return mapUser(resultSet);
        }
    }

    private User mapUser(ResultSet resultSet) throws SQLException {
        User user = null;
        int userId = resultSet.getInt("userId");
        String firstname = resultSet.getString("firstname");
        String lastname = resultSet.getString("lastname");
        String mail = resultSet.getString("mail");
        String password = resultSet.getString("password");
        int status = resultSet.getInt("status");

        user = new User();
        user.setUserId(userId);
        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setMail(mail);
        user.setPassword(password);
        user.setStatus(status);
        return user;
    }
}
