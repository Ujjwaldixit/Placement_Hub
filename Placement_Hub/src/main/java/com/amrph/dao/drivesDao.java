/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amrph.dao;

import com.amrph.entities.drives;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class drivesDao {

    Connection con = null;

    public drivesDao(Connection con) {
        this.con = con;
    }

    public ArrayList<drives> getDrives() {
        ArrayList<drives> allDrives = new ArrayList<>();
        String query = "select * from company order by postDate desc";
        try {
            PreparedStatement ps = this.con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String companyName = rs.getString("companyName");
                String jobDesc = rs.getString("jobDescription");
                Timestamp dateOfExp = rs.getTimestamp("dateOfExpiry");
                String pic = rs.getString("photos");
                int job_no = rs.getInt("job_no");
                String logo = rs.getString("logo");
                drives drives = new drives(companyName, jobDesc, dateOfExp, pic, job_no, logo);
                allDrives.add(drives);
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return allDrives;
    }

    public void deleteDrive(String company_name) {
        String query = "delete from company where companyName=?";

        try {
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, company_name);
            ps.executeUpdate();

        } catch (Exception e) {
            e.getMessage();
        }
    }

    //to get one drive details
    public ArrayList<drives> getDrive(int jobno) {
        ArrayList<drives> allDrives = new ArrayList<>();
        String query = "select * from company where job_no=?";
        try {
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, jobno);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String companyName = rs.getString("companyName");
                String jobDesc = rs.getString("jobDescription");
                Timestamp dateOfExp = rs.getTimestamp("dateOfExpiry");
                String pic = rs.getString("photos");
                int job_no = rs.getInt("job_no");
                String logo = rs.getString("logo");
                drives drives = new drives(companyName, jobDesc, dateOfExp, pic, job_no, logo);
                allDrives.add(drives);
            }
            
        } catch (Exception e) {
            e.getMessage();
        }
        return allDrives;
    }
    
    public String totalDrivesCount() {
        String Countrow = "";
        String query = "SELECT COUNT(*) FROM company";
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
}
