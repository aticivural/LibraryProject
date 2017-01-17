package com.library.dao;

import com.library.model.Author;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by vural on 04-Dec-16.
 */
public interface AuthorRepository {

    void create(Author author);

    Author getAuthorById(int id);

    Author getAuthorByISBN(BigDecimal isbn);

    List<Author> getAuthorListByISBN(BigDecimal isbn);

    List<Author> getAuthorListByBookId(Integer bookId);

    void update(BigDecimal isbn, Author author);
}
