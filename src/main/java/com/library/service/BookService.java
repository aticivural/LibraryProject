package com.library.service;

import com.library.model.Book;
import com.library.model.History;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Created by vural on 11-Dec-16.
 */
public interface BookService {

    HashSet<Book> searchBook(String sentence);

    Book getBookDetailsByIsbn(BigDecimal isbn);

    Book getBookDetailsByBookId(Integer bookId);

    void changeBookStatus(String bookId);

    int create(Book book);

    int delete(Integer bookId);

    LinkedHashSet<History> getHistory(int userId);

    LinkedHashSet<History> getLoanHistory(int userId);

    int timeExtension(int userId, Integer bookId);

    void update(Integer bookId, Book book);
}
