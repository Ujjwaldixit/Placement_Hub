/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.entities;
import java.sql.*;
/**
 *
 * @author ASUS
 */
public class entity {
    private int id;
    private String name ;
    private String password;
    private Timestamp time;
    private String email;

    public String getProfile_pic() {
        return profile_pic;
    }

    public void setProfile_pic(String profile_pic) {
        this.profile_pic = profile_pic;
    }
    private String profile_pic;
    
    public entity(int id, String name, String password, Timestamp time, String email) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.time = time;
        this.email = email;
    }

    public entity(String name, String password, String email) {
        this.name = name;
        this.password = password;
        this.email = email;
    }
    public entity()
    {
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    
}
