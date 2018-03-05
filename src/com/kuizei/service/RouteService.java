package com.kuizei.service;

import com.kuizei.dao.RouteDAO;
import com.kuizei.po.TRoute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service("routeService")
@Transactional
public class RouteService {

    @Autowired
    private RouteDAO routeDAO;

    public List<TRoute> getAllRoute(){
        return routeDAO.getAllRoute();
    }

}
