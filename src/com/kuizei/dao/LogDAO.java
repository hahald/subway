package com.kuizei.dao;

import com.kuizei.po.TLog;
import org.springframework.stereotype.Component;

@Component("logDAO")
public class LogDAO extends BaseDAO{

    public void saveLog(TLog log){
        saveOrUpdate(log);
    }



}
