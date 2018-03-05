package com.kuizei.controller;

import com.kuizei.po.TEvaluate;
import com.kuizei.service.EvaluateService;
import com.kuizei.vo.UserInfoVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/wao")
public class EvaluateController {

    @Resource(name = "evaluateService")
    private EvaluateService evaluateService;

    @RequestMapping("/evalu")
    @ResponseBody
    public Map<String,Object> evaluateAdd(TEvaluate evaluate) throws Exception{

        return evaluateService.evaluateSave(evaluate);
    }

}
