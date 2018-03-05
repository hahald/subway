package com.kuizei.service;

import com.kuizei.dao.EvaluateDAO;
import com.kuizei.po.TEvaluate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@Service("evaluateService")
@Transactional
public class EvaluateService extends Exception{

    @Resource(name = "evaluateDAO")
    private EvaluateDAO eDAO;

    public Map<String,Object> evaluateSave(TEvaluate evaluate) throws Exception{

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("flag","yeah");
        evaluate.setOptTime(Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date())));
        List<TEvaluate> evaluates = new ArrayList<TEvaluate>();
        evaluates.add(evaluate);
        eDAO.saveEvaluate(evaluates);

        return map;
    }
}
