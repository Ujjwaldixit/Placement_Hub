/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.dao;

/**
 *
 * @author ASUS
 */
import java.sql.*;

import com.blog.entities.category;
import com.blog.entities.post;
import java.util.ArrayList;

public class getcategorydao {

    Connection con = null;

    public getcategorydao(Connection con) {
        this.con = con;
    }

    public ArrayList<category> getallcategory() {
        ArrayList<category> catlist = new ArrayList<>();
        try {
            String q = "select * from categories";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(q);
            while (rs.next()) {
                int cid = rs.getInt("cid");
                String name = rs.getString("cname");
                String des = rs.getString("cdescription");
                category cat = new category(cid, name, des);
                catlist.add(cat);
            }
        } catch (Exception e) {
            e.getMessage();
        }

        return catlist;
    }

    public boolean savepost(post p) {
        boolean b = false;
        try {
            String query = "insert into post(ptitle,pcontent,ppic,cid,userid) values(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, p.getPtitle());
            ps.setString(2, p.getPcontent());
            ps.setString(3, p.getPpic());
            ps.setInt(4, p.getCid());
            ps.setInt(5, p.getUserid());
            ps.executeUpdate();
            b = true;
        } catch (Exception e) {

        }

        return b;
    }

    public ArrayList<post> getallposts() {
        ArrayList<post> list = new ArrayList<>();
        try {
            String query = "select * from post order by pdate desc";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("pid");
                String ptitle = rs.getString("ptitle");
                String pcontent = rs.getString("pcontent");
                String ppic = rs.getString("ppic");
                Timestamp date = rs.getTimestamp("pdate");
                int cid = rs.getInt("cid");
                int userid = rs.getInt("userid");
                post p = new post(pid, ptitle, pcontent, ppic, date, cid, userid);
                list.add(p);
            }
        } catch (Exception e) {
            e.getMessage();
        }

        return list;

    }

    public ArrayList<post> getpostbycatid(int cid) {
        ArrayList<post> list = new ArrayList<>();
        try {
            String query = "select * from post where cid=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("pid");
                String ptitle = rs.getString("ptitle");
                String pcontent = rs.getString("pcontent");
                String ppic = rs.getString("ppic");
                Timestamp date = rs.getTimestamp("pdate");
               
                int userid = rs.getInt("userid");
                post p = new post(pid, ptitle, pcontent, ppic, date, cid, userid);
                list.add(p);
            }
        } catch (Exception e) {
            e.getMessage();
        }

        return list;
    }
}
