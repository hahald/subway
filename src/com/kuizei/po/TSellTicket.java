package com.kuizei.po;

import java.sql.Timestamp;
import java.util.Objects;

public class TSellTicket {
    private int id;
    private String startStation;
    private String endStation;
    private Integer unitPrice;
    private Integer num;
    private Integer total;
    private Timestamp endTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStartStation() {
        return startStation;
    }

    public void setStartStation(String startStation) {
        this.startStation = startStation;
    }

    public String getEndStation() {
        return endStation;
    }

    public void setEndStation(String endStation) {
        this.endStation = endStation;
    }

    public Integer getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Integer unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TSellTicket that = (TSellTicket) o;
        return id == that.id &&
                Objects.equals(startStation, that.startStation) &&
                Objects.equals(endStation, that.endStation) &&
                Objects.equals(unitPrice, that.unitPrice) &&
                Objects.equals(num, that.num) &&
                Objects.equals(total, that.total) &&
                Objects.equals(endTime, that.endTime);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, startStation, endStation, unitPrice, num, total, endTime);
    }
}
