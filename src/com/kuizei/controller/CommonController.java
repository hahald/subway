package com.kuizei.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@Scope("prototype")
public class CommonController {

    @RequestMapping("/open")
    public String openJsp(String page){
        if(page==null||"".equals(page))
            return "login2";
        else
            return page;

    }

    @RequestMapping("/center")
    public String go(){
        return "main";
    }
}
