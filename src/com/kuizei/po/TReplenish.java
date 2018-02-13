package com.kuizei.po;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Objects;

public class TReplenish {
    private int id;
    private String cardId;
    private BigDecimal money;
    private Timestamp optTime;
    private String optType;
    private String optLocation;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Timestamp getOptTime() {
        return optTime;
    }

    public void setOptTime(Timestamp optTime) {
        this.optTime = optTime;
    }

    public String getOptType() {
        return optType;
    }

    public void setOptType(String optType) {
        this.optType = optType;
    }

    public String getOptLocation() {
        return optLocation;
    }

    public void setOptLocation(String optLocation) {
        this.optLocation = optLocation;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TReplenish that = (TReplenish) o;
        return id == that.id &&
                Objects.equals(cardId, that.cardId) &&
                Objects.equals(money, that.money) &&
                Objects.equals(optTime, that.optTime) &&
                Objects.equals(optType, that.optType) &&
                Objects.equals(optLocation, that.optLocation);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, cardId, money, optTime, optType, optLocation);
    }
}
