/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amrph.entities;

/**
 *
 * @author ASUS
 */
public class student {

    private String name;
    private String password;
    private int ug_per;
    private int high_school_per;
    private int intermidiate_per;
    private int pg_per;
    private int passout_year;
    private String mobile_no;
    private String email;
    private String course;
    private String dept;
    private String roll_no;
    private String profile_pic;

    public String getProfile_pic() {
        return profile_pic;
    }

    public void setProfile_pic(String profile_pic) {
        this.profile_pic = profile_pic;
    }

    public student(String name, String password, int ug_per, int high_school_per, int intermidiate_per, int pg_per, int passout_year, String mobile_no, String email, String course, String dept, String roll_no, String profile_pic) {
        this.name = name;
        this.password = password;
        this.ug_per = ug_per;
        this.high_school_per = high_school_per;
        this.intermidiate_per = intermidiate_per;
        this.pg_per = pg_per;
        this.passout_year = passout_year;
        this.mobile_no = mobile_no;
        this.email = email;
        this.course = course;
        this.dept = dept;
        this.roll_no = roll_no;
        this.profile_pic = profile_pic;
    }

    public student() {

    }

    public student(String name, String password, int ug_per, int high_school_per, int intermidiate_per, int pg_per, int passout_year, String mobile_no, String email, String course, String dept, String roll_no) {
        this.name = name;
        this.password = password;
        this.ug_per = ug_per;
        this.high_school_per = high_school_per;
        this.intermidiate_per = intermidiate_per;
        this.pg_per = pg_per;
        this.passout_year = passout_year;
        this.mobile_no = mobile_no;
        this.email = email;
        this.course = course;
        this.dept = dept;
        this.roll_no = roll_no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getUg_per() {
        return ug_per;
    }

    public void setUg_per(int ug_per) {
        this.ug_per = ug_per;
    }

    public int getHigh_school_per() {
        return high_school_per;
    }

    public void setHigh_school_per(int high_school_per) {
        this.high_school_per = high_school_per;
    }

    public int getIntermidiate_per() {
        return intermidiate_per;
    }

    public void setIntermidiate_per(int intermidiate_per) {
        this.intermidiate_per = intermidiate_per;
    }

    public int getPg_per() {
        return pg_per;
    }

    public void setPg_per(int pg_per) {
        this.pg_per = pg_per;
    }

    public int getPassout_year() {
        return passout_year;
    }

    public void setPassout_year(int passout_year) {
        this.passout_year = passout_year;
    }

    public String getMobile_no() {
        return mobile_no;
    }

    public void setMobile_no(String mobile_no) {
        this.mobile_no = mobile_no;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getRoll_no() {
        return roll_no;
    }

    public void setRoll_no(String roll_no) {
        this.roll_no = roll_no;
    }

}
