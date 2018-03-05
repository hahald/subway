package com.kuizei.dao;

import com.kuizei.po.TLog;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("logDAO")
public class LogDAO extends BaseDAO{

    public void saveLog(TLog log){
        saveOrUpdate(log);
    }

    /*分页获取日志*/
    public List<TLog> getLogs(Integer limit,Integer page){
        String hql = "from TLog ";
        return this.getSession().createQuery(hql).setFirstResult(limit*(page - 1)).setMaxResults(limit).list();
    }

    /*获取总数*/
    public int getCount(){
        String hql = "from TLog ";
        return this.getSession().createQuery(hql).list().size();
    }
}
