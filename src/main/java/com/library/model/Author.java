package com.library.model;

import java.math.BigDecimal;

/**
 * Created by vural on 04-Dec-16.
 */
public class Author {
    private int authorId;
    private BigDecimal ISBN;
    private String firstname;
    private String lastname;

    public Author() {
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public BigDecimal getISBN() {
        return ISBN;
    }

    public void setISBN(BigDecimal ISBN) {
        this.ISBN = ISBN;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    @Override
    public String toString() {
        return "Author{" +
                "authorId=" + authorId +
                ", ISBN=" + ISBN +
                ", firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                '}';
    }
}
