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
public class webinar {

    private String agenda;
    private String description;
    private String time;
    private String date;
    private String link;
    private int sno;

    public webinar(String agenda, String desc, String time, String date, String link, int sno) {
        this.agenda = agenda;
        this.description=desc;
        this.time = time;
        this.date = date;
        this.link = link;
        this.sno=sno;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getAgenda() {
        return agenda;
    }

    public void setAgenda(String agenda) {
        this.agenda = agenda;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

}
