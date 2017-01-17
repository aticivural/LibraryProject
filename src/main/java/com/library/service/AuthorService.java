package com.library.service;

import com.library.model.Author;

import java.math.BigDecimal;

/**
 * Created by vural on 19-Dec-16.
 */
public interface AuthorService {

    void create(Author author);

    void update(BigDecimal isbn, Author author);
}
