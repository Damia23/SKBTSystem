package com.example.skbtsystem;

public class Teacher
{
    private String teacherName, teacherPhone, teacherEmail, teacherPass;

    public Teacher(String teacherName, String teacherPhone, String teacherEmail, String teacherPass)
    {
        this.teacherName = teacherName;
        this.teacherEmail = teacherEmail;
        this.teacherPass = teacherPass;
        this.teacherPhone = teacherPhone;
    }

    public String getTeacherName()
    {
        return teacherName;
    }

    public void setTeacherName(String teacherName)
    {
        this.teacherName = teacherName;
    }

    public String getTeacherEmail()
    {
        return teacherEmail;
    }

    public void setTeacherEmail(String teacherEmail)
    {
        this.teacherEmail = teacherEmail;
    }

    public String getTeacherPass()
    {
        return teacherPass;
    }

    public void setTeacherPass(String teacherPass)
    {
        this.teacherPass = teacherPass;
    }

    public String getTeacherPhone()
    {
        return teacherPhone;
    }

    public void setTeacherPhone(String teacherPhone)
    {
        this.teacherPhone = teacherPhone;
    }
}
