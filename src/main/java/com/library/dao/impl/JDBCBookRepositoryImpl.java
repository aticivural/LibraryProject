package com.library.dao.impl;

import com.library.dao.AuthorRepository;
import com.library.dao.BookRepository;
import com.library.model.Author;
import com.library.model.Book;
import com.library.model.History;
import com.library.model.Loan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 * Created by vural on 04-Dec-16.
 */
@Component
public class JDBCBookRepositoryImpl implements BookRepository{

    private JdbcTemplate jdbcTemplate;

    @Autowired
    private AuthorRepository authorRepository;

    @Autowired
    public JDBCBookRepositoryImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public int create(Book book) {
        String SQL = "insert into Book (ISBN, name, kind, publisher, publishDate, edition, storageLocation, language, topicTitle, department ) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
        int result = 0;
        try {
            result = jdbcTemplate.update(SQL, book.getISBN(), book.getName(), book.getKind(), book.getPublisher(), book.getPublishDate(), book.getEdition(), book.getStorageLocation(), book.getLanguage(), book.getTopicTitle(), book.getDepartment());
        } catch (DuplicateKeyException e) {
            return result = 0;
        }
        return result;
    }

    public void update(Integer bookId, Book book) {
        String SQL = "update Book set name= ?, kind= ?, publisher= ?, publishDate= ?, edition= ?, loanStatus= ?, storageLocation= ?, language= ?, topicTitle= ?, department= ? where bookId= ?";
        jdbcTemplate.update(SQL, book.getName(), book.getKind(), book.getPublisher(), book.getPublishDate(), book.getEdition(), book.getLoanStatus(), book.getStorageLocation(), book.getLanguage(), book.getTopicTitle(), book.getDepartment(), bookId);
    }

    public void changeBookStatus(String bookId) {
        String SQL = "update Book set loanStatus = 0 where bookId = ?";
        jdbcTemplate.update(SQL, new Integer(bookId));
    }

    public int delete(Integer bookId) {
        String SQL = "delete from Book where bookId = ?";
        return jdbcTemplate.update(SQL, bookId);
    }

    public Book getBookByISBN(BigDecimal isbn) {
        Book book;
        RowMapper<Book> bookRowMapper = new BookRowMapper();
        String SQL = "select * from Book WHERE ISBN = ?";
        try{
           book = jdbcTemplate.queryForObject(SQL, bookRowMapper, isbn);
           return book;
        }catch (EmptyResultDataAccessException e){
            return null;
        }
    }

    public Book getBookByBookId(Integer bookId) {
        Book book;
        RowMapper<Book> bookRowMapper = new BookRowMapper();
        String SQL = "select * from Book WHERE bookId = ?";
        try{
            book = jdbcTemplate.queryForObject(SQL, bookRowMapper, bookId);
            return book;
        }catch (EmptyResultDataAccessException e){
            return null;
        }
    }

