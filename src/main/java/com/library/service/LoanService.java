package com.library.service;

import com.library.model.Book;
import com.library.model.Loan;

/**
 * Created by vural on 18-Dec-16.
 */
public interface LoanService {

    void create(int userId, String isbn, Book book);

    Loan get(String bookId);

    int setDeliveryDate(String bookId, int userId);
}
