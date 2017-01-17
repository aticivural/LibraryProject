package com.library.dao;

import com.library.model.Book;
import com.library.model.Loan;
import com.library.model.User;

import java.math.BigDecimal;

/**
 * Created by vural on 04-Dec-16.
 */
public interface LoanRepository {

    void create(int userId, String isbn, Book book);

    void timeExtension(int userId, BigDecimal isbn, Loan loan);

    void deliveryBook(int userId,BigDecimal isbn);

    Loan getLoan(String bookId);

    int setDeliveryDate(String bookId, int userId);

}
