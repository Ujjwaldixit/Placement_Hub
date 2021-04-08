/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amrph.dao;

import com.amrph.entities.admin;
import com.amrph.entities.student;
import java.sql.*;
import java.sql.PreparedStatement;

/**
 *
 * @author ASUS
 */
public class StudentDao {

    private Connection con;

    public StudentDao(Connection con) {
        this.con = con;
    }

    public boolean saveuser(student student) {
        boolean check = false;
        try {
            String query = "insert into student(name,password,ug_per,high_school_per,intermidiate_per,mobile_no,email,passout_year,course,department,pg_per,roll_no) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, student.getName());
            ps.setString(2, student.getPassword());
            ps.setInt(3, student.getUg_per());
            ps.setInt(4, student.getHigh_school_per());
            ps.setInt(5, student.getIntermidiate_per());
            ps.setString(6, student.getMobile_no());
            ps.setString(7, student.getEmail());
            ps.setInt(8, student.getPassout_year());
            ps.setString(9, student.getCourse());
            ps.setString(10, student.getDept());
            ps.setInt(11, student.getPg_per());
            ps.setString(12, student.getRoll_no());
            ps.executeUpdate();
            return true; // if check is true data has been updated in database
        } catch (Exception e) {
            e.getMessage();
        }
        return check;
    }

    public student getNameAndPassword(String username, String password) {
        student student = null;
        try {
            String query = "select * from student where name=? and password=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                student = new student();
                student.setName(rs.getString("name"));
                student.setPassword(rs.getString("password"));
                student.setUg_per(rs.getInt("ug_per"));
                student.setMobile_no(rs.getString("mobile_no"));
                student.setEmail(rs.getString("email"));
                student.setPassout_year(rs.getInt("passout_year"));
                student.setCourse(rs.getString("course"));
                student.setDept(rs.getString("department"));
                student.setPg_per(rs.getInt("pg_per"));
                student.setRoll_no(rs.getString("roll_no"));
                student.setHigh_school_per(rs.getInt("high_school_per"));
                student.setIntermidiate_per(rs.getInt("intermidiate_per"));
                student.setProfile_pic(rs.getString("profile_pic"));
            }

        } catch (Exception e) {
            e.getMessage();
        }
        return student;
    }

    public student getAllData(int sno) {
        student student = null;
        try {
            String query = "select * from student where sno=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, sno);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                student = new student();
                student.setName(rs.getString("name"));
                student.setPassword(rs.getString("password"));
                student.setUg_per(rs.getInt("ug_per"));
                student.setMobile_no(rs.getString("mobile_no"));
                student.setEmail(rs.getString("email"));
                student.setPassout_year(rs.getInt("passout_year"));
                student.setCourse(rs.getString("course"));
                student.setDept(rs.getString("department"));
                student.setPg_per(rs.getInt("pg_per"));
                student.setRoll_no(rs.getString("roll_no"));
                student.setHigh_school_per(rs.getInt("high_school_per"));
                student.setIntermidiate_per(rs.getInt("intermidiate_per"));
                student.setProfile_pic(rs.getString("profile_pic"));
            }

        } catch (Exception e) {
            e.getMessage();
        }
        return student;
    }

    public boolean changePassword(String password, String email) {
        boolean check = false;
        try {
            String query = "update student set password=? where email=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, password);
            ps.setString(2, email);
            ps.executeUpdate();
            check = true;

        } catch (Exception e) {
            e.getMessage();
        }
        return check;
    }

    public String totalStudentsCount() {
        String Countrow = "";
        String query = "SELECT COUNT(*) FROM student";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Countrow = rs.getString(1);

            }

        } catch (Exception e) {
            e.getMessage();
        }
        return Countrow;
    }

    public String totalPlacedStudentsCount() {
        String Countrow = "";
        String query = "SELECT COUNT(DISTINCT student_name) FROM shortlisted";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Countrow = rs.getString(1);

            }

        } catch (Exception e) {
            e.getMessage();
        }
        return Countrow;
    }

    public student getAllUniqueData(int sno) {
        student student = null;
        try {
            String query = "select distinct * from student where sno=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, sno);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                student = new student();
                student.setName(rs.getString("name"));
                student.setPassword(rs.getString("password"));
                student.setUg_per(rs.getInt("ug_per"));
                student.setMobile_no(rs.getString("mobile_no"));
                student.setEmail(rs.getString("email"));
                student.setPassout_year(rs.getInt("passout_year"));
                student.setCourse(rs.getString("course"));
                student.setDept(rs.getString("department"));
                student.setPg_per(rs.getInt("pg_per"));
                student.setRoll_no(rs.getString("roll_no"));
                student.setHigh_school_per(rs.getInt("high_school_per"));
                student.setIntermidiate_per(rs.getInt("intermidiate_per"));
                student.setProfile_pic(rs.getString("profile_pic"));
            }

        } catch (Exception e) {
            e.getMessage();
        }
        return student;
    }

    public boolean updateUser(student student) {
        boolean check = false;
        try {
            String query = "update student set name=?,ug_per=?,high_school_per=?,intermidiate_per=?,mobile_no=?,email=?,passout_year=?,course=?,department=?,pg_per=?,profile_pic=? where roll_no=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, student.getName());
            
            ps.setInt(2, student.getUg_per());
            ps.setInt(3, student.getHigh_school_per());
            ps.setInt(4, student.getIntermidiate_per());
            ps.setString(5, student.getMobile_no());
            ps.setString(6, student.getEmail());
            ps.setInt(7, student.getPassout_year());
            ps.setString(8, student.getCourse());
            ps.setString(9, student.getDept());
            ps.setInt(10, student.getPg_per());
            ps.setString(11, student.getProfile_pic());
            ps.setString(12, student.getRoll_no());
          
            ps.executeUpdate();
            return true; // if check is true data has been updated in database
        } catch (Exception e) {
            e.getMessage();
        }
        return check;

    }
}
