/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 * a class have information of slot of customer
 * @author LENOVO
 */
public class Slot {
    private int slot_id;
    private Date startime;
    private Date endtime;

    public Slot() {
    }
    
    /**
     * constructor of slot 
     * @param slot_id of slot 
     * @param startime of slot 
     * @param endtime of slot
     */
    public Slot(int slot_id, Date startime, Date endtime) {
        this.slot_id = slot_id;
        this.startime = startime;
        this.endtime = endtime;
    }

    public int getSlot_id() {
        return slot_id;
    }

    public void setSlot_id(int slot_id) {
        this.slot_id = slot_id;
    }

    public Date getStartime() {
        return startime;
    }

    public void setStartime(Date startime) {
        this.startime = startime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }
    
    
}
