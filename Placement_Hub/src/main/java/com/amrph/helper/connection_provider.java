/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amrph.helper;

import java.sql.*;


/**
 *
 * @author ASUS
 */
public class connection_provider {
    private static Connection con;

    public static Connection getconnection() {
        try {
            if (con == null) {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amrph", "root", "root");
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return con;
    }

}