    public List<Book> getBookList() {
        RowMapper<Book> bookRowMapper = new BookRowMapper();
        String SQL = "select * from Book";
        try {
            List<Book> bookList = jdbcTemplate.query(SQL, bookRowMapper);
            return bookList;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    public Book getBookByIsbnWithAuthor(BigDecimal isbn){
        Book book = getBookByISBN(isbn);
        if (book != null){
            book.setAuthors(authorRepository.getAuthorListByISBN(isbn));
            return book;
        }
        else
            return null;
    }

    public Book getBookByBookIdWithAuthor(Integer bookId){
        Book book = getBookByBookId(bookId);
        if (book != null){
            book.setAuthors(authorRepository.getAuthorListByBookId(bookId));
            return book;
        }
        else
            return null;
    }

    public HashSet<Book> getBookSetByWords(String[] words) {
        RowMapper<Book> bookRowMapper = new BookRowMapper();
        HashSet<Book> bookSetTemp = new LinkedHashSet<Book>();
        HashSet<Book> bookSet = new LinkedHashSet<Book>();
        for (String word : words){
            String SQL = "SELECT DISTINCT * from book where ISBN LIKE '%"+word+"%' or name LIKE '%"+word+"%' or kind LIKE '%"+word+"%' or publisher LIKE '%"+word+"%' or topicTitle LIKE '%"+word+"%'";
            bookSetTemp.addAll(jdbcTemplate.query(SQL,bookRowMapper));

            Iterator<Book> iterator = bookSetTemp.iterator();
            while (iterator.hasNext()) {
                Book b = iterator.next();
                b.setAuthors(authorRepository.getAuthorListByISBN(b.getISBN()));
                bookSet.add(b);

            }
        }
        return bookSet;
    }

    public LinkedHashSet<History> getHistory(int userId){
        RowMapper<History> historyRowMapper = new HistoryRowMapper();
        LinkedHashSet<History> historySetTemp = new LinkedHashSet<History>();
        LinkedHashSet<History> historySet = new LinkedHashSet<History>();
//        String SQL ="select DISTINCT l.bookId,l.ISBN, l.userId,l.startingDate,l.deliveryDate, l.finishingDate, b.name from loan l INNER JOIN book b ON l.ISBN = b.ISBN WHERE l.userId = ? AND deliveryDate !='1970-01-01' ORDER BY l.deliveryDate DESC";
        String SQL ="select l.*, b.* from loan l INNER JOIN book b ON l.ISBN = b.ISBN WHERE l.userId = ? AND b.loanStatus = '0' AND deliveryDate !='1970-01-01' ORDER BY l.deliveryDate DESC";
        historySetTemp.addAll(jdbcTemplate.query(SQL, historyRowMapper,userId));

        Iterator<History> iterator = historySetTemp.iterator();
        while (iterator.hasNext()) {
            History h = iterator.next();
            //h.setAuthors(authorRepository.getAuthorListByBookId(h.getBookId()));
            h.setAuthors(authorRepository.getAuthorListByISBN(h.getIsbn()));
            historySet.add(h);
        }
        return historySet;
    }

    public LinkedHashSet<History> getLoanHistory(int userId){
        RowMapper<History> historyRowMapper = new HistoryRowMapper();
        LinkedHashSet<History> historySetTemp = new LinkedHashSet<History>();
        LinkedHashSet<History> historySet = new LinkedHashSet<History>();
        String SQL ="select l.*, b.* from loan l INNER JOIN book b ON l.bookId = b.bookId WHERE l.userId = ? AND deliveryDate ='1970-01-01'";
        historySetTemp.addAll(jdbcTemplate.query(SQL, historyRowMapper,userId));

        Iterator<History> iterator = historySetTemp.iterator();
        while (iterator.hasNext()) {
            History h = iterator.next();
//            h.setAuthors(authorRepository.getAuthorListByISBN(h.getIsbn()));
            h.setAuthors(authorRepository.getAuthorListByBookId(h.getBookId()));
            historySet.add(h);
        }
        return historySet;
    }

    public int timeExtension(int userId, Integer bookId) {
        String SQL = "update loan SET finishingDate = DATE_ADD(finishingDate, INTERVAL 15 DAY) WHERE userid = ? AND bookId = ? AND deliveryDate ='1970-01-01'";
        return jdbcTemplate.update(SQL,userId, bookId);
    }


    private class BookRowMapper implements RowMapper<Book>{

        public Book mapRow(ResultSet resultSet, int i) throws SQLException {
            return mapBook(resultSet);
        }
    }

    private Book mapBook (ResultSet resultSet) throws SQLException{
        Book book;
        int bookId = resultSet.getInt("bookId");
        BigDecimal ISBN = resultSet.getBigDecimal("ISBN");
        String name = resultSet.getString("name");
        String kind = resultSet.getString("kind");
        String publisher = resultSet.getString("publisher");
        Date publishDate = resultSet.getDate("publishDate");
        int edition = resultSet.getInt("edition");
        int loanStatus = resultSet.getInt("loanStatus");
        String storageLocation = resultSet.getString("storageLocation");
        String language = resultSet.getString("language");
        String topicTitle = resultSet.getString("topicTitle");
        String department = resultSet.getString("department");
        int count = resultSet.getInt("count");

        book = new Book();
        book.setBookId(bookId);
        book.setISBN(ISBN);
        book.setName(name);
        book.setKind(kind);
        book.setPublisher(publisher);
        book.setPublishDate(publishDate);
        book.setEdition(edition);
        book.setLoanStatus(loanStatus);
        book.setStorageLocation(storageLocation);
        book.setLanguage(language);
        book.setTopicTitle(topicTitle);
        book.setDepartment(department);
        book.setCount(count);
        return book;

    }


    private class HistoryRowMapper implements RowMapper<History>{
        public History mapRow(ResultSet resultSet, int i) throws SQLException {
            return mapHistory(resultSet);
        }
    }

    private History mapHistory(ResultSet resultSet) throws  SQLException{
        History history;
        Integer bookId = resultSet.getInt("bookId");
        int userId = resultSet.getInt("userId");
        BigDecimal isbn = resultSet.getBigDecimal("ISBN");
        String bookName = resultSet.getString("name");
        Date startingDate = resultSet.getDate("startingDate");
        Date finishingDate = resultSet.getDate("finishingDate");
        Date deliveryDate = resultSet.getDate("deliveryDate");

        history = new History();
        history.setUserId(userId);
        history.setIsbn(isbn);
        history.setBookName(bookName);
        history.setStartingDate(startingDate);
        history.setFinishingDate(finishingDate);
        history.setDeliveryDate(deliveryDate);
        history.setBookId(bookId);
        return history;
    }


}





