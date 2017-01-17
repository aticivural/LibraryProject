//package net.test;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.ConfigurableApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.jdbc.core.RowMapper;
//import org.springframework.stereotype.Component;
//
//import javax.sql.DataSource;
//import java.math.BigDecimal;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
///**
// * Created by vural on 11-Dec-16.
// */
//@Component
//public class Main {
//    private JdbcTemplate jdbcTemplate;
//    @Autowired
//    public Main(DataSource dataSource) {
//        jdbcTemplate = new JdbcTemplate(dataSource);
//    }
//
//    private class BookRowMapper implements RowMapper<Test>{
//        public Test mapRow(ResultSet resultSet, int i) throws SQLException {
//            return mapTest(resultSet);
//        }
//    }
//
//    private Test mapTest (ResultSet resultSet) throws SQLException{
//        Test test;
//        BigDecimal number = resultSet.getBigDecimal("number");
//        int id = resultSet.getInt("id");
//        String name = resultSet.getString("name");
//        test = new Test();
//        test.setNumber(number);
//        test.setId(id);
//        test.setName(name);
//        return test;
//    }
//
//    Test getTest(){
//        RowMapper<Test> testRowMapper = new BookRowMapper();
//        String sql = "select * FROM test where NUMBER = '77777777777777'";
//        return jdbcTemplate.queryForObject(sql,testRowMapper);
//    }
//
//    public static void main(String[] args) {
//        ConfigurableApplicationContext context = new ClassPathXmlApplicationContext("appContext.xml");
//        Main main = (Main) context.getBean("main");
//
//        Test test = main.getTest();
//        System.out.println(test.toString());
//
//    }
//}
//
//class Test{
//    private int id;
//    private BigDecimal number;
//    private String name;
//
//    public BigDecimal getNumber() {
//        return number;
//    }
//
//    public void setNumber(BigDecimal number) {
//        this.number = number;
//    }
//
//    public int getId() {
//        return id;
//    }
//
//    public void setId(int id) {
//        this.id = id;
//    }
//
//    public String getName() {
//        return name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }
//
//    @Override
//    public String toString() {
//        return "Test{" +
//                "id=" + id +
//                ", number=" + number +
//                ", name='" + name + '\'' +
//                '}';
//    }
//}
