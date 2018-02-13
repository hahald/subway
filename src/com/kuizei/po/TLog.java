package com.kuizei.po;

import java.sql.Timestamp;
import java.util.Objects;

public class TLog {
    private int id;
    private String uid;
    private Timestamp optTime;
    private String optLocation;
    private String optId;
    private String optType;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public Timestamp getOptTime() {
        return optTime;
    }

    public void setOptTime(Timestamp optTime) {
        this.optTime = optTime;
    }

    public String getOptLocation() {
        return optLocation;
    }

    public void setOptLocation(String optLocation) {
        this.optLocation = optLocation;
    }

    public String getOptId() {
        return optId;
    }

    public void setOptId(String optId) {
        this.optId = optId;
    }

    public String getOptType() {
        return optType;
    }

    public void setOptType(String optType) {
        this.optType = optType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TLog tLog = (TLog) o;
        return id == tLog.id &&
                Objects.equals(uid, tLog.uid) &&
                Objects.equals(optTime, tLog.optTime) &&
                Objects.equals(optLocation, tLog.optLocation) &&
                Objects.equals(optId, tLog.optId) &&
                Objects.equals(optType, tLog.optType);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, uid, optTime, optLocation, optId, optType);
    }
}
