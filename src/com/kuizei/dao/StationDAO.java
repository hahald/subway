package com.kuizei.dao;

import com.kuizei.po.TStation;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("stationDAO")
public class StationDAO extends BaseDAO{

    /*根据线路获取车站*/
    public List<TStation> getStationByRoute(String route){
        String hql = "from TStation where left(stationId,1) = :route";
        return this.getSession().createQuery(hql).setParameter("route",route).list();
    }

}
