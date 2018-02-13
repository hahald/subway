package com.kuizei.po;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Objects;

public class TCard {
    private int id;
    private String cardId;
    private String identity;
    private String tel;
    private String cname;
    private Timestamp initTime;
    private BigDecimal deposit;
    private BigDecimal stored;
    private String status;

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

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Timestamp getInitTime() {
        return initTime;
    }

    public void setInitTime(Timestamp initTime) {
        this.initTime = initTime;
    }

    public BigDecimal getDeposit() {
        return deposit;
    }

    public void setDeposit(BigDecimal deposit) {
        this.deposit = deposit;
    }

    public BigDecimal getStored() {
        return stored;
    }

    public void setStored(BigDecimal stored) {
        this.stored = stored;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TCard tCard = (TCard) o;
        return id == tCard.id &&
                Objects.equals(cardId, tCard.cardId) &&
                Objects.equals(identity, tCard.identity) &&
                Objects.equals(tel, tCard.tel) &&
                Objects.equals(cname, tCard.cname) &&
                Objects.equals(initTime, tCard.initTime) &&
                Objects.equals(deposit, tCard.deposit) &&
                Objects.equals(stored, tCard.stored) &&
                Objects.equals(status, tCard.status);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, cardId, identity, tel, cname, initTime, deposit, stored, status);
    }
}
