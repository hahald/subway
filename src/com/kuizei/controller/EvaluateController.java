package com.kuizei.controller;

import com.kuizei.po.TEvaluate;
import com.kuizei.service.EvaluateService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/wao")
public class EvaluateController {

    @Resource(name = "evaluateService")
    private EvaluateService evaluateService;

    @RequestMapping("/evalu")
    public String evaluateAdd(TEvaluate evaluate){
        List<TEvaluate> evaluates = new ArrayList<TEvaluate>();
        evaluates.add(evaluate);
        try{
            evaluateService.evaluateSave(evaluates);
        }catch (Exception e){
            e.printStackTrace();
            return "err";
        }

        return "sucess";
    }

}
