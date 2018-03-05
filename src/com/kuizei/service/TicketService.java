package com.kuizei.service;


import com.kuizei.dao.SellTicketDAO;
import com.kuizei.po.TSellTicket;
import org.springframework.stereotype.Service;
import com.kuizei.util.SystemUtil;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service("ticketService")
@Transactional
public class TicketService {

    @Resource(name = "sellTicketDAO")
    private SellTicketDAO sellTicketDAO;

    /*售票*/
    public Map<String,Object> sellTicket(TSellTicket sellTicket){

        Map<String,Object> map = new HashMap<String,Object>();
        sellTicket.setStatus("1");
        sellTicket.setEndTime(Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date())));
        sellTicket.setTicketId(SystemUtil.uuid());
        sellTicketDAO.saveTicket(sellTicket);

        map.put("flag","yeah");
        map.put("ticketid",sellTicket.getId());
        return map;

    }

    /*退票*/
    public Map<String,Object> meltTicket(String uuid){
        Map<String,Object> map = new HashMap<String,Object>();
        TSellTicket sellTicket = sellTicketDAO.getTicket(uuid);
        if (sellTicket == null){
            map.put("flag","err");
            map.put("message","票号不存在");
            return map;
        }

        if (!sellTicket.getStatus().equals("1")){
            map.put("flag","err");
            map.put("message","票已作废，不能退票");
            return map;
        }

        sellTicket.setStatus("0");
        sellTicketDAO.saveOrUpdate(sellTicket);

        map.put("flag","yeah");
        return map;

    }

    /*查票*/

    public TSellTicket getSellTicket(String uuid) {

        TSellTicket sellTicket = sellTicketDAO.getTicket(uuid);

        return sellTicket;
    }
}
