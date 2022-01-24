package com.example.skbtsystem;

public class Student
{
    private String studentName, studentPhone, studentEmail, studentPass;

    public Student(String studentName, String studentEmail, String studentPass, String studentPhone)
    {
        this.studentName = studentName;
        this.studentEmail = studentEmail;
        this.studentPass = studentPass;
        this.studentPhone = studentPhone;
    }


    public String getStudentName()
    {
        return studentName;
    }

    public void setStudentName(String studentName)
    {
        this.studentName = studentName;
    }

    public String getStudentEmail()
    {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail)
    {
        this.studentEmail = studentEmail;
    }

    public String getStudentPass()
    {
        return studentPass;
    }

    public void setStudentPass(String studentPass)
    {
        this.studentPass = studentPass;
    }

    public String getStudentPhone()
    {
        return studentPhone;
    }

    public void setStudentPhone(String studentPhone)
    {
        this.studentPhone = studentPhone;
    }

}
