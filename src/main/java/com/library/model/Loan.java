package com.library.model;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

/**
 * Created by vural on 04-Dec-16.
 */
public class Loan {

    private int loanId;
    private int userId;
    private BigDecimal ISBN;
    private Integer bookId;
    private Date startingDate;
    private Date finishingDate;
    private Date deliveryDate;

    public Loan() {
    }

    public int getLoanId() {
        return loanId;
    }

    public void setLoanId(int loanId) {
        this.loanId = loanId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public BigDecimal getISBN() {
        return ISBN;
    }

    public void setISBN(BigDecimal ISBN) {
        this.ISBN = ISBN;
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

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    @Override
    public String toString() {
        return "Loan{" +
                "loanId=" + loanId +
                ", userId=" + userId +
                ", ISBN=" + ISBN +
                ", bookId=" + bookId +
                ", startingDate=" + startingDate +
                ", finishingDate=" + finishingDate +
                ", deliveryDate=" + deliveryDate +
                '}';
    }
}
