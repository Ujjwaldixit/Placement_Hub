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
public class shortlistedStudent {

    public shortlistedStudent() 
    {
        
    }
    private int sno;
    private String companyName;
    private int passsout_year;

    public shortlistedStudent(int sno, String companyName, int passsout_year) {
        this.sno = sno;
        this.companyName = companyName;
        this.passsout_year = passsout_year;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public int getPasssout_year() {
        return passsout_year;
    }

    public void setPasssout_year(int passsout_year) {
        this.passsout_year = passsout_year;
    }

}
