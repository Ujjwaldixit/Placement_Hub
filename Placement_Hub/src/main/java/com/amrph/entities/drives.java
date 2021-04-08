/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amrph.entities;

import java.sql.Timestamp;

/**
 *
 * @author ASUS
 */
public class drives {

    private String companyName;
    private String jobDesc;
    private Timestamp dateOfExp;
    private String pic;
    private int job_no;
    private String logo;

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public drives(String companyName, String jobDesc, Timestamp dateOfExp, String pic, int job_no, String logo) {
        this.companyName = companyName;
        this.jobDesc = jobDesc;
        this.dateOfExp = dateOfExp;
        this.pic = pic;
        this.job_no = job_no;
        this.logo = logo;
    }

    public drives(String companyName, String jobDesc, Timestamp dateOfExp, String pic, int job_no) {
        this.companyName = companyName;
        this.jobDesc = jobDesc;
        this.dateOfExp = dateOfExp;
        this.pic = pic;
        this.job_no = job_no;
    }

    public int getJob_no() {
        return job_no;
    }

    public void setJob_no(int job_no) {
        this.job_no = job_no;
    }

    public drives(String companyName, String jobDesc, Timestamp dateOfExp, String pic) {
        this.companyName = companyName;
        this.jobDesc = jobDesc;
        this.dateOfExp = dateOfExp;
        this.pic = pic;
    }

    public drives(String companyName, String jobDesc, Timestamp dateOfExp) {
        this.companyName = companyName;
        this.jobDesc = jobDesc;
        this.dateOfExp = dateOfExp;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getJobDesc() {
        return jobDesc;
    }

    public void setJobDesc(String jobDesc) {
        this.jobDesc = jobDesc;
    }

    public Timestamp getDateOfExp() {
        return dateOfExp;
    }

    public void setDateOfExp(Timestamp dateOfExp) {
        this.dateOfExp = dateOfExp;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

}
