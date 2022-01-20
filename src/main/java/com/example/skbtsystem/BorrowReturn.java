package com.example.skbtsystem;

import java.sql.Date;

public class BorrowReturn
{
    public String borrowID, numberBorrow;
    public Date borrowDate, returnDate, returnLateDate;

    public BorrowReturn(String borrowID, String numberBorrow, Date borrowDate, Date returnDate, Date returnLateDate)
    {
        this.borrowID = borrowID;
        this.numberBorrow = numberBorrow;
        this.borrowDate = borrowDate;
        this.returnDate = returnDate;
        this.returnLateDate = returnLateDate;
    }

    public String getBorrowID()
    {
        return borrowID;
    }

    public void setBorrowID(String borrowID)
    {
        this.borrowID = borrowID;
    }

    public String getNumberBorrow()
    {
        return numberBorrow;
    }

    public void setNumberBorrow(String numberBorrow)
    {
        this.numberBorrow = numberBorrow;
    }

    public Date getBorrowDate()
    {
        return borrowDate;
    }

    public void setBorrowDate(Date borrowDate)
    {
        this.borrowDate = borrowDate;
    }

    public Date getReturnDate()
    {
        return returnDate;
    }

    public void setReturnDate(Date returnDate)
    {
        this.returnDate = returnDate;
    }

    public Date getReturnLateDate()
    {
        return returnLateDate;
    }

    public void setReturnLateDate(Date returnLateDate)
    {
        this.returnLateDate = returnLateDate;
    }
}
