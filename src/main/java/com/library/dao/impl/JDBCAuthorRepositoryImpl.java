package com.library.dao.impl;

import com.library.dao.AuthorRepository;
import com.library.model.Author;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by vural on 04-Dec-16.
 */
@Component
public class JDBCAuthorRepositoryImpl implements AuthorRepository {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCAuthorRepositoryImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public void create(Author author) {
        String SQL = "insert into Author (ISBN, firstname, lastname) values(?, ?, ?)";
        jdbcTemplate.update(SQL,author.getISBN(), author.getFirstname(), author.getLastname());
    }

    public Author getAuthorById(int id) {
        RowMapper<Author> authorRowMapper = new AuthorRowMapper();
        String SQL = "select * from Author where authorId = ?";
        return jdbcTemplate.queryForObject(SQL, authorRowMapper, id);
    }

    public Author getAuthorByISBN(BigDecimal isbn) {
        RowMapper<Author> authorRowMapper = new AuthorRowMapper();
        String SQL = "select * from Author where ISBN = ?";
        return jdbcTemplate.queryForObject(SQL, authorRowMapper, isbn);
    }

    public void update(BigDecimal isbn, Author author) {
        String SQL = "update Author set firstname = ?, lastname = ? where authorId = ?";
        jdbcTemplate.update(SQL,author.getFirstname(), author.getLastname(), author.getAuthorId() );
        return;
    }

    public List<Author> getAuthorListByISBN(BigDecimal isbn) {
        RowMapper<Author> authorRowMapper = new AuthorRowMapper();
        String SQL = "select * from Author where ISBN = ?";
        return jdbcTemplate.query(SQL, authorRowMapper, isbn);
    }

    public List<Author> getAuthorListByBookId(Integer bookId){
        RowMapper<Author> authorRowMapper = new AuthorRowMapper();
        String SQL = "select * from Author a INNER JOIN book b ON a.ISBN = b.ISBN  where b.bookId = ?";
        return jdbcTemplate.query(SQL, authorRowMapper, bookId);
    }

    private class AuthorRowMapper implements RowMapper<Author> {

        public Author mapRow(ResultSet resultSet, int i) throws SQLException {
            return mapAuthor(resultSet);
        }
    }

    private Author mapAuthor(ResultSet resultSet) throws SQLException{
        Author author = null;
        int authorId = resultSet.getInt("authorId");
        BigDecimal isbn = resultSet.getBigDecimal("ISBN");
        String firstname = resultSet.getString("firstname");
        String lastname = resultSet.getString("lastname");

        author = new Author();
        author.setAuthorId(authorId);
        author.setISBN(isbn);
        author.setFirstname(firstname);
        author.setLastname(lastname);
        return author;
    }

}




