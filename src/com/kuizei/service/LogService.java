package com.kuizei.service;

import com.kuizei.dao.LogDAO;
import com.kuizei.po.TLog;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;

@Service("logService")
@Transactional
public class LogService {

    @Resource(name = "logDAO")
    private LogDAO logDAO;

    public void addLog(TLog log){
        logDAO.saveLog(log);
    }
}
