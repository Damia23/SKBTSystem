package com.example.skbtsystem;

public class Book
{
    private String bookID, bookPubYear, bookAuthor, bookAmount, bookAvailability, bookStatus, bookPublisher;

    public Book(String bookID, String bookPubYear, String bookAuthor, String bookAmount, String bookAvailability, String bookStatus, String bookPublisher)
    {
        this.bookID = bookID;
        this.bookPubYear = bookPubYear;
        this.bookAuthor = bookAuthor;
        this.bookAmount = bookAmount;
        this.bookAvailability = bookAvailability;
        this.bookStatus = bookStatus;
        this.bookPublisher = bookPublisher;
    }

    public String getBookID()
    {
        return bookID;
    }

    public void setBookID(String bookID)
    {
        this.bookID = bookID;
    }

    public String getBookPubYear()
    {
        return bookPubYear;
    }

    public void setBookPubYear(String bookPubYear)
    {
        this.bookPubYear = bookPubYear;
    }

    public String getBookAuthor()
    {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor)
    {
        this.bookAuthor = bookAuthor;
    }

    public String getBookAmount()
    {
        return bookAmount;
    }

    public void setBookAmount(String bookAmount)
    {
        this.bookAmount = bookAmount;
    }

    public String getBookAvailability()
    {
        return bookAvailability;
    }

    public void setBookAvailability(String bookAvailability)
    {
        this.bookAvailability = bookAvailability;
    }

    public String getBookStatus()
    {
        return bookStatus;
    }

    public void setBookStatus(String bookStatus)
    {
        this.bookStatus = bookStatus;
    }

    public String getBookPublisher()
    {
        return bookPublisher;
    }

    public void setBookPublisher(String bookPublisher)
    {
        this.bookPublisher = bookPublisher;
    }
}
