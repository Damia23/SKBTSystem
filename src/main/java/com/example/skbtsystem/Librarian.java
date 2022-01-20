package com.example.skbtsystem;

public class Librarian
{
    private String librarianID, librarianName, librarianEmail, librarianPass, librarianPhone;

    public Librarian(String librarianID, String librarianName, String librarianEmail, String librarianPass, String librarianPhone)
    {
        this.librarianID = librarianID;
        this.librarianName = librarianName;
        this.librarianEmail = librarianEmail;
        this.librarianPass = librarianPass;
        this.librarianPhone = librarianPhone;
    }

    public String getLibrarianID()
    {
        return librarianID;
    }

    public void setLibrarianID(String librarianID)
    {
        this.librarianID = librarianID;
    }

    public String getLibrarianName()
    {
        return librarianName;
    }

    public void setLibrarianName(String librarianName)
    {
        this.librarianName = librarianName;
    }

    public String getLibrarianEmail()
    {
        return librarianEmail;
    }

    public void setLibrarianEmail(String librarianEmail)
    {
        this.librarianEmail = librarianEmail;
    }

    public String getLibrarianPass()
    {
        return librarianPass;
    }

    public void setLibrarianPass(String librarianPass)
    {
        this.librarianPass = librarianPass;
    }

    public String getLibrarianPhone()
    {
        return librarianPhone;
    }

    public void setLibrarianPhone(String librarianPhone)
    {
        this.librarianPhone = librarianPhone;
    }
}
