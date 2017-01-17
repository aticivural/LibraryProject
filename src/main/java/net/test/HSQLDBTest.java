/*
package net.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

*/
/**
 * Created by vural on 17-Jan-17.
 *//*

public class HSQLDBTest {

    public static void main(String[] args) {

//        jdbc:hsqldb:file:C:/Users/vural/IdeaProjects/EmbeddedDBSample/DB/embedded
        Connection connection = null;
        Statement statement = null;
        try {
            Class.forName("org.hsqldb.jdbcDriver");
            String url = "jdbc:hsqldb:file:C:/Users/vural/IdeaProjects/libraryspringmvc/DB/library";
//            String url = "jdbc:hsqldb:file:C:\\Users\\vural\\IdeaProjects\\EmbeddedDBSample\\DB\\embedded";
            connection = DriverManager.getConnection(url, "sa", "");
            connection.setAutoCommit(false);

            statement = connection.createStatement();

            String sql = "SELECT * FROM USER";
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()){
                String firstname = rs.getString("firstname");
                String lastname = rs.getString("lastname");
                System.out.println("firstname = " +firstname + " lastname = " + lastname);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
*/
