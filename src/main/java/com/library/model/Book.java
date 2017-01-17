package com.library.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

/**
 * Created by vural on 04-Dec-16.
 */
public class Book {

    private Integer bookId;
    @Valid
    @NotNull
    private BigDecimal ISBN;
    @Valid
    @NotNull
    @Size(min=5, max=150)
    private String name;
    @Valid
    @NotNull
    @Size(min=3, max=150)
    private String kind;
    @Valid
    @NotNull
    @Size(min=5, max=150)
    private String publisher;
    @Valid
    @NotNull
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date publishDate;
    @Valid
    @NotNull
    @Min(value = 1)
    private int edition;

    private int loanStatus;
    @Valid
    @NotNull
    @Size(min=5, max=150)
    private String storageLocation;
    @Valid
    @NotNull
    @Size(min=5, max=150)
    private String language;
    @Valid
    @NotNull
    @Size(min=5, max=150)
    private String topicTitle;
    @Valid
    @NotNull
    @Size(min=5, max=150)
    private String department;
    private List<Author> authors;

    private int count;


    public List<Author> getAuthors() {
        return authors;
    }

    public void setAuthors(List<Author> authors) {
        this.authors = authors;
    }

    public Book() {
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public BigDecimal getISBN() {
        return ISBN;
    }

    public void setISBN(BigDecimal ISBN) {
        this.ISBN = ISBN;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public int getEdition() {
        return edition;
    }

    public void setEdition(int edition) {
        this.edition = edition;
    }

    public int getLoanStatus() {
        return loanStatus;
    }

    public void setLoanStatus(int loanStatus) {
        this.loanStatus = loanStatus;
    }

    public String getStorageLocation() {
        return storageLocation;
    }

    public void setStorageLocation(String storageLocation) {
        this.storageLocation = storageLocation;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getTopicTitle() {
        return topicTitle;
    }

    public void setTopicTitle(String topicTitle) {
        this.topicTitle = topicTitle;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Book book = (Book) o;

        return bookId.equals(book.bookId);
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((ISBN == null) ? 0 : ISBN.hashCode() );
        return result;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookId=" + bookId +
                ", ISBN=" + ISBN +
                ", name='" + name + '\'' +
                ", kind='" + kind + '\'' +
                ", publisher='" + publisher + '\'' +
                ", pubishDate=" + publishDate +
                ", edition=" + edition +
                ", loanStatus=" + loanStatus +
                ", storageLocation='" + storageLocation + '\'' +
                ", language='" + language + '\'' +
                ", topicTitle='" + topicTitle + '\'' +
                ", department='" + department + '\'' +
                ", count='" + count + '\'' +
                '}';
    }
}
