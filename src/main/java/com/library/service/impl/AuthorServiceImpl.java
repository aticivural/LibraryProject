package com.library.service.impl;

import com.library.dao.AuthorRepository;
import com.library.model.Author;
import com.library.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
 * Created by vural on 19-Dec-16.
 */
@Service
public class AuthorServiceImpl implements AuthorService {

    @Autowired
    AuthorRepository authorRepository;

    public void create(Author author) {
        authorRepository.create(author);
    }

    public void update(BigDecimal isbn, Author author) {
        authorRepository.update(isbn, author);
    }
}
