package com.example.skbtsystem;

public class Fine
{
    private String fineID, fineAmount;

    public Fine(String fineID, String fineAmount)
    {
        this.fineID = fineID;
        this.fineAmount = fineAmount;
    }

    public String getFineID()
    {
        return fineID;
    }

    public void setFineID(String fineID)
    {
        this.fineID = fineID;
    }

    public String getFineAmount()
    {
        return fineAmount;
    }

    public void setFineAmount(String fineAmount)
    {
        this.fineAmount = fineAmount;
    }
}
