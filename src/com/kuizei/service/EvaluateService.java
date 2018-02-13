package com.kuizei.service;

import com.kuizei.dao.EvaluateDAO;
import com.kuizei.po.TEvaluate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("evaluateService")
@Transactional
public class EvaluateService extends Exception{

    @Resource(name = "evaluateDAO")
    private EvaluateDAO eDAO;

    public String evaluateSave(List<TEvaluate> evaluates) throws InvocationTargetException{

        eDAO.saveEvaluate(evaluates);

        return "yeah";
    }
}
