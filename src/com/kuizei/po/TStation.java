package com.kuizei.po;

import java.util.Objects;

public class TStation {
    private String stationId;
    private String stationName;
    private String status;

    public String getStationId() {
        return stationId;
    }

    public void setStationId(String stationId) {
        this.stationId = stationId;
    }

    public String getStationName() {
        return stationName;
    }

    public void setStationName(String stationName) {
        this.stationName = stationName;
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
        TStation tStation = (TStation) o;
        return Objects.equals(stationId, tStation.stationId) &&
                Objects.equals(stationName, tStation.stationName) &&
                Objects.equals(status, tStation.status);
    }

    @Override
    public int hashCode() {

        return Objects.hash(stationId, stationName, status);
    }
}
