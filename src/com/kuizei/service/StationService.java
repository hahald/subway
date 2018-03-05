package com.kuizei.service;

import com.kuizei.dao.StationDAO;
import com.kuizei.po.TStation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service("stationService")
@Transactional
public class StationService {

    @Autowired
    private StationDAO stationDAO;

    public List<TStation> getStationByRoute(String route){
        return stationDAO.getStationByRoute(route);
    }

}
