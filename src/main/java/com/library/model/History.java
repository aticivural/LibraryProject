package com.library.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by vural on 19-Dec-16.
 */
public class History {

    private Integer bookId;
    private BigDecimal isbn;
    private Integer userId;
    private String bookName;
    private Date startingDate;
    private Date finishingDate;
    private Date deliveryDate;
    private List<Author> authors;

    public History() {
    }

    public BigDecimal getIsbn() {
        return isbn;
    }

    public void setIsbn(BigDecimal isbn) {
        this.isbn = isbn;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Date getStartingDate() {
        return startingDate;
    }

    public void setStartingDate(Date startingDate) {
        this.startingDate = startingDate;
    }

    public Date getFinishingDate() {
        return finishingDate;
    }

    public void setFinishingDate(Date finishingDate) {
        this.finishingDate = finishingDate;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public List<Author> getAuthors() {
        return authors;
    }

    public void setAuthors(List<Author> authors) {
        this.authors = authors;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        History history = (History) o;

        if (bookId != history.bookId) return false;
        if (userId != history.userId) return false;
        if (!deliveryDate.equals(history.deliveryDate)) return false;
        return isbn.equals(history.isbn);
    }

    @Override
    public int hashCode() {
//        int result = isbn.hashCode();
        int result = bookId.hashCode();
        result = 31 * result + userId;
        return result;
    }

    @Override
    public String toString() {
        return "History{" +
                "isbn=" + isbn +
                ", userId=" + userId +
                ", bookName='" + bookName + '\'' +
                ", startingDate=" + startingDate +
                ", finishingDate=" + finishingDate +
                ", deliveryDate=" + deliveryDate +
                ", authors=" + authors +
                ", bookId=" + bookId +
                '}';
    }
}
