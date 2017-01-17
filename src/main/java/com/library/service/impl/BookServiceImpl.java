package com.library.service.impl;

import com.library.dao.BookRepository;
import com.library.model.Book;
import com.library.model.History;
import com.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Created by vural on 11-Dec-16.
 */

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookRepository bookRepository;

    public HashSet<Book> searchBook(String sentence) {
        String[] words = divideSentence(sentence);
        return bookRepository.getBookSetByWords(words);
    }

    private static String[] divideSentence(String sentence){
        String [] words = sentence.split(" ");
        return words;
    }

    public Book getBookDetailsByIsbn(BigDecimal isbn) {

        return bookRepository.getBookByIsbnWithAuthor(isbn);
    }

    public Book getBookDetailsByBookId(Integer bookId){
        return bookRepository.getBookByBookIdWithAuthor(bookId);
    }

    public void changeBookStatus(String bookId) {
        bookRepository.changeBookStatus(bookId);
    }

    public int create(Book book) {
        return bookRepository.create(book);
    }

    public int delete(Integer bookId) {
        return bookRepository.delete(bookId);
    }

    public LinkedHashSet<History> getHistory(int userId) {
        return bookRepository.getHistory(userId);
    }

    public LinkedHashSet<History> getLoanHistory(int userId) {
        return bookRepository.getLoanHistory(userId);
    }

    public int timeExtension(int userId, Integer bookId) {
        return bookRepository.timeExtension(userId, bookId);
    }

    public void update(Integer bookId, Book book) {
        bookRepository.update(bookId, book);
    }
}
