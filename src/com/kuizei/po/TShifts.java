package com.kuizei.po;

import java.sql.Timestamp;
import java.util.Objects;

public class TShifts {
    private String uid;
    private Timestamp date;
    private String number;
    private int id;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TShifts tShifts = (TShifts) o;
        return id == tShifts.id &&
                Objects.equals(uid, tShifts.uid) &&
                Objects.equals(date, tShifts.date) &&
                Objects.equals(number, tShifts.number);
    }

    @Override
    public int hashCode() {

        return Objects.hash(uid, date, number, id);
    }
}
