package com.kuizei.dao;

import com.kuizei.po.TSellTicket;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("sellTicketDAO")
public class SellTicketDAO extends BaseDAO{

    /*保存售票信息*/
    public void saveTicket(TSellTicket sellTicket){
        saveOrUpdate(sellTicket);
    }

    /*获取购票信息*/
    public TSellTicket getTicket(String uuid){
        String hql = "from TSellTicket where ticketid = :uuid";
        List<TSellTicket> ticketList = this.getSession().createQuery(hql).setParameter("uuid",uuid).list();
        if (ticketList.size() > 0){
            return ticketList.get(0);
        }else{
            return null;
        }
    }

}
