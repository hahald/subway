package com.kuizei.dao;

import com.kuizei.po.TRoute;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("routeDAO")
public class RouteDAO extends BaseDAO{

    /*查询线路*/
    public List<TRoute> getAllRoute(){

        String hql="from TRoute";
        return this.getSession().createQuery(hql).list();
    }

}
