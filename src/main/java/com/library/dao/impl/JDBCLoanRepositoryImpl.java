package com.library.dao.impl;

import com.library.dao.LoanRepository;
import com.library.model.Book;
import com.library.model.Loan;
import com.library.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by vural on 04-Dec-16.
 */
@Component
public class JDBCLoanRepositoryImpl implements LoanRepository{

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCLoanRepositoryImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    /*public void create(int userId, String isbn) {
        String SQL = "insert into Loan (userId, ISBN, startingDate, finishingDate) values (?, ?, ?, ?)";
        Date startingDate = new Date();
        Date finishingDate = calculateFinishingDate(startingDate);
        jdbcTemplate.update(SQL, userId, new BigDecimal(isbn), startingDate, finishingDate);
    }*/

    public void create(int userId, String bookId, Book book) {
        String SQL = "insert into Loan (userId, isbn, bookId, startingDate, finishingDate) values (?, ?, ?, ?, ?)";
        Date startingDate = new Date();
        Date finishingDate = calculateFinishingDate(startingDate);
        jdbcTemplate.update(SQL, userId, book.getISBN(), new Integer(bookId), startingDate, finishingDate);
    }

    public void timeExtension(int userId, BigDecimal isbn, Loan loan) {
        String SQL = "update Loan set startingDate=? where userId = ? and isbn = ? and loanId = ?";
        Date newStartingDate = new Date();
        jdbcTemplate.update(SQL,newStartingDate, userId, isbn, loan.getLoanId());
    }

    public void deliveryBook(int userId,BigDecimal isbn){
        RowMapper<Loan> loanRowMapper = new LoanRowMapper();
        String lastRecord = "select * from loan where ISBN=? and userId =? order by startingDate DESC";
        Loan lastLoan = jdbcTemplate.queryForObject(lastRecord, loanRowMapper, isbn, userId);

        String updateLoan = "update Loan set deliveryDate= ? where loanId= ? and userId=? and ISBN= ?";
        jdbcTemplate.update(updateLoan, new Date(), lastLoan.getLoanId(), userId, isbn);

        String updateBook = "update Book set loanStatus= ? where ISBN= ?";
        jdbcTemplate.update(updateBook, 0, isbn);
    }

    public int setDeliveryDate(String bookId, int userId) {
        String SQL = "update Loan set deliveryDate = ? where bookId = ? and userId = ? and deliveryDate = '1970-01-01'";
        int result = jdbcTemplate.update(SQL, new Date(), new Integer(bookId), userId);
        return result;
    }

    public void takeProduct(String isbn){
        String updateBook = "update Book set loanStatus= ? where ISBN= ?";
        jdbcTemplate.update(updateBook,0, new BigDecimal(isbn));
    }

    public Loan getLoan(String bookId) {
        RowMapper<Loan> loanRowMapper = new LoanRowMapper();
        Loan loan;
        String SQL = "select * from loan where bookId = ? and deliveryDate='1970-01-01'";
        try {
            loan = jdbcTemplate.queryForObject(SQL, loanRowMapper, new Integer(bookId));
            return loan;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    private class LoanRowMapper implements RowMapper<Loan>{
        public Loan mapRow(ResultSet resultSet, int i) throws SQLException {
            return mapLoan(resultSet);
        }
    }

    private Loan mapLoan(ResultSet resultSet) throws SQLException{
        Loan loan;
        int loanId = resultSet.getInt("loanId");
        int userId = resultSet.getInt("userId");
        int bookId = resultSet.getInt("bookId");
        BigDecimal ISBN = resultSet.getBigDecimal("ISBN");
        Date startingDate = resultSet.getDate("startingDate");
        Date finishingDate = resultSet.getDate("finishingDate");
        Date deliveryDate = resultSet.getDate("deliveryDate");
        loan = new Loan();
        loan.setUserId(loanId);
        loan.setUserId(userId);
        loan.setISBN(ISBN);
        loan.setStartingDate(startingDate);
        loan.setFinishingDate(finishingDate);
        loan.setDeliveryDate(deliveryDate);
        loan.setBookId(bookId);
        return loan;

    }

    private static Date calculateFinishingDate(Date startingDate){
        Date finishingDate;
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(startingDate);
        calendar.add(Calendar.DAY_OF_YEAR,15);
        finishingDate = calendar.getTime();
        return finishingDate;
    }

}
