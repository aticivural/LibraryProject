package com.library.dao;

import com.library.model.Book;
import com.library.model.History;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by vural on 04-Dec-16.
 */
public interface BookRepository {

    int create(Book book);

    void update(Integer bookId, Book book);

    void changeBookStatus(String bookId);

    int delete(Integer bookId);

    Book getBookByISBN(BigDecimal isbn);

    Book getBookByIsbnWithAuthor(BigDecimal isbn);

    Book getBookByBookId(Integer bookId);

    Book getBookByBookIdWithAuthor(Integer bookId);

    List<Book> getBookList();

    HashSet<Book> getBookSetByWords(String[] words);

    LinkedHashSet<History> getHistory(int userId);

    LinkedHashSet<History> getLoanHistory(int userId);

    int timeExtension(int userId, Integer bookId);
}
