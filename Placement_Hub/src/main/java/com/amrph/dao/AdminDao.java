/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amrph.dao;

import com.amrph.entities.admin;
import com.amrph.entities.shortlistedStudent;
import com.amrph.entities.student;
import com.amrph.helper.connection_provider;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class AdminDao {

    private Connection con;

    public AdminDao(Connection con) {
        this.con = con;
    }

    public boolean save(admin admin) {
        boolean check = false;
        try {
            String query = "Insert into admin(username,email,password) values(?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, admin.getName());
            ps.setString(2, admin.getEmail());
            ps.setString(3, admin.getPassword());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.getMessage();
        }
        return check;
    }

    public admin getNameAndPassword(String username, String password) {
        admin Admin = null;
        try {
            String query = "select * from admin where username=? and password=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Admin = new admin();
                //to put values from rs to admin object
                Admin.setEmail(rs.getString("email"));
                Admin.setName(rs.getString("username"));
                Admin.setPassword(rs.getString("password"));
                Admin.setProfile_pic(rs.getString("profile_pic"));
                Admin.setUserId(rs.getInt("userId"));
            }

        } catch (Exception e) {
            e.getMessage();
        }
        return Admin;
    }

    public boolean addDrives(String jobdesc, Date dateExp, String companyName,String logo,String comp_image) {
        boolean check = false;
        try {
            String query = "insert into company(jobDescription,dateOfExpiry,companyName,photos,logo) values(?,?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, jobdesc);
            ps.setDate(2, dateExp);
            ps.setString(3, companyName);
            ps.setString(4, comp_image);
            ps.setString(5, logo);
            ps.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.getMessage();
        }
        return check;
    }

    public String getStudentsMailId(String branchesEligible[], int ug_per_required, int pg_per_required, int high_school_per_required, int intermidiate_per_required, String companyName) {

        //to save eligible students
        String mailId = new String();
        try {
            for (int i = 0; i < branchesEligible.length; i++) {
                String query = "select * from student where department=? and ug_per>=? and pg_per>=? and high_school_per>=? and intermidiate_per>=?";
                PreparedStatement ps = this.con.prepareStatement(query);
                ps.setString(1, branchesEligible[i]);
                ps.setInt(2, ug_per_required);
                ps.setInt(3, pg_per_required);
                ps.setInt(4, high_school_per_required);
                ps.setInt(5, intermidiate_per_required);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    mailId += rs.getString("email") + ",";

                    // to save eligible students in table
                    selectedStudents(rs.getInt("sno"), companyName, rs.getInt("passout_year"), rs.getString("email"));
                }
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return mailId;
    }

    public boolean changePassword(String password, String email) {
        boolean check = false;
        try {
            String query = "update admin set password=? where email=?";
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

    public boolean updateProfile(admin admin) {
        boolean check = false;
        String query = "update admin set email=? ,username=? ,profile_pic=? where userId=?";
        try {
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, admin.getEmail());
            ps.setString(2, admin.getName());
            ps.setString(3, admin.getProfile_pic());
            ps.setInt(4, admin.getUserId());
            ps.executeUpdate();

            check = true;
        } catch (Exception e) {
            e.getMessage();
        }
        return check;
    }

    public boolean selectedStudents(int sno, String companyName, int passoutYear, String email) {
        boolean check = false;
        try {
            String query = "Insert into placed(sno,company_name,passout_year,email) values(?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, sno);
            ps.setString(2, companyName);
            ps.setInt(3, passoutYear);
            ps.setString(4, email);

            check = true;
            ps.executeUpdate();
        } catch (Exception e) {
            e.getMessage();
        }
        return check;
    }

    public ResultSet getShortListedStudent() {
        ResultSet rs = null;
        String query = "SELECT placed.*, student.* FROM placed LEFT JOIN student ON placed.sno=student.sno";
        try {
            PreparedStatement ps = this.con.prepareStatement(query);
            rs = ps.executeQuery();

        } catch (Exception e) {
            e.getMessage();
        }
        return rs;
    }

    public String getAllCompany() {
        String companyName = new String();
        String query = "SELECT DISTINCT company_name FROM placed";
        try {
            PreparedStatement ps = this.con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                companyName += rs.getString("company_name") + ",";
            }

        } catch (Exception e) {
            e.getMessage();
        }
        return companyName;
    }

    public boolean DeleteShortListed(String email, String company_name) {
        boolean check = false;
        String emailId[] = email.split(",");
        String query = "delete from placed where company_name =? and email not in (";

        //  String query = "select empid, name from Employee where empid in (";
        int length = emailId.length;
        // dynamically creeting parameters measn '?' for 'In' clause 
        StringBuilder queryBuilder = new StringBuilder(query);
        for (int i = 0; i < length; i++) {
            queryBuilder.append(" ?");
            if (i != length - 1) {
                queryBuilder.append(",");
            }
        }
        queryBuilder.append(")");
        query = queryBuilder.toString();
        try {
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, company_name);
            for (int i = 2; i < emailId.length + 2; i++) {
                ps.setString(i, emailId[i - 2]);
            }
            ps.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.getMessage();
        }
        return check;
    }

    public void Selected(String email, String company_name) {
        String emailId[] = email.split(",");
        String query = "select * from student where email=?";
        String query1 = "Insert into shortlisted(company_name,passout_year,student_name,dept,sno) values(?,?,?,?,?)";
        try {
            for (String emailId1 : emailId) {
                PreparedStatement ps = this.con.prepareStatement(query);
                ps.setString(1, emailId1);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    PreparedStatement ps1 = con.prepareStatement(query1);
                    ps1.setString(1, company_name);
                    ps1.setString(2, rs.getString("passout_year"));
                    ps1.setString(3, rs.getString("name"));
                    ps1.setString(4, rs.getString("department"));
                    ps1.setInt(5, rs.getInt("sno"));
                    ps1.executeUpdate();
                }
            }
            //to delete drive after student have been selected
            deleteCompanyDrive(company_name);
        } catch (Exception e) {
            e.getMessage();
        }
    }

    public void deleteCompanyDrive(String company_name) {
        String query = "delete from placed where company_name=?";
        try {
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, company_name);
            ps.executeUpdate();
        } catch (Exception e) {
            e.getMessage();

        }
    }

    public ResultSet getPlacedStudent() {
        ResultSet rs = null;
        String query = "SELECT * from shortlisted";
        try {
            PreparedStatement ps = this.con.prepareStatement(query);
            rs = ps.executeQuery();

        } catch (Exception e) {
            e.getMessage();
        }
        return rs;
    }

    public String getAllCompanyfromPlaced() {
        String companyName = new String();
        String query = "SELECT DISTINCT company_name FROM shortlisted";
        try {
            PreparedStatement ps = this.con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                companyName += rs.getString("company_name") + ",";
            }

        } catch (Exception e) {
            e.getMessage();
        }
        return companyName;
    }
  public ResultSet getPlacedStudentByDept(String dept) {
        ResultSet rs = null;
        String query = "SELECT * from shortlisted where dept=?";
        try {
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, dept);
            rs = ps.executeQuery();

        } catch (Exception e) {
            e.getMessage();
        }
        return rs;
    }
   
}
