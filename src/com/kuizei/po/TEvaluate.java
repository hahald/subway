package com.kuizei.po;

import java.sql.Timestamp;
import java.util.Objects;

public class TEvaluate {
    private String uid;
    private String evaluation;
    private Integer star;
    private Timestamp optTime;
    private int id;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(String evaluation) {
        this.evaluation = evaluation;
    }

    public Integer getStar() {
        return star;
    }

    public void setStar(Integer star) {
        this.star = star;
    }

    public Timestamp getOptTime() {
        return optTime;
    }

    public void setOptTime(Timestamp optTime) {
        this.optTime = optTime;
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
        TEvaluate tEvaluate = (TEvaluate) o;
        return id == tEvaluate.id &&
                Objects.equals(uid, tEvaluate.uid) &&
                Objects.equals(evaluation, tEvaluate.evaluation) &&
                Objects.equals(star, tEvaluate.star) &&
                Objects.equals(optTime, tEvaluate.optTime);
    }

    @Override
    public int hashCode() {

        return Objects.hash(uid, evaluation, star, optTime, id);
    }
}
