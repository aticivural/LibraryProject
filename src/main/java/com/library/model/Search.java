package com.library.model;


/**
 * Created by vural on 10-Dec-16.
 */
public class Search {

    public Search() {
    }

    private String word;

    public Search(String word) {
        this.word = word;
    }

    public String getword() {
        return word;
    }

    public void setword(String word) {
        this.word = word;
    }

    @Override
    public String toString() {
        return "Search{" +
                "word='" + word + '\'' +
                '}';
    }
}
