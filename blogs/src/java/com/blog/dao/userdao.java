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
import com.blog.entities.entity;
import java.sql.*;

public class userdao {

    private Connection con;

    public userdao(Connection con) {
        this.con = con;  
    }

    public boolean saveuser(entity entity) {
        boolean b = false;
        try {
            String query = "insert into user(name,password,email) values (?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, entity.getName());
            ps.setString(2, entity.getPassword());
            ps.setString(3, entity.getEmail());

            ps.executeUpdate();
            b = true;
        } catch (Exception e) {
            e.getMessage();
        }
        return b;
    }

    public entity getUserByEmailAndPassword(String email, String password) {
        entity user = null;
        try {
            String query = "select * from user where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new entity();

                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setId(rs.getInt("id"));
                user.setTime(rs.getTimestamp("time"));
                user.setPassword(rs.getString("password"));
                user.setProfile_pic(rs.getString("profile_pic"));
            }

        } catch (Exception e) {

        }
        return user;
    }

    public boolean updateuser(entity user) {
        boolean check = false;
        try {
            String query = "update user set name=?,email=?,password=?,profile_pic=? where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getProfile_pic());
            ps.setInt(5, user.getId());
            ps.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.getMessage();
        }
        return check;
    }

    public entity getUserByUserId(int id) {
        entity user=null;
         try {
            String query = "select * from user where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);
           
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                user = new entity();

                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setId(rs.getInt("id"));
                user.setTime(rs.getTimestamp("time"));
                user.setPassword(rs.getString("password"));
                user.setProfile_pic(rs.getString("profile_pic"));
            }

        } catch (Exception e) {

        }
        return user;
    }

}
