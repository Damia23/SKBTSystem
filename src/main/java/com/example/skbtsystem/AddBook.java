package com.example.skbtsystem;

public class AddBook implements java.io.Serializable
{
    public int bookId;
    public String bookTitle;
    public String bookPubYear;
    public String bookAuthor;
    public int bookAmount;
    public String bookPublisher;

    public AddBook(int bookId, String bookTitle, String bookPubYear, String bookAuthor, int bookAmount,
                   String bookPublisher) {
        this.bookId = bookId;
        this.bookTitle = bookTitle;
        this.bookPubYear = bookPubYear;
        this.bookAuthor = bookAuthor;
        this.bookAmount = bookAmount;
        this.bookPublisher = bookPublisher;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getBookPubYear() {
        return bookPubYear;
    }

    public void setBookPubYear(String bookPubYear) {
        this.bookPubYear = bookPubYear;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public int getBookAmount() {
        return bookAmount;
    }

    public void setBookAmount(int bookAmount) {
        this.bookAmount = bookAmount;
    }

    public String getBookPublisher() {
        return bookPublisher;
    }

    public void setBookPublisher(String bookPublisher) {
        this.bookPublisher = bookPublisher;
    }

}

