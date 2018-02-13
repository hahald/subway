package com.kuizei.po;

import java.util.Objects;

public class TRoute {
    private String routeId;
    private String routeName;
    private String status;

    public String getRouteId() {
        return routeId;
    }

    public void setRouteId(String routeId) {
        this.routeId = routeId;
    }

    public String getRouteName() {
        return routeName;
    }

    public void setRouteName(String routeName) {
        this.routeName = routeName;
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
        TRoute tRoute = (TRoute) o;
        return Objects.equals(routeId, tRoute.routeId) &&
                Objects.equals(routeName, tRoute.routeName) &&
                Objects.equals(status, tRoute.status);
    }

    @Override
    public int hashCode() {

        return Objects.hash(routeId, routeName, status);
    }
}
