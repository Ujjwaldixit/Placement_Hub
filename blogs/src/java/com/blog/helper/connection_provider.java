/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.helper;

/**
 *
 * @author ASUS
 */
import java.sql.*;
 
public class connection_provider {

    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null) 
            {
                 Class.forName("com.mysql.jdbc.Driver");
                con =DriverManager.getConnection("jdbc:mysql://localhost:3306/blog", "root", "root");  }
        } 
        catch (Exception e) 
        {
            e.getMessage();
        }
        return con;
    }

}
