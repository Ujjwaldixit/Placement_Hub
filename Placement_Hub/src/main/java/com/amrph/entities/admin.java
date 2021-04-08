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
public class admin {
    public admin()
    {
        
    }
    
    public admin(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
       
    }
    private String name;
    private String email;
    private String password;
    private int userId;

    public admin(String name, String email, String password, int userId, String profile_pic) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.userId = userId;
        this.profile_pic = profile_pic;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getProfile_pic() {
        return profile_pic;
    }

    public void setProfile_pic(String profile_pic) {
        this.profile_pic = profile_pic;
    }
    private String profile_pic;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
