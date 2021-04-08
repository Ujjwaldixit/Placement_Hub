/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amrph.dao;

import com.amrph.entities.webinar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class getWebinarDao {

    Connection con = null;

    public getWebinarDao(Connection con) {
        this.con = con;
    }

    public void saveWebinar(String agenda, String desc, String timings, String date, String link) {
        String query = "insert into webinar(agenda, description, timings, date, link) values(?,?,?,?,?) ";
        try {
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, agenda);
            ps.setString(2, desc);
            ps.setString(3, timings);
            ps.setString(4, date);
            ps.setString(5, link);
            ps.executeUpdate();
        } catch (Exception e) {
            e.getMessage();
        }
    }

    public ArrayList<webinar> getWebinar() {
        ArrayList<webinar> webinarList = new ArrayList<>();
        try {
            String query = "select * from webinar";
            PreparedStatement ps = this.con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String agenda = rs.getString("agenda");
                String time = rs.getString("timings");
                String link = rs.getString("link");
                String desc = rs.getString("description");
                String date = rs.getString("date");
                int sno = rs.getInt("sno");
                webinar webinar = new webinar(agenda, desc, time, date, link, sno);
                webinarList.add(webinar);

            }
        } catch (Exception e) {
            e.getMessage();
        }
        return webinarList;
    }

    public void DeleteWebinar(int sno) {
        try {
            String query = "delete from webinar where sno=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, sno);
            ps.executeUpdate();

        } catch (Exception e) {
            e.getMessage();
        }
    }
    public String totalsWebinarCount() {
        String Countrow = "";
        String query = "SELECT COUNT(*) FROM webinar";
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
