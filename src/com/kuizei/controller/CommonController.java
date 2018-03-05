package com.kuizei.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@Scope("prototype")
public class CommonController {

    @RequestMapping("/open")
    public String openJsp(){
        return "login2";
    }

    @RequestMapping("/opt")
    public String openJsp(String page){
        return page;
    }

    @RequestMapping("/center")
    public String go(){
        return "main";
    }
}
