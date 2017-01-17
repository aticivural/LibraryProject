//package net.test;
//
//import com.library.dao.impl.JDBCBookRepositoryImpl;
//import com.library.dao.impl.JDBCUserRepositoryImpl;
//import com.library.model.Book;
//import com.library.model.History;
//import com.library.model.User;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.ConfigurableApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.stereotype.Component;
//
//import javax.activation.DataSource;
//import java.math.BigDecimal;
//import java.math.BigInteger;
//import java.util.*;
//
///**
// * Created by vural on 04-Dec-16.
// */
//public class Main11 {
//
//    public static void main(String[] args) {
//
//        ConfigurableApplicationContext context = new ClassPathXmlApplicationContext("appContext.xml");
//        JDBCUserRepositoryImpl jdbcUserRepository = (JDBCUserRepositoryImpl)context.getBean("userRepository");
//
//        User user = new User();
//        user.setFirstname("vural");
//        user.setLastname("atici");
//        user.setMail("aticivural2@gmail.com");
//        user.setPassword("1234");
//        user.setStatus(0);
//
//        //jdbcUserRepository.create(user);
//        User user1 = jdbcUserRepository.getUserByMail("aticivural@gmail.com");
//        user1.setFirstname("mehmet");
//        jdbcUserRepository.update(user1.getUserId(), user1);
//
//        user = jdbcUserRepository.getUserById(5);
//        System.out.println(user.toString());
//        user.setFirstname("ufukkk");
//        jdbcUserRepository.update(user.getUserId(), user);
//
//        context.close();
//    }
//
//}

