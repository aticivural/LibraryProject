package com.library.service.impl;

import com.library.dao.LoanRepository;
import com.library.model.Book;
import com.library.model.Loan;
import com.library.service.LoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by vural on 18-Dec-16.
 */
@Service
public class LoanServiceImpl implements LoanService {

    @Autowired
    LoanRepository loanRepository;

    public void create(int userId, String isbn, Book book) {
        loanRepository.create(userId, isbn, book);
    }

    public Loan get(String bookId) {
        return loanRepository.getLoan(bookId);
    }

    public int setDeliveryDate(String bookId, int userId) {
        return loanRepository.setDeliveryDate(bookId, userId);
    }
}
