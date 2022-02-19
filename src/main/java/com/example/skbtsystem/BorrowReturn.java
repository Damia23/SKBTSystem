package com.example.skbtsystem;


import java.sql.Date;

public class BorrowReturn
{
    public int borrowreturnID, numberBorrow;
    public Date borrowDate, returnDate, returnLateDate;

    public BorrowReturn(int borrowreturnID, int numberBorrow, Date borrowDate, Date returnDate, Date returnLateDate) {
        this.borrowreturnID = borrowreturnID;
        this.numberBorrow = numberBorrow;
        this.borrowDate = borrowDate;
        this.returnDate = returnDate;
        this.returnLateDate = returnLateDate;
    }

    public int getBorrowreturnID() {
        return borrowreturnID;
    }

    public void setBorrowreturnID(int borrowreturnID) {
        this.borrowreturnID = borrowreturnID;
    }

    public int getNumberBorrow() {
        return numberBorrow;
    }

    public void setNumberBorrow(int numberBorrow) {
        this.numberBorrow = numberBorrow;
    }

    public Date getBorrowDate() {
        return borrowDate;
    }

    public void setBorrowDate(Date borrowDate) {
        this.borrowDate = borrowDate;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public Date getReturnLateDate() {
        return returnLateDate;
    }

    public void setReturnLateDate(Date returnLateDate) {
        this.returnLateDate = returnLateDate;
    }
}
